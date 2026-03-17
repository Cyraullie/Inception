FROM debian:bullseye-slim

# installation de tout
# - php8.2-fpm : Le moteur PHP qui va exécuter le code WordPress
# - php8.2-mysql : Le module pour que PHP puisse parler à MariaDB
# - mariadb-client : Pour avoir la commande 'mariadb-admin ping' (attendre la DB)
# - curl : Pour télécharger WP-CLI
RUN apt-get update && apt-get install -y \
    php8.2-fpm \
    php8.2-mysql \
    mariadb-client \
    curl \
    && rm -rf /var/lib/apt/lists/*

# installation de wp-cli qui permet d'installer WordPress en ligne de commande.
# telecharge, on le rend exécutable (+x) et on le déplace dans les commandes système.
RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar \
    && chmod +x wp-cli.phar \
    && mv wp-cli.phar /usr/local/bin/wp

# PHP-FPM a besoin que ce dossier existe pour stocker son fichier PID, sinon il plante au démarrage.
RUN mkdir -p /run/php

# copie des configs
# On copie notre config PHP personnalisée (qui force l'écoute sur le port 9000)
COPY ./conf/www.conf /etc/php/8.2/fpm/pool.d/www.conf
# On copie le script qui va lancer l'installation au démarrage
COPY ./tools/auto_config.sh /usr/local/bin/

# on donne les permissions pour executer le script
RUN chmod +x /usr/local/bin/auto_config.sh

# On se place dans le dossier où le site sera installé (c'est ici que le volume sera monté)
WORKDIR /var/www/html

# ce conteneur ecoutera sur le port 9000
EXPOSE 9000

# lancement du script au demarrage
ENTRYPOINT ["/usr/local/bin/auto_config.sh"]