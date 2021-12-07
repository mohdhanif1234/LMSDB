select * from [dbo].[CpuLogData2019-11-17-new];

-- creating an index to sort the cpu idle time in ascending order
create index ix_CpuLogData_CpuIdleTime
on [CpuLogData2019-11-17-new] (Cpu_idle_Time asc);

select * from [dbo].[CpuLogData2019-11-17-new] where Cpu_idle_Time > 100000 and Cpu_idle_Time < 200000;