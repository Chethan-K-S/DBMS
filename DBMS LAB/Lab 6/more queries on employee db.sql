select ename from employee where mgr_no = (select max(mgr_no) from employee); 
ename from employee where sal > (select avg(sal) from employee); 
select ename from employee where sal = (select max(sal) from employee where sal < (select max(sal) from employee)); 
select * from employee where empno = (select empno from incentives where amt = (select max(amt) from incentives where amt < (select max(amt) from incentives))); 
