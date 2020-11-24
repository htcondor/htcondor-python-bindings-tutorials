# Copyright 2019 HTCondor Team, Computer Sciences Department,
# University of Wisconsin-Madison, WI.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#    http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

FROM htcondor/htc-minimal-notebook:latest

# switch to root to add a script for quickly finding all of the tutorial notebooks
USER root
RUN echo -e '#!/bin/bash\nfind ${HOME}/tutorials -name '\''*.ipynb'\'' -and -not -iname '\''*-checkpoint.ipynb'\''' > /usr/bin/find_notebooks \
 && chmod +x /usr/bin/find_notebooks

RUN : \
 && apt-get update \
 && apt-get install -y --no-install-recommends imagemagick graphviz \
 && apt-get -y clean \
 && rm -rf /var/lib/apt/lists/* \
 && :

USER ${NB_UID}:${NB_GID}

# install extra packages for manipulating notebooks programatically
RUN python -m pip install --no-cache-dir nbstripout nbconvert graphviz

# copy the tutorial notebooks into the container and strip them
COPY --chown=1000:100 tutorials ${HOME}/tutorials
RUN find_notebooks | xargs nbstripout

WORKDIR ${HOME}/tutorials

# install HTCondor Python bindings pre-release, when necessary
RUN python -m pip install --no-cache-dir --upgrade htcondor==8.9.10a1
