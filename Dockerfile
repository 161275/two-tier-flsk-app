FROM python:3.9-slim
WORKDIR /app
RUN apt-get update -y \
    && apt-get upgrade -y \
    && apt-get install -y gcc default-libmysqlclient-dev pkg-config\
    && apt-get clean

COPY requirements.txt .

RUN pip install mysqlclient
RUN pip install -r requirements.txt

COPY . .

cmd ["python", "app.py"]