*This project has been created as part of the 42 curriculum by cgoldens.*


# Inception - 42 Project

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

A Makefile

```bash
make up        # Start containers
make down      # Stop containers
make re        # Rebuild everything
make clean     # Remove containers
make fclean    # Remove containers + volumes
```

### Configuration

* HTTPS using TLSv1.2 or TLSv1.3
* No hardcoded passwords in Dockerfiles
* Environment variables stored in `.env`
* Isolated containers

---

## Resources
- [Official Docker Documentation](https://docs.docker.com/)
- [NGINX SSL Termination Guide](https://docs.nginx.com/nginx/admin-guide/security-controls/terminating-ssl-http/)
- [WordPress CLI Handbook](https://make.wordpress.org/cli/handbook/)

### Use of AI
AI tools were used during this project for the following tasks:
- **SSL Configuration**: Assistance in formatting the `openssl` subject parameters and NGINX TLS protocols.
- **Fixing**: Fixing some little errors.
