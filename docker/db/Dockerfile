FROM mysql:5.7
RUN apt-get update && apt-get install -y --no-install-recommends less vim && rm -rf /var/lib/apt/lists/*

RUN touch /var/log/mysqld.log && chmod 666 /var/log/mysqld.log
