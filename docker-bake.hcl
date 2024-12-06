variable "DOCKERHUB_REPO" {
  default = ""
}

variable "DOCKERHUB_IMG" {
  default = ""
}

variable "RELEASE_VERSION" {
  default = ""
}

variable "HUGGINGFACE_ACCESS_TOKEN" {
  default = ""
}

variable "CIVITAI_ACCESS_TOKEN" {
  default = ""
}

variable "RELEASE_VERSION" {
  default = "1.0.0"
}

group "default" {
  targets = ["flux-outpaint"]
}

target "flux1-base" {
  context = "."
  dockerfile = "Dockerfile"
  target = "final"
  args = {
    MODEL_TYPE = "flux1-base"
    HUGGINGFACE_ACCESS_TOKEN = "${HUGGINGFACE_ACCESS_TOKEN}"
  }
  tags = ["${DOCKERHUB_REPO}/${DOCKERHUB_IMG}:${RELEASE_VERSION}-flux1-base"]
  inherits = ["base"]
}

