--Update service ticket 1 with status “Pending Parts’.

UPDATE ServiceTickets
SET TicketStatus = 'Pending Parts'
WHERE TicketNumber = 1;

SELECT *
FROM ServiceTickets;