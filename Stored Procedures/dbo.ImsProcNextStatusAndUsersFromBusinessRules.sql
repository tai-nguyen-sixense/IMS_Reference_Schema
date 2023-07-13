SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[ImsProcNextStatusAndUsersFromBusinessRules]  @Type nvarchar(max), @Id uniqueidentifier, @UserId uniqueidentifier
	
AS
BEGIN
	
	SET NOCOUNT ON;

	--use temporary table to define output
    DECLARE @returnValue AS TABLE
    (
        knwlStatuId UNIQUEIDENTIFIER,
        userId UNIQUEIDENTIFIER,
        teamId UNIQUEIDENTIFIER	
    );
	
	BEGIN TRY  

		DECLARE @TeamId uniqueidentifier
		IF (@Type='inspection')
			BEGIN

				-- declare parameter
				DECLARE @CurrentInspectionStatusId uniqueidentifier
				DECLARE @CurrentInspectionTypeId uniqueidentifier
				-- Custom defined special inspection statuses NOT USED FOR CALGARY AT THE MOMENT
				Declare @specialInspections as Table (
						inspectionTypeId uniqueidentifier,
						extraStatusId uniqueidentifier)
	
				-- select parameter
				select  @TeamId=Teamid, @CurrentInspectionStatusId=InspectionStatusId from Inspection where Id=@Id
				set @CurrentInspectionTypeId = (select inspectionTypeId from InspectionMaster where id = (select inspectionmasterid from inspection where id = @Id))

				-- select inspectionstatus and users depending on busisness rules 
				insert into @returnValue	
					select distinct [InspectionStatusToId], User_Role_Team.UserId, User_Role_Team.TeamId
					from [BR_InspectionStatus] 
							inner join (select RoleId 
										from User_Role_Team 
										where Teamid=@TeamId and UserId=@UserId 
										group by RoleId) TableUserRolefromId on TableUserRolefromId.RoleId=[BR_InspectionStatus].RoleFromId
							inner join User_Role_Team on User_Role_Team.RoleId=[BR_InspectionStatus].RoleToId 
					where [InspectionStatusFromId]=@CurrentInspectionStatusId 
						and (case when[BR_InspectionStatus].[SameTeamOnly]=0 then 1
									when [BR_InspectionStatus].[SameTeamOnly]=1 then iif(User_Role_Team.Teamid=@TeamId,1,0) end)=1
						and (case 
							when InspectionStatusToId in (select extraStatusId from @specialInspections where InspectionTypeId = @CurrentInspectionTypeId) then 1 
							when InspectionStatusToId not in (select extraStatusId from @specialInspections) then 1
							else 0 end) = 1 
			END

		IF (@Type='flag')
			BEGIN
			-- declare parameter
				DECLARE @CurrentFlagStatusId uniqueidentifier
				select @TeamId = (select top 1 teamId from User_Role_Team where Userid = @UserId), @CurrentFlagStatusId = (select FlagStatusId from Flag where id = @Id)
				-- select flagtatus and users depending on busisness rules 
				insert into @returnValue 
					select distinct [FlagStatusToId], User_Role_Team.UserId, User_Role_Team.TeamId
					from [BR_FlagStatus] 
							inner join (select RoleId 
										from User_Role_Team 
										where Teamid=@TeamId and UserId=@UserId 
										group by RoleId) TableUserRolefromId on TableUserRolefromId.RoleId=[BR_FlagStatus].RoleFromId
							inner join User_Role_Team on User_Role_Team.RoleId=[BR_FlagStatus].RoleToId 
					where [FlagStatusFromId]=@CurrentFlagStatusId 
						and (case when[BR_FlagStatus].[SameTeamOnly]=0 then 1
									when [BR_FlagStatus].[SameTeamOnly]=1 then iif(User_Role_Team.Teamid=@TeamId,1,0) end)=1
			
			END

		IF (@Type='audit')
			BEGIN
				-- declare parameter
				DECLARE @CurrentAuditStatusId uniqueidentifier
	
				-- select parameter
				select  @TeamId=(select Teamid from Inspection where id = (select InspectionId from [Audit] where id = @Id))

				insert into @returnValue 
					select distinct Id, User_Role_Team.UserId, User_Role_Team.TeamId
					from [AuditStatus] 
							cross join User_Role_Team 
					where User_Role_Team.UserId in (select distinct userId from User_Role_Team where TeamId = @TeamId)
					
			END

		IF (@Type = 'activity')
			BEGIN
				DECLARE @CurrentActivityStatusId uniqueidentifier
				select @TeamId = (select top 1 teamId from User_Role_Team where Userid = @UserId)
				select @CurrentActivityStatusId = (select ActivityStatusId from Activity where id = @Id)
				insert into @returnValue
					select distinct [ActivityStatusToId], User_Role_Team.UserId, User_Role_Team.TeamId
					from BR_ActivityStatus
					inner join (select RoleId 
										from User_Role_Team 
										where Teamid=@TeamId and UserId=@UserId 
										group by RoleId) TableUserRolefromId on TableUserRolefromId.RoleId=[BR_ActivityStatus].RoleFromId
							inner join User_Role_Team on User_Role_Team.RoleId=[BR_ActivityStatus].RoleToId 
							where [ActivityStatusFromId] = @CurrentActivityStatusId
							and (case when[BR_ActivityStatus].[SameTeamOnly]=0 then 1
									when [BR_ActivityStatus].[SameTeamOnly]=1 then iif(User_Role_Team.Teamid=@TeamId,1,0) end)=1
			END
	
		--return temporary table
		SELECT * from @returnValue
	
	END TRY  
	
	BEGIN CATCH 
		--get error message
	    Declare @msg nvarchar(max) ;
		set  @msg = cast(ERROR_NUMBER() as nvarchar(max)) + '-' + ERROR_MESSAGE();

		--return actual table
		SELECT * from @returnValue
	END CATCH;
	
END
GO
