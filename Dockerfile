FROM nvidia/cuda:11.7.1-runtime-ubuntu22.04

RUN sed -i s/archive.ubuntu.com/mirrors.aliyun.com/g /etc/apt/sources.list
RUN sed -i s/security.ubuntu.com/mirrors.aliyun.com/g /etc/apt/sources.list
RUN sed -i s/ports.ubuntu.com/mirrors.aliyun.com/g /etc/apt/sources.list
RUN apt update && apt-get -y install git wget \
    python3.10 python3.10-venv python3-pip \
    build-essential libgl-dev libglib2.0-0 wget
RUN ln -s /usr/bin/python3.10 /usr/bin/python
RUN useradd -ms /bin/bash usera
WORKDIR /app
ADD . .
RUN pip config set global.index-url https://mirrors.cloud.tencent.com/pypi/simple
RUN pip config set global.trusted-host mirrors.cloud.tencent.com
RUN pip install -r requirements.txt --no-cache-dir
