-- retrieving the details from the CpuLogData table
select * from [CpuLogData2019-11-17-new];

-- creating a function without a parameter
create function DisplayMessage()
returns varchar(100)
as
begin
return 'Welcome to Functions'
end

-- calling the function
select dbo.DisplayMessage();