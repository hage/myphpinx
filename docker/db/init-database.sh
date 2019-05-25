#!/bin/sh
cat dockerentrypoint-initdb.d/001-create-test-tables.sql | mysql -u $MYSQL_USER -p$MYSQL_PASSWORD $MYSQL_DATABASE
