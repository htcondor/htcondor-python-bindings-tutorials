# Maintenance

*Read this entire document before doing anything!*


## Local Development

The most convenient way to edit the tutorials is to clone the repository locally and then
run the `binder/edit.sh` (or `binder/edit.cmd` on Windows) script from the repository root.
This will open the same Jupyter Lab environment as if you were doing the tutorials,
except that everything in `tutorials/` is bind-mounted back to the host.
Any changes you make in the container will be reflected on your computer in the repository,
which you can then use `git` with normally.

When you are editing the manuals, you will likely end up with "dirty" notebooks
that contain output cells. We would prefer these not to end up in the git repository.

Before you do a commit, always run
```
binder/strip.sh
```
from the root of the repository to clean up the notebooks.

Alternatively, you can manually clear all of the output from the notebooks.

Note that even minor edits will often produce random changed bits of metadata in the `.ipynb` files
that the above will not fix; this is currently unavoidable, so don't worry about it.


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
