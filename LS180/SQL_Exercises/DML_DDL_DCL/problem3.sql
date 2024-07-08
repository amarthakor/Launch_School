/*

Does the following statement use the DDL or DML component of SQL?

CREATE TABLE things (
  id serial PRIMARY KEY,
  item text NOT NULL UNIQUE,
  material text NOT NULL
);

DDL - We are creating the structure /schema of the table
      not adding / manipulating data itself -- our table is still empty
