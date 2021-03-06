USE [master]
GO
/****** Object:  Database [BusTicketSystemDB]    Script Date: 18.02.2019 13:37:40 ******/
CREATE DATABASE [BusTicketSystemDB] ON  PRIMARY 
( NAME = N'BusTicketSystemDB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\BusTicketSystemDB.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'BusTicketSystemDB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\BusTicketSystemDB_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [BusTicketSystemDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [BusTicketSystemDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [BusTicketSystemDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [BusTicketSystemDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [BusTicketSystemDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [BusTicketSystemDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [BusTicketSystemDB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [BusTicketSystemDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [BusTicketSystemDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [BusTicketSystemDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [BusTicketSystemDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [BusTicketSystemDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [BusTicketSystemDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [BusTicketSystemDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [BusTicketSystemDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [BusTicketSystemDB] SET  DISABLE_BROKER 
GO
ALTER DATABASE [BusTicketSystemDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [BusTicketSystemDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [BusTicketSystemDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [BusTicketSystemDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [BusTicketSystemDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [BusTicketSystemDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [BusTicketSystemDB] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [BusTicketSystemDB] SET  MULTI_USER 
GO
ALTER DATABASE [BusTicketSystemDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [BusTicketSystemDB] SET DB_CHAINING OFF 
GO
USE [BusTicketSystemDB]
GO
/****** Object:  Table [dbo].[tblBilet]    Script Date: 18.02.2019 13:37:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblBilet](
	[biletID] [int] IDENTITY(1,1) NOT NULL,
	[yolcuID] [int] NULL,
	[seferID] [int] NULL,
 CONSTRAINT [PK_tblBilet] PRIMARY KEY CLUSTERED 
(
	[biletID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblOtobus]    Script Date: 18.02.2019 13:37:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblOtobus](
	[otobusID] [int] IDENTITY(1,1) NOT NULL,
	[otobusMarka] [nvarchar](50) NULL,
	[otobusPlaka] [nvarchar](50) NULL,
	[isActive] [bit] NULL CONSTRAINT [DF_tblOtobus_isActive]  DEFAULT ((1)),
 CONSTRAINT [PK_tblOtobus] PRIMARY KEY CLUSTERED 
(
	[otobusID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblRota]    Script Date: 18.02.2019 13:37:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblRota](
	[rotaID] [int] IDENTITY(1,1) NOT NULL,
	[baslangic] [nvarchar](50) NULL,
	[bitis] [nvarchar](50) NULL,
	[rotaGenelID] [int] NULL,
 CONSTRAINT [PK_tblRota] PRIMARY KEY CLUSTERED 
(
	[rotaID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblRotaGenel]    Script Date: 18.02.2019 13:37:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblRotaGenel](
	[rotaGenelID] [int] IDENTITY(1,1) NOT NULL,
	[baslangic] [nvarchar](50) NULL,
	[bitis] [nvarchar](50) NULL,
 CONSTRAINT [PK_tblRotaGenel] PRIMARY KEY CLUSTERED 
(
	[rotaGenelID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblSefer]    Script Date: 18.02.2019 13:37:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblSefer](
	[seferID] [int] IDENTITY(1,1) NOT NULL,
	[rotaID] [int] NULL,
	[kalkisTarihi] [nvarchar](50) NULL,
	[kalkisSaati] [nvarchar](50) NULL,
	[seferUcreti] [money] NULL,
	[otobusID] [int] NULL,
 CONSTRAINT [PK_tblSefer] PRIMARY KEY CLUSTERED 
(
	[seferID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblYolcu]    Script Date: 18.02.2019 13:37:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblYolcu](
	[yolcuID] [int] IDENTITY(1,1) NOT NULL,
	[TCKN] [nvarchar](50) NULL,
	[adSoyad] [nvarchar](50) NULL,
	[cinsiyet] [bit] NULL,
	[koltukNumarasi] [int] NULL,
 CONSTRAINT [PK_tblYolcu] PRIMARY KEY CLUSTERED 
(
	[yolcuID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[tblBilet] ON 

INSERT [dbo].[tblBilet] ([biletID], [yolcuID], [seferID]) VALUES (1, 2, 1)
INSERT [dbo].[tblBilet] ([biletID], [yolcuID], [seferID]) VALUES (3, 3, 1)
INSERT [dbo].[tblBilet] ([biletID], [yolcuID], [seferID]) VALUES (4, 4, 1)
INSERT [dbo].[tblBilet] ([biletID], [yolcuID], [seferID]) VALUES (5, 5, 1)
INSERT [dbo].[tblBilet] ([biletID], [yolcuID], [seferID]) VALUES (6, 6, 1)
INSERT [dbo].[tblBilet] ([biletID], [yolcuID], [seferID]) VALUES (7, 7, 1)
INSERT [dbo].[tblBilet] ([biletID], [yolcuID], [seferID]) VALUES (8, 8, 1)
INSERT [dbo].[tblBilet] ([biletID], [yolcuID], [seferID]) VALUES (12, 12, 8)
INSERT [dbo].[tblBilet] ([biletID], [yolcuID], [seferID]) VALUES (14, 14, 8)
INSERT [dbo].[tblBilet] ([biletID], [yolcuID], [seferID]) VALUES (15, 15, 9)
INSERT [dbo].[tblBilet] ([biletID], [yolcuID], [seferID]) VALUES (16, 16, 10)
INSERT [dbo].[tblBilet] ([biletID], [yolcuID], [seferID]) VALUES (18, 18, 8)
INSERT [dbo].[tblBilet] ([biletID], [yolcuID], [seferID]) VALUES (19, 19, 8)
INSERT [dbo].[tblBilet] ([biletID], [yolcuID], [seferID]) VALUES (20, 20, 8)
SET IDENTITY_INSERT [dbo].[tblBilet] OFF
SET IDENTITY_INSERT [dbo].[tblOtobus] ON 

INSERT [dbo].[tblOtobus] ([otobusID], [otobusMarka], [otobusPlaka], [isActive]) VALUES (1, N'Mercedes', N'34 ABC 35', 1)
INSERT [dbo].[tblOtobus] ([otobusID], [otobusMarka], [otobusPlaka], [isActive]) VALUES (2, N'Volvo', N'35 DEF 34', 1)
INSERT [dbo].[tblOtobus] ([otobusID], [otobusMarka], [otobusPlaka], [isActive]) VALUES (6, N'MAN', N'06 AAR 88', 0)
INSERT [dbo].[tblOtobus] ([otobusID], [otobusMarka], [otobusPlaka], [isActive]) VALUES (7, N'Mi', N'08 EE 986', 0)
INSERT [dbo].[tblOtobus] ([otobusID], [otobusMarka], [otobusPlaka], [isActive]) VALUES (8, N'MAs', N'77 BG 87', 0)
INSERT [dbo].[tblOtobus] ([otobusID], [otobusMarka], [otobusPlaka], [isActive]) VALUES (9, N'Setra', N'55 UU 787', 0)
INSERT [dbo].[tblOtobus] ([otobusID], [otobusMarka], [otobusPlaka], [isActive]) VALUES (10, N'TEMSA', N'22 TR  766', 1)
INSERT [dbo].[tblOtobus] ([otobusID], [otobusMarka], [otobusPlaka], [isActive]) VALUES (11, N'Mercedes18', N'13 AAD 54', 0)
INSERT [dbo].[tblOtobus] ([otobusID], [otobusMarka], [otobusPlaka], [isActive]) VALUES (12, N'MAN16', N'06 ANK 55', 1)
INSERT [dbo].[tblOtobus] ([otobusID], [otobusMarka], [otobusPlaka], [isActive]) VALUES (13, N'VOLVO17', N'04 GH 388', 1)
INSERT [dbo].[tblOtobus] ([otobusID], [otobusMarka], [otobusPlaka], [isActive]) VALUES (14, N'VOLVO16', N'35 DD 86', 1)
INSERT [dbo].[tblOtobus] ([otobusID], [otobusMarka], [otobusPlaka], [isActive]) VALUES (15, N'TEMSA17', N'16 AAD 23', 1)
INSERT [dbo].[tblOtobus] ([otobusID], [otobusMarka], [otobusPlaka], [isActive]) VALUES (16, N'SETRA15', N'32 DFG 68', 1)
INSERT [dbo].[tblOtobus] ([otobusID], [otobusMarka], [otobusPlaka], [isActive]) VALUES (17, N'MERCEDES15', N'34 AAS 56', 1)
INSERT [dbo].[tblOtobus] ([otobusID], [otobusMarka], [otobusPlaka], [isActive]) VALUES (18, N'Mercedes', N'34 AAO 22', 1)
SET IDENTITY_INSERT [dbo].[tblOtobus] OFF
SET IDENTITY_INSERT [dbo].[tblRota] ON 

INSERT [dbo].[tblRota] ([rotaID], [baslangic], [bitis], [rotaGenelID]) VALUES (1, N'İstanbul', N'Kayseri', 1)
INSERT [dbo].[tblRota] ([rotaID], [baslangic], [bitis], [rotaGenelID]) VALUES (2, N'İstanbul', N'Ankara', 1)
INSERT [dbo].[tblRota] ([rotaID], [baslangic], [bitis], [rotaGenelID]) VALUES (3, N'İstanbul', N'Adana', 1)
INSERT [dbo].[tblRota] ([rotaID], [baslangic], [bitis], [rotaGenelID]) VALUES (6, N'Kayseri', N'İstanbul', 2)
INSERT [dbo].[tblRota] ([rotaID], [baslangic], [bitis], [rotaGenelID]) VALUES (7, N'Ankara', N'İstanbul', 2)
INSERT [dbo].[tblRota] ([rotaID], [baslangic], [bitis], [rotaGenelID]) VALUES (8, N'Adana', N'İstanbul', 2)
INSERT [dbo].[tblRota] ([rotaID], [baslangic], [bitis], [rotaGenelID]) VALUES (9, N'İzmir', N'Aydın', 3)
INSERT [dbo].[tblRota] ([rotaID], [baslangic], [bitis], [rotaGenelID]) VALUES (10, N'İzmir', N'Denizli', 3)
INSERT [dbo].[tblRota] ([rotaID], [baslangic], [bitis], [rotaGenelID]) VALUES (11, N'Aydın', N'İzmir', 4)
INSERT [dbo].[tblRota] ([rotaID], [baslangic], [bitis], [rotaGenelID]) VALUES (12, N'Denizli', N'İzmir', 4)
SET IDENTITY_INSERT [dbo].[tblRota] OFF
SET IDENTITY_INSERT [dbo].[tblRotaGenel] ON 

INSERT [dbo].[tblRotaGenel] ([rotaGenelID], [baslangic], [bitis]) VALUES (1, N'İstanbul', N'Adana')
INSERT [dbo].[tblRotaGenel] ([rotaGenelID], [baslangic], [bitis]) VALUES (2, N'Adana', N'İstanbul')
INSERT [dbo].[tblRotaGenel] ([rotaGenelID], [baslangic], [bitis]) VALUES (3, N'İzmir', N'Denizli')
INSERT [dbo].[tblRotaGenel] ([rotaGenelID], [baslangic], [bitis]) VALUES (4, N'Denizli', N'İzmir')
SET IDENTITY_INSERT [dbo].[tblRotaGenel] OFF
SET IDENTITY_INSERT [dbo].[tblSefer] ON 

INSERT [dbo].[tblSefer] ([seferID], [rotaID], [kalkisTarihi], [kalkisSaati], [seferUcreti], [otobusID]) VALUES (1, 1, N'2018-12-25', N'19:40', 100.0000, 1)
INSERT [dbo].[tblSefer] ([seferID], [rotaID], [kalkisTarihi], [kalkisSaati], [seferUcreti], [otobusID]) VALUES (5, 2, N'2018-12-30', N'12:00', 150.0000, 13)
INSERT [dbo].[tblSefer] ([seferID], [rotaID], [kalkisTarihi], [kalkisSaati], [seferUcreti], [otobusID]) VALUES (6, 1, N'2018-12-28', N'16:00', 130.0000, 2)
INSERT [dbo].[tblSefer] ([seferID], [rotaID], [kalkisTarihi], [kalkisSaati], [seferUcreti], [otobusID]) VALUES (8, 9, N'2018-12-25', N'18:00', 20.0000, 2)
INSERT [dbo].[tblSefer] ([seferID], [rotaID], [kalkisTarihi], [kalkisSaati], [seferUcreti], [otobusID]) VALUES (9, 11, N'2018-12-26', N'19:30', 25.0000, 15)
INSERT [dbo].[tblSefer] ([seferID], [rotaID], [kalkisTarihi], [kalkisSaati], [seferUcreti], [otobusID]) VALUES (10, 2, N'2018-12-27', N'23:40', 100.0000, 2)
INSERT [dbo].[tblSefer] ([seferID], [rotaID], [kalkisTarihi], [kalkisSaati], [seferUcreti], [otobusID]) VALUES (12, 7, N'2018-12-31', N'19:05', 110.0000, 18)
SET IDENTITY_INSERT [dbo].[tblSefer] OFF
SET IDENTITY_INSERT [dbo].[tblYolcu] ON 

INSERT [dbo].[tblYolcu] ([yolcuID], [TCKN], [adSoyad], [cinsiyet], [koltukNumarasi]) VALUES (2, N'1234666', N'Melda Yılmaz', 0, 6)
INSERT [dbo].[tblYolcu] ([yolcuID], [TCKN], [adSoyad], [cinsiyet], [koltukNumarasi]) VALUES (3, N'123456999', N'Emine Zirve', 0, 8)
INSERT [dbo].[tblYolcu] ([yolcuID], [TCKN], [adSoyad], [cinsiyet], [koltukNumarasi]) VALUES (4, N'23322555', N'Asil Kanamaz', 1, 23)
INSERT [dbo].[tblYolcu] ([yolcuID], [TCKN], [adSoyad], [cinsiyet], [koltukNumarasi]) VALUES (5, N'141433', N'Ahmet Diri', 1, 14)
INSERT [dbo].[tblYolcu] ([yolcuID], [TCKN], [adSoyad], [cinsiyet], [koltukNumarasi]) VALUES (6, N'212122', N'Atiye Barank', 0, 21)
INSERT [dbo].[tblYolcu] ([yolcuID], [TCKN], [adSoyad], [cinsiyet], [koltukNumarasi]) VALUES (7, N'112211', N'Hayriye Kocaman', 0, 1)
INSERT [dbo].[tblYolcu] ([yolcuID], [TCKN], [adSoyad], [cinsiyet], [koltukNumarasi]) VALUES (8, N'101011', N'Fahriye Demir', 0, 10)
INSERT [dbo].[tblYolcu] ([yolcuID], [TCKN], [adSoyad], [cinsiyet], [koltukNumarasi]) VALUES (10, N'101011', N'Ferdi Coçkun', 1, 10)
INSERT [dbo].[tblYolcu] ([yolcuID], [TCKN], [adSoyad], [cinsiyet], [koltukNumarasi]) VALUES (12, N'444455', N'Murat Çavuş', 1, 4)
INSERT [dbo].[tblYolcu] ([yolcuID], [TCKN], [adSoyad], [cinsiyet], [koltukNumarasi]) VALUES (14, N'11112212', N'Nazmiye Hasat', 0, 11)
INSERT [dbo].[tblYolcu] ([yolcuID], [TCKN], [adSoyad], [cinsiyet], [koltukNumarasi]) VALUES (15, N'131314', N'Alper Vera', 1, 13)
INSERT [dbo].[tblYolcu] ([yolcuID], [TCKN], [adSoyad], [cinsiyet], [koltukNumarasi]) VALUES (16, N'1111211212', N'Elif Seven', 0, 1)
INSERT [dbo].[tblYolcu] ([yolcuID], [TCKN], [adSoyad], [cinsiyet], [koltukNumarasi]) VALUES (17, N'6677676', N'Kadir Adalı', 1, 6)
INSERT [dbo].[tblYolcu] ([yolcuID], [TCKN], [adSoyad], [cinsiyet], [koltukNumarasi]) VALUES (18, N'12121312', N'Aliye Farah', 0, 12)
INSERT [dbo].[tblYolcu] ([yolcuID], [TCKN], [adSoyad], [cinsiyet], [koltukNumarasi]) VALUES (19, N'232324424', N'Emre Alaylı', 1, 23)
INSERT [dbo].[tblYolcu] ([yolcuID], [TCKN], [adSoyad], [cinsiyet], [koltukNumarasi]) VALUES (20, N'131314114', N'Fatma Çelik', 0, 13)
SET IDENTITY_INSERT [dbo].[tblYolcu] OFF
ALTER TABLE [dbo].[tblBilet]  WITH CHECK ADD  CONSTRAINT [FK_tblBilet_tblSefer] FOREIGN KEY([seferID])
REFERENCES [dbo].[tblSefer] ([seferID])
GO
ALTER TABLE [dbo].[tblBilet] CHECK CONSTRAINT [FK_tblBilet_tblSefer]
GO
ALTER TABLE [dbo].[tblBilet]  WITH CHECK ADD  CONSTRAINT [FK_tblBilet_tblYolcu] FOREIGN KEY([yolcuID])
REFERENCES [dbo].[tblYolcu] ([yolcuID])
GO
ALTER TABLE [dbo].[tblBilet] CHECK CONSTRAINT [FK_tblBilet_tblYolcu]
GO
ALTER TABLE [dbo].[tblRota]  WITH CHECK ADD  CONSTRAINT [FK_tblRota_tblRotaGenel] FOREIGN KEY([rotaGenelID])
REFERENCES [dbo].[tblRotaGenel] ([rotaGenelID])
GO
ALTER TABLE [dbo].[tblRota] CHECK CONSTRAINT [FK_tblRota_tblRotaGenel]
GO
ALTER TABLE [dbo].[tblSefer]  WITH CHECK ADD  CONSTRAINT [FK_tblSefer_tblOtobus] FOREIGN KEY([otobusID])
REFERENCES [dbo].[tblOtobus] ([otobusID])
GO
ALTER TABLE [dbo].[tblSefer] CHECK CONSTRAINT [FK_tblSefer_tblOtobus]
GO
ALTER TABLE [dbo].[tblSefer]  WITH CHECK ADD  CONSTRAINT [FK_tblSefer_tblRota] FOREIGN KEY([rotaID])
REFERENCES [dbo].[tblRota] ([rotaID])
GO
ALTER TABLE [dbo].[tblSefer] CHECK CONSTRAINT [FK_tblSefer_tblRota]
GO
USE [master]
GO
ALTER DATABASE [BusTicketSystemDB] SET  READ_WRITE 
GO
