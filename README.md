# reverse-proxy

This project holds my nginx proxy to websocket servers and the certbot in charge of SSL management. For now my limitations on knowing docker-compose I have everything here in this `docker-compose.yml`. I would like to find a way to remove anything other than nginx and certbot.

## Assumptions

- Git Installed
- Docker Installed
- Docker Compose Installed
- Domain Registered with proper routing (www.example.com)
- Port 80 and 443 open (No Firewalls)

## Anatomy of the Project

```
|-Data  
  |-nginx  
    |-app.conf          Application Config. This houses the server directives  
    |-nginx.conf        Nginx Server Config. This houses the http directive  
|-docker-compose.yml    Docker Compose File. Details deployment strategy  
|-Dockerfile            Dockerfile for our version of the nginx server. We need this because we HAVE to modify nginx.conf 
|                       and the default image this file is readonly. 99% of it is default other than adding our 2 files.
|
|-init-letsencrypt.sh   Script for resolving the need for a temp cert before requesting a real cert.
|-LICENSE               Standard License file.
|-README.md             This file
```

## How To Use

1. Clone the repo `git clone https://github.com/Treee/reverse-proxy`

2. Build the nginx container - `docker build . -t nginx:my-latest` (You can change the tag name if you change the image source in the docker-compose.yml)

3. Run the command `./init-letsencrypt.sh` (This only needs to be run once when setting it all up. Make sure you compy the ssl key folder so you do not have to do this again when redeploying)
    a. You might need to run `chmod +x init-letsencrypt.sh` to grant execute permissions to the script.  
    b. This script satisfies a few things that are needed when obtaining SSL certs from a CA authority using acme responses. It downloads up to date SSL options, creates a dummy cert to bootstrap the nginx server, requests new certified SSL keys, deletes the old temp dummy certs and restarts the nginx server to apply the changes.

4. Run `docker-compose up`  
    a. Add `-d` to allow for detached mode.
