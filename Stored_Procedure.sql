--retrieving data from Fellowship_Candidates table
select * from Fellowship_Candidates;

-- creating a stored procedure for getting the first name and mobile number of the candidates
create procedure spGetFellowshipCandidatesDetails
as
begin
select first_name,mobile_num from Fellowship_Candidates;
end

 execute spGetFellowshipCandidatesDetails;

 -- creating a stored procedure with a single parameter
 create procedure spGetCandidatesById
 @Id int
 as 
 begin
 select * from Fellowship_Candidates where id = @Id;
 end

 execute spGetCandidatesById 2;

 -- creating a stored procedure with multiple parameters
 create procedure spGetCandidatesByIdAndEmail
 @Id int,
 @Email varchar(100)
 as
 begin
 select * from Fellowship_Candidates where id = @Id and email = @Email;
 end

 execute spGetCandidatesByIdAndEmail 1, 'hani@gmail.com';

 -- altering the stored procedure
 alter procedure spGetCandidatesByIdAndEmail
 @Id int,
 @Email varchar(100)
 as
 begin
 select first_name, mobile_num from Fellowship_Candidates where id = @Id and email = @Email;
 end

 execute spGetCandidatesByIdAndEmail 1, 'hani@gmail.com';

 -- seeing the text of the stored procedure
 sp_helptext spGetCandidatesByIdAndEmail;

 -- deleting a stored procedure
 drop procedure spGetCandidatesByIdAndEmail;

 -- using 'with encryption' in stored procedures (It encrypts the text of a particular stored procedure which we want to view)
 alter procedure spGetCandidatesByIdAndEmail
 @Id int,
 @Email varchar(100)
 with encryption
 as
 begin
 select first_name, mobile_num from Fellowship_Candidates where id = @Id and email = @Email;
 end

sp_helptext spGetCandidatesByIdAndEmail;