USE [master]
GO
/****** Object:  Database [qldiem_PTCUDDD]    Script Date: 4/29/2023 1:51:38 PM ******/
CREATE DATABASE [qldiem_PTCUDDD]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'qldiem_PTCUDDD', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\qldiem_PTCUDDD.mdf' , SIZE = 3264KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'qldiem_PTCUDDD_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\qldiem_PTCUDDD_log.ldf' , SIZE = 816KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [qldiem_PTCUDDD] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [qldiem_PTCUDDD].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [qldiem_PTCUDDD] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [qldiem_PTCUDDD] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [qldiem_PTCUDDD] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [qldiem_PTCUDDD] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [qldiem_PTCUDDD] SET ARITHABORT OFF 
GO
ALTER DATABASE [qldiem_PTCUDDD] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [qldiem_PTCUDDD] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [qldiem_PTCUDDD] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [qldiem_PTCUDDD] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [qldiem_PTCUDDD] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [qldiem_PTCUDDD] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [qldiem_PTCUDDD] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [qldiem_PTCUDDD] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [qldiem_PTCUDDD] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [qldiem_PTCUDDD] SET  ENABLE_BROKER 
GO
ALTER DATABASE [qldiem_PTCUDDD] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [qldiem_PTCUDDD] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [qldiem_PTCUDDD] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [qldiem_PTCUDDD] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [qldiem_PTCUDDD] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [qldiem_PTCUDDD] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [qldiem_PTCUDDD] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [qldiem_PTCUDDD] SET RECOVERY FULL 
GO
ALTER DATABASE [qldiem_PTCUDDD] SET  MULTI_USER 
GO
ALTER DATABASE [qldiem_PTCUDDD] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [qldiem_PTCUDDD] SET DB_CHAINING OFF 
GO
ALTER DATABASE [qldiem_PTCUDDD] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [qldiem_PTCUDDD] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [qldiem_PTCUDDD] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'qldiem_PTCUDDD', N'ON'
GO
USE [qldiem_PTCUDDD]
GO
/****** Object:  Table [dbo].[ChuyenNganh]    Script Date: 4/29/2023 1:51:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ChuyenNganh](
	[MaCN] [varchar](10) NOT NULL,
	[TenCN] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_chuyennganh] PRIMARY KEY CLUSTERED 
(
	[MaCN] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[DangKi]    Script Date: 4/29/2023 1:51:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[DangKi](
	[MaLTC] [varchar](10) NOT NULL,
	[MaSV] [nvarchar](10) NOT NULL,
	[DiemCC] [float] NULL,
	[DiemGK] [float] NULL,
	[DiemCK] [float] NULL,
	[Huy] [bit] NULL,
 CONSTRAINT [PK_dangki] PRIMARY KEY CLUSTERED 
(
	[MaSV] ASC,
	[MaLTC] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Day]    Script Date: 4/29/2023 1:51:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Day](
	[MaGV] [nvarchar](10) NOT NULL,
	[MaLTC] [varchar](10) NOT NULL,
 CONSTRAINT [PK_day] PRIMARY KEY CLUSTERED 
(
	[MaLTC] ASC,
	[MaGV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[GiangVien]    Script Date: 4/29/2023 1:51:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GiangVien](
	[MaGV] [nvarchar](10) NOT NULL,
	[HoTen] [nvarchar](100) NOT NULL,
	[HocVi] [nvarchar](20) NULL,
	[HocHam] [nvarchar](20) NULL,
	[Phai] [bit] NOT NULL,
	[NgaySinh] [date] NULL,
	[DiaChi] [nvarchar](100) NULL,
	[ChuyenMon] [nvarchar](100) NULL,
	[TrangThaiNghi] [bit] NULL,
 CONSTRAINT [PK_giangvien] PRIMARY KEY CLUSTERED 
(
	[MaGV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[KeHoach]    Script Date: 4/29/2023 1:51:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[KeHoach](
	[MaCN] [varchar](10) NOT NULL,
	[MaMH] [varchar](10) NOT NULL,
	[HeSoGK] [float] NULL,
	[HeSoCK] [float] NULL,
 CONSTRAINT [PK_kehoach] PRIMARY KEY CLUSTERED 
(
	[MaCN] ASC,
	[MaMH] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Lop]    Script Date: 4/29/2023 1:51:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Lop](
	[MaLop] [varchar](10) NOT NULL,
	[TenLop] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_lop] PRIMARY KEY CLUSTERED 
(
	[MaLop] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[LopTinChi]    Script Date: 4/29/2023 1:51:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[LopTinChi](
	[MaLTC] [varchar](10) NOT NULL,
	[NamHoc] [varchar](10) NOT NULL,
	[HocKi] [varchar](3) NULL,
	[SLToiThieu] [int] NULL,
	[SLToiDa] [int] NULL,
	[NgayBD] [date] NULL,
	[NgayKT] [date] NULL,
	[MaMH] [varchar](10) NULL,
	[slconlai] [int] NULL,
	[TrangThai] [bit] NULL,
 CONSTRAINT [PK_loptinchi] PRIMARY KEY CLUSTERED 
(
	[MaLTC] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[MonHoc]    Script Date: 4/29/2023 1:51:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[MonHoc](
	[MaMH] [varchar](10) NOT NULL,
	[TenMH] [nvarchar](20) NOT NULL,
	[SoTietLT] [int] NOT NULL,
	[SoTietTH] [int] NOT NULL,
	[SoTinChi] [int] NOT NULL,
	[HeSoCC] [int] NULL,
	[HeSoGK] [int] NULL,
	[HeSoCK] [int] NULL,
	[MaCN] [varchar](10) NULL,
 CONSTRAINT [PK_monhoc] PRIMARY KEY CLUSTERED 
(
	[MaMH] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[PhanCong]    Script Date: 4/29/2023 1:51:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[PhanCong](
	[MaLTC] [varchar](10) NOT NULL,
	[MaGV] [nvarchar](10) NOT NULL,
	[DayLT] [bit] NULL,
	[DayTH] [bit] NULL,
 CONSTRAINT [PK_phancong] PRIMARY KEY CLUSTERED 
(
	[MaLTC] ASC,
	[MaGV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[SinhVien]    Script Date: 4/29/2023 1:51:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[SinhVien](
	[MaSV] [nvarchar](10) NOT NULL,
	[HoTen] [nvarchar](100) NOT NULL,
	[Phai] [bit] NOT NULL,
	[NgaySinh] [date] NULL,
	[DiaChi] [nvarchar](50) NULL,
	[KhoaHoc] [nvarchar](50) NULL,
	[TrangThaiNghi] [bit] NULL,
	[MaCN] [varchar](10) NULL,
	[MaLop] [varchar](10) NULL,
	[HinhAnh] [nvarchar](100) NULL,
 CONSTRAINT [PK_sinhvien] PRIMARY KEY CLUSTERED 
(
	[MaSV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[SinhVien_ThongBao]    Script Date: 4/29/2023 1:51:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SinhVien_ThongBao](
	[MaSV] [nvarchar](10) NOT NULL,
	[MaTB] [int] NOT NULL,
	[DaDoc] [bit] NOT NULL DEFAULT ((0)),
PRIMARY KEY CLUSTERED 
(
	[MaSV] ASC,
	[MaTB] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TaiKhoan]    Script Date: 4/29/2023 1:51:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TaiKhoan](
	[MaTk] [nvarchar](10) NOT NULL,
	[TenTaiKhoan] [varchar](50) NOT NULL,
	[MatKhau] [varchar](50) NOT NULL,
	[MaVaitro] [varchar](10) NOT NULL,
 CONSTRAINT [PK_TaiKhoanGV] PRIMARY KEY CLUSTERED 
(
	[MaTk] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ThongBao]    Script Date: 4/29/2023 1:51:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ThongBao](
	[MaTB] [int] IDENTITY(1,1) NOT NULL,
	[TieuDe] [nvarchar](100) NOT NULL,
	[NoiDung] [nvarchar](max) NOT NULL,
	[NgayGui] [date] NOT NULL,
	[MaGV] [nvarchar](10) NOT NULL,
 CONSTRAINT [PK_ThongBao] PRIMARY KEY CLUSTERED 
(
	[MaTB] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[VaiTro]    Script Date: 4/29/2023 1:51:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[VaiTro](
	[MaVaiTro] [varchar](10) NOT NULL,
	[TenVaiTro] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_VaiTro] PRIMARY KEY CLUSTERED 
(
	[MaVaiTro] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  UserDefinedFunction [dbo].[GETSTUDENTINFO]    Script Date: 4/29/2023 1:51:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[GETSTUDENTINFO] (@studentId VARCHAR(20))
RETURNS TABLE
AS
RETURN
(
    SELECT MH.MaMH, MH.TenMH, MH.SoTinChi, MH.HeSoCC, MH.HeSoGK, MH.HeSoCK,
	DK.DiemCC, DK.DiemGK, DK.DiemCK, LTC.HocKi, LTC.NamHoc
	 FROM MonHoc MH, LopTinChi LTC, DangKi DK, SinhVien SV
	WHERE 
	MH.MaMH = LTC.MaMH AND
	LTC.MaLTC = DK.MaLTC AND
	SV.MaSV = DK.MaSV AND
	SV.MaSV = @studentId
)
GO
INSERT [dbo].[ChuyenNganh] ([MaCN], [TenCN]) VALUES (N'CN0', N'Chưa có chuyên ngành')
INSERT [dbo].[ChuyenNganh] ([MaCN], [TenCN]) VALUES (N'CN10', N'Công nghệ phần mềm')
INSERT [dbo].[ChuyenNganh] ([MaCN], [TenCN]) VALUES (N'CN11', N'công nghệ thông tin')
INSERT [dbo].[ChuyenNganh] ([MaCN], [TenCN]) VALUES (N'CN5       ', N'Hệ thống thông tin')
INSERT [dbo].[ChuyenNganh] ([MaCN], [TenCN]) VALUES (N'CN6       ', N'Kỹ thuật máy tính')
INSERT [dbo].[ChuyenNganh] ([MaCN], [TenCN]) VALUES (N'CN7       ', N'An toàn thông tin')
INSERT [dbo].[ChuyenNganh] ([MaCN], [TenCN]) VALUES (N'CN8       ', N'Hệ thống thông tin')
INSERT [dbo].[ChuyenNganh] ([MaCN], [TenCN]) VALUES (N'CN9       ', N'Kỹ thuật mạng máy tính')
INSERT [dbo].[DangKi] ([MaLTC], [MaSV], [DiemCC], [DiemGK], [DiemCK], [Huy]) VALUES (N'LTC1', N'SV1', 8, 5, 5, 0)
INSERT [dbo].[DangKi] ([MaLTC], [MaSV], [DiemCC], [DiemGK], [DiemCK], [Huy]) VALUES (N'LTC11', N'SV1', 10, 0, 0, 1)
INSERT [dbo].[DangKi] ([MaLTC], [MaSV], [DiemCC], [DiemGK], [DiemCK], [Huy]) VALUES (N'LTC2', N'sv1', 5, 5, 8, 0)
INSERT [dbo].[DangKi] ([MaLTC], [MaSV], [DiemCC], [DiemGK], [DiemCK], [Huy]) VALUES (N'LTC3', N'SV1', 9, 9, 9, 0)
INSERT [dbo].[DangKi] ([MaLTC], [MaSV], [DiemCC], [DiemGK], [DiemCK], [Huy]) VALUES (N'LTC4', N'SV1', 1, 1, 1, 0)
INSERT [dbo].[DangKi] ([MaLTC], [MaSV], [DiemCC], [DiemGK], [DiemCK], [Huy]) VALUES (N'LTC5', N'sv1', 5, 10, 5, 0)
INSERT [dbo].[DangKi] ([MaLTC], [MaSV], [DiemCC], [DiemGK], [DiemCK], [Huy]) VALUES (N'LTC6', N'sv1', 8, 5, 5, 1)
INSERT [dbo].[DangKi] ([MaLTC], [MaSV], [DiemCC], [DiemGK], [DiemCK], [Huy]) VALUES (N'LTC7', N'SV1', 8, 10, 9, 0)
INSERT [dbo].[DangKi] ([MaLTC], [MaSV], [DiemCC], [DiemGK], [DiemCK], [Huy]) VALUES (N'LTC8', N'SV1', 3, 8, 8, 1)
INSERT [dbo].[DangKi] ([MaLTC], [MaSV], [DiemCC], [DiemGK], [DiemCK], [Huy]) VALUES (N'LTC1', N'SV10', 10, 2, 9, 0)
INSERT [dbo].[DangKi] ([MaLTC], [MaSV], [DiemCC], [DiemGK], [DiemCK], [Huy]) VALUES (N'LTC10', N'SV10', 8, 8, 8, 1)
INSERT [dbo].[DangKi] ([MaLTC], [MaSV], [DiemCC], [DiemGK], [DiemCK], [Huy]) VALUES (N'LTC11', N'SV10', 8, 7, 9, 0)
INSERT [dbo].[DangKi] ([MaLTC], [MaSV], [DiemCC], [DiemGK], [DiemCK], [Huy]) VALUES (N'LTC2', N'SV10', 5, 6, 7, 0)
INSERT [dbo].[DangKi] ([MaLTC], [MaSV], [DiemCC], [DiemGK], [DiemCK], [Huy]) VALUES (N'LTC3', N'SV10', 8, 8, 8, 0)
INSERT [dbo].[DangKi] ([MaLTC], [MaSV], [DiemCC], [DiemGK], [DiemCK], [Huy]) VALUES (N'LTC4', N'SV10', 7, 4, 2, 0)
INSERT [dbo].[DangKi] ([MaLTC], [MaSV], [DiemCC], [DiemGK], [DiemCK], [Huy]) VALUES (N'LTC5', N'SV10', 8, 7, 6, 0)
INSERT [dbo].[DangKi] ([MaLTC], [MaSV], [DiemCC], [DiemGK], [DiemCK], [Huy]) VALUES (N'LTC6', N'SV10', 0, 0, 0, 1)
INSERT [dbo].[DangKi] ([MaLTC], [MaSV], [DiemCC], [DiemGK], [DiemCK], [Huy]) VALUES (N'LTC8', N'SV10', 1, 1, 1, 1)
INSERT [dbo].[DangKi] ([MaLTC], [MaSV], [DiemCC], [DiemGK], [DiemCK], [Huy]) VALUES (N'LTC9', N'SV10', 0, 0, 0, 0)
INSERT [dbo].[DangKi] ([MaLTC], [MaSV], [DiemCC], [DiemGK], [DiemCK], [Huy]) VALUES (N'LTC4', N'SV17', 2, 2, 2, 0)
INSERT [dbo].[DangKi] ([MaLTC], [MaSV], [DiemCC], [DiemGK], [DiemCK], [Huy]) VALUES (N'LTC4', N'SV18', 1, 1, 1, 0)
INSERT [dbo].[DangKi] ([MaLTC], [MaSV], [DiemCC], [DiemGK], [DiemCK], [Huy]) VALUES (N'LTC4', N'SV19', 5, 5, 5, 0)
INSERT [dbo].[DangKi] ([MaLTC], [MaSV], [DiemCC], [DiemGK], [DiemCK], [Huy]) VALUES (N'LTC1', N'sv2', 10, 10, 10, 0)
INSERT [dbo].[DangKi] ([MaLTC], [MaSV], [DiemCC], [DiemGK], [DiemCK], [Huy]) VALUES (N'LTC4', N'SV2', 5, 5, 5, 0)
INSERT [dbo].[DangKi] ([MaLTC], [MaSV], [DiemCC], [DiemGK], [DiemCK], [Huy]) VALUES (N'LTC7', N'SV2', 8, 7, 7, 0)
INSERT [dbo].[DangKi] ([MaLTC], [MaSV], [DiemCC], [DiemGK], [DiemCK], [Huy]) VALUES (N'LTC8', N'SV2', 3, 8, 8, 0)
INSERT [dbo].[DangKi] ([MaLTC], [MaSV], [DiemCC], [DiemGK], [DiemCK], [Huy]) VALUES (N'LTC4', N'SV20', 2, 2, 2, 0)
INSERT [dbo].[DangKi] ([MaLTC], [MaSV], [DiemCC], [DiemGK], [DiemCK], [Huy]) VALUES (N'LTC1', N'sv3', 4, 7.5, 3.25, 0)
INSERT [dbo].[DangKi] ([MaLTC], [MaSV], [DiemCC], [DiemGK], [DiemCK], [Huy]) VALUES (N'LTC10', N'SV3', 0, 0, 0, 1)
INSERT [dbo].[DangKi] ([MaLTC], [MaSV], [DiemCC], [DiemGK], [DiemCK], [Huy]) VALUES (N'LTC11', N'SV3', 0, 0, 0, 1)
INSERT [dbo].[DangKi] ([MaLTC], [MaSV], [DiemCC], [DiemGK], [DiemCK], [Huy]) VALUES (N'LTC2', N'SV3', 100, 0, 0, 0)
INSERT [dbo].[DangKi] ([MaLTC], [MaSV], [DiemCC], [DiemGK], [DiemCK], [Huy]) VALUES (N'LTC3', N'SV3', 8, 7.5, 7.25, 0)
INSERT [dbo].[DangKi] ([MaLTC], [MaSV], [DiemCC], [DiemGK], [DiemCK], [Huy]) VALUES (N'LTC4', N'SV3', 1, 1, 1, 1)
INSERT [dbo].[DangKi] ([MaLTC], [MaSV], [DiemCC], [DiemGK], [DiemCK], [Huy]) VALUES (N'LTC7', N'SV3', 7.5, 8, 7.5, 0)
INSERT [dbo].[DangKi] ([MaLTC], [MaSV], [DiemCC], [DiemGK], [DiemCK], [Huy]) VALUES (N'LTC8', N'SV3', 3, 3, 3, 0)
INSERT [dbo].[DangKi] ([MaLTC], [MaSV], [DiemCC], [DiemGK], [DiemCK], [Huy]) VALUES (N'LTC1', N'sv4', 6, 7, 9, 0)
INSERT [dbo].[DangKi] ([MaLTC], [MaSV], [DiemCC], [DiemGK], [DiemCK], [Huy]) VALUES (N'LTC7', N'SV4', 0, 0, 0, 0)
INSERT [dbo].[DangKi] ([MaLTC], [MaSV], [DiemCC], [DiemGK], [DiemCK], [Huy]) VALUES (N'LTC8', N'SV4', 3, 4, 4, 0)
INSERT [dbo].[DangKi] ([MaLTC], [MaSV], [DiemCC], [DiemGK], [DiemCK], [Huy]) VALUES (N'LTC7', N'SV5', 8, 8, 8, 0)
INSERT [dbo].[DangKi] ([MaLTC], [MaSV], [DiemCC], [DiemGK], [DiemCK], [Huy]) VALUES (N'LTC8', N'SV5', 8, 8, 8, 0)
INSERT [dbo].[DangKi] ([MaLTC], [MaSV], [DiemCC], [DiemGK], [DiemCK], [Huy]) VALUES (N'LTC1', N'SV6', 5, 5.5, 5, 0)
INSERT [dbo].[DangKi] ([MaLTC], [MaSV], [DiemCC], [DiemGK], [DiemCK], [Huy]) VALUES (N'LTC7', N'SV6', 4.5, 5, 4, 0)
INSERT [dbo].[DangKi] ([MaLTC], [MaSV], [DiemCC], [DiemGK], [DiemCK], [Huy]) VALUES (N'LTC8', N'SV6', 9, 9, 9, 0)
INSERT [dbo].[DangKi] ([MaLTC], [MaSV], [DiemCC], [DiemGK], [DiemCK], [Huy]) VALUES (N'LTC1', N'SV7', 7, 7, 7, 0)
INSERT [dbo].[DangKi] ([MaLTC], [MaSV], [DiemCC], [DiemGK], [DiemCK], [Huy]) VALUES (N'LTC7', N'SV7', 8, 3, 8, 0)
INSERT [dbo].[DangKi] ([MaLTC], [MaSV], [DiemCC], [DiemGK], [DiemCK], [Huy]) VALUES (N'LTC8', N'SV7', 3, 1, 1, 0)
INSERT [dbo].[DangKi] ([MaLTC], [MaSV], [DiemCC], [DiemGK], [DiemCK], [Huy]) VALUES (N'LTC1', N'SV8', 6, 6, 6, 0)
INSERT [dbo].[DangKi] ([MaLTC], [MaSV], [DiemCC], [DiemGK], [DiemCK], [Huy]) VALUES (N'LTC7', N'SV8', 4, 4, 4, 0)
INSERT [dbo].[DangKi] ([MaLTC], [MaSV], [DiemCC], [DiemGK], [DiemCK], [Huy]) VALUES (N'LTC1', N'SV9', 7, 5, 8, 0)
INSERT [dbo].[DangKi] ([MaLTC], [MaSV], [DiemCC], [DiemGK], [DiemCK], [Huy]) VALUES (N'LTC7', N'SV9', 3, 8, 8, 0)
INSERT [dbo].[DangKi] ([MaLTC], [MaSV], [DiemCC], [DiemGK], [DiemCK], [Huy]) VALUES (N'LTC8', N'SV9', 3, 8, 8, 0)
INSERT [dbo].[Day] ([MaGV], [MaLTC]) VALUES (N'GV1', N'LTC1')
INSERT [dbo].[Day] ([MaGV], [MaLTC]) VALUES (N'GV1', N'LTC10')
INSERT [dbo].[Day] ([MaGV], [MaLTC]) VALUES (N'GV2', N'LTC11')
INSERT [dbo].[Day] ([MaGV], [MaLTC]) VALUES (N'GV3', N'LTC13')
INSERT [dbo].[GiangVien] ([MaGV], [HoTen], [HocVi], [HocHam], [Phai], [NgaySinh], [DiaChi], [ChuyenMon], [TrangThaiNghi]) VALUES (N'GV1       ', N'Lan Anhh', N'Thạc sĩ', N'Phó Giáo Sư', 0, CAST(N'1950-01-09' AS Date), N'Bà Rịa', N'Công Nghệ', 1)
INSERT [dbo].[GiangVien] ([MaGV], [HoTen], [HocVi], [HocHam], [Phai], [NgaySinh], [DiaChi], [ChuyenMon], [TrangThaiNghi]) VALUES (N'GV2       ', N'Trung Hiếu', N'Thạc sĩ', N'Phó Giáo Sư', 0, CAST(N'1960-08-01' AS Date), N'Bà Rịa', N'Công Nghệ', 1)
INSERT [dbo].[GiangVien] ([MaGV], [HoTen], [HocVi], [HocHam], [Phai], [NgaySinh], [DiaChi], [ChuyenMon], [TrangThaiNghi]) VALUES (N'GV3       ', N'Dương Lan Phương', N'Thạc sĩ', N'Giáo Sư', 1, CAST(N'1970-01-13' AS Date), N'Bà Rịa', N'Công Nghệ', 0)
INSERT [dbo].[GiangVien] ([MaGV], [HoTen], [HocVi], [HocHam], [Phai], [NgaySinh], [DiaChi], [ChuyenMon], [TrangThaiNghi]) VALUES (N'GV4', N'Tú Tài', N'Cử nhân', N'Giáo Sư', 1, CAST(N'1965-02-01' AS Date), N'Bà Rịa', N'Công Nghệ', 1)
INSERT [dbo].[KeHoach] ([MaCN], [MaMH], [HeSoGK], [HeSoCK]) VALUES (N'CN10', N'MH1       ', 20, 70)
INSERT [dbo].[KeHoach] ([MaCN], [MaMH], [HeSoGK], [HeSoCK]) VALUES (N'CN10', N'MH2       ', 10, 80)
INSERT [dbo].[KeHoach] ([MaCN], [MaMH], [HeSoGK], [HeSoCK]) VALUES (N'CN10', N'MH3       ', 30, 60)
INSERT [dbo].[KeHoach] ([MaCN], [MaMH], [HeSoGK], [HeSoCK]) VALUES (N'CN5       ', N'MH3       ', 30, 60)
INSERT [dbo].[KeHoach] ([MaCN], [MaMH], [HeSoGK], [HeSoCK]) VALUES (N'CN6', N'MH1', 30, 60)
INSERT [dbo].[KeHoach] ([MaCN], [MaMH], [HeSoGK], [HeSoCK]) VALUES (N'CN6', N'MH2', 20, 70)
INSERT [dbo].[KeHoach] ([MaCN], [MaMH], [HeSoGK], [HeSoCK]) VALUES (N'CN6', N'MH3', 30, 60)
INSERT [dbo].[KeHoach] ([MaCN], [MaMH], [HeSoGK], [HeSoCK]) VALUES (N'CN6', N'MH4', 30, 60)
INSERT [dbo].[KeHoach] ([MaCN], [MaMH], [HeSoGK], [HeSoCK]) VALUES (N'CN6', N'MH5', 30, 60)
INSERT [dbo].[KeHoach] ([MaCN], [MaMH], [HeSoGK], [HeSoCK]) VALUES (N'CN6', N'MH6', 20, 70)
INSERT [dbo].[KeHoach] ([MaCN], [MaMH], [HeSoGK], [HeSoCK]) VALUES (N'CN7       ', N'MH3       ', 30, 60)
INSERT [dbo].[KeHoach] ([MaCN], [MaMH], [HeSoGK], [HeSoCK]) VALUES (N'CN8       ', N'MH1       ', 30, 60)
INSERT [dbo].[KeHoach] ([MaCN], [MaMH], [HeSoGK], [HeSoCK]) VALUES (N'CN8       ', N'MH2       ', 20, 70)
INSERT [dbo].[KeHoach] ([MaCN], [MaMH], [HeSoGK], [HeSoCK]) VALUES (N'CN8       ', N'MH3       ', 30, 60)
INSERT [dbo].[KeHoach] ([MaCN], [MaMH], [HeSoGK], [HeSoCK]) VALUES (N'CN8       ', N'MH4       ', 0, 0)
INSERT [dbo].[KeHoach] ([MaCN], [MaMH], [HeSoGK], [HeSoCK]) VALUES (N'CN8       ', N'MH5       ', 0, 0)
INSERT [dbo].[KeHoach] ([MaCN], [MaMH], [HeSoGK], [HeSoCK]) VALUES (N'CN8       ', N'MH6', 0, 0)
INSERT [dbo].[KeHoach] ([MaCN], [MaMH], [HeSoGK], [HeSoCK]) VALUES (N'CN8       ', N'MH7', 0, 0)
INSERT [dbo].[KeHoach] ([MaCN], [MaMH], [HeSoGK], [HeSoCK]) VALUES (N'CN9       ', N'MH3       ', 30, 60)
INSERT [dbo].[KeHoach] ([MaCN], [MaMH], [HeSoGK], [HeSoCK]) VALUES (N'CN9       ', N'MH4       ', 0, 0)
INSERT [dbo].[KeHoach] ([MaCN], [MaMH], [HeSoGK], [HeSoCK]) VALUES (N'CN9       ', N'MH5       ', 0, 0)
INSERT [dbo].[Lop] ([MaLop], [TenLop]) VALUES (N'LO2', N'd18cqcn02')
INSERT [dbo].[Lop] ([MaLop], [TenLop]) VALUES (N'LO3', N'd18cqcn03')
INSERT [dbo].[Lop] ([MaLop], [TenLop]) VALUES (N'LO1', N'd19cqcn01')
INSERT [dbo].[Lop] ([MaLop], [TenLop]) VALUES (N'LO4', N'n19dccn01')
INSERT [dbo].[LopTinChi] ([MaLTC], [NamHoc], [HocKi], [SLToiThieu], [SLToiDa], [NgayBD], [NgayKT], [MaMH], [slconlai], [TrangThai]) VALUES (N'LTC1', N'2022-2023', N'HK1', 60, 50, CAST(N'2023-04-05' AS Date), CAST(N'2022-05-20' AS Date), N'MH3       ', 20, 1)
INSERT [dbo].[LopTinChi] ([MaLTC], [NamHoc], [HocKi], [SLToiThieu], [SLToiDa], [NgayBD], [NgayKT], [MaMH], [slconlai], [TrangThai]) VALUES (N'LTC10', N'2019-2020', N'HK1', 35, 50, CAST(N'2019-05-25' AS Date), CAST(N'2019-09-28' AS Date), N'MH7', 20, 1)
INSERT [dbo].[LopTinChi] ([MaLTC], [NamHoc], [HocKi], [SLToiThieu], [SLToiDa], [NgayBD], [NgayKT], [MaMH], [slconlai], [TrangThai]) VALUES (N'LTC11', N'2022-2023', N'HK1', 1, 2, CAST(N'2022-05-20' AS Date), CAST(N'2022-06-20' AS Date), N'MH2       ', 20, 1)
INSERT [dbo].[LopTinChi] ([MaLTC], [NamHoc], [HocKi], [SLToiThieu], [SLToiDa], [NgayBD], [NgayKT], [MaMH], [slconlai], [TrangThai]) VALUES (N'LTC12', N'2022-2023', N'HK1', 30, 50, CAST(N'2022-06-01' AS Date), CAST(N'2022-09-01' AS Date), N'MH7', 0, 0)
INSERT [dbo].[LopTinChi] ([MaLTC], [NamHoc], [HocKi], [SLToiThieu], [SLToiDa], [NgayBD], [NgayKT], [MaMH], [slconlai], [TrangThai]) VALUES (N'LTC13', N'2022-2023', N'HK1', 30, 50, CAST(N'2022-06-01' AS Date), CAST(N'2022-09-01' AS Date), N'MH7', 3, 1)
INSERT [dbo].[LopTinChi] ([MaLTC], [NamHoc], [HocKi], [SLToiThieu], [SLToiDa], [NgayBD], [NgayKT], [MaMH], [slconlai], [TrangThai]) VALUES (N'LTC2', N'2018-2019', N'HK2', 30, 45, CAST(N'2018-01-05' AS Date), CAST(N'2018-05-25' AS Date), N'MH1       ', 1, 0)
INSERT [dbo].[LopTinChi] ([MaLTC], [NamHoc], [HocKi], [SLToiThieu], [SLToiDa], [NgayBD], [NgayKT], [MaMH], [slconlai], [TrangThai]) VALUES (N'LTC3', N'2022-2023', N'HK1', 30, 45, CAST(N'2022-05-05' AS Date), CAST(N'2022-05-25' AS Date), N'MH2       ', 2, 0)
INSERT [dbo].[LopTinChi] ([MaLTC], [NamHoc], [HocKi], [SLToiThieu], [SLToiDa], [NgayBD], [NgayKT], [MaMH], [slconlai], [TrangThai]) VALUES (N'LTC4', N'2022-2023', N'HK1', 30, 45, CAST(N'2022-05-05' AS Date), CAST(N'2022-05-25' AS Date), N'MH3       ', 1, 0)
INSERT [dbo].[LopTinChi] ([MaLTC], [NamHoc], [HocKi], [SLToiThieu], [SLToiDa], [NgayBD], [NgayKT], [MaMH], [slconlai], [TrangThai]) VALUES (N'LTC5', N'2022-2023', N'HK1', 30, 45, CAST(N'2022-05-05' AS Date), CAST(N'2022-05-25' AS Date), N'MH4       ', 2, 0)
INSERT [dbo].[LopTinChi] ([MaLTC], [NamHoc], [HocKi], [SLToiThieu], [SLToiDa], [NgayBD], [NgayKT], [MaMH], [slconlai], [TrangThai]) VALUES (N'LTC6', N'2022-2023', N'HK2', 30, 45, CAST(N'2022-05-05' AS Date), CAST(N'2022-05-25' AS Date), N'MH5', 1, 0)
INSERT [dbo].[LopTinChi] ([MaLTC], [NamHoc], [HocKi], [SLToiThieu], [SLToiDa], [NgayBD], [NgayKT], [MaMH], [slconlai], [TrangThai]) VALUES (N'LTC7', N'2021-2022', N'HK1', 30, 50, CAST(N'2021-05-01' AS Date), CAST(N'2021-07-31' AS Date), N'MH1       ', 20, 1)
INSERT [dbo].[LopTinChi] ([MaLTC], [NamHoc], [HocKi], [SLToiThieu], [SLToiDa], [NgayBD], [NgayKT], [MaMH], [slconlai], [TrangThai]) VALUES (N'LTC8', N'2022-2023', N'HK1', 30, 45, CAST(N'2022-05-05' AS Date), CAST(N'2022-05-20' AS Date), N'MH3       ', 20, 1)
INSERT [dbo].[LopTinChi] ([MaLTC], [NamHoc], [HocKi], [SLToiThieu], [SLToiDa], [NgayBD], [NgayKT], [MaMH], [slconlai], [TrangThai]) VALUES (N'LTC9', N'2020-2021', N'HK1', 30, 45, CAST(N'2020-05-18' AS Date), CAST(N'2020-12-25' AS Date), N'MH6', 20, 1)
INSERT [dbo].[MonHoc] ([MaMH], [TenMH], [SoTietLT], [SoTietTH], [SoTinChi], [HeSoCC], [HeSoGK], [HeSoCK], [MaCN]) VALUES (N'MH1       ', N'Giải Tích 1', 45, 0, 3, 10, 30, 60, N'CN5       ')
INSERT [dbo].[MonHoc] ([MaMH], [TenMH], [SoTietLT], [SoTietTH], [SoTinChi], [HeSoCC], [HeSoGK], [HeSoCK], [MaCN]) VALUES (N'MH2       ', N'Vật lý ', 30, 0, 2, 10, 30, 60, N'CN5       ')
INSERT [dbo].[MonHoc] ([MaMH], [TenMH], [SoTietLT], [SoTietTH], [SoTinChi], [HeSoCC], [HeSoGK], [HeSoCK], [MaCN]) VALUES (N'MH3       ', N'Cơ sở dữ liệu', 15, 15, 2, 10, 30, 60, N'CN10')
INSERT [dbo].[MonHoc] ([MaMH], [TenMH], [SoTietLT], [SoTietTH], [SoTinChi], [HeSoCC], [HeSoGK], [HeSoCK], [MaCN]) VALUES (N'MH4       ', N'Toán rời rạc', 20, 15, 3, 10, 30, 60, N'CN5       ')
INSERT [dbo].[MonHoc] ([MaMH], [TenMH], [SoTietLT], [SoTietTH], [SoTinChi], [HeSoCC], [HeSoGK], [HeSoCK], [MaCN]) VALUES (N'MH5       ', N'Thực tập cơ sở', 30, 15, 3, 10, 30, 60, NULL)
INSERT [dbo].[MonHoc] ([MaMH], [TenMH], [SoTietLT], [SoTietTH], [SoTinChi], [HeSoCC], [HeSoGK], [HeSoCK], [MaCN]) VALUES (N'MH6', N'Giải Tích 2', 16, 0, 3, 10, 30, 60, NULL)
INSERT [dbo].[MonHoc] ([MaMH], [TenMH], [SoTietLT], [SoTietTH], [SoTinChi], [HeSoCC], [HeSoGK], [HeSoCK], [MaCN]) VALUES (N'MH7', N'Nhập môn phần mềm', 30, 0, 4, 10, 30, 60, NULL)
INSERT [dbo].[MonHoc] ([MaMH], [TenMH], [SoTietLT], [SoTietTH], [SoTinChi], [HeSoCC], [HeSoGK], [HeSoCK], [MaCN]) VALUES (N'MH8', N'Điện tử', 20, 12, 3, 10, 30, 60, NULL)
INSERT [dbo].[MonHoc] ([MaMH], [TenMH], [SoTietLT], [SoTietTH], [SoTinChi], [HeSoCC], [HeSoGK], [HeSoCK], [MaCN]) VALUES (N'MH9', N'Kinh tế', 12, 12, 12, 12, 32, 62, NULL)
INSERT [dbo].[PhanCong] ([MaLTC], [MaGV], [DayLT], [DayTH]) VALUES (N'LTC1', N'GV1', 1, 1)
INSERT [dbo].[PhanCong] ([MaLTC], [MaGV], [DayLT], [DayTH]) VALUES (N'LTC1', N'GV2', 1, 1)
INSERT [dbo].[PhanCong] ([MaLTC], [MaGV], [DayLT], [DayTH]) VALUES (N'LTC11', N'GV2', 1, 1)
INSERT [dbo].[PhanCong] ([MaLTC], [MaGV], [DayLT], [DayTH]) VALUES (N'LTC2', N'GV4', 1, 1)
INSERT [dbo].[PhanCong] ([MaLTC], [MaGV], [DayLT], [DayTH]) VALUES (N'LTC3', N'GV3', 1, 1)
INSERT [dbo].[PhanCong] ([MaLTC], [MaGV], [DayLT], [DayTH]) VALUES (N'LTC4', N'GV1', 1, 1)
INSERT [dbo].[PhanCong] ([MaLTC], [MaGV], [DayLT], [DayTH]) VALUES (N'LTC5', N'GV2', 0, 1)
INSERT [dbo].[PhanCong] ([MaLTC], [MaGV], [DayLT], [DayTH]) VALUES (N'LTC5', N'GV3', 1, 0)
INSERT [dbo].[PhanCong] ([MaLTC], [MaGV], [DayLT], [DayTH]) VALUES (N'LTC5', N'GV4', 0, 1)
INSERT [dbo].[PhanCong] ([MaLTC], [MaGV], [DayLT], [DayTH]) VALUES (N'LTC8', N'GV1', 1, 1)
INSERT [dbo].[SinhVien] ([MaSV], [HoTen], [Phai], [NgaySinh], [DiaChi], [KhoaHoc], [TrangThaiNghi], [MaCN], [MaLop], [HinhAnh]) VALUES (N'SV1', N'Nguyễn Văn Danh', 1, CAST(N'2001-09-03' AS Date), N'Nghĩa Thành', N'2017-2021', 0, N'CN6       ', N'LO3', N'file:///android_asset/sv1.jpg')
INSERT [dbo].[SinhVien] ([MaSV], [HoTen], [Phai], [NgaySinh], [DiaChi], [KhoaHoc], [TrangThaiNghi], [MaCN], [MaLop], [HinhAnh]) VALUES (N'SV10', N'Lê Long Bảo', 0, CAST(N'2001-09-03' AS Date), N'Nghĩa Thành', N'2017-2021', 0, N'CN6       ', N'LO1', N'C:\Users\Admin\Dropbox\My PC (DESKTOP-BDENHI9)\Documents\HinhAnhSV\2.png')
INSERT [dbo].[SinhVien] ([MaSV], [HoTen], [Phai], [NgaySinh], [DiaChi], [KhoaHoc], [TrangThaiNghi], [MaCN], [MaLop], [HinhAnh]) VALUES (N'SV11', N'Nguyễn Thùy Giang', 1, CAST(N'2005-11-26' AS Date), N'Phổ Yên', N'2017-2021', 0, N'CN6       ', N'LO1', N'C:\Users\Admin\Dropbox\My PC (DESKTOP-BDENHI9)\Documents\HinhAnhSV\3.png')
INSERT [dbo].[SinhVien] ([MaSV], [HoTen], [Phai], [NgaySinh], [DiaChi], [KhoaHoc], [TrangThaiNghi], [MaCN], [MaLop], [HinhAnh]) VALUES (N'SV12', N'Nguyễn Chí Tài', 1, CAST(N'2001-09-03' AS Date), N'Nghĩa Thành', N'2017-2021', 0, N'CN6       ', N'LO1', N'C:\Users\Admin\Dropbox\My PC (DESKTOP-BDENHI9)\Documents\HinhAnhSV\10.png')
INSERT [dbo].[SinhVien] ([MaSV], [HoTen], [Phai], [NgaySinh], [DiaChi], [KhoaHoc], [TrangThaiNghi], [MaCN], [MaLop], [HinhAnh]) VALUES (N'SV13', N'Nguyễn Chí Tài', 1, CAST(N'2001-09-03' AS Date), N'Nghĩa Thành', N'2017-2021', 0, N'CN6       ', N'LO2', N'C:\Users\Admin\Dropbox\My PC (DESKTOP-BDENHI9)\Documents\HinhAnhSV\10.png')
INSERT [dbo].[SinhVien] ([MaSV], [HoTen], [Phai], [NgaySinh], [DiaChi], [KhoaHoc], [TrangThaiNghi], [MaCN], [MaLop], [HinhAnh]) VALUES (N'SV14', N'Nguyễn Chí Tài', 1, CAST(N'2001-09-03' AS Date), N'Nghĩa Thành', N'2017-2021', 0, N'CN6       ', N'LO1', N'C:\Users\Admin\Dropbox\My PC (DESKTOP-BDENHI9)\Documents\HinhAnhSV\10.png')
INSERT [dbo].[SinhVien] ([MaSV], [HoTen], [Phai], [NgaySinh], [DiaChi], [KhoaHoc], [TrangThaiNghi], [MaCN], [MaLop], [HinhAnh]) VALUES (N'SV15', N'Nguyễn Chí Tài', 1, CAST(N'2001-09-03' AS Date), N'Nghĩa Thành', N'2017-2021', 0, N'CN6       ', N'LO1', N'C:\Users\Admin\Dropbox\My PC (DESKTOP-BDENHI9)\Documents\HinhAnhSV\10.png')
INSERT [dbo].[SinhVien] ([MaSV], [HoTen], [Phai], [NgaySinh], [DiaChi], [KhoaHoc], [TrangThaiNghi], [MaCN], [MaLop], [HinhAnh]) VALUES (N'SV16', N'Nguyễn Chí Tài', 1, CAST(N'2001-09-03' AS Date), N'Nghĩa Thành', N'2017-2021', 0, N'CN6       ', N'LO1', N'C:\Users\Admin\Dropbox\My PC (DESKTOP-BDENHI9)\Documents\HinhAnhSV\10.png')
INSERT [dbo].[SinhVien] ([MaSV], [HoTen], [Phai], [NgaySinh], [DiaChi], [KhoaHoc], [TrangThaiNghi], [MaCN], [MaLop], [HinhAnh]) VALUES (N'SV17', N'Nguyễn Chí Tài', 1, CAST(N'2001-09-03' AS Date), N'Nghĩa Thành', N'2017-2021', 0, N'CN6       ', N'LO1', N'C:\Users\Admin\Dropbox\My PC (DESKTOP-BDENHI9)\Documents\HinhAnhSV\10.png')
INSERT [dbo].[SinhVien] ([MaSV], [HoTen], [Phai], [NgaySinh], [DiaChi], [KhoaHoc], [TrangThaiNghi], [MaCN], [MaLop], [HinhAnh]) VALUES (N'SV18', N'Nguyễn Chí Tài', 1, CAST(N'2001-09-03' AS Date), N'Nghĩa Thành', N'2017-2021', 0, N'CN6       ', N'LO1', N'C:\Users\Admin\Dropbox\My PC (DESKTOP-BDENHI9)\Documents\HinhAnhSV\10.png')
INSERT [dbo].[SinhVien] ([MaSV], [HoTen], [Phai], [NgaySinh], [DiaChi], [KhoaHoc], [TrangThaiNghi], [MaCN], [MaLop], [HinhAnh]) VALUES (N'SV19', N'Nguyễn Chí Tài', 1, CAST(N'2001-09-03' AS Date), N'Nghĩa Thành', N'2017-2021', 0, N'CN6       ', N'LO1', N'C:\Users\Admin\Dropbox\My PC (DESKTOP-BDENHI9)\Documents\HinhAnhSV\10.png')
INSERT [dbo].[SinhVien] ([MaSV], [HoTen], [Phai], [NgaySinh], [DiaChi], [KhoaHoc], [TrangThaiNghi], [MaCN], [MaLop], [HinhAnh]) VALUES (N'SV2       ', N'Nguyễn Thanh Tú', 1, CAST(N'2001-04-20' AS Date), N'Suối Nghệ', N'2017-2021', 1, N'CN10', N'LO1', N'C:\Users\Admin\Dropbox\My PC (DESKTOP-BDENHI9)\Documents\HinhAnhSV\3.png')
INSERT [dbo].[SinhVien] ([MaSV], [HoTen], [Phai], [NgaySinh], [DiaChi], [KhoaHoc], [TrangThaiNghi], [MaCN], [MaLop], [HinhAnh]) VALUES (N'SV20', N'Nguyễn Chí Tài', 1, CAST(N'2001-09-03' AS Date), N'Nghĩa Thành', N'2017-2021', 0, N'CN6       ', N'LO1', N'C:\Users\Admin\Dropbox\My PC (DESKTOP-BDENHI9)\Documents\HinhAnhSV\10.png')
INSERT [dbo].[SinhVien] ([MaSV], [HoTen], [Phai], [NgaySinh], [DiaChi], [KhoaHoc], [TrangThaiNghi], [MaCN], [MaLop], [HinhAnh]) VALUES (N'SV3', N'Đỗ Thị Đào', 1, CAST(N'2017-04-13' AS Date), N'Nha Trang', N'2020-2024', 0, N'CN10', N'LO2', N'C:\Users\Admin\Dropbox\My PC (DESKTOP-BDENHI9)\Documents\HinhAnhSV\4.png')
INSERT [dbo].[SinhVien] ([MaSV], [HoTen], [Phai], [NgaySinh], [DiaChi], [KhoaHoc], [TrangThaiNghi], [MaCN], [MaLop], [HinhAnh]) VALUES (N'SV4', N'Nguyễn Ngọc Ánh', 1, CAST(N'2019-04-18' AS Date), N'Đà Nẵng', N'2020-2024', 0, N'CN10', N'LO3', N'C:\Users\Admin\Dropbox\My PC (DESKTOP-BDENHI9)\Documents\HinhAnhSV\5.png')
INSERT [dbo].[SinhVien] ([MaSV], [HoTen], [Phai], [NgaySinh], [DiaChi], [KhoaHoc], [TrangThaiNghi], [MaCN], [MaLop], [HinhAnh]) VALUES (N'SV5', N'Đỗ Lao Động', 0, CAST(N'2015-05-04' AS Date), N'Đà Nẵng', N'2020-2024', 0, N'CN10', N'LO1', N'C:\Users\Admin\Dropbox\My PC (DESKTOP-BDENHI9)\Documents\HinhAnhSV\6.png')
INSERT [dbo].[SinhVien] ([MaSV], [HoTen], [Phai], [NgaySinh], [DiaChi], [KhoaHoc], [TrangThaiNghi], [MaCN], [MaLop], [HinhAnh]) VALUES (N'SV6', N'Lê Thị Huệ', 1, CAST(N'2015-05-04' AS Date), N'Châu Đức', N'2020-2024', 0, N'CN10', N'LO1', N'C:\Users\Admin\Dropbox\My PC (DESKTOP-BDENHI9)\Documents\HinhAnhSV\7.png')
INSERT [dbo].[SinhVien] ([MaSV], [HoTen], [Phai], [NgaySinh], [DiaChi], [KhoaHoc], [TrangThaiNghi], [MaCN], [MaLop], [HinhAnh]) VALUES (N'SV7', N'Đoàn An Khánh', 0, CAST(N'2015-05-04' AS Date), N'Châu Đức', N'2020-2024', 0, N'CN10', N'LO1', N'C:\Users\Admin\Dropbox\My PC (DESKTOP-BDENHI9)\Documents\HinhAnhSV\8.png')
INSERT [dbo].[SinhVien] ([MaSV], [HoTen], [Phai], [NgaySinh], [DiaChi], [KhoaHoc], [TrangThaiNghi], [MaCN], [MaLop], [HinhAnh]) VALUES (N'SV8', N'Trần Thị Thư', 1, CAST(N'2000-06-16' AS Date), N'Thừa Thiên Huế', N'2017-2021', 0, N'CN6       ', N'LO1', N'C:\Users\Admin\Dropbox\My PC (DESKTOP-BDENHI9)\Documents\HinhAnhSV\9.png')
INSERT [dbo].[SinhVien] ([MaSV], [HoTen], [Phai], [NgaySinh], [DiaChi], [KhoaHoc], [TrangThaiNghi], [MaCN], [MaLop], [HinhAnh]) VALUES (N'SV9', N'Nguyễn Thị Thảo Nhi', 1, CAST(N'2001-09-03' AS Date), N'Nghĩa Thành', N'2017-2021', 0, N'CN6       ', N'LO1', N'C:\Users\Admin\Dropbox\My PC (DESKTOP-BDENHI9)\Documents\HinhAnhSV\10.png')
INSERT [dbo].[SinhVien_ThongBao] ([MaSV], [MaTB], [DaDoc]) VALUES (N'SV1', 1, 1)
INSERT [dbo].[SinhVien_ThongBao] ([MaSV], [MaTB], [DaDoc]) VALUES (N'SV1', 4, 1)
INSERT [dbo].[TaiKhoan] ([MaTk], [TenTaiKhoan], [MatKhau], [MaVaitro]) VALUES (N'GV1       ', N'gv1', N'123', N'VT2')
INSERT [dbo].[TaiKhoan] ([MaTk], [TenTaiKhoan], [MatKhau], [MaVaitro]) VALUES (N'GV2       ', N'GIANGVIEN2', N'CE0BFD15059B68D67688884D7A3D3E8C', N'VT2')
INSERT [dbo].[TaiKhoan] ([MaTk], [TenTaiKhoan], [MatKhau], [MaVaitro]) VALUES (N'GV3       ', N'gv3', N'123', N'VT1')
INSERT [dbo].[TaiKhoan] ([MaTk], [TenTaiKhoan], [MatKhau], [MaVaitro]) VALUES (N'GV4', N'gv4', N'CE0BFD15059B68D67688884D7A3D3E8C', N'VT1')
INSERT [dbo].[TaiKhoan] ([MaTk], [TenTaiKhoan], [MatKhau], [MaVaitro]) VALUES (N'SV1', N'sv1', N'123', N'VT3')
INSERT [dbo].[TaiKhoan] ([MaTk], [TenTaiKhoan], [MatKhau], [MaVaitro]) VALUES (N'SV10', N'SINHVIEN10', N'CE0BFD15059B68D67688884D7A3D3E8C', N'VT3')
INSERT [dbo].[TaiKhoan] ([MaTk], [TenTaiKhoan], [MatKhau], [MaVaitro]) VALUES (N'SV2       ', N'SV2', N'123', N'VT3')
INSERT [dbo].[TaiKhoan] ([MaTk], [TenTaiKhoan], [MatKhau], [MaVaitro]) VALUES (N'SV3', N'SV3', N'123', N'VT3')
SET IDENTITY_INSERT [dbo].[ThongBao] ON 

INSERT [dbo].[ThongBao] ([MaTB], [TieuDe], [NoiDung], [NgayGui], [MaGV]) VALUES (1, N'Hello', N'Đây là thông báo đầu tiên nha', CAST(N'2023-04-05' AS Date), N'GV1')
INSERT [dbo].[ThongBao] ([MaTB], [TieuDe], [NoiDung], [NgayGui], [MaGV]) VALUES (4, N'Hi', N'Đây là thông báo thứ 2', CAST(N'2023-04-05' AS Date), N'GV1')
SET IDENTITY_INSERT [dbo].[ThongBao] OFF
INSERT [dbo].[VaiTro] ([MaVaiTro], [TenVaiTro]) VALUES (N'VT1', N'QUANLY')
INSERT [dbo].[VaiTro] ([MaVaiTro], [TenVaiTro]) VALUES (N'VT2', N'GIANGVIEN')
INSERT [dbo].[VaiTro] ([MaVaiTro], [TenVaiTro]) VALUES (N'VT3', N'SINHVIEN')
SET ANSI_PADDING ON

GO
/****** Object:  Index [UN_TENLOP]    Script Date: 4/29/2023 1:51:38 PM ******/
ALTER TABLE [dbo].[Lop] ADD  CONSTRAINT [UN_TENLOP] UNIQUE NONCLUSTERED 
(
	[TenLop] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [UN_TENMH]    Script Date: 4/29/2023 1:51:38 PM ******/
ALTER TABLE [dbo].[MonHoc] ADD  CONSTRAINT [UN_TENMH] UNIQUE NONCLUSTERED 
(
	[TenMH] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_TaiKhoan]    Script Date: 4/29/2023 1:51:38 PM ******/
ALTER TABLE [dbo].[TaiKhoan] ADD  CONSTRAINT [IX_TaiKhoan] UNIQUE NONCLUSTERED 
(
	[TenTaiKhoan] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[DangKi]  WITH CHECK ADD  CONSTRAINT [FK_dangki_loptinchi] FOREIGN KEY([MaLTC])
REFERENCES [dbo].[LopTinChi] ([MaLTC])
GO
ALTER TABLE [dbo].[DangKi] CHECK CONSTRAINT [FK_dangki_loptinchi]
GO
ALTER TABLE [dbo].[DangKi]  WITH CHECK ADD  CONSTRAINT [FK_dangki_sinhvien] FOREIGN KEY([MaSV])
REFERENCES [dbo].[SinhVien] ([MaSV])
GO
ALTER TABLE [dbo].[DangKi] CHECK CONSTRAINT [FK_dangki_sinhvien]
GO
ALTER TABLE [dbo].[Day]  WITH CHECK ADD  CONSTRAINT [FK_day_giangvien] FOREIGN KEY([MaGV])
REFERENCES [dbo].[GiangVien] ([MaGV])
GO
ALTER TABLE [dbo].[Day] CHECK CONSTRAINT [FK_day_giangvien]
GO
ALTER TABLE [dbo].[Day]  WITH CHECK ADD  CONSTRAINT [FK_Day_LopTinChi] FOREIGN KEY([MaLTC])
REFERENCES [dbo].[LopTinChi] ([MaLTC])
GO
ALTER TABLE [dbo].[Day] CHECK CONSTRAINT [FK_Day_LopTinChi]
GO
ALTER TABLE [dbo].[KeHoach]  WITH CHECK ADD  CONSTRAINT [FK_kehoach_chuyennganh] FOREIGN KEY([MaCN])
REFERENCES [dbo].[ChuyenNganh] ([MaCN])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[KeHoach] CHECK CONSTRAINT [FK_kehoach_chuyennganh]
GO
ALTER TABLE [dbo].[KeHoach]  WITH CHECK ADD  CONSTRAINT [FK_kehoach_monhoc] FOREIGN KEY([MaMH])
REFERENCES [dbo].[MonHoc] ([MaMH])
GO
ALTER TABLE [dbo].[KeHoach] CHECK CONSTRAINT [FK_kehoach_monhoc]
GO
ALTER TABLE [dbo].[LopTinChi]  WITH CHECK ADD  CONSTRAINT [FK_loptinchi_monhoc] FOREIGN KEY([MaMH])
REFERENCES [dbo].[MonHoc] ([MaMH])
GO
ALTER TABLE [dbo].[LopTinChi] CHECK CONSTRAINT [FK_loptinchi_monhoc]
GO
ALTER TABLE [dbo].[MonHoc]  WITH CHECK ADD  CONSTRAINT [FK_MonHoc_ChuyenNganh] FOREIGN KEY([MaCN])
REFERENCES [dbo].[ChuyenNganh] ([MaCN])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[MonHoc] CHECK CONSTRAINT [FK_MonHoc_ChuyenNganh]
GO
ALTER TABLE [dbo].[PhanCong]  WITH CHECK ADD  CONSTRAINT [FK_phancong_giangvien] FOREIGN KEY([MaGV])
REFERENCES [dbo].[GiangVien] ([MaGV])
GO
ALTER TABLE [dbo].[PhanCong] CHECK CONSTRAINT [FK_phancong_giangvien]
GO
ALTER TABLE [dbo].[PhanCong]  WITH CHECK ADD  CONSTRAINT [FK_phancong_loptinchi] FOREIGN KEY([MaLTC])
REFERENCES [dbo].[LopTinChi] ([MaLTC])
GO
ALTER TABLE [dbo].[PhanCong] CHECK CONSTRAINT [FK_phancong_loptinchi]
GO
ALTER TABLE [dbo].[SinhVien]  WITH CHECK ADD  CONSTRAINT [FK_sinhvien_chuyennganh] FOREIGN KEY([MaCN])
REFERENCES [dbo].[ChuyenNganh] ([MaCN])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[SinhVien] CHECK CONSTRAINT [FK_sinhvien_chuyennganh]
GO
ALTER TABLE [dbo].[SinhVien]  WITH CHECK ADD  CONSTRAINT [FK_sinhvien_lop] FOREIGN KEY([MaLop])
REFERENCES [dbo].[Lop] ([MaLop])
GO
ALTER TABLE [dbo].[SinhVien] CHECK CONSTRAINT [FK_sinhvien_lop]
GO
ALTER TABLE [dbo].[SinhVien_ThongBao]  WITH CHECK ADD FOREIGN KEY([MaSV])
REFERENCES [dbo].[SinhVien] ([MaSV])
GO
ALTER TABLE [dbo].[SinhVien_ThongBao]  WITH CHECK ADD  CONSTRAINT [FK__SinhVien_T__MaTB__30C33EC3] FOREIGN KEY([MaTB])
REFERENCES [dbo].[ThongBao] ([MaTB])
GO
ALTER TABLE [dbo].[SinhVien_ThongBao] CHECK CONSTRAINT [FK__SinhVien_T__MaTB__30C33EC3]
GO
ALTER TABLE [dbo].[TaiKhoan]  WITH NOCHECK ADD  CONSTRAINT [FK_TaiKhoanGV_GiangVien] FOREIGN KEY([MaTk])
REFERENCES [dbo].[GiangVien] ([MaGV])
GO
ALTER TABLE [dbo].[TaiKhoan] NOCHECK CONSTRAINT [FK_TaiKhoanGV_GiangVien]
GO
ALTER TABLE [dbo].[TaiKhoan]  WITH NOCHECK ADD  CONSTRAINT [FK_TaiKhoanGV_SinhVien] FOREIGN KEY([MaTk])
REFERENCES [dbo].[SinhVien] ([MaSV])
GO
ALTER TABLE [dbo].[TaiKhoan] NOCHECK CONSTRAINT [FK_TaiKhoanGV_SinhVien]
GO
ALTER TABLE [dbo].[TaiKhoan]  WITH CHECK ADD  CONSTRAINT [FK_TaiKhoanGV_VaiTro] FOREIGN KEY([MaVaitro])
REFERENCES [dbo].[VaiTro] ([MaVaiTro])
GO
ALTER TABLE [dbo].[TaiKhoan] CHECK CONSTRAINT [FK_TaiKhoanGV_VaiTro]
GO
ALTER TABLE [dbo].[ThongBao]  WITH CHECK ADD  CONSTRAINT [FK_ThongBao_GiangVien] FOREIGN KEY([MaGV])
REFERENCES [dbo].[GiangVien] ([MaGV])
GO
ALTER TABLE [dbo].[ThongBao] CHECK CONSTRAINT [FK_ThongBao_GiangVien]
GO
ALTER TABLE [dbo].[KeHoach]  WITH CHECK ADD  CONSTRAINT [CK_KeHoach] CHECK  (([hesogk]>=(0) AND [hesogk]<=(90)))
GO
ALTER TABLE [dbo].[KeHoach] CHECK CONSTRAINT [CK_KeHoach]
GO
ALTER TABLE [dbo].[KeHoach]  WITH CHECK ADD  CONSTRAINT [CK_KeHoach_1] CHECK  (([hesock]>=(0) AND [hesock]<=(90)))
GO
ALTER TABLE [dbo].[KeHoach] CHECK CONSTRAINT [CK_KeHoach_1]
GO
ALTER TABLE [dbo].[MonHoc]  WITH CHECK ADD  CONSTRAINT [CK_MonHoc] CHECK  (([sotietth]>=(0)))
GO
ALTER TABLE [dbo].[MonHoc] CHECK CONSTRAINT [CK_MonHoc]
GO
ALTER TABLE [dbo].[MonHoc]  WITH CHECK ADD  CONSTRAINT [CK_MonHoc_1] CHECK  (([sotinchi]>(0)))
GO
ALTER TABLE [dbo].[MonHoc] CHECK CONSTRAINT [CK_MonHoc_1]
GO
ALTER TABLE [dbo].[MonHoc]  WITH CHECK ADD  CONSTRAINT [CK_MonHoc_2] CHECK  (([sotietlt]>(0)))
GO
ALTER TABLE [dbo].[MonHoc] CHECK CONSTRAINT [CK_MonHoc_2]
GO
/****** Object:  StoredProcedure [dbo].[A]    Script Date: 4/29/2023 1:51:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[A]
@MACN NCHAR(10)
AS
select tenmh from monhoc where monhoc.mamh not in (select mamh from kehoach where kehoach.macn=@MACN) 



GO
/****** Object:  StoredProcedure [dbo].[Backupdb]    Script Date: 4/29/2023 1:51:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[Backupdb]
@PATH nvarchar(100),@TENDATA nvarchar(30)
AS
BACKUP DATABASE [qldiem] TO  DISK = @PATH WITH NOFORMAT, NOINIT,  NAME = @TENDATA, SKIP, NOREWIND, NOUNLOAD,  STATS = 10

GO
/****** Object:  StoredProcedure [dbo].[DifferentialBackup]    Script Date: 4/29/2023 1:51:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[DifferentialBackup]
@PATH nvarchar(50),@TENDATA nvarchar(30)
AS
BACKUP DATABASE qldiem TO  DISK = @PATH WITH  DIFFERENTIAL , NOFORMAT, NOINIT,  NAME = @TENDATA, SKIP, NOREWIND, NOUNLOAD,  STATS = 10

GO
/****** Object:  StoredProcedure [dbo].[DS_GV_DAYMH]    Script Date: 4/29/2023 1:51:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[DS_GV_DAYMH]
@MAMH VARCHAR(10)
AS
select giangvien.magv,hoten from giangvien inner join DAY on giangvien.magv=day.magv 
where mamh=@mamh



GO
/****** Object:  StoredProcedure [dbo].[DS_MH_CHUACHON]    Script Date: 4/29/2023 1:51:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[DS_MH_CHUACHON]
@MACN NCHAR(10)

AS
select tenmh from monhoc, chuyennganh
where monhoc.macn is null
and chuyennganh.MaCN=@MACN


GO
/****** Object:  StoredProcedure [dbo].[DS_MH_CHUACHON_GV]    Script Date: 4/29/2023 1:51:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[DS_MH_CHUACHON_GV]
@MAGV NVARCHAR(10)
AS
select tenmh from monhoc where monhoc.mamh not in (select mamh from day where day.magv=@MAGV)



GO
/****** Object:  StoredProcedure [dbo].[DS_MH_THEOHOCKY]    Script Date: 4/29/2023 1:51:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[DS_MH_THEOHOCKY]
@MASV VARCHAR(10),
@NAM VARCHAR(10),
@HOCKI VARCHAR(10)
AS
BEGIN

select mamh,tenmh,sotinchi, HeSoCC,HeSoGK,HeSoCK into #B from monhoc


select distinct MonHoc.mamh into #C from MonHoc 
left join LopTinChi on LopTinChi.mamh = MonHoc.mamh 
left join DangKi on DangKi.MaLTC =  LopTinChi.MaLTC
left join SinhVien on SinhVien.MaSV = DangKi.MaSV 
where SinhVien.masv=@MASV

-- lop tin chi

select mamh,namhoc,hocki,diemcc,diemgk,diemck into #A from (select maltc,mamh,namhoc,hocki from loptinchi ) f1
inner join (select * from dangki where masv = @MASV and huy='0') f2
on f1.maltc= f2.maltc

select #A.mamh,tenmh,sotinchi,HeSoCC,HeSoGK,HeSoCK,diemcc,diemgk,diemck,ketqua=(CAST(diemcc*HeSoCC +diemgk*HeSoGK + diemck*HeSoCK AS FLOAT)/100) from #A
inner join #B
on #A.mamh = #B.mamh
inner join #C
on #B.mamh = #C.mamh
where namhoc=@NAM and hocki=@HOCKI

END

GO
/****** Object:  StoredProcedure [dbo].[DS_MHCHON]    Script Date: 4/29/2023 1:51:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[DS_MHCHON]
@MACN NVARCHAR(10)
AS
select tenmh from monhoc , ChuyenNganh where monhoc.MaCN =ChuyenNganh.MaCN and monhoc.MaCN =  @MACN 

GO
/****** Object:  StoredProcedure [dbo].[DS_MHCHON_GV]    Script Date: 4/29/2023 1:51:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[DS_MHCHON_GV]
@MAGV NVARCHAR(10)
AS
select tenmh from monhoc where monhoc.mamh in (select mamh from day where day.magv=@MAGV) 



GO
/****** Object:  StoredProcedure [dbo].[FullBackup]    Script Date: 4/29/2023 1:51:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[FullBackup]
AS
backup database qldiem to disk ='E:\BackUpQLDSV\qldsv.bak';

GO
/****** Object:  StoredProcedure [dbo].[GV_THEO_MH]    Script Date: 4/29/2023 1:51:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[GV_THEO_MH]
@MAMH NCHAR(10)
AS
SELECT GV= F1.magv + hoten FROM
(SELECT magv,hoten FROM giangvien) F1 
INNER JOIN
(SELECT * FROM DAY WHERE DAY.mamh=@MAMH) F2 ON F1.magv = F2.magv



GO
/****** Object:  StoredProcedure [dbo].[LOAD_TEXT_SINHVIEN]    Script Date: 4/29/2023 1:51:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[LOAD_TEXT_SINHVIEN]
@MASV VARCHAR(10)
AS
SELECT SINHVIEN.masv,hoten,phai,ngaysinh,diachi,khoahoc,LOP.tenlop,tencn,trangthainghi,hinhanh FROM chuyennganh
INNER JOIN sinhvien ON chuyennganh.macn = sinhvien.macn
INNER JOIN lop ON LOP.malop = sinhvien.malop
--left JOIN doantotnghiep ON doantotnghiep.masv = sinhvien.masv
WHERE sinhvien.masv = @MASV


GO
/****** Object:  StoredProcedure [dbo].[MonHocTheoCn]    Script Date: 4/29/2023 1:51:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROC [dbo].[MonHocTheoCn]
@TenCn NVARCHAR(50)
AS
SELECT tenmh FROM monhoc
INNER JOIN kehoach ON monhoc.mamh = kehoach.mamh
INNER JOIN chuyennganh ON chuyennganh.macn = kehoach.macn
WHERE chuyennganh.tencn = @TenCn




GO
/****** Object:  StoredProcedure [dbo].[NamhocTheoMon]    Script Date: 4/29/2023 1:51:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROC [dbo].[NamhocTheoMon]
@TenMh NVARCHAR(50)
AS
SELECT namhoc FROM loptinchi
JOIN monhoc ON loptinchi.mamh = monhoc.mamh
WHERE MONHOC.tenmh = @TenMh

EXEC NamhocTheoMon 'giai tich'
	




GO
/****** Object:  StoredProcedure [dbo].[RestoreDB]    Script Date: 4/29/2023 1:51:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[RestoreDB]
AS
restore database qldiem from disk ='E:\BackUpQLDSV\qldsv.bak';

GO
/****** Object:  StoredProcedure [dbo].[SP_BACK_UP_DIFFERENTIAL]    Script Date: 4/29/2023 1:51:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[SP_BACK_UP_DIFFERENTIAL]
@PATH nvarchar(50),@TENDATA nvarchar(30)
AS
BACKUP DATABASE qldiem TO  DISK = @PATH WITH  DIFFERENTIAL , NOFORMAT, NOINIT,  NAME = @TENDATA, SKIP, NOREWIND, NOUNLOAD,  STATS = 10

GO
/****** Object:  StoredProcedure [dbo].[SP_GETLOGININFORMATION]    Script Date: 4/29/2023 1:51:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[SP_GETLOGININFORMATION]
@TENLOGIN NVARCHAR( 100)
AS
DECLARE @UID INT
DECLARE @MAGV NVARCHAR(100)
SELECT @UID= uid , @MAGV= NAME 
FROM sys.sysusers 
  WHERE sid = SUSER_SID(@TENLOGIN)

SELECT MAGV=@MAGV,
       --HOTEN = (SELECT HoTen FROM [dbo].[GiangVien] WHERE MAGV=@MAGV ), 
      TENNHOM=NAME
  FROM sys.sysusers
    WHERE UID = (SELECT groupuid FROM sys.sysmembers WHERE memberuid=@uid)

GO
/****** Object:  StoredProcedure [dbo].[SP_TAOLOGIN]    Script Date: 4/29/2023 1:51:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[SP_TAOLOGIN]
  @LGNAME VARCHAR(50),
  @PASS VARCHAR(50),
  @USERNAME VARCHAR(50),
  @ROLE VARCHAR(50)
AS
BEGIN 
  DECLARE @RET INT
  EXEC @RET= SP_ADDLOGIN @LGNAME, @PASS,'qldiem'
	IF (@RET = 1)  -- LOGIN NAME BI TRUNG
		RETURN 1
  EXEC @RET= SP_GRANTDBACCESS @LGNAME, @USERNAME
	IF (@RET = 1)  -- USERNAME BI TRUNG
	BEGIN
		EXEC SP_DROPLOGIN @LGNAME
		RETURN 2
	END

  EXEC sp_addrolemember @ROLE, @USERNAME
  EXEC sp_addsrvrolemember @LGNAME, 'SecurityAdmin' 
	RETURN 0  -- THANH CONG
END 




GO
/****** Object:  StoredProcedure [dbo].[TIM_NAM_THEOSV]    Script Date: 4/29/2023 1:51:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[TIM_NAM_THEOSV]
@MASV VARCHAR(10)
AS
	SELECT distinct namhoc FROM loptinchi
	INNER JOIN dangki ON loptinchi.maltc=dangki.maltc
	WHERE dangki.masv = @MASV




GO
/****** Object:  StoredProcedure [dbo].[usp_DeleteLogin]    Script Date: 4/29/2023 1:51:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[usp_DeleteLogin]
@MANV NCHAR(10)
AS
BEGIN
	DECLARE @LGNAME VARCHAR(50);
	DECLARE @USERNAME VARCHAR(50);
	SET @LGNAME = CAST((SELECT SUSER_SNAME(sid) FROM sys.sysusers WHERE name = CAST(@MANV AS sysname)) AS sysname);
	SET @USERNAME = CAST(@MANV AS VARCHAR(50));

	IF EXISTS(SELECT SUSER_SNAME(sid) FROM sys.sysusers WHERE name = CAST(@MANV AS sysname))
	BEGIN
		EXEC SP_DROPUSER @USERNAME;
		EXEC SP_DROPLOGIN  @LGNAME;
	END
END




GO
/****** Object:  StoredProcedure [dbo].[usp_DSLTC_Nam]    Script Date: 4/29/2023 1:51:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[usp_DSLTC_Nam]
@Nam NVARCHAR(10)
AS	

	SELECT MALTC, SL = COUNT(*) INTO #A FROM DangKi WHERE DangKi.Huy='0'
	GROUP BY DangKi.MaLTC

	SELECT LopTinChi.MaLTC, TenMH,HocKi,SLUONGCON=SLToiDa-(CASE WHEN SL IS NULL THEN 0 ELSE SL  END ) ,SLToiDa,NgayBD,NgayKT FROM LopTinChi
	LEFT JOIN #A  ON #A.MaLTC = LopTinChi.MaLTC
	LEFT JOIN MonHoc ON LopTinChi.MaMH = MonHoc.MaMH
	WHERE LopTinChi.NamHoc = @Nam
	order by cast(substring(LopTinChi.MaLTC,4,10) as int)

GO
/****** Object:  StoredProcedure [dbo].[usp_DSSV_LTC]    Script Date: 4/29/2023 1:51:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[usp_DSSV_LTC]
@MALTC NVARCHAR(10)
AS
	SELECT MaLTC,SINHVIEN.MaSV,HoTen,TenLop FROM SinhVien
	JOIN Lop ON SinhVien.MaLop = LOP.MaLop
	JOIN DangKi ON DangKi.MaSV = SinhVien.MaSV
	WHERE DangKi.MaLTC=@MALTC

GO
/****** Object:  StoredProcedure [dbo].[usp_ThongKeDiemTB]    Script Date: 4/29/2023 1:51:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[usp_ThongKeDiemTB]
@MACN VARCHAR(10),
@MAMH VARCHAR(10),
@NAM INT,
@HOCKI NVARCHAR(10)
AS	
	DECLARE @HESOGK FLOAT,@HESOCK FLOAT
	SELECT TOP 1 @HESOGK=hesogk,@HESOCK=hesock FROM kehoach 
	WHERE mamh = @MAMH AND macn = @MACN
	
	
	SELECT DIEMTB=AVG( CAST(diemcc*10 +diemgk*@HESOGK + diemck*@HESOCK AS FLOAT)/100 ) FROM dangki
	INNER JOIN (SELECT maltc FROM loptinchi WHERE mamh =@MAMH AND namhoc=@NAM AND hocki=@HOCKI) F1
	ON dangki.maltc = F1.maltc


GO
/****** Object:  StoredProcedure [dbo].[usp_ThongKeDiemTBSV]    Script Date: 4/29/2023 1:51:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[usp_ThongKeDiemTBSV]
@MASV VARCHAR(10)
AS
	select mamh,hesogk,hesock into #C from kehoach 
	inner join sinhvien
	on kehoach.macn = sinhvien.macn 
	where masv=@MASV

	select mamh,namhoc,hocki,diemcc,diemgk,diemck into #A from (select maltc,mamh,namhoc,hocki from loptinchi ) f1
	inner join (select * from dangki where masv = @MASV and huy='0') f2
	on f1.maltc= f2.maltc

	select NamHoc,HocKi,ketqua=AVG(CAST(diemcc*10 +diemgk*hesogk + diemck*hesock AS FLOAT)/100)
	from #A inner join #C on #A.mamh = #C.mamh
	GROUP BY NamHoc,HocKi
	ORDER BY NamHoc DESC,HocKi DESC



GO
/****** Object:  StoredProcedure [dbo].[usp_ThongKeDiemTheoMon]    Script Date: 4/29/2023 1:51:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[usp_ThongKeDiemTheoMon]
@MAMH VARCHAR(10)
AS	
	--DECLARE @HESOGK VARCHAR(10),@HESOCK VARCHAR(10)
	--SELECT TOP 1 @HESOGK=hesogk,@HESOCK=hesock FROM kehoach 
	--WHERE mamh = @MAMH
	
	DECLARE @COUNT12 INT
	--DECLARE @KETQUA FLOAT

	--SELECT KETQUA =(CAST(diemcc*10 +diemgk*@HESOGK + diemck*@HESOCK AS FLOAT)/100) INTO #A FROM dangki
	--INNER JOIN (SELECT maltc FROM loptinchi WHERE mamh =@MAMH) F1
	--ON dangki.maltc = F1.maltc

	SELECT KETQUA =(CAST(diemcc*HeSoCC +diemgk*HeSoGK + diemck*HeSoCK AS FLOAT)/100) INTO  #A FROM dangki
	INNER JOIN LopTinChi ON dangki.maltc = LopTinChi.maltc
	INNER JOIN MonHoc ON LopTinChi.MaMH = MonHoc.MaMH
	where MonHoc.MaMH =@MAMH 

	SELECT 
		CASE 
			WHEN KETQUA<=1 THEN '0-1'  
			WHEN KETQUA<=2 THEN '1-2'
			WHEN KETQUA<=3 THEN '2-3'  
			WHEN KETQUA<=4 THEN '3-4' 
			WHEN KETQUA<=5 THEN '4-5'  
			WHEN KETQUA<=6 THEN '5-6' 
			WHEN KETQUA<=7 THEN '6-7'  
			WHEN KETQUA<=8 THEN '7-8'
			WHEN KETQUA<=9 THEN '8-9'  
			WHEN KETQUA<=10 THEN '9-10'  
		END AS DIEMTHEOMIEN
		INTO #B
	FROM #A
	
	
	SELECT DIEMTHEOMIEN,SL=COUNT(*) FROM #B GROUP BY #B.DIEMTHEOMIEN






GO
/****** Object:  StoredProcedure [dbo].[usp_ThongKeDiemTheoMonNam]    Script Date: 4/29/2023 1:51:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[usp_ThongKeDiemTheoMonNam]
@MACN VARCHAR(10),
@MAMH VARCHAR(10),
@NAM VARCHAR(15),
@HOCKI NVARCHAR(10)
AS	
	
	
	--DECLARE @COUNT12 INT
	--DECLARE @KETQUA FLOAT

	SELECT KETQUA =(CAST(diemcc*HeSoCC +diemgk*HeSoGK + diemck*HeSoCK AS FLOAT)/100) INTO  #A FROM dangki
	INNER JOIN LopTinChi ON dangki.maltc = LopTinChi.maltc
	INNER JOIN MonHoc ON LopTinChi.MaMH = MonHoc.MaMH
	where MonHoc.MaMH =@MAMH AND namhoc=@NAM AND hocki=@HOCKI
	

	SELECT 
		CASE 
			WHEN KETQUA<=1 THEN '0-1'  
			WHEN KETQUA<=2 THEN '1-2'
			WHEN KETQUA<=3 THEN '2-3'  
			WHEN KETQUA<=4 THEN '3-4' 
			WHEN KETQUA<=5 THEN '4-5'  
			WHEN KETQUA<=6 THEN '5-6' 
			WHEN KETQUA<=7 THEN '6-7'  
			WHEN KETQUA<=8 THEN '7-8'
			WHEN KETQUA<=9 THEN '8-9'  
			WHEN KETQUA<=10 THEN '9-10'  
		END AS DIEMTHEOMIEN
		INTO #B
	FROM #A
	
	
	SELECT DIEMTHEOMIEN,SL=COUNT(*) FROM #B GROUP BY #B.DIEMTHEOMIEN


	

GO
/****** Object:  StoredProcedure [dbo].[Xoa_Login]    Script Date: 4/29/2023 1:51:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE PROC [dbo].[Xoa_Login]
  @USERNAME VARCHAR(50)
  
AS
	DECLARE @LGNAME VARCHAR(50)
	
	SELECT @LGNAME=f1.name FROM sys.server_principals f1
	,sys.database_principals f2 where f1.sid = f2.sid
	and f2.name =@USERNAME

	EXEC SP_DROPUSER @USERNAME
	EXEC SP_DROPLOGIN @LGNAME




GO
USE [master]
GO
ALTER DATABASE [qldiem_PTCUDDD] SET  READ_WRITE 
GO
