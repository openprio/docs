CREATE EXTENSION pgcrypto;
CREATE TABLE mqtt_user (
    id serial PRIMARY KEY,
    username text NOT NULL UNIQUE,
    password_hash text NOT NULL,
    is_superuser boolean DEFAULT false,
    created timestamp with time zone DEFAULT NOW()
);

CREATE TYPE ACTION AS ENUM('publish','subscribe','all');
CREATE TYPE PERMISSION AS ENUM('allow','deny');

CREATE TABLE mqtt_acl (
  id SERIAL PRIMARY KEY,
  username CHARACTER VARYING(255) NOT NULL DEFAULT '',
  clientid CHARACTER VARYING(255) NOT NULL DEFAULT '',
  action ACTION,
  permission PERMISSION,
  topic CHARACTER VARYING(255) NOT NULL,
  qos smallint,
  retain smallint
);

CREATE INDEX mqtt_acl_username_idx ON mqtt_acl(username);

