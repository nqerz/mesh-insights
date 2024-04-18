#!/bin/bash

CERT_DIR=$(dirname "*.127.0.0.1.nip.io")

if [[ ! -d "$CERT_DIR" ]]; then
  mkdir -p "$CERT_DIR" || { echo "Failed to create directory: $CERT_DIR"; exit 1; }
fi

TEMP_CSR_FILE=$(mktemp)
TEMP_PROFILE_FILE=$(mktemp)

cleanup() {
  # shellcheck disable=SC2317
  rm -f "$TEMP_CSR_FILE" "$TEMP_PROFILE_FILE"
}

trap cleanup EXIT

cat > "$TEMP_CSR_FILE" <<EOF
{
    "CN": "127.0.0.1.nip.io",
    "key": {
        "algo": "rsa",
        "size": 2048
    },
    "names": [
        {
            "C": "CN",
            "ST": "Shanghai",
            "L": "Shanghai"
        }
    ]
}
EOF

cat > "$TEMP_PROFILE_FILE" <<EOF
{
  "signing": {
    "profiles": {
      "peer": {
        "usages": ["client auth","server auth"],
        "expiry": "8760h"
      },
      "server": {
        "usages": ["server auth"],
        "expiry": "8760h" 
      },
    
      "client": {
        "usages": ["client auth"],
         "expiry": "8760h"
      }
   }
  }
}
EOF

if [[ ! -f "127.0.0.1.nip.io.pem" || ! -f "127.0.0.1.nip.io-key.pem" ]]; then
  cfssl gencert -initca "$TEMP_CSR_FILE" | cfssljson -bare "127.0.0.1.nip.io"
fi

HOST_CSR_CONTENTS=$(cat <<-EOF
{
  "CN": "*.127.0.0.1.nip.io",
  "hosts": [
    "*.127.0.0.1.nip.io", 
    "localhost", 
    "127.0.0.1"
  ],
  "key": {
    "algo": "rsa",
    "size": 2048
  },
  "names": [
    {
      "C": "CN",
      "L": "Shanghai",
      "ST": "Shanghai"
    }
  ]
}
EOF
)

if [[ ! -f "*.127.0.0.1.nip.io.pem" ]]; then
  echo "$HOST_CSR_CONTENTS" > hosts-csr.json
  cfssl gencert -loglevel=1 -ca "127.0.0.1.nip.io.pem" -ca-key "127.0.0.1.nip.io-key.pem" \
    --config "$TEMP_PROFILE_FILE" --profile peer hosts-csr.json  | cfssljson -bare "*.127.0.0.1.nip.io"
fi

chmod 600 "*.127.0.0.1.nip.io.pem" "*.127.0.0.1.nip.io-key.pem"

exit 0