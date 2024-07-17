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
ALTER PROCEDURE [dbo].[Category_Load]
	@IsActive bit,
	@IsDelete bit
AS
BEGIN
DECLARE @Query VARCHAR(MAX) = 'SELECT c.CategoryID, c.CategoryName, c.Description, c.IsActive, c.IsDelete
				FROM Categories c
				WHERE c.IsActive = '+CONVERT(VARCHAR(1), @IsActive)+' and c.IsDelete = '+CONVERT(VARCHAR(1), @IsDelete)+''
EXEC(@Query)
END

