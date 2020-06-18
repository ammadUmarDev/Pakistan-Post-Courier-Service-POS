
CREATE TABLE Person (
    CNIC VARCHAR(15) NOT NULL,
    Name CHAR(50) NOT NULL,
    Address VARCHAR(50) NOT NULL,
    Phone# VARCHAR(12) NOT NULL,
    DOB DATE NOT NULL,
    Gender CHAR(13) NOT NULL,	
	CONSTRAINT chk1_Gender CHECK (Gender IN ('Male', 'Female', 'Not Specified')),
    CONSTRAINT pk_person PRIMARY KEY (CNIC)
	);

INSERT INTO Person
VALUES ('3740513355678', 'Hamza Ahmed', 'H#7 St.#45 ISB', '03035511335', '14-DEC-91', 'Male');

INSERT INTO Person
VALUES ('3740514349678', 'Murtaza Ali', 'H#3 St.#23 ISB', '03335213535', '2-OCT-97', 'Male');

INSERT INTO Person
VALUES ('3740516345698', 'Faizan Akhtar', 'H#2 St.#45 ISB', '03323558335', '26-NOV-96', 'Male');

INSERT INTO Person
VALUES ('3740527345676', 'Muhammad Hassan', 'H#9 St.#105 ISB', '03235941563', '17-JAN-88', 'Male');

INSERT INTO Person
VALUES ('3740518345678', 'Abdul Rafay', 'H#11 St.#2 ISB', '03335716335', '19-NOV-98', 'Male');

INSERT INTO Person
VALUES ('3740519345678', 'Malik Abbas', 'H#4 St.#55 ISB', '03435512628', '17-APR-93', 'Male');

INSERT INTO Person
VALUES ('3740512345677', 'Zain Rafique', 'H#19 St.#66 ISB', '03035887735', '12-AUG-95', 'Male');

INSERT INTO Person
VALUES ('3740512315638', 'Amir Liaqat', 'H#4 St.#51 ISB', '03335521967', '29-JUL-94', 'Male');

INSERT INTO Person
VALUES ('3740512343678', 'Usman Khan', 'H#44 St.#106 ISB', '03435333995', '26-FEB-98', 'Male');

INSERT INTO Person
VALUES ('3740522344778', 'Ashan Suheer', 'H#33 St.#27 ISB', '03035771531', '16-SEP-93', 'Male');

INSERT INTO Person
VALUES ('3740526645778', 'Adnan Umar', 'H#9 St.#94 ISB', '03366737891', '4-DEC-91', 'Male');

INSERT INTO Person
VALUES ('3740525345878', 'Hassan Sajid', 'H#42 St.#4 ISB', '03335552249', '21-SEP-97', 'Male');

INSERT INTO Person
VALUES ('3740525365778', 'Qadeer Aslam', 'H#58 St.#96 ISB', '03035998100', '5-MAR-99', 'Male');

INSERT INTO Person
VALUES ('3740521345738', 'Shahzel Ahmed', 'H#59 St.#24 ISB', '03001524328', '28-APR-94', 'Male');

INSERT INTO Person
VALUES ('3740542345678', 'Hamid Kamal', 'H#1 St.#15 ISB', '03435867335', '19-JUNE-93', 'Male');

INSERT INTO Person
VALUES ('3740521995738', 'Abdul Rehman', 'H#2 St.#14 ISB', '03001554328', '11-JAN-98', 'Male');

INSERT INTO Person
VALUES ('3740525034738', 'Shayam Raza', 'H#12 St.#106 ISB', '03005824328', '12-OCT-92', 'Male');

INSERT INTO Person
VALUES ('3740521345098', 'Siraj Khan', 'H#51 St.#28 ISB', '03005578328', '28-DEC-95', 'Male');

INSERT INTO Person
VALUES ('3740512345688', 'Hassan Abdullah', 'H#21 St.#82 ISB', '03009922335', '18-DEC-92', 'Male');

INSERT INTO Person
VALUES ('3740512345578', 'Moiz Haider', 'H#3 St.#29 ISB', '03005986385', '22-MAY-89', 'Male');

INSERT INTO Person
VALUES ('3740522345778', 'Ali Khan', 'H#1 St.#14 ISB', '03035511335', '9-JAN-87', 'Male');

INSERT INTO Person
VALUES ('3740515345478', 'Anees Iqbal', 'H#5 St.#84 ISB', '03435551336', '14-FEB-93', 'Male');
	
INSERT INTO Person
VALUES ('3740566345678', 'Abdullah Khan', 'H#2 St.#11 ISB', '03035511335', '27-MAR-99', 'Male');


