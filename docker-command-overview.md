# Docker command overview

## Common Docker Commands

### 1. Build an Image
```sh
docker build -t my-web ./my-web
```

### 2. List Images
```sh
docker image ls
```

### 2b. Tag an Image
```sh
docker tag my-web korrd2/my-web:custom-tag
```

### 2c. Push an Image to a remote repository
```sh
docker docker push korrd2/my-web:custom-tag
```

### 3. Run a Container
```sh
docker run --name my-web-demo -d -p 5000:5000 korrd2/my-web:custom-tag
```

### 3b. Run a Container in Detached Mode
```sh
docker run --name my-web-demo -d -p 5000:5000 korrd2/my-web:custom-tag
```

### 4. List Running Containers
```sh
docker ps
```

### 5. List All Containers (including stopped)
```sh
docker ps -a
```

### 6. View Container Logs
```sh
docker logs my-web-demo
```

### 6b. Show Logs for a Running Container (live)
```sh
docker logs -f my-web-demo
```

### 7. Execute a Command in a Running Container
```sh
docker exec -it my-web-demo /bin/sh
```

### 8. Stop a Container
```sh
docker stop my-web-demo
```

### 9. Remove a Container
```sh
docker rm my-web-demo
```

### 10. Remove an Image
```sh
docker image rm korrd2/my-web:custom-tag
```

---

## Docker Compose Shortcuts

### Start All Services
```sh
docker-compose up --build -d
```

### Stop All Services
```sh
docker-compose down
```

### View Compose Service Logs
```sh
docker-compose logs -f
```

---

## Docker Scout Commands (Image Analysis & Security)

### Analyze a Local Image
```sh
docker scout quickview korrd2/my-web:3.12
```

### Compare Two Images
```sh
docker scout compare --to korrd2/my-web:3.11 korrd2/my-web:3.12
```

### Get a Detailed CVE Report
```sh
docker scout cves korrd2/my-web:3.12
```

### Check Recommendations for an Image
```sh
docker scout recommendations korrd2/my-web:3.12
```

---

## Multistage Dockerfile Commands

### Build an Image Using a Custom Dockerfile (e.g., Multistage)
```sh
docker build -f my-web/multistage.Dockerfile -t my-web-multistage ./my-web
```

### Run a Container from the Multistage Image
```sh
docker run --name my-web-demo-multistage -d -p 5000:5000 my-web-multistage
```
