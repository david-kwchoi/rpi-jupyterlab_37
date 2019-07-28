# rpi-jupyterlab_37
Dockerfile for building jupyter lab container with python 3
This is a Dockerfile for building rpi-jupyter-lab. with balenalib/raspberrypi3-python:3.7.3-buster as base image with python 3.7

## Getting Started
### Run in detached mode
```
docker pull b1iz4rclavid/rpi-jupyterlab_37
docker run -d -p <docker_host_port>:8888 b1iz4rclavid/rpi-jupyterlab_37
```
### Access the notebook with
```http://<docker_host_ip>:<docker_host_port>```

### Bash access to the running container
```
docker exec -it <container id> /bin/bash
``` 

## Configuration
### Override default configurations with env variables:
```
PASSWORD sha1:8be0a8af2aa8:f631a6e0a66701463140d9c584de66d1a2ffa669 #sha1 hashed password, default is b1iz4rclavid/rpi-jupyterlab_37
SERVER_PORT 8888 #container port for jupyter
ARGS #extra args provided to jupyter
```

### Then docker run will look like 
```
docker run -it -p <docker_host_port>:8888 -e PASSWORD=sha1:xxxxxx -v <host_notebooks_path>:/jupyter/notebooks b1iz4rclavid/rpi-jupyterlab_37
```

#### Example to expose docker host port 8388 with password 'test123', notebooks directory at ~/notebooks
```
docker run -it -p 8388:8888 -e PASSWORD=sha1:c316741091a4:cbea49552d8b0f03190d7b92adc4bd82ac367664 -e ARGS="--NotebookApp.certfile=XXXXX" -v ~/notebooks:/jupyter/notebooks b1iz4rclavid/rpi-jupyterlab_37
```


### Prerequisites
You will need to have docker installed on your rpi. 
Please refer to https://www.raspberrypi.org/blog/docker-comes-to-raspberry-pi/

```
curl -sSL https://get.docker.com | sh
```
