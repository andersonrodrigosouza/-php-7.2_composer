
## Run ##

```
docker run -p 3000:3000 andersonrodrigosouza/php-7.2_composer:latest
```

## Compose example ##

```
version: '3'
services:
  api:
    build:
      dockerfile: api
      context: .
    image: andersonrodrigosouza/php-7.2_composer
    container_name: api
    ports:
      - "3000:3000"
    volumes:
     - ./api/sources/:/var/www/
```

## Run using compose ##

```
docker-compose build
docker-compose up
```

## Editing configuration ##

```
docker build -f Dockerfile -t andersonrodrigosouza/php-7.2_composer:latest .
docker push andersonrodrigosouza/php-7.2_composer
```
