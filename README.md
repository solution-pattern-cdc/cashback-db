### Docker image for cashback db

Run locally:
```
docker run -it --rm -e POSTGRESQL_USER=cashback -e POSTGRESQL_DATABASE=cashback -e POSTGRESQL_PASSWORD=cashback -p 5432:5432 quay.io/solution-pattern-cdc/cashback-db:1.0
```
