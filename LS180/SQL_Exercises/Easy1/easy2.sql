/*
Now that we have an animals database, we can lay the groundwork needed to add some data to it.

Make a table called birds. It should have the following fields:

id (a primary key)
name (string with space for up to 25 characters)
age (integer)
species (a string with room for no more than 15 characters)

CREATE TABLE birds (
  id integer PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
  name varchar(25),
  age integer,
  species varchar(15),
  );
*/