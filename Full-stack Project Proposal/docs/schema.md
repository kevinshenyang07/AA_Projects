# Schema Information

## users
column name     | data type | details
----------------|-----------|-----------------------
id              | integer   | not null, primary key
username        | string    | not null, indexed, unique
email           | string    | not null, indexed, unique
password_digest | string    | not null
session_token   | string    | not null, indexed, unique
cart_id         | integer   | foreign key (references cart)

## items
column name | data type   | details
------------|-------------|-----------------------
id          | integer     | not null, primary key
title       | string      | not null
producer    | string      | not null
price       | decimal(,2) | not null
category    | string      | not null
quantity    | integer     | not null
description | text        | not null

## reviews
column name | data type | details
------------|-----------|-----------------------
id          | integer   | not null, primary key
user_id     | integer   | not null, foreign key (references users), indexed
item_id     | integer   | not null, foreign key (references items), indexed
body        | text      | not null
stars       | integer   | not null

## cart
column name | data type | details
------------|-----------|-----------------------
id          | integer   | not null, primary key
user_id     | integer   | not null
purchased   | boolean   | not null, default: false

## cart_items
column name | data type | details
------------|-----------|-----------------------
id          | integer   | not null, primary key
cart_id     | integer   | not null
item_id     | integer   | not null
quantity    | integer   | not null
