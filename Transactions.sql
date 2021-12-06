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

 -- Retrieving Error Information

 begin try
 update Hired_Candidates set last_name = 25 where id = 2
 end try
 begin catch
	select
	ERROR_NUMBER() as [Error Number],
	ERROR_SEVERITY() as [Error Severity],
	ERROR_STATE() as [Error State Number],
	ERROR_PROCEDURE() as [SP Name],
	ERROR_LINE() as [Error Line Number],
	ERROR_MESSAGE() as [Error Message Text]
 end catch

 -- creating a stored procedure to retrieve the SP name also
 create procedure sp_MyNewProcedure
 as
 begin
 begin try
 update Hired_Candidates set last_name = 25 where id = 2
 end try
 begin catch
	select
	ERROR_NUMBER() as [Error Number],
	ERROR_SEVERITY() as [Error Severity],
	ERROR_STATE() as [Error State Number],
	ERROR_PROCEDURE() as [SP Name],
	ERROR_LINE() as [Error Line Number],
	ERROR_MESSAGE() as [Error Message Text]
 end catch
 end

 -- TRANSACTIONS WITH TRY CATCH

 select * from Hired_Candidates;

 begin try
 begin transaction
 insert into Hired_Candidates values('Murtuza','Shabbir','Nulwala','ftgrh@gmail.com','54541616','Pune','2020-10-07','Mtech','75.65','769042','754285','Developer','good','good','good','good','','1');
 insert into Hired_Candidates values('Manzur','Dilawar','Sarguru','qgfwyqgfy@gmail.com','844616163','Mumbra','2020-10-07','Mtech','75.65','769042','754285','Developer','good','good','good','good','','1');
 insert into Hired_Candidates values('Juned','Danish','Qureshi','qaqsw@gmail.com','5515151','Delhi','2020-10-07','Mtech','75.65','769042','754285','Developer','good','good','good','good','','1');
 commit transaction --permanent data save
 print 'Transaction Successfully Done !!';
 end try

 begin catch
 rollback transaction
 print 'Transaction Failed';
 end catch
 select ERROR_MESSAGE() as [Error Message];
 select * from Hired_Candidates;