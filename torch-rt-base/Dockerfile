FROM jianshao/dl-rt-base:3.11

COPY requirements.txt ./

ARG PYPI_INDEX_ARG=""
RUN pip install --no-cache-dir --upgrade pip && \
    pip install --no-cache-dir -r requirements.txt ${PYPI_INDEX_ARG}
