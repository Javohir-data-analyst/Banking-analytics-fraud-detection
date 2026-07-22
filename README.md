Banking Analytics & Fraud Detection System
SQL-based relational database design for a bank moving off Excel-based data tracking, with fraud-detection and risk-analysis queries built on top.
What's in this project
Schema: Core banking tables — Customers, Accounts, Transactions, Branches, Employees (part of a larger 30+ table design; see SQL/Schema.sql)
Data: Sample data generated to test the schema; scaling to 10,000+ rows in progress
Fraud & risk queries: Top customers by balance, active-loan tracking, flagged fraudulent transactions, loan totals per branch, large-transaction pattern detection, and cross-country transaction alerts
Tech stack
SQL Server · T-SQL
Structure
``` ├── SQL/Schema.sql ├── presentation/ ├── screenshots/ └── README.md ```
Status
Core schema and all fraud-detection queries are complete. Remaining work: full-scale data generation and expanding to the rest of the 30-table design (loans, compliance, HR, investments).
