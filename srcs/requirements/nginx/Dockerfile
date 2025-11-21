FROM nginx:alpine

# Copie ta configuration Nginx personnelle
COPY conf /etc/nginx/conf.d

# Copie éventuellement tes certificats SSL
# COPY ssl /etc/nginx/ssl

# Copie les fichiers de ton site (WordPress sera monté par le volume)
# COPY html /var/www/html

# Expose le port HTTP
EXPOSE 80

# Commande Nginx standard
CMD ["nginx", "-g", "daemon off;"]
