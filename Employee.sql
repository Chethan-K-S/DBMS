show databases;

create database employee;

use employee;

CREATE TABLE Dept (
    dname VARCHAR(20),
    deptno INT,
    dloc VARCHAR(20),
    PRIMARY KEY (deptno)
);

CREATE TABLE Employee (
    empno INT,
    ename VARCHAR(100),
    mgr_no INT,
    hiredate DATE,
    sal REAL,
    deptno INT,
    PRIMARY KEY (empno),
    FOREIGN KEY (deptno) REFERENCES Dept(deptno)
);

CREATE TABLE Incentives (
    empno INT,
    incentive_date DATE,
    incentive_amount INT,
    PRIMARY KEY (empno, incentive_date),
    FOREIGN KEY (empno) REFERENCES Employee(empno)
);

CREATE TABLE Project (
    pno INT,
    ploc VARCHAR(100),
    pname VARCHAR(100),
    PRIMARY KEY (pno)
);

CREATE TABLE Assigned_to (
    empno INT,
    pno INT,
    job_role VARCHAR(100),
    PRIMARY KEY (empno, pno),
    FOREIGN KEY (empno) REFERENCES Employee(empno),
    FOREIGN KEY (pno) REFERENCES Project(pno)
);


INSERT INTO Dept (dname, deptno, dloc) VALUES
    ('cse', 1, '4th floor'),
    ('ise', 2, '5th floor'),
    ('ece', 3, '3rd floor'),
    ('aiml', 4, '6th floor'),
    ('mech', 5, '1st floor');


INSERT INTO Employee (empno, ename, mgr_no, hiredate, sal, deptno) VALUES
    (1, 'Chethan', 11, '2000-11-20', 20000, 1),
    (2, 'Bramha', 22, '1999-02-19', 40000, 5),
    (3, 'Raja', 33, '2000-01-20', 30000, 2),
    (4, 'Hitish', 22, '2010-09-01', 40000, 3),
    (5, 'Bhavya', 11, '2011-04-04', 10000, 4),
    (6, 'Vatsal', 44, '2009-05-06', 50000, 3);


INSERT INTO Project (pno, ploc, pname) VALUES
    (1, 'Mysuru', 'Java'),
    (2, 'Bangalore', 'Python'),
    (3, 'Delhi', 'HTML'),
    (4, 'Haryana', 'DSA'),
    (5, 'Russia', 'Table'),
    (6, 'Hyderabad', 'Hack');

INSERT INTO Assigned_to (empno, pno, job_role) VALUES
    (1, 1, 'Software'),
    (2, 3, 'Teacher'),
    (3, 2, 'Engineer'),
    (4, 5, 'Teacher'),
    (5, 6, 'Hardware engineer'),
    (6, 4, 'Writer');

INSERT INTO Incentives (empno, incentive_date, incentive_amount) VALUES
    (1, '2000-10-11', 2000),
    (3, '1999-11-03', 50000);

SELECT e.empno, p.ploc
FROM project p
JOIN assigned_to e ON e.pno = p.pno
WHERE p.ploc IN ('Hyderabad', 'Mysuru', 'Bangalore');

SELECT e.empno
FROM employee e
WHERE e.empno NOT IN (SELECT i.empno FROM incentives i);

SELECT e.ename, e.empno, d.dname, a.job_role, d.dloc, p.ploc
FROM employee e
JOIN dept d ON e.deptno = d.deptno
JOIN assigned_to a ON a.empno = e.empno
JOIN project p ON p.pno = a.pno
WHERE d.dloc = p.ploc;



