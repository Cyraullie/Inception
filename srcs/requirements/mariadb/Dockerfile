FROM debian:bookworm

# installation du serveur
RUN apt-get update && apt-get install -y mariadb-server \
    && rm -rf /var/lib/apt/lists/*

# config des dossiers
RUN mkdir -p /var/run/mysqld \
    && chown -R mysql:mysql /var/run/mysqld \
    && chmod 777 /var/run/mysqld

# Copie du script et de la config ici
COPY ./tools/script.sh /usr/local/bin/
COPY ./conf/50-server.cnf /etc/mysql/mariadb.conf.d/

# permission pour exec le script
RUN chmod +x /usr/local/bin/script.sh

EXPOSE 3306

# run via le script
ENTRYPOINT ["/usr/local/bin/script.sh"]

CMD ["mariadb-safe"]