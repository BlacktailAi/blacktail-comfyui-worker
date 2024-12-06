# Use the existing flux1-dev image as base
FROM timpietruskyblibla/runpod-worker-comfy:3.4.0-flux1-dev

# Change working directory to ComfyUI
WORKDIR /comfyui

# If you want to add custom models, uncomment and modify these lines:
# RUN mkdir -p models/checkpoints models/vae
# Add your custom model downloads here, for example:
# RUN wget -O models/checkpoints/your_model.safetensors https://example.com/path/to/your/model.safetensors

# If you want to add custom nodes via a snapshot:
# 1. Copy your snapshot file
# COPY your_snapshot.json /
# 2. Run the restore script (already exists in base image)
# RUN /restore_snapshot.sh

# You can add any additional customizations here, such as:
# - Installing additional Python packages
# - Adding custom scripts
# - Modifying configurations

# The base image already includes the necessary start script and handler
CMD ["/start.sh"]