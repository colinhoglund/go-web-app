#!/bin/bash

cat <<EOF > "${GIT_ROOT}/go.mod"
module ${GO_MODULE}

go ${GO_VERSION}
EOF
