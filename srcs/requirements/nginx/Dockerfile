FROM debian:bookworm

RUN apt-get update && apt-get install -y \
    nginx \
    openssl 
    #&& rm -rf /var/lib/apt/lists/*

# dossier pour les certificats
RUN mkdir -p /etc/nginx/ssl

# generation du certificat ssl
# -x509 : Créer un certificat auto-signé
# -nodes : Ne pas mettre de mot de passe sur la clé (sinon Nginx demande le mdp au démarrage)
# -days 365 : Valide 1 an
# -newkey rsa:2048 : Clé RSA 2048 bits
# -subj : Remplit les infos du certificat automatiquement (pas de questions interactives)
RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
    -keyout /etc/nginx/ssl/inception.key \
    -out /etc/nginx/ssl/inception.crt \
    -subj "/C=CH/ST=Vaud/L=Lausanne/O=42/OU=42/CN=cgoldens.42.fr/UID=cgoldens"

# config de nginx
RUN mkdir -p /var/run/nginx

# copie de notre fichier de config
COPY ./conf/nginx.conf /etc/nginx/conf.d/default.conf

# exposition du port 443
EXPOSE 443

# on lance nginx au premier plan
CMD ["nginx", "-g", "daemon off;"]