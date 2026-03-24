# User Documentation - Inception
## Services Provides
This infrastructure provides a complete web hosting stack:
* **NGINX**: A high-performance web server acting as the secure entry point (HTTPS).
* **WordPress**: The content management system (CMS) to manage your website.
* **MariaDB**: The database engine that stores all your website's data.


## How to start and stop the project

The project is handled with a Makefile located at the root of the repository.
* **To start the project** : open your terminal and run :
```
make 
```
* **To stop the project** : run :
```
make down
```

## Accessing the website and admin panel
### Prerequisites
Before accessing the site, you must ensure that your local machine recognizes the domain name. Add the following line to your `/etc/hosts` file:
`127.0.0.1 cgoldens.42.fr`

### URLs
* **Main Website**: [https://cgoldens.42.fr](https://cgoldens.42.fr)
* **WordPress Admin Panel**: [https://cgoldens.42.fr/wp-admin](https://cgoldens.42.fr/wp-admin)


## Managing Credentials
All sensitive informations and credentials (usernames, passwords, databases data) are stored in the environment file: **`./srcs/.env`**.<br/>
**Informations**: For security reasons, the **`.env`** file is not included in the Git repository and must be managed locally.<br/>
An **example environment file** is provided as **`./srcs/example.env`**, containing all required variable names **without sensitive data**, so you can copy it to **`.env`** and fill in your own credentials.


## Checking service status
To verify that all services are running correctly, you can use the following command :
```
docker ps
```
