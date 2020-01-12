USE [Employee]
GO

/****** Object:  StoredProcedure [dbo].[SP_NZShiftRoaster_Bulk_Insert]    Script Date: 1/12/2020 5:27:09 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Narender Singh>
-- Create date: <12-Jan-2020>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SP_NZShiftRoaster_Bulk_Insert]
	@DTNZShiftRoaster DTNZShiftRoaster  readonly
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	--select * from @DTNZShiftRoaster

	insert into [dbo].[NZShiftRoaster] (ShiftTypeId,EmpSapId,ShiftDate,StartTime,EndTime,CreatedBy)
	select ShiftTypeId,EmpSapId,ShiftDate,StartTime,EndTime,CreatedBy from @DTNZShiftRoaster

END
GO


