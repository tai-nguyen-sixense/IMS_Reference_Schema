SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

-- =============================================
-- Author:		Vincent Morisseau
-- Create date: 2017-11-17
-- Description:	Run on demand by end user
-- InPut:		@Id = ALccScenari.Id, @UserId = Loggged User Id
-- OutPut:		nvarchar(max) return to the end user or error in string format
-- Error:		in case of error, the details are logged in Files\log folder
-- =============================================

CREATE PROCEDURE [dbo].[ImsProcALccScenariRun] @Id UNIQUEIDENTIFIER, @UserId UNIQUEIDENTIFIER, @ConstraintType NVARCHAR(MAX)
AS BEGIN
    DECLARE @returnRun AS NVARCHAR(MAX);
    BEGIN TRY
        DECLARE @AssetId UNIQUEIDENTIFIER;
        DECLARE @ActivityId UNIQUEIDENTIFIER;
        DECLARE @LastCompletedInspectionId UNIQUEIDENTIFIER;
        DECLARE @BCI NVARCHAR(MAX);
        DECLARE @ExpansionJointsAge INT;
        DECLARE @DeckWearingSurfaceAge INT;
        DECLARE @TimberDeckAge INT;
        DECLARE @MinorRehab INT;
        DECLARE @CriticalFlagCount INT;
        DECLARE @YearofMinorRehabilitation NVARCHAR(MAX);
        DECLARE @ActivityComponentId as UNIQUEIDENTIFIER;
        DECLARE @ActivityComponenttypeId as UNIQUEIDENTIFIER;

		
        DECLARE @AssetName NVARCHAR(MAX);
        DECLARE @AssetNumber NVARCHAR(MAX);
        DECLARE @ASSETLoadRestrictionAttribute UNIQUEIDENTIFIER='49F73EEA-FD87-2E6C-95EF-EA17C16C682F';
        DECLARE @ASSETNoOverloadsAllowedAttribute UNIQUEIDENTIFIER='E86D72BF-FEE3-6CCF-9738-82A4A49B650F';
        DECLARE @ASSETTrussBottomChordConcernsAttribute UNIQUEIDENTIFIER='D4350722-3AB3-8947-068C-286D0621AD16';
        DECLARE @ASSETStressingStrandCorrosionAttribute UNIQUEIDENTIFIER='EAC0DE47-5135-D802-30FC-68BC8372CF65';
        DECLARE @ASSETGirderDropinSpanCorbelDetailAttribute UNIQUEIDENTIFIER='07686264-0951-AC31-0E8A-6C4024CFB033';
        DECLARE @ASSETPedestrianStairsinPoorConditionAttribute UNIQUEIDENTIFIER='0E54BF77-846A-7E0F-3AA4-B6BA48B1B50D';
        DECLARE @ASSETTwoorlessGirderLinesAttribute UNIQUEIDENTIFIER='24BB3E07-EB04-79DE-AFC1-1AABEB734A4A';
        DECLARE @ASSETRetainingWallStabilityIssuesAttribute UNIQUEIDENTIFIER='43D31709-DB6E-FCA5-DDBC-7FD7D5E36667';
        DECLARE @ASSETSteelTrafficBarriersAttribute UNIQUEIDENTIFIER='5377D68B-4D73-E13C-CF6C-3385FA7885FF';
        DECLARE @ASSETVehicleBridgeTimberSubstructureAttribute UNIQUEIDENTIFIER='854A8583-9EC0-EC3D-2E0D-AD010FF2FD56';
        DECLARE @ASSETNonStressedGirderRebarCorrosionAttribute UNIQUEIDENTIFIER='8C15E0F8-2E9A-F984-5020-2427F8A55BE7';
        DECLARE @ASSETRockerBearingsExistAttribute UNIQUEIDENTIFIER='97A92A31-219D-DDFD-400B-84C29DFD0970';
        DECLARE @ASSETFatigueProneGirdersAttribute UNIQUEIDENTIFIER='AC2C40C8-99A6-F833-7E29-6EBA71E2DA1B';
        DECLARE @ASSETPedestrianRailingSystemsPoorAttribute UNIQUEIDENTIFIER='F63E34ED-D691-EA29-98F2-8E668F763207';
        DECLARE @ASSETScourConcernAttribute UNIQUEIDENTIFIER='ae37bb96-e6ec-30b0-92fd-ca5fdd3c84f9';
        DECLARE @ASSETLoadRestriction NVARCHAR(MAX);
        DECLARE @ASSETNoOverloadsAllowed NVARCHAR(MAX);
        DECLARE @ASSETTrussBottomChordConcerns NVARCHAR(MAX);
        DECLARE @ASSETStressingStrandCorrosion NVARCHAR(MAX);
        DECLARE @ASSETGirderDropinSpanCorbelDetail NVARCHAR(MAX);
        DECLARE @ASSETPedestrianStairsinPoorCondition NVARCHAR(MAX);
        DECLARE @ASSETTwoorlessGirderLines NVARCHAR(MAX);
        DECLARE @ASSETRetainingWallStabilityIssues NVARCHAR(MAX);
        DECLARE @ASSETSteelTrafficBarriers NVARCHAR(MAX);
        DECLARE @ASSETVehicleBridgeTimberSubstructure NVARCHAR(MAX);
        DECLARE @ASSETNonStressedGirderRebarCorrosion NVARCHAR(MAX);
        DECLARE @ASSETRockerBearingsExist NVARCHAR(MAX);
        DECLARE @ASSETFatigueProneGirders NVARCHAR(MAX);
        DECLARE @ASSETPedestrianRailingSystemsPoor NVARCHAR(MAX);
        DECLARE @ASSETScourConcern NVARCHAR(MAX);
        DECLARE @InspectionDeckRatingPoorPercent REAL;
        DECLARE @InspectionDeckRatingFairPercent REAL;
        DECLARE @InspectionPierRatingFairPercent REAL;
        DECLARE @InspectionAbutmentRatingFairPercent REAL;
        DECLARE @InspectionBridgeBarrierRatingFairPercent REAL;
        DECLARE @InspectionGirderRatingPoorPercent REAL;
        DECLARE @InspectionExpansionJointRatingPoorPercent REAL;
        DECLARE @InspectionWearingSurfaceRatingPoorPercent REAL;
        DECLARE @InspectionSidewalkRatingPoorPercent REAL;
        DECLARE @InspectionBottomChordPoorPercent REAL;
        DECLARE @InspectionBridgeBarrierRatingPoorPercent REAL;
        DECLARE @InspectionPierRatingPoorPercent REAL;
        DECLARE @InspectionAbutmentRatingPoorPercent REAL;
		DECLARE @InspectionConnectionsRatingPoorPercent REAL;
		DECLARE @AssetDeckTopArea REAL;
		DECLARE @Recommendation nvarchar(max);
		DECLARE @RepairCost float;
		DECLARE @BenefitCostRatio float;
		DECLARE @ActivityTypeId uniqueidentifier;
		DECLARE @TotalCosts float = 0;
		DECLARE @Budget float = (SELECT Budget FROM ALccScenari WHERE Id = @Id);
        DECLARE @DebugImprovedBCI NVARCHAR(MAX);
        DECLARE @DebugPath NVARCHAR(MAX);
        DECLARE @DebugInfo NVARCHAR(MAX);
		DECLARE @DebugMode bit
		DECLARE @BCIValue float = (SELECT BCI FROM ALccScenari WHERE Id = @Id);
		DECLARE @BCIDiffValue float = 0;



 CREATE TABLE #deteriorationvalues (AssetId uniqueidentifier, AssetComponentId uniqueidentifier, ComponentTypeId uniqueidentifier, ComponentTypeName nvarchar(max), InspectionYear int, ConditionsforYear int, Condition1Percent float, Condition2Percent float, Condition3Percent float, Condition4Percent float, Condition1 float, Condition2 float, Condition3 float, Condition4 float);
 CREATE TABLE #BCIValues (AssetId uniqueidentifier, year int, CEV float, TEV float, BCI float, Recommendation nvarchar(max), RepairCost float, BenefitCostRatio float, BCIAfterRepair float, BestToRepair bit, AlgoPath NVARCHAR(max), DebugInfo NVARCHAR(max));
 DECLARE @beginYear  int;
 DECLARE @endYear  int;
 DECLARE @newcondition1 float;
 DECLARE @newcondition2 float;
 DECLARE @newcondition3 float;
 DECLARE @newcondition4 float;
 DECLARE @Sum_CEV FLOAT, @Sum_TEV FLOAT;

	  SELECT @beginYear=BeginYear,@endYear=EndYear FROM ALccScenari WHERE Id= @Id
	  set @DebugMode = 1

 -- Get Assets from ALccScenari_Asset
	  --Begin cursor_Assets
	  DECLARE cursor_Assets CURSOR FOR 
		SELECT AssetId FROM ALccScenari_Asset WHERE ALccScenariId= @Id
	  
	  OPEN cursor_Assets
	  FETCH cursor_Assets INTO @AssetId
	  WHILE @@FETCH_STATUS = 0
		BEGIN
			
			--Begin cursor_ComponentTypes
		    DECLARE @ComponentTypeId uniqueidentifier;
			DECLARE cursor_ComponentTypes CURSOR FOR 
				--SELECT DISTINCT(ComponentTypeId) FROM ImsView_ALcc_AssetComponent_Conditions    the request on view are too long
				SELECT DISTINCT(ComponentTypeId) FROM ImsView_ALcc_AssetComponent_Conditions  -- ALcc_AssetComponent_Conditions is a copy of ImsView_ALcc_AssetComponent_Conditions
									WHERE AssetId=@AssetId AND Condition1+Condition2+Condition3+Condition4>0 AND YEAR(InspectionDate)<=@beginYear

			OPEN cursor_ComponentTypes
			FETCH cursor_ComponentTypes INTO @ComponentTypeId

			WHILE @@FETCH_STATUS = 0
				BEGIN
			
