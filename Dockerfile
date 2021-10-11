FROM debian:latest
WORKDIR /usr/src/app
ARG TARGETPLATFORM
RUN echo "I'm running on $TARGETPLATFORM"

RUN apt update && apt upgrade -y
RUN apt install wget -y
RUN apt install git -y
RUN apt install python3 -y
RUN apt install python3-dev -y
RUN apt install gfortran -y
RUN apt install openssh-sftp-server -y
RUN apt install openssh-server -y
RUN apt install python3-pip -y
RUN apt install cmake -y
RUN pip3 install --upgrade pip setuptools wheel cython llvmlite numpy
RUN pip3 install h5py
RUN pip3 install scipy==1.6.0
RUN pip3 install librosa
RUN pip3 install keras==2.4.0
RUN pip3 install matplotlib==3.3.4
RUN pip3 install tensorflow

RUN git clone https://github.com/kuleshov/audio-super-res.git
WORKDIR /usr/src/app/audio-super-res/data/vctk
ONBUILD RUN make;
WORKDIR /usr/src/app/audio-super-res

#EXPOSE 22
