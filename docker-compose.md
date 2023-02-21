
#Docker Compose

##Installing Docker Compose

```bash
sudo curl -L "https://github.com/docker/compose/releases/download/1.29.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose

sudo chmod +x /usr/local/bin/docker-compose
```

##Check Version

```bash
docker-compose --version
```


##Installing Docker Compose

```bash
sudo curl -L "https://github.com/docker/compose/releases/download/1.29.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
```

##Sample Docker compose, create and save

```bash
vi docker-compose.yml
```

```bash
version: '3.7'
services:
  web:
    image: nginx:alpine
    ports:
      - "8000:80"
    volumes:
      - ./app:/usr/share/nginx/html
```
##Running Docker Compose

```bash
docker-compose up -d
```

##Check the process

```bash
docker-compose ps
```



