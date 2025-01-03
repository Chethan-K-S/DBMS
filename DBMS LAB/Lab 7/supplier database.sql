create table Supplier( sid int primary key, sname varchar(20) , city varchar(20)); 
 
create table Parts( pid int primary key, pname varchar(20), color varchar(20) ); 
 
 
create table Catalog( 
sid int, pid int, 
cost int, 
foreign key(sid) references Supplier(sid), foreign key(pid) references Parts(pid)); 
 
Insert appropriate records in each table. insert into Supplier values (10001, 'Acme Widget','Bangalore'); insert into Supplier values (10002, 'Johns','Kolkata'); insert into Supplier values (10003, 'Vimal','Mumbai'); insert into Supplier values (10004, 'Reliance','Delhi'); 
 
insert into Parts values (20001, 'Book','Red'); insert into Parts values (20002, 'Pen','Red'); insert into Parts values (20003, 'Pencil','Green'); insert into Parts values (20004, 'Mobile','Green'); insert into Parts values (20005, 'Charger','Black'); 
 
insert into Catalog values (10001, 20001 , 10); insert into Catalog values (10001, 20002 , 10); insert into Catalog values (10001, 20003 , 30); insert into Catalog values (10001, 20004 , 10); insert into Catalog values (10001, 20005 , 10); insert into Catalog values (10002, 20001 , 10); insert into Catalog values (10002, 20002 , 20); insert into Catalog values (10003, 20003 , 30); insert into Catalog values (10004, 20003 , 40); 

p.pname from Parts p, Catalog c where p.pid = c.pid; 

select distinct s.sname 
from Catalog c , Supplier s where c.sid = s.sid and NOT EXISTS(select p.pid from Parts p where NOT EXISTS(select c1.sid from Catalog c1 where c1.sid=c.sid and c1.pid =c.pid)); 

select distinct s.sname from Catalog C, Supplier s where C.sid=s.sid and 
NOT EXISTS (select P.pid from Parts P 
where P.color="Red" and NOT EXISTS (select C1.sid from Catalog C1 where C1.sid = C.sid and C1.pid = P.pid and P.color="Red")); 

select p.pname 
from Parts p, Catalog c, Supplier s where p.pid=c.pid and c.sid=s.sid and s.sname="Acme Widget" and NOT EXISTS (select * from Catalog c1, Supplier s1 where p.pid=c1.pid and c1.sid=s1.sid and s1.sname != "Acme Widget"); 

select distinct C.sid from Catalog C where C.cost > (select AVG(C1.cost) from Catalog C1 where C1.pid = C.pid); 

select P.pid, S.sname from Parts P, Supplier S, Catalog C where C.pid = P.pid and C.sid = S.sid and 
C.cost = (select max(C1.cost) from Catalog C1 where C1.pid = P.pid); 
