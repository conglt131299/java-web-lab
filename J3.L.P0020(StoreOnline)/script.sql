USE [master]
GO
/****** Object:  Database [StoreOnline]    Script Date: 24/09/2019 6:37:43 CH ******/
CREATE DATABASE [StoreOnline]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'StoreOnline', FILENAME = N'D:\Program Files\MSSQL14.SQLEXPRESS\MSSQL\DATA\StoreOnline.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'StoreOnline_log', FILENAME = N'D:\Program Files\MSSQL14.SQLEXPRESS\MSSQL\DATA\StoreOnline_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [StoreOnline] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [StoreOnline].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [StoreOnline] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [StoreOnline] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [StoreOnline] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [StoreOnline] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [StoreOnline] SET ARITHABORT OFF 
GO
ALTER DATABASE [StoreOnline] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [StoreOnline] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [StoreOnline] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [StoreOnline] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [StoreOnline] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [StoreOnline] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [StoreOnline] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [StoreOnline] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [StoreOnline] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [StoreOnline] SET  ENABLE_BROKER 
GO
ALTER DATABASE [StoreOnline] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [StoreOnline] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [StoreOnline] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [StoreOnline] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [StoreOnline] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [StoreOnline] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [StoreOnline] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [StoreOnline] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [StoreOnline] SET  MULTI_USER 
GO
ALTER DATABASE [StoreOnline] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [StoreOnline] SET DB_CHAINING OFF 
GO
ALTER DATABASE [StoreOnline] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [StoreOnline] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [StoreOnline] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [StoreOnline] SET QUERY_STORE = OFF
GO
USE [StoreOnline]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 24/09/2019 6:37:43 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](250) NULL,
	[image] [nvarchar](250) NULL,
	[description] [nvarchar](max) NULL,
	[quantity] [int] NULL,
	[price] [float] NULL,
	[pulishDate] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Product] ON 

INSERT [dbo].[Product] ([id], [name], [image], [description], [quantity], [price], [pulishDate]) VALUES (1, N'Retro Lamp', N'i284008264480588936._rsw480h360_szw480h360_.jpg', N'Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat.', 10, 50, CAST(N'2019-09-24T18:32:00.000' AS DateTime))
INSERT [dbo].[Product] ([id], [name], [image], [description], [quantity], [price], [pulishDate]) VALUES (2, N'Grindly Cup', N'i284008264480588941._rsw480h360_szw480h360_.jpg', N'Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat.', 20, 25, CAST(N'2019-09-22T11:32:00.000' AS DateTime))
INSERT [dbo].[Product] ([id], [name], [image], [description], [quantity], [price], [pulishDate]) VALUES (3, N'Black Metal Lamp', N'i284008264480588948._rsw480h360_szw480h360_.jpg', N'Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat.', 30, 45, CAST(N'2019-09-21T06:32:00.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[Product] OFF
USE [master]
GO
ALTER DATABASE [StoreOnline] SET  READ_WRITE 
GO
