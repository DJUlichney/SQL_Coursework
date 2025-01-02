
/* Part 1 - Table Creation: */
create table Building (
	BuildingID varchar(3) primary key,
	BNoOfFloors int not null,
	BManagerID char(3) not null
);

create table CorpClient (
	CCID char(4) primary key,
	CCName varchar(30) not null unique,
	CCIndustry varchar(30) not null,
	CCLocation varchar(30) not null,
	CCIDReferredBy char(4)
);

create table Apartment (
	BuildingID varchar(3) not null,
	AptNo int not null,
	ANoOfBedrooms int not null,
	CCID char(4),
	primary key (BuildingID, AptNo)
);

create table Manager (
	ManagerID char(3) primary key,
	MFName varchar(15) not null,
	MLName varchar(15) not null,
	MBDate date not null,
	MSalary numeric(10, 2) not null,
	MBonus numeric(7, 2),
	MResBuildingID varchar(3) not null
);

create table ManagerPhone (
	ManagerID char(3),
	MPhone char(8),
	primary key (ManagerID, MPhone),
);

create table StaffMember (
	SMemberID char(4) primary key,
	SMemberName varchar(15) not null
);

create table Cleaning (
	BuildingID varchar(3) not null,
	AptNo int not null,
	SMemberID char(4) not null,
	primary key (BuildingID, AptNo, SMemberID)
);

create table Inspector (
	InsID char(3) primary key,
	InsName char(15) not null
);

create table Inspecting (
	InsID char(3) not null,
	BuildingID varchar(3) not null,
	DateLast date not null,
	DateNext date not null,
	primary key (InsID, BuildingID)
);

/* Part 2 - Inserting Information: */
insert into Building values ('B1', 5, 'M12')
insert into Building values ('B2', 6, 'M23')
insert into Building values ('B3', 4, 'M23')
insert into Building values ('B4', 4, 'M34')
select * from Building

insert into CorpClient values ('C111', 'BlingNotes', 'Music', 'Chicago', null)
insert into CorpClient values ('C222', 'SkyJet', 'Airline', 'Oak Park', 'C111')
insert into CorpClient values ('C777', 'WindyCT', 'Music', 'Chicago', 'C222')
insert into CorpClient values ('C888', 'SouthAlps', 'Sports', 'Rosemont', 'C777')
select * from CorpClient

insert into Apartment values ('B1', 41, 1, null)
insert into Apartment values ('B1', 21, 1, 'C111')
insert into Apartment values ('B2', 11, 2, 'C222')
insert into Apartment values ('B2', 31, 2, null)
insert into Apartment values ('B3', 11, 2, 'C777')
insert into Apartment values ('B4', 11, 2, 'C777')
select * from Apartment

insert into Manager values ('M12', 'Boris', 'Grant', '1988-06-06', 60000, null, 'B1')
insert into Manager values ('M23', 'Austin', 'Lee', '1983-02-02', 50000, 5000, 'B2')
insert into Manager values ('M34', 'George', 'Sherman', '1984-07-08', 52000, 2000, 'B4')
select * from Manager

insert into ManagerPhone values ('M12', '555-2222')
insert into ManagerPhone values ('M12', '555-3232')
insert into ManagerPhone values ('M23', '555-9988')
insert into ManagerPhone values ('M34', '555-9999')
select * from ManagerPhone

insert into StaffMember values ('5432', 'Brian')
insert into StaffMember values ('9876', 'Boris')
insert into StaffMember values ('7652', 'Caroline')
select * from StaffMember

insert into Cleaning values ('B1', 21, '5432')
insert into Cleaning values ('B1', 41, '9876')
insert into Cleaning values ('B2', 11, '9876')
insert into Cleaning values ('B2', 31, '5432')
insert into Cleaning values ('B3', 11, '5432')
insert into Cleaning values ('B4', 11, '7652')
select * from Cleaning

insert into Inspector values ('I11', 'Jane')
insert into Inspector values ('I22', 'Niko')
insert into Inspector values ('I33', 'Mick')
select * from Inspector

insert into Inspecting values ('I11', 'B1', '2019-05-05', '2020-05-05')
insert into Inspecting values ('I11', 'B2', '2019-02-02', '2020-02-02')
insert into Inspecting values ('I22', 'B2', '2019-03-04', '2020-02-02')
insert into Inspecting values ('I22', 'B3', '2019-09-08', '2020-03-03')
insert into Inspecting values ('I33', 'B3', '2019-04-04', '2020-04-04')
insert into Inspecting values ('I33', 'B4', '2019-05-05', '2020-04-04')
select * from Inspecting

alter table Manager
	add constraint MResBuildingIDFK
	foreign key (MResBuildingID) references Building(BuildingID)

alter table ManagerPhone
	add constraint ManagerIDFK
	foreign key (ManagerID) references Manager(ManagerID)

alter table Building
	add constraint BManagerIDFK
	foreign key (BManagerID) references Manager(ManagerID)

alter table CorpClient
	add constraint CCIDReferredByFK
	foreign key (CCIDReferredBy) references CorpClient(CCID)

alter table Apartment
	add constraint BuildingIDFK
	foreign key (BuildingID) references Building(BuildingID)

alter table Apartment
	add constraint CCIDFK
	foreign key (CCID) references CorpClient(CCID)

alter table Inspecting
	add constraint InsIDFK
	foreign key (InsID) references Inspector(InsID)

alter table Inspecting
	add constraint InsBuildingIDFK
	foreign key (BuildingID) references Building(BuildingID)

alter table Cleaning
	add constraint ApartmentAndBuildingFK
	foreign key (BuildingID, AptNo) references Apartment(BuildingID, AptNo)

/* This alter statement causes a conflict that remains unresolved. */
alter table Cleaning
	add constraint SMemberIDFK
	foreign key (SMemberID) references StaffMember(SMemberID)

/* Part 3 - Deleting the Tables: */

drop table Cleaning
drop table StaffMember
drop table Inspecting
drop table Inspector
drop table Apartment
drop table CorpClient
drop table ManagerPhone

alter table Manager
	drop constraint MResBuildingIDFK

drop table Building
drop table Manager