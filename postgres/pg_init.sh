#!/bin/bash
set -e

psql -U ${POSTGRES_USER} <<-END
	GRANT ALL PRIVILEGES ON DATABASE ${POSTGRES_DB} TO ${POSTGRES_USER};

	\c ${POSTGRES_DB}

	CREATE TABLE accounts (
		user_id serial PRIMARY KEY,
		username VARCHAR ( 50 ) UNIQUE NOT NULL,
		password VARCHAR ( 50 ) NOT NULL,
		email VARCHAR ( 255 ) UNIQUE NOT NULL,
		created_on TIMESTAMP NOT NULL,
		last_login TIMESTAMP 
	);
END