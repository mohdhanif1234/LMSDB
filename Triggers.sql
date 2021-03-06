select * from User_Details;

-- DML Triggers
-- creating a trigger for insert
create trigger tr_Candidate_ForInsert
on User_Details
after insert
as 
begin
	print 'Something happened to the User_Details table';
end

-- inserting the data in the table for activating the trigger
insert into User_Details values('rani@gmail.com','Rani','Gupta','326vxh@yu',54161151515,1);

-- altering the trigger
alter trigger tr_Candidate_ForInsert
on User_Details
after insert
as 
begin
	select * from inserted
end

-- inserting the data in the table for activating the trigger
insert into User_Details values('vidya@gmail.com','Vidya','Sagar','4854dcrdre@yu',11641116,1);

-- creating a delete trigger
create trigger tr_Candidate_ForDelete
on User_Details
after delete
as 
begin
	select * from deleted
end

-- retrieving the data from the table
select * from User_Details;

-- deleting theb data from the table and displaying the deleted data with the help of deleted keyword
delete from User_Details where id = 5;
delete from User_Details where id = 6;

-- creating User_Audit table
create table User_Audit 
(
Audit_Id int primary key identity,
Audit_Info varchar(max)
);

select * from User_Audit;

-- creating a trigger for candidate audit for insert operation
create trigger tr_User_Audit_ForInsert
on User_Details
after insert
as 
begin
	declare @id int
	select @id = id from inserted
	insert into User_Audit 
	values ('Candidate with id: ' + cast(@id as varchar(50)) + ' is added at ' + cast(getdate() as varchar(50)))
end

-- inserting values in the table
insert into User_Details values('samiksha@gmail.com','Samiksha','Chaudhari','9fdfvfvc@yu',56515616,1);

-- creating trigger to get the audit report for the deleted user
create trigger tr_User_Audit_ForDelete
on User_Details
after delete
as 
begin
	declare @id int
	select @id = id from deleted
	insert into User_Audit 
	values ('Existing user with id ' + cast(@id as varchar(50)) + ' is deleted at ' + cast(getdate() as varchar(50)))
end

select * from User_Details;

-- deleting an existing user and getting the audit report for the deleted user
delete from User_Details where id = 9;

select * from User_Audit;

-- creating a trigger for updating the data
create trigger tr_User_ForUpdate
on User_Details
after update
as 
begin
	select * from inserted
	select * from deleted
end

select * from User_Details;

-- updating the table
update User_Details set first_name = 'Noor', last_name = 'Khan' where id = 8;

-- viewing the code of the trigger
sp_helptext [tr_User_Audit_ForInsert];

-- DML INSTEAD OF TRIGGERS

-- creating instead of insert trigger (This trigger does not allow any value to be inserted in the table)
create trigger tr_User_InsteadOf_Insert
on User_Details
instead of insert
as 
begin
	print 'You are not allowed to insert data in this table !!'
end

-- inserting values in the table
insert into User_Details values('murtuza@gmail.com','Murtuza','Nullwala','bjbdshcbjs@yu',456845,1);

select * from User_Details;

-- creating instead of update trigger (This trigger does not allow any value to be updated in the table)
create trigger tr_User_InsteadOf_Update
on User_Details
instead of update
as 
begin
	print 'You are not allowed to update data in this table !!'
end

-- updating values in the table
update User_Details set first_name = 'Mohd', last_name = 'Haneef' where id = 1;

select * from User_Details;

-- creating instead of delete trigger (This trigger does not allow any value to be deleted from the table)
create trigger tr_User_InsteadOf_Delete
on User_Details
instead of delete
as 
begin
	print 'You are not allowed to delete data from this table !!'
end

-- deleting values from the table
delete from User_Details where id = 1;

select * from User_Details;

-- creating user audit table
create table tbl_User_Audit
( audit_id int primary key identity,
audit_information varchar(max)
);

select * from tbl_User_Audit;

