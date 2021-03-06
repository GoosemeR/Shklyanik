USE [master]
GO
/****** Object:  Database [DB]    Script Date: 14.04.2020 16:58:08 ******/
CREATE DATABASE [DB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'DB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SSQLEXPRESS\MSSQL\DATA\DB.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'DB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SSQLEXPRESS\MSSQL\DATA\DB_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [DB] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [DB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [DB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [DB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [DB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [DB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [DB] SET ARITHABORT OFF 
GO
ALTER DATABASE [DB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [DB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [DB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [DB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [DB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [DB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [DB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [DB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [DB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [DB] SET  DISABLE_BROKER 
GO
ALTER DATABASE [DB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [DB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [DB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [DB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [DB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [DB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [DB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [DB] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [DB] SET  MULTI_USER 
GO
ALTER DATABASE [DB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [DB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [DB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [DB] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [DB] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [DB] SET QUERY_STORE = OFF
GO
USE [DB]
GO
/****** Object:  Table [dbo].[Departments]    Script Date: 14.04.2020 16:58:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Departments](
	[id] [int] NOT NULL,
	[Title] [nvarchar](50) NOT NULL,
	[Phone] [nvarchar](11) NOT NULL,
 CONSTRAINT [PK_Departments] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Marks]    Script Date: 14.04.2020 16:58:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Marks](
	[id] [int] NOT NULL,
	[LowPoints] [int] NOT NULL,
	[HighPoints] [money] NOT NULL,
 CONSTRAINT [PK_Marks] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Results]    Script Date: 14.04.2020 16:58:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Results](
	[Points] [int] NOT NULL,
	[DataExam] [datetime] NOT NULL,
	[Student] [int] NOT NULL,
	[Subject] [int] NOT NULL,
	[Teacher] [int] NOT NULL,
	[NumSemestr] [int] NOT NULL,
	[Mark] [int] NOT NULL,
 CONSTRAINT [PK_Results] PRIMARY KEY CLUSTERED 
(
	[Student] ASC,
	[Subject] ASC,
	[Teacher] ASC,
	[NumSemestr] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Sessions]    Script Date: 14.04.2020 16:58:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sessions](
	[NumGroup] [int] NOT NULL,
	[NumSemestr] [int] NOT NULL,
	[Zach_Exam] [nvarchar](7) NOT NULL,
	[idSubject] [int] NOT NULL,
	[idTeacher] [int] NOT NULL,
 CONSTRAINT [PK_Sessions] PRIMARY KEY CLUSTERED 
(
	[NumGroup] ASC,
	[NumSemestr] ASC,
	[idSubject] ASC,
	[idTeacher] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Students]    Script Date: 14.04.2020 16:58:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Students](
	[id] [int] NOT NULL,
	[FIO] [nvarchar](150) NOT NULL,
	[NumGroup] [nvarchar](10) NOT NULL,
 CONSTRAINT [PK_Students] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Subjects]    Script Date: 14.04.2020 16:58:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Subjects](
	[id] [int] NOT NULL,
	[Title] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Subjects] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Teachers]    Script Date: 14.04.2020 16:58:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Teachers](
	[id] [int] NOT NULL,
	[FIO] [nvarchar](50) NOT NULL,
	[Staff] [nvarchar](15) NOT NULL,
	[Departments] [int] NOT NULL,
 CONSTRAINT [PK_Teachers] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Results]  WITH CHECK ADD  CONSTRAINT [FK_Results_Students] FOREIGN KEY([Student])
REFERENCES [dbo].[Students] ([id])
GO
ALTER TABLE [dbo].[Results] CHECK CONSTRAINT [FK_Results_Students]
GO
ALTER TABLE [dbo].[Sessions]  WITH CHECK ADD  CONSTRAINT [FK_Sessions_Subjects] FOREIGN KEY([idSubject])
REFERENCES [dbo].[Subjects] ([id])
GO
ALTER TABLE [dbo].[Sessions] CHECK CONSTRAINT [FK_Sessions_Subjects]
GO
ALTER TABLE [dbo].[Sessions]  WITH CHECK ADD  CONSTRAINT [FK_Sessions_Teachers] FOREIGN KEY([idTeacher])
REFERENCES [dbo].[Teachers] ([id])
GO
ALTER TABLE [dbo].[Sessions] CHECK CONSTRAINT [FK_Sessions_Teachers]
GO
ALTER TABLE [dbo].[Teachers]  WITH CHECK ADD  CONSTRAINT [FK_Teachers_Departments] FOREIGN KEY([Departments])
REFERENCES [dbo].[Departments] ([id])
GO
ALTER TABLE [dbo].[Teachers] CHECK CONSTRAINT [FK_Teachers_Departments]
GO
USE [master]
GO
ALTER DATABASE [DB] SET  READ_WRITE 
GO
