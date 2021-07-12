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
	addr := os.Getenv("APP_ADDR")
	if addr == "" {
		addr = ":${DEFAULT_APP_PORT}"
	}

	log.Printf("Starting server on %s\n", addr)
	log.Fatalln(http.ListenAndServe(addr, server.New()))
}
EOF
