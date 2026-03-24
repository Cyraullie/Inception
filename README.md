*This project has been created as part of the 42 curriculum by cgoldens.*


## Description

**Inception** is a system administration project from the 42 curriculum. Its goal is to introduce virtualization and containerization concepts using Docker.

The project consists of setting up a secure and functional infrastructure composed of multiple Docker containers, orchestrated using Docker Compose.

The infrastructure is composed of the following services:

* **NGINX** → Web server with TLSv1.2 or TLSv1.3 (HTTPS)
* **WordPress** → Web application running with PHP-FPM
* **MariaDB** → Database server

---

## Instructions

### Compilation and execution

A Makefile at the root of the repository to handle the antire lifecycle of the application:

```bash
make up        # Start containers
make down      # Stop containers
make re        # Rebuild everything
make clean     # Remove containers
make fclean    # Remove containers + volumes
```

### Configuration

1. Ensure a .env file is present in the srcs/ directory with all necessary credentials.
2. Update your local /etc/hosts file to map the domain: 127.0.0.1 cgoldens.42.fr
3. Access the site at: https://cgoldens.42.fr


---

## Technical Comparisons
### Virtual Machines vs Docker
- **Virtual Machines**: Emulate an entire hardware system, including a full guest operating system. This results in high resource consumption and slow startup times.
- **Docker**: Utilizes containerization to share the host's OS kernel. It is lightweight, starts almost instantly, and ensures environment consistency across different machines.

### Secrets vs Environment Variables
- **Environment Variables**: Great for non-sensitive configuration but can be exposed via process listings or Docker inspection.
- **Secrets**: Specifically designed to handle sensitive data (passwords, keys). They are encrypted and only accessible to the authorized services at runtime, providing a higher level of security.

### Docker Network vs Host Network
- **Host Network**: The container shares the host's networking namespace directly, exposing all container ports to the host's IP.
- **Docker Network (Bridge)**: Provides an isolated network for containers. Services can communicate with each other using container names, while only specific ports (like 443 for NGINX) are exposed to the outside world.

### Docker Volumes vs Bind Mounts
- **Bind Mounts**: Rely on the specific directory structure of the host machine, making them less portable.
- **Docker Volumes**: Managed by Docker itself. In this project, we use **Named Volumes** with a local driver to ensure data persists in the mandatory `/home/cgoldens/data` directory while remaining managed by the Docker engine.



---

## Resources
- [Official Docker Documentation](https://docs.docker.com/)
- [NGINX SSL Termination Guide](https://docs.nginx.com/nginx/admin-guide/security-controls/terminating-ssl-http/)
- [WordPress CLI Handbook](https://make.wordpress.org/cli/handbook/)

### Use of AI
AI tools were used during this project for the following tasks:
- **SSL Configuration**: Assistance in formatting the `openssl` subject parameters and NGINX TLS protocols.
- **Fixing**: Fixing some little errors.
