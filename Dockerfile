# Base image only
FROM nvidia/cuda:11.8.0-cudnn8-runtime-ubuntu22.04

ENV DEBIAN_FRONTEND=noninteractive \
    PIP_PREFER_BINARY=1 \
    PYTHONUNBUFFERED=1 \
    CMAKE_BUILD_PARALLEL_LEVEL=8

RUN apt-get update && apt-get install -y \
    python3.10 python3-pip git wget libgl1 \
    && ln -sf /usr/bin/python3.10 /usr/bin/python \
    && ln -sf /usr/bin/pip3 /usr/bin/pip \
    && apt-get autoremove -y && apt-get clean -y \
    && rm -rf /var/lib/apt/lists/*

RUN pip install comfy-cli runpod requests && \
    /usr/bin/yes | comfy --workspace /comfyui install --cuda-version 11.8 --nvidia --version 0.2.7
RUN pip install --upgrade torch torchvision

# Add configuration and scripts
WORKDIR /
ADD src/extra_model_paths.yaml /comfyui/
ADD src/start.sh src/restore_snapshot.sh src/rp_handler.py test_input.json ./
RUN chmod +x /start.sh /restore_snapshot.sh

ADD *snapshot*.json /
RUN /restore_snapshot.sh

CMD ["/start.sh"]