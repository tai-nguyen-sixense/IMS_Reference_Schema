SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO


 
CREATE VIEW [dbo].[V_Flag_Landmark]
AS
SELECT        t1.FlagId, STUFF
                             ((SELECT        ' - ' + t2.Value
                                 FROM            (SELECT        Flag_Landmark.FlagId, Landmark.Name + '+' + cast(Flag_Landmark.DeltaX AS nvarchar(max)) AS Value, 
                                                                                     Landmark.PositionX + Flag_Landmark.DeltaX AS Position
                                                           FROM            Flag_Landmark INNER JOIN
                                                                                     Landmark ON Flag_Landmark.LandmarkId = Landmark.Id) t2
                                 WHERE        t1.FlagId = t2.FlagId
                                 ORDER BY t2.Position FOR XML PATH(''), TYPE ).value('.', 'varchar(max)'), 1, 2, '') AS LandmarksLinked
FROM            (SELECT        Flag_Landmark.FlagId, Landmark.Name + '-' + cast(Flag_Landmark.DeltaX AS nvarchar(max)) AS Value
                          FROM            Flag_Landmark INNER JOIN
                                                    Landmark ON Flag_Landmark.LandmarkId = Landmark.Id) t1
 
GROUP BY t1.FlagId
GO
