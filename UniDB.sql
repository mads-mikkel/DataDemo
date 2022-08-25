USE [master]
GO
/****** Object:  Database [UniDb]    Script Date: 25-08-2022 11:42:56 ******/
CREATE DATABASE [UniDb]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'UniDb', FILENAME = N'C:\Users\DIT UNILGIN HER\UniDb.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'UniDb_log', FILENAME = N'C:\Users\DIT UNILGIN HER\UniDb_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [UniDb] SET COMPATIBILITY_LEVEL = 130
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [UniDb].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [UniDb] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [UniDb] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [UniDb] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [UniDb] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [UniDb] SET ARITHABORT OFF 
GO
ALTER DATABASE [UniDb] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [UniDb] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [UniDb] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [UniDb] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [UniDb] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [UniDb] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [UniDb] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [UniDb] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [UniDb] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [UniDb] SET  DISABLE_BROKER 
GO
ALTER DATABASE [UniDb] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [UniDb] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [UniDb] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [UniDb] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [UniDb] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [UniDb] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [UniDb] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [UniDb] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [UniDb] SET  MULTI_USER 
GO
ALTER DATABASE [UniDb] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [UniDb] SET DB_CHAINING OFF 
GO
ALTER DATABASE [UniDb] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [UniDb] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [UniDb] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [UniDb] SET QUERY_STORE = OFF
GO
USE [UniDb]
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
USE [UniDb]
GO
/****** Object:  Table [dbo].[Addresses]    Script Date: 25-08-2022 11:42:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Addresses](
	[AddressId] [int] IDENTITY(1,1) NOT NULL,
	[StreetName] [nvarchar](50) NOT NULL,
	[StreetNumber] [nvarchar](50) NOT NULL,
	[Zip] [nvarchar](50) NOT NULL,
	[City] [nvarchar](50) NOT NULL,
	[Country] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[AddressId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ContactInformations]    Script Date: 25-08-2022 11:42:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ContactInformations](
	[ContactInformationId] [int] IDENTITY(1,1) NOT NULL,
	[PhoneNumber] [nvarchar](20) NOT NULL,
	[Mail] [nvarchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ContactInformationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Persons]    Script Date: 25-08-2022 11:42:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Persons](
	[PersonId] [int] IDENTITY(1,1) NOT NULL,
	[Firstname] [nvarchar](50) NOT NULL,
	[Lastname] [nvarchar](50) NOT NULL,
	[FK_ContactInformationId] [int] NULL,
	[FK_AdresssId] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[PersonId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Addresses] ON 
GO
INSERT [dbo].[Addresses] ([AddressId], [StreetName], [StreetNumber], [Zip], [City], [Country]) VALUES (1, N'Boulevarden', N'48', N'7100', N'Vejle', N'Denmark')
GO
INSERT [dbo].[Addresses] ([AddressId], [StreetName], [StreetNumber], [Zip], [City], [Country]) VALUES (2, N'Danmarksgade', N'1', N'483', N'Thorshavn', N'Faroe Islands')
GO
INSERT [dbo].[Addresses] ([AddressId], [StreetName], [StreetNumber], [Zip], [City], [Country]) VALUES (3, N'Skolegade', N'71', N'7100', N'Vejle', N'Denmark')
GO
SET IDENTITY_INSERT [dbo].[Addresses] OFF
GO
SET IDENTITY_INSERT [dbo].[ContactInformations] ON 
GO
INSERT [dbo].[ContactInformations] ([ContactInformationId], [PhoneNumber], [Mail]) VALUES (1, N'78945612', N'44@mail.com')
GO
INSERT [dbo].[ContactInformations] ([ContactInformationId], [PhoneNumber], [Mail]) VALUES (2, N'32165498', N'33@mail.com')
GO
INSERT [dbo].[ContactInformations] ([ContactInformationId], [PhoneNumber], [Mail]) VALUES (3, N'45612378', N'cs@mail.com')
GO
INSERT [dbo].[ContactInformations] ([ContactInformationId], [PhoneNumber], [Mail]) VALUES (1002, N'34567987', N'person@mail.com')
GO
INSERT [dbo].[ContactInformations] ([ContactInformationId], [PhoneNumber], [Mail]) VALUES (1003, N'34567987', N'person@mail.com')
GO
INSERT [dbo].[ContactInformations] ([ContactInformationId], [PhoneNumber], [Mail]) VALUES (1004, N'34567987', N'person@mail.com')
GO
INSERT [dbo].[ContactInformations] ([ContactInformationId], [PhoneNumber], [Mail]) VALUES (1005, N'34567987', N'person@mail.com')
GO
INSERT [dbo].[ContactInformations] ([ContactInformationId], [PhoneNumber], [Mail]) VALUES (1006, N'34567987', N'person@mail.com')
GO
INSERT [dbo].[ContactInformations] ([ContactInformationId], [PhoneNumber], [Mail]) VALUES (1007, N'34567987', N'person@mail.com')
GO
INSERT [dbo].[ContactInformations] ([ContactInformationId], [PhoneNumber], [Mail]) VALUES (1008, N'34567987', N'person@mail.com')
GO
INSERT [dbo].[ContactInformations] ([ContactInformationId], [PhoneNumber], [Mail]) VALUES (1009, N'34567987', N'person@mail.com')
GO
INSERT [dbo].[ContactInformations] ([ContactInformationId], [PhoneNumber], [Mail]) VALUES (1010, N'34567987', N'person@mail.com')
GO
INSERT [dbo].[ContactInformations] ([ContactInformationId], [PhoneNumber], [Mail]) VALUES (1011, N'34567987', N'person@mail.com')
GO
INSERT [dbo].[ContactInformations] ([ContactInformationId], [PhoneNumber], [Mail]) VALUES (1012, N'34567987', N'person@mail.com')
GO
INSERT [dbo].[ContactInformations] ([ContactInformationId], [PhoneNumber], [Mail]) VALUES (1013, N'34567987', N'person@mail.com')
GO
INSERT [dbo].[ContactInformations] ([ContactInformationId], [PhoneNumber], [Mail]) VALUES (1014, N'34567987', N'person@mail.com')
GO
INSERT [dbo].[ContactInformations] ([ContactInformationId], [PhoneNumber], [Mail]) VALUES (1015, N'34567987', N'person@mail.com')
GO
INSERT [dbo].[ContactInformations] ([ContactInformationId], [PhoneNumber], [Mail]) VALUES (1016, N'34567987', N'person@mail.com')
GO
INSERT [dbo].[ContactInformations] ([ContactInformationId], [PhoneNumber], [Mail]) VALUES (1017, N'34567987', N'person@mail.com')
GO
INSERT [dbo].[ContactInformations] ([ContactInformationId], [PhoneNumber], [Mail]) VALUES (1018, N'34567987', N'person@mail.com')
GO
INSERT [dbo].[ContactInformations] ([ContactInformationId], [PhoneNumber], [Mail]) VALUES (1019, N'34567987', N'person@mail.com')
GO
INSERT [dbo].[ContactInformations] ([ContactInformationId], [PhoneNumber], [Mail]) VALUES (1020, N'34567987', N'person@mail.com')
GO
INSERT [dbo].[ContactInformations] ([ContactInformationId], [PhoneNumber], [Mail]) VALUES (1021, N'34567987', N'person@mail.com')
GO
INSERT [dbo].[ContactInformations] ([ContactInformationId], [PhoneNumber], [Mail]) VALUES (1022, N'34567987', N'person@mail.com')
GO
INSERT [dbo].[ContactInformations] ([ContactInformationId], [PhoneNumber], [Mail]) VALUES (1023, N'34567987', N'person@mail.com')
GO
INSERT [dbo].[ContactInformations] ([ContactInformationId], [PhoneNumber], [Mail]) VALUES (1024, N'34567987', N'person@mail.com')
GO
INSERT [dbo].[ContactInformations] ([ContactInformationId], [PhoneNumber], [Mail]) VALUES (1025, N'34567987', N'person@mail.com')
GO
INSERT [dbo].[ContactInformations] ([ContactInformationId], [PhoneNumber], [Mail]) VALUES (1026, N'34567987', N'person@mail.com')
GO
INSERT [dbo].[ContactInformations] ([ContactInformationId], [PhoneNumber], [Mail]) VALUES (1027, N'34567987', N'person@mail.com')
GO
SET IDENTITY_INSERT [dbo].[ContactInformations] OFF
GO
SET IDENTITY_INSERT [dbo].[Persons] ON 
GO
INSERT [dbo].[Persons] ([PersonId], [Firstname], [Lastname], [FK_ContactInformationId], [FK_AdresssId]) VALUES (1, N'Lewis', N'Hamiltons', 2, 1)
GO
INSERT [dbo].[Persons] ([PersonId], [Firstname], [Lastname], [FK_ContactInformationId], [FK_AdresssId]) VALUES (2, N'Max f', N'Verstappen', 1, 2)
GO
INSERT [dbo].[Persons] ([PersonId], [Firstname], [Lastname], [FK_ContactInformationId], [FK_AdresssId]) VALUES (3, N'Carlos f', N'Sainz', 3, 1)
GO
SET IDENTITY_INSERT [dbo].[Persons] OFF
GO
/****** Object:  Index [UQ__Persons__4479306B61BE080E]    Script Date: 25-08-2022 11:42:57 ******/
ALTER TABLE [dbo].[Persons] ADD UNIQUE NONCLUSTERED 
(
	[FK_ContactInformationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Persons]  WITH CHECK ADD  CONSTRAINT [FK_Persons_Addresses] FOREIGN KEY([FK_AdresssId])
REFERENCES [dbo].[Addresses] ([AddressId])
GO
ALTER TABLE [dbo].[Persons] CHECK CONSTRAINT [FK_Persons_Addresses]
GO
ALTER TABLE [dbo].[Persons]  WITH CHECK ADD  CONSTRAINT [FK_Persons_ContactInformations] FOREIGN KEY([FK_ContactInformationId])
REFERENCES [dbo].[ContactInformations] ([ContactInformationId])
GO
ALTER TABLE [dbo].[Persons] CHECK CONSTRAINT [FK_Persons_ContactInformations]
GO
USE [master]
GO
ALTER DATABASE [UniDb] SET  READ_WRITE 
GO
