--1. �������� ���������� (COMMIT)
START TRANSACTION;
INSERT INTO organization VALUES(NULL, 'Gel', 4, 300);
INSERT INTO organization VALUES(NULL, 'Belt', 5, 100);
INSERT INTO organization VALUES(NULL, 'Baldur', 12, 450);
COMMIT;
--2. ���������� � ������� (ROLLBACK)
START TRANSACTION;
INSERT INTO organization VALUES(NULL, 'Lel', 2, 230);
INSERT INTO organization VALUES(NULL, 'Coll', 7, 1230);
ROOLBACK;
INSERT INTO organization VALUES(NULL, 'Coldr', 4, 423);
COMMIT;
--3. ������� �������� ��������� � ����������� � ������� ��
DELIMETER //
CREATE PROCEDURE allWorkers(OUT allWork INT)
BEGIN
    SELECT SUM(number_worker) INTO allWork FROM organization;
END;
//
DELIMETER ;
CALL allWorkers(@a);
SELECT @a;

--4. ������� ������� � ������� ���
DELIMETER |
CREATE TRIGGER trig AFTER INSERT ON organization
SELECT * FROM organization;
|
DELIMETER;
INSERT INTO organization VALUES(NULL, 'Baal', 6, 170);
