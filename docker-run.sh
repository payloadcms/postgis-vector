docker run --rm \
  -e POSTGRES_USER=devuser \
  -e POSTGRES_PASSWORD=devpassword \
  -e POSTGRES_DB=mydb \
  -e PAYLOAD_DATABASE=postgres \
  -p 5433:5432 \
  pgvectortest:latest
