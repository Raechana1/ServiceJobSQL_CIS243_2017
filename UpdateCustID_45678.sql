--Update CustomerID 45678 Address2 to Suite 440

UPDATE Customers
SET Address2 = 'Suite 440'
WHERE CustomerID = 45678;

SELECT *
FROM Customers;