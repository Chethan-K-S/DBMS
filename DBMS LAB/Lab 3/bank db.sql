create database Bank_Database; show databases; use Bank_Database; create table Branch(Name varchar(20),City varchar(20), Assets varchar(20), primary key(Name)); 
create table BankAccount(accno varchar(20),Name varchar(20), Balance varchar(20), primary key(accno,Name),foreign key(Name) references Branch(Name)) ; create table Customer(name varchar(20),Street varchar(20), City varchar(20),primary key(name)); 
create table Depositer(name varchar(20),accno varchar(20), 
primary key(name,accno), foreign key(name) references Customer(name),foreign key(accno) references 
BankAccount(accno)); 
 
create table Depositer(name varchar(20),accno varchar(20), 
primary key(name,accno), foreign key(name) references Customer(name),foreign key(accno) references 
BankAccount(accno)); 
 
create table Loan(loan_no varchar(20),Name varchar(20), Amount varchar(20), primary key(Name), foreign key(Name) references Branch(Name)); 
 
insert into Branch values("SBI_Chamrajpet", "Bangalore", 50000); insert into Branch values("SBI_ResidencyRoad", "Bangalore", 10000); insert into Branch values("SBI_ShivajiRoad", "Bombay", 20000); insert into Branch values("SBI_ParlimentRoad", "Delhi", 10000); insert into Branch values("SBI_Jantarmantar", "Delhi", 20000); 
 
insert into BankAccount values(1, "SBI_Chamrajpet",2000 ); insert into BankAccount values(2, "SBI_ResidencyRoad", 5000); insert into BankAccount values(3, "SBI_ShivajiRoad", 6000); insert into BankAccount values(4, "SBI_ParlimentRoad", 9000); insert into BankAccount values(5, "SBI_Jantarmantar", 8000); insert into BankAccount values(6, "SBI_ShivajiRoad", 8000); insert into BankAccount values(8, "SBI_ResidencyRoad", 8000); insert into BankAccount values(9, "SBI_ParlimentRoad", 8000); insert into BankAccount values(10, "SBI_ResidencyRoad", 8000); insert into BankAccount values(11, "SBI_Jantarmantar", 8000); insert into Customer values("Avinash", "Bull temple road","Bangalore" ); insert into Customer values("Dinesh", "Bannerghatta Road","Bangalore" ); insert into Customer values("Mohan", "NationalCollegeRoad","Bangalore" ); insert into Customer values("Nikhil", "Akbar Road","Delhi" ); insert into Customer values("Ravi", "Prithviraj Road","Delhi" ); 
 
insert into Depositer values("Avinash", 1); insert into Depositer values("Dinesh", 2); insert into Depositer values("Mohan", 3); insert into Depositer values("Nikhil", 4); insert into Depositer values("Ravi", 5); insert into Depositer values("Avinash", 8); insert into Depositer values("Nikhil", 9); insert into Depositer values("Dinesh", 10); insert into Depositer values("Nikhil", 11); 
 
insert into Loan values(1, "SBI_Chamrajpet", 1000); insert into Loan values(2, "SBI_ResidencyRoad", 2000); insert into Loan values(3, "SBI_ShivajiRoad", 3000); insert into Loan values(4, "SBI_ParlimentRoad", 4000); insert into Loan values(5, "SBI_Jantarmantar", 5000); 
 
 
select * from Branch; 
select * from BankAccount; 
select * from Customer; 
select * from Depositer; 
 select * from Loan; 
alter table branch 
change assets assents_inlakhs real; 
 
select d.Customername from Depositer d, BankAccount b where 
b.Branch_name='SBI_ResidencyRoad' and d.Accno=b.Accno group by d.Customername having count(d.Accno)>=2; 
 
create view br 
as 
select branch_name, sum(amount) from loan group by branch_name; select * from br 
