/*
When we initially created our birds table, we forgot to take into account 
a key factor: preventing certain values from being entered into the database. 
For instance, we would never find a bird that is negative n years old. We 
could have included a constraint to ensure that bad data isn't entered for 
a database record, but we forgot to do so.

For this exercise, write some code that ensures that only birds with a positive
age may be added to the database. Then write and execute an SQL statement to 
check that this new constraint works correctly.

- add constraint to age that only takes positive numbers
ALTER TABLE birds
ADD CONSTRAINT check_age
CHECK (age > 0);

INSERT INTO birds (name, age, species)
VALUES
('Frank', -2, 'Owl');
->
ERROR:  new row for relation "birds" violates check constraint "check_age"
DETAIL:  Failing row contains (6, Frank, -2, Owl).
