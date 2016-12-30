/*
** This file contains examples from 'Module 15: Managing Transactions and
** Locks'.  To use the file, highlight and execute each example.
**
**SQL Server Transactions
**
**Example
**This example defines a transaction to transfer funds between the 
**checking and savings accounts of a customer.
**Ficticious example; will not execute.
*/
use library
go
BEGIN TRAN fund_transfer
   EXEC debit_checking 100, 'account1'
   EXEC credit_savings 100, 'account1'
COMMIT TRAN fund_transfer
go

/*
**Transaction Isolation Level
**
**Example
**The following example sets the isolation level for the current session 
**to READ UNCOMMITTED and then checks DBCC USEROPTIONS to verify that 
**SQL Server has made the change.
*/
SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED
DBCC USEROPTIONS
go

/*
**Locking Timeout
**
**Example
**This example sets the lock timeout period to 180,000 milliseconds.
*/
SET LOCK_TIMEOUT 180000
go

/*
**Example
**This example displays the current @@lock_timeout setting.
*/
SELECT @@lock_timeout
go

/*
**sp_lock System Stored Procedure
**
**The sp_lock system stored procedure returns information about active 
**locks in SQL Server. 
*/
EXECUTE sp_lock
go

/*
**End of File
*/