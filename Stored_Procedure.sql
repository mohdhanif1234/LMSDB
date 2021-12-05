--retrieving data from Fellowship_Candidates table
select * from Fellowship_Candidates;

-- creating a stored procedure for getting the first name and mobile number of the candidates
create procedure spGetFellowshipCandidatesDetails
as
begin
select first_name,mobile_num from Fellowship_Candidates;
end

 execute spGetFellowshipCandidatesDetails;

