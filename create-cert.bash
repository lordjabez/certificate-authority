#!/usr/bin/env bash
set -e

# Name for the certificate and associated file paths
cert_name="$1"
config_filename="$cert_name.conf"
key_filename="$cert_name/$cert_name.key"
signing_filename="$cert_name/$cert_name.csr"
cert_filename="$cert_name/$cert_name.crt"

# Storage location for results
mkdir -p "$cert_name"

# Make a new private key for the certificate
openssl genpkey -out "$key_filename" -algorithm RSA -pkeyopt rsa_keygen_bits:2048

# Using your newly generated private key make a certificate signing request
openssl req -new -config "$config_filename" -key "$key_filename" -out "$signing_filename"

# Print out information about the created request
openssl req -text -noout -verify -in "$signing_filename"

# Sign the above certificate
openssl ca -config "root-ca.conf" -in "$signing_filename" -out "$cert_filename" -extensions client_ext

# Print out information about the created cert
openssl x509 -in "$cert_filename" -text -noout
