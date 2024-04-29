FROM jianshao/python-base:3.11-slim

COPY requirements.txt ./

RUN pip install --no-cache-dir --upgrade pip setuptools wheel && \
    pip install --no-cache-dir -r requirements.txt

