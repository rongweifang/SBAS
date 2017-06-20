Create table Base_ClientType(
Id int identity,
TypeNo nvarchar(20) primary key,
Name nvarchar(50) not null,
CreateTime datetime 
)

create table Base_Client_Level(
Id int identity,
LevelNo nvarchar(20) primary key,
LevelName nvarchar(30),
CreateTime datetime
)