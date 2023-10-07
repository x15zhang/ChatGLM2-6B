FROM nvcr.io/nvidia/pytorch:23.06-py3

WORKDIR /app

COPY . .

RUN pip config set global.index-url https://pypi.tuna.tsinghua.edu.cn/simple && \
    pip install -r requirements.txt

EXPOSE 7860 8000

CMD python web_demo.py
