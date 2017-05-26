1-1
INSERT INTO athlete VALUES (1, "Afanacii", 175, 70, 10, '1997-06-01');
1-2
INSERT INTO athlete(growth, weight, rating) VALUES (169, 65, 12);
1-3
INSERT INTO perfomance (id_athlete) SELECT (id_athlete) FROM athlete WHERE growth = 175;

2-1
DELETE FROM athlete;
2-2
DELETE FROM athlete WHERE growth < 170
2-3
TRUNCATE TABLE sponsors;

3-1
UPDATE athlete SET growth = growth + 1;
3-2
UPDATE athlete SET growth = growth + 1 WHERE growth = 170;
3-3
UPDATE athlete SET growth = growth + 1, weight = weight + 1 WHERE growth = 170

4-1
SELECT growth FROM athlete;
4-2
SELECT *FROM athlete;
4-3
SELECT *FROM athlete WHERE growth = 171;