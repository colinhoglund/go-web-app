#!/bin/bash

cat <<EOF > "${GIT_ROOT}/build/Dockerfile-test"
FROM golangci/golangci-lint:v1.38.0-alpine as cache
ENV GOLANGCI_LINT_CACHE /root/.cache/go-build
WORKDIR \$GOPATH/src/${GO_MODULE}

# download modules and build cache
COPY . .

RUN apk update \
 && apk add make \
 && go mod download \
 && golangci-lint run --timeout=5m \
 && go test ./...
EOF
