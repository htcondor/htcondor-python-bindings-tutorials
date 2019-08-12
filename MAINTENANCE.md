# Maintenance

*Read this entire document before doing anything!*

## What's Going On?

This repository has two useful branches: `stable` and `dev`.
The main differences between them is that in `binder/Dockerfile`, the line
```docker
ARG HTCONDOR_VERSION=x.y
```
should correspond to the current `stable` or `dev` series in the appropriate branch.

No other content except in `tutorials/` should need to change between the branches.
The tutorials in `tutorials/` may need to change as the bindings evolve in the future.

## Keeping Things Clean

When you are editing the manuals, you will likely end up with "dirty" notebooks
that contain output cells. We would prefer these not to end up in the git repository.

Before you do a commit, always run something like 
```
nbstripout `find tutorials -name '*.ipynb'`
```
from the root of the repository to clean up the notebooks.
(`pip install nbstripout` to get the necessary package).

Alternatively, you can manually clear all of the output from the notebooks.
Your choice...

## Synchronization with the Manual

The HTCondor Manual is rendered from pre-run versions of these notebooks.
Whenever you make an update to the content of the tutorials here, you should

1. Start the tutorial notebooks up using `binder/edit.sh` (see below).
1. Clear the notebook's output and restart the kernel (from the "Kernel" menu bar).
1. Run the entire notebook through, in order, once. Note that some cells may raise exceptions; you must manually continue execution past them.
1. Copy the resulting `.ipnyb` file (which now contains the output cells) into the appropriate place under `docs/apis/python-bindings` in the main HTCondor repository.

## Local Development

The most convenient way to edit the tutorials is to clone the repository and then
run the `binder/edit.sh` script from the repository root.
```bash
$ chmod +x binder/edit.sh
$ binder/edit.sh
```
This will open the same Jupyter Lab environment as if you were doing the tutorials,
except that everything in `tutorials/` is bind-mounted back to the host.
Any changes you make in the container will be reflected on your computer in the repository,
which you can then use `git` with normally.
