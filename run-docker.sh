#!/bin/bash
docker run -d -v /etc/letsencrypt:/etc/letsencrypt -p 80:80 -p 443:443 --name proxy -it proxy:latest
