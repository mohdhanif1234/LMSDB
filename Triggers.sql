select * from User_Details;

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