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