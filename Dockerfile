# Use NVIDIA CUDA base image
FROM nvidia/cuda:11.8.0-cudnn8-runtime-ubuntu22.04

ENV DEBIAN_FRONTEND=noninteractive \
    PIP_PREFER_BINARY=1 \
    PYTHONUNBUFFERED=1 \
    COMFYUI_VERSION=0.2.7

# Install Python and required system dependencies
RUN apt-get update && apt-get install -y \
    python3.10 \
    python3-pip \
    git \
    wget \
    libgl1 \
    && ln -sf /usr/bin/python3.10 /usr/bin/python \
    && ln -sf /usr/bin/pip3 /usr/bin/pip \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Install ComfyUI and its requirements
WORKDIR /comfyui
RUN git clone https://github.com/comfyanonymous/ComfyUI.git . \
    && git checkout ${COMFYUI_VERSION} \
    && pip install --no-cache-dir torch==2.1.0 torchvision torchaudio --extra-index-url https://download.pytorch.org/whl/cu118 \
    && pip install --no-cache-dir -r requirements.txt \
    && pip install --no-cache-dir runpod requests comfy-cli

# Create model directories
RUN mkdir -p \
    models/clip \
    models/unet \
    models/vae

# Download FLUX.1 dev model and required files
RUN wget -O models/unet/flux1-dev.safetensors https://huggingface.co/black-forest-labs/FLUX.1-dev/resolve/main/flux1-dev.safetensors \
    && wget -O models/clip/clip_l.safetensors https://huggingface.co/comfyanonymous/flux_text_encoders/resolve/main/clip_l.safetensors \
    && wget -O models/clip/t5xxl_fp8_e4m3fn.safetensors https://huggingface.co/comfyanonymous/flux_text_encoders/resolve/main/t5xxl_fp8_e4m3fn.safetensors \
    && wget -O models/vae/ae.safetensors https://huggingface.co/black-forest-labs/FLUX.1-dev/resolve/main/ae.safetensors


WORKDIR /
# Copy your custom handler and configuration files
ADD src/start.sh src/restore_snapshot.sh src/rp_handler.py test_input.json ./
RUN chmod +x /start.sh /restore_snapshot.sh
ADD *snapshot*.json /
RUN /restore_snapshot.sh

# Start the server
CMD ["/start.sh"]