CREATE TABLE Designation (
	DesigID INT NOT NULL,
	DesigName VARCHAR(30) NOT NULL,
	DesigRole VARCHAR(30),
	CONSTRAINT chk1_DName CHECK (DesigName IN ('Clerk', 'Manager', 'Assistant')),
	CONSTRAINT chk1_DRole CHECK (DesigRole IN ('User', 'Admin')),
	CONSTRAINT pk_dsgID PRIMARY KEY (DesigID)
	);
	
INSERT INTO Designation
VALUES (1, 'Clerk', 'User');

INSERT INTO Designation
VALUES (2, 'Manager', 'Admin');

INSERT INTO Designation
VALUES (3, 'Assistant', 'User');



CREATE TABLE GPO (
	GPO_ID INT NOT NULL,
	Location VARCHAR(100) NOT NULL,
	CONSTRAINT pk_gpo PRIMARY KEY (GPO_ID)
	);
	
INSERT INTO GPO
VALUES (1, 'Director General Pakistan Post Office, G-8/4 Islamabad');	
	

CREATE TABLE Post_Office (
	PpID INT NOT NULL,
	Location VARCHAR(100) NOT NULL,
	GPO_ID INT,
	CONSTRAINT pk_Post_Office PRIMARY KEY (PpID),
	CONSTRAINT fk_gpo FOREIGN KEY (GPO_ID) REFERENCES GPO(GPO_ID)
	);

INSERT INTO Post_Office
VALUES (1, 'H# B 5, 278 Service Rd, Sadiqabad, Rawalpindi', 1);

INSERT INTO Post_Office
VALUES (2, 'Saidpur Scheme 1, Asghar Mall Scheme, Rawalpindi', 1);

INSERT INTO Post_Office
VALUES (3, 'Chaklala Cantt., Rawalpindi', 1);



CREATE TABLE Staff (
    EmpID INT NOT NULL,
    Salary  INT CHECK (Salary > 0),
    HireDate DATE,
    DesigID INT,
    eCNIC VARCHAR(13) NOT NULL,
	MgrID INT,
	PpID INT,
	GPO_ID INT,
	CONSTRAINT pk_emp1 PRIMARY KEY (EmpID),
	CONSTRAINT fk_dsgID FOREIGN KEY (DesigID) REFERENCES Designation(DesigID),
	CONSTRAINT fk_ep FOREIGN KEY (eCNIC) REFERENCES Person(CNIC),
	CONSTRAINT fk_mgr1 FOREIGN KEY (MgrID) REFERENCES Staff(EmpID),
	CONSTRAINT fk_br FOREIGN KEY (PpID) REFERENCES Post_Office(PpID),
	CONSTRAINT fk_gp FOREIGN KEY (GPO_ID) REFERENCES GPO(GPO_ID)
	);

INSERT INTO Staff
VALUES (1, 100000, '7-MAR-04', 2, '3740512345688', NULL, NULL, 1);

INSERT INTO Staff
VALUES (2, 50000, '1-FEB-04', 2, '3740521345738', NULL, 2, NULL);

INSERT INTO Staff
VALUES (3, 50000, '18-DEC-06', 2, '3740525365778', NULL, 3, NULL);

INSERT INTO Staff
VALUES (4, 50000, '3-APR-05', 2, '3740525345878', NULL, 1, NULL);

INSERT INTO Staff
VALUES (5, 10000, '2-FEB-08', 1, '3740522344778', 1, NULL, 1);

INSERT INTO Staff
VALUES (6, 10000, '5-JUN-08', 1, '3740522345778', 1, NULL, 1);

INSERT INTO Staff
VALUES (7, 10000, '6-JAN-08', 1, '3740566345678', 2, 2, NULL);

INSERT INTO Staff
VALUES (8, 10000, '13-AUG-08', 1, '3740515345478', 3, 3, NULL);

INSERT INTO Staff
VALUES (9, 10000, '2-MAR-08', 1, '3740542345678', 4, 1, NULL);

INSERT INTO Staff
VALUES (10, 20000, '19-DEC-08', 3, '3740512345578', 1, NULL, 1);

INSERT INTO Staff
VALUES (11, 20000, '12-APR-08', 3, '3740521345098', 2, 2, NULL);

INSERT INTO Staff
VALUES (12, 20000, '9-JUL-08', 3, '3740525034738', 3, 3, NULL);

INSERT INTO Staff
VALUES (13, 20000, '19-OCT-09', 3, '3740521995738', 4, 1, NULL);



CREATE TABLE Insurance (
	InsuranceID INT NOT NULL,
	Name CHAR(30),
	Description CHAR(50),
	Charges INT,
	CONSTRAINT pk_insurance PRIMARY KEY (InsuranceID) 
	);
	
