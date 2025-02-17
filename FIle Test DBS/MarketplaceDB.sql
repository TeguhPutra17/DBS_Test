USE [master]
GO
/****** Object:  Database [MarketplaceDB]    Script Date: 17/07/2024 23:38:50 ******/
CREATE DATABASE [MarketplaceDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'MarketplaceDB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\MarketplaceDB.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'MarketplaceDB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\MarketplaceDB_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [MarketplaceDB] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [MarketplaceDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [MarketplaceDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [MarketplaceDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [MarketplaceDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [MarketplaceDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [MarketplaceDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [MarketplaceDB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [MarketplaceDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [MarketplaceDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [MarketplaceDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [MarketplaceDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [MarketplaceDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [MarketplaceDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [MarketplaceDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [MarketplaceDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [MarketplaceDB] SET  ENABLE_BROKER 
GO
ALTER DATABASE [MarketplaceDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [MarketplaceDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [MarketplaceDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [MarketplaceDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [MarketplaceDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [MarketplaceDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [MarketplaceDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [MarketplaceDB] SET RECOVERY FULL 
GO
ALTER DATABASE [MarketplaceDB] SET  MULTI_USER 
GO
ALTER DATABASE [MarketplaceDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [MarketplaceDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [MarketplaceDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [MarketplaceDB] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [MarketplaceDB] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'MarketplaceDB', N'ON'
GO
ALTER DATABASE [MarketplaceDB] SET QUERY_STORE = OFF
GO
USE [MarketplaceDB]
GO
/****** Object:  Table [dbo].[Categories]    Script Date: 17/07/2024 23:38:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categories](
	[CategoryID] [int] IDENTITY(1,1) NOT NULL,
	[CategoryName] [nvarchar](30) NOT NULL,
	[Description] [nvarchar](max) NULL,
	[IsActive] [bit] NOT NULL,
	[IsDelete] [bit] NOT NULL,
	[CreatedTime] [datetime] NOT NULL,
	[UpdatedTime] [datetime] NULL,
	[DeletedTime] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[CategoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Products]    Script Date: 17/07/2024 23:38:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products](
	[ProductID] [int] IDENTITY(1,1) NOT NULL,
	[ProductName] [nvarchar](30) NOT NULL,
	[CategoryId] [int] NOT NULL,
	[Description] [nvarchar](max) NULL,
	[UnitPrice] [money] NULL,
	[Stock] [int] NOT NULL,
	[IsActive] [bit] NOT NULL,
	[IsDelete] [bit] NOT NULL,
	[CreatedTime] [datetime] NOT NULL,
	[UpdatedTime] [datetime] NULL,
	[DeletedTime] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[ProductID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 17/07/2024 23:38:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[UserID] [int] IDENTITY(1,1) NOT NULL,
	[Username] [nvarchar](20) NOT NULL,
	[Password] [nvarchar](20) NOT NULL,
	[Mail] [nvarchar](20) NOT NULL,
	[IsActive] [bit] NOT NULL,
	[IsDelete] [bit] NOT NULL,
	[CreatedTime] [datetime] NOT NULL,
	[DeletedTime] [datetime] NULL,
	[Address] [nvarchar](300) NULL,
PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Categories] ON 

INSERT [dbo].[Categories] ([CategoryID], [CategoryName], [Description], [IsActive], [IsDelete], [CreatedTime], [UpdatedTime], [DeletedTime]) VALUES (1, N'Electronics', NULL, 1, 0, CAST(N'2024-06-11T17:58:33.147' AS DateTime), NULL, NULL)
INSERT [dbo].[Categories] ([CategoryID], [CategoryName], [Description], [IsActive], [IsDelete], [CreatedTime], [UpdatedTime], [DeletedTime]) VALUES (2, N'Stationery', NULL, 1, 0, CAST(N'2024-06-11T17:59:58.247' AS DateTime), NULL, NULL)
INSERT [dbo].[Categories] ([CategoryID], [CategoryName], [Description], [IsActive], [IsDelete], [CreatedTime], [UpdatedTime], [DeletedTime]) VALUES (3, N'Gadget', N'This all about Gadget', 1, 0, CAST(N'2024-06-12T23:15:05.840' AS DateTime), NULL, NULL)
INSERT [dbo].[Categories] ([CategoryID], [CategoryName], [Description], [IsActive], [IsDelete], [CreatedTime], [UpdatedTime], [DeletedTime]) VALUES (4, N'string', N'string', 1, 0, CAST(N'2024-06-12T23:38:52.790' AS DateTime), CAST(N'2024-06-13T00:06:22.467' AS DateTime), NULL)
INSERT [dbo].[Categories] ([CategoryID], [CategoryName], [Description], [IsActive], [IsDelete], [CreatedTime], [UpdatedTime], [DeletedTime]) VALUES (5, N'New Category', N'New Description', 1, 0, CAST(N'2024-07-17T20:56:18.210' AS DateTime), NULL, NULL)
SET IDENTITY_INSERT [dbo].[Categories] OFF
GO
SET IDENTITY_INSERT [dbo].[Products] ON 

INSERT [dbo].[Products] ([ProductID], [ProductName], [CategoryId], [Description], [UnitPrice], [Stock], [IsActive], [IsDelete], [CreatedTime], [UpdatedTime], [DeletedTime]) VALUES (2, N'Vacuum Cleaner', 1, NULL, 300000.0000, 10, 1, 0, CAST(N'2024-06-11T18:01:50.610' AS DateTime), NULL, NULL)
INSERT [dbo].[Products] ([ProductID], [ProductName], [CategoryId], [Description], [UnitPrice], [Stock], [IsActive], [IsDelete], [CreatedTime], [UpdatedTime], [DeletedTime]) VALUES (3, N'Microwave', 1, NULL, 1100000.0000, 10, 1, 0, CAST(N'2024-06-11T18:02:26.537' AS DateTime), NULL, NULL)
INSERT [dbo].[Products] ([ProductID], [ProductName], [CategoryId], [Description], [UnitPrice], [Stock], [IsActive], [IsDelete], [CreatedTime], [UpdatedTime], [DeletedTime]) VALUES (4, N'Pulpen', 2, NULL, 10000.0000, 10, 1, 0, CAST(N'2024-06-11T18:04:28.943' AS DateTime), NULL, NULL)
INSERT [dbo].[Products] ([ProductID], [ProductName], [CategoryId], [Description], [UnitPrice], [Stock], [IsActive], [IsDelete], [CreatedTime], [UpdatedTime], [DeletedTime]) VALUES (5, N'Pencil', 2, NULL, 8000.0000, 10, 1, 0, CAST(N'2024-06-11T18:05:35.190' AS DateTime), NULL, NULL)
SET IDENTITY_INSERT [dbo].[Products] OFF
GO
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([UserID], [Username], [Password], [Mail], [IsActive], [IsDelete], [CreatedTime], [DeletedTime], [Address]) VALUES (1, N'admin', N'admin', N'admin@mail.com', 1, 0, CAST(N'2024-06-11T16:43:02.543' AS DateTime), NULL, NULL)
SET IDENTITY_INSERT [dbo].[Users] OFF
GO
ALTER TABLE [dbo].[Categories] ADD  DEFAULT (getdate()) FOR [CreatedTime]
GO
ALTER TABLE [dbo].[Products] ADD  DEFAULT (getdate()) FOR [CreatedTime]
GO
ALTER TABLE [dbo].[Users] ADD  DEFAULT (getdate()) FOR [CreatedTime]
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD FOREIGN KEY([CategoryId])
REFERENCES [dbo].[Categories] ([CategoryID])
GO
/****** Object:  StoredProcedure [dbo].[Category_Create]    Script Date: 17/07/2024 23:38:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Category_Create]
    @CategoryName nvarchar(30),
    @Description nvarchar(max),
    @IsActive bit,
    @IsDelete bit
AS
BEGIN
    SET NOCOUNT ON;

    INSERT INTO [MarketplaceDB].[dbo].[Categories] ([CategoryName], [Description], [IsActive], [IsDelete], [CreatedTime])
    VALUES (@CategoryName, @Description, @IsActive, @IsDelete, GETDATE());
END
GO
/****** Object:  StoredProcedure [dbo].[Category_Delete]    Script Date: 17/07/2024 23:38:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Category_Delete]
    @CategoryID int
AS
BEGIN
    SET NOCOUNT ON;

    UPDATE [MarketplaceDB].[dbo].[Categories]
    SET [IsDelete] = 1,
        [DeletedTime] = GETDATE()
    WHERE [CategoryID] = @CategoryID;
END
GO
/****** Object:  StoredProcedure [dbo].[Category_Load]    Script Date: 17/07/2024 23:38:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Category_Load]
	@IsActive bit,
	@IsDelete bit
AS
BEGIN
DECLARE @Query VARCHAR(MAX) = 'SELECT c.CategoryID, c.CategoryName, c.Description, c.IsActive, c.IsDelete
				FROM Categories c
				WHERE c.IsActive = '+CONVERT(VARCHAR(1), @IsActive)+' and c.IsDelete = '+CONVERT(VARCHAR(1), @IsDelete)+''
EXEC(@Query)
END

GO
/****** Object:  StoredProcedure [dbo].[Category_ManipulateColumn]    Script Date: 17/07/2024 23:38:51 ******/
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

    PRINT (@Query)
END
GO
/****** Object:  StoredProcedure [dbo].[Category_Unpivot]    Script Date: 17/07/2024 23:38:51 ******/
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
GO
/****** Object:  StoredProcedure [dbo].[Category_Update]    Script Date: 17/07/2024 23:38:51 ******/
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
USE [master]
GO
ALTER DATABASE [MarketplaceDB] SET  READ_WRITE 
GO
