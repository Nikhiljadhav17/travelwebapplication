USE [master]
GO
/****** Object:  Database [M-Indicator]    Script Date: 27-04-2022 12:53:08 ******/
CREATE DATABASE [M-Indicator]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'M-Indicator', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\M-Indicator.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'M-Indicator_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\M-Indicator_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [M-Indicator] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [M-Indicator].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [M-Indicator] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [M-Indicator] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [M-Indicator] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [M-Indicator] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [M-Indicator] SET ARITHABORT OFF 
GO
ALTER DATABASE [M-Indicator] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [M-Indicator] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [M-Indicator] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [M-Indicator] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [M-Indicator] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [M-Indicator] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [M-Indicator] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [M-Indicator] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [M-Indicator] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [M-Indicator] SET  DISABLE_BROKER 
GO
ALTER DATABASE [M-Indicator] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [M-Indicator] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [M-Indicator] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [M-Indicator] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [M-Indicator] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [M-Indicator] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [M-Indicator] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [M-Indicator] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [M-Indicator] SET  MULTI_USER 
GO
ALTER DATABASE [M-Indicator] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [M-Indicator] SET DB_CHAINING OFF 
GO
ALTER DATABASE [M-Indicator] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [M-Indicator] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [M-Indicator] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [M-Indicator] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [M-Indicator] SET QUERY_STORE = OFF
GO
USE [M-Indicator]
GO
/****** Object:  Table [dbo].[BbusDetails]    Script Date: 27-04-2022 12:53:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BbusDetails](
	[BusNo] [varchar](50) NOT NULL,
	[Source] [varchar](50) NOT NULL,
	[Destination] [varchar](50) NOT NULL,
	[Date] [varchar](50) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BbusNo]    Script Date: 27-04-2022 12:53:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BbusNo](
	[BusNo] [varchar](50) NOT NULL,
	[HaltStops] [varchar](50) NOT NULL,
	[Bid] [int] IDENTITY(1,1) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BbusStops]    Script Date: 27-04-2022 12:53:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BbusStops](
	[BusId] [varchar](50) NOT NULL,
	[BusStop] [varchar](50) NOT NULL,
	[Date] [varchar](50) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CentralStat]    Script Date: 27-04-2022 12:53:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CentralStat](
	[StatId] [varchar](50) NOT NULL,
	[StationName] [varchar](50) NOT NULL,
	[Date] [varchar](50) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CTrainDetails]    Script Date: 27-04-2022 12:53:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CTrainDetails](
	[TrainId] [varchar](50) NOT NULL,
	[Source] [varchar](50) NOT NULL,
	[Destination] [varchar](50) NOT NULL,
	[Stime] [varchar](50) NOT NULL,
	[Dtime] [varchar](50) NOT NULL,
	[TrainType] [varchar](50) NOT NULL,
	[Date] [varchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CTrainHalts]    Script Date: 27-04-2022 12:53:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CTrainHalts](
	[TrainId] [varchar](50) NOT NULL,
	[HaltStat] [varchar](50) NOT NULL,
	[HaltTime] [varchar](50) NOT NULL,
	[Tid] [int] IDENTITY(1,1) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HarbourStat]    Script Date: 27-04-2022 12:53:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HarbourStat](
	[StatId] [varchar](50) NOT NULL,
	[StationName] [varchar](50) NOT NULL,
	[Date] [varchar](50) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HTrainDetails]    Script Date: 27-04-2022 12:53:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HTrainDetails](
	[TrainId] [varchar](50) NOT NULL,
	[Source] [varchar](50) NOT NULL,
	[Destination] [varchar](50) NOT NULL,
	[Stime] [varchar](50) NOT NULL,
	[Dtime] [varchar](50) NOT NULL,
	[TrainType] [varchar](50) NOT NULL,
	[Date] [varchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HTrainHalts]    Script Date: 27-04-2022 12:53:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HTrainHalts](
	[TrainId] [varchar](50) NOT NULL,
	[HaltStat] [varchar](50) NOT NULL,
	[HaltTime] [varchar](50) NOT NULL,
	[Tid] [int] IDENTITY(1,1) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NbusDetails]    Script Date: 27-04-2022 12:53:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NbusDetails](
	[BusId] [nchar](10) NULL,
	[Source] [nchar](10) NULL,
	[Destination] [nchar](10) NULL,
	[Date] [nchar](10) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NbusNo]    Script Date: 27-04-2022 12:53:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NbusNo](
	[BusNo] [varchar](50) NOT NULL,
	[HaltStops] [varchar](50) NOT NULL,
	[Bid] [int] IDENTITY(1,1) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NbusStops]    Script Date: 27-04-2022 12:53:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NbusStops](
	[BusId] [varchar](50) NOT NULL,
	[BusStop] [varchar](50) NOT NULL,
	[Date] [varchar](50) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TbusDetails]    Script Date: 27-04-2022 12:53:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TbusDetails](
	[BusNo] [varchar](50) NOT NULL,
	[Source] [varchar](50) NOT NULL,
	[Destination] [varchar](50) NOT NULL,
	[date] [varchar](50) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TbusNo]    Script Date: 27-04-2022 12:53:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TbusNo](
	[BusNo] [varchar](50) NOT NULL,
	[HaltStops] [varchar](50) NOT NULL,
	[Bid] [int] IDENTITY(1,1) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TbusStops]    Script Date: 27-04-2022 12:53:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TbusStops](
	[BusId] [varchar](50) NOT NULL,
	[BusStop] [varchar](50) NOT NULL,
	[Date] [varchar](50) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserRegister]    Script Date: 27-04-2022 12:53:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserRegister](
	[UserId] [varchar](50) NOT NULL,
	[Uname] [varchar](50) NOT NULL,
	[Addr] [varchar](500) NOT NULL,
	[MobNo] [varchar](50) NOT NULL,
	[Password] [varchar](50) NOT NULL,
	[DOB] [varchar](50) NULL,
	[EmailId] [varchar](50) NULL,
	[Gender] [varchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[WesternStat]    Script Date: 27-04-2022 12:53:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[WesternStat](
	[StatId] [varchar](50) NOT NULL,
	[StationName] [varchar](50) NOT NULL,
	[Date] [varchar](50) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[WTrainDetails]    Script Date: 27-04-2022 12:53:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[WTrainDetails](
	[TrainId] [varchar](50) NOT NULL,
	[Source] [varchar](50) NOT NULL,
	[Destination] [varchar](50) NOT NULL,
	[Stime] [varchar](50) NOT NULL,
	[Dtime] [varchar](50) NOT NULL,
	[TrainType] [varchar](50) NOT NULL,
	[Date] [varchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[WTrainHalts]    Script Date: 27-04-2022 12:53:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[WTrainHalts](
	[TrainId] [varchar](50) NOT NULL,
	[HaltStat] [varchar](50) NOT NULL,
	[HaltTime] [varchar](50) NOT NULL,
	[Tid] [int] IDENTITY(1,1) NOT NULL
) ON [PRIMARY]
GO
INSERT [dbo].[BbusDetails] ([BusNo], [Source], [Destination], [Date]) VALUES (N'701', N'National Park', N'Thakur House', N'25-04-2022')
INSERT [dbo].[BbusDetails] ([BusNo], [Source], [Destination], [Date]) VALUES (N'701', N'National Park', N'Thakur House', N'26-04-2022')
GO
SET IDENTITY_INSERT [dbo].[BbusNo] ON 

INSERT [dbo].[BbusNo] ([BusNo], [HaltStops], [Bid]) VALUES (N'701', N'National Park', 1)
INSERT [dbo].[BbusNo] ([BusNo], [HaltStops], [Bid]) VALUES (N'701', N'Magathane', 2)
INSERT [dbo].[BbusNo] ([BusNo], [HaltStops], [Bid]) VALUES (N'701', N'Samata nagar', 3)
SET IDENTITY_INSERT [dbo].[BbusNo] OFF
GO
INSERT [dbo].[BbusStops] ([BusId], [BusStop], [Date]) VALUES (N'100', N'National Park', N'25-04-2022')
INSERT [dbo].[BbusStops] ([BusId], [BusStop], [Date]) VALUES (N'101', N'Magathane', N'25-04-2022')
INSERT [dbo].[BbusStops] ([BusId], [BusStop], [Date]) VALUES (N'102', N'Samta Nagar', N'25-04-2022')
INSERT [dbo].[BbusStops] ([BusId], [BusStop], [Date]) VALUES (N'103', N'Thakur House', N'25-04-2022')
INSERT [dbo].[BbusStops] ([BusId], [BusStop], [Date]) VALUES (N'104', N'Gokul Anand', N'25-04-2022')
GO
INSERT [dbo].[CentralStat] ([StatId], [StationName], [Date]) VALUES (N'0', N'Kurla', N'25-04-2022')
INSERT [dbo].[CentralStat] ([StatId], [StationName], [Date]) VALUES (N'0', N'Thane', N'25-04-2022')
INSERT [dbo].[CentralStat] ([StatId], [StationName], [Date]) VALUES (N'0', N'Dombivali', N'25-04-2022')
INSERT [dbo].[CentralStat] ([StatId], [StationName], [Date]) VALUES (N'0', N'Kalyan', N'25-04-2022')
GO
INSERT [dbo].[UserRegister] ([UserId], [Uname], [Addr], [MobNo], [Password], [DOB], [EmailId], [Gender]) VALUES (N'1001', N'Martin', N' Andheri', N'9874563214', N'1234', N'01/01/1998', N'john.martis@gmail.com', N'Male')
INSERT [dbo].[UserRegister] ([UserId], [Uname], [Addr], [MobNo], [Password], [DOB], [EmailId], [Gender]) VALUES (N'1002', N'Amey', N'Kandivali', N'9874563215', N'1234', N'26/11/2012', N'amey123@gmail.com', N'Male')
INSERT [dbo].[UserRegister] ([UserId], [Uname], [Addr], [MobNo], [Password], [DOB], [EmailId], [Gender]) VALUES (N'1003', N'Amey', N'Kandivali', N'9874563215', N'1234', N'28/04/2022', N'amey123@gmail.com', N'Male')
GO
INSERT [dbo].[WesternStat] ([StatId], [StationName], [Date]) VALUES (N'100', N'Borivali', N'23-04-2022')
INSERT [dbo].[WesternStat] ([StatId], [StationName], [Date]) VALUES (N'101', N'Andheri', N'23-04-2022')
INSERT [dbo].[WesternStat] ([StatId], [StationName], [Date]) VALUES (N'102', N'Bandra', N'23-04-2022')
INSERT [dbo].[WesternStat] ([StatId], [StationName], [Date]) VALUES (N'103', N'Dadar', N'23-04-2022')
GO
INSERT [dbo].[WTrainDetails] ([TrainId], [Source], [Destination], [Stime], [Dtime], [TrainType], [Date]) VALUES (N'1001', N'Churchagte', N'Borivali', N'10:30', N'11:40', N'Fast', N'26-04-2022')
GO
SET IDENTITY_INSERT [dbo].[WTrainHalts] ON 

INSERT [dbo].[WTrainHalts] ([TrainId], [HaltStat], [HaltTime], [Tid]) VALUES (N'1000', N'Borivali', N'10:01', 1)
INSERT [dbo].[WTrainHalts] ([TrainId], [HaltStat], [HaltTime], [Tid]) VALUES (N'1000', N'Andheri', N'10:13', 2)
INSERT [dbo].[WTrainHalts] ([TrainId], [HaltStat], [HaltTime], [Tid]) VALUES (N'1000', N'Borivali', N'10:00', 3)
INSERT [dbo].[WTrainHalts] ([TrainId], [HaltStat], [HaltTime], [Tid]) VALUES (N'1000', N'Borivali', N'10:00', 4)
INSERT [dbo].[WTrainHalts] ([TrainId], [HaltStat], [HaltTime], [Tid]) VALUES (N'1001', N'Churchagte', N'10:30', 5)
INSERT [dbo].[WTrainHalts] ([TrainId], [HaltStat], [HaltTime], [Tid]) VALUES (N'1001', N'Dadar', N'10:43', 6)
INSERT [dbo].[WTrainHalts] ([TrainId], [HaltStat], [HaltTime], [Tid]) VALUES (N'1001', N'Bandra', N'10:55', 7)
INSERT [dbo].[WTrainHalts] ([TrainId], [HaltStat], [HaltTime], [Tid]) VALUES (N'1001', N'Andheri', N'11:15', 8)
INSERT [dbo].[WTrainHalts] ([TrainId], [HaltStat], [HaltTime], [Tid]) VALUES (N'1001', N'Borivali', N'11:40', 9)
SET IDENTITY_INSERT [dbo].[WTrainHalts] OFF
GO
USE [master]
GO
ALTER DATABASE [M-Indicator] SET  READ_WRITE 
GO
