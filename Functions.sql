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

-- creating a scalar function with a single parameter
create function TakeANumber(@num as int)
returns int
as 
begin
return(@num * @num)
end

-- calling the function"
select dbo.TakeANumber(5);