-- creating an audit trigger which will display the given message in audit table to indicate if 
--someone has tried to insert any data in the User_Details table, 
-- but this query will not work since an instead of insert trigger has already been created for the User_Details table
create trigger tr_User_InsteadOf_Insert_Audit
on User_Details
instead of insert
as 
begin
	insert into tbl_User_Audit
	values ('Someone tried to insert the data in User_Details table at: ' + cast(getdate() as varchar(50)))
end

-- deleting the previously created instead of insert trigger
drop trigger[tr_User_InsteadOf_Insert];

-- inserting the data in the table
insert into User_Details values('murtuza@gmail.com','Murtuza','Nullwala','bjbdshcbjs@yu',456845,1);

-- retrieving the data in the audit table
select * from tbl_User_Audit;
select * from User_Details;

-- creating an audit trigger which will display the given message in audit table to indicate if 
--someone has tried to update any data in the User_Details table, 
-- but this query will not work since an instead of update trigger has already been created for the User_Details table
create trigger tr_User_InsteadOf_Update_Audit
on User_Details
instead of update
as 
begin
	insert into tbl_User_Audit
	values ('Someone tried to update the data in User_Details table at: ' + cast(getdate() as varchar(50)))
end

-- deleting the previously created instead of  update trigger
drop trigger[tr_User_InsteadOf_Update];

-- updating the data in the table
update User_Details set first_name = 'Mohd', last_name = 'Haneef' where id = 1;

-- retrieving the data in the audit table
select * from tbl_User_Audit;

-- creating an audit trigger which will display the given message in audit table to indicate if 
--someone has tried to delete any data from the User_Details table, 
-- but this query will not work since an instead of update trigger has already been created for the User_Details table
create trigger tr_User_InsteadOf_Delete_Audit
on User_Details
instead of delete
as 
begin
	insert into tbl_User_Audit
	values ('Someone tried to delete the data from User_Details table at: ' + cast(getdate() as varchar(50)))
end

-- deleting the previously created instead of delete trigger
drop trigger[tr_User_InsteadOf_Delete];

-- deleting the data from the table
delete from User_Details where id = 1;

-- retrieving the data in the audit table
select * from tbl_User_Audit;

-- DDL TRIGGERS

-- creating a DDL trigger for table creation
create trigger tr_ddl_table_create
on database
for CREATE_TABLE
as
begin
	print 'New table created !!'
end

-- creating table named Test_Table
create table Test_Table (id int);

-- creating a DDL trigger for altering a table
create trigger tr_ddl_table_alter
on database
for ALTER_TABLE
as
begin
	print 'You have altered a table !!'
end
 
-- altering the table by adding the column of gender
alter table User_Details add
gender varchar(10);

-- retrieving the data from the table
select * from User_Details;

-- creating a DDL trigger for dropping a table
create trigger tr_ddl_table_drop
on database
for DROP_TABLE
as
begin
	print 'You have dropped a table !!'
end
 
 -- dropping a table
drop table Test_Table;

-- creating a single trigger for create, alter and drop events
create trigger tr_ddl_table_for_three_events
on database 
for CREATE_TABLE, ALTER_TABLE, DROP_TABLE
as
begin
	print 'You have just created, altered or dropped a table !!';
end

create table Test_Table (id int);
drop table Test_Table;

-- creating a trigger to restrict the creation of a stored procedure
create trigger tr_ddl_SP_CREATE
on database 
for CREATE_PROCEDURE
as
begin
	rollback --rollback command will not allow the stored procedure to be created
	print 'You are not allowed to create a stored procedure !!';
end

select * from User_Details;

-- creating a stored procedure for data insertion
create procedure sp_myProcedureForInsertion
as
begin
	insert into User_Details values('murtuza@gmail.com','Murtuza','Nullwala','bjbdshcbjs@yu',456845,1,'male');
end

-- disabling the trigger
disable trigger tr_ddl_SP_CREATE on database;
-- enabling the trigger
enable trigger tr_ddl_SP_CREATE on database;