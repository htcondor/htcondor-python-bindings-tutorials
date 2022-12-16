# HTCondor Python Bindings Tutorials

This repository contains various tutorials on using the HTCondor Python Bindings.
The easiest way to get started is to launch the tutorials via Binder: 
[![Binder](https://mybinder.org/badge_logo.svg)](https://mybinder.org/v2/gh/htcondor/htcondor-python-bindings-tutorials/master?urlpath=lab/tree/index.ipynb)

If Binder is not working for some reason, please [let us know](https://github.com/htcondor/htcondor-python-bindings-tutorials/issues).
You can also try some of the alternate ways to access the tutorials listed below.

If you are a maintainer, see the `MAINTENANCE.md` file for instructions.


## Other Ways to Access the Tutorials

If Binder isn't working, there are a few other ways to get the tutorials.


### Run in a Docker Container (From DockerHub)

You can run the same Docker container used by Binder locally by running
```bash
docker run -it --rm -p 8888:8888 htcondor/python-bindings-tutorials:latest
```
After Docker pulls the image and starts it, you should see something like
```
[C 14:21:29.540 NotebookApp]

    To access the notebook, open this file in a browser:
        file:///home/jovyan/.local/share/jupyter/runtime/nbserver-6-open.html
    Or copy and paste one of these URLs:
        http://012def98:8888/?token=a1b2c3d4...
     or http://127.0.0.1:8888/?token=a1b2c3d4...
```
Paste one of the URL options into your web browser and you'll be in a Jupyter Lab
(the file method will not work, you must use one of the links).
Use the file browser on the left side of the Lab interface to open `index.ipynb`.


### Run in a Docker Container (From a Local Repository)

The Docker container that runs on Binder is defined by `binder/Dockerfile`.
You can run this container locally.

Clone the repository:
```bash
$ git clone https://github.com/htcondor/htcondor-python-bindings-tutorials
```

Run the `run.sh` script (or `run.cmd` on Windows), which builds and runs the Docker image and container:
```bash
$ binder/run.sh
```
You'll see the output of the Docker image build, then the container will spin up and you'll see a message like above.
Use it to connect to the Jupyter Lab and open `index.ipynb`.


### Run on Bare Metal

Install your preferred version of HTCondor on your computer (https://research.cs.wisc.edu/htcondor/downloads/).

Clone the repository as above.

Install JupyterLab and the matching version of the Python bindings into your Python using `pip`:
```bash
$ pip install jupyterlab htcondor==<x.y>
```
where `<x.y>` is something like `8.9`.

Run JupyterLab from the repository root:
```bash
$ jupyter lab
```
and use your web browser to access the Jupyter Lab and open `index.ipynb` as above.
