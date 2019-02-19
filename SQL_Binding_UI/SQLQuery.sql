CREATE TABLE EMTS_User(
	[ID] int IDENTITY(1,1) PRIMARY KEY NOT NULL,
	[USERNAME] varchar(500),
	[Depot_Name] VARCHAR(500) 
)

INSERT INTO EMTS_User Values ('User1','Dilshad Garden')
INSERT INTO EMTS_User Values ('User2','Noida')
INSERT INTO EMTS_User Values ('User3','Shahadra')
INSERT INTO EMTS_User Values ('User4','Shastri Park')
INSERT INTO EMTS_User Values ('User5','Kasmeri Gate')
INSERT INTO EMTS_User Values ('User6','Anand Vihar')
INSERT INTO EMTS_User Values ('Admin','EMTS_HO')


SELECT * from EMTS_User

CREATE TABLE EMTS_Depot(
	[ID] int IDENTITY(1,1)NOT NULL,
	[Depot] VARCHAR(500)  PRIMARY KEY NOT NULL
)

INSERT INTO EMTS_Depot VALUES('Dilshad Garden')
INSERT INTO EMTS_Depot VALUES('Kashmeri Gate')
INSERT INTO EMTS_Depot VALUES('Anand Vihar')
INSERT INTO EMTS_Depot VALUES('Mori Gate')
INSERT INTO EMTS_Depot VALUES('Paschim Vihar')
INSERT INTO EMTS_Depot VALUES('Dwarka')
INSERT INTO EMTS_Depot VALUES('Punjabi Bagh')
INSERT INTO EMTS_Depot VALUES('Saket')

Select * from EMTS_Depot Order by ID

UPDATE EMTS_User SET [USERNAME] = 'User6' where [Depot_Name] = 'Anand Vihar'

DELETE from EMTS_User WHERE [Depot_Name] = 'Anand Vihar'

USE master
GO

CREATE PROCEDURE spGetDepotUsers
AS

BEGIN
	SELECT USERNAME from EMTS_User
END
GO

CREATE PROCEDURE spGetDepotList @username varchar(500)
AS
BEGIN
	SELECT USERNAME,Depot_name
	INTO #tempTable
	FROM EMTS_User
	INNER JOIN EMTS_Depot
	ON EMTS_User.Depot_Name = EMTS_Depot.Depot;

	SELECT [USERNAME],[Depot_name] from #tempTable where [USERNAME]=@username
END
GO

drop table #tempTable

SELECT USERNAME,Depot_name
FROM EMTS_User
INNER JOIN EMTS_Depot
ON EMTS_User.Depot_Name = EMTS_Depot.Depot;

select * from EMTS_Depot order by ID
Select * from EMTS_User