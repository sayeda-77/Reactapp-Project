#!/bin/bash
sudo docker build -t react-appimg .

sudo docker-compose down || true

sudo docker-compose up -d
