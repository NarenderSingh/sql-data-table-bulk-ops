USE [Employee]
GO

/****** Object:  Table [dbo].[NZShiftRoaster]    Script Date: 1/12/2020 5:26:04 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[NZShiftRoaster](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ShiftTypeId] [int] NULL,
	[EmpSapId] [int] NULL,
	[ShiftDate] [date] NULL,
	[StartTime] [nvarchar](50) NULL,
	[EndTime] [nvarchar](50) NULL,
	[CreatedBy] [int] NULL,
	[CreatedDate] [datetime] NULL,
	[UpdatedBy] [int] NULL,
	[UpdatedDate] [datetime] NULL,
	[UserId] [int] NULL,
	[IsActive] [bit] NULL,
 CONSTRAINT [PK_NZShiftRoaster] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO


