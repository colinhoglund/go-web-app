#!/bin/bash

cat <<EOF > "${GIT_ROOT}/main.go"
package main

import (
	"log"
	"net/http"
	"os"

	"${GO_MODULE}/internal/server"
)

func main() {
	if err := http.ListenAndServe(os.Getenv("APP_ADDR"), server.New()); err != nil {
		log.Fatal(err)
	}
}
EOF
