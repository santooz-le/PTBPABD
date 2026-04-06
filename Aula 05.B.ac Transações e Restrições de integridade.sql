-- 1 Questão
CREATE SCHEMA avaliacaocontinua;

-- 2 Questão
CREATE TABLE avaliacaocontinua.company (
    company_name VARCHAR(100) NOT NULL PRIMARY KEY,
    city VARCHAR(100)
);

-- 3 Questão
CREATE TABLE avaliacaocontinua.employee (
    person_name VARCHAR(100) NOT NULL PRIMARY KEY,
    street VARCHAR(100),
    city VARCHAR(100)
);

-- 4 Questão
CREATE TABLE avaliacaocontinua.manages (
    person_name VARCHAR(100) NOT NULL PRIMARY KEY,
    manager_name VARCHAR(100)
);

-- 5 Questão
CREATE TABLE avaliacaocontinua.works (
    person_name VARCHAR(100) NOT NULL PRIMARY KEY,
    company_name VARCHAR(100) NOT NULL,
    salary DECIMAL(10, 2)
);

-- 6 Questão
ALTER TABLE avaliacaocontinua.works
ADD CONSTRAINT FK_works_employee FOREIGN KEY (person_name)
REFERENCES avaliacaocontinua.employee(person_name)
ON UPDATE CASCADE
ON DELETE CASCADE;

-- 7 Questão
ALTER TABLE avaliacaocontinua.works
ADD CONSTRAINT FK_works_company FOREIGN KEY (company_name)
REFERENCES avaliacaocontinua.company(company_name)
ON UPDATE CASCADE
ON DELETE CASCADE;

-- 8 Questão
ALTER TABLE avaliacaocontinua.manages
ADD CONSTRAINT FK_manages_employee FOREIGN KEY (person_name)
REFERENCES avaliacaocontinua.employee(person_name)
ON UPDATE CASCADE
ON DELETE CASCADE;