#! /bin/bash
C='\033[1;33m'
NC='\033[0m' # No Color
basePath='/workspace/ComfyUI'
apt-get update
pip install --upgrade pip
apt-get install build-essential
pip install comfy-cli
comfy tracking disable
## update ComfyUI
echo -e "${C}Updating ComfyUI${NC} ✨"
comfy set-default $basePath
cd $basePath
cd custom_nodes
rm -r ComfyUI-Manager
git clone https://github.com/ltdrdata/ComfyUI-Manager
comfy node update all
echo -e "${C}Update ComfyUI done${NC} ✅"