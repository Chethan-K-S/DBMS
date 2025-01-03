CREATE TABLE Department (
    dept_id INT PRIMARY KEY,
    dept_name VARCHAR(50),
    location VARCHAR(50)
);

CREATE TABLE Project (
    project_id INT PRIMARY KEY,
    project_name VARCHAR(50),
    location VARCHAR(50)
);

CREATE TABLE Employee (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(50),
    dept_id INT,
    job_role VARCHAR(50),
    FOREIGN KEY (dept_id) REFERENCES Department(dept_id)
);

CREATE TABLE Incentives (
    emp_id INT,
    incentive_amt DECIMAL(10, 2),
    FOREIGN KEY (emp_id) REFERENCES Employee(emp_id)
);

CREATE TABLE Works_On (
    emp_id INT,
    project_id INT,
    FOREIGN KEY (emp_id) REFERENCES Employee(emp_id),
    FOREIGN KEY (project_id) REFERENCES Project(project_id)
);

insert into dept values(1,"cse","pj"); insert into dept values(2,"ise","pj"); insert into dept values(3,"csds","pg"); insert into dept values(4,"ece","pg"); insert into dept values(5,"aiml","pj"); 
 
insert into employee values(101,"mdr",100,"12/01/1999",100000,1); insert into employee values(201,"sak",200,"17/01/2020",50000,2); insert into employee values(301,"grp",100,"01/09/2004",30000,3); insert into employee values(401,"sws",101,"03/08/2000",10000,4); insert into employee values(501,"sks",101,"29/2/2008",90000,5); 
 
insert into incentives values(101,"12/03/2004",50000); insert into incentives values(201,"17/03/2024",25000); insert into incentives values(301,"01/12/2019",15000); insert into incentives values(401,"03/11/2019",5000); insert into incentives values(501,"29/4/2019",45000); 
 
insert into project values(10,"bng","chatbot"); insert into project values(40,"delhi","ml model"); insert into project values(50,"bombay","blockchain"); insert into project values(30,"chennai","stocks"); insert into project values(80,"mysore","android app"); insert into Assingnedto values(101,10,"devops"); insert into Assingnedto values(201,40,"sde"); insert into Assingnedto values(301,50,"manager"); insert into Assingnedto values(401,30,"jpa"); insert into Assingnedto values(501,80,"pa"); 

select * from dept;  
select * from employee;  
select * from incentives; 
select * from project;
select * from Assingnedto; 

SELECT E.emp_id
FROM Employee E
JOIN Works_On W ON E.emp_id = W.emp_id
JOIN Project P ON W.project_id = P.project_id
WHERE P.location IN ('Bengaluru', 'Hyderabad', 'Mysuru');

SELECT E.emp_id
FROM Employee E
LEFT JOIN Incentives I ON E.emp_id = I.emp_id
WHERE I.emp_id IS NULL;

SELECT E.emp_name, E.emp_id, D.dept_name, E.job_role, D.location AS dept_location, P.location AS project_location
FROM Employee E
JOIN Department D ON E.dept_id = D.dept_id
JOIN Works_On W ON E.emp_id = W.emp_id
JOIN Project P ON W.project_id = P.project_id
WHERE D.location = P.location;
