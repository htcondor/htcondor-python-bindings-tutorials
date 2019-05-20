# Maintenance

## What's Going On?

This repository has two useful branches: `stable` and `dev`.
The main differences between them is that in `binder/Dockerfile`, the line
```docker
ARG HTCONDOR_VERSION=x.y
```
should correspond to the current `stable` or `dev` series in the appropriate branch.

No other content except in `tutorials/` should need to change between the branches.
The tutorials in `tutorials/` may need to change as the bindings evolve in the future.

## Local Development

The most convenient way to edit the tutorials is to clone the repository and then
run the `binder/dev.sh` script from the repository root.
```bash
$ chmod +x docker/edit.sh
$ binder/edit.sh
```
This will open the same Jupyter Lab environment as if you were doing the tutorials,
except that everything in `tutorials/` is bind-mounted back to the host.
Any changes you make in the container will be reflected on your computer in the repository,
which you can then use `git` with normally.
