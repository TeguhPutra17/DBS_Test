-- ================================================
-- Template generated from Template Explorer using:
-- Create Procedure (New Menu).SQL
--
-- Use the Specify Values for Template Parameters 
-- command (Ctrl-Shift-M) to fill in the parameter 
-- values below.
--
-- This block of comments will not be included in
-- the definition of the procedure.
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Category_Update]
    @CategoryID int,
    @CategoryName nvarchar(50),
    @Description nvarchar(max),
    @IsActive bit,
    @IsDelete bit
AS
BEGIN
    SET NOCOUNT ON;

    UPDATE [MarketplaceDB].[dbo].[Categories]
    SET [CategoryName] = @CategoryName,
        [Description] = @Description,
        [IsActive] = @IsActive,
        [IsDelete] = @IsDelete,
        [UpdatedTime] = GETDATE()
    WHERE [CategoryID] = @CategoryID;
END
GO

