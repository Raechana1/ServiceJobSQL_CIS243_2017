--Insert new service ticket for CustomerID 34567. Add description ‘need new panel batteries’ Assign techID 34521.

INSERT INTO ServiceTickets(Description, TechID, CustomerID, TicketStatus) VALUES
('need new panel batteries', 34521, 34567, 'OPEN');