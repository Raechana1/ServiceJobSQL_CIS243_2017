USE ServiceJobs;
GO

CREATE VIEW Customer_View
AS
SELECT Customers.CustomerID, BusinessName, Address1, Address2, TicketNumber, Description, TicketStatus
FROM Customers JOIN ServiceTickets
	ON Customers.CustomerID = ServiceTickets.CustomerID
GO

CREATE VIEW Technician_View
AS
SELECT Technicians.TechID, TechName, TicketNumber, Description, TicketStatus
FROM Technicians JOIN ServiceTickets
	ON Technicians.TechID = ServiceTickets.TechID
	JOIN Customers
	ON ServiceTickets.CustomerID = Customers.CustomerID
GO

CREATE VIEW Dispatch_View
AS
SELECT Customers.CustomerID, BusinessName, Customers.Address1 AS CustomerAddress1, Customers.Address2 AS CustomerAddress2,
	TicketNumber, Description, TicketStatus, Technicians.TechID
FROM Technicians JOIN ServiceTickets
	ON Technicians.TechID = ServiceTickets.TechID
	JOIN Customers
	ON ServiceTickets.CustomerID = Customers.CustomerID
GO


SELECT * FROM Customer_View
SELECT * FROM Dispatch_View
SELECT * FROM Technician_View