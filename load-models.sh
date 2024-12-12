#! /bin/bash
HUGGINGFACE_ACCESS_TOKEN = "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"
CIVITAI_ACCESS_TOKEN = "8e09f55a53539cf353113b3085614899"
apt-get update
pip install --upgrade pip


mkdir -p models/checkpoints models/vae extras/models models/unet/IC-Light models/clip models/controlnet models/loras

echo -e "Downloading checkpoints ✨"
wget -O models/checkpoints/flux1-dev-fp8.safetensors https://huggingface.co/Comfy-Org/flux1-dev/resolve/main/flux1-dev-fp8.safetensors
wget -O models/checkpoints/realisticVisionV51_v51VAE.safetensors https://huggingface.co/lllyasviel/fav_models/resolve/main/fav/realisticVisionV51_v51VAE.safetensors
wget -0 models/checkpoints/flux1DevGGUF_Q8.safetensors "https://civitai.com/api/download/models/724149?type=Model&format=Diffusers&size=full&fp=fp8&token=${CIVITAI_ACCESS_TOKEN}"

echo -e "Downloading VAE ✨"
wget -O models/vae/vae-ft-mse-840000-ema-pruned.safetensors https://huggingface.co/stabilityai/sd-vae-ft-mse-original/resolve/main/vae-ft-mse-840000-ema-pruned.safetensors
wget --header="Authorization: Bearer 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" -O models/vae/ae.safetensors https://huggingface.co/black-forest-labs/FLUX.1-schnell/resolve/main/ae.safetensors;

echo -e "Downloading UNET ✨"
wget --header="Authorization: Bearer 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" -O  models/unet/IC-Light/iclight_sd15_fc_unet_ldm.safetensors https://huggingface.co/huchenlei/IC-Light-ldm/resolve/main/iclight_sd15_fc_unet_ldm.safetensors

echo -e "Downloading clips ✨"
wget -O models/clip/clip_l.safetensors https://huggingface.co/comfyanonymous/flux_text_encoders/resolve/main/clip_l.safetensors
wget -O models/clip/t5xxl_fp8_e4m3fn.safetensors https://huggingface.co/comfyanonymous/flux_text_encoders/resolve/main/t5xxl_fp8_e4m3fn.safetensors

echo -e "Downloading extras ✨"
wget -O extras/models/model.pth https://huggingface.co/briaai/RMBG-1.4/resolve/main/model.pth

echo -e "Downloading controlnet ✨"
wget -O models/controlnet/fluxControlnetUpscale_v10.safetensors "https://civitai.com/api/download/models/1152983?type=Model&format=SafeTensor&token=${CIVITAI_ACCESS_TOKEN}"

echo -e "Downloading loras ✨"
wget -O models/loras/Flux_Skin_Detailer.safetensors "https://civitai.com/api/download/models/1142009?type=Model&format=SafeTensor&token=${CIVITAI_ACCESS_TOKEN}"

wget --header="Authorization: Bearer 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" -O models/vae/ae.safetensors https://huggingface.co/black-forest-labs/FLUX.1-dev/resolve/main/ae.safetensors
