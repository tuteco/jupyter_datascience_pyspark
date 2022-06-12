# AWS ready Jupyter LAB for datascience
```
   _         _                 
  | |_ _   _| |_ ___  ___ ___  
  | __| | | | __/ _ \/ __/ _ \ 
  | |_| |_| | ||  __/ (_| (_) |
 (_)__|\__,_|\__\___|\___\___/ 
 
 -- data & knowledge experts --                              
```
Base for this docker image is the [jupyter-pyspark-notebook](https://jupyter-docker-stacks.readthedocs.io/en/latest/using/selecting.html#jupyter-pyspark-notebook)

We have extended the image for use with AWS and included some Jupyter Lab extension already.
Check out our [cookiecutter template](https://github.com/tuteco/cookiecutter-jupyter-aws-docker) to get a jump start, 
including some instructional examples.

## Python Packages added
- [boto3](https://boto3.amazonaws.com/v1/documentation/api/latest/index.html) - python library for AWS api 
- [faker](https://faker.readthedocs.io/en/stable/index.html) - create fake data
  - [faker_music](https://pypi.org/project/faker_music/) - faker provider for music generes and instruments
  - [faker-vehicle](https://pypi.org/project/faker-vehicle/) - faker provider for vehicle related data
- [s3fs](https://s3fs.readthedocs.io/en/latest/) - simplified interface for AWS S3
- [plotly](https://github.com/plotly/plotly.py) - interactive, open-source, and browser-based graphing library
- [psycopg2-binary](https://pypi.org/project/psycopg2-binary/) - PostgreSQL database adapter

## Jupyter extensions added
- [spellchecker](https://github.com/jupyterlab-contrib/spellchecker) - spell checker for English, French, German, + more
- [Variable Inspector](https://github.com/lckr/jupyterlab-variableInspector)
- [Code Formatter](https://jupyterlab-code-formatter.readthedocs.io/en/latest/) - pretty format your python code
    - [iSort](https://pypi.org/project/isort/) - required for code formatter
    - [black](https://black.readthedocs.io/en/stable/index.html) - the actual code formatter used
- [IPyDrawiO](https://ipydrawio.readthedocs.io/en/stable/) - create DrawIO images
- [Language Server protocol implementation](https://github.com/krassowski/jupyterlab-lsp) - code completion functionality
  - [Jedi Langauge Server](https://github.com/pappasam/jedi-language-server) - for code completion
- [Chart Editor](https://github.com/plotly/jupyterlab-chart-editor) - easy work with plotly charts
  - jupyterlab-plotly - required for chart editor to work
- [ipython-sql](https://github.com/catherinedevlin/ipython-sql)  -run sql directly in a notebook cell
- [Interactive Tables](https://mwouts.github.io/itables/quick_start.html)

## Image local build
we use [python invoke](https://www.pyinvoke.org) instead of unix make. 
The advantage is, that it runs where python is installed, including MS Windows.

to run a local build
```
invoke build-local
```

The result is the tuteco/jupyter_datascience_pyspark:latest-dev container image.
Be aware that the local build has the tag "latest-dev".
