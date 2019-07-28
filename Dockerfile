FROM balenalib/raspberrypi3-python:3.7.3-buster

LABEL version="1.0" owner="b1iz4rclavid"

RUN [ "cross-build-start" ]
RUN apt-get update -y && apt-get install -y libncurses5-dev libzmq-dev libfreetype6-dev libpng-dev gcc g++
RUN pip3 install --upgrade pip && pip install jupyterlab

# Install usefull python packages for data scientists
RUN apt-get install -y \
        libhdf5-dev \
        liblapack-dev \
        gfortran
RUN pip3 install requests numpy pandas

RUN groupadd -g 999 jupyter && useradd -r -u 999 -g jupyter jupyter 
RUN mkdir -p /home/jupyter /jupyter/notebooks && chown -R jupyter:jupyter /home/jupyter /jupyter/notebooks
RUN [ "cross-build-end" ]

VOLUME /jupyter/notebooks

USER jupyter 

# Configure jupyter
ENV SERVER_IP 0.0.0.0
ENV PASSWORD sha1:8be0a8af2aa8:f631a6e0a66701463140d9c584de66d1a2ffa669
ENV NOTEBOOK_DIR /jupyter/notebooks
ENV SERVER_PORT 8888
ENV ARGS=

EXPOSE $SERVER_PORT 

CMD exec jupyter lab \
	--no-browser \
	--ip=$SERVER_IP \
	--notebook-dir=$NOTEBOOK_DIR \
	--port=$SERVER_PORT \
	--NotebookApp.password=$PASSWORD \
	$ARGS
