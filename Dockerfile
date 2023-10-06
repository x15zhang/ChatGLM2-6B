## use pytorch images
FROM pytorch/pytorch:2.0.1-cuda11.7-cudnn8-runtime
## lables
LABEL version="v1"
LABEL description="chatglm2-6b docker images"
## copy all files
COPY . .
## install tools
RUN apt update && apt install -y git gcc
## install requirements and cudatoolkit
RUN pip install -r requirements.txt -i https://pypi.tuna.tsinghua.edu.cn/simple/ && \
pip install icetk -i https://pypi.tuna.tsinghua.edu.cn/simple/ && \
conda install cudatoolkit=11.7 -c nvidia
## expose port
EXPOSE 7860
## run
CMD [ "python3","web_demo.py" ]
