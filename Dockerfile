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
RUN python -m pip --no-cache-dir install -r requirements.txt

ENTRYPOINT ["python", "main.py"]
