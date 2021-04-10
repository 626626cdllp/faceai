# docker build -t csighub.tencentyun.com/tme-kubeflow/ai:base -f Dockerfile .

FROM ubuntu:18.04


RUN apt-get update && apt-get install -y --force-yes --no-install-recommends locales ttf-wqy-microhei ttf-wqy-zenhei xfonts-wqy && \
    locale-gen zh_CN && locale-gen zh_CN.utf8

ENV LANG zh_CN.UTF-8
ENV LC_ALL zh_CN.UTF-8
ENV LANGUAGE zh_CN.UTF-8

RUN apt-get update && apt-get install -yqq --no-install-recommends apt-utils curl rsync netcat locales openjdk-8-jdk ca-certificates-java jq  wget iputils-ping net-tools tzdata zip vim \
    && apt-get install -y --fix-missing cmake gfortran git build-essential graphicsmagick libgraphicsmagick1-dev libatlas-base-dev libavcodec-dev libavformat-dev libgtk2.0-dev libjpeg-dev liblapack-dev libswscale-dev pkg-config \
    && apt install -y python3.6-dev python3-pip

RUN apt-get install -yqq --fix-missing tesseract-ocr-all

RUN rm -rf /usr/bin/python && ln -s /usr/bin/python3 /usr/bin/python && rm -rf /usr/bin/pip && ln -s /usr/bin/pip3 /usr/bin/pip

##RUN apt install python3-opencv
## pip install dlib
RUN pip3 install --upgrade pip && pip3 install pysnooper numpy pandas pytesseract pillow tensorflow==1.8.0 keras==2.1.6 scikit-image opencv-python==3.4.3.18

#
RUN pip3 install tesseract face_recognition==1.2.2


# docker run --rm  --name ai -it -v $PWD:/app -p 8080:8080 csighub.tencentyun.com/tme-kubeflow/ai:base bash


