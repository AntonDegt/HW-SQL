USE [master]
GO
/****** Object:  Database [Publishment]    Script Date: 15.01.2023 22:57:53 ******/
CREATE DATABASE [Publishment]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Publishment', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER01\MSSQL\DATA\Publishment.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Publishment_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER01\MSSQL\DATA\Publishment_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [Publishment] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Publishment].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Publishment] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Publishment] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Publishment] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Publishment] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Publishment] SET ARITHABORT OFF 
GO
ALTER DATABASE [Publishment] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Publishment] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Publishment] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Publishment] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Publishment] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Publishment] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Publishment] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Publishment] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Publishment] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Publishment] SET  ENABLE_BROKER 
GO
ALTER DATABASE [Publishment] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Publishment] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Publishment] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Publishment] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Publishment] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Publishment] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Publishment] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Publishment] SET RECOVERY FULL 
GO
ALTER DATABASE [Publishment] SET  MULTI_USER 
GO
ALTER DATABASE [Publishment] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Publishment] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Publishment] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Publishment] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Publishment] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Publishment] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'Publishment', N'ON'
GO
ALTER DATABASE [Publishment] SET QUERY_STORE = OFF
GO
USE [Publishment]
GO
/****** Object:  Table [dbo].[Author]    Script Date: 15.01.2023 22:57:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Author](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[firstname] [varchar](50) NULL,
	[lastname] [varchar](50) NULL,
	[id_country] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Book]    Script Date: 15.01.2023 22:57:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Book](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](50) NULL,
	[id_theme] [int] NULL,
	[id_author] [int] NULL,
	[price] [float] NULL,
	[date_of_publish] [date] NULL,
	[pages] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Country]    Script Date: 15.01.2023 22:57:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Country](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Sale]    Script Date: 15.01.2023 22:57:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sale](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[id_book] [int] NULL,
	[id_shop] [int] NULL,
	[price] [float] NULL,
	[quantity] [int] NULL,
	[date_of_sale] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Shop]    Script Date: 15.01.2023 22:57:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Shop](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](50) NULL,
	[id_country] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Themes]    Script Date: 15.01.2023 22:57:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Themes](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Author]  WITH CHECK ADD  CONSTRAINT [FK_Author_Country] FOREIGN KEY([id_country])
REFERENCES [dbo].[Country] ([id])
GO
ALTER TABLE [dbo].[Author] CHECK CONSTRAINT [FK_Author_Country]
GO
ALTER TABLE [dbo].[Book]  WITH CHECK ADD  CONSTRAINT [FK_Book_Author] FOREIGN KEY([id_author])
REFERENCES [dbo].[Author] ([id])
GO
ALTER TABLE [dbo].[Book] CHECK CONSTRAINT [FK_Book_Author]
GO
ALTER TABLE [dbo].[Book]  WITH CHECK ADD  CONSTRAINT [FK_Book_Themes] FOREIGN KEY([id_theme])
REFERENCES [dbo].[Themes] ([id])
GO
ALTER TABLE [dbo].[Book] CHECK CONSTRAINT [FK_Book_Themes]
GO
ALTER TABLE [dbo].[Sale]  WITH CHECK ADD  CONSTRAINT [FK_Sale_Book] FOREIGN KEY([id_book])
REFERENCES [dbo].[Book] ([id])
GO
ALTER TABLE [dbo].[Sale] CHECK CONSTRAINT [FK_Sale_Book]
GO
ALTER TABLE [dbo].[Sale]  WITH CHECK ADD  CONSTRAINT [FK_Sale_Shop] FOREIGN KEY([id_shop])
REFERENCES [dbo].[Shop] ([id])
GO
ALTER TABLE [dbo].[Sale] CHECK CONSTRAINT [FK_Sale_Shop]
GO
ALTER TABLE [dbo].[Shop]  WITH CHECK ADD  CONSTRAINT [FK_Shop_Country] FOREIGN KEY([id_country])
REFERENCES [dbo].[Country] ([id])
GO
ALTER TABLE [dbo].[Shop] CHECK CONSTRAINT [FK_Shop_Country]
GO
USE [master]
GO
ALTER DATABASE [Publishment] SET  READ_WRITE 
GO
