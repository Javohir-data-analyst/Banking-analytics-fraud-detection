create database to_Project
use to_Project

CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY IDENTITY,
    FullName NVARCHAR(100),
    DOB DATE,
    Email NVARCHAR(100),
    PhoneNumber NVARCHAR(20),
    Address NVARCHAR(200),
    NationalID NVARCHAR(50),
    TaxID NVARCHAR(50),
    EmploymentStatus NVARCHAR(50),
    AnnualIncome DECIMAL(18,2),
    CreatedAt DATETIME DEFAULT GETDATE(),
    UpdatedAt DATETIME DEFAULT GETDATE()
);
CREATE TABLE Branches (
    BranchID INT PRIMARY KEY IDENTITY,
    BranchName NVARCHAR(100),
    Address NVARCHAR(200),
    City NVARCHAR(100),
    State NVARCHAR(100),
    Country NVARCHAR(100),
    ManagerID INT NULL,
    ContactNumber NVARCHAR(20)
);
CREATE TABLE Accounts (
    AccountID INT PRIMARY KEY IDENTITY,
    CustomerID INT,
    AccountType NVARCHAR(50),
    Balance DECIMAL(18,2),
    Currency NVARCHAR(10),
    Status NVARCHAR(20),
    BranchID INT,
    CreatedDate DATETIME DEFAULT GETDATE(),
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID),
    FOREIGN KEY (BranchID) REFERENCES Branches(BranchID)
);
CREATE TABLE Transactions (
    TransactionID INT PRIMARY KEY IDENTITY,
    AccountID INT,
    TransactionType NVARCHAR(50),
    Amount DECIMAL(18,2),
    Currency NVARCHAR(10),
    Date DATETIME,
    Status NVARCHAR(20),
    ReferenceNo NVARCHAR(50),
    Country NVARCHAR(100),
    FOREIGN KEY (AccountID) REFERENCES Accounts(AccountID)
);
CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY IDENTITY,
    BranchID INT,
    FullName NVARCHAR(100),
    Position NVARCHAR(100),
    Department NVARCHAR(100),
    Salary DECIMAL(18,2),
    HireDate DATE,
    Status NVARCHAR(50),
    FOREIGN KEY (BranchID) REFERENCES Branches(BranchID)
);
CREATE TABLE CreditCards (
    CardID INT PRIMARY KEY IDENTITY,
    CustomerID INT,
    CardNumber NVARCHAR(20),
    CardType NVARCHAR(50),
    CVV NVARCHAR(5),
    ExpiryDate DATE,
    [Limit] DECIMAL(18,2),
    Status NVARCHAR(20),
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);
CREATE TABLE CreditCardTransactions (
    TransactionID INT PRIMARY KEY IDENTITY,
    CardID INT,
    Merchant NVARCHAR(100),
    Amount DECIMAL(18,2),
    Currency NVARCHAR(10),
    Date DATETIME,
    Status NVARCHAR(20),
    FOREIGN KEY (CardID) REFERENCES CreditCards(CardID)
);
CREATE TABLE OnlineBankingUsers (
    UserID INT PRIMARY KEY IDENTITY,
    CustomerID INT,
    Username NVARCHAR(50),
    PasswordHash NVARCHAR(200),
    LastLogin DATETIME,
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);
CREATE TABLE BillPayments (
    PaymentID INT PRIMARY KEY IDENTITY,
    CustomerID INT,
    BillerName NVARCHAR(100),
    Amount DECIMAL(18,2),
    Date DATETIME,
    Status NVARCHAR(20),
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);
CREATE TABLE MobileBankingTransactions (
    TransactionID INT PRIMARY KEY IDENTITY,
    CustomerID INT,
    DeviceID NVARCHAR(100),
    AppVersion NVARCHAR(20),
    TransactionType NVARCHAR(50),
    Amount DECIMAL(18,2),
    Date DATETIME,
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);
CREATE TABLE Loans (
    LoanID INT PRIMARY KEY IDENTITY,
    CustomerID INT,
    BranchID INT,
    LoanType NVARCHAR(50),
    Amount DECIMAL(18,2),
    InterestRate DECIMAL(5,2),
    StartDate DATE,
    EndDate DATE,
    Status NVARCHAR(20),
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID),
    FOREIGN KEY (BranchID) REFERENCES Branches(BranchID)
);
CREATE TABLE LoanPayments (
    PaymentID INT PRIMARY KEY IDENTITY,
    LoanID INT,
    AmountPaid DECIMAL(18,2),
    PaymentDate DATE,
    RemainingBalance DECIMAL(18,2),
    FOREIGN KEY (LoanID) REFERENCES Loans(LoanID)
);
CREATE TABLE CreditScores (
    CustomerID INT PRIMARY KEY,
    CreditScore INT,
    UpdatedAt DATETIME,
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);
CREATE TABLE DebtCollection (
    DebtID INT PRIMARY KEY IDENTITY,
    CustomerID INT,
    AmountDue DECIMAL(18,2),
    DueDate DATE,
    CollectorAssigned NVARCHAR(100),
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);
CREATE TABLE KYC (
    KYCID INT PRIMARY KEY IDENTITY,
    CustomerID INT,
    DocumentType NVARCHAR(50),
    DocumentNumber NVARCHAR(100),
    VerifiedBy NVARCHAR(100),
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);
CREATE TABLE FraudDetection (
    FraudID INT PRIMARY KEY IDENTITY,
    CustomerID INT,
    TransactionID INT,
    RiskLevel NVARCHAR(50),
    ReportedDate DATETIME,
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);
CREATE TABLE AMLCases (
    CaseID INT PRIMARY KEY IDENTITY,
    CustomerID INT,
    CaseType NVARCHAR(100),
    Status NVARCHAR(50),
    InvestigatorID INT
);
CREATE TABLE RegulatoryReports (
    ReportID INT PRIMARY KEY IDENTITY,
    ReportType NVARCHAR(100),
    SubmissionDate DATE
);
CREATE TABLE Departments (
    DepartmentID INT PRIMARY KEY IDENTITY,
    DepartmentName NVARCHAR(100),
    ManagerID INT
);
CREATE TABLE Salaries (
    SalaryID INT PRIMARY KEY IDENTITY,
    EmployeeID INT,
    BaseSalary DECIMAL(18,2),
    Bonus DECIMAL(18,2),
    Deductions DECIMAL(18,2),
    PaymentDate DATE,
    FOREIGN KEY (EmployeeID) REFERENCES Employees(EmployeeID)
);
CREATE TABLE EmployeeAttendance (
    AttendanceID INT PRIMARY KEY IDENTITY,
    EmployeeID INT,
    CheckInTime DATETIME,
    CheckOutTime DATETIME,
    TotalHours DECIMAL(5,2),
    FOREIGN KEY (EmployeeID) REFERENCES Employees(EmployeeID)
);
CREATE TABLE Investments (
    InvestmentID INT PRIMARY KEY IDENTITY,
    CustomerID INT,
    InvestmentType NVARCHAR(100),
    Amount DECIMAL(18,2),
    ROI DECIMAL(5,2),
    MaturityDate DATE,
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);
CREATE TABLE StockTradingAccounts (
    AccountID INT PRIMARY KEY IDENTITY,
    CustomerID INT,
    BrokerageFirm NVARCHAR(100),
    TotalInvested DECIMAL(18,2),
    CurrentValue DECIMAL(18,2),
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);
CREATE TABLE ForeignExchange (
    FXID INT PRIMARY KEY IDENTITY,
    CustomerID INT,
    CurrencyPair NVARCHAR(20),
    ExchangeRate DECIMAL(10,4),
    AmountExchanged DECIMAL(18,2),
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);
CREATE TABLE InsurancePolicies (
    PolicyID INT PRIMARY KEY IDENTITY,
    CustomerID INT,
    InsuranceType NVARCHAR(100),
    PremiumAmount DECIMAL(18,2),
    CoverageAmount DECIMAL(18,2),
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);
CREATE TABLE Claims (
    ClaimID INT PRIMARY KEY IDENTITY,
    PolicyID INT,
    ClaimAmount DECIMAL(18,2),
    Status NVARCHAR(50),
    FiledDate DATE,
    FOREIGN KEY (PolicyID) REFERENCES InsurancePolicies(PolicyID)
);
CREATE TABLE UserAccessLogs (
    LogID INT PRIMARY KEY IDENTITY,
    UserID INT,
    ActionType NVARCHAR(100),
    Timestamp DATETIME
);
CREATE TABLE CyberSecurityIncidents (
    IncidentID INT PRIMARY KEY IDENTITY,
    AffectedSystem NVARCHAR(100),
    ReportedDate DATE,
    ResolutionStatus NVARCHAR(50)
);
CREATE TABLE Merchants (
    MerchantID INT PRIMARY KEY IDENTITY,
    MerchantName NVARCHAR(100),
    Industry NVARCHAR(100),
    Location NVARCHAR(100),
    CustomerID INT
);
CREATE TABLE MerchantTransactions (
    TransactionID INT PRIMARY KEY IDENTITY,
    MerchantID INT,
    Amount DECIMAL(18,2),
    PaymentMethod NVARCHAR(50),
    Date DATETIME,
    FOREIGN KEY (MerchantID) REFERENCES Merchants(MerchantID)
);

