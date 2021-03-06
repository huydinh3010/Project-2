USE [master]
GO
/****** Object:  Database [Phong_xet_nghiem]    Script Date: 21/5/2019 3:15:14 PM ******/
CREATE DATABASE [Phong_xet_nghiem]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Phong_xet_nghiem', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\Phong_xet_nghiem.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'Phong_xet_nghiem_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\Phong_xet_nghiem_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [Phong_xet_nghiem] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Phong_xet_nghiem].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Phong_xet_nghiem] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Phong_xet_nghiem] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Phong_xet_nghiem] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Phong_xet_nghiem] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Phong_xet_nghiem] SET ARITHABORT OFF 
GO
ALTER DATABASE [Phong_xet_nghiem] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Phong_xet_nghiem] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Phong_xet_nghiem] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Phong_xet_nghiem] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Phong_xet_nghiem] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Phong_xet_nghiem] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Phong_xet_nghiem] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Phong_xet_nghiem] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Phong_xet_nghiem] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Phong_xet_nghiem] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Phong_xet_nghiem] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Phong_xet_nghiem] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Phong_xet_nghiem] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Phong_xet_nghiem] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Phong_xet_nghiem] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Phong_xet_nghiem] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Phong_xet_nghiem] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Phong_xet_nghiem] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Phong_xet_nghiem] SET  MULTI_USER 
GO
ALTER DATABASE [Phong_xet_nghiem] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Phong_xet_nghiem] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Phong_xet_nghiem] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Phong_xet_nghiem] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [Phong_xet_nghiem] SET DELAYED_DURABILITY = DISABLED 
GO
USE [Phong_xet_nghiem]
GO
/****** Object:  Table [dbo].[KetQuaXetNghiem]    Script Date: 21/5/2019 3:15:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[KetQuaXetNghiem](
	[ID] [int] NULL,
	[Urea] [decimal](5, 2) NULL,
	[Creatinine] [decimal](5, 2) NULL,
	[CPK] [decimal](5, 2) NULL,
	[Calcium] [decimal](5, 2) NULL,
	[Phosphorous] [decimal](5, 2) NULL,
	[Amylase] [decimal](5, 2) NULL,
	[Lipase] [decimal](5, 2) NULL,
	[BilirubinToanPhan] [decimal](5, 2) NULL,
	[AST] [decimal](5, 2) NULL,
	[ALT] [decimal](5, 2) NULL,
	[AlkalinePhosphatase] [decimal](5, 2) NULL,
	[OngLithiumHeparine4ml] [bit] NOT NULL,
	[Glucose] [decimal](5, 2) NULL,
	[OngFlouride2ml] [bit] NOT NULL,
	[LoaiMauPhanTich] [nvarchar](100) NULL DEFAULT (N'Huyết tương')
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[XetNghiem]    Script Date: 21/5/2019 3:15:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[XetNghiem](
	[ID] [int] NOT NULL,
	[Tuan] [int] NOT NULL,
	[TenBenhNhan] [nvarchar](100) NOT NULL,
	[NamSinh] [int] NOT NULL,
	[GioiTinh] [nvarchar](5) NOT NULL,
	[NgayYeuCau] [date] NOT NULL,
	[NgayLayMau] [datetime] NOT NULL,
	[NguoiLayMau] [nvarchar](100) NOT NULL,
	[NgayNhanMau] [datetime] NOT NULL,
	[NguoiSaoThongTin] [nvarchar](100) NOT NULL,
	[NgaySaoThongTin] [date] NOT NULL,
	[NgayCoKetQua] [date] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  View [dbo].[SObenhNhan_Tuan]    Script Date: 21/5/2019 3:15:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[SObenhNhan_Tuan]
AS
SELECT        Tuan, COUNT(TenBenhNhan) AS Expr1
FROM            dbo.XetNghiem
GROUP BY Tuan

GO
INSERT [dbo].[KetQuaXetNghiem] ([ID], [Urea], [Creatinine], [CPK], [Calcium], [Phosphorous], [Amylase], [Lipase], [BilirubinToanPhan], [AST], [ALT], [AlkalinePhosphatase], [OngLithiumHeparine4ml], [Glucose], [OngFlouride2ml], [LoaiMauPhanTich]) VALUES (888, NULL, CAST(1.00 AS Decimal(5, 2)), CAST(1.00 AS Decimal(5, 2)), CAST(1.00 AS Decimal(5, 2)), CAST(1.00 AS Decimal(5, 2)), CAST(1.00 AS Decimal(5, 2)), CAST(1.00 AS Decimal(5, 2)), CAST(1.00 AS Decimal(5, 2)), CAST(1.00 AS Decimal(5, 2)), CAST(1.00 AS Decimal(5, 2)), CAST(1.00 AS Decimal(5, 2)), 0, CAST(1.00 AS Decimal(5, 2)), 0, N'Huyết tương')
INSERT [dbo].[KetQuaXetNghiem] ([ID], [Urea], [Creatinine], [CPK], [Calcium], [Phosphorous], [Amylase], [Lipase], [BilirubinToanPhan], [AST], [ALT], [AlkalinePhosphatase], [OngLithiumHeparine4ml], [Glucose], [OngFlouride2ml], [LoaiMauPhanTich]) VALUES (12, CAST(1.20 AS Decimal(5, 2)), CAST(2.30 AS Decimal(5, 2)), CAST(3.40 AS Decimal(5, 2)), CAST(4.50 AS Decimal(5, 2)), CAST(6.00 AS Decimal(5, 2)), CAST(1.20 AS Decimal(5, 2)), CAST(1.00 AS Decimal(5, 2)), NULL, NULL, NULL, NULL, 1, CAST(1.50 AS Decimal(5, 2)), 0, N'Huyết tương')
INSERT [dbo].[KetQuaXetNghiem] ([ID], [Urea], [Creatinine], [CPK], [Calcium], [Phosphorous], [Amylase], [Lipase], [BilirubinToanPhan], [AST], [ALT], [AlkalinePhosphatase], [OngLithiumHeparine4ml], [Glucose], [OngFlouride2ml], [LoaiMauPhanTich]) VALUES (11, CAST(1.00 AS Decimal(5, 2)), CAST(2.00 AS Decimal(5, 2)), CAST(1.00 AS Decimal(5, 2)), CAST(2.00 AS Decimal(5, 2)), CAST(3.00 AS Decimal(5, 2)), CAST(1.00 AS Decimal(5, 2)), CAST(5.00 AS Decimal(5, 2)), CAST(2.00 AS Decimal(5, 2)), CAST(2.00 AS Decimal(5, 2)), NULL, NULL, 0, CAST(2.00 AS Decimal(5, 2)), 0, N'Huyết tương')
INSERT [dbo].[KetQuaXetNghiem] ([ID], [Urea], [Creatinine], [CPK], [Calcium], [Phosphorous], [Amylase], [Lipase], [BilirubinToanPhan], [AST], [ALT], [AlkalinePhosphatase], [OngLithiumHeparine4ml], [Glucose], [OngFlouride2ml], [LoaiMauPhanTich]) VALUES (118, CAST(1.00 AS Decimal(5, 2)), CAST(1.00 AS Decimal(5, 2)), CAST(11.00 AS Decimal(5, 2)), NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(1.00 AS Decimal(5, 2)), 0, CAST(1.00 AS Decimal(5, 2)), 0, N'Huyết tương')
INSERT [dbo].[KetQuaXetNghiem] ([ID], [Urea], [Creatinine], [CPK], [Calcium], [Phosphorous], [Amylase], [Lipase], [BilirubinToanPhan], [AST], [ALT], [AlkalinePhosphatase], [OngLithiumHeparine4ml], [Glucose], [OngFlouride2ml], [LoaiMauPhanTich]) VALUES (523, CAST(1.00 AS Decimal(5, 2)), CAST(2.00 AS Decimal(5, 2)), CAST(3.00 AS Decimal(5, 2)), CAST(4.00 AS Decimal(5, 2)), CAST(5.00 AS Decimal(5, 2)), NULL, CAST(2.00 AS Decimal(5, 2)), CAST(2.00 AS Decimal(5, 2)), CAST(2.00 AS Decimal(5, 2)), CAST(2.00 AS Decimal(5, 2)), CAST(2.00 AS Decimal(5, 2)), 1, CAST(1.00 AS Decimal(5, 2)), 1, N'Huyết tương')
INSERT [dbo].[KetQuaXetNghiem] ([ID], [Urea], [Creatinine], [CPK], [Calcium], [Phosphorous], [Amylase], [Lipase], [BilirubinToanPhan], [AST], [ALT], [AlkalinePhosphatase], [OngLithiumHeparine4ml], [Glucose], [OngFlouride2ml], [LoaiMauPhanTich]) VALUES (5555, CAST(1.00 AS Decimal(5, 2)), CAST(2.00 AS Decimal(5, 2)), CAST(3.00 AS Decimal(5, 2)), CAST(4.00 AS Decimal(5, 2)), CAST(5.00 AS Decimal(5, 2)), NULL, CAST(2.00 AS Decimal(5, 2)), CAST(2.00 AS Decimal(5, 2)), CAST(2.00 AS Decimal(5, 2)), CAST(2.00 AS Decimal(5, 2)), CAST(2.00 AS Decimal(5, 2)), 1, CAST(1.00 AS Decimal(5, 2)), 1, N'Huyết tương')
INSERT [dbo].[XetNghiem] ([ID], [Tuan], [TenBenhNhan], [NamSinh], [GioiTinh], [NgayYeuCau], [NgayLayMau], [NguoiLayMau], [NgayNhanMau], [NguoiSaoThongTin], [NgaySaoThongTin], [NgayCoKetQua]) VALUES (11, 23, N'Nguyễn Văn A', 2000, N'Nam', CAST(N'2018-03-03' AS Date), CAST(N'2015-08-03 13:30:00.000' AS DateTime), N'Nguyễn Văn B', CAST(N'1998-10-30 01:30:00.000' AS DateTime), N'Nguyễn Văn C', CAST(N'2002-03-03' AS Date), CAST(N'2002-02-02' AS Date))
INSERT [dbo].[XetNghiem] ([ID], [Tuan], [TenBenhNhan], [NamSinh], [GioiTinh], [NgayYeuCau], [NgayLayMau], [NguoiLayMau], [NgayNhanMau], [NguoiSaoThongTin], [NgaySaoThongTin], [NgayCoKetQua]) VALUES (12, 23, N'Nguyễn Văn A', 1998, N'Nam', CAST(N'2002-01-01' AS Date), CAST(N'2000-03-02 12:30:00.000' AS DateTime), N'Nguyễn Văn B', CAST(N'2012-02-03 12:30:00.000' AS DateTime), N'Nguyễn Văn C', CAST(N'1999-01-03' AS Date), CAST(N'2002-02-02' AS Date))
INSERT [dbo].[XetNghiem] ([ID], [Tuan], [TenBenhNhan], [NamSinh], [GioiTinh], [NgayYeuCau], [NgayLayMau], [NguoiLayMau], [NgayNhanMau], [NguoiSaoThongTin], [NgaySaoThongTin], [NgayCoKetQua]) VALUES (118, 25, N'Nguyễn Văn', 1998, N'Nữ', CAST(N'1998-01-01' AS Date), CAST(N'2002-02-12 02:20:00.000' AS DateTime), N'Nguyễn X', CAST(N'1998-10-30 08:30:00.000' AS DateTime), N'Nguyễn A', CAST(N'2003-03-03' AS Date), CAST(N'2002-02-23' AS Date))
INSERT [dbo].[XetNghiem] ([ID], [Tuan], [TenBenhNhan], [NamSinh], [GioiTinh], [NgayYeuCau], [NgayLayMau], [NguoiLayMau], [NgayNhanMau], [NguoiSaoThongTin], [NgaySaoThongTin], [NgayCoKetQua]) VALUES (523, 2, N'Nguyen C', 2003, N'Nam', CAST(N'2003-03-03' AS Date), CAST(N'2009-02-01 02:30:00.000' AS DateTime), N'Nguyen B', CAST(N'2003-05-02 12:30:00.000' AS DateTime), N'Nguyen A', CAST(N'2003-03-03' AS Date), CAST(N'2003-06-03' AS Date))
INSERT [dbo].[XetNghiem] ([ID], [Tuan], [TenBenhNhan], [NamSinh], [GioiTinh], [NgayYeuCau], [NgayLayMau], [NguoiLayMau], [NgayNhanMau], [NguoiSaoThongTin], [NgaySaoThongTin], [NgayCoKetQua]) VALUES (888, 18, N'Hê Lô', 2008, N'Nam', CAST(N'2018-03-30' AS Date), CAST(N'2018-01-31 10:10:00.000' AS DateTime), N'Hê Lô', CAST(N'1998-01-20 03:10:00.000' AS DateTime), N'Hê Lô', CAST(N'2018-03-03' AS Date), CAST(N'2018-03-03' AS Date))
INSERT [dbo].[XetNghiem] ([ID], [Tuan], [TenBenhNhan], [NamSinh], [GioiTinh], [NgayYeuCau], [NgayLayMau], [NguoiLayMau], [NgayNhanMau], [NguoiSaoThongTin], [NgaySaoThongTin], [NgayCoKetQua]) VALUES (5555, 2, N'A', 2003, N'Nam', CAST(N'2003-03-03' AS Date), CAST(N'2009-02-01 02:30:00.000' AS DateTime), N'Nguyễn Văn B', CAST(N'2003-05-02 12:30:00.000' AS DateTime), N'Nguyễn Văn A', CAST(N'2003-03-03' AS Date), CAST(N'2003-06-03' AS Date))
ALTER TABLE [dbo].[KetQuaXetNghiem]  WITH CHECK ADD FOREIGN KEY([ID])
REFERENCES [dbo].[XetNghiem] ([ID])
GO
ALTER TABLE [dbo].[KetQuaXetNghiem]  WITH CHECK ADD CHECK  (([AlkalinePhosphatase]>(0)))
GO
ALTER TABLE [dbo].[KetQuaXetNghiem]  WITH CHECK ADD CHECK  (([Amylase]>(0)))
GO
ALTER TABLE [dbo].[KetQuaXetNghiem]  WITH CHECK ADD CHECK  (([BilirubinToanPhan]>(0)))
GO
ALTER TABLE [dbo].[KetQuaXetNghiem]  WITH CHECK ADD CHECK  (([Calcium]>(0)))
GO
ALTER TABLE [dbo].[KetQuaXetNghiem]  WITH CHECK ADD CHECK  (([Creatinine]>(0)))
GO
ALTER TABLE [dbo].[KetQuaXetNghiem]  WITH CHECK ADD CHECK  (([Glucose]>(0)))
GO
ALTER TABLE [dbo].[KetQuaXetNghiem]  WITH CHECK ADD CHECK  (([Lipase]>(0)))
GO
ALTER TABLE [dbo].[KetQuaXetNghiem]  WITH CHECK ADD CHECK  (([Phosphorous]>(0)))
GO
ALTER TABLE [dbo].[KetQuaXetNghiem]  WITH CHECK ADD CHECK  (([Urea]>(0)))
GO
ALTER TABLE [dbo].[KetQuaXetNghiem]  WITH CHECK ADD CHECK  (([ALT]>(0)))
GO
ALTER TABLE [dbo].[KetQuaXetNghiem]  WITH CHECK ADD CHECK  (([AST]>(0)))
GO
ALTER TABLE [dbo].[KetQuaXetNghiem]  WITH CHECK ADD CHECK  (([CPK]>(0)))
GO
ALTER TABLE [dbo].[XetNghiem]  WITH CHECK ADD CHECK  (([ID]>(0)))
GO
ALTER TABLE [dbo].[XetNghiem]  WITH CHECK ADD CHECK  (([NamSinh]>(1990) AND [NamSinh]<(2020)))
GO
ALTER TABLE [dbo].[XetNghiem]  WITH CHECK ADD CHECK  (([TUAN]>(0) AND [TUAN]<=(53)))
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "XetNghiem"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 136
               Right = 321
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 12
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'SObenhNhan_Tuan'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'SObenhNhan_Tuan'
GO
USE [master]
GO
ALTER DATABASE [Phong_xet_nghiem] SET  READ_WRITE 
GO
