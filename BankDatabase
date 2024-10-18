create table Branch (
Branchname varchar(100),
Branchcity varchar(100),
Assets real,
primary key(Branchname));

create table BankAccount (
Accno int,
Branchname varchar(100),
Balance real,
primary key ( Accno),
foreign key (Branchname) references Branch (Branchname));

create table BankCustomer (
Customername varchar(100),
Customerstreet varchar(100),
City varchar(100),
primary key (Customername));

create table Depositor (
Customername varchar(100),
Accno int,
primary key (Customername,Accno),
foreign key (Customername) references BankCustomer(Customername),
foreign key (Accno) references BankAccount (Accno));

create table Loan(
Loannumber int,
Branchname varchar(100),
Amount real,
primary key (Loannumber),
foreign key (Branchname) references Branch(Branchname));

insert into Branch 
values("SBI_Chamrajpet","Bangalore",50000),
("SBI_ResidencyRoad","Bangalore",10000),
("SBI_ShivajiRoad","Bombay",20000),
("SBI_ParlimentRoad","Delhi",10000),
("SBI_Jantarmantar","Delhi",20000);

insert into BankAccount 
values(1,"SBI_Chamrajpet",2000),
(2,"SBI_ResidencyRoad",5000),
(3,"SBI_ShivajiRoad",6000),
(4,"SBI_ParlimentRoad",9000),
(5,"SBI_Jantarmantar",8000),
(6,"SBI_ShivajiRoad",4000),
(8,"SBI_ResidencyRoad",4000),
(9,"SBI_ParlimentRoad",3000),
(10,"SBI_ResidencyRoad",5000),
(11,"SBI_Jantarmantar",2000);

insert into BankCustomer 
value("Avinash","Bull_Temple_Road","Bangalore"),
("Dinesh","Bannergatta_Road","Bangalore"),
("Mohan","NationalCollege_Road","Bangalore"),
("Nikil","Akbar_Road","Delhi"),
("Ravi","PritviRaj_Road","Delhi");

insert into Depositor 
values("Avinash",1),
("Dinesh",2),
("Nikil",4),
("Ravi",5),
("Avinash",8),
("Nikil",9),
("Dinesh",10),
("Nikil",11);


insert into Loan
values (1,"SBI_Chamrajpet",1000),
(2,"SBI_ResidencyRoad",2000),
(3,"SBI_ShivajiRoad",3000),
(4,"SBI_ParlimentRoad",4000),
(5,"SBI_Jantarmantar",5000);

select Branchname, Assets as "assets in lakhs" from Branch;

SELECT d.Customername, b.Branchname
FROM Depositor d, Bankaccount b
where d.Accno=b.Accno
GROUP BY d.Customername, b.Branchname
HAVING COUNT(Customername) > 1;
