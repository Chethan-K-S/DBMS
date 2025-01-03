CREATE DATABASE 1BM074;
USE 1BM074;
CREATE TABLE PERSON (
    driver_id VARCHAR(5) PRIMARY KEY,
    name VARCHAR(50),
    address VARCHAR(100)
);

CREATE TABLE CAR (
    reg_num VARCHAR(10) PRIMARY KEY,
    model VARCHAR(50),
    year INT
);

CREATE TABLE ACCIDENT (
    report_num INT PRIMARY KEY,
    accident_date DATE,
    location VARCHAR(100)
);

CREATE TABLE OWNS (
    driver_id VARCHAR(5),
    reg_num VARCHAR(10),
    PRIMARY KEY (driver_id, reg_num),
    FOREIGN KEY (driver_id) REFERENCES PERSON(driver_id),
    FOREIGN KEY (reg_num) REFERENCES CAR(reg_num)
);
CREATE TABLE PARTICIPATED (
    driver_id VARCHAR(5),
    reg_num VARCHAR(10),
    report_num INT,
    damage_amount INT,
    PRIMARY KEY (driver_id, reg_num, report_num),
    FOREIGN KEY (driver_id) REFERENCES PERSON(driver_id),
    FOREIGN KEY (reg_num) REFERENCES CAR(reg_num),
    FOREIGN KEY (report_num) REFERENCES ACCIDENT(report_num)
);
INSERT INTO PERSON (driver_id, name, address) VALUES
('A01', 'Richard', 'Srinivas Nagar'),
('A02', 'Pradeep', 'Rajaji Nagar'),
('A03', 'Smith', 'Ashok Nagar'),
('A04', 'Venu', 'NR Colony'),
('A05', 'John', 'Hanumanth Nagar');
INSERT INTO CAR (reg_num, model, year) VALUES
('KA052250', 'Indica', 1990),
('KA031181', 'Lancer', 1957),
('KA095477', 'Toyota', 1998),
('KA053408', 'Honda', 2008),
('KA041702', 'Audi', 2005);

INSERT INTO OWNS (driver_id, reg_num) VALUES
('A01', 'KA052250'),
('A02', 'KA053408'),
('A03', 'KA031181'),
('A04', 'KA095477'),
('A05', 'KA041702');
INSERT INTO ACCIDENT (report_num, accident_date, location) VALUES
(11, '2003-01-01', 'Mysore Road'),
(12, '2004-02-02', 'South End Circle'),
(13, '2003-01-21', 'Bull Temple Road'),
(14, '2008-02-17', 'Mysore Road'),
(15, '2005-03-04', 'Kanakpura Road');

INSERT INTO PARTICIPATED (driver_id, reg_num, report_num, damage_amount) VALUES
('A01', 'KA052250', 11, 10000),
('A02', 'KA053408', 12, 50000),
('A03', 'KA095477', 13, 25000),
('A04', 'KA031181', 14, 3000),
('A05', 'KA041702', 15, 5000);
SELECT accident_date, location
FROM ACCIDENT;
SELECT * from ACCIDENT;
UPDATE PARTICIPATED
SET damage_amount = 25000
WHERE reg_num = 'KA053408' AND report_num = 12;

INSERT INTO ACCIDENT (report_num, accident_date, location)
VALUES (16, '2024-10-03', 'MG Road');

SELECT driver_id, reg_num, damage_amount
FROM PARTICIPATED
WHERE damage_amount >= 25000;



