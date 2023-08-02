FROM ubuntu/nginx:latest
VOLUME /tmp
COPY . .
RUN apt update
RUN apt -y upgrade
RUN apt -y install git python3 python3-pip nvidia-cuda-toolkit python-is-python3 clang

RUN git clone https://github.com/tinygrad/tinygrad.git
RUN python3 -m pip install --break-system-packages -e ./tinygrad
RUN python3 -m pip install --break-system-packages -e './tinygrad/[testing]'
RUN python3 -m pip install --break-system-packages -e './tinygrad/[llvm]'
RUN python3 -m pip install --break-system-packages -e './tinygrad/[cuda]'
RUN python3 -m pip install --break-system-packages -e './tinygrad/[triton]'
RUN python3 -m pip install --break-system-packages -e './tinygrad/[webgpu]'

# metal will not work on nginx as it isn't a mac
# and thus doesn't have sw_vers or metal for that matter
# python3 -m pip install --break-system-packages -e '.[metal]'

RUN python3 -m pip install --break-system-packages -e './tinygrad/[linting]'

#RUN python3 -m pytest
#RUN python3 -m pytest -v -k TestTrain
#RUN python3 ./tinygrad/test/models/test_train.py TestTrain.test_efficientnet


