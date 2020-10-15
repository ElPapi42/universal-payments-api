FROM python:3.8.6-slim
LABEL maintainer="Whitman Bohorquez"

WORKDIR /universal-payments-api

RUN apt-get update && apt-get install -y libpq-dev gcc

COPY requirements.txt requirements.txt
RUN pip install -r requirements.txt

RUN apt-get autoremove -y gcc

COPY . .
RUN python setup.py install

CMD ["echo"]