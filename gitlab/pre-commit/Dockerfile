# Copyright 2020-2022 Amazon.com, Inc. or its affiliates. All Rights Reserved.
#
# Licensed under the Amazon Software License (the "License"). You may not use this file except in compliance with the License.
# A copy of the License is located at
#
#    http://aws.amazon.com/asl/
#
# or in the "license" file accompanying this file.
# This file is distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, express or implied.
# See the License for the specific language governing permissions and limitations under the License.

ARG PYTHON_VERSION=3.11-alpine
ARG NODE_JS_VERSION=20.11.0-alpine

FROM public.ecr.aws/docker/library/python:${PYTHON_VERSION} AS core
LABEL org.opencontainers.image.authors="Milan Gyalai <m1lth14d3s@gmail.com>"

# Include libstdc++
RUN addgroup -g 1000 precommit \
    && adduser -u 1000 -G precommit -s /bin/sh -D precommit \
    && apk add --no-cache \
        libstdc++ gcc musl-dev libffi-dev \
    && apk add --no-cache --virtual .build-deps \
        curl gnupg tar git bash \
    && python -m ensurepip --upgrade \
    && pip install wheel cffi

#****************      NODEJS     ****************************************************
FROM public.ecr.aws/docker/library/node:${NODE_JS_VERSION} AS nodejs

#****************      END NODEJS     ****************************************************

FROM core

# Move NodeJS official docker files as a layer
COPY --from=nodejs /usr/local /usr

ARG PRE_COMMIT_VERSION=3.6.0
ARG PIPENV=2023.11.17

# Install precommit and utils
RUN pip install pre-commit==${PRE_COMMIT_VERSION} pipenv==${PIPENV}
