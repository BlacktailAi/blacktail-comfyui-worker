# BlacktailAI ComfyUI Worker

> Custom ComfyUI Worker for RunPod, powered by BlacktailAI

## Overview

This repository contains a customized version of the ComfyUI worker for RunPod, built on top of the FLUX.1 dev model. It includes additional features such as:

- Support for S3 URL inputs
- Custom error handling
- Streamlined deployment process

## Quick Start

1. **Deploy to RunPod**

   - Use our Docker image: `blacktailai/runpod-worker-comfy:latest`
   - Recommended GPU: 24GB+ VRAM
   - Set your AWS S3 environment variables if needed

2. **API Usage**

```json
{
    "input": {
        "workflow": { your_workflow_here },
        "images": [
            {
                "name": "input1.png",
                "image": "https://your-bucket.s3.region.amazonaws.com/path/to/image.png"
            }
        ]
    }
}
```

## Features

- Based on FLUX.1 dev model
- Supports both base64 and S3 URL image inputs
- Automated builds via GitHub Actions
- Custom error handling and logging

## Environment Variables

| Variable                   | Description        | Required |
| -------------------------- | ------------------ | -------- |
| `BUCKET_ENDPOINT_URL`      | S3 bucket endpoint | Optional |
| `BUCKET_ACCESS_KEY_ID`     | AWS access key     | Optional |
| `BUCKET_SECRET_ACCESS_KEY` | AWS secret key     | Optional |

## Development

To build locally:

```bash
docker build -t blacktailai/runpod-worker-comfy:dev .
```

## Updates and Maintenance

This repository is a customized fork of [runpod-worker-comfy](https://github.com/blib-la/runpod-worker-comfy). To update with upstream changes:

```bash
# Add the upstream remote (one-time setup)
git remote add upstream https://github.com/blib-la/runpod-worker-comfy.git

# Fetch upstream changes
git fetch upstream

# Merge upstream changes
git merge upstream/main
```

## License

This project is licensed under the same terms as the original runpod-worker-comfy.

---

<p align="center">
  <strong>Powered by BlacktailAI</strong>
</p>
