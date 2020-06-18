--Select All
SELECT * FROM Person;
SELECT * FROM Designation;
SELECT * FROM Employee;
SELECT * FROM Service;
SELECT * FROM Insurance;
SELECT * FROM GPO;
SELECT * FROM Post_Office;
SELECT * FROM Stamp;
SELECT * FROM Stamp_Invoice;
SELECT * FROM Mail;
SELECT * FROM Parcel;
SELECT * FROM Money_Order;
SELECT * FROM Letter;
SELECT * FROM Invoice;

--Select a Tuple
SELECT * FROM Person
WHERE CNIC = '3740514349678';

SELECT * FROM Designation
WHERE DesigID = 1;

SELECT * FROM Employee
WHERE EmpID = 1;

SELECT * FROM Service
WHERE ServiceID = 1;

SELECT * FROM Insurance
WHERE InsuranceID = 1;

SELECT * FROM GPO
WHERE GPO_ID = 1;

SELECT * FROM Post_Office
WHERE PpID = 1;

SELECT * FROM Stamp
WHERE SerialNo = 1;

SELECT * FROM Stamp_Invoice
WHERE StampInvoiceID = 1;

SELECT * FROM Mail
WHERE TrackingNo = 1;

SELECT * FROM Parcel
WHERE TrackingNo = 1;

SELECT * FROM Money_Order;
WHERE SerialNo = 1;

SELECT * FROM Letter;
WHERE TrackingNo = 1;

SELECT * FROM Invoice;
WHERE InvoiceID = 1;