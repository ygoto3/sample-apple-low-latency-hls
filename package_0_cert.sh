mkdir -p certs

openssl genrsa \
  -out ./certs/server.key 2048

openssl req -new \
  -key ./certs/server.key \
  -out ./certs/server.csr

openssl x509 -req -days 3650 -in ./certs/server.csr \
  -signkey ./certs/server.key \
  -out ./certs/server.crt

