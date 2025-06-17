FROM ubuntu:22.04

RUN apt-get update && \
    apt-get install -y ffmpeg curl bash

WORKDIR /app
COPY . .

CMD ["bash", "start.sh"]
