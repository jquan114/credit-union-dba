CREATE TABLE Members (
    MemberID SERIAL PRIMARY KEY,
    AccountType VARCHAR(50),
    Balance DECIMAL(10,2),
    Interest DECIMAL(5,2),
    OpenDate DATE
);

CREATE TABLE Accounts (
    AccountID SERIAL PRIMARY KEY,
    MemberID INT REFERENCES Members(MemberID),
    AccountType VARCHAR(50),
    Balance DECIMAL(10, 2),
    InterestRate DECIMAL(5, 2),
    OpenDate DATE
);



create table Transactions(
	TransactionID serial primary key,
	AccountID Int references Accounts(AccountID),
	TransactionsType Varchar (50),
	Amount Decimal (10,2),
	TransactionDate timestamp,
	Description Text 
	
	);
	
CREATE TABLE Loans (
    LoanID SERIAL PRIMARY KEY,
    MemberID INT REFERENCES Members(MemberID),
    LoanType VARCHAR(50),
    LoanAmount DECIMAL(10, 2),
    InterestRate DECIMAL(5, 2),
    LoanStartDate DATE,
    LoanEndDate DATE
);
CREATE TABLE AuditTrail (
    AuditTrailID SERIAL PRIMARY KEY,
    UserID INT, -- Reference to the user who performed the operation (optional)
    Timestamp TIMESTAMP,
    Operation VARCHAR(20), -- Insert, Update, Delete
    TableName VARCHAR(50),
    RecordID INT, -- Reference to the affected record (optional)
    Details TEXT
);

-------- inserting


INSERT INTO Members (AccountType, Balance, Interest, OpenDate) VALUES
('Savings', 1000.00, 1.5, '2021-01-01'),
('Checking', 500.00, 0.5, '2021-02-01'),
('Savings', 2000.00, 1.7, '2021-03-01'),
('Checking', 750.00, 0.5, '2021-04-01'),
('Savings', 1500.00, 1.6, '2021-05-01');


INSERT INTO Accounts (MemberID, AccountType, Balance, InterestRate, OpenDate) VALUES
(1, 'Savings', 1000.00, 1.5, '2021-01-01'),
(2, 'Checking', 500.00, 0.5, '2021-02-01'),
(3, 'Savings', 2000.00, 1.7, '2021-03-01'),
(4, 'Checking', 750.00, 0.5, '2021-04-01'),
(5, 'Savings', 1500.00, 1.6, '2021-05-01');


INSERT INTO Loans (MemberID, LoanType, LoanAmount, InterestRate, LoanStartDate, LoanEndDate) VALUES
(1, 'Personal', 5000.00, 3.5, '2021-01-10', '2023-01-10'),
(2, 'Mortgage', 200000.00, 2.5, '2021-02-15', '2041-02-15'),
(3, 'Auto', 15000.00, 3.0, '2021-03-20', '2026-03-20'),
(4, 'Personal', 3000.00, 4.0, '2021-04-25', '2023-04-25'),
(5, 'Home Improvement', 10000.00, 3.5, '2021-05-30', '2028-05-30');


INSERT INTO Transactions (AccountID, TransactionsType, Amount, TransactionDate, Description) VALUES
(1, 'Deposit', 500.00, '2021-01-05 10:00:00', 'Monthly deposit'),
(2, 'Withdrawal', 200.00, '2021-02-10 14:30:00', 'ATM withdrawal'),
(3, 'Deposit', 1000.00, '2021-03-15 09:20:00', 'Salary deposit'),
(4, 'Withdrawal', 50.00, '2021-04-20 16:45:00', 'Grocery shopping'),
(5, 'Deposit', 250.00, '2021-05-25 12:30:00', 'Gift received');


INSERT INTO AuditTrail (UserID, Timestamp, Operation, TableName, RecordID, Details) VALUES
(1, '2021-01-05 10:00:00', 'Insert', 'Members', 1, 'Added new member'),
(2, '2021-02-10 14:30:00', 'Update', 'Accounts', 2, 'Updated account balance'),
(3, '2021-03-15 09:20:00', 'Insert', 'Loans', 3, 'New loan issued'),
(4, '2021-04-20 16:45:00', 'Delete', 'Members', 4, 'Member account closed'),
(5, '2021-05-25 12:30:00', 'Insert', 'Transactions', 5, 'New transaction recorded');