--Get last known inspection data
					DECLARE @InitialCondition1 as float;
					DECLARE @InitialCondition2 as float;
					DECLARE @InitialCondition3 as float;
					DECLARE @InitialCondition4 as float;
					DECLARE @TotalQuantity as float;
					DECLARE @YearLastInspection as int;
					DECLARE @InspectionDate as smalldatetime;
					DECLARE @ComponentTypeName as nvarchar(max);
					DECLARE @AssetComponentId as uniqueidentifier;
					SELECT TOP(1) @InitialCondition1=Condition1,
						   @InitialCondition2=Condition2,
						   @InitialCondition3=Condition3,
						   @InitialCondition4=Condition4,
						   @TotalQuantity=Condition1+Condition2+Condition3+Condition4,
						   @YearLastInspection=YEAR(InspectionDate),
						   @InspectionDate=InspectionDate,
						   @ComponentTypeName=ComponentTypeName,
						   @AssetComponentId = AssetComponentId
						 FROM ImsView_ALcc_AssetComponent_Conditions
						 WHERE AssetId=@AssetId AND ComponentTypeId=@ComponentTypeId AND Condition1+Condition2+Condition3+Condition4>0  AND YEAR(InspectionDate)<=@beginYear order by InspectionDate desc
			

								--Get Matrix
								DECLARE @M11 float, @M12 float, @M13 float, @M14 float;
								DECLARE @M21 float, @M22 float, @M23 float, @M24 float;
								DECLARE @M31 float, @M32 float, @M33 float, @M34 float;
								DECLARE @M41 float, @M42 float, @M43 float, @M44 float;

								SELECT @M11=M11, @M12=M12, @M13=M13, @M14=M14,
										@M21=M21, @M22=M22, @M23=M23, @M24=M24,
										@M31=M31, @M32=M32, @M33=M33, @M34=M34,
										@M41=M41, @M42=M42, @M43=M43, @M44=M44
  								FROM ALccComponentTypeDeteriorationLaw WHERE ComponentTypeId=@ComponentTypeId 
			
								DECLARE @year int;
								SET @year=@YearLastInspection;


								--apply matrice
								DECLARE @condition1 float, @condition2 float, @condition3 float, @condition4 float ;
								SET @condition1=@InitialCondition1;
								SET @condition2=@InitialCondition2;
								SET @condition3=@InitialCondition3;
								SET @condition4=@InitialCondition4;

								WHILE (@year<=(@endYear))
								BEGIN
								
									--Calculation of condition for current year
									 SET @newcondition1=@condition1*@M11 + @condition2*@M21 + @condition3*@M31 + @condition4*@M41;
									 SET @newcondition2=@condition1*@M12 + @condition2*@M22 + @condition3*@M32 + @condition4*@M42;
									 SET @newcondition3=@condition1*@M13 + @condition2*@M23 + @condition3*@M33 + @condition4*@M43;
									 SET @newcondition4=@condition1*@M14 + @condition2*@M24 + @condition3*@M34 + @condition4*@M44;

									 if(@year >= @beginYear)
										BEGIN
											 INSERT INTO #deteriorationvalues (AssetId, 
																				AssetComponentId,
																				ComponentTypeId, 
																				ComponentTypeName, 
																				InspectionYear, 
																				ConditionsforYear, 
																				Condition1Percent, 
																				Condition2Percent, 
																				Condition3Percent, 
																				Condition4Percent,
																				Condition1, 
																				Condition2, 
																				Condition3, 
																				Condition4)
											 VALUES(@AssetId, @AssetComponentId, @ComponentTypeId, @ComponentTypeName, @YearLastInspection, @year, 
													@condition1/(@condition1+@condition2+@condition3+@condition4)*100,
													@condition2/(@condition1+@condition2+@condition3+@condition4)*100,
													@condition3/(@condition1+@condition2+@condition3+@condition4)*100,
													@condition4/(@condition1+@condition2+@condition3+@condition4)*100,
													@condition1, @condition2, @condition3, @condition4)
										END

									 SET @year=@year+1;
									 SET @condition1 = @newcondition1
									 SET @condition2 = @newcondition2
									 SET @condition3 = @newcondition3
									 SET @condition4 = @newcondition4
								END
								--CONTINUE
					FETCH cursor_ComponentTypes INTO @ComponentTypeId
				END

			CLOSE cursor_ComponentTypes
			DEALLOCATE cursor_ComponentTypes	

			--Total Equivalent Value (TEV)

                 SELECT @Sum_TEV = SUM(CAST(componentattributevalue.Value AS FLOAT)*CAST(CASE
                                                                                             WHEN Material.value LIKE '%Wood%'
                                                                                             THEN CASE
                                                                                                      WHEN BMS_BCI_UnitCosts.replacementcostwood = 0
                                                                                                      THEN BMS_BCI_UnitCosts.replacementcost
                                                                                                      ELSE BMS_BCI_UnitCosts.replacementcostwood
                                                                                                  END
                                                                                             WHEN Material.value LIKE '%Steel%'
                                                                                             THEN CASE
                                                                                                      WHEN BMS_BCI_UnitCosts.replacementcoststeel = 0
                                                                                                      THEN BMS_BCI_UnitCosts.replacementcost
                                                                                                      ELSE BMS_BCI_UnitCosts.replacementcoststeel
                                                                                                  END
                                                                                             ELSE BMS_BCI_UnitCosts.replacementcost
                                                                                         END AS FLOAT))
                 FROM componentattributevalue
                      INNER JOIN AssetComponent ON AssetComponent.id = componentattributevalue.AssetComponentId
                      INNER JOIN BMS_BCI_UnitCosts ON BMS_BCI_UnitCosts.ComponentTypeId = AssetComponent.ComponentTypeId
                      LEFT OUTER JOIN componentattributevalue AS Material ON Material.AssetcomponentId = AssetComponent.Id
                                                                             AND Material.attributefieldid  In ( '78080EC2-230B-4403-99DB-2A0C5BF39A63',
                                                                                                              '6145910E-0F2B-42DF-A2CF-00CBE7806E2C',
                                                                                                              'C44A3A6E-5D3D-4A5C-BD85-02B29E9BB724',
                                                                                                              'E8D81A4F-A235-4D45-957C-03962F5CCFDD',
                                                                                                              '718A5846-9051-4C29-9F5C-04052D503D63',
                                                                                                              '14F913C9-0664-4F85-8CA9-04B57BD768E3',
                                                                                                              '8775C865-F841-4B58-A4BA-04E47FF1DAC6',
                                                                                                              'B8E230B0-DDCE-427F-B420-0597A23FEF87',
                                                                                                              '57799C8B-D481-410A-BD23-0793281C4543',
                                                                                                              '5AD7DF84-771A-44B1-80A6-091101569A5D',
                                                                                                              '851A3689-EB26-48E8-989C-0A08827212A4',
                                                                                                              'FE35AD20-AA73-4BFD-A4F7-0A94BE2254CD',
                                                                                                              '6C4E1501-FA98-4188-B1ED-0ADC94FD4249',
                                                                                                              '6294D2F2-501C-763A-6C56-0DED0B6261D1',
                                                                                                              '8E66A9CB-44BB-49F3-96F4-0F0C39A8A992',
                                                                                                              'F84F45A5-130C-40F3-861F-0FFDDCC43D47',
                                                                                                              '1D828D95-B062-4C20-AE51-101CE9FFCC31',
                                                                                                              '33A57649-643F-4D39-9F59-110E1E32A392',
                                                                                                              '7712CFDF-FCF2-4FB2-B4A2-1285FC344890',
                                                                                                              'BFAC3324-C6D1-425B-9C33-13E721DDCAD2',
                                                                                                              'C6035922-9F50-44AF-91E6-15DD5A8B8E07',
                                                                                                              'A2A5DA9C-BCF7-4EB3-BDFB-169A3CEB524A',
                                                                                                              '36E961CB-2FBB-4FA9-93A5-17D22CF0615D',
                                                                                                              '304AA777-E267-43FE-84B7-189C73071F5A',
                                                                                                              '5D6083FE-4FC4-4444-B85E-1940721DA263',
                                                                                                              'A326D85A-ADBE-4F8E-A90A-1C2D998DFB33',
                                                                                                              'C2DBE254-F782-4633-8D61-1C8A0D75B48E',
                                                                                                              'E47A28F5-4C8A-4720-B872-1E35F8C8D1A7',
                                                                                                              'EB808FFD-5BC4-4F75-9250-1ED26E0FE2FE',
                                                                                                              '61713752-1D17-4374-849F-1FEEEADA92BD',
                                                                                                              '803FFB2A-CE40-4679-8A47-2068330B39DA',
                                                                                                              '49ED3809-65F1-4416-AC64-20C7BD9CC06B',
                                                                                                              '88DF0E7D-AEE9-4F39-BC0A-23393730C6C2',
                                                                                                              'B6E69047-1D3A-4300-BDBC-2353A558BC4D',
                                                                                                              'BAD44F1C-0A22-4BB4-99C9-251F8DEE752C',
                                                                                                              '7B329A5A-7B27-4C3E-AC2C-26EAB32279F4',
                                                                                                              'C1FB0389-8847-4807-A2DE-27B6F0F1FC04',
                                                                                                              '838E383F-9B26-44D5-9C7D-28FA28EF02B3',
                                                                                                              '43F911E1-A815-4465-85E6-29EA489275A3',
                                                                                                              '78080EC2-230B-4403-99DB-2A0C5BF39A63',
                                                                                                              '275EB746-C99B-41BC-BE0F-2C1C3AD3987D',
                                                                                                              '3224A311-2CEE-41CF-9B8D-2D40A9CEA75E',
                                                                                                              '192AD553-87B3-4A23-98AE-2EEED2FC651C',
                                                                                                              '65474F3F-ADC8-4C6A-A613-2FD4E3248538',
                                                                                                              '89BE3D70-7892-41EC-BA75-306DC7B96583')
                 WHERE componentattributevalue.attributefieldid = '04FA61A8-06AB-4C3B-8F1F-491C8D28EE79'
                       AND AssetComponent.AssetId = @AssetId and AssetComponent.IsActive=1
                 GROUP BY AssetComponent.AssetId;
		           
