FROM pytorch/pytorch:2.2.0-cuda12.1-cudnn8-devel

#Prevent interactive prompts, like asking for timezone
ENV DEBIAN_FRONTEND=noninteractive

#Install Commandline utils
RUN apt-get update && \
    apt-get install -y git

#Install OpenCV and some other dependancies for Matterport3dSimulator
RUN apt-get update && \
    apt-get install -y libopencv-dev python3-opencv libgl1-mesa-dev libjsoncpp-dev libepoxy-dev libglm-dev libosmesa6 libosmesa6-dev libglew-dev python3-setuptools python3-dev python3-pip

RUN pip install opencv-python torch torchvision numpy pandas networkx

#Clone the fork ready to install Matterport3DSimulator-fork
RUN git clone https://github.com/padouk/Matterport3DSimulator.git && \
    mv Matterport3DSimulator Matterport3DSimulator-fork && \
    cd Matterport3DSimulator-fork && \
    git checkout env/docker/pytorch/pytorch && \
    cd pybind11 && \
    git pull && \
    cd .. && \
    mkdir build

RUN cd Matterport3DSimulator-fork/build && \
    cmake -DEGL_RENDERING=ON .. && \
    make -j4