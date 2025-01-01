FROM nvcr.io/nvidia/cuda:12.6.3-cudnn-runtime-ubuntu22.04

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update -qq -y
RUN apt-get upgrade -y
RUN apt-get install -y libgl1 libglib2.0-0 python3 python3-pip python3-tk git

RUN ln -s $(which python3) /usr/local/bin/python
#RUN pip install torch torchvision torchaudio

RUN git clone --depth 1 --no-single-branch https://github.com/comfyanonymous/ComfyUI.git
WORKDIR "/ComfyUI"

RUN python -m pip install --upgrade pip
RUN python -m pip install -r requirements.txt

RUN git clone https://github.com/kijai/ComfyUI-KJNodes.git custom_nodes/ComfyUI-KJNodes
RUN python -m pip install -r custom_nodes/ComfyUI-KJNodes/requirements.txt

RUN git clone https://github.com/Fannovel16/comfyui_controlnet_aux.git custom_nodes/comfyui_controlnet_aux
RUN python -m pip install -r custom_nodes/comfyui_controlnet_aux/requirements.txt

RUN git clone https://github.com/rgthree/rgthree-comfy.git custom_nodes/rgthree-comfy
RUN python -m pip install -r custom_nodes/rgthree-comfy/requirements.txt

RUN git clone https://github.com/Derfuu/Derfuu_ComfyUI_ModdedNodes.git custom_nodes/Derfuu_ComfyUI_ModdedNodes
RUN cd custom_nodes && git clone https://github.com/ssitu/ComfyUI_UltimateSDUpscale --recursive

RUN git clone https://github.com/ltdrdata/ComfyUI-Inspire-Pack.git custom_nodes/ComfyUI-Inspire-Pack
RUN python -m pip install -r custom_nodes/ComfyUI-Inspire-Pack/requirements.txt

RUN git clone https://github.com/WASasquatch/was-node-suite-comfyui.git custom_nodes/was-node-suite-comfyui
RUN python -m pip install -r custom_nodes/was-node-suite-comfyui/requirements.txt

RUN git clone https://github.com/city96/ComfyUI-GGUF.git custom_nodes/ComfyUI-GGUF
RUN python -m pip install -r custom_nodes/ComfyUI-GGUF/requirements.txt

RUN git clone https://github.com/sipie800/ComfyUI-PuLID-Flux-Enhanced.git custom_nodes/ComfyUI-PuLID-Flux-Enhanced
RUN python -m pip install -r custom_nodes/ComfyUI-PuLID-Flux-Enhanced/requirements.txt

#RUN git clone https://github.com/ltdrdata/ComfyUI-Manager.git custom_nodes/ComfyUI-Manager
#COPY style-face-transfer.json .

CMD ["python", "main.py", "--listen"]
