#!/bin/bash

cat <<EOF > "${GIT_ROOT}/Dockerfile"
FROM golang:${GO_VERSION}

ENV APP_ADDR ":${APP_PORT}"

WORKDIR /go/src/app
COPY . .

RUN go get -d -v ./...
RUN go install -v ./...

CMD ["${CMD_NAME}"]
EXPOSE ${APP_PORT}
EOF
