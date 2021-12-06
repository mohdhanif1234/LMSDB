select * from Hired_Candidates;

-- TRANSACTIONS IN SQL SERVER
-- beginning a transaction 
begin transaction --explicit transaction 
update Hired_Candidates set first_name = 'Murtuza', last_name = 'Nullwala' where id = 4;

-- committing a transaction
commit transaction; --uncommitted data is not saved in other connection

rollback transaction; --undo 

-- delete transaction
delete Hired_Candidates where id = 5;

-- TRY CATCH IN SQL SERVER
 
 begin try
 select 10/0
 select * from Hired_Candidates
 end try
 begin catch
	print 'You cannot divide a number by zero'
 end catch