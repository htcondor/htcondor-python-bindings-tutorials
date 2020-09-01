# Maintenance

*Read this entire document before doing anything!*


## Local Development

The most convenient way to edit the tutorials is to clone the repository locally and then
run the `binder/edit.sh` script from the repository root.
This will open the same Jupyter Lab environment as if you were doing the tutorials,
except that everything in `tutorials/` is bind-mounted back to the host.
Any changes you make in the container will be reflected on your computer in the repository,
which you can then use `git` with normally.
The `binder/run.sh` script does the same, but without the bind-mount.

When you are editing the manuals, you will likely end up with "dirty" notebooks
that contain output cells. We would prefer these not to end up in the git repository.

Before you do a commit, always run
```
binder/strip.sh
```
from the root of the repository to clean up the notebooks.

Alternatively, you can manually clear all of the output from the notebooks.

Note that even minor edits will often produce random changed bits of metadata 
in the `.ipynb` files that the above will not fix; 
this is currently unavoidable, so don't stress about it.


## Synchronization with the Manual

The Python bindings tutorials in the main HTCondor Manual are rendered from 
pre-run versions of these notebooks.
Whenever you make an update to the content of the tutorials here, you should

1. Execute all of the notebooks by running `binder/exec.sh`. This will create a
   Docker container with a bind mount back to the `tutorials/` directory and
   run all of the notebooks it finds there.
1. Check the output of `binder/exec.sh` carefully, looking for execution errors that
   prevent notebooks from being executed and written back to disk.
1. Open the notebooks themselves and check that their output looks correct.
   Look for cells that have raised exceptions in particular: some are intentional,
   but errors may have crept in.
1. Once you are satisfied that the output is correct, 
   copy all of the resulting `.ipynb` 
   files (which now contain rendered output cells) into 
   the appropriate place under `docs/apis/python-bindings/tutorials` 
   in the main HTCondor repository.

Unfortunately, this process often breaks and requires some tweaking.
Known problems and solutions:

1. Because the build bind-mounts the tutorials back into your directory,
   but runs as uid `1000` inside the container, you may get very annoying
   permissions behavior. I recommend bypassing this by just setting the
   permissions on the `tutorials` directory to `777` before running `exec.sh`.
   I imagine there is a better solution, but we haven't needed one yet....
1. `Interacting-With-Daemons` turns HTCondor off and on again, but doesn't
   really wait for it to start up again. Running under `exec.sh` on a busy
   machine, HTCondor will sometimes not be ready for the next tutorial
   to run successfully, often resulting in a hung build.


## Binder Integration

This repository is "Binder-ready", which means that it can be loaded as an
environment on https://mybinder.org/ as an easy way to distribute the tutorials
to users who don't have a local HTCondor system.

Because we mostly just need to run in an 
[HTC Notebook](https://github.com/htcondor/htc-notebook)
with a few additions, we use the
[Dockerfile environment](https://repo2docker.readthedocs.io/en/latest/config_files.html#dockerfile-advanced-environments)
for `repo2docker` (the tool that builds environments for Binder).
The Dockerfile is in `binder/Dockerfile`, and is exactly the same Dockerfile
used by all of the `binder/*.sh` helper scripts.
