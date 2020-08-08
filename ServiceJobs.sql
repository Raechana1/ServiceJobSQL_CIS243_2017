USE master;
GO

IF  DB_ID('ServiceJobs') IS NOT NULL
    DROP DATABASE ServiceJobs;

CREATE DATABASE ServiceJobs;
GO

USE ServiceJobs;

--create the tables for the database
CREATE TABLE Technicians(
	TechID			INT				PRIMARY KEY		NOT NULL,
	TechName		VARCHAR(225)	NOT NULL,
	Address1		VARCHAR(60)		NOT NULL,
	Address2		VARCHAR(60)		DEFAULT NULL,	
	City			VARCHAR(40)		NOT NULL,
	State			VARCHAR(2)		NOT NULL,
	ZipCode			VARCHAR(10)		NOT NULL,
	PhoneNumber		VARCHAR(12)		NOT NULL,
	EmailAddress	VARCHAR(225)	NOT NULL
);

CREATE TABLE Customers(
	CustomerID			INT				PRIMARY KEY		NOT NULL,
	BusinessName		VARCHAR(225)	NOT NULL,
	Address1			VARCHAR(60)		NOT NULL,
	Address2			VARCHAR(60)		DEFAULT NULL,	
	City				VARCHAR(40)		NOT NULL,
	State				VARCHAR(2)		NOT NULL,
	ZipCode				VARCHAR(10)		NOT NULL,
	PhoneNumber			VARCHAR(12)		NOT NULL,
	EmailAddress		VARCHAR(225)	NOT NULL
);

CREATE TABLE ServiceTickets(
	TicketNumber	INT				PRIMARY KEY		IDENTITY,
	Description		VARCHAR(225)	NOT NULL,
	TechID			INT				REFERENCES Technicians(TechID),
	CustomerID		INT				REFERENCES Customers(CustomerID),	
	TicketStatus	VARCHAR(40)		NOT NULL,
);

CREATE TABLE Invoices(
	InvoiceID		INT				PRIMARY KEY		IDENTITY,
	InvoiceTotal	MONEY			NOT NULL,
	PaymentTotal	MONEY			DEFAULT 0,
	TicketNumber	INT				REFERENCES ServiceTickets(TicketNumber),
	CustomerID		INT				REFERENCES Customers(CustomerID),	
	TicketStatus	VARCHAR(40)		NOT NULL
);

INSERT INTO Technicians(TechID, TechName, Address1, Address2, City, State, ZipCode, PhoneNumber, EmailAddress) VALUES
(12345, 'John Smith', '123 A Ave', 'Apt. 220', 'New York', 'NY', 12035, '212-555-6674', 'john.smith@servicework.com'),
(21354, 'Gary Doe', '5231 Telluride Rd', '', 'Denver', 'CO', 80027, '720-555-9412', 'gary.doe@servicework.com'),
(34521, 'Donald Fry', '333 Mississippi Ave', '', 'Aurora', 'CO', 80012, '303-555-8868', 'donald.fry2@servicework.com');

INSERT INTO Customers(CustomerID, BusinessName, Address1, Address2, City, State, ZipCode, PhoneNumber, EmailAddress) VALUES
(23456, 'We Got It', '977 17th St', 'Suite 200', 'Brooklyn', 'NY', 10027, '718-555-9892', 'wegotit214@corporate.com'),
(34567, 'Burger Hat', '207 Del Mar Cir', '', 'Parker', 'CO', 80013, '303-555-3332', 'store222@burgerhat.com'),
(45678, 'Chick Cheeck', '888 Q Ave', 'Suite 400', 'New York', 'NY', 12044, '212-555-6045', 'chickcheek512@cccorporate.com');

SET IDENTITY_INSERT ServiceTickets ON;

INSERT INTO ServiceTickets(TicketNumber, Description, TechID, CustomerID, TicketStatus) VALUES
(1,'motion sensor on hall door broken', 21354, 34567, 'OPEN'),
(2, 'rollup door sensor keeps falsing', 12345, 23456, 'BILLED'),
(3, 'mag lock not locking', 21354, 45678, 'CLOSED');

SET IDENTITY_INSERT ServiceTickets OFF;

SET IDENTITY_INSERT Invoices ON;

INSERT INTO Invoices(InvoiceID, CustomerID, InvoiceTotal, PaymentTotal, TicketNumber, TicketStatus) VALUES
(1, 45678, 1125.65, 1125.65, 3, 'CLOSED'),
(2, 23456, 6027.00, DEFAULT, 2, 'BILLED');

SET IDENTITY_INSERT Invoices OFF; 

