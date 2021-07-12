#!/bin/bash

cat <<EOF > "${GIT_ROOT}/Dockerfile"
FROM golang:${GO_VERSION}

ENV APP_ADDR ":${DEFAULT_APP_PORT}"

WORKDIR /go/src/app
COPY . .

RUN go get -d -v ./...
RUN go install -v ./...

CMD ["${CMD_NAME}"]
EXPOSE ${DEFAULT_APP_PORT}
EOF
