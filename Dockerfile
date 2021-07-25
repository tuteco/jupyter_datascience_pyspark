FROM jupyter/pyspark-notebook

# install additional packages
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