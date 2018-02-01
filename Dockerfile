FROM ubuntu:16.04
RUN apt-get update
RUN apt-get upgrade -y \
        python-pip \
        python-tk
RUN apt-get install -y net-tools
RUN pip install --upgrade pip
RUN python -V
# Install TensorFlow CPU version from central repo
RUN pip install tensorflow

RUN apt-get install -y git curl nano wget

WORKDIR /home
RUN git clone https://github.com/googlecodelabs/tensorflow-for-poets-2

RUN cd tensorflow-for-poets-2

WORKDIR /home/tensorflow-for-poets-2

RUN curl http://download.tensorflow.org/example_images/flower_photos.tgz | tar xz -C tf_files

# ADD tensorflow-mnist-tutorial /root/tensorflow-mnist-tutorial
#WORKDIR /root/tensorflow-mnist-tutorial
CMD ["/bin/bash"]
