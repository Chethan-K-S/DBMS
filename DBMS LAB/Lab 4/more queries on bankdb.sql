select distinct d.customer_name 
from Depositer d, BranchAccount ba, Branch b where d.accno=ba.accno and ba.branch_name=b.branch_name and b.branch_city="Delhi" 
group by d.customer_name having count(b.branch_name)>1; 
select b.customer_name from borrower b 
where b.loan_number not in(select d.accno from depositer d where b.loan_number=d.accno); 
select b.customer_name from borrower b 
where b.loan_number in(select d.accno from depositer d,branchaccount ba, branch b 
where b.loan_number=d.accno and d.accno=ba.accno and ba.branch_name=b.branch_name and b.branch_city="Bangalore"); 
where assents_inlakhs > all (select assents_inlakhs from branch where branch_city="Bangalore"); 
delete from branchaccount ba 
where ba.branch_name=(select b.branch_name from branch b where branch_city="Bombay"); select * from branchaccount; 
update BranchAccount 
set balance=balance+((5*balance)/100) where accno in(1,2,4,5,8,9,10,11,12); 
