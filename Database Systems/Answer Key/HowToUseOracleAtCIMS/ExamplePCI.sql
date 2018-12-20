--    This SQL DDL script was generated by Microsoft Visual Studio (Release Date: LOCAL BUILD).

--    Driver Used : Microsoft Visual Studio - Oracle Server Driver.
--    Time Created: February 17, 2008 10:41 AM.
--    Operation   : From Visio Generate Wizard.
--    Connected data source : No connection.
--    Connected server      : No connection.
--    Connected database    : Not applicable.

-- Some parts commented out by Zvi


-- Create PCI database.
-- connect internal ;
-- startup nomount pfile=   ;
-- spool create_db_PCI ;

-- create database PCI
-- 	NOARCHIVELOG;

-- create rollback segment PCI_r0 tablespace system ;

-- alter rollback segment  PCI_r0 online ;

-- Create Oracle exception file.
-- create table exceptions ( row_id rowid, owner varchar2(30), table_name varchar2(30), constraint varchar2(30)) ;

-- End parts commented out by Zvi


drop table INVOICE;

drop table CUSTOMER;

drop table PLANT;

-- Create new table INVOICE.
-- INVOICE : Table of Invoice
-- 	I# : I# identifies Invoice
-- 	AMT : Amt is of Invoice
-- 	IDATE : Idate is of Invoice
-- 	C# : C# is of Invoice
create table INVOICE (
	I# INTEGER not null,
	AMT INTEGER null,
	IDATE DATE null,
	C# INTEGER not null, constraint INVOICE_PK primary key (I#) );

-- Create new table CUSTOMER.
-- CUSTOMER : Table of Customer
-- 	C# : C# identifies Customer
-- 	CNAME : Cname is of Customer
-- 	CITY : City is of Customer
-- 	P# : P# is of Customer
create table CUSTOMER (
	C# INTEGER not null,
	CNAME VARCHAR2(10) null,
	CITY VARCHAR2(10) null,
	P# INTEGER null, constraint CUSTOMER_PK primary key (C#) );

-- Create new table PLANT.
-- PLANT : Table of Plant
-- 	P# : P# identifies Plant
-- 	PNAME : Pname is of Plant
-- 	CITY : City is of Plant
-- 	MARGIN : Margin is of Plant
create table PLANT (
	P# INTEGER not null,
	PNAME VARCHAR2(10) null,
	CITY VARCHAR2(10) null,
	MARGIN FLOAT null, constraint PLANT_PK primary key (P#) );


-- Populate the database (added by Zvi)



Insert into Plant values(1,'alpha','Boston',null);
Insert into Plant values(2,'alpha','Boston',0.2);
Insert into Plant values(3,'beta','New York',0.5);

Insert into Customer(C#,Cname,P#) values(11,'a',1);
Insert into Customer values(12,null,null,null);

Insert into Invoice values (21,50,'12-JAN-2009',11);


-- Back to Visual Studio script

-- Add foreign key constraints to table INVOICE.
alter table INVOICE
	add constraint CUSTOMER_INVOICE_FK1 foreign key (
		C#)
	 references CUSTOMER (
		C#);

-- Add foreign key constraints to table CUSTOMER.
alter table CUSTOMER
	add constraint PLANT_CUSTOMER_FK1 foreign key (
		P#)
	 references PLANT (
		P#);


-- This is the end of the Microsoft Visual Studio generated SQL DDL script.


-- Print description of the database


desc user_tables;

desc table_name from user_tables;

select table_name, constraint_name, constraint_type from user_constraints;

desc Plant;

desc Customer;

desc Invoice;

-- Print the database

select * from Plant;

select * from Customer;

select * from Invoice;



-- Run a trivial query

drop TABLE Answer0;

create Table Answer0 AS
select I#, Plant.City
from Plant, Customer, Invoice
where Plant.P# = Customer.P# and Customer.C# = Invoice.C#;

select * from Answer0;
