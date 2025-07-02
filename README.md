
# Docker Demo for Developers @ ERNI

This repository demonstrates how to use Docker and Docker Compose for local development, with a focus on live code reloading and containerized workflows. It is intended for a developer-oriented Docker demo at ERNI.

## Purpose

Showcase how Docker Compose can:
- Run multiple services (Python web app, WordPress, database, Traefik reverse proxy)
- Enable live code changes using volume mounts
- Simplify local development and testing

## How It Works

- The `web` service runs a simple Flask app (Python) with live reload enabled.
- The `my-web` folder is mounted into the container, so changes in your IDE are instantly reflected in the running app.
- Traefik acts as a reverse proxy, routing traffic to the correct service.
- WordPress and MariaDB are included to show multi-service orchestration.

## Usage

1. **Clone this repository**
  ```sh
  git clone <repo-url>
  cd docker-demo
  ```

2. **Start all services**
  ```sh
  docker-compose up -d --build
  ```

3. **Add hosts to /etc/hosts**
  ```sh
  sudo echo "127.0.0.1 web.localhost >> /etc/hosts"
  sudo echo "127.0.0.1 wordpress.localhost >> /etc/hosts"
  ```

4. **Access the web app**
  - Open [http://web.localhost](http://web.localhost) in your browser.
  - Edit files in `my-web/` (e.g., `templates/index.html`). Refresh the browser to see changes instantly.

5. **Access WordPress**
  - Open [http://wordpress.localhost](http://wordpress.localhost)

6. **Traefik Dashboard**
  - Open [http://localhost:8080](http://localhost:8080)

---

**This demo is for educational purposes at ERNI.**
