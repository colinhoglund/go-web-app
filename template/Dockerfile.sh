#!/bin/bash

cat <<EOF > "${GIT_ROOT}/Dockerfile"
FROM golang:${GO_VERSION}

ENV APP_ADDR ":8080"

WORKDIR /go/src/app
COPY . .

RUN go get -d -v ./...
RUN go install -v ./...

CMD ["${CMD_NAME}"]
EXPOSE 8080
EOF
