#! /bin/bash
HUGGINGFACE_ACCESS_TOKEN=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
CIVITAI_ACCESS_TOKEN=8e09f55a53539cf353113b3085614899
apt-get update
pip install --upgrade pip


mkdir -p models/checkpoints models/vae extras/models models/unet/IC-Light models/clip models/controlnet models/loras models/upscale_models

echo -e "Downloading checkpoints ✨"
wget --header="Authorization: Bearer ${HUGGINGFACE_ACCESS_TOKEN}" -O models/unet/flux1-dev-Q8_0.gguf "https://huggingface.co/city96/FLUX.1-dev-gguf/resolve/main/flux1-dev-Q8_0.gguf"

echo -e "Downloading VAE ✨"
wget --header="Authorization: Bearer ${HUGGINGFACE_ACCESS_TOKEN}" -O models/vae/ae.safetensors https://huggingface.co/black-forest-labs/FLUX.1-dev/resolve/main/ae.safetensors;

echo -e "Downloading clips ✨"
wget -O models/clip/clip_l.safetensors https://huggingface.co/comfyanonymous/flux_text_encoders/resolve/main/clip_l.safetensors
wget -O models/clip/t5xxl_fp8_e4m3fn.safetensors https://huggingface.co/comfyanonymous/flux_text_encoders/resolve/main/t5xxl_fp8_e4m3fn.safetensors

echo -e "Downloading controlnet ✨"
wget -O models/controlnet/fluxControlnetUpscale_v10.safetensors "https://civitai.com/api/download/models/1152983?type=Model&format=SafeTensor&token=${CIVITAI_ACCESS_TOKEN}"

echo -e "Downloading loras ✨"
wget -O models/loras/Flux_Skin_Detailer.safetensors "https://civitai.com/api/download/models/1142009?type=Model&format=SafeTensor&token=${CIVITAI_ACCESS_TOKEN}"

echo -e "Downloading upscale models ✨"
wget --header="Authorization: Bearer ${HUGGINGFACE_ACCESS_TOKEN}" -O models/upscale_models/4xNomosUniDAT_otf.pth "https://huggingface.co/datasets/jibopabo/upscalers/resolve/main/4xNomosUniDAT_otf.pth"
wget --header="Authorization: Bearer ${HUGGINGFACE_ACCESS_TOKEN}" -O models/upscale_models/4xFaceUpDAT.safetensors "https://huggingface.co/Phips/4xFaceUpDAT/resolve/main/4xFaceUpDAT.safetensors"
wget --header="Authorization: Bearer ${HUGGINGFACE_ACCESS_TOKEN}" -O models/upscale_models/4x-UltraSharp.pth "https://huggingface.co/lokCX/4x-Ultrasharp/resolve/main/4x-UltraSharp.pth"