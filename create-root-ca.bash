#!/usr/bin/env bash
set -e

# Root CA file paths
config_filename="root-ca.conf"
key_filename="root-ca/private/root-ca.key"
signing_filename="root-ca/root-ca.csr"
cert_filename="root-ca/root-ca.crt"

# Storage location for intermediate files
mkdir -p root-ca/certs
mkdir -p root-ca/db
mkdir -p root-ca/private
chmod 700 root-ca/private
touch root-ca/db/index

# Give our root CA a unique identifier
openssl rand -hex 16 > "root-ca/db/serial"

# Create the certificate signing request
openssl req -new -config "$config_filename" -out "$signing_filename" -keyout "$key_filename"

# Sign our request
openssl ca -selfsign -config "$config_filename" -in "$signing_filename" -out "$cert_filename" -extensions ca_ext

# Print out information about the created cert
openssl x509 -in "$cert_filename" -text -noout
