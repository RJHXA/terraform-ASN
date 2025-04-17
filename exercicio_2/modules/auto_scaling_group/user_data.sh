#!/bin/bash
yum update -y
yum install -y docker git

systemctl start docker
systemctl enable docker

sleep 10

docker pull rjhxa/getting-started

docker run -d -p 80:3000 rjhxa/getting-started