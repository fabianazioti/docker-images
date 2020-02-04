#!/usr/bin/env bash

/etc/init.d/postgresql start 12

# Make sure we have a user set up
if [ -z "${POSTGRES_USER}" ]; then
	POSTGRES_USER=postgres
fi

if [ -z "${DEFAULT_ENCODING}" ]; then
  DEFAULT_ENCODING="UTF8"
fi


# Compatibility with official postgres variable
# Official postgres variable gets priority
if [ ! -z "${POSTGRES_PASSWORD}" ]; then
	POSTGRES_PASS=${POSTGRES_PASSWORD}
fi


echo "Setup postgres User:Password"
echo "postgresql user: $POSTGRES_USER" > /tmp/PGPASSWORD.txt
echo "postgresql password: $POSTGRES_PASS" >> /tmp/PGPASSWORD.txt

# Check user already exists
echo "Creating superuser $POSTGRES_USER"
RESULT=`su - postgres -c "psql postgres -t -c \"SELECT 1 FROM pg_roles WHERE rolname = '$POSTGRES_USER'\""`
COMMAND="ALTER"
if [ -z "$RESULT" ]; then
	COMMAND="CREATE"
fi
su - postgres -c "psql postgres -c \"$COMMAND USER $POSTGRES_USER WITH SUPERUSER ENCRYPTED PASSWORD '$POSTGRES_PASS';\""
