USE [master]
GO
/****** Object:  Database [YellowMoon]    Script Date: 10/17/2020 1:02:35 PM ******/
CREATE DATABASE [YellowMoon]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'YellowMoon', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\YellowMoon.mdf' , SIZE = 3264KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'YellowMoon_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\YellowMoon_log.ldf' , SIZE = 816KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [YellowMoon] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [YellowMoon].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [YellowMoon] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [YellowMoon] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [YellowMoon] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [YellowMoon] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [YellowMoon] SET ARITHABORT OFF 
GO
ALTER DATABASE [YellowMoon] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [YellowMoon] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [YellowMoon] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [YellowMoon] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [YellowMoon] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [YellowMoon] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [YellowMoon] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [YellowMoon] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [YellowMoon] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [YellowMoon] SET  ENABLE_BROKER 
GO
ALTER DATABASE [YellowMoon] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [YellowMoon] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [YellowMoon] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [YellowMoon] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [YellowMoon] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [YellowMoon] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [YellowMoon] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [YellowMoon] SET RECOVERY FULL 
GO
ALTER DATABASE [YellowMoon] SET  MULTI_USER 
GO
ALTER DATABASE [YellowMoon] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [YellowMoon] SET DB_CHAINING OFF 
GO
ALTER DATABASE [YellowMoon] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [YellowMoon] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [YellowMoon] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'YellowMoon', N'ON'
GO
USE [YellowMoon]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 10/17/2020 1:02:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[catagoryID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[catagoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[History]    Script Date: 10/17/2020 1:02:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[History](
	[historyID] [int] IDENTITY(1,1) NOT NULL,
	[userID] [int] NULL,
	[productID] [int] NULL,
	[date] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[historyID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[order]    Script Date: 10/17/2020 1:02:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[order](
	[orderID] [int] IDENTITY(1,1) NOT NULL,
	[totalPrice] [bigint] NOT NULL,
	[date] [datetime] NOT NULL,
	[phone] [int] NOT NULL,
	[address] [nvarchar](50) NOT NULL,
	[userID] [nvarchar](50) NULL,
	[email] [nvarchar](200) NULL,
	[subtotal] [bigint] NULL,
	[ship] [bigint] NULL,
	[tax] [bigint] NULL,
PRIMARY KEY CLUSTERED 
(
	[orderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[orderDetail]    Script Date: 10/17/2020 1:02:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[orderDetail](
	[detailID] [int] IDENTITY(1,1) NOT NULL,
	[orderID] [int] NULL,
	[productID] [int] NULL,
	[quantity] [int] NOT NULL,
	[price] [bigint] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[detailID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Product]    Script Date: 10/17/2020 1:02:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[productID] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](100) NOT NULL,
	[price] [bigint] NOT NULL,
	[categoryID] [int] NOT NULL,
	[photo] [nvarchar](200) NOT NULL,
	[description] [nvarchar](200) NOT NULL,
	[date] [datetime] NOT NULL,
	[dateExpire] [datetime] NOT NULL,
	[status] [nvarchar](50) NOT NULL,
	[quantity] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[productID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[roles]    Script Date: 10/17/2020 1:02:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[roles](
	[roleID] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[roleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[users]    Script Date: 10/17/2020 1:02:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[users](
	[userID] [int] IDENTITY(1,1) NOT NULL,
	[userName] [nvarchar](50) NOT NULL,
	[email] [nvarchar](50) NOT NULL,
	[PASSWORD] [nvarchar](50) NOT NULL,
	[phone] [int] NULL,
	[ADDRESS] [nvarchar](150) NULL,
	[ROLE] [int] NOT NULL,
	[STATUS] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[userID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[Category] ON 

INSERT [dbo].[Category] ([catagoryID], [Name]) VALUES (1, N'Mooncake')
INSERT [dbo].[Category] ([catagoryID], [Name]) VALUES (2, N'Sticky rice mooncake')
INSERT [dbo].[Category] ([catagoryID], [Name]) VALUES (3, N'Kid mooncake')
SET IDENTITY_INSERT [dbo].[Category] OFF
SET IDENTITY_INSERT [dbo].[History] ON 

INSERT [dbo].[History] ([historyID], [userID], [productID], [date]) VALUES (1, 1, 36, CAST(N'2020-10-13 15:53:39.323' AS DateTime))
INSERT [dbo].[History] ([historyID], [userID], [productID], [date]) VALUES (2, 1, 34, CAST(N'2020-10-13 16:04:46.840' AS DateTime))
INSERT [dbo].[History] ([historyID], [userID], [productID], [date]) VALUES (3, 1, 34, CAST(N'2020-10-13 16:40:35.547' AS DateTime))
INSERT [dbo].[History] ([historyID], [userID], [productID], [date]) VALUES (4, 1, 2, CAST(N'2020-10-13 17:49:20.853' AS DateTime))
INSERT [dbo].[History] ([historyID], [userID], [productID], [date]) VALUES (5, 1, 2, CAST(N'2020-10-13 17:49:47.757' AS DateTime))
INSERT [dbo].[History] ([historyID], [userID], [productID], [date]) VALUES (1002, 1, 36, CAST(N'2020-10-16 11:19:59.557' AS DateTime))
INSERT [dbo].[History] ([historyID], [userID], [productID], [date]) VALUES (1003, 1, 37, CAST(N'2020-10-16 11:38:25.507' AS DateTime))
INSERT [dbo].[History] ([historyID], [userID], [productID], [date]) VALUES (1004, 1, 33, CAST(N'2020-10-16 11:38:40.000' AS DateTime))
INSERT [dbo].[History] ([historyID], [userID], [productID], [date]) VALUES (1005, 1, 37, CAST(N'2020-10-16 11:39:07.240' AS DateTime))
INSERT [dbo].[History] ([historyID], [userID], [productID], [date]) VALUES (1006, 1, 1019, CAST(N'2020-10-16 14:49:49.187' AS DateTime))
INSERT [dbo].[History] ([historyID], [userID], [productID], [date]) VALUES (1007, 1, 1019, CAST(N'2020-10-16 14:50:04.033' AS DateTime))
INSERT [dbo].[History] ([historyID], [userID], [productID], [date]) VALUES (1008, 1, 1019, CAST(N'2020-10-16 14:58:58.310' AS DateTime))
INSERT [dbo].[History] ([historyID], [userID], [productID], [date]) VALUES (1009, 1, 33, CAST(N'2020-10-16 14:59:28.990' AS DateTime))
INSERT [dbo].[History] ([historyID], [userID], [productID], [date]) VALUES (1010, 1, 33, CAST(N'2020-10-16 15:01:12.447' AS DateTime))
INSERT [dbo].[History] ([historyID], [userID], [productID], [date]) VALUES (1011, 1, 33, CAST(N'2020-10-16 15:02:14.763' AS DateTime))
INSERT [dbo].[History] ([historyID], [userID], [productID], [date]) VALUES (1012, 1, 33, CAST(N'2020-10-16 15:02:32.573' AS DateTime))
INSERT [dbo].[History] ([historyID], [userID], [productID], [date]) VALUES (1013, 1, 33, CAST(N'2020-10-16 15:02:38.170' AS DateTime))
INSERT [dbo].[History] ([historyID], [userID], [productID], [date]) VALUES (1014, 1, 33, CAST(N'2020-10-16 15:03:01.757' AS DateTime))
INSERT [dbo].[History] ([historyID], [userID], [productID], [date]) VALUES (1015, 1, 33, CAST(N'2020-10-16 15:03:04.307' AS DateTime))
INSERT [dbo].[History] ([historyID], [userID], [productID], [date]) VALUES (1016, 1, 33, CAST(N'2020-10-16 15:03:05.473' AS DateTime))
INSERT [dbo].[History] ([historyID], [userID], [productID], [date]) VALUES (1017, 1, 33, CAST(N'2020-10-16 15:04:00.760' AS DateTime))
INSERT [dbo].[History] ([historyID], [userID], [productID], [date]) VALUES (1018, 1, 33, CAST(N'2020-10-16 15:05:38.090' AS DateTime))
INSERT [dbo].[History] ([historyID], [userID], [productID], [date]) VALUES (1019, 1, 33, CAST(N'2020-10-16 15:05:48.997' AS DateTime))
INSERT [dbo].[History] ([historyID], [userID], [productID], [date]) VALUES (1020, 1, 33, CAST(N'2020-10-16 15:07:22.900' AS DateTime))
INSERT [dbo].[History] ([historyID], [userID], [productID], [date]) VALUES (1021, 1, 33, CAST(N'2020-10-16 15:08:16.177' AS DateTime))
INSERT [dbo].[History] ([historyID], [userID], [productID], [date]) VALUES (1022, 1, 33, CAST(N'2020-10-16 15:09:19.510' AS DateTime))
INSERT [dbo].[History] ([historyID], [userID], [productID], [date]) VALUES (1023, 1, 33, CAST(N'2020-10-16 15:09:29.880' AS DateTime))
INSERT [dbo].[History] ([historyID], [userID], [productID], [date]) VALUES (1024, 1, 33, CAST(N'2020-10-16 15:10:51.470' AS DateTime))
INSERT [dbo].[History] ([historyID], [userID], [productID], [date]) VALUES (1025, 1, 33, CAST(N'2020-10-16 15:11:12.387' AS DateTime))
INSERT [dbo].[History] ([historyID], [userID], [productID], [date]) VALUES (1026, 1, 33, CAST(N'2020-10-16 15:11:29.347' AS DateTime))
INSERT [dbo].[History] ([historyID], [userID], [productID], [date]) VALUES (1027, 1, 33, CAST(N'2020-10-16 15:11:45.940' AS DateTime))
INSERT [dbo].[History] ([historyID], [userID], [productID], [date]) VALUES (1028, 1, 33, CAST(N'2020-10-16 15:13:21.047' AS DateTime))
INSERT [dbo].[History] ([historyID], [userID], [productID], [date]) VALUES (1029, 1, 33, CAST(N'2020-10-16 15:14:01.483' AS DateTime))
INSERT [dbo].[History] ([historyID], [userID], [productID], [date]) VALUES (1030, 1, 33, CAST(N'2020-10-16 15:26:22.463' AS DateTime))
INSERT [dbo].[History] ([historyID], [userID], [productID], [date]) VALUES (1031, 1, 1019, CAST(N'2020-10-16 15:27:27.873' AS DateTime))
INSERT [dbo].[History] ([historyID], [userID], [productID], [date]) VALUES (1032, 1, 35, CAST(N'2020-10-16 15:27:36.280' AS DateTime))
INSERT [dbo].[History] ([historyID], [userID], [productID], [date]) VALUES (1033, 1, 36, CAST(N'2020-10-16 15:27:53.130' AS DateTime))
INSERT [dbo].[History] ([historyID], [userID], [productID], [date]) VALUES (1034, 1, 37, CAST(N'2020-10-16 15:28:06.227' AS DateTime))
INSERT [dbo].[History] ([historyID], [userID], [productID], [date]) VALUES (1035, 1, 34, CAST(N'2020-10-16 15:28:57.450' AS DateTime))
INSERT [dbo].[History] ([historyID], [userID], [productID], [date]) VALUES (1036, 1, 3, CAST(N'2020-10-16 15:29:13.007' AS DateTime))
INSERT [dbo].[History] ([historyID], [userID], [productID], [date]) VALUES (1037, 1, 32, CAST(N'2020-10-16 15:29:55.950' AS DateTime))
INSERT [dbo].[History] ([historyID], [userID], [productID], [date]) VALUES (1038, 1, 3, CAST(N'2020-10-16 15:30:03.660' AS DateTime))
INSERT [dbo].[History] ([historyID], [userID], [productID], [date]) VALUES (1039, 1, 1019, CAST(N'2020-10-17 09:47:21.487' AS DateTime))
INSERT [dbo].[History] ([historyID], [userID], [productID], [date]) VALUES (1040, 1, 33, CAST(N'2020-10-17 09:47:52.657' AS DateTime))
SET IDENTITY_INSERT [dbo].[History] OFF
SET IDENTITY_INSERT [dbo].[order] ON 

INSERT [dbo].[order] ([orderID], [totalPrice], [date], [phone], [address], [userID], [email], [subtotal], [ship], [tax]) VALUES (1, 124200, CAST(N'2020-10-11 17:26:14.257' AS DateTime), 901234567, N'Here am i', N'3', N'anhmtuan@gmail.com', 120000, 6000, 12000)
INSERT [dbo].[order] ([orderID], [totalPrice], [date], [phone], [address], [userID], [email], [subtotal], [ship], [tax]) VALUES (2, 124200, CAST(N'2020-10-11 17:51:42.687' AS DateTime), 901234567, N'Here am i', N'3', N'anhmtuan@gmail.com', 120000, 6000, 12000)
INSERT [dbo].[order] ([orderID], [totalPrice], [date], [phone], [address], [userID], [email], [subtotal], [ship], [tax]) VALUES (3, 124200, CAST(N'2020-10-11 17:52:00.817' AS DateTime), 901234567, N'Here am i', N'3', N'anhmtuan@gmail.com', 120000, 6000, 12000)
INSERT [dbo].[order] ([orderID], [totalPrice], [date], [phone], [address], [userID], [email], [subtotal], [ship], [tax]) VALUES (4, 124200, CAST(N'2020-10-11 18:20:42.277' AS DateTime), 901234567, N'Here am i', N'3', N'anhmtuan@gmail.com', 120000, 6000, 12000)
INSERT [dbo].[order] ([orderID], [totalPrice], [date], [phone], [address], [userID], [email], [subtotal], [ship], [tax]) VALUES (5, 124200, CAST(N'2020-10-11 18:21:08.670' AS DateTime), 901234567, N'Here am i', N'3', N'anhmtuan@gmail.com', 120000, 6000, 12000)
INSERT [dbo].[order] ([orderID], [totalPrice], [date], [phone], [address], [userID], [email], [subtotal], [ship], [tax]) VALUES (6, 124200, CAST(N'2020-10-11 18:21:13.307' AS DateTime), 901234567, N'Here am i', N'3', N'anhmtuan@gmail.com', 120000, 6000, 12000)
INSERT [dbo].[order] ([orderID], [totalPrice], [date], [phone], [address], [userID], [email], [subtotal], [ship], [tax]) VALUES (7, 124200, CAST(N'2020-10-11 18:22:10.443' AS DateTime), 901234567, N'Here am i', N'3', N'anhmtuan@gmail.com', 120000, 6000, 12000)
INSERT [dbo].[order] ([orderID], [totalPrice], [date], [phone], [address], [userID], [email], [subtotal], [ship], [tax]) VALUES (8, 124200, CAST(N'2020-10-11 18:23:25.903' AS DateTime), 901234567, N'Here am i', N'3', N'anhmtuan@gmail.com', 120000, 6000, 12000)
INSERT [dbo].[order] ([orderID], [totalPrice], [date], [phone], [address], [userID], [email], [subtotal], [ship], [tax]) VALUES (9, 1914750, CAST(N'2020-10-11 18:26:53.913' AS DateTime), 901234567, N'sfdgfhg', N'488bd01e-8ea2-4992-b179-81855f93f755', N'anhmtuan@gmail.com', 1850000, 92500, 185000)
INSERT [dbo].[order] ([orderID], [totalPrice], [date], [phone], [address], [userID], [email], [subtotal], [ship], [tax]) VALUES (10, 1914750, CAST(N'2020-10-11 18:27:30.090' AS DateTime), 901234567, N'sfdgfhg', N'488bd01e-8ea2-4992-b179-81855f93f755', N'anhmtuan@gmail.com', 1850000, 92500, 185000)
INSERT [dbo].[order] ([orderID], [totalPrice], [date], [phone], [address], [userID], [email], [subtotal], [ship], [tax]) VALUES (11, 1914750, CAST(N'2020-10-11 18:30:02.000' AS DateTime), 901234567, N'sfdgfhg', N'488bd01e-8ea2-4992-b179-81855f93f755', N'anhmtuan@gmail.com', 1850000, 92500, 185000)
INSERT [dbo].[order] ([orderID], [totalPrice], [date], [phone], [address], [userID], [email], [subtotal], [ship], [tax]) VALUES (12, 1914750, CAST(N'2020-10-11 18:32:00.000' AS DateTime), 901234567, N'sfdgfhg', N'488bd01e-8ea2-4992-b179-81855f93f755', N'anhmtuan@gmail.com', 1850000, 92500, 185000)
INSERT [dbo].[order] ([orderID], [totalPrice], [date], [phone], [address], [userID], [email], [subtotal], [ship], [tax]) VALUES (13, 1914750, CAST(N'2020-10-11 18:32:33.000' AS DateTime), 901234567, N'sfdgfhg', N'488bd01e-8ea2-4992-b179-81855f93f755', N'anhmtuan@gmail.com', 1850000, 92500, 185000)
INSERT [dbo].[order] ([orderID], [totalPrice], [date], [phone], [address], [userID], [email], [subtotal], [ship], [tax]) VALUES (14, 1914750, CAST(N'2020-10-11 18:34:16.000' AS DateTime), 901234567, N'sfdgfhg', N'488bd01e-8ea2-4992-b179-81855f93f755', N'anhmtuan@gmail.com', 1850000, 92500, 185000)
INSERT [dbo].[order] ([orderID], [totalPrice], [date], [phone], [address], [userID], [email], [subtotal], [ship], [tax]) VALUES (15, 1914750, CAST(N'2020-10-11 18:34:59.000' AS DateTime), 901234567, N'sfdgfhg', N'488bd01e-8ea2-4992-b179-81855f93f755', N'anhmtuan@gmail.com', 1850000, 92500, 185000)
INSERT [dbo].[order] ([orderID], [totalPrice], [date], [phone], [address], [userID], [email], [subtotal], [ship], [tax]) VALUES (16, 1914750, CAST(N'2020-10-11 18:35:28.000' AS DateTime), 901234567, N'sfdgfhg', N'488bd01e-8ea2-4992-b179-81855f93f755', N'anhmtuan@gmail.com', 1850000, 92500, 185000)
INSERT [dbo].[order] ([orderID], [totalPrice], [date], [phone], [address], [userID], [email], [subtotal], [ship], [tax]) VALUES (17, 1914750, CAST(N'2020-10-11 18:39:39.000' AS DateTime), 901234567, N'sfdgfhg', N'488bd01e-8ea2-4992-b179-81855f93f755', N'anhmtuan@gmail.com', 1850000, 92500, 185000)
INSERT [dbo].[order] ([orderID], [totalPrice], [date], [phone], [address], [userID], [email], [subtotal], [ship], [tax]) VALUES (18, 1914750, CAST(N'2020-10-11 18:42:15.000' AS DateTime), 901234567, N'sfdgfhg', N'488bd01e-8ea2-4992-b179-81855f93f755', N'anhmtuan@gmail.com', 1850000, 92500, 185000)
INSERT [dbo].[order] ([orderID], [totalPrice], [date], [phone], [address], [userID], [email], [subtotal], [ship], [tax]) VALUES (19, 1914750, CAST(N'2020-10-11 18:43:06.000' AS DateTime), 901234567, N'sfdgfhg', N'488bd01e-8ea2-4992-b179-81855f93f755', N'anhmtuan@gmail.com', 1850000, 92500, 185000)
INSERT [dbo].[order] ([orderID], [totalPrice], [date], [phone], [address], [userID], [email], [subtotal], [ship], [tax]) VALUES (20, 1914750, CAST(N'2020-10-11 18:43:56.000' AS DateTime), 0, N'', N'488bd01e-8ea2-4992-b179-81855f93f755', N'', 1850000, 92500, 185000)
INSERT [dbo].[order] ([orderID], [totalPrice], [date], [phone], [address], [userID], [email], [subtotal], [ship], [tax]) VALUES (21, 1914750, CAST(N'2020-10-11 18:44:25.000' AS DateTime), 0, N'', N'488bd01e-8ea2-4992-b179-81855f93f755', N'', 1850000, 92500, 185000)
INSERT [dbo].[order] ([orderID], [totalPrice], [date], [phone], [address], [userID], [email], [subtotal], [ship], [tax]) VALUES (22, 1914750, CAST(N'2020-10-11 18:44:58.000' AS DateTime), 0, N'', N'488bd01e-8ea2-4992-b179-81855f93f755', N'', 1850000, 92500, 185000)
INSERT [dbo].[order] ([orderID], [totalPrice], [date], [phone], [address], [userID], [email], [subtotal], [ship], [tax]) VALUES (23, 1914750, CAST(N'2020-10-11 18:46:13.000' AS DateTime), 0, N'', N'488bd01e-8ea2-4992-b179-81855f93f755', N'', 1850000, 92500, 185000)
INSERT [dbo].[order] ([orderID], [totalPrice], [date], [phone], [address], [userID], [email], [subtotal], [ship], [tax]) VALUES (24, 1914750, CAST(N'2020-10-11 18:47:07.000' AS DateTime), 1234567, N'As', N'488bd01e-8ea2-4992-b179-81855f93f755', N'anhwtuan@gmail.com', 1850000, 92500, 185000)
INSERT [dbo].[order] ([orderID], [totalPrice], [date], [phone], [address], [userID], [email], [subtotal], [ship], [tax]) VALUES (25, 2328750, CAST(N'2020-10-11 18:55:20.000' AS DateTime), 901234567, N'ASDFGH', N'488bd01e-8ea2-4992-b179-81855f93f755', N'anhegeg@gmail.com', 2250000, 112500, 225000)
INSERT [dbo].[order] ([orderID], [totalPrice], [date], [phone], [address], [userID], [email], [subtotal], [ship], [tax]) VALUES (26, 2038950, CAST(N'2020-10-12 07:52:56.000' AS DateTime), 901234567, N'123456', N'd4fe009c-24f4-4165-8692-2f5e42b6edca', N'dsfgn@gmail.com', 1970000, 98500, 197000)
INSERT [dbo].[order] ([orderID], [totalPrice], [date], [phone], [address], [userID], [email], [subtotal], [ship], [tax]) VALUES (27, 124200, CAST(N'2020-10-12 08:05:22.000' AS DateTime), 901234567, N'sfdgfhg', N'0b40881b-cfab-4361-9b5a-aff15218201b', N'dsfgn@gmail.com', 120000, 6000, 12000)
INSERT [dbo].[order] ([orderID], [totalPrice], [date], [phone], [address], [userID], [email], [subtotal], [ship], [tax]) VALUES (28, 2587500, CAST(N'2020-10-12 08:07:14.000' AS DateTime), 354674633, N'12345y', N'0b40881b-cfab-4361-9b5a-aff15218201b', N'anhztuan590@gmail.com', 2500000, 125000, 250000)
INSERT [dbo].[order] ([orderID], [totalPrice], [date], [phone], [address], [userID], [email], [subtotal], [ship], [tax]) VALUES (29, 621000, CAST(N'2020-10-12 08:15:58.000' AS DateTime), 758657477, N'23456', N'0b40881b-cfab-4361-9b5a-aff15218201b', N'anhwtuan@gmail.com', 600000, 30000, 60000)
INSERT [dbo].[order] ([orderID], [totalPrice], [date], [phone], [address], [userID], [email], [subtotal], [ship], [tax]) VALUES (30, 1293750, CAST(N'2020-10-12 08:17:53.000' AS DateTime), 0, N'', N'47a30b83-b913-4eb0-bbf7-b67861024896', N'', 1250000, 62500, 125000)
INSERT [dbo].[order] ([orderID], [totalPrice], [date], [phone], [address], [userID], [email], [subtotal], [ship], [tax]) VALUES (31, 621000, CAST(N'2020-10-12 08:19:23.000' AS DateTime), 0, N'', N'd36206e0-614f-4136-99d1-113415e2a14a', N'', 600000, 30000, 60000)
INSERT [dbo].[order] ([orderID], [totalPrice], [date], [phone], [address], [userID], [email], [subtotal], [ship], [tax]) VALUES (32, 414000, CAST(N'2020-10-12 08:19:32.000' AS DateTime), 0, N'', N'93c94f48-46a4-4abf-bb19-712cf5fc3c8b', N'', 400000, 20000, 40000)
INSERT [dbo].[order] ([orderID], [totalPrice], [date], [phone], [address], [userID], [email], [subtotal], [ship], [tax]) VALUES (33, 124200, CAST(N'2020-10-12 08:22:08.000' AS DateTime), 0, N'', N'f4e6325a-cf98-4a93-bb99-ba08198b6461', N'', 120000, 6000, 12000)
INSERT [dbo].[order] ([orderID], [totalPrice], [date], [phone], [address], [userID], [email], [subtotal], [ship], [tax]) VALUES (34, 124200, CAST(N'2020-10-12 08:57:45.000' AS DateTime), 0, N'', N'8cb37604-7a10-4555-80e8-d89c917990a0', N'', 120000, 6000, 12000)
INSERT [dbo].[order] ([orderID], [totalPrice], [date], [phone], [address], [userID], [email], [subtotal], [ship], [tax]) VALUES (35, 1293750, CAST(N'2020-10-12 08:58:16.000' AS DateTime), 901234567, N'Here am i', N'3', N'anhmtuan@gmail.com', 1250000, 62500, 125000)
INSERT [dbo].[order] ([orderID], [totalPrice], [date], [phone], [address], [userID], [email], [subtotal], [ship], [tax]) VALUES (36, 124200, CAST(N'2020-10-12 09:04:04.000' AS DateTime), 901234567, N'Here am i', N'3', N'anhmtuan@gmail.com', 120000, 6000, 12000)
INSERT [dbo].[order] ([orderID], [totalPrice], [date], [phone], [address], [userID], [email], [subtotal], [ship], [tax]) VALUES (37, 662400, CAST(N'2020-10-12 09:59:37.000' AS DateTime), 901234567, N'Here am i', N'3', N'anhmtuan@gmail.com', 640000, 32000, 64000)
INSERT [dbo].[order] ([orderID], [totalPrice], [date], [phone], [address], [userID], [email], [subtotal], [ship], [tax]) VALUES (38, 124200, CAST(N'2020-10-12 10:39:25.000' AS DateTime), 0, N'', N'a5b64766-eea6-4f6a-87ed-a6c33364b84e', N'', 120000, 6000, 12000)
INSERT [dbo].[order] ([orderID], [totalPrice], [date], [phone], [address], [userID], [email], [subtotal], [ship], [tax]) VALUES (39, 248400, CAST(N'2020-10-12 10:45:09.000' AS DateTime), 901234567, N'Here am i', N'3', N'anhmtuan@gmail.com', 240000, 12000, 24000)
INSERT [dbo].[order] ([orderID], [totalPrice], [date], [phone], [address], [userID], [email], [subtotal], [ship], [tax]) VALUES (40, 2898000, CAST(N'2020-10-12 14:05:52.000' AS DateTime), 0, N'', N'bb64dd3c-ea05-4315-8974-d1536b614563', N'', 2800000, 140000, 280000)
INSERT [dbo].[order] ([orderID], [totalPrice], [date], [phone], [address], [userID], [email], [subtotal], [ship], [tax]) VALUES (41, 372600, CAST(N'2020-10-12 15:25:11.000' AS DateTime), 901234567, N'Here am i', N'3', N'anhmtuan@gmail.com', 360000, 18000, 36000)
INSERT [dbo].[order] ([orderID], [totalPrice], [date], [phone], [address], [userID], [email], [subtotal], [ship], [tax]) VALUES (42, 2452950, CAST(N'2020-10-12 15:27:04.000' AS DateTime), 901234567, N'Here am i', N'3', N'anhmtuan@gmail.com', 2370000, 118500, 237000)
INSERT [dbo].[order] ([orderID], [totalPrice], [date], [phone], [address], [userID], [email], [subtotal], [ship], [tax]) VALUES (43, 745200, CAST(N'2020-10-12 16:02:35.000' AS DateTime), 901234567, N'Here am i', N'3', N'anhmtuan@gmail.com', 720000, 36000, 72000)
INSERT [dbo].[order] ([orderID], [totalPrice], [date], [phone], [address], [userID], [email], [subtotal], [ship], [tax]) VALUES (44, 248400, CAST(N'2020-10-12 16:07:27.000' AS DateTime), 901234567, N'Here am i', N'3', N'anhmtuan@gmail.com', 240000, 12000, 24000)
INSERT [dbo].[order] ([orderID], [totalPrice], [date], [phone], [address], [userID], [email], [subtotal], [ship], [tax]) VALUES (45, 7400250, CAST(N'2020-10-12 17:30:58.000' AS DateTime), 901234567, N'Here am i', N'3', N'anhmtuan@gmail.com', 7150000, 357500, 715000)
INSERT [dbo].[order] ([orderID], [totalPrice], [date], [phone], [address], [userID], [email], [subtotal], [ship], [tax]) VALUES (46, 414000, CAST(N'2020-10-12 17:31:11.000' AS DateTime), 901234567, N'Here am i', N'3', N'anhmtuan@gmail.com', 400000, 20000, 40000)
INSERT [dbo].[order] ([orderID], [totalPrice], [date], [phone], [address], [userID], [email], [subtotal], [ship], [tax]) VALUES (47, 124200, CAST(N'2020-10-12 17:31:38.000' AS DateTime), 901234567, N'Here am i', N'3', N'anhmtuan@gmail.com', 120000, 6000, 12000)
INSERT [dbo].[order] ([orderID], [totalPrice], [date], [phone], [address], [userID], [email], [subtotal], [ship], [tax]) VALUES (48, 124200, CAST(N'2020-10-12 17:33:04.000' AS DateTime), 901234567, N'Here am i', N'3', N'anhmtuan@gmail.com', 120000, 6000, 12000)
INSERT [dbo].[order] ([orderID], [totalPrice], [date], [phone], [address], [userID], [email], [subtotal], [ship], [tax]) VALUES (49, 124200, CAST(N'2020-10-12 17:33:34.000' AS DateTime), 901234567, N'Here am i', N'3', N'anhmtuan@gmail.com', 120000, 6000, 12000)
INSERT [dbo].[order] ([orderID], [totalPrice], [date], [phone], [address], [userID], [email], [subtotal], [ship], [tax]) VALUES (50, 124200, CAST(N'2020-10-12 17:34:21.000' AS DateTime), 901234567, N'Here am i', N'3', N'anhmtuan@gmail.com', 120000, 6000, 12000)
INSERT [dbo].[order] ([orderID], [totalPrice], [date], [phone], [address], [userID], [email], [subtotal], [ship], [tax]) VALUES (51, 124200, CAST(N'2020-10-12 17:34:42.000' AS DateTime), 901234567, N'Here am i', N'3', N'anhmtuan@gmail.com', 120000, 6000, 12000)
INSERT [dbo].[order] ([orderID], [totalPrice], [date], [phone], [address], [userID], [email], [subtotal], [ship], [tax]) VALUES (52, 124200, CAST(N'2020-10-12 17:35:06.000' AS DateTime), 901234567, N'Here am i', N'3', N'anhmtuan@gmail.com', 120000, 6000, 12000)
INSERT [dbo].[order] ([orderID], [totalPrice], [date], [phone], [address], [userID], [email], [subtotal], [ship], [tax]) VALUES (53, 124200, CAST(N'2020-10-12 17:36:07.000' AS DateTime), 901234567, N'Here am i', N'3', N'anhmtuan@gmail.com', 120000, 6000, 12000)
INSERT [dbo].[order] ([orderID], [totalPrice], [date], [phone], [address], [userID], [email], [subtotal], [ship], [tax]) VALUES (54, 124200, CAST(N'2020-10-12 17:36:30.000' AS DateTime), 901234567, N'Here am i', N'3', N'anhmtuan@gmail.com', 120000, 6000, 12000)
INSERT [dbo].[order] ([orderID], [totalPrice], [date], [phone], [address], [userID], [email], [subtotal], [ship], [tax]) VALUES (55, 124200, CAST(N'2020-10-12 17:37:00.000' AS DateTime), 901234567, N'Here am i', N'3', N'anhmtuan@gmail.com', 120000, 6000, 12000)
INSERT [dbo].[order] ([orderID], [totalPrice], [date], [phone], [address], [userID], [email], [subtotal], [ship], [tax]) VALUES (56, 124200, CAST(N'2020-10-12 17:37:11.000' AS DateTime), 901234567, N'Here am i', N'3', N'anhmtuan@gmail.com', 120000, 6000, 12000)
INSERT [dbo].[order] ([orderID], [totalPrice], [date], [phone], [address], [userID], [email], [subtotal], [ship], [tax]) VALUES (57, 621000, CAST(N'2020-10-12 17:37:30.000' AS DateTime), 901234567, N'Here am i', N'3', N'anhmtuan@gmail.com', 600000, 30000, 60000)
INSERT [dbo].[order] ([orderID], [totalPrice], [date], [phone], [address], [userID], [email], [subtotal], [ship], [tax]) VALUES (58, 621000, CAST(N'2020-10-12 17:37:42.000' AS DateTime), 901234567, N'Here am i', N'3', N'anhmtuan@gmail.com', 600000, 30000, 60000)
INSERT [dbo].[order] ([orderID], [totalPrice], [date], [phone], [address], [userID], [email], [subtotal], [ship], [tax]) VALUES (59, 124200, CAST(N'2020-10-12 17:38:52.000' AS DateTime), 901234567, N'Here am i', N'3', N'anhmtuan@gmail.com', 120000, 6000, 12000)
INSERT [dbo].[order] ([orderID], [totalPrice], [date], [phone], [address], [userID], [email], [subtotal], [ship], [tax]) VALUES (60, 124200, CAST(N'2020-10-12 17:39:02.000' AS DateTime), 901234567, N'Here am i', N'3', N'anhmtuan@gmail.com', 120000, 6000, 12000)
INSERT [dbo].[order] ([orderID], [totalPrice], [date], [phone], [address], [userID], [email], [subtotal], [ship], [tax]) VALUES (61, 1293750, CAST(N'2020-10-12 18:10:34.000' AS DateTime), 0, N'', N'01c4dd33-bdb2-4baf-87e6-5d6a25057e99', N'', 1250000, 62500, 125000)
INSERT [dbo].[order] ([orderID], [totalPrice], [date], [phone], [address], [userID], [email], [subtotal], [ship], [tax]) VALUES (62, 124200, CAST(N'2020-10-12 18:38:42.000' AS DateTime), 0, N'sdv', N'107540078746101747724', N'anhnvtse140251@fpt.edu.vn', 120000, 6000, 12000)
INSERT [dbo].[order] ([orderID], [totalPrice], [date], [phone], [address], [userID], [email], [subtotal], [ship], [tax]) VALUES (63, 124200, CAST(N'2020-10-13 10:23:23.000' AS DateTime), 0, N'', N'30d96734-f87f-4493-bf5e-f19454d855c5', N'', 120000, 6000, 12000)
INSERT [dbo].[order] ([orderID], [totalPrice], [date], [phone], [address], [userID], [email], [subtotal], [ship], [tax]) VALUES (64, 1863000, CAST(N'2020-10-13 10:26:57.000' AS DateTime), 0, N'', N'112086125775713185705', N'anhwtuan@gmail.com', 1800000, 90000, 180000)
INSERT [dbo].[order] ([orderID], [totalPrice], [date], [phone], [address], [userID], [email], [subtotal], [ship], [tax]) VALUES (65, 538200, CAST(N'2020-10-13 11:15:21.000' AS DateTime), 0, N'', N'20464114-95da-4c6e-9c2a-ffb844c82922', N'', 520000, 26000, 52000)
INSERT [dbo].[order] ([orderID], [totalPrice], [date], [phone], [address], [userID], [email], [subtotal], [ship], [tax]) VALUES (66, 501975, CAST(N'2020-10-13 14:11:56.000' AS DateTime), 901234567, N'Here am i', N'3', N'anhmtuan@gmail.com', 485000, 24250, 48500)
INSERT [dbo].[order] ([orderID], [totalPrice], [date], [phone], [address], [userID], [email], [subtotal], [ship], [tax]) VALUES (67, 248400, CAST(N'2020-10-13 18:03:27.000' AS DateTime), 0, N'Asaaa', N'05b0b562-2bb2-4d55-8d4d-a3f624b22cf1', N'113131@gmail.com', 240000, 12000, 24000)
INSERT [dbo].[order] ([orderID], [totalPrice], [date], [phone], [address], [userID], [email], [subtotal], [ship], [tax]) VALUES (68, 248400, CAST(N'2020-10-14 10:44:43.000' AS DateTime), 758657477, N'A', N'08374450-f41b-48c3-9d16-c8cc6c3a63df', N'anhwtuan@gmail.com', 240000, 12000, 24000)
INSERT [dbo].[order] ([orderID], [totalPrice], [date], [phone], [address], [userID], [email], [subtotal], [ship], [tax]) VALUES (1002, 253575, CAST(N'2020-10-16 10:43:15.000' AS DateTime), 901324, N'HCM', N'107540078746101747724', N'anhnvtse140251@fpt.edu.vn', 245000, 12250, 24500)
INSERT [dbo].[order] ([orderID], [totalPrice], [date], [phone], [address], [userID], [email], [subtotal], [ship], [tax]) VALUES (1003, 253575, CAST(N'2020-10-16 10:43:57.000' AS DateTime), 132435465, N'1233455', N'112086125775713185705', N'anhwtuan@gmail.com', 245000, 12250, 24500)
INSERT [dbo].[order] ([orderID], [totalPrice], [date], [phone], [address], [userID], [email], [subtotal], [ship], [tax]) VALUES (1004, 993600, CAST(N'2020-10-16 11:15:28.000' AS DateTime), 901234567, N'Agg', N'd4561bfe-e82b-4e27-b53c-f931aa1d59fd', N'anhegeg@gmail.com', 960000, 48000, 96000)
INSERT [dbo].[order] ([orderID], [totalPrice], [date], [phone], [address], [userID], [email], [subtotal], [ship], [tax]) VALUES (1005, 4709250, CAST(N'2020-10-16 11:16:32.000' AS DateTime), 0, N'123456 HCM', N'107540078746101747724', N'anhnvtse140251@fpt.edu.vn', 4550000, 227500, 455000)
INSERT [dbo].[order] ([orderID], [totalPrice], [date], [phone], [address], [userID], [email], [subtotal], [ship], [tax]) VALUES (1006, 37260000, CAST(N'2020-10-16 16:24:33.000' AS DateTime), 939067878, N'Not here', N'2', N'anhztuan590@gmail.com', 36000000, 1800000, 3600000)
INSERT [dbo].[order] ([orderID], [totalPrice], [date], [phone], [address], [userID], [email], [subtotal], [ship], [tax]) VALUES (1007, 37881000, CAST(N'2020-10-16 16:25:01.000' AS DateTime), 909899778, N'Florida', N'86bded71-7760-4241-ba38-9065af0da196', N'anhctuan@gmail.com', 36600000, 1830000, 3660000)
INSERT [dbo].[order] ([orderID], [totalPrice], [date], [phone], [address], [userID], [email], [subtotal], [ship], [tax]) VALUES (1008, 37881000, CAST(N'2020-10-16 16:25:38.000' AS DateTime), 901234567, N'Here am i', N'3', N'anhmtuan@gmail.com', 36600000, 1830000, 3660000)
INSERT [dbo].[order] ([orderID], [totalPrice], [date], [phone], [address], [userID], [email], [subtotal], [ship], [tax]) VALUES (1009, 37881000, CAST(N'2020-10-16 16:28:12.000' AS DateTime), 901234567, N'Here am i', N'3', N'anhmtuan@gmail.com', 36600000, 1830000, 3660000)
INSERT [dbo].[order] ([orderID], [totalPrice], [date], [phone], [address], [userID], [email], [subtotal], [ship], [tax]) VALUES (1010, 37881000, CAST(N'2020-10-16 16:30:51.000' AS DateTime), 901234567, N'Here am i', N'3', N'anhmtuan@gmail.com', 36600000, 1830000, 3660000)
INSERT [dbo].[order] ([orderID], [totalPrice], [date], [phone], [address], [userID], [email], [subtotal], [ship], [tax]) VALUES (1011, 37881000, CAST(N'2020-10-16 16:33:24.000' AS DateTime), 901234567, N'Here am i', N'3', N'anhmtuan@gmail.com', 36600000, 1830000, 3660000)
INSERT [dbo].[order] ([orderID], [totalPrice], [date], [phone], [address], [userID], [email], [subtotal], [ship], [tax]) VALUES (1012, 37881000, CAST(N'2020-10-16 16:33:45.000' AS DateTime), 901234567, N'Here am i', N'3', N'anhmtuan@gmail.com', 36600000, 1830000, 3660000)
INSERT [dbo].[order] ([orderID], [totalPrice], [date], [phone], [address], [userID], [email], [subtotal], [ship], [tax]) VALUES (1013, 37881000, CAST(N'2020-10-16 16:34:28.000' AS DateTime), 901234567, N'Here am i', N'3', N'anhmtuan@gmail.com', 36600000, 1830000, 3660000)
INSERT [dbo].[order] ([orderID], [totalPrice], [date], [phone], [address], [userID], [email], [subtotal], [ship], [tax]) VALUES (1014, 37881000, CAST(N'2020-10-16 16:34:32.000' AS DateTime), 901234567, N'Here am i', N'3', N'anhmtuan@gmail.com', 36600000, 1830000, 3660000)
INSERT [dbo].[order] ([orderID], [totalPrice], [date], [phone], [address], [userID], [email], [subtotal], [ship], [tax]) VALUES (1015, 1242000, CAST(N'2020-10-16 16:34:49.000' AS DateTime), 901234567, N'Here am i', N'3', N'anhmtuan@gmail.com', 1200000, 60000, 120000)
INSERT [dbo].[order] ([orderID], [totalPrice], [date], [phone], [address], [userID], [email], [subtotal], [ship], [tax]) VALUES (1016, 1242000, CAST(N'2020-10-16 16:36:35.000' AS DateTime), 901234567, N'Here am i', N'3', N'anhmtuan@gmail.com', 1200000, 60000, 120000)
INSERT [dbo].[order] ([orderID], [totalPrice], [date], [phone], [address], [userID], [email], [subtotal], [ship], [tax]) VALUES (1017, 1242000, CAST(N'2020-10-16 16:37:25.000' AS DateTime), 901234567, N'Here am i', N'3', N'anhmtuan@gmail.com', 1200000, 60000, 120000)
SET IDENTITY_INSERT [dbo].[order] OFF
SET IDENTITY_INSERT [dbo].[orderDetail] ON 

INSERT [dbo].[orderDetail] ([detailID], [orderID], [productID], [quantity], [price]) VALUES (1, 24, 32, 1, 1250000)
INSERT [dbo].[orderDetail] ([detailID], [orderID], [productID], [quantity], [price]) VALUES (2, 24, 2, 1, 600000)
INSERT [dbo].[orderDetail] ([detailID], [orderID], [productID], [quantity], [price]) VALUES (3, 25, 32, 1, 1250000)
INSERT [dbo].[orderDetail] ([detailID], [orderID], [productID], [quantity], [price]) VALUES (4, 25, 2, 1, 600000)
INSERT [dbo].[orderDetail] ([detailID], [orderID], [productID], [quantity], [price]) VALUES (5, 25, 3, 1, 400000)
INSERT [dbo].[orderDetail] ([detailID], [orderID], [productID], [quantity], [price]) VALUES (6, 26, 32, 1, 1250000)
INSERT [dbo].[orderDetail] ([detailID], [orderID], [productID], [quantity], [price]) VALUES (7, 26, 33, 1, 120000)
INSERT [dbo].[orderDetail] ([detailID], [orderID], [productID], [quantity], [price]) VALUES (8, 26, 2, 1, 600000)
INSERT [dbo].[orderDetail] ([detailID], [orderID], [productID], [quantity], [price]) VALUES (9, 27, 33, 1, 120000)
INSERT [dbo].[orderDetail] ([detailID], [orderID], [productID], [quantity], [price]) VALUES (10, 28, 32, 2, 2500000)
INSERT [dbo].[orderDetail] ([detailID], [orderID], [productID], [quantity], [price]) VALUES (11, 29, 2, 1, 600000)
INSERT [dbo].[orderDetail] ([detailID], [orderID], [productID], [quantity], [price]) VALUES (12, 30, 32, 1, 1250000)
INSERT [dbo].[orderDetail] ([detailID], [orderID], [productID], [quantity], [price]) VALUES (13, 31, 2, 1, 600000)
INSERT [dbo].[orderDetail] ([detailID], [orderID], [productID], [quantity], [price]) VALUES (14, 32, 3, 1, 400000)
INSERT [dbo].[orderDetail] ([detailID], [orderID], [productID], [quantity], [price]) VALUES (15, 33, 33, 1, 120000)
INSERT [dbo].[orderDetail] ([detailID], [orderID], [productID], [quantity], [price]) VALUES (16, 34, 33, 1, 120000)
INSERT [dbo].[orderDetail] ([detailID], [orderID], [productID], [quantity], [price]) VALUES (17, 35, 32, 1, 1250000)
INSERT [dbo].[orderDetail] ([detailID], [orderID], [productID], [quantity], [price]) VALUES (18, 36, 33, 1, 120000)
INSERT [dbo].[orderDetail] ([detailID], [orderID], [productID], [quantity], [price]) VALUES (19, 37, 33, 2, 240000)
INSERT [dbo].[orderDetail] ([detailID], [orderID], [productID], [quantity], [price]) VALUES (20, 37, 3, 1, 400000)
INSERT [dbo].[orderDetail] ([detailID], [orderID], [productID], [quantity], [price]) VALUES (21, 38, 33, 1, 120000)
INSERT [dbo].[orderDetail] ([detailID], [orderID], [productID], [quantity], [price]) VALUES (22, 39, 33, 2, 240000)
INSERT [dbo].[orderDetail] ([detailID], [orderID], [productID], [quantity], [price]) VALUES (23, 40, 33, 10, 1200000)
INSERT [dbo].[orderDetail] ([detailID], [orderID], [productID], [quantity], [price]) VALUES (24, 40, 2, 2, 1200000)
INSERT [dbo].[orderDetail] ([detailID], [orderID], [productID], [quantity], [price]) VALUES (25, 40, 3, 1, 400000)
INSERT [dbo].[orderDetail] ([detailID], [orderID], [productID], [quantity], [price]) VALUES (26, 41, 33, 3, 360000)
INSERT [dbo].[orderDetail] ([detailID], [orderID], [productID], [quantity], [price]) VALUES (27, 42, 32, 1, 1250000)
INSERT [dbo].[orderDetail] ([detailID], [orderID], [productID], [quantity], [price]) VALUES (28, 42, 33, 1, 120000)
INSERT [dbo].[orderDetail] ([detailID], [orderID], [productID], [quantity], [price]) VALUES (29, 42, 2, 1, 600000)
INSERT [dbo].[orderDetail] ([detailID], [orderID], [productID], [quantity], [price]) VALUES (30, 42, 3, 1, 400000)
INSERT [dbo].[orderDetail] ([detailID], [orderID], [productID], [quantity], [price]) VALUES (31, 43, 33, 1, 120000)
INSERT [dbo].[orderDetail] ([detailID], [orderID], [productID], [quantity], [price]) VALUES (32, 43, 2, 1, 600000)
INSERT [dbo].[orderDetail] ([detailID], [orderID], [productID], [quantity], [price]) VALUES (33, 44, 33, 2, 240000)
INSERT [dbo].[orderDetail] ([detailID], [orderID], [productID], [quantity], [price]) VALUES (34, 45, 2, 8, 4800000)
INSERT [dbo].[orderDetail] ([detailID], [orderID], [productID], [quantity], [price]) VALUES (35, 46, 3, 6, 2400000)
INSERT [dbo].[orderDetail] ([detailID], [orderID], [productID], [quantity], [price]) VALUES (36, 47, 33, 5, 600000)
INSERT [dbo].[orderDetail] ([detailID], [orderID], [productID], [quantity], [price]) VALUES (37, 48, 33, 1, 120000)
INSERT [dbo].[orderDetail] ([detailID], [orderID], [productID], [quantity], [price]) VALUES (38, 49, 33, 1, 120000)
INSERT [dbo].[orderDetail] ([detailID], [orderID], [productID], [quantity], [price]) VALUES (39, 50, 33, 1, 120000)
INSERT [dbo].[orderDetail] ([detailID], [orderID], [productID], [quantity], [price]) VALUES (40, 51, 33, 1, 120000)
INSERT [dbo].[orderDetail] ([detailID], [orderID], [productID], [quantity], [price]) VALUES (41, 52, 33, 1, 120000)
INSERT [dbo].[orderDetail] ([detailID], [orderID], [productID], [quantity], [price]) VALUES (42, 53, 33, 1, 120000)
INSERT [dbo].[orderDetail] ([detailID], [orderID], [productID], [quantity], [price]) VALUES (43, 54, 33, 1, 120000)
INSERT [dbo].[orderDetail] ([detailID], [orderID], [productID], [quantity], [price]) VALUES (44, 55, 33, 1, 120000)
INSERT [dbo].[orderDetail] ([detailID], [orderID], [productID], [quantity], [price]) VALUES (45, 56, 33, 1, 120000)
INSERT [dbo].[orderDetail] ([detailID], [orderID], [productID], [quantity], [price]) VALUES (46, 57, 2, 1, 600000)
INSERT [dbo].[orderDetail] ([detailID], [orderID], [productID], [quantity], [price]) VALUES (47, 59, 33, 4, 480000)
INSERT [dbo].[orderDetail] ([detailID], [orderID], [productID], [quantity], [price]) VALUES (48, 60, 33, 5, 600000)
INSERT [dbo].[orderDetail] ([detailID], [orderID], [productID], [quantity], [price]) VALUES (49, 61, 32, 6, 7500000)
INSERT [dbo].[orderDetail] ([detailID], [orderID], [productID], [quantity], [price]) VALUES (50, 62, 33, 1, 120000)
INSERT [dbo].[orderDetail] ([detailID], [orderID], [productID], [quantity], [price]) VALUES (51, 63, 33, 5, 600000)
INSERT [dbo].[orderDetail] ([detailID], [orderID], [productID], [quantity], [price]) VALUES (52, 64, 2, 1, 600000)
INSERT [dbo].[orderDetail] ([detailID], [orderID], [productID], [quantity], [price]) VALUES (53, 64, 3, 8, 3200000)
INSERT [dbo].[orderDetail] ([detailID], [orderID], [productID], [quantity], [price]) VALUES (54, 65, 33, 5, 600000)
INSERT [dbo].[orderDetail] ([detailID], [orderID], [productID], [quantity], [price]) VALUES (55, 65, 3, 10, 4000000)
INSERT [dbo].[orderDetail] ([detailID], [orderID], [productID], [quantity], [price]) VALUES (56, 66, 35, 1, 240000)
INSERT [dbo].[orderDetail] ([detailID], [orderID], [productID], [quantity], [price]) VALUES (57, 66, 36, 8, 1960000)
INSERT [dbo].[orderDetail] ([detailID], [orderID], [productID], [quantity], [price]) VALUES (58, 67, 35, 9, 2160000)
INSERT [dbo].[orderDetail] ([detailID], [orderID], [productID], [quantity], [price]) VALUES (59, 68, 35, 1, 240000)
INSERT [dbo].[orderDetail] ([detailID], [orderID], [productID], [quantity], [price]) VALUES (1002, 1002, 36, 101, 24745000)
INSERT [dbo].[orderDetail] ([detailID], [orderID], [productID], [quantity], [price]) VALUES (1003, 1003, 36, 100, 24500000)
INSERT [dbo].[orderDetail] ([detailID], [orderID], [productID], [quantity], [price]) VALUES (1004, 1004, 35, 4, 960000)
INSERT [dbo].[orderDetail] ([detailID], [orderID], [productID], [quantity], [price]) VALUES (1005, 1005, 32, 3, 3750000)
INSERT [dbo].[orderDetail] ([detailID], [orderID], [productID], [quantity], [price]) VALUES (1006, 1005, 3, 2, 800000)
INSERT [dbo].[orderDetail] ([detailID], [orderID], [productID], [quantity], [price]) VALUES (1007, 1006, 2, 60, 36000000)
INSERT [dbo].[orderDetail] ([detailID], [orderID], [productID], [quantity], [price]) VALUES (1008, 1011, 2, 61, 36600000)
INSERT [dbo].[orderDetail] ([detailID], [orderID], [productID], [quantity], [price]) VALUES (1010, 1013, 2, 61, 36600000)
INSERT [dbo].[orderDetail] ([detailID], [orderID], [productID], [quantity], [price]) VALUES (1011, 1014, 2, 61, 36600000)
INSERT [dbo].[orderDetail] ([detailID], [orderID], [productID], [quantity], [price]) VALUES (1012, 1015, 2, 2, 1200000)
INSERT [dbo].[orderDetail] ([detailID], [orderID], [productID], [quantity], [price]) VALUES (1013, 1016, 2, 2, 1200000)
INSERT [dbo].[orderDetail] ([detailID], [orderID], [productID], [quantity], [price]) VALUES (1014, 1017, 2, 2, 1200000)
SET IDENTITY_INSERT [dbo].[orderDetail] OFF
SET IDENTITY_INSERT [dbo].[Product] ON 

INSERT [dbo].[Product] ([productID], [name], [price], [categoryID], [photo], [description], [date], [dateExpire], [status], [quantity]) VALUES (2, N'KinhDo YellowMoon', 600000, 1, N'timthumb.jpg', N'Basic set of KinhDo Lunar Cake', CAST(N'2020-10-02 00:00:00.000' AS DateTime), CAST(N'2021-01-01 00:00:00.000' AS DateTime), N'Active', 54)
INSERT [dbo].[Product] ([productID], [name], [price], [categoryID], [photo], [description], [date], [dateExpire], [status], [quantity]) VALUES (3, N'Test1', 400000, 1, N'timthumb.jpg', N'Ngon really', CAST(N'2020-10-17 00:00:00.000' AS DateTime), CAST(N'2020-10-31 00:00:00.000' AS DateTime), N'Deleted', 198)
INSERT [dbo].[Product] ([productID], [name], [price], [categoryID], [photo], [description], [date], [dateExpire], [status], [quantity]) VALUES (32, N'Test', 1250000, 2, N'29e0a01462a94cef1afb93b296473d81.jpg', N'Ngon', CAST(N'2020-10-17 00:00:00.000' AS DateTime), CAST(N'2020-10-31 00:00:00.000' AS DateTime), N'Deleted', 277)
INSERT [dbo].[Product] ([productID], [name], [price], [categoryID], [photo], [description], [date], [dateExpire], [status], [quantity]) VALUES (33, N'Test2', 120000, 3, N'crop.jpg', N'Kid. Out of order', CAST(N'2020-10-18 00:00:00.000' AS DateTime), CAST(N'2020-10-27 00:00:00.000' AS DateTime), N'Deleted', 0)
INSERT [dbo].[Product] ([productID], [name], [price], [categoryID], [photo], [description], [date], [dateExpire], [status], [quantity]) VALUES (34, N'Golden Cake', 430000, 2, N'PikachuTA-EWEATA-1024x768.jpg', N'Made with real gold', CAST(N'2020-10-17 00:00:00.000' AS DateTime), CAST(N'2020-10-31 00:00:00.000' AS DateTime), N'Deleted', 120)
INSERT [dbo].[Product] ([productID], [name], [price], [categoryID], [photo], [description], [date], [dateExpire], [status], [quantity]) VALUES (35, N'Silver Cake', 240000, 3, N'image-450w-766363144.jpg', N'Suuppper deli', CAST(N'2020-10-17 00:00:00.000' AS DateTime), CAST(N'2020-10-31 00:00:00.000' AS DateTime), N'Deleted', 326)
INSERT [dbo].[Product] ([productID], [name], [price], [categoryID], [photo], [description], [date], [dateExpire], [status], [quantity]) VALUES (36, N'Ultra Cake', 245000, 3, N'maxresdefault.jpg', N'Not for kid', CAST(N'2020-10-17 00:00:00.000' AS DateTime), CAST(N'2020-11-25 00:00:00.000' AS DateTime), N'Deleted', 200)
INSERT [dbo].[Product] ([productID], [name], [price], [categoryID], [photo], [description], [date], [dateExpire], [status], [quantity]) VALUES (37, N'Anh Special', 10000000, 1, N'120283081_5098851150140241_7753753581794809233_o.jpg', N'Limited product', CAST(N'2020-10-17 00:00:00.000' AS DateTime), CAST(N'2020-10-18 00:00:00.000' AS DateTime), N'Active', 35)
INSERT [dbo].[Product] ([productID], [name], [price], [categoryID], [photo], [description], [date], [dateExpire], [status], [quantity]) VALUES (1019, N'Emperor Cake', 150000, 1, N'image-450w-766363144.jpg', N'Not for sales. Too fake', CAST(N'2020-10-27 00:00:00.000' AS DateTime), CAST(N'2020-10-29 00:00:00.000' AS DateTime), N'Deleted', 43)
INSERT [dbo].[Product] ([productID], [name], [price], [categoryID], [photo], [description], [date], [dateExpire], [status], [quantity]) VALUES (1020, N'Green Bean Cake', 40000, 1, N'bánh-đậu-xanh-440x440.png', N'Green bean cake with 100% bean', CAST(N'2020-10-21 00:00:00.000' AS DateTime), CAST(N'2020-11-28 00:00:00.000' AS DateTime), N'active', 100)
INSERT [dbo].[Product] ([productID], [name], [price], [categoryID], [photo], [description], [date], [dateExpire], [status], [quantity]) VALUES (1021, N'Green Bean Cake with herd', 60000, 1, N'bánh-đậu-xanh-lá-dứa-440x440.png', N'Green bean cake with 80% bean 20% herd', CAST(N'2020-10-22 00:00:00.000' AS DateTime), CAST(N'2020-12-03 00:00:00.000' AS DateTime), N'active', 60)
INSERT [dbo].[Product] ([productID], [name], [price], [categoryID], [photo], [description], [date], [dateExpire], [status], [quantity]) VALUES (1022, N'Golden Cake black n gold 6 cakes', 470000, 1, N'banh-trang-vang-black-n-gold-4-banh-moi-440x440.png', N'Set of golden cake', CAST(N'2020-10-23 00:00:00.000' AS DateTime), CAST(N'2020-10-31 00:00:00.000' AS DateTime), N'active', 40)
INSERT [dbo].[Product] ([productID], [name], [price], [categoryID], [photo], [description], [date], [dateExpire], [status], [quantity]) VALUES (1023, N'Green Tea Cake', 30000, 1, N'bánh-trà-xanh-440x440.png', N'Green Tea Cake', CAST(N'2020-10-24 00:00:00.000' AS DateTime), CAST(N'2020-12-25 00:00:00.000' AS DateTime), N'active', 130)
INSERT [dbo].[Product] ([productID], [name], [price], [categoryID], [photo], [description], [date], [dateExpire], [status], [quantity]) VALUES (1024, N'Green bean sticky cake', 40000, 2, N'dẻo-đậu-xanh-440x440.png', N'Really sticky cake', CAST(N'2020-10-24 00:00:00.000' AS DateTime), CAST(N'2020-11-26 00:00:00.000' AS DateTime), N'active', 300)
INSERT [dbo].[Product] ([productID], [name], [price], [categoryID], [photo], [description], [date], [dateExpire], [status], [quantity]) VALUES (1025, N'Green bean sticky cake with slat egg', 50000, 2, N'dẻo-đậu-xanh-trứng-muối-440x440.png', N'Kid toy as bonus.', CAST(N'2020-10-24 00:00:00.000' AS DateTime), CAST(N'2020-11-27 00:00:00.000' AS DateTime), N'active', 120)
INSERT [dbo].[Product] ([productID], [name], [price], [categoryID], [photo], [description], [date], [dateExpire], [status], [quantity]) VALUES (1026, N'Sticky cake seed', 70000, 2, N'deo-hat-sen-440x440-1 (1).png', N'Ngon', CAST(N'2020-10-24 00:00:00.000' AS DateTime), CAST(N'2020-11-28 00:00:00.000' AS DateTime), N'active', 50)
INSERT [dbo].[Product] ([productID], [name], [price], [categoryID], [photo], [description], [date], [dateExpire], [status], [quantity]) VALUES (1027, N'Sticky full favor', 120000, 1, N'deo-thap-cam.png', N'Full favor cake', CAST(N'2020-10-29 00:00:00.000' AS DateTime), CAST(N'2020-11-27 00:00:00.000' AS DateTime), N'active', 200)
INSERT [dbo].[Product] ([productID], [name], [price], [categoryID], [photo], [description], [date], [dateExpire], [status], [quantity]) VALUES (1028, N'Chicken cake', 120000, 1, N'gà-quay-xốt-x.o-440x440.png', N'Chicken cake', CAST(N'2020-10-24 00:00:00.000' AS DateTime), CAST(N'2020-11-30 00:00:00.000' AS DateTime), N'active', 30)
INSERT [dbo].[Product] ([productID], [name], [price], [categoryID], [photo], [description], [date], [dateExpire], [status], [quantity]) VALUES (1029, N'Black bean cake', 30000, 3, N'me-den-hat-dua.jpg', N'Ngon', CAST(N'2020-10-24 00:00:00.000' AS DateTime), CAST(N'2020-11-28 00:00:00.000' AS DateTime), N'active', 40)
INSERT [dbo].[Product] ([productID], [name], [price], [categoryID], [photo], [description], [date], [dateExpire], [status], [quantity]) VALUES (1030, N'Purple cake', 50000, 3, N'khoai-môn-1-440x440.png', N'Ngon', CAST(N'2020-10-24 00:00:00.000' AS DateTime), CAST(N'2020-11-28 00:00:00.000' AS DateTime), N'active', 65)
INSERT [dbo].[Product] ([productID], [name], [price], [categoryID], [photo], [description], [date], [dateExpire], [status], [quantity]) VALUES (1031, N'Ultra golden cake', 300000, 1, N'hoang-kim-vinh-hoa-vang-440x368.png', N'Made with gold', CAST(N'2020-10-26 00:00:00.000' AS DateTime), CAST(N'2020-11-30 00:00:00.000' AS DateTime), N'active', 10)
INSERT [dbo].[Product] ([productID], [name], [price], [categoryID], [photo], [description], [date], [dateExpire], [status], [quantity]) VALUES (1032, N'Blue empire cake', 299900, 1, N'trang-vang-pha-le-van-phuc-xanh-440x368.png', N'Ngon really', CAST(N'2020-10-24 00:00:00.000' AS DateTime), CAST(N'2020-11-30 00:00:00.000' AS DateTime), N'active', 119)
INSERT [dbo].[Product] ([productID], [name], [price], [categoryID], [photo], [description], [date], [dateExpire], [status], [quantity]) VALUES (1033, N'Another kid cake', 30000, 3, N'tra-xanh-hat-macadamia.jpg', N'Kid toy as bonus.', CAST(N'2020-10-24 00:00:00.000' AS DateTime), CAST(N'2020-11-30 00:00:00.000' AS DateTime), N'active', 59)
INSERT [dbo].[Product] ([productID], [name], [price], [categoryID], [photo], [description], [date], [dateExpire], [status], [quantity]) VALUES (1034, N'Blue moon cake', 360000, 3, N'trang-vang-pha-le-van-phuc-xanh-440x368.png', N'Ngon', CAST(N'2020-10-24 00:00:00.000' AS DateTime), CAST(N'2020-11-26 00:00:00.000' AS DateTime), N'active', 121)
INSERT [dbo].[Product] ([productID], [name], [price], [categoryID], [photo], [description], [date], [dateExpire], [status], [quantity]) VALUES (1035, N'Crimson moon cake', 340000, 1, N'hop-trang-vang-hong-ngoc-an-thinh-do-440x440.png', N'Ngon', CAST(N'2020-10-24 00:00:00.000' AS DateTime), CAST(N'2020-11-26 00:00:00.000' AS DateTime), N'active', 123)
INSERT [dbo].[Product] ([productID], [name], [price], [categoryID], [photo], [description], [date], [dateExpire], [status], [quantity]) VALUES (1036, N'Chia cake', 30000, 2, N'hat-sen-hat-chia.jpg', N'Ngon really', CAST(N'2020-10-25 00:00:00.000' AS DateTime), CAST(N'2020-11-28 00:00:00.000' AS DateTime), N'active', 200)
INSERT [dbo].[Product] ([productID], [name], [price], [categoryID], [photo], [description], [date], [dateExpire], [status], [quantity]) VALUES (1037, N'Noon Cake', 29000, 3, N'trang-vang-hong-ngoc-an-phu-vang-440x440.png', N'Ngon', CAST(N'2020-10-24 00:00:00.000' AS DateTime), CAST(N'2020-11-28 00:00:00.000' AS DateTime), N'active', 210)
INSERT [dbo].[Product] ([productID], [name], [price], [categoryID], [photo], [description], [date], [dateExpire], [status], [quantity]) VALUES (1038, N'Golden Cake black n gold 4 cakes', 305000, 1, N'banh-trang-vang-black-n-gold-440x440.png', N'Made with gold', CAST(N'2020-10-24 00:00:00.000' AS DateTime), CAST(N'2020-11-23 00:00:00.000' AS DateTime), N'active', 32)
SET IDENTITY_INSERT [dbo].[Product] OFF
SET IDENTITY_INSERT [dbo].[roles] ON 

INSERT [dbo].[roles] ([roleID], [name]) VALUES (1, N'ADMIN')
INSERT [dbo].[roles] ([roleID], [name]) VALUES (2, N'USER')
INSERT [dbo].[roles] ([roleID], [name]) VALUES (3, N'GUEST')
SET IDENTITY_INSERT [dbo].[roles] OFF
SET IDENTITY_INSERT [dbo].[users] ON 

INSERT [dbo].[users] ([userID], [userName], [email], [PASSWORD], [phone], [ADDRESS], [ROLE], [STATUS]) VALUES (1, N'Anh AEU', N'anhwtuan@gmail.com', N'1228093262', 903364526, N'120 Wall Street', 1, N'Active')
INSERT [dbo].[users] ([userID], [userName], [email], [PASSWORD], [phone], [ADDRESS], [ROLE], [STATUS]) VALUES (2, N'Poor User', N'anhztuan590@gmail.com', N'1228093262', 939067878, N'Not here', 2, N'Active')
INSERT [dbo].[users] ([userID], [userName], [email], [PASSWORD], [phone], [ADDRESS], [ROLE], [STATUS]) VALUES (3, N'Wepu', N'anhmtuan@gmail.com', N'1228093262', 901234567, N'Here am i', 2, N'Active')
INSERT [dbo].[users] ([userID], [userName], [email], [PASSWORD], [phone], [ADDRESS], [ROLE], [STATUS]) VALUES (4, N'Erib', N'anhztuan@gmail.com', N'1228093262', 901234567, N'Here am i', 2, N'Active')
INSERT [dbo].[users] ([userID], [userName], [email], [PASSWORD], [phone], [ADDRESS], [ROLE], [STATUS]) VALUES (5, N'Honda', N'anhqtuan@gmail.com', N'1228093262', 901234567, N'werthyjhng3', 2, N'Active')
INSERT [dbo].[users] ([userID], [userName], [email], [PASSWORD], [phone], [ADDRESS], [ROLE], [STATUS]) VALUES (6, N'asa', N'anhegeg@gmail.com', N'dsfdvgrg', 901234567, N'Here am i', 2, N'Active')
INSERT [dbo].[users] ([userID], [userName], [email], [PASSWORD], [phone], [ADDRESS], [ROLE], [STATUS]) VALUES (7, N'Ew', N'adsfgds@gmail.com', N'cvdbfngbfdvs', 901234567, N'Here am i', 2, N'Active')
INSERT [dbo].[users] ([userID], [userName], [email], [PASSWORD], [phone], [ADDRESS], [ROLE], [STATUS]) VALUES (8, N'Honda', N'asfdgbntr@gmail.com', N'3456uth', 901234567, N'Here am i', 2, N'Active')
INSERT [dbo].[users] ([userID], [userName], [email], [PASSWORD], [phone], [ADDRESS], [ROLE], [STATUS]) VALUES (9, N'Wepu', N'adsfd@gmail.com', N'345y6uyj', 901234567, N'Here am i', 2, N'Active')
INSERT [dbo].[users] ([userID], [userName], [email], [PASSWORD], [phone], [ADDRESS], [ROLE], [STATUS]) VALUES (10, N'Anh', N'anh@gmail.com', N'123456', 912345678, N'ASASA', 2, N'Active')
SET IDENTITY_INSERT [dbo].[users] OFF
ALTER TABLE [dbo].[History]  WITH CHECK ADD FOREIGN KEY([productID])
REFERENCES [dbo].[Product] ([productID])
GO
ALTER TABLE [dbo].[History]  WITH CHECK ADD FOREIGN KEY([userID])
REFERENCES [dbo].[users] ([userID])
GO
ALTER TABLE [dbo].[orderDetail]  WITH CHECK ADD FOREIGN KEY([orderID])
REFERENCES [dbo].[order] ([orderID])
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD FOREIGN KEY([categoryID])
REFERENCES [dbo].[Category] ([catagoryID])
GO
ALTER TABLE [dbo].[users]  WITH CHECK ADD FOREIGN KEY([ROLE])
REFERENCES [dbo].[roles] ([roleID])
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [NotNegative] CHECK  (([quantity]>=(0)))
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [NotNegative]
GO
USE [master]
GO
ALTER DATABASE [YellowMoon] SET  READ_WRITE 
GO
