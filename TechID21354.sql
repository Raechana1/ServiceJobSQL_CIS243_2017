--What are the jobs under technician 21354
CREATE VIEW Technician_View
AS
SELECT Technicians.TechID, TechName, BusinessName, Customers.Address1, Customers.Address2,
	 TicketNumber, Description, TicketStatus
FROM Technicians JOIN ServiceTickets
	ON Technicians.TechID = ServiceTickets.TechID
	JOIN Customers
	ON ServiceTickets.CustomerID = Customers.CustomerID
GO


SELECT *
FROM Technician_View
WHERE TechID = 21354;