FROM drydock/c7all:master

ADD . /c7cppall

RUN /c7cppall/install.sh