INSERT INTO Customers (FullName, DOB, Email, PhoneNumber, Address, NationalID, TaxID, EmploymentStatus, AnnualIncome)
VALUES
('Ali Karimov','1990-05-12','ali@mail.com','998901111111','Tashkent','AA123','TAX111','Employed',120000),
('Vali Saidov','1985-03-22','vali@mail.com','998902222222','Samarkand','BB234','TAX222','Business',250000),
('Samiya Nur','1995-07-01','samiya@mail.com','998903333333','Bukhara','CC345','TAX333','Employed',90000),
('John Smith','1988-11-11','john@mail.com','998904444444','London','DD456','TAX444','Employed',300000);

INSERT INTO Branches (BranchName, Address, City, State, Country, ContactNumber)
VALUES
('Tashkent Central','Amir Temur St','Tashkent','Tashkent','Uzbekistan','+99871'),
('Samarkand Branch','Registan St','Samarkand','Samarkand','Uzbekistan','+99866');

INSERT INTO Accounts (CustomerID, AccountType, Balance, Currency, Status, BranchID)
VALUES
(1,'Savings',50000,'USD','Active',1),
(1,'Checking',20000,'USD','Active',1),
(2,'Business',150000,'USD','Active',2),
(3,'Savings',10000,'USD','Active',1),
(4,'Savings',250000,'USD','Active',2);

