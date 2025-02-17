USE [MarketplaceDB]
GO
/****** Object:  StoredProcedure [dbo].[Category_Unpivot]    Script Date: 17/07/2024 23:15:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Category_Unpivot]
AS
BEGIN
    DECLARE @Query NVARCHAR(MAX) = 
	'SELECT 
    CategoryID,
    Attribute,
    CAST(Value AS NVARCHAR(MAX)) AS Value
FROM 
    (
        SELECT 
            CategoryID,
            CAST(CategoryName AS NVARCHAR(MAX)) AS CategoryName,
            CAST(Description AS NVARCHAR(MAX)) AS Description,
            CAST(CAST(IsActive AS BIT) AS NVARCHAR(MAX)) AS IsActive,
            CAST(CAST(IsDelete AS BIT) AS NVARCHAR(MAX)) AS IsDelete,
            CAST(CreatedTime AS NVARCHAR(MAX)) AS CreatedTime,
            CAST(UpdatedTime AS NVARCHAR(MAX)) AS UpdatedTime,
            CAST(DeletedTime AS NVARCHAR(MAX)) AS DeletedTime
        FROM 
            Categories
    ) AS p
UNPIVOT 
    (
        Value
        FOR Attribute IN (CategoryName, Description, IsActive, IsDelete, CreatedTime, UpdatedTime, DeletedTime)
    ) AS unpiv'

    EXEC (@Query)
END
