FROM jupyter/pyspark-notebook:latest

ARG NB_USER="jovyan"
ARG NB_UID="1000"
ARG NB_GID="100"

# install additional linux packages
USER root

RUN apt-get update && apt-get install -y --no-install-recommends --yes \
    curl \
    wget\
    jq \
    && rm -rf /var/lib/apt/lists/*

RUN curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip" && \
    unzip awscliv2.zip && \
    ./aws/install

# swith back to jovyan user
USER ${NB_UID}

# install additional python  packages
COPY ./requirements.txt /home/jovyan/requirements.txt
RUN pip install --no-cache -r /home/jovyan/requirements.txt && \
    jupyter labextension install jupyterlab-plotly --no-build && \
    jupyter labextension install jupyterlab-chart-editor --no-build && \
    jupyter lab build && \
        jupyter lab clean && \
        jlpm cache clean && \
        npm cache clean --force && \
        rm -rf $HOME/.node-gyp && \
        rm -rf $HOME/.local

WORKDIR /home/jovyan/work