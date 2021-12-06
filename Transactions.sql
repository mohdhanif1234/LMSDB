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
 update Hired_Candidates set last_name = 25 where id = 2
 end try
 begin catch
	print 'You cannot insert an integer in a string column'
 end catch