/*

It seems there was a mistake when we were inserting data in the birds table. 
All the crows are actually ravens. 
Update the birds table so that the rows with a species of 'Crow' now read 'Raven'.

UPDATE birds
  SET species = 'Raven'
  WHERE species = 'Crow';

id |   name   | age | species
---+----------+-----+---------
 1 | Charlie  |   3 | Finch
 2 | Allie    |   5 | Owl
 3 | Jennifer |   3 | Magpie
 4 | Jamie    |   4 | Owl
 5 | Roy      |   8 | Raven
(5 rows)
-------------------------------------------------------------

Oops. Jamie isn't an Owl - he's a Hawk. Correct his information.

UPDATE birds
  SET species = 'Hawk'
  WHERE name = 'Jamie'
  AND species = 'Owl';

id |   name   | age | species 
----+----------+-----+---------
  1 | Charlie  |   3 | Finch
  2 | Allie    |   5 | Owl
  3 | Jennifer |   3 | Magpie
  5 | Roy      |   8 | Raven
  4 | Jamie    |   4 | Hawk
  