select * from [dbo].[CpuLogData2019-11-17-new];

-- creating an index to sort the cpu idle time in ascending order
create index ix_CpuLogData_CpuIdleTime
on [CpuLogData2019-11-17-new] (Cpu_idle_Time asc);

select * from [dbo].[CpuLogData2019-11-17-new] where Cpu_idle_Time > 100000 and Cpu_idle_Time < 200000;

alter table [CpuLogData2019-11-17-new] add Id int primary key identity;

-- creating a cluster index
create clustered index ix_CpuLogData_Id_Clustered
on [CpuLogData2019-11-17-new] (Id asc);

-- creating one cluster index for multiple columns
create clustered index ix_CpuLogData_CpuWorkTime_CpuPercent_Clustered
on [CpuLogData2019-11-17-new] (Cpu_idle_time desc, cpu_percent asc);

sp_helpindex [CpuLogData2019-11-17-new];