--Current Element Value (CEV) 
				 DECLARE @Sum_CEV_Tbl TABLE (AssetId Uniqueidentifier, year int, CEV Float)

                 INSERT INTO @Sum_CEV_Tbl
				 SELECT @assetId, ConditionsforYear, SUM(1*isnull(CSValues.Condition1, 0)*CAST(CASE
                                                                                                  WHEN Material.value LIKE '%Wood%'
                                                                                                  THEN CASE
                                                                                                           WHEN BMS_BCI_UnitCosts.replacementcostwood = 0
                                                                                                           THEN BMS_BCI_UnitCosts.replacementcost
                                                                                                           ELSE BMS_BCI_UnitCosts.replacementcostwood
                                                                                                       END
                                                                                                  WHEN Material.value LIKE '%Steel%'
                                                                                                  THEN CASE
                                                                                                           WHEN BMS_BCI_UnitCosts.replacementcoststeel = 0
                                                                                                           THEN BMS_BCI_UnitCosts.replacementcost
                                                                                                           ELSE BMS_BCI_UnitCosts.replacementcoststeel
                                                                                                       END
                                                                                                  ELSE BMS_BCI_UnitCosts.replacementcost
                                                                                              END AS FLOAT)+(0.75*isnull(CSValues.Condition2, 0)*CAST(CASE
                                                                                                                                                                  WHEN [Material].value LIKE '%Wood%'
                                                                                                                                                                  THEN CASE
                                                                                                                                                                           WHEN [BMS_BCI_UnitCosts].[replacementcostwood] = 0
                                                                                                                                                                           THEN [BMS_BCI_UnitCosts].[replacementcost]
                                                                                                                                                                           ELSE [BMS_BCI_UnitCosts].[replacementcostwood]
                                                                                                                                                                       END
                                                                                                                                                                  WHEN [Material].value LIKE '%Steel%'
                                                                                                                                                                  THEN CASE
                                                                                                                                                                           WHEN [BMS_BCI_UnitCosts].[replacementcoststeel] = 0
                                                                                                                                                                           THEN [BMS_BCI_UnitCosts].[replacementcost]
                                                                                                                                                                           ELSE [BMS_BCI_UnitCosts].[replacementcoststeel]
                                                                                                                                                                       END
                                                                                                                                                                  ELSE [BMS_BCI_UnitCosts].[replacementcost]
                                                                                                                                                              END AS FLOAT))+(0.40*isnull(CSValues.Condition3, 0)*CAST(CASE
                                                                                                                                                                                                                                   WHEN [Material].value LIKE '%Wood%'
                                                                                                                                                                                                                                   THEN CASE
                                                                                                                                                                                                                                            WHEN [BMS_BCI_UnitCosts].[replacementcostwood] = 0
                                                                                                                                                                                                                                            THEN [BMS_BCI_UnitCosts].[replacementcost]
                                                                                                                                                                                                                                            ELSE [BMS_BCI_UnitCosts].[replacementcostwood]
                                                                                                                                                                                                                                        END
                                                                                                                                                                                                                                   WHEN [Material].value LIKE '%Steel%'
                                                                                                                                                                                                                                   THEN CASE
                                                                                                                                                                                                                                            WHEN [BMS_BCI_UnitCosts].[replacementcoststeel] = 0
                                                                                                                                                                                                                                            THEN [BMS_BCI_UnitCosts].[replacementcost]
                                                                                                                                                                                                                                            ELSE [BMS_BCI_UnitCosts].[replacementcoststeel]
                                                                                                                                                                                                                                        END
                                                                                                                                                                                                                                   ELSE [BMS_BCI_UnitCosts].[replacementcost]
                                                                                                                                                                                                                               END AS FLOAT))+(0.00*isnull(CSValues.Condition4, 0)*CAST(CASE
                                                                                                                                                                                                                                                                                                    WHEN [Material].value LIKE '%Wood%'
                                                                                                                                                                                                                                                                                                    THEN CASE
                                                                                                                                                                                                                                                                                                             WHEN [BMS_BCI_UnitCosts].[replacementcostwood] = 0
                                                                                                                                                                                                                                                                                                             THEN [BMS_BCI_UnitCosts].[replacementcost]
                                                                                                                                                                                                                                                                                                             ELSE [BMS_BCI_UnitCosts].[replacementcostwood]
                                                                                                                                                                                                                                                                                                         END
                                                                                                                                                                                                                                                                                                    WHEN [Material].value LIKE '%Steel%'
                                                                                                                                                                                                                                                                                                    THEN CASE
                                                                                                                                                                                                                                                                                                             WHEN [BMS_BCI_UnitCosts].[replacementcoststeel] = 0
                                                                                                                                                                                                                                                                                                             THEN [BMS_BCI_UnitCosts].[replacementcost]
                                                                                                                                                                                                                                                                                                             ELSE [BMS_BCI_UnitCosts].[replacementcoststeel]
                                                                                                                                                                                                                                                                                                         END
                                                                                                                                                                                                                                                                                                    ELSE [BMS_BCI_UnitCosts].[replacementcost]
                                                                                                                                                                                                                                                                                                END AS FLOAT)))
                 FROM AssetComponent
                      INNER JOIN BMS_BCI_UnitCosts ON BMS_BCI_UnitCosts.ComponentTypeId = AssetComponent.ComponentTypeId
                      LEFT OUTER JOIN componentattributevalue AS Material ON Material.AssetcomponentId = AssetComponent.Id
                                                                             AND Material.attributefieldid   In ( '78080EC2-230B-4403-99DB-2A0C5BF39A63',
                                                                                                              '6145910E-0F2B-42DF-A2CF-00CBE7806E2C',
                                                                                                              'C44A3A6E-5D3D-4A5C-BD85-02B29E9BB724',
                                                                                                              'E8D81A4F-A235-4D45-957C-03962F5CCFDD',
                                                                                                              '718A5846-9051-4C29-9F5C-04052D503D63',
                                                                                                              '14F913C9-0664-4F85-8CA9-04B57BD768E3',
                                                                                                              '8775C865-F841-4B58-A4BA-04E47FF1DAC6',
                                                                                                              'B8E230B0-DDCE-427F-B420-0597A23FEF87',
                                                                                                              '57799C8B-D481-410A-BD23-0793281C4543',
                                                                                                              '5AD7DF84-771A-44B1-80A6-091101569A5D',
                                                                                                              '851A3689-EB26-48E8-989C-0A08827212A4',
                                                                                                              'FE35AD20-AA73-4BFD-A4F7-0A94BE2254CD',
                                                                                                              '6C4E1501-FA98-4188-B1ED-0ADC94FD4249',
                                                                                                              '6294D2F2-501C-763A-6C56-0DED0B6261D1',
                                                                                                              '8E66A9CB-44BB-49F3-96F4-0F0C39A8A992',
                                                                                                              'F84F45A5-130C-40F3-861F-0FFDDCC43D47',
                                                                                                              '1D828D95-B062-4C20-AE51-101CE9FFCC31',
                                                                                                              '33A57649-643F-4D39-9F59-110E1E32A392',
                                                                                                              '7712CFDF-FCF2-4FB2-B4A2-1285FC344890',
                                                                                                              'BFAC3324-C6D1-425B-9C33-13E721DDCAD2',
                                                                                                              'C6035922-9F50-44AF-91E6-15DD5A8B8E07',
                                                                                                              'A2A5DA9C-BCF7-4EB3-BDFB-169A3CEB524A',
                                                                                                              '36E961CB-2FBB-4FA9-93A5-17D22CF0615D',
                                                                                                              '304AA777-E267-43FE-84B7-189C73071F5A',
                                                                                                              '5D6083FE-4FC4-4444-B85E-1940721DA263',
                                                                                                              'A326D85A-ADBE-4F8E-A90A-1C2D998DFB33',
                                                                                                              'C2DBE254-F782-4633-8D61-1C8A0D75B48E',
                                                                                                              'E47A28F5-4C8A-4720-B872-1E35F8C8D1A7',
                                                                                                              'EB808FFD-5BC4-4F75-9250-1ED26E0FE2FE',
                                                                                                              '61713752-1D17-4374-849F-1FEEEADA92BD',
                                                                                                              '803FFB2A-CE40-4679-8A47-2068330B39DA',
                                                                                                              '49ED3809-65F1-4416-AC64-20C7BD9CC06B',
                                                                                                              '88DF0E7D-AEE9-4F39-BC0A-23393730C6C2',
                                                                                                              'B6E69047-1D3A-4300-BDBC-2353A558BC4D',
                                                                                                              'BAD44F1C-0A22-4BB4-99C9-251F8DEE752C',
                                                                                                              '7B329A5A-7B27-4C3E-AC2C-26EAB32279F4',
                                                                                                              'C1FB0389-8847-4807-A2DE-27B6F0F1FC04',
                                                                                                              '838E383F-9B26-44D5-9C7D-28FA28EF02B3',
                                                                                                              '43F911E1-A815-4465-85E6-29EA489275A3',
                                                                                                              '78080EC2-230B-4403-99DB-2A0C5BF39A63',
                                                                                                              '275EB746-C99B-41BC-BE0F-2C1C3AD3987D',
                                                                                                              '3224A311-2CEE-41CF-9B8D-2D40A9CEA75E',
                                                                                                              '192AD553-87B3-4A23-98AE-2EEED2FC651C',
                                                                                                              '65474F3F-ADC8-4C6A-A613-2FD4E3248538',
                                                                                                              '89BE3D70-7892-41EC-BA75-306DC7B96583')
					LEFT OUTER JOIN #deteriorationvalues CSValues ON CSValues.AssetComponentId = AssetComponent.Id
                 WHERE AssetComponent.AssetId = @AssetId and AssetComponent.IsActive=1
                 GROUP BY AssetComponent.AssetId, ConditionsforYear


			--populate BCIValues temp table
			INSERT INTO #BCIValues (AssetId, year, CEV, TEV)
			select Sum_CEV_Tbl.AssetId, Sum_CEV_Tbl.year, Sum_CEV_Tbl.CEV, @Sum_TEV
			FROM  @Sum_CEV_Tbl as Sum_CEV_Tbl
			WHERE Sum_CEV_Tbl.year is not null --TODO figure out why this row is inserting... for now we filter out

			-- empty temp table for next loop
			delete @Sum_CEV_Tbl

			FETCH cursor_Assets INTO @AssetId
	    END

	  CLOSE cursor_Assets
	  DEALLOCATE cursor_Assets


