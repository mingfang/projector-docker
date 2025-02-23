#!/bin/sh

#
# Copyright 2019-2020 JetBrains s.r.o.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

set -e # Any command which returns non-zero exit code will cause this shell script to exit immediately
set -x # Activate debugging to show execution details: all commands will be printed before execution

# intellij

containerName=${1:-ripper1:5000/projector-idea-c}
downloadUrl=${2:-https://download.jetbrains.com/idea/ideaIU-2021.2.2.tar.gz}

# build container:
DOCKER_BUILDKIT=1 docker build --pull --progress=plain -t "$containerName" --build-arg buildGradle=true --build-arg "downloadUrl=$downloadUrl" -f Dockerfile ..
docker push $containerName

# pycharm community

containerName=${1:-ripper1:5000/projector-pycharm-community}
downloadUrl=${2:-https://download.jetbrains.com/python/pycharm-community-2021.2.1.tar.gz}

# build container:
DOCKER_BUILDKIT=1 docker build --progress=plain -t "$containerName" --build-arg buildGradle=true --build-arg "downloadUrl=$downloadUrl" -f Dockerfile ..
docker push $containerName

# pycharm professional

containerName=${1:-ripper1:5000/projector-pycharm-professional}
downloadUrl=${2:-https://download.jetbrains.com/python/pycharm-professional-2020.2.tar.gz}

# build container:
#DOCKER_BUILDKIT=1 docker build --progress=plain -t "$containerName" --build-arg buildGradle=true --build-arg "downloadUrl=$downloadUrl" -f Dockerfile ..
#docker push $containerName

# datagrip

containerName=${1:-ripper1:5000/projector-datagrip}
downloadUrl=${2:-https://download.jetbrains.com/datagrip/datagrip-2020.2.tar.gz}

# build container:
#DOCKER_BUILDKIT=1 docker build --progress=plain -t "$containerName" --build-arg buildGradle=true --build-arg "downloadUrl=$downloadUrl" -f Dockerfile ..
#docker push $containerName

# rider

containerName=${1:-ripper1:5000/projector-rider}
downloadUrl=${2:-https://download.jetbrains.com/rider/JetBrains.Rider-2020.2.4.tar.gz}

# build container:
#DOCKER_BUILDKIT=1 docker build --progress=plain -t "$containerName" --build-arg buildGradle=true --build-arg "downloadUrl=$downloadUrl" -f Dockerfile ..
#docker push $containerName
