select * from Hired_Candidates;

-- beginning a transaction 
begin transaction
update Hired_Candidates set first_name = 'Murtuza', last_name = 'Nullwala' where id = 5;

-- committing a transaction
commit transaction; --uncommitted data is not saved in other connection

rollback transaction; --undo