select * from Hired_Candidates;

-- beginning a transaction 
begin transaction
update Hired_Candidates set first_name = 'Ali', last_name = 'Bhai' where id = 5;

-- committing a transaction
commit transaction;