INSERT INTO Insurance
VALUES (1, 'Package Inviolability', 'Money back guarantee in case of damaged goods.',50);

INSERT INTO Insurance
VALUES (2, 'Package Acquirement', 'Money back guarantee in case of misplaced goods.',75);

INSERT INTO Insurance
VALUES (3, 'Timely Delivery', 'No delivery charges in case of late delivery.',75);

INSERT INTO Insurance
VALUES (0, 'No Insurance', 'No Insurance', 0);	




CREATE TABLE Service (
	ServiceID INT NOT NULL,
	Name CHAR(20),
	Description CHAR(50),
	Charges INT,
	CONSTRAINT pk_service PRIMARY KEY (ServiceID) 
	);
	
INSERT INTO Service
VALUES (1, 'Regular', 'Delivers mail in maximum 5 working days.', 100);	

INSERT INTO Service
VALUES (2, 'One Day', 'Delivers mail within next 24 hours.', 150);	

INSERT INTO Service
VALUES (3, 'Over Night', 'Delivers mail within next 12 hours.', 200);	

INSERT INTO Service
VALUES (4, 'Urgent', 'Delivers mail as soon as possible.', 300);


CREATE TABLE Stamp_Invoice (
	StampinvoiceID INT NOT NULL,
	IssueDate DATE NOT NULL,
	Post_OfficeID INT,
	CONSTRAINT pk_stamo PRIMARY KEY (StampinvoiceID),
	CONSTRAINT fk_q1 FOREIGN KEY (Post_OfficeID) REFERENCES Post_Office(PpID)
	);
	
INSERT INTO Stamp_Invoice
VALUES (1, '7-JAN-11', 1);

INSERT INTO Stamp_Invoice
VALUES (2, '14-JAN-11', 2);

INSERT INTO Stamp_Invoice
VALUES (3, '21-JAN-11', 1);

INSERT INTO Stamp_Invoice
VALUES (4, '7-FEB-11', 3);

INSERT INTO Stamp_Invoice
VALUES (5, '14-MAR-11', 2);



CREATE TABLE Stamp (
	SerialNo INT NOT NULL,
	ServiceID INT NOT NULL,
	StampinvoiceID INT NOT NULL,
	CONSTRAINT pk_stamp PRIMARY KEY (SerialNo),
	CONSTRAINT fk_sd FOREIGN KEY (ServiceID) REFERENCES Service(ServiceID),
	CONSTRAINT fk_siid FOREIGN KEY (StampInvoiceID) REFERENCES Stamp_Invoice(StampinvoiceID) 	
	);
	
INSERT INTO Stamp
VALUES (1, 1, 1);

INSERT INTO Stamp
VALUES (2, 2, 1);

INSERT INTO Stamp
VALUES (3, 3, 3);

INSERT INTO Stamp
VALUES (4, 4, 2);


CREATE TABLE Mail (
	TrackingNo INT NOT NULL,
	Status CHAR(20) NOT NULL,
	ExpectedDelivery DATE,
	RecieverCNIC VARCHAR(13) NOT NULL,
	SenderCNIC VARCHAR(13) NOT NULL,
	InsuranceID INT,
	ServiceID INT,
	CONSTRAINT pk_track PRIMARY KEY (TrackingNo),
	CONSTRAINT chk1_Status CHECK (Status IN ('processing', 'shipped', 'delivered', 'unreceived')),
	CONSTRAINT fk_rid FOREIGN KEY (RecieverCNIC) REFERENCES Person(CNIC), 
	CONSTRAINT fk_sid FOREIGN KEY (SenderCNIC) REFERENCES Person(CNIC),
	CONSTRAINT fk_ssd FOREIGN KEY (insuranceid) REFERENCES Insurance(InsuranceID),
	CONSTRAINT fk_sdd FOREIGN KEY (ServiceID) REFERENCES Service(ServiceID) 
	);

INSERT INTO Mail
VALUES (1, 'processing', '7-APR-12', '3740513355678', '3740514349678', 0, 1);

INSERT INTO Mail
VALUES (2, 'shipped', '21-APR-12', '3740516345698', '3740527345676', 3, 3);

INSERT INTO Mail
VALUES (3, 'delivered', '7-JAN-13', '3740527345676', '3740513355678', 1, 2);

INSERT INTO Mail
VALUES (4, 'unreceived', '7-MAR-11', '3740514349678', '3740516345698', 2, 4);

INSERT INTO Mail
VALUES (5, 'processing', '14-DEC-14', '3740527345676', '3740512343678', 0, 1);

INSERT INTO Mail
VALUES (6, 'shipped', '7-FEB-09', '3740518345678', '3740527345676', 2, 3);

