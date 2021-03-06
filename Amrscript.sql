USE [master]
GO
/****** Object:  Database [pca]    Script Date: 2/26/2021 7:44:20 PM ******/
CREATE DATABASE [pca]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'pca', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\pca.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'pca_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\pca_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [pca] SET COMPATIBILITY_LEVEL = 100
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [pca].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [pca] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [pca] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [pca] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [pca] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [pca] SET ARITHABORT OFF 
GO
ALTER DATABASE [pca] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [pca] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [pca] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [pca] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [pca] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [pca] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [pca] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [pca] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [pca] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [pca] SET  DISABLE_BROKER 
GO
ALTER DATABASE [pca] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [pca] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [pca] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [pca] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [pca] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [pca] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [pca] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [pca] SET RECOVERY FULL 
GO
ALTER DATABASE [pca] SET  MULTI_USER 
GO
ALTER DATABASE [pca] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [pca] SET DB_CHAINING OFF 
GO
ALTER DATABASE [pca] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [pca] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [pca] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [pca] SET QUERY_STORE = OFF
GO
USE [pca]
GO
/****** Object:  Table [dbo].[Categories]    Script Date: 2/26/2021 7:44:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categories](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NULL,
	[Status] [bit] NULL,
 CONSTRAINT [PK_Categories] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[order_items]    Script Date: 2/26/2021 7:44:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[order_items](
	[oid] [varchar](50) NULL,
	[itemid] [int] NULL,
	[quantity] [int] NULL,
	[price] [int] NULL,
	[vid] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[orders]    Script Date: 2/26/2021 7:44:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[orders](
	[oid] [varchar](50) NOT NULL,
	[uid] [int] NULL,
	[odate] [smalldatetime] NULL,
	[status] [varchar](50) NULL,
	[fdate] [smalldatetime] NULL,
 CONSTRAINT [PK_orders] PRIMARY KEY CLUSTERED 
(
	[oid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Products]    Script Date: 2/26/2021 7:44:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[Title] [varchar](50) NULL,
	[ShortDescription] [varchar](250) NULL,
	[Description] [varchar](max) NULL,
	[OldPrice] [money] NULL,
	[NewPrice] [money] NULL,
	[Status] [bit] NULL,
	[Featured] [bit] NULL,
	[VenderId] [int] NULL,
	[SystemDate] [smalldatetime] NULL,
	[CategoryId] [int] NULL,
 CONSTRAINT [PK_Products] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[stock]    Script Date: 2/26/2021 7:44:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[stock](
	[pid] [int] NULL,
	[stock] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[users]    Script Date: 2/26/2021 7:44:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[users](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[firstname] [varchar](50) NULL,
	[lastname] [varchar](50) NULL,
	[address] [varchar](50) NULL,
	[city] [varchar](50) NULL,
	[phone] [varchar](50) NULL,
	[email] [varchar](50) NULL,
	[password] [varchar](50) NULL,
	[type] [varchar](5) NULL,
 CONSTRAINT [PK_users] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Venders]    Script Date: 2/26/2021 7:44:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Venders](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[shop] [varchar](100) NULL,
	[name] [varchar](50) NULL,
	[address] [varchar](50) NULL,
	[city] [varchar](50) NULL,
	[phone] [varchar](50) NULL,
	[email] [varchar](50) NULL,
	[password] [varchar](50) NULL,
	[status] [bit] NULL,
 CONSTRAINT [PK_Venders] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Categories] ON 

INSERT [dbo].[Categories] ([Id], [Name], [Status]) VALUES (14, N'Pents', 1)
INSERT [dbo].[Categories] ([Id], [Name], [Status]) VALUES (15, N'Trousers', 1)
INSERT [dbo].[Categories] ([Id], [Name], [Status]) VALUES (16, N'Dress', 1)
INSERT [dbo].[Categories] ([Id], [Name], [Status]) VALUES (17, N'Skirts', 1)
INSERT [dbo].[Categories] ([Id], [Name], [Status]) VALUES (18, N'Unstiched', 1)
SET IDENTITY_INSERT [dbo].[Categories] OFF
INSERT [dbo].[order_items] ([oid], [itemid], [quantity], [price], [vid]) VALUES (N'210224001', 16, 1, 0, NULL)
INSERT [dbo].[order_items] ([oid], [itemid], [quantity], [price], [vid]) VALUES (N'210224002', 14, 1, 0, NULL)
INSERT [dbo].[order_items] ([oid], [itemid], [quantity], [price], [vid]) VALUES (N'210224002', 14, 1, 0, NULL)
INSERT [dbo].[order_items] ([oid], [itemid], [quantity], [price], [vid]) VALUES (N'210224003', 13, 2, 0, NULL)
INSERT [dbo].[orders] ([oid], [uid], [odate], [status], [fdate]) VALUES (N'210224001', 1, CAST(N'2021-02-24T20:57:00' AS SmallDateTime), N'InProcess', NULL)
INSERT [dbo].[orders] ([oid], [uid], [odate], [status], [fdate]) VALUES (N'210224002', 1, CAST(N'2021-02-24T20:58:00' AS SmallDateTime), N'Pending', NULL)
INSERT [dbo].[orders] ([oid], [uid], [odate], [status], [fdate]) VALUES (N'210224003', 1, CAST(N'2021-02-24T21:01:00' AS SmallDateTime), N'Pending', NULL)
SET IDENTITY_INSERT [dbo].[Products] ON 

INSERT [dbo].[Products] ([Id], [Title], [ShortDescription], [Description], [OldPrice], [NewPrice], [Status], [Featured], [VenderId], [SystemDate], [CategoryId]) VALUES (13, N'BUTTONED GRIP DRESS', N' Details
Front button down long dress
Collar neck
Waist belt
3/4 sleeves with buttoned cuffs
Color: Dark Green
Fabric: Grip
Model Height: 5'' 7''''', N' Details
Front button down long dress
Collar neck
Waist belt
3/4 sleeves with buttoned cuffs
Color: Dark Green
Fabric: Grip
Model Height: 5'' 7''''', 45.0000, 47.0000, 1, 1, 1, NULL, 16)
INSERT [dbo].[Products] ([Id], [Title], [ShortDescription], [Description], [OldPrice], [NewPrice], [Status], [Featured], [VenderId], [SystemDate], [CategoryId]) VALUES (14, N'W0400DR-FRE-YLW', N'Details
Front button down long dress
Collar neck
Waist belt
3/4 sleeves with buttoned cuffs
Color: Yellow
Fabric: Grip
Model Height: 5'' 7''''', N'Details
Front button down long dress
Collar neck
Waist belt
3/4 sleeves with buttoned cuffs
Color: Yellow
Fabric: Grip
Model Height: 5'' 7''''', 23.0000, 22.0000, 1, 1, 1, NULL, 16)
INSERT [dbo].[Products] ([Id], [Title], [ShortDescription], [Description], [OldPrice], [NewPrice], [Status], [Featured], [VenderId], [SystemDate], [CategoryId]) VALUES (15, N'W0400DR-FRE-RED', N'Front button down long dress
Collar neck
Waist belt
3/4 sleeves with buttoned cuffs
Color: Red
Fabric: Grip
Model Height: 5'' 7''''', N'Front button down long dress
Collar neck
Waist belt
3/4 sleeves with buttoned cuffs
Color: Red
Fabric: Grip
Model Height: 5'' 7''''', 67.0000, 77.0000, 1, 1, 1, NULL, 16)
INSERT [dbo].[Products] ([Id], [Title], [ShortDescription], [Description], [OldPrice], [NewPrice], [Status], [Featured], [VenderId], [SystemDate], [CategoryId]) VALUES (16, N'W0435TR-FRE-BLU', N'Elasticized waistband
Color: Blue
Fabric: Jersey', N'Elasticized waistband
Color: Blue
Fabric: Jersey', 55.0000, 54.0000, 1, 1, 1, NULL, 14)
INSERT [dbo].[Products] ([Id], [Title], [ShortDescription], [Description], [OldPrice], [NewPrice], [Status], [Featured], [VenderId], [SystemDate], [CategoryId]) VALUES (17, N'W0568TR-std-001', N'Elasticized waistband
Tie knot on front
Side pockets
Color: Black
Fabric: Grip', N'Elasticized waistband
Tie knot on front
Side pockets
Color: Black
Fabric: Grip', 33.0000, 23.0000, 1, 1, 1, NULL, 14)
INSERT [dbo].[Products] ([Id], [Title], [ShortDescription], [Description], [OldPrice], [NewPrice], [Status], [Featured], [VenderId], [SystemDate], [CategoryId]) VALUES (18, N'W0345TR-FRE-DBG', N'Details
Elasticized waistband
Front pockets
Color: Dark Beige
Fabric: Grip', N'Details
Elasticized waistband
Front pockets
Color: Dark Beige
Fabric: Grip', 24.0000, 32.0000, 1, 1, 1, NULL, 14)
SET IDENTITY_INSERT [dbo].[Products] OFF
SET IDENTITY_INSERT [dbo].[users] ON 

INSERT [dbo].[users] ([id], [firstname], [lastname], [address], [city], [phone], [email], [password], [type]) VALUES (1, N'ABC', N'XYZ', N'NSA', N'UK', N'2345678954356', N'a@a.a', N'a', N'u')
INSERT [dbo].[users] ([id], [firstname], [lastname], [address], [city], [phone], [email], [password], [type]) VALUES (2, N'b', N'b', N'b', N'b', N'44', N'b@b.b', N'b', N'w')
SET IDENTITY_INSERT [dbo].[users] OFF
SET IDENTITY_INSERT [dbo].[Venders] ON 

INSERT [dbo].[Venders] ([Id], [shop], [name], [address], [city], [phone], [email], [password], [status]) VALUES (1, N'EOW', N'Rahul', N'NA', N'NA', N'DFG', N'c@c.c', N'c', 1)
SET IDENTITY_INSERT [dbo].[Venders] OFF
USE [master]
GO
ALTER DATABASE [pca] SET  READ_WRITE 
GO
