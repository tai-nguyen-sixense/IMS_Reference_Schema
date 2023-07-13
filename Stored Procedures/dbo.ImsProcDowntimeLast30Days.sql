SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
-- =============================================
-- Author:		Bender Rodrigez
-- Create date: 2021-08-31
-- Description:	Calculate downtime system for past 30 days
-- OutPut:		DownTine in Minutes or error ine string
-- Error:		in case of error, the details are logged in Files\log folder
-- =============================================

CREATE PROCEDURE [dbo].[ImsProcDowntimeLast30Days]
AS
BEGIN
	
	BEGIN TRY 
		DECLARE @ReferenceDate datetime;
		DECLARE @LimitDate datetime;
		DECLARE @DowntimeItem int;
		DECLARE @TotalDowntime int;

		SET @ReferenceDate = GETDATE();
		SET @LimitDate = DATEADD(D, -30, @ReferenceDate);
		SET @TotalDowntime = 0;

		------Initialize temp tables or calc purpose-------
		Create table #tempDate(
			Date dateTime
		);

		Create table #DateCalculated (
			Date datetime,
			DiffDate int
		);

		INSERT INTO #tempDate
			SELECT DISTINCT Date FROM [FlowData_10m] WHERE Date > @LimitDate AND Date < @ReferenceDate;
		INSERT INTO #tempDate (Date) values (@ReferenceDate);

		INSERT INTO #DateCalculated
			SELECT Date, DATEDIFF(MI, LAG(DATE) OVER(ORDER BY date), Date) FROM #tempDate;
		----------------------------------------------------

		--Check every interval supperior to 10min
		DECLARE Cursor_Date CURSOR FOR 
		SELECT DiffDate FROM #DateCalculated where DiffDate > 10;

		OPEN Cursor_Date 
			FETCH Cursor_Date INTO @DowntimeItem
			WHILE @@FETCH_STATUS = 0  	
			BEGIN
				--Add downtime to total (-10 because system is down after 10min without results)
				SET @TotalDowntime = @TotalDowntime + @DowntimeItem - 10;
				FETCH Cursor_Date INTO @DowntimeItem
			END
		CLOSE Cursor_Date;  	
		DEALLOCATE Cursor_Date;  

		--------REMOVE Temp Tables---------
		If(OBJECT_ID('tempdb..#tempDate') Is Not Null)
		BEGIN
			DROP TABLE #tempDate
		END

		If(OBJECT_ID('tempdb..#DateCalculated') Is Not Null)
		BEGIN
			DROP TABLE #DateCalculated
		END
		------------------------------------

		--RETURN RESULT
		SELECT @TotalDowntime
	END TRY  
	
	BEGIN CATCH 
		RETURN 'Sql Error- Number:' + cast (ERROR_NUMBER() as nvarchar(max)) + ' ;Message:' + ERROR_MESSAGE();
	END CATCH;

END
GO
