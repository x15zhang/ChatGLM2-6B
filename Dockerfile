FROM paas-cn-beijing.cr.volces.com/rdma/pytorch:nvidia
RUN apt-get update && apt-get install -y git net-tools curl 
RUN git clone https://github.com/THUDM/ChatGLM2-6B && cd ChatGLM2-6B && pip install -r requirements.txt && pip install transformers==4.28.1
RUN pip uninstall -y transformer-engine
WORKDIR /workspace/
COPY web_demo2.py /workspace/
CMD ["streamlit","run","web_demo2.py"]
