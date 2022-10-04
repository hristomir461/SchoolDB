--Създаване на база-данни--
CREATE DATABASE SchoolDB
GO
USE SchoolDB

--Създаване на таблиците--

GO
CREATE TABLE Speciality(
	Id INT PRIMARY KEY IDENTITY,
	[Name] VARCHAR(16) NOT NULL UNIQUE,
	[Description] VARCHAR(1024),
	[GraduatesTitle] VARCHAR(32) NOT NULL UNIQUE,
	[Languages] VARCHAR(128) NOT NULL,
	[StartGrade] INT CHECK (StartGrade BETWEEN 1 AND 12) NOT NULL,
	[EndGrade] INT CHECK (EndGrade BETWEEN 1 AND 12) NOT NULL,
);
GO
CREATE TABLE Classes(
	Id INT PRIMARY KEY IDENTITY,
	[Grade] INT CHECK (Grade BETWEEN 1 AND 12) NOT NULL,
	[GradeLetter] VARCHAR(1) CHECK (GradeLetter = 'A' OR GradeLetter = 'B' OR GradeLetter = 'C' OR GradeLetter = 'D') NOT NULL,
	[SpecialityID] INT NOT NULL,
	CONSTRAINT FK_Class_Speciality FOREIGN KEY (SpecialityID) REFERENCES Speciality(Id),
);
CREATE TABLE Students(
	Id uniqueidentifier NOT NULL DEFAULT newid(),
	[FirstName] VARCHAR(16) NOT NULL,
	[SurName] VARCHAR(16),
	[LastName] VARCHAR(16) NOT NULL,
	[GSM] VARCHAR(16) NOT NULL,
	[Email] NVARCHAR(32) NOT NULL UNIQUE,
	[Address] VARCHAR(64) NOT NULL,
	[Age] INT CHECK (Age BETWEEN 8 AND 20) NOT NULL,
	[Gender] BIT NOT NULL,
	[ClassID] INT NOT NULL,
	CONSTRAINT FK_Student_Classes FOREIGN KEY (ClassID) REFERENCES Classes(Id),
);
GO
CREATE TABLE Teachers(
	Id uniqueidentifier NOT NULL DEFAULT newid(),
	[FirstName] VARCHAR(16) NOT NULL,
	[LastName] VARCHAR(16) NOT NULL,
	[Gender] BIT NOT NULL,
	[Email] NVARCHAR(32) NOT NULL UNIQUE,	
	[Subjects] VARCHAR(64),
	[ManagedClassID] INT,
	CONSTRAINT FK_Teacher_Class FOREIGN KEY (ManagedClassID) REFERENCES Classes(Id),
);

--Попълване на таблиците--

GO
INSERT INTO 
Speciality([Name], [Description], [GraduatesTitle], [Languages], [StartGrade], [EndGrade])
VALUES 
('Програмиране', 'Професията "Приложен програмист" развива дигиталните умения на учениците. Изучават се съвременните езици за програмиране и технологии за разработка на софтуер.', 'Приложен програмист', 'Английски и Руски', 8, 12),
('Компютърна тех', 'Информационните технологии се развиват бързо и навлизат във всички области и сектори на икономиката в страната.', 'Техник на компютърни системи', 'Английски и Руски', 8, 12),
('Автомобилна мех', 'Автомобилната мехатроника е интердисциплинарна специалност, която включва следните компоненти: механични системи – механизми, устройства, възли, сглобени единици; електронни системи – датчици, микроелектроника, електромеханика; информационни системи – компютърна техника, софтуер.', 'Техник на транспортна техника', 'Английски и Руски', 8, 12)
GO
INSERT INTO 
Classes([Grade], [GradeLetter], [SpecialityID])
VALUES 
(11, 'A', 1),
(8, 'B', 3)
GO
INSERT INTO 
Students([FirstName], [SurName], [LastName], [GSM], [Email], [Address], [Age], [Gender], [ClassID])
VALUES 
('Петко', 'Иванов', 'Димитров', '097-124-435', 'petko@gmail.com', 'София, Люлин', 17, 1, 1),
('Живко', null, 'Добрев', '093-222-347', 'jivko@gmail.com', 'Шумен, Тракиа', 17, 1, 1),
('Андрей', null, 'Христов', '027-432-735', 'andrei@gmail.com', 'Пловдив, Изгрев', 14, 1, 2),
('Адам', null, 'Адамов', '014-176-225', 'adam@gmail.com', 'Шумен, Център', 14, 1, 2),
('Илонка', null, 'Андреева', '014-122-337', 'ilonka@gmail.com', 'Варна, Изгрев', 14, 0, 2),
('Васко', 'Азов', 'Джамбазов', '069-934-469', 'vasko@gmail.com', 'Тарговище, Боровец', 17, 1, 1),
('Вълчо', null, 'Пирона', '015-638-332', 'vulcho@gmail.com', 'Варна, Левски', 14, 1, 2),
('Динко', null, 'Ловеца', '012-331-836', 'dinko@gmail.com', 'Ямбол, Изток', 17, 1, 1),
('Кичка', 'Морунова', 'Бодурова', '074-321-739', 'kichka@gmail.com', 'Пловдив, Тракиа', 14, 0, 2),
('Крум', null, 'Велики', '041-472-279', 'krum@gmail.com', 'Шумен, Център', 14, 1, 2)
GO
INSERT INTO 
Teachers([FirstName], [LastName], [Gender], [Email], [Subjects], [ManagedClassID])
VALUES 
('Иванка', 'Сашкова', 0, 'ivanka@gmail.com', 'Английски', 1),
('Перчо', 'Перчев', 1, 'percho@gmail.com', 'Руски', 2),
('Мима', 'Маринова', 0, 'mima@gmail.com', 'Автомобилна техника', null)

--Показване на данните в таблиците--

GO
SELECT * FROM Classes
SELECT * FROM Speciality
SELECT * FROM Students
SELECT * FROM Teachers