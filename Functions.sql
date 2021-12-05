-- retrieving the details from the CpuLogData table
select * from [CpuLogData2019-11-17-new];

-- SCALAR FUNCTIONS - USER DEFINED FUNCTIONS
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

-- creating a scalar function with a multiple parameter
create function Substraction(@num1 as int, @num2 as int)
returns int
as 
begin
return(@num1 - @num2)
end

-- calling the function"
select dbo.Substraction(5,10);
select dbo.Substraction(5,6);
select dbo.Substraction(5,1);

-- altering a function
alter function TakeANumber(@num as int)
returns int
as 
begin
return(@num * @num * @num)
end

-- calling the function"
select dbo.TakeANumber(5);

-- dropping a function
 drop function dbo.TakeANumber;

 create function CheckVotersAge(@age as int)
 returns varchar(100)
 as 
 begin
	declare @str varchar(100)
	if @age >=18
	begin
		set @str = 'You are eligible to vote'
	end
	else 
	begin
		set @str = 'You are not eligible to vote'
	end
	return @str
 end

 -- calling the function
 select dbo.CheckVotersAge(20);
 select dbo.CheckVotersAge(15);

 -- creating a function to call another function
 create function GetMyDate()
 returns datetime
 as
 begin
	return getdate()
 end

 -- calling the function
 select dbo.GetMyDate();

 -- INLINE TABLE VALUED FUNCTIONS - USER DEFINED FUNCTIONS
 
 -- creating an inline table valued function without parameters
 create function fn_GetCpuLogData()
 returns table
 as
 return (select * from [CpuLogData2019-11-17-new])

 -- calling the function
 select * from dbo.fn_GetCpuLogData();

 -- creating an inline table valued function with parameters
 create function fn_GetCpuWorkTime(@Cpu_Working_Time1 float, @Cpu_Working_Time2 float)
 returns table
 as 
 return (select * from [CpuLogData2019-11-17-new] where Cpu_Working_Time >= @Cpu_Working_Time1 and Cpu_Working_Time <= @Cpu_Working_Time2)

 -- calling the function
 select * from dbo.fn_GetCpuWorkTime(2000,2500);

 select * from [CpuLogData2019-11-17-new];

 -- MULTISTATEMENT TABLE VALUED FUNCTIONS - USER DEFINED FUNCTIONS

-- creating a multistatment table valued parametrized function
 create function fn_GetCpuLogDataByCpuIdleTime(@cpu_idle_time float)
 returns @myTable table (Cpu_Avg_Load_Over_15_Mins float, User_Name varchar(50), Technology varchar(50))
 as 
 begin
	insert into @myTable
	select cpu_avg_load_over_15_min, user_name, technology from [CpuLogData2019-11-17-new] where Cpu_idle_Time = @cpu_idle_time
	return
 end

 -- calling the function to retrieve the table
 select * from [dbo].[fn_GetCpuLogDataByCpuIdleTime] (276422.96);
 select * from [dbo].[fn_GetCpuLogDataByCpuIdleTime] (269460.2);
 select * from [dbo].[fn_GetCpuLogDataByCpuIdleTime] (136340.09);
 select * from [dbo].[fn_GetCpuLogDataByCpuIdleTime] (276524.06);