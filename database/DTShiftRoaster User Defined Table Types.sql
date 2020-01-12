USE [Employee]
GO

/****** Object:  UserDefinedTableType [dbo].[DTNZShiftRoaster]    Script Date: 1/12/2020 5:27:49 PM ******/
CREATE TYPE [dbo].[DTNZShiftRoaster] AS TABLE(
	[ShiftTypeId] [int] NULL,
	[EmpSapId] [int] NULL,
	[ShiftDate] [date] NULL,
	[StartTime] [nvarchar](20) NULL,
	[EndTime] [nvarchar](20) NULL,
	[CreatedBy] [int] NULL
)
GO