--caluclate BCI using TEV and CEV            
      UPDATE #BCIValues
	  SET BCI = (100 * CEV / TEV)
	  WHERE TEV != 0

	  if @ConstraintType ='Budget Constraint' /*regular LCC(constant budget, variable BCI after)*/
		   Begin
				DECLARE Cursor_Bridges CURSOR FOR
				SELECT Id, Name, Number, BCIValues.year, BCIValues.BCI, ISNULL(LoadRestriction.Value, 'NO'), ISNULL(NoOverloadsAllowed.Value, 'NO'), ISNULL(TrussBottomChordConcerns.Value, 'NO'), ISNULL(StressingStrandCorrosion.Value, 'NO'), ISNULL(GirderDropinSpanCorbel.Value, 'NO'), ISNULL(PedestrianStairsinPoorCondition.Value, 'NO'), ISNULL(TwoorlessGirderLines.Value, 'NO'), ISNULL(RetainingWallStabilityIssues.Value, 'NO'), ISNULL(SteelTrafficBarriers.Value, 'NO'), ISNULL(VehicleBridgeTimberSubstructure.Value, 'NO'), ISNULL(NonStressedGirderRebarCorrosion.Value, 'NO'), ISNULL(RockerBearingsExist.Value, 'NO'), ISNULL(FatigueProneGirders.Value, 'NO'), ISNULL(PedestrianRailingSystemsPoor.Value, 'NO'), ISNULL(ScourConcern.Value, 'NO')
				FROM Asset
					 INNER JOIN [ALccScenari_Asset] ON Asset.Id=[ALccScenari_Asset].AssetId
					 INNER JOIN #BCIValues BCIValues ON BCIValues.AssetId = Asset.Id
					 LEFT JOIN AssetAttributeValue LoadRestriction ON Asset.Id=LoadRestriction.AssetId AND LoadRestriction.AttributeFieldId=@ASSETLoadRestrictionAttribute
					 LEFT JOIN AssetAttributeValue NoOverloadsAllowed ON Asset.Id=NoOverloadsAllowed.AssetId AND NoOverloadsAllowed.AttributeFieldId=@ASSETNoOverloadsAllowedAttribute
					 LEFT JOIN AssetAttributeValue TrussBottomChordConcerns ON Asset.Id=TrussBottomChordConcerns.AssetId AND TrussBottomChordConcerns.AttributeFieldId=@ASSETTrussBottomChordConcernsAttribute
					 LEFT JOIN AssetAttributeValue StressingStrandCorrosion ON Asset.Id=StressingStrandCorrosion.AssetId AND StressingStrandCorrosion.AttributeFieldId=@ASSETStressingStrandCorrosionAttribute
					 LEFT JOIN AssetAttributeValue GirderDropinSpanCorbel ON Asset.Id=GirderDropinSpanCorbel.AssetId AND GirderDropinSpanCorbel.AttributeFieldId=@ASSETGirderDropinSpanCorbelDetailAttribute
					 LEFT JOIN AssetAttributeValue PedestrianStairsinPoorCondition ON Asset.Id=PedestrianStairsinPoorCondition.AssetId AND PedestrianStairsinPoorCondition.AttributeFieldId=@ASSETPedestrianStairsinPoorConditionAttribute
					 LEFT JOIN AssetAttributeValue TwoorlessGirderLines ON Asset.Id=TwoorlessGirderLines.AssetId AND TwoorlessGirderLines.AttributeFieldId=@ASSETTwoorlessGirderLinesAttribute
					 LEFT JOIN AssetAttributeValue RetainingWallStabilityIssues ON Asset.Id=RetainingWallStabilityIssues.AssetId AND RetainingWallStabilityIssues.AttributeFieldId=@ASSETRetainingWallStabilityIssuesAttribute
					 LEFT JOIN AssetAttributeValue SteelTrafficBarriers ON Asset.Id=SteelTrafficBarriers.AssetId AND SteelTrafficBarriers.AttributeFieldId=@ASSETSteelTrafficBarriersAttribute
					 LEFT JOIN AssetAttributeValue VehicleBridgeTimberSubstructure ON Asset.Id=VehicleBridgeTimberSubstructure.AssetId AND VehicleBridgeTimberSubstructure.AttributeFieldId=@ASSETVehicleBridgeTimberSubstructureAttribute
					 LEFT JOIN AssetAttributeValue NonStressedGirderRebarCorrosion ON Asset.Id=NonStressedGirderRebarCorrosion.AssetId AND NonStressedGirderRebarCorrosion.AttributeFieldId=@ASSETNonStressedGirderRebarCorrosionAttribute
					 LEFT JOIN AssetAttributeValue RockerBearingsExist ON Asset.Id=RockerBearingsExist.AssetId AND RockerBearingsExist.AttributeFieldId=@ASSETRockerBearingsExistAttribute
					 LEFT JOIN AssetAttributeValue FatigueProneGirders ON Asset.Id=FatigueProneGirders.AssetId AND FatigueProneGirders.AttributeFieldId=@ASSETFatigueProneGirdersAttribute
					 LEFT JOIN AssetAttributeValue PedestrianRailingSystemsPoor ON Asset.Id=PedestrianRailingSystemsPoor.AssetId AND PedestrianRailingSystemsPoor.AttributeFieldId=@ASSETPedestrianRailingSystemsPoorAttribute
					 LEFT JOIN AssetAttributeValue ScourConcern ON Asset.Id=ScourConcern.AssetId AND ScourConcern.AttributeFieldId=@ASSETScourConcernAttribute
				WHERE AssetTypeId='7165A2A0-C0D3-4153-A0FD-74AB98301B79' AND IsActive=1 AND [ALccScenari_Asset].ALccScenariId=@Id
				ORDER BY [Number];
		
				OPEN Cursor_Bridges;
		
				FETCH NEXT FROM Cursor_Bridges
				INTO @AssetId, @AssetName, @AssetNumber, @year, @BCI, @ASSETLoadRestriction, @ASSETNoOverloadsAllowed, @ASSETTrussBottomChordConcerns, @ASSETStressingStrandCorrosion, @ASSETGirderDropinSpanCorbelDetail, @ASSETPedestrianStairsinPoorCondition, @ASSETTwoorlessGirderLines, @ASSETRetainingWallStabilityIssues, @ASSETSteelTrafficBarriers, @ASSETVehicleBridgeTimberSubstructure, @ASSETNonStressedGirderRebarCorrosion, @ASSETRockerBearingsExist, @ASSETFatigueProneGirders, @ASSETPedestrianRailingSystemsPoor, @ASSETScourConcern;
        
				WHILE @@FETCH_STATUS=0 
				BEGIN
					PRINT 'Begin '+@AssetName;
					SET @DebugPath = '0_Start'
					SET @LastCompletedInspectionId=(SELECT TOP 1 Inspection.Id
													FROM Asset
														 INNER JOIN InspectionMaster ON Asset.Id=InspectionMaster.AssetId
														 INNER JOIN Inspection ON Inspection.InspectionMasterId=InspectionMaster.Id
													WHERE Asset.Id=@AssetId
													ORDER BY DateTo DESC);
					-- Setup default values
					SET @CriticalFlagCount=0;
                
			  --Start of the tree
					  --1A_LCC Stressing Strand corrosion = Y ...
					   IF(@ASSETStressingStrandCorrosion = 'Yes' OR @ASSETNonStressedGirderRebarCorrosion = 'Yes' OR @ASSETRockerBearingsExist = 'Yes' OR @ASSETSteelTrafficBarriers = 'Yes' OR @ASSETRetainingWallStabilityIssues = 'Yes' OR @ASSETTrussBottomChordConcerns = 'Yes' OR @ASSETNoOverloadsAllowed = 'Yes' OR @ASSETLoadRestriction = 'Yes' OR @ASSETGirderDropinSpanCorbelDetail = 'Yes' OR @ASSETTwoorlessGirderLines = 'Yes' OR @ASSETFatigueProneGirders = 'Yes' OR @ASSETVehicleBridgeTimberSubstructure = 'Yes')
							BEGIN
								--2A_LCC Load Restriction = Y ...
									--Continue Algorithm with poor percentages calculation   
									SET @DebugPath = @DebugPath + '--> 1A_LCC'
									IF(@ASSETLoadRestriction = 'Yes' OR @ASSETTwoorlessGirderLines = 'Yes' OR @ASSETFatigueProneGirders = 'Yes' OR @ASSETVehicleBridgeTimberSubstructure = 'Yes') 
										BEGIN
												SET @AssetDeckTopArea = (SELECT Value FROM AssetAttributeValue WHERE AssetId = @AssetId AND AttributeFieldId = '3FE4BFB4-AEBE-40AA-AAAC-11B58229E66B') --deck top area attributefieldid
												SET @DebugPath = @DebugPath + '-> 2A_LCC'
												UPDATE #BCIValues
												SET Recommendation = 'Bridge Replacement', AlgoPath=@DebugPath,
												RepairCost = ((SELECT UnitCost FROM ActivityType WHERE Id = 'C13E4366-3C5D-302E-6FD4-D4DA410E3167')*@AssetDeckTopArea)
												WHERE AssetId = @AssetId AND @year = year

										END
									ELSE BEGIN
											--3A_LCC Steel Traffic Barriers = Y ...
											IF(@ASSETTrussBottomChordConcerns = 'Yes' OR @ASSETSteelTrafficBarriers = 'Yes' OR @ASSETRetainingWallStabilityIssues = 'Yes' OR @ASSETNoOverloadsAllowed = 'Yes')
											BEGIN
												SET @DebugPath = @DebugPath + '-> 3A_LCC'
												UPDATE #BCIValues
												SET Recommendation = 'Major Rehab', AlgoPath=@DebugPath,
												RepairCost = (SELECT UnitCost FROM ActivityType WHERE Id = 'C9E7548E-B4A7-46C1-924D-A4F6E846F984')
												WHERE AssetId = @AssetId AND @year = year

											END		
									ELSE BEGIN
											--4A_LCC Stressing Strand corrosion = Y ...
											IF(@ASSETStressingStrandCorrosion = 'Yes' OR @ASSETNonStressedGirderRebarCorrosion = 'Yes' OR @ASSETRockerBearingsExist = 'Yes' OR @ASSETGirderDropinSpanCorbelDetail = 'Yes')
											BEGIN
												SET @DebugPath = @DebugPath + '-> 4A_LCC'
												UPDATE #BCIValues
												SET Recommendation = 'Minor Rehab', AlgoPath=@DebugPath,
												RepairCost = (SELECT UnitCost FROM ActivityType WHERE Id = 'A9E7548E-B4A7-46C1-924D-A4F6E846F984')
												WHERE AssetId = @AssetId AND @year = year

											END		
									ELSE BEGIN
												UPDATE #BCIValues
												SET Recommendation = 'Monitor', AlgoPath=@DebugPath
												WHERE AssetId = @AssetId AND @year = year

											END
										END
									END
								END;
						ELSE BEGIN
							--2b_BCI>=80 ...
							IF(TRY_CAST(@BCI AS NUMERIC(18, 3))>=80) 
							BEGIN
								SET @DebugPath = @DebugPath + '--> 2b_BCI>=80'
								UPDATE #BCIValues
								SET Recommendation = 'No Action', AlgoPath=@DebugPath
								WHERE AssetId = @AssetId AND @year = year

							END;
							ELSE BEGIN
								--3b_BCI>=70 ...
								SET @ExpansionJointsAge=(SELECT TOP (1) TRY_CAST( value AS INT)
																FROM ComponentAttributeValue
																inner join AssetComponent ON ComponentAttributeValue.AssetComponentId= AssetComponent.id
																WHERE ComponentAttributeValue.AttributeFieldId='50fb098d-8871-8015-e047-d9465ab0079b' AND AssetComponent.AssetId=@AssetId AND Assetcomponent.ComponentTypeId='a4054e0d-2aac-4f88-86ea-e5db22581398');
								SET @DeckWearingSurfaceAge=(SELECT TOP (1) TRY_CAST( value AS INT)
																FROM ComponentAttributeValue
																inner join AssetComponent ON ComponentAttributeValue.AssetComponentId= AssetComponent.id
																WHERE ComponentAttributeValue.AttributeFieldId='50fb098d-8871-8015-e047-d9465ab0079b' AND AssetComponent.AssetId=@AssetId AND Assetcomponent.ComponentTypeId='a4054e0d-2aac-4f88-86ea-e5db22581398');
								SET @TimberDeckAge=(SELECT TOP (1) TRY_CAST( value AS INT)
																FROM ComponentAttributeValue
																inner join AssetComponent ON ComponentAttributeValue.AssetComponentId= AssetComponent.id
																WHERE ComponentAttributeValue.AttributeFieldId='50fb098d-8871-8015-e047-d9465ab0079b' AND AssetComponent.AssetId=@AssetId  AND Assetcomponent.ComponentTypeId='a4054e0d-2aac-4f88-86ea-e5db22581398');


								IF(TRY_CAST(@BCI AS NUMERIC(18, 3))>=70 AND @ExpansionJointsAge >= 25 OR @DeckWearingSurfaceAge >= 20 OR @TimberDeckAge >= 10 ) 
								BEGIN
									SET @DebugPath = @DebugPath + '-> 3b_BCI>=70 ...'
									UPDATE #BCIValues
									SET Recommendation = 'Calculate Proactive Costs', AlgoPath=@DebugPath
									WHERE AssetId = @AssetId AND @year = year

								END;
							ELSE BEGIN
								SET @YearofMinorRehabilitation=(SELECT TRY_CAST(value AS INT)
																FROM AssetAttributeValue
																WHERE AttributeFieldId='91BDECDB-13D2-4F6B-959A-56D8831FDFB6' AND AssetId=@AssetId);
								SET @MinorRehab=DATEPART(YYYY, GETDATE())-@YearofMinorRehabilitation;
								SET @CriticalFlagCount=(SELECT COUNT(Id)
														FROM Flag
														WHERE FlagTypeId='BE55CA81-72AB-4535-84B5-A6EE043EFB47' AND AssetId=@AssetId);
							--4B_BCI > 65 ...
								--Get Poor rating percentage for key components
								SELECT @InspectionDeckRatingPoorPercent=SUM(TRY_CAST(Inspectionpoint.Value AS NUMERIC(5, 2)))/ SUM(TRY_CAST(TQ.Value AS NUMERIC(5, 2)))* 100
								FROM Inspectionpoint
									 INNER JOIN AssetComponent AComp ON Inspectionpoint.AssetComponentId=AComp.Id AND AComp.Componenttypeid='A4054E0D-2AAC-4F88-86EA-E5DB22581398'
									 INNER JOIN ComponentAttributeValue TQ ON AComp.Id=TQ.AssetComponentId AND TQ.AttributeFieldId='04fa61a8-06ab-4c3b-8f1f-491c8d28ee79'
								WHERE Inspectionpoint.AttributeFieldId='bc3a1c0a-34ac-4343-afc2-f697f541b44f' AND InspectionId=@LastCompletedInspectionId AND Inspectionpoint.Value IS NOT NULL AND TQ.Value IS NOT NULL;
								SELECT @InspectionExpansionJointRatingPoorPercent=SUM(TRY_CAST(Inspectionpoint.Value AS NUMERIC(5, 2)))/ SUM(TRY_CAST(TQ.Value AS NUMERIC(5, 2)))* 100
								FROM Inspectionpoint
									 INNER JOIN AssetComponent AComp ON Inspectionpoint.AssetComponentId=AComp.Id
									 INNER JOIN AssetComponent ACompParent ON AComp.FatherId=ACompParent.Id AND ACompParent.ComponentTypeId='8d7bbc61-04fa-4af2-8d38-63bf9c7eb379'
									 INNER JOIN ComponentAttributeValue TQ ON AComp.Id=TQ.AssetComponentId AND TQ.AttributeFieldId='04fa61a8-06ab-4c3b-8f1f-491c8d28ee79'
								WHERE Inspectionpoint.AttributeFieldId='bc3a1c0a-34ac-4343-afc2-f697f541b44f' AND InspectionId=@LastCompletedInspectionId AND Inspectionpoint.Value IS NOT NULL AND TQ.Value IS NOT NULL;
								SELECT @InspectionGirderRatingPoorPercent=SUM(TRY_CAST(Inspectionpoint.Value AS NUMERIC(5, 2)))/ SUM(TRY_CAST(TQ.Value AS NUMERIC(5, 2)))* 100
								FROM Inspectionpoint
									 INNER JOIN AssetComponent AComp ON Inspectionpoint.AssetComponentId=AComp.Id AND AComp.ComponentTypeId='94e99430-8629-4b1b-bd60-773db45953ac'
									 INNER JOIN ComponentAttributeValue TQ ON AComp.Id=TQ.AssetComponentId AND TQ.AttributeFieldId='04fa61a8-06ab-4c3b-8f1f-491c8d28ee79'
								WHERE Inspectionpoint.AttributeFieldId='bc3a1c0a-34ac-4343-afc2-f697f541b44f' AND InspectionId=@LastCompletedInspectionId AND Inspectionpoint.Value IS NOT NULL AND TQ.Value IS NOT NULL;
								SELECT @InspectionWearingSurfaceRatingPoorPercent=SUM(TRY_CAST(Inspectionpoint.Value AS NUMERIC(5, 2)))/ SUM(TRY_CAST(TQ.Value AS NUMERIC(5, 2)))* 100
								FROM Inspectionpoint
									 INNER JOIN AssetComponent AComp ON Inspectionpoint.AssetComponentId=AComp.Id AND AComp.Componenttypeid='499b948a-808d-4b50-8d7d-df789b1ac0d5' OR AComp.ComponentTypeId='33c8ea46-8385-45c3-836b-e34a6ba9f1d9'
									 INNER JOIN ComponentAttributeValue TQ ON AComp.Id=TQ.AssetComponentId AND TQ.AttributeFieldId='04fa61a8-06ab-4c3b-8f1f-491c8d28ee79'
								WHERE Inspectionpoint.AttributeFieldId='bc3a1c0a-34ac-4343-afc2-f697f541b44f' AND InspectionId=@LastCompletedInspectionId AND Inspectionpoint.Value IS NOT NULL AND TQ.Value IS NOT NULL;
								SELECT @InspectionSidewalkRatingPoorPercent=SUM(TRY_CAST(Inspectionpoint.Value AS NUMERIC(5, 2)))/ SUM(TRY_CAST(TQ.Value AS NUMERIC(5, 2)))* 100
								FROM Inspectionpoint
									 INNER JOIN AssetComponent AComp ON Inspectionpoint.AssetComponentId=AComp.Id AND AComp.Componenttypeid='48CFB579-6B8B-4CC5-A7B9-A87BBC6742C5' OR AComp.ComponentTypeId='FE7F6978-46EA-4E32-A4EB-8801DC551F4B'
									 INNER JOIN ComponentAttributeValue TQ ON AComp.Id=TQ.AssetComponentId AND TQ.AttributeFieldId='04fa61a8-06ab-4c3b-8f1f-491c8d28ee79'
								WHERE Inspectionpoint.AttributeFieldId='bc3a1c0a-34ac-4343-afc2-f697f541b44f' AND InspectionId=@LastCompletedInspectionId AND Inspectionpoint.Value IS NOT NULL AND TQ.Value IS NOT NULL;
								SELECT @InspectionConnectionsRatingPoorPercent=SUM(TRY_CAST(Inspectionpoint.Value AS NUMERIC(5, 2)))/ SUM(TRY_CAST(TQ.Value AS NUMERIC(5, 2)))* 100
								FROM Inspectionpoint
									 INNER JOIN AssetComponent AComp ON Inspectionpoint.AssetComponentId=AComp.Id AND AComp.Componenttypeid='DA1FAB3E-BC29-423D-A664-CC186C673745'
									 INNER JOIN ComponentAttributeValue TQ ON AComp.Id=TQ.AssetComponentId AND TQ.AttributeFieldId='04fa61a8-06ab-4c3b-8f1f-491c8d28ee79'
								WHERE Inspectionpoint.AttributeFieldId='bc3a1c0a-34ac-4343-afc2-f697f541b44f' AND InspectionId=@LastCompletedInspectionId AND Inspectionpoint.Value IS NOT NULL AND TQ.Value IS NOT NULL;
								SELECT @InspectionAbutmentRatingPoorPercent=SUM(TRY_CAST(Inspectionpoint.Value AS NUMERIC(5, 2)))/ SUM(TRY_CAST(TQ.Value AS NUMERIC(5, 2)))* 100
								FROM Inspectionpoint
									 INNER JOIN AssetComponent AComp ON Inspectionpoint.AssetComponentId=AComp.Id AND AComp.Componenttypeid='3D3CADF7-492F-4209-8647-E1557CA7D9D1' OR AComp.ComponentTypeId='3F7FF61F-538A-4CB1-9A29-DFFABA218833' OR AComp.ComponentTypeId='40972020-E36F-469C-ACF0-0D7D9B9887C8' OR AComp.ComponentTypeId='F6EBB242-C2DF-4425-B88E-B767D9A8BD74'
									 INNER JOIN ComponentAttributeValue TQ ON AComp.Id=TQ.AssetComponentId AND TQ.AttributeFieldId='04fa61a8-06ab-4c3b-8f1f-491c8d28ee79'
								WHERE Inspectionpoint.AttributeFieldId='bc3a1c0a-34ac-4343-afc2-f697f541b44f' AND InspectionId=@LastCompletedInspectionId AND Inspectionpoint.Value IS NOT NULL AND TQ.Value IS NOT NULL;
								SELECT @InspectionPierRatingPoorPercent=SUM(TRY_CAST(Inspectionpoint.Value AS NUMERIC(5, 2)))/ SUM(TRY_CAST(TQ.Value AS NUMERIC(5, 2)))* 100
								FROM Inspectionpoint
									 INNER JOIN AssetComponent AComp ON Inspectionpoint.AssetComponentId=AComp.Id AND AComp.Componenttypeid='19D2C5A1-13C1-4DA2-AA80-0DA30168EF79'
									 INNER JOIN ComponentAttributeValue TQ ON AComp.Id=TQ.AssetComponentId AND TQ.AttributeFieldId='04fa61a8-06ab-4c3b-8f1f-491c8d28ee79'
								WHERE Inspectionpoint.AttributeFieldId='bc3a1c0a-34ac-4343-afc2-f697f541b44f' AND InspectionId=@LastCompletedInspectionId AND Inspectionpoint.Value IS NOT NULL AND TQ.Value IS NOT NULL;
								SELECT @InspectionBottomChordPoorPercent=SUM(TRY_CAST(Inspectionpoint.Value AS NUMERIC(5, 2)))/ SUM(TRY_CAST(TQ.Value AS NUMERIC(5, 2)))* 100
								FROM Inspectionpoint
									 INNER JOIN AssetComponent AComp ON Inspectionpoint.AssetComponentId=AComp.Id AND AComp.Componenttypeid='A7CFBFC8-4AC3-4C25-B086-20FA4B9FC458'
									 INNER JOIN ComponentAttributeValue TQ ON AComp.Id=TQ.AssetComponentId AND TQ.AttributeFieldId='04fa61a8-06ab-4c3b-8f1f-491c8d28ee79'
								WHERE Inspectionpoint.AttributeFieldId='bc3a1c0a-34ac-4343-afc2-f697f541b44f' AND InspectionId=@LastCompletedInspectionId AND Inspectionpoint.Value IS NOT NULL AND TQ.Value IS NOT NULL;
								IF((TRY_CAST(@BCI AS NUMERIC(18, 3))>65)AND(@InspectionWearingSurfaceRatingPoorPercent<=40 OR @InspectionExpansionJointRatingPoorPercent<=25 OR @InspectionSidewalkRatingPoorPercent<=5 OR @ASSETPedestrianStairsinPoorCondition='Yes' OR @ASSETPedestrianRailingSystemsPoor= 'Yes' OR @CriticalFlagCount>0))
								BEGIN
									SET @DebugPath = @DebugPath + '-> 4B_BCI > 65'
									UPDATE #BCIValues
									SET Recommendation = 'Minor Rehab', AlgoPath=@DebugPath,
										RepairCost = (SELECT UnitCost FROM ActivityType WHERE Id = 'A9E7548E-B4A7-46C1-924D-A4F6E846F984'),
										BCIAfterRepair = (BCI+15)
									WHERE AssetId = @AssetId AND @year = year

								END;
								ELSE BEGIN
									--5B_BCI > 60 ...
									--Continue Algorithm with poor percentages calculation   
									IF((TRY_CAST(@BCI AS NUMERIC(18, 3))>60) AND (@InspectionWearingSurfaceRatingPoorPercent<=20 OR @InspectionDeckRatingPoorPercent<=10 OR @InspectionGirderRatingPoorPercent<=5 OR @InspectionExpansionJointRatingPoorPercent<=50 OR @InspectionConnectionsRatingPoorPercent<=5))
									BEGIN
										SET @DebugPath = @DebugPath + '-> 5B_BCI > 60'
										UPDATE #BCIValues
										SET Recommendation = 'Major Rehab', AlgoPath=@DebugPath,
											RepairCost = (SELECT UnitCost FROM ActivityType WHERE Id = 'C9E7548E-B4A7-46C1-924D-A4F6E846F984'),
											BCIAfterRepair = (BCI+25)
										WHERE AssetId = @AssetId AND @year = year

									END;
									ELSE BEGIN
										--6B_BCI > 55 ...
										IF((TRY_CAST(@BCI AS NUMERIC(18, 3))>55) AND ((@InspectionWearingSurfaceRatingPoorPercent BETWEEN 25 AND 50) OR (@InspectionDeckRatingPoorPercent BETWEEN 10 AND 25) OR (@InspectionGirderRatingPoorPercent BETWEEN 5 AND 25)))
										BEGIN
											SET @AssetDeckTopArea = (SELECT Value FROM AssetAttributeValue WHERE AssetId = @AssetId AND AttributeFieldId = '3FE4BFB4-AEBE-40AA-AAAC-11B58229E66B') --deck top area attributefieldid

											SET @DebugPath = @DebugPath + '-> 6B_BCI > 55'
											UPDATE #BCIValues
											SET Recommendation = 'Superstructure Replacement', AlgoPath=@DebugPath,
												RepairCost = ((SELECT UnitCost FROM ActivityType WHERE Id = 'E466E235-8AC1-F8AD-C4AE-99DAC9D1BF8A')*@AssetDeckTopArea),
												BCIAfterRepair = (BCI+25)
											WHERE AssetId = @AssetId AND @year = year

										END;
										ELSE BEGIN
											--7B_BCI <= 55 ...
											IF((TRY_CAST(@BCI AS NUMERIC(18, 3))<=55) AND ((@InspectionWearingSurfaceRatingPoorPercent BETWEEN 25 AND 50) OR (@InspectionGirderRatingPoorPercent BETWEEN 5 AND 25) OR @InspectionBottomChordPoorPercent > 10 OR @InspectionPierRatingPoorPercent>40 OR @InspectionAbutmentRatingPoorPercent>40))
											BEGIN
												SET @AssetDeckTopArea = (SELECT Value FROM AssetAttributeValue WHERE AssetId = @AssetId AND AttributeFieldId = '3FE4BFB4-AEBE-40AA-AAAC-11B58229E66B') --deck top area attributefieldid

												SET @DebugPath = @DebugPath + '-> 7B_LCC'
												UPDATE #BCIValues
												SET Recommendation = 'Bridge Replacement', AlgoPath=@DebugPath,
													RepairCost = ((SELECT UnitCost FROM ActivityType WHERE Id = 'C13E4366-3C5D-302E-6FD4-D4DA410E3167')*@AssetDeckTopArea),
													BCIAfterRepair = 100
												WHERE AssetId = @AssetId AND @year = year
	
										END;
									END;
								END;
							END;
						END;
					END;
				END;
				FETCH NEXT FROM Cursor_Bridges
				INTO @AssetId, @AssetName, @AssetNumber, @year, @BCI, @ASSETLoadRestriction, @ASSETNoOverloadsAllowed, @ASSETTrussBottomChordConcerns, @ASSETStressingStrandCorrosion, @ASSETGirderDropinSpanCorbelDetail, @ASSETPedestrianStairsinPoorCondition, @ASSETTwoorlessGirderLines, @ASSETRetainingWallStabilityIssues, @ASSETSteelTrafficBarriers, @ASSETVehicleBridgeTimberSubstructure, @ASSETNonStressedGirderRebarCorrosion, @ASSETRockerBearingsExist, @ASSETFatigueProneGirders, @ASSETPedestrianRailingSystemsPoor, @ASSETScourConcern;
				END;
				CLOSE Cursor_Bridges;
				DEALLOCATE Cursor_Bridges;

		  End
	  else /*Constraint (variable budget, constant value BCI after)*/
	   Begin
			DECLARE Cursor_Bridges_BCI CURSOR FOR
			SELECT Id, Name, Number, BCIValues.year, BCIValues.BCI
			FROM Asset	INNER JOIN [ALccScenari_Asset] ON Asset.Id=[ALccScenari_Asset].AssetId	INNER JOIN #BCIValues BCIValues ON BCIValues.AssetId = Asset.Id
			WHERE AssetTypeId='7165A2A0-C0D3-4153-A0FD-74AB98301B79' AND IsActive=1 AND [ALccScenari_Asset].ALccScenariId=@Id ORDER BY [Number];
		
			OPEN Cursor_Bridges_BCI;
			FETCH NEXT FROM Cursor_Bridges_BCI
			INTO @AssetId, @AssetName, @AssetNumber, @year, @BCI
        
			WHILE @@FETCH_STATUS=0 
			BEGIN
				PRINT @AssetName;
				SET @BCIDiffValue = (@BCIValue - @BCI)
				print CONCAT('BCIDiffValue: ', @BCIDiffValue)
				If @BCIDiffValue BETWEEN 1 and 10
						 UPDATE #BCIValues SET Recommendation = (SELECT top(1) Name FROM ActivityType where UnitCost > 0 order by UnitCost asc),
											RepairCost = (SELECT top(1) UnitCost FROM ActivityType where UnitCost > 0 order by UnitCost asc),
											BCIAfterRepair = @BCIValue WHERE AssetId = @AssetId AND @year = year
				else If @BCIDiffValue BETWEEN 11 and 19
					UPDATE #BCIValues  SET Recommendation = 'Minor Rehab',
											RepairCost = (SELECT UnitCost FROM ActivityType WHERE Id = 'A9E7548E-B4A7-46C1-924D-A4F6E846F984'),
											BCIAfterRepair = @BCIValue WHERE AssetId = @AssetId AND @year = year
				else
					Begin
					   If @BCIDiffValue BETWEEN 20 and 25
						 UPDATE #BCIValues SET Recommendation = (SELECT top(1) Name FROM ActivityType where Id != 'A9E7548E-B4A7-46C1-924D-A4F6E846F984' and UnitCost > 
						 (SELECT UnitCost FROM ActivityType WHERE Id = 'A9E7548E-B4A7-46C1-924D-A4F6E846F984') order by UnitCost asc),
											RepairCost = (SELECT top(1) UnitCost FROM ActivityType where Id != 'A9E7548E-B4A7-46C1-924D-A4F6E846F984' and UnitCost > 
											(SELECT UnitCost FROM ActivityType WHERE Id = 'A9E7548E-B4A7-46C1-924D-A4F6E846F984')
											order by UnitCost asc),
											BCIAfterRepair = @BCIValue WHERE AssetId = @AssetId AND @year = year
					   else
					      if @BCIDiffValue > 25
						   UPDATE #BCIValues SET Recommendation = 'Superstructure Replacement', AlgoPath=@DebugPath,
												RepairCost = ((SELECT UnitCost FROM ActivityType WHERE Id = 'E466E235-8AC1-F8AD-C4AE-99DAC9D1BF8A')),
												BCIAfterRepair = @BCIValue
											WHERE AssetId = @AssetId AND @year = year
						  else if @BCIDiffValue <= 0
							UPDATE #BCIValues SET Recommendation = 'No Action', BCIAfterRepair = @BCIValue WHERE AssetId = @AssetId AND @year = year
					end
					--select * from #BCIValues WHERE AssetId = @AssetId AND @year = year
			FETCH NEXT FROM Cursor_Bridges_BCI
			INTO @AssetId, @AssetName, @AssetNumber, @year, @BCI
			END;
			CLOSE Cursor_Bridges_BCI;
			DEALLOCATE Cursor_Bridges_BCI;
	   End
	  
		--LCC BenefitCostRatio
		UPDATE #BCIValues
		SET BenefitCostRatio = ((BCIAfterRepair-BCI)/RepairCost)
		WHERE BCIAfterRepair IS NOT NULL AND RepairCost IS NOT NULL AND RepairCost != 0 


		if @ConstraintType ='Budget Constraint' /*regular LCC(constant budget, variable BCI after)*/
		       Begin
					--LCC best repairs for each bridge
					UPDATE #BCIValues
					SET BestToRepair = 1
					FROM #BCIValues BCIValues
					JOIN 
					(SELECT *, ROW_NUMBER() OVER (partition by AssetId ORDER BY BenefitCostRatio DESC) rn FROM #BCIValues
					) x ON BCIValues.AssetId = x.AssetId AND BCIValues.year = x.year AND BCIValues.RepairCost = x.RepairCost AND BCIValues.Recommendation = x.Recommendation
					WHERE rn = 1
			  End


		--best results that will be turned into activities
		/*SELECT * FROM #BCIValues
		WHERE BestToRepair = 1
		ORDER BY BCI ASC 

		--all results from decision tree
		SELECT * FROM #BCIValues
		WHERE Recommendation IS NOT NULL*/


		--delete previous activities
		UPDATE Activity
		SET Comments = 'LCC Delete'
		WHERE Id IN (Select ActivityId from ALccScenari_Activity where ALccScenariId=@Id)

		Delete ALccScenari_Activity where ALccScenariId=@Id;
		Delete ActivityAttributeValue where ActivityId in (Select Id from Activity where Comments = 'LCC Delete')
		Delete Activity where Comments = 'LCC Delete'
		if @ConstraintType ='Budget Constraint' /*regular LCC(constant budget, variable BCI after)*/
		       Begin
					--create activities
					DECLARE ActivityCursor CURSOR FOR
						SELECT AssetId, year, BCI, BCIAfterRepair, Recommendation, RepairCost, BenefitCostRatio, AlgoPath FROM #BCIValues
						WHERE BestToRepair = 1
						ORDER BY BCI ASC

					OPEN ActivityCursor;
		
					FETCH NEXT FROM ActivityCursor
					INTO @AssetId, @year, @BCI, @DebugImprovedBCI, @Recommendation, @RepairCost, @BenefitCostRatio, @DebugPath;
        
					WHILE @@FETCH_STATUS=0 
					BEGIN
							if(@Budget >= @TotalCosts + @RepairCost)
							BEGIN
								SET @ActivityId = newid();
								SET @ActivityTypeId = (CASE
															WHEN @Recommendation = 'Bridge Replacement' THEN 'C13E4366-3C5D-302E-6FD4-D4DA410E3167'
															WHEN @Recommendation = 'Superstructure Replacement' THEN 'E466E235-8AC1-F8AD-C4AE-99DAC9D1BF8A'
															WHEN @Recommendation = 'Major Rehab' THEN 'C9E7548E-B4A7-46C1-924D-A4F6E846F984'
															WHEN @Recommendation = 'Minor Rehab' THEN 'A9E7548E-B4A7-46C1-924D-A4F6E846F984'
															WHEN @Recommendation = 'Calculate Proactive Costs' THEN 'B9E7548E-B4A7-46C1-924D-A4F6E846F984'
															WHEN @Recommendation = 'Monitor' THEN 'F11EFAA6-AFB2-4526-9940-8B3DC805759A'
															ELSE 'F11EFAA6-AFB2-4526-9940-8B3DC805759A'
														END)

								Select top(1) @ActivityComponentId=Id, @ActivityComponenttypeId=Componenttypeid from AssetComponent where AssetId = @AssetId and ComponentTypeId in ('b9f5a749-c95a-417c-8424-fd2cdf335823','19d2c5a1-13c1-4da2-aa80-0da30168ef79')

								INSERT INTO Activity (Id,ActivityTypeId,AssetId,Componenttypeid,AssetComponentId,ActivityStatusId,ActivityPriorityId,LastModified,UserId,AuthorId,DateFrom,DateTo, RealCost) 
									VALUES(@ActivityId,@ActivityTypeId, @AssetId,@ActivityComponenttypeId,@ActivityComponentId,'C12D109C-C7DE-4466-BCD5-06EE25C7B65D','8A0B1D7A-6346-59D3-4011-972E6F5414D1', GETDATE(),@UserId,@UserId,CONCAT('1/1/',@year),CONCAT('12/1/',@year), @RepairCost);
								INSERT INTO ActivityAttributeValue (ActivityId,AttributeFieldId,[Value],LastModified,UserId, IsHighlighted) 
									VALUES (@ActivityId, '04a9cfef-b4e6-87e8-bfe0-72eec6789dac' ,@BCI,GETDATE(),@UserId, 0)  -- Current BCI
								INSERT INTO ActivityAttributeValue (ActivityId,AttributeFieldId,[Value],LastModified,UserId, IsHighlighted) 
									VALUES (@ActivityId, '95d82071-aa1f-f36a-c115-b3fd60eb8318' ,@DebugImprovedBCI,GETDATE(),@UserId, 0) -- Improved BCI
								INSERT INTO ActivityAttributeValue (ActivityId,AttributeFieldId,[Value],LastModified,UserId, IsHighlighted) 
									VALUES (@ActivityId,'65b98a74-91bc-452d-9f9c-cbee7178590e' ,@DebugPath,GETDATE(),@UserId,0) --AlgorithmPath                        
								INSERT INTO ActivityAttributeValue (ActivityId,AttributeFieldId,[Value],LastModified,UserId, IsHighlighted) 
									VALUES (@ActivityId,'dab14309-86fb-3cc2-977b-47386821e250' ,@DebugInfo,GETDATE(),@UserId,0) --Debug Infos  
								INSERT INTO ALccScenari_Activity 
									VALUES (@Id, @ActivityId,Null);

								SET @TotalCosts = (@TotalCosts + @RepairCost)
							END
		
					FETCH NEXT FROM ActivityCursor
					INTO @AssetId, @year, @BCI, @DebugImprovedBCI, @Recommendation, @RepairCost, @BenefitCostRatio, @DebugPath;
					END;
					CLOSE ActivityCursor;
					DEALLOCATE ActivityCursor;

					-- Update Total budget

					DELETE ALccScenari_Budget where ALccScenariId = @Id

					SET @year=@beginYear;
					WHILE (@year<=@endYear)
						BEGIN
							DECLARE @totalActivities float;
							DECLARE @totalMaintenances float;

							SET @totalActivities= (SELECT sum([RealCost])   FROM [Activity]  inner JOIN AlccScenari_Activity on Activity.Id = AlccScenari_Activity.ActivityId  where AlccScenari_Activity.AlccScenariId=@Id AND YEAR(DateFrom) = @year )
							SET @totalMaintenances = 0

							if not exists(SELECT ALccScenariId FROM ALccScenari_Budget WHERE ALccScenariId = @Id AND Year = @year)
							BEGIN
								INSERT INTO ALccScenari_Budget VALUES (@Id, @year, null,  @totalMaintenances,@totalActivities)
							END
							ELSE BEGIN
								UPDATE ALccScenari_Budget SET CostMaintenances = @totalMaintenances, CostActivities = @totalActivities WHERE [Year] = @year AND ALccScenariId = @Id
							END
							SET @year=@year+1;
							CONTINUE
						END
		
					DECLARE @grandTotalActivitites FLOAT
					DECLARE @grandTotalMaintenances FLOAT

					SET @grandTotalActivitites= (SELECT SUM(CostActivities) FROM ALccScenari_Budget WHERE ALccScenariId=@Id);
					SET @grandTotalMaintenances= (SELECT SUM(CostMaintenances) FROM ALccScenari_Budget WHERE ALccScenariId=@Id);
					UPDATE  ALccScenari SET TotalCostActivities=@grandTotalActivitites, TotalCostMaintenances= @grandTotalMaintenances WHERE Id=@Id
			  End
		else
		 begin
			
		    --create activities
			DECLARE ActivityCursorBCI CURSOR FOR
				SELECT AssetId, year, BCI, BCIAfterRepair, Recommendation, RepairCost, BenefitCostRatio FROM #BCIValues ORDER BY BCI ASC

			OPEN ActivityCursorBCI;
		
			FETCH NEXT FROM ActivityCursorBCI
			INTO @AssetId, @year, @BCI, @DebugImprovedBCI, @Recommendation, @RepairCost, @BenefitCostRatio;
        
			WHILE @@FETCH_STATUS=0 
			BEGIN
				SET @ActivityId = newid();
				SET @ActivityTypeId = (CASE WHEN @Recommendation = 'Bridge Replacement' OR @Recommendation = 'Replacement Bridge - Vehicle' THEN 'C13E4366-3C5D-302E-6FD4-D4DA410E3167'
											WHEN @Recommendation = 'Superstructure Replacement' THEN 'E466E235-8AC1-F8AD-C4AE-99DAC9D1BF8A'
											WHEN @Recommendation = 'Replacement - Timber Stairs' THEN '449E8218-6CBB-0649-712D-1CDBDF666E42'
											WHEN @Recommendation = 'Replacement Bridge - Pedestrian' THEN 'BD661D11-F394-942F-2E94-43EFB259C533'
											WHEN @Recommendation = 'Replacement- Retaining Wall' THEN 'CF6C7006-A9E1-9257-0C3C-BD53E1CB7F09'
											WHEN @Recommendation = 'Replacement - Plus 15' THEN '8FEEF08D-C6B9-CF31-8A95-E8DC3E15ADC2'
											WHEN @Recommendation = 'Major Rehab' OR  @Recommendation = 'Major Rehabilitation' THEN 'C9E7548E-B4A7-46C1-924D-A4F6E846F984'
											WHEN @Recommendation = 'Minor Rehab' OR @Recommendation = 'Partial  Rehabilitation' THEN 'A9E7548E-B4A7-46C1-924D-A4F6E846F984'
											WHEN @Recommendation = 'Calculate Proactive Costs' or @Recommendation = 'Maintenance' THEN 'B9E7548E-B4A7-46C1-924D-A4F6E846F984'
											WHEN @Recommendation = 'Monitor' or @Recommendation = 'Replacement' THEN 'F11EFAA6-AFB2-4526-9940-8B3DC805759A'
											ELSE 'F11EFAA6-AFB2-4526-9940-8B3DC805759A'
										END)

				Select top(1) @ActivityComponentId=Id, @ActivityComponenttypeId=Componenttypeid from AssetComponent where AssetId = @AssetId and ComponentTypeId in ('b9f5a749-c95a-417c-8424-fd2cdf335823','19d2c5a1-13c1-4da2-aa80-0da30168ef79')

				INSERT INTO Activity (Id,ActivityTypeId,AssetId,Componenttypeid,AssetComponentId,ActivityStatusId,ActivityPriorityId,LastModified,UserId,AuthorId,DateFrom,DateTo, RealCost) 
					VALUES(@ActivityId,@ActivityTypeId, @AssetId,@ActivityComponenttypeId,@ActivityComponentId,'C12D109C-C7DE-4466-BCD5-06EE25C7B65D','8A0B1D7A-6346-59D3-4011-972E6F5414D1', GETDATE(),@UserId,@UserId,CONCAT('1/1/',@year),CONCAT('12/1/',@year), @RepairCost);
				INSERT INTO ActivityAttributeValue (ActivityId,AttributeFieldId,[Value],LastModified,UserId, IsHighlighted) 
					VALUES (@ActivityId, '04a9cfef-b4e6-87e8-bfe0-72eec6789dac' ,@BCI,GETDATE(),@UserId, 0)  -- Current BCI
				INSERT INTO ActivityAttributeValue (ActivityId,AttributeFieldId,[Value],LastModified,UserId, IsHighlighted) 
					VALUES (@ActivityId, '95d82071-aa1f-f36a-c115-b3fd60eb8318' ,@DebugImprovedBCI,GETDATE(),@UserId, 0) -- Improved BCI                      
				INSERT INTO ActivityAttributeValue (ActivityId,AttributeFieldId,[Value],LastModified,UserId, IsHighlighted) 
					VALUES (@ActivityId,'dab14309-86fb-3cc2-977b-47386821e250' ,@DebugInfo,GETDATE(),@UserId,0) --Debug Infos  
				INSERT INTO ALccScenari_Activity 
					VALUES (@Id, @ActivityId,Null);

				SET @TotalCosts = (@TotalCosts + @RepairCost)
				Print @TotalCosts
			FETCH NEXT FROM ActivityCursorBCI
			INTO @AssetId, @year, @BCI, @DebugImprovedBCI, @Recommendation, @RepairCost, @BenefitCostRatio;
			END;
			CLOSE ActivityCursorBCI;
			DEALLOCATE ActivityCursorBCI;
		-- Update Total budget

			DELETE ALccScenari_Budget where ALccScenariId = @Id

			SET @year=@beginYear;
			WHILE (@year<=@endYear)
				BEGIN
					--DECLARE @totalActivities float;
					--DECLARE @totalMaintenances float;

					SET @totalActivities= (SELECT sum([RealCost])   FROM [Activity]  inner JOIN AlccScenari_Activity on Activity.Id = AlccScenari_Activity.ActivityId  where AlccScenari_Activity.AlccScenariId=@Id AND YEAR(DateFrom) = @year )
					SET @totalMaintenances = 0
					--Print @totalActivities
					--Print @totalActivities
					if not exists(SELECT ALccScenariId FROM ALccScenari_Budget WHERE ALccScenariId = @Id AND Year = @year)
					BEGIN
						INSERT INTO ALccScenari_Budget VALUES (@Id, @year, null,  @totalMaintenances,@totalActivities)
					END
					ELSE BEGIN
						UPDATE ALccScenari_Budget SET CostMaintenances = @totalMaintenances, CostActivities = @totalActivities WHERE [Year] = @year AND ALccScenariId = @Id
					END
					SET @year=@year+1;
				END
		
			--DECLARE @grandTotalActivitites FLOAT
			--DECLARE @grandTotalMaintenances FLOAT

			SET @grandTotalActivitites= (SELECT SUM(CostActivities) FROM ALccScenari_Budget WHERE ALccScenariId=@Id);
			SET @grandTotalMaintenances= (SELECT SUM(CostMaintenances) FROM ALccScenari_Budget WHERE ALccScenariId=@Id);
			UPDATE  ALccScenari SET TotalCostActivities=@grandTotalActivitites, TotalCostMaintenances= @grandTotalMaintenances WHERE Id=@Id
		 end

		 IF @DebugMode = 1
			begin
				IF OBJECT_ID('tempdb..##DebugTable') IS NULL 
					BEGIN
						CREATE TABLE ##DebugTable(
						AssetId uniqueidentifier, year int, CEV float, TEV float, BCI float, Recommendation nvarchar(max), RepairCost float, BenefitCostRatio float, BCIAfterRepair float, BestToRepair bit, AlgoPath NVARCHAR(max)
							,ComponentTypeName nvarchar(max), InspectionYear int, ConditionsforYear int, Condition1Percent float, Condition2Percent float, Condition3Percent float, Condition4Percent float, Condition1 float, Condition2 float, Condition3 float, Condition4 float
						)
					end
				ELSE 
					BEGIN 
						delete from ##DebugTable
					END 
				insert into ##DebugTable
						(AssetId , year , CEV , TEV , BCI , Recommendation, RepairCost , BenefitCostRatio , BCIAfterRepair , BestToRepair , AlgoPath,
						ComponentTypeName,
						ConditionsforYear, Condition1Percent, Condition2Percent, 
						Condition3Percent, Condition4Percent,Condition1, Condition2, Condition3, Condition4)
						select #BCIValues.AssetId , year , CEV , TEV , BCI , Recommendation, RepairCost , BenefitCostRatio , BCIAfterRepair , BestToRepair , AlgoPath,
						ComponentTypeName,
						ConditionsforYear, Condition1Percent, Condition2Percent, 
						Condition3Percent, Condition4Percent,Condition1, Condition2, Condition3, Condition4 from #BCIValues Full OUTER JOIN
						#deteriorationvalues on #BCIValues.AssetId = #deteriorationvalues.AssetId and  #BCIValues.year = #deteriorationvalues.ConditionsforYear
				
			end

        SET @returnRun=N'The scenario has run';
        SELECT @returnRun;
    END TRY
    BEGIN CATCH
        RETURN 'Sql Error- Number:'+CAST(ERROR_NUMBER() AS NVARCHAR(MAX))+' ;Message:'+ERROR_MESSAGE();
    END CATCH;
END;
GO
