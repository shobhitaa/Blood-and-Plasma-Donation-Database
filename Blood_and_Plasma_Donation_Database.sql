use blood_plasma_donation;
show tables;

create table Administrator(
	A_ID varchar(10),
    username varchar(20) not null,
    passwd varchar(20) not null,
    PRIMARY KEY (A_ID)
);

INSERT INTO Administrator VALUES ("A1", "admin1", "1234");
INSERT INTO Administrator VALUES ("A2", "admin2", "2345");
INSERT INTO Administrator VALUES ("A3", "admin3", "3456");

create table Hospital(
	H_ID varchar(10),
    HName varchar(30),
    Location varchar(50),
    A_ID varchar(10),
    PRIMARY KEY (H_ID),
    FOREIGN KEY (A_ID) REFERENCES Administrator(A_ID)
);

INSERT INTO Hospital VALUES ("H1", "ECHS", "Gurgaon", "A1");
INSERT INTO Hospital VALUES ("H2", "AIIMS", "Delhi", "A2");
INSERT INTO Hospital VALUES ("H3", "Fortis", "Noida", "A3");
INSERT INTO Hospital VALUES ("H3", "Fortis", "Noida", "A3");

create table BloodBank(
	B_ID varchar(10),
    B_Name varchar(30),
    Contact_no int,
    B_Location varchar(50),
    A_ID varchar(10),
    H_ID varchar(10),
    PRIMARY KEY (B_ID),
    FOREIGN KEY (A_ID) REFERENCES Administrator(A_ID),
    FOREIGN KEY (H_ID) REFERENCES Hospital(H_ID)
);

INSERT INTO BloodBank VALUES ("B1", "Warrior Blood Bank", 12345678, "Gurgaon", "A1", "H1");
INSERT INTO BloodBank VALUES ("B2", "AIIMS Blood Center", 98765432, "Delhi", "A2", "H2");
INSERT INTO BloodBank VALUES ("B3", "Fortis Blood Bank", 13582469, "Noida", "A3", "H3");
INSERT INTO BloodBank VALUES ("B4", "Marvel Blood Center", 28475638, "Delhi", NULL, NULL);

CREATE TABLE Donor(
	D_ID	Varchar(10),
	D_firstname	Char(20),
	D_lastname	Char(20),
	DBloodGroup	Varchar(4),
	DAge	Int,
	DGender	Char(12),
	DPhoneNumber	Int,
	DAddress	Varchar(50),
    PRIMARY KEY (D_ID)
);

CREATE TABLE Patients(
	P_ID	Varchar(10),
	P_firstname	Char(20),
	P_lastname	Char(20),
	PBloodGroup	Varchar(4),
	P_Age	Int,
	PGender	Char(12),
	PPhoneNumber	Int,
	PAddress	Varchar(50),
	H_ID	Varchar(10),
    PRIMARY KEY (P_ID),
    FOREIGN KEY (H_ID) REFERENCES Hospital(H_ID)
);

CREATE TABLE Takes_from(
	B_ID	Varchar(10),
	D_ID	Varchar(10),
	Donation	Char(10) NOT NULL,
	DonationDate	Date NOT NULL,
    PRIMARY KEY(B_ID, D_ID, DonationDate),
    FOREIGN KEY (B_ID) REFERENCES BloodBank(B_ID),
    FOREIGN KEY (D_ID) REFERENCES Donor(D_ID)
);

CREATE TABLE Gives_to(
	B_ID	Varchar(10),
	P_ID	Varchar(10),
	Gives	Char(10) NOT NULL,
	PRIMARY KEY(B_ID, P_ID),
    FOREIGN KEY (B_ID) REFERENCES BloodBank(B_ID) 
);


select * from Takes_from;
select * from Gives_to;
update Takes_from
set Donation = 'plasma', DonationDate = '2020-06-18', B_ID = 'B3'
where D_ID = '3';

desc Takes_from;
SELECT DATEDIFF('2017/08/25', '2017-11-26') AS DateDiff;
select * from BloodBank where B_ID in (select B_ID from Takes_from where Donation = 'blood' and D_ID in (select D_ID from Donor where DBloodGroup = '1'));

select * from Administrator;
select * from hospital;
select * from BloodBank;
select * from Donor;
select * from Patients;
select * from Takes_from;
select * from Gives_to;
