# Generate a passphrase
openssl rand -base64 48 > server-passphrase.txt

# Generate a Private Key
openssl genrsa -aes128 -passout file:server-passphrase.txt -out server.key 2048

# Generate a CSR (Certificate Signing Request)
openssl req -new -passin file:server-passphrase.txt -key server.key -out server.csr \
    -subj "/C=IN/O=UP/OU=4 lane local SSL cert/CN=*.4lane.com"

# Remove Passphrase from Key
cp server.key server.key.org
openssl rsa -in server.key.org -passin file:server-passphrase.txt -out certs/proxy.key

# Generating a Self-Signed Certificate for 100 years
openssl x509 -req -days 36500 -in server.csr -signkey server.key -out certs/proxy.crt