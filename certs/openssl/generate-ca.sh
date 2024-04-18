#!/bin/bash

# Parameterized settings
DAYS=365
KEY_LENGTH=2048

# Environment variable validation
if [ -z "$DOMAIN_NAME" ] || [ -z "$SUB_DOMAIN_NAME" ]; then
    DOMAIN_NAME="127.0.0.1.nip.io"
    SUB_DOMAIN_NAME="*"
fi

SUBJ="/O=$DOMAIN_NAME Inc./CN=$DOMAIN_NAME"


# Generate main domain certificate
openssl req -x509 -sha256 -nodes -days $DAYS -newkey rsa:$KEY_LENGTH -subj "$SUBJ" -keyout "$DOMAIN_NAME.key" -out "$DOMAIN_NAME.crt"

# Generate subdomain certificate request
openssl req -out "$SUB_DOMAIN_NAME.$DOMAIN_NAME.csr" -newkey rsa:$KEY_LENGTH -nodes -keyout "$SUB_DOMAIN_NAME.$DOMAIN_NAME.key" -subj "/CN=$SUB_DOMAIN_NAME.$DOMAIN_NAME/O=$SUB_DOMAIN_NAME from $DOMAIN_NAME"

# Issue subdomain certificate
openssl x509 -req -days $DAYS -CA "$DOMAIN_NAME.crt" -CAkey "$DOMAIN_NAME.key" -set_serial 0 -in "$SUB_DOMAIN_NAME.$DOMAIN_NAME.csr" -out "$SUB_DOMAIN_NAME.$DOMAIN_NAME.crt"

# Clean up temporary files (example; adjust as needed)
# rm $SUB_DOMAIN_NAME.$DOMAIN_NAME.csr