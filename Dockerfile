FROM nvidia/cuda:11.6.1-cudnn8-devel-ubuntu20.04

# set time zone
ARG DEBIAN_FRONTEND=noninteractive
ENV TZ=Asia/Shanghai
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo '$TZ' > /etc/timezone

# config English environment
ENV LANG=en_US.UTF-8

RUN apt-get update

# unminimize ubuntu
RUN yes | unminimize

# install wget
RUN apt install wget -y

# install ROS
RUN apt-get install -y lsb-release
RUN sh -c 'echo "deb http://packages.ros.org/ros/ubuntu $(lsb_release -sc) main" > /etc/apt/sources.list.d/ros-latest.list'
RUN apt install curl gnupg -y
RUN cd 
RUN wget http://packages.ros.org/ros.key
RUN apt-key add ros.key
RUN apt update
RUN apt install ros-noetic-desktop -y
RUN echo "source /opt/ros/noetic/setup.bash" >> ~/.bashrc
RUN /bin/bash -c "source ~/.bashrc"

# install pcl-ros
RUN apt-get install ros-noetic-pcl-ros

#install glog gflag
RUN apt-get install libgoogle-glog-dev libgflags-dev