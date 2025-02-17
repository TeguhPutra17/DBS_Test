USE [MarketplaceDB]
GO
/****** Object:  StoredProcedure [dbo].[Category_Unpivot]    Script Date: 17/07/2024 23:28:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Category_ManipulateColumn]
AS
BEGIN
    DECLARE @Query NVARCHAR(MAX) = 
	'SELECT 
    CategoryID,
    UPPER(CategoryName) CategoryNameUpper,
    CategoryName + '' - '' + [Description] as [Name-Description],
    CASE 
        WHEN IsActive = 1 THEN ''Active''
        ELSE ''Inactive''
    END AS Status,
    IsDelete,
    CreatedTime,
    UpdatedTime,
    DeletedTime
	FROM Categories'

    EXEC (@Query)
END