INSERT INTO Transactions (AccountID, TransactionType, Amount, Currency, Date, Status, ReferenceNo, Country)
VALUES
(1,'Transfer',15000,'USD','2026-02-12 10:00','Completed','REF1','Uzbekistan'),
(1,'Transfer',18000,'USD','2026-02-12 10:30','Completed','REF2','Uzbekistan'),
(2,'Withdrawal',20000,'USD','2026-02-12 09:00','Completed','REF3','USA'),
(2,'Withdrawal',22000,'USD','2026-02-12 09:08','Completed','REF4','Germany'),
(3,'Deposit',500,'USD','2026-02-11 12:00','Completed','REF5','Uzbekistan');

INSERT INTO FraudDetection (CustomerID, TransactionID, RiskLevel, ReportedDate)
VALUES
(2,3,'High','2026-02-12'),
(2,4,'High','2026-02-12');

INSERT INTO Loans (CustomerID, BranchID, LoanType, Amount, InterestRate, StartDate, EndDate, Status)
VALUES
(1,1,'Personal',10000,12,'2025-01-01','2027-01-01','Active'),
(1,1,'Auto',15000,10,'2025-06-01','2028-06-01','Active'),
(2,2,'Business',50000,9,'2024-01-01','2029-01-01','Active');

--1	Top 3 Customers with the Highest Total Balance Across All Accounts 
select top 3 c.FullName,c.customerid, sum(a.Balance) as Totalbalance from Customers c
join Accounts a
on c.CustomerID=a.CustomerID
group by c.Fullname ,c.customerid
order by Totalbalance desc
s
--2	Customers Who Have More Than One Active Loan
select c.CustomerID,c.FullName,count(l.LoanID) as Total from Customers c
join Loans l
on c.CustomerID=l.CustomerID
where l.Status='Active'
group by c.CustomerID,c.FullName
having count(l.Status)>1

--3	Transactions That Were Flagged as Fraudulent 
SELECT 
    c.FullName,
    t.TransactionID,
    t.TransactionType,
    t.Amount,
    f.RiskLevel,
    f.ReportedDate
FROM FraudDetection f
JOIN Customers c       ON f.CustomerID = c.CustomerID
JOIN Transactions t    ON t.TransactionID = f.TransactionID
ORDER BY t.Amount 

--4	Total Loan Amount Issued Per Branch
select * from Branches
select * from Loans
select b.BranchID ,
b.BranchName ,
sum(l.Amount) as Total_amount
from Branches b
join Loans l
on l.BranchID=b.BranchID
group by  b.BranchID , b.BranchName 

--5	Customers who made multiple large transactions (above $10,000) within a short time frame (less than 1 hour apart)
with cte as (select 
c.CustomerID,
t.TransactionID,
c.FullName,
t.Date,
t.Amount ,
lag(t.date) over(partition by c.customerid 
order by t.date ) as time_determine from Transactions t
join Accounts a
on t.AccountID=a.AccountID
join Customers c
on a.CustomerID=c.CustomerID
WHERE t.Amount > 10000 
)
select * from cte 
where DATEDIFF(MINUTE, time_determine , Date) <= 60

--6	Customers who have made transactions from different countries within 10 minutes, a common red flag for fraud.
with cte as (select 
c.CustomerID,
t.Country,lag(t.Country) over(partition by c.customerid order by t.date) as determine_country,
c.FullName,
t.Date,
t.Amount ,
lag(t.date) over(partition by c.customerid 
order by t.date ) as time_determine from Transactions t
join Accounts a
on t.AccountID=a.AccountID
join Customers c
on a.CustomerID=c.CustomerID
)
select * from cte 
where DATEDIFF(MINUTE, time_determine , Date) <= 10 and determine_country<>Country



