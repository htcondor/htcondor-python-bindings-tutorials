# HTCondor Python Bindings Tutorials

This repository contains various tutorials on using the HTCondor Python Bindings.

The easiest way to get started is to launch the tutorials via Binder: 
[![Binder](https://mybinder.org/badge_logo.svg)](https://mybinder.org/v2/gh/JoshKarpel/htcondor-python-bindings-tutorials/stable?urlpath=lab/tree/tutorials/index.ipynb)

The Binder link above is for the version of the tutorials based on the **stable** series release of HTCondor, currently `8.8.x`.
If you want the tutorials based on the **development** series (`8.9.x`), use [![Binder](https://mybinder.org/badge_logo.svg)](https://mybinder.org/v2/gh/JoshKarpel/htcondor-python-bindings-tutorials/dev?urlpath=lab/tree/tutorials/index.ipynb).

## Other Ways to Access the Tutorials

If Binder isn't working, there are two (worse) ways to get the tutorials.

### Run in a Docker Container

The Docker container that runs on Binder is defined by `docker/Dockerfile`.
You can run this container locally.

Clone the repository:

```bash
$ git clone https://github.com/JoshKarpel/htcondor-python-bindings-tutorials
```

(The default is the stable series; `git checkout dev` to switch to development after cloning.)

Run the `local.sh` script, which builds and runs the Docker image and container:

```bash
$ chmod +x docker/local.sh  # you only need to do this once
$ docker/local.sh
```

You'll see the output of the Docker image build, then the container will spin up and you'll see a message like

```
[C 18:06:44.844 LabApp]

    To access the notebook, open this file in a browser:
        file:///home/jovyan/.local/share/jupyter/runtime/nbserver-1-open.html
    Or copy and paste one of these URLs:
        http://(sdfa0sjgk01k or 127.0.0.1):8888/?token=sidfj12312ejr01039ir4029f0qr34i0284utfr9ja909fi2
```

Paste one URL options into your web browser and you'll be in a Jupyter Lab.
Use the file browser to open `tutorials/index.ipynb`.


### Run on Bare Metal

Install HTCondor on your computer.

Clone the repository as above.

Install JupyterLab:
