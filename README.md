# Docker Demo for Developers @ ERNI

This repository demonstrates Docker and Docker Compose for local development, live code reloading, container orchestration, and observability. Intended for a developer-oriented Docker demo at ERNI.

## Demo Slides

Slides for this demo [can be found here](https://app.mural.co/t/vic6891/m/vic6891/1751354007942/1dce0cb11d2a77d331a1eca470a2d3b0831a1f57?sender=u248506648a704dfecee33067).

## Purpose

Showcase how Docker Compose can:
- Run multiple services (Flask web app, WordPress, MariaDB, Traefik, Portainer, Prometheus, Grafana)
- Enable live code changes using volume mounts
- Simplify local development, testing, and monitoring
- Provide a visual management UI (Portainer) and observability stack (Prometheus + Grafana)

## How It Works

- The `web` service runs a Flask app with live reload enabled. The `my-web` folder is mounted for instant code changes.
- Traefik acts as a reverse proxy, routing traffic to all services by hostname.
- WordPress and MariaDB demonstrate multi-service orchestration.
- Portainer provides a web UI for managing containers.
- Prometheus scrapes metrics (including from Traefik), and Grafana visualizes them.

## Usage

1. **Clone this repository**
   ```sh
   git clone <repo-url>
   cd docker-demo
   ```

2. **Add hostnames to /etc/hosts**
   ```sh
   echo -e "127.0.0.1 web.localhost\n127.0.0.1 wordpress.localhost\n127.0.0.1 portainer.localhost\n127.0.0.1 grafana.localhost" | sudo tee -a /etc/hosts
   ```

3. **Create a .env file, and add these environment variables to it**

   Do note that the `.env` file is gitignored.

   ```bash
   WORDPRESS_DB_HOST=db
   WORDPRESS_DB_NAME=wp
   WORDPRESS_DB_USER=wp
   WORDPRESS_DB_PASSWORD=wp
   MYSQL_ROOT_PASSWORD=root
   MYSQL_DATABASE=wp
   MYSQL_USER=wp
   MYSQL_PASSWORD=wp
   GF_SECURITY_ADMIN_USER=admin
   GF_SECURITY_ADMIN_PASSWORD=admin
   ```

   > ℹ️ Default passwords are being used, as this is intended for educational purposes only on a local machine. **Never use this in production! Ever!**

4. **Start all services**
   ```sh
   docker-compose up -d --build
   ```


5. **Access the services:**
   - Flask web app: [http://web.localhost](http://web.localhost)
   - WordPress: [http://wordpress.localhost](http://wordpress.localhost)
   - Portainer UI: [http://portainer.localhost:9000](http://portainer.localhost:9000)
   - Traefik dashboard: [http://localhost:8080](http://localhost:8080)
   - Grafana: [http://grafana.localhost:3000](http://grafana.localhost:3000)
   - Prometheus: [http://localhost:9090](http://localhost:9090)

6. **Live code reload**
   - Edit files in `my-web/` (e.g., `templates/index.html`). Refresh the browser to see changes instantly.

7. **Metrics and Observability**
   - Prometheus scrapes metrics from Traefik at [http://localhost:9100/metrics](http://localhost:9100/metrics)
   - Grafana dashboards can be configured to visualize these metrics.

8. **Container Management**
   - Use Portainer to visually manage and inspect your containers, images, and volumes.

9. **Stop all services**
   ```sh
   docker-compose down
   ```

## Advanced: Multistage Docker Build

To build and run the Flask app using the multistage Dockerfile:
```sh
docker build -f my-web/multistage.Dockerfile -t my-web-multistage ./my-web
docker run --name my-web-demo-multistage -d -p 5000:5000 my-web-multistage
```

---

**This demo is for educational purposes at ERNI.**
