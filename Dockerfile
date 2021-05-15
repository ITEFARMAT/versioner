FROM python:3.7-slim-stretch

RUN set -ex \
    \
    && apt-get -y upgrade \
    && apt-get -y update \
    && apt-get -y install git ca-certificates \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

WORKDIR /version-update

COPY /requirements.txt .

RUN pip install -r requirements.txt

COPY /version-update.py .

CMD ["python", "/version-update.py"]