INSERT INTO Mail
VALUES (7, 'delivered', '15-APR-08', '3740512343678', '3740512315638', 1, 2);

INSERT INTO Mail
VALUES (8, 'unreceived', '29-SEP-14', '3740512345677', '3740519345678', 0, 1);


CREATE TABLE Parcel (
	TrackingNo INT NOT NULL,
	RatePer_kg INT,
	Weight_kg FLOAT,
	Dimensions VARCHAR(30),
	CONSTRAINT fk_trkno1 FOREIGN KEY (TrackingNo) REFERENCES Mail (TrackingNo),
	CONSTRAINT pk_parcel PRIMARY KEY (TrackingNo)
	);
	
INSERT INTO Parcel
VALUES (1, 50, 5, '10in x 12in x 15in');

INSERT INTO Parcel
VALUES (2, 50, 10, '15in x 10in x 5in');

INSERT INTO Parcel
VALUES (3, 50, 8, '10in x 8in x 25in');


	
CREATE TABLE Money_Order (
	SerialNo INT NOT NULL,
	Amount INT NOT NULL,
	TrackingNo INT NOT NULL,
	CONSTRAINT pk_money PRIMARY KEY (SerialNo),
	CONSTRAINT fk_trkno2 FOREIGN KEY (TrackingNo) REFERENCES Mail (TrackingNo)
	);

INSERT INTO Money_Order
VALUES (1, 5000, 4);

INSERT INTO Money_Order
VALUES (2, 7000, 5);

INSERT INTO Money_Order
VALUES (3, 2000, 6);



CREATE TABLE Letter (
	TrackingNo INT NOT NULL,
	LetterType VARCHAR(20) NOT NULL,
	CONSTRAINT chk1_Letter CHECK (LetterType IN ('Small Envelop', 'Large Envelop')),
	CONSTRAINT fk_trkno3 FOREIGN KEY (TrackingNo) REFERENCES Mail (TrackingNo),
	CONSTRAINT pk_letter PRIMARY KEY (TrackingNo)
	);
	
INSERT INTO Letter
VALUES (7, 'Small Envelop');

INSERT INTO Letter
VALUES (8, 'Large Envelop');


CREATE TABLE Invoice (
	invoiceID INT NOT NULL,
	issueDate DATE NOT NULL,
	trackingNo INT NOT NULL,
	empID INT,
	TotalCharges INT,
	CONSTRAINT pk_invoice PRIMARY KEY (invoiceID),
	CONSTRAINT fk_track FOREIGN KEY (trackingNo) REFERENCES Mail(TrackingNo),
	CONSTRAINT fk_emp FOREIGN KEY (empID) REFERENCES Staff(EmpID)
	);
	
INSERT INTO invoice
VALUES (1, '2-APR-12', 1, 5,5555);

INSERT INTO invoice
VALUES (2, '21-APR-12', 2, 6,5555);

INSERT INTO invoice
VALUES (3, '6-JAN-13', 3, 7,5555);

INSERT INTO invoice
VALUES (4, '7-MAR-11', 4, 8,5555);



--Drop Table Queries...
DROP TABLE Person CASCADE CONSTRAINTS;
DROP TABLE Designation CASCADE CONSTRAINTS;
DROP TABLE Staff CASCADE CONSTRAINTS;
DROP TABLE Service CASCADE CONSTRAINTS;
DROP TABLE Insurance CASCADE CONSTRAINTS;
DROP TABLE GPO CASCADE CONSTRAINTS;
DROP TABLE Post_Office CASCADE CONSTRAINTS;
DROP TABLE Stamp CASCADE CONSTRAINTS;
DROP TABLE Stamp_Invoice CASCADE CONSTRAINTS;
DROP TABLE Mail CASCADE CONSTRAINTS;
DROP TABLE Parcel CASCADE CONSTRAINTS;
DROP TABLE Money_Order CASCADE CONSTRAINTS;
DROP TABLE Letter CASCADE CONSTRAINTS;
DROP TABLE Invoice CASCADE CONSTRAINTS;



SELECT InvoiceID, TotalCharges 
FROM Invoice 
WHERE IssueDate BETWEEN ('1-JAN-11') AND ('31-DEC-14') 
AND EmpID IN ( 
				SELECT  EmpID  FROM Staff WHERE PpID = 2
			 );
			 
			 
SELECT SUM(TotalCharges) 
FROM Invoice 
WHERE IssueDate BETWEEN ('1-JAN-11') AND ('31-DEC-14') 
AND EmpID IN ( 
				SELECT  EmpID  FROM Staff WHERE PpID = 2
  			  );
			  
			  
SELECT PpID FROM Post_Office;