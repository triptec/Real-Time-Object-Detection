# syntax=docker/dockerfile:1

FROM python:3.8-slim-buster

RUN apt-get update && apt-get install -y \
  git \
  libgl1-mesa-glx \
  libglib2.0-0 \
  libsm6 \
  libxrender1 \
  libxext6 \
  && rm -rf /var/lib/apt/lists/*

WORKDIR /app

COPY requirements.txt requirements.txt
RUN pip3 install youtube_dl
RUN pip3 install -r requirements.txt

COPY . .
