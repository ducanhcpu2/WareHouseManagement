USE [master]
GO
/****** Object:  Database [dbQLKho_2]    Script Date: 6/4/2019 9:45:40 PM ******/
CREATE DATABASE [dbQLKho_2]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'dbQLKho', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\dbQLKho_2.mdf' , SIZE = 3264KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'dbQLKho_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\dbQLKho_2_log.ldf' , SIZE = 832KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [dbQLKho_2] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [dbQLKho_2].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [dbQLKho_2] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [dbQLKho_2] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [dbQLKho_2] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [dbQLKho_2] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [dbQLKho_2] SET ARITHABORT OFF 
GO
ALTER DATABASE [dbQLKho_2] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [dbQLKho_2] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [dbQLKho_2] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [dbQLKho_2] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [dbQLKho_2] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [dbQLKho_2] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [dbQLKho_2] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [dbQLKho_2] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [dbQLKho_2] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [dbQLKho_2] SET  DISABLE_BROKER 
GO
ALTER DATABASE [dbQLKho_2] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [dbQLKho_2] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [dbQLKho_2] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [dbQLKho_2] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [dbQLKho_2] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [dbQLKho_2] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [dbQLKho_2] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [dbQLKho_2] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [dbQLKho_2] SET  MULTI_USER 
GO
ALTER DATABASE [dbQLKho_2] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [dbQLKho_2] SET DB_CHAINING OFF 
GO
ALTER DATABASE [dbQLKho_2] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [dbQLKho_2] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [dbQLKho_2] SET DELAYED_DURABILITY = DISABLED 
GO
USE [dbQLKho_2]
GO
/****** Object:  Table [dbo].[Menu]    Script Date: 6/4/2019 9:45:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Menu](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NULL,
	[parentId] [int] NULL,
	[url] [nvarchar](256) NULL,
	[index] [int] NULL,
	[fontAwesome] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbCT_PhieuNhap]    Script Date: 6/4/2019 9:45:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbCT_PhieuNhap](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[ipBillId] [int] NULL,
	[productId] [int] NULL,
	[amount] [int] NULL,
	[priceCurrent] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tbCT_PhieuXuat]    Script Date: 6/4/2019 9:45:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbCT_PhieuXuat](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[opBillId] [int] NULL,
	[productId] [int] NULL,
	[amount] [int] NULL,
	[priceCurrent] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tbHangHoa]    Script Date: 6/4/2019 9:45:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbHangHoa](
	[productId] [int] IDENTITY(1,1) NOT NULL,
	[productName] [nvarchar](100) NULL,
	[categoryId] [int] NULL,
	[amount] [int] NULL,
	[price] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[productId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tbLoaiHangHoa]    Script Date: 6/4/2019 9:45:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbLoaiHangHoa](
	[categoryId] [int] IDENTITY(1,1) NOT NULL,
	[categoryName] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[categoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tbNhaPhanPhoi]    Script Date: 6/4/2019 9:45:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING OFF
GO
CREATE TABLE [dbo].[tbNhaPhanPhoi](
	[distributorId] [int] IDENTITY(1,1) NOT NULL,
	[distributorName] [nvarchar](50) NULL,
	[distributorAddress] [nvarchar](100) NULL,
	[distributonTown] [int] NULL,
	[distributonNumberPhone] [varchar](15) NULL,
PRIMARY KEY CLUSTERED 
(
	[distributorId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbNhaSanXuat]    Script Date: 6/4/2019 9:45:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING OFF
GO
CREATE TABLE [dbo].[tbNhaSanXuat](
	[producerId] [int] IDENTITY(1,1) NOT NULL,
	[producerName] [nvarchar](50) NULL,
	[producerAddress] [nvarchar](100) NULL,
	[producerTown] [int] NULL,
	[producerNumberPhone] [varchar](15) NULL,
PRIMARY KEY CLUSTERED 
(
	[producerId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbPhieuNhap]    Script Date: 6/4/2019 9:45:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbPhieuNhap](
	[ipBillId] [int] IDENTITY(1,1) NOT NULL,
	[priceTotal] [int] NULL,
	[producerId] [int] NULL,
	[accountId] [int] NULL,
	[whatDate] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[ipBillId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tbPhieuXuat]    Script Date: 6/4/2019 9:45:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbPhieuXuat](
	[opBillId] [int] IDENTITY(1,1) NOT NULL,
	[priceTotal] [int] NULL,
	[accountId] [int] NULL,
	[distributorId] [int] NULL,
	[whatDate] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[opBillId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tbTaiKhoan]    Script Date: 6/4/2019 9:45:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbTaiKhoan](
	[accountName] [nvarchar](50) NULL,
	[accountDate] [date] NULL,
	[accountSex] [nvarchar](5) NULL,
	[accountHometown] [int] NULL,
	[accountNumberPhone] [varchar](15) NULL,
	[accountAddress] [nvarchar](50) NULL,
	[accountTown] [int] NULL,
	[userName] [varchar](20) NULL,
	[passWord] [varchar](100) NULL,
	[accountImage] [varchar](200) NULL,
	[accountId] [int] IDENTITY(100000,1) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[accountId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[Menu] ON 

INSERT [dbo].[Menu] ([id], [name], [parentId], [url], [index], [fontAwesome]) VALUES (1, N'Hàng hóa', NULL, NULL, 1, N'fas fa-boxes')
INSERT [dbo].[Menu] ([id], [name], [parentId], [url], [index], [fontAwesome]) VALUES (2, N'Nhà sản xuất', NULL, NULL, 2, N'fas fa-user-plus')
INSERT [dbo].[Menu] ([id], [name], [parentId], [url], [index], [fontAwesome]) VALUES (3, N'Nhà phân phối', NULL, NULL, 3, N'fas fa-user-minus')
INSERT [dbo].[Menu] ([id], [name], [parentId], [url], [index], [fontAwesome]) VALUES (4, N'Nhập hàng', NULL, NULL, 4, N'fas fa-sign-in-alt')
INSERT [dbo].[Menu] ([id], [name], [parentId], [url], [index], [fontAwesome]) VALUES (5, N'Xuất hàng', NULL, NULL, 5, N'fas fa-sign-out-alt')
INSERT [dbo].[Menu] ([id], [name], [parentId], [url], [index], [fontAwesome]) VALUES (6, N'Tài khoản', NULL, NULL, 6, N'fas fa-user')
INSERT [dbo].[Menu] ([id], [name], [parentId], [url], [index], [fontAwesome]) VALUES (7, N'Thêm hàng hóa', 1, N'/Product/addProduct', 1, N'fas fa-plus')
INSERT [dbo].[Menu] ([id], [name], [parentId], [url], [index], [fontAwesome]) VALUES (8, N'Danh sách hàng hóa', 1, N'/Product/showProducts', 2, N'fas fa-list-alt')
INSERT [dbo].[Menu] ([id], [name], [parentId], [url], [index], [fontAwesome]) VALUES (9, N'Thêm NSX', 2, N'/Producer/addProducer', 1, N'fas fa-plus')
INSERT [dbo].[Menu] ([id], [name], [parentId], [url], [index], [fontAwesome]) VALUES (10, N'Danh sách NSX', 2, N'/Producer/showProducers', 2, N'fas fa-list-alt')
INSERT [dbo].[Menu] ([id], [name], [parentId], [url], [index], [fontAwesome]) VALUES (11, N'Thêm NPP', 3, N'/Distributor/addDistributor', 1, N'fas fa-plus')
INSERT [dbo].[Menu] ([id], [name], [parentId], [url], [index], [fontAwesome]) VALUES (12, N'Danh sách NPP', 3, N'/Distributor/showDistributors', 2, N'fas fa-list-alt')
INSERT [dbo].[Menu] ([id], [name], [parentId], [url], [index], [fontAwesome]) VALUES (13, N'Thêm phiếu nhập', 4, N'/IpBill/addIpBill', 1, N'fas fa-plus')
INSERT [dbo].[Menu] ([id], [name], [parentId], [url], [index], [fontAwesome]) VALUES (14, N'Danh sách phiếu nhập', 4, N'/IpBill/showIpBills', 2, N'fas fa-list-alt')
INSERT [dbo].[Menu] ([id], [name], [parentId], [url], [index], [fontAwesome]) VALUES (15, N'Thêm phiếu xuất', 5, N'/OpBill/addOpBill', 1, N'fas fa-plus')
INSERT [dbo].[Menu] ([id], [name], [parentId], [url], [index], [fontAwesome]) VALUES (16, N'Danh sách phiếu xuất', 5, N'/OpBill/showOpBills', 2, N'fas fa-list-alt')
INSERT [dbo].[Menu] ([id], [name], [parentId], [url], [index], [fontAwesome]) VALUES (17, N'Thông tin', 6, N'/Account/showInformation', 1, N'fas fa-user')
INSERT [dbo].[Menu] ([id], [name], [parentId], [url], [index], [fontAwesome]) VALUES (18, N'Đổi mật khẩu', 6, N'/Account/changePass', 2, N'fas fa-cog')
INSERT [dbo].[Menu] ([id], [name], [parentId], [url], [index], [fontAwesome]) VALUES (19, N'Đăng xuất', 6, N'/Account/Login', 3, N'fas fa-power-off')
SET IDENTITY_INSERT [dbo].[Menu] OFF
SET IDENTITY_INSERT [dbo].[tbCT_PhieuNhap] ON 

INSERT [dbo].[tbCT_PhieuNhap] ([id], [ipBillId], [productId], [amount], [priceCurrent]) VALUES (4, 6, 1, 300, 10000)
INSERT [dbo].[tbCT_PhieuNhap] ([id], [ipBillId], [productId], [amount], [priceCurrent]) VALUES (6, 7, 2, 100, 150000)
INSERT [dbo].[tbCT_PhieuNhap] ([id], [ipBillId], [productId], [amount], [priceCurrent]) VALUES (10, 9, 3, 10, 150000)
INSERT [dbo].[tbCT_PhieuNhap] ([id], [ipBillId], [productId], [amount], [priceCurrent]) VALUES (11, 10, 4, 1, 10000)
INSERT [dbo].[tbCT_PhieuNhap] ([id], [ipBillId], [productId], [amount], [priceCurrent]) VALUES (12, 11, 4, 1, 10000)
INSERT [dbo].[tbCT_PhieuNhap] ([id], [ipBillId], [productId], [amount], [priceCurrent]) VALUES (13, 12, 4, 1, 10000)
SET IDENTITY_INSERT [dbo].[tbCT_PhieuNhap] OFF
SET IDENTITY_INSERT [dbo].[tbHangHoa] ON 

INSERT [dbo].[tbHangHoa] ([productId], [productName], [categoryId], [amount], [price]) VALUES (1, N'Áo thun', 3, 400, 35000)
INSERT [dbo].[tbHangHoa] ([productId], [productName], [categoryId], [amount], [price]) VALUES (2, N'Quần Jean', 2, 100, 299000)
INSERT [dbo].[tbHangHoa] ([productId], [productName], [categoryId], [amount], [price]) VALUES (3, N'Giày Sneaker', 3, 10, 290000)
INSERT [dbo].[tbHangHoa] ([productId], [productName], [categoryId], [amount], [price]) VALUES (4, N'Iphone6', 5, 5, 10000)
INSERT [dbo].[tbHangHoa] ([productId], [productName], [categoryId], [amount], [price]) VALUES (7, N'harry potter', 6, 2, 100000)
INSERT [dbo].[tbHangHoa] ([productId], [productName], [categoryId], [amount], [price]) VALUES (8, N'oppo', 5, 10, 200000)
SET IDENTITY_INSERT [dbo].[tbHangHoa] OFF
SET IDENTITY_INSERT [dbo].[tbLoaiHangHoa] ON 

INSERT [dbo].[tbLoaiHangHoa] ([categoryId], [categoryName]) VALUES (1, N'Áo')
INSERT [dbo].[tbLoaiHangHoa] ([categoryId], [categoryName]) VALUES (2, N'Quần')
INSERT [dbo].[tbLoaiHangHoa] ([categoryId], [categoryName]) VALUES (3, N'Giày')
INSERT [dbo].[tbLoaiHangHoa] ([categoryId], [categoryName]) VALUES (4, N'Mũ')
INSERT [dbo].[tbLoaiHangHoa] ([categoryId], [categoryName]) VALUES (5, N'phone')
INSERT [dbo].[tbLoaiHangHoa] ([categoryId], [categoryName]) VALUES (6, N'book')
SET IDENTITY_INSERT [dbo].[tbLoaiHangHoa] OFF
SET IDENTITY_INSERT [dbo].[tbNhaPhanPhoi] ON 

INSERT [dbo].[tbNhaPhanPhoi] ([distributorId], [distributorName], [distributorAddress], [distributonTown], [distributonNumberPhone]) VALUES (1, N'Torato', N'Số 25', 1, N'0222222222')
INSERT [dbo].[tbNhaPhanPhoi] ([distributorId], [distributorName], [distributorAddress], [distributonTown], [distributonNumberPhone]) VALUES (2, N'Công ty TNHH LongJker', N'Số 10', 346, N'0123456789')
SET IDENTITY_INSERT [dbo].[tbNhaPhanPhoi] OFF
SET IDENTITY_INSERT [dbo].[tbNhaSanXuat] ON 

INSERT [dbo].[tbNhaSanXuat] ([producerId], [producerName], [producerAddress], [producerTown], [producerNumberPhone]) VALUES (1, N'Filip', N'Số 1', 37, N'0123456789')
INSERT [dbo].[tbNhaSanXuat] ([producerId], [producerName], [producerAddress], [producerTown], [producerNumberPhone]) VALUES (2, N'Addidas', N'số 9, ngõ 100', 9637, N'0123456789')
SET IDENTITY_INSERT [dbo].[tbNhaSanXuat] OFF
SET IDENTITY_INSERT [dbo].[tbPhieuNhap] ON 

INSERT [dbo].[tbPhieuNhap] ([ipBillId], [priceTotal], [producerId], [accountId], [whatDate]) VALUES (6, 3000000, 1, 100000, CAST(N'2019-02-23' AS Date))
INSERT [dbo].[tbPhieuNhap] ([ipBillId], [priceTotal], [producerId], [accountId], [whatDate]) VALUES (7, 15000000, 1, 100000, CAST(N'2019-02-25' AS Date))
INSERT [dbo].[tbPhieuNhap] ([ipBillId], [priceTotal], [producerId], [accountId], [whatDate]) VALUES (9, 1500000, 2, 100000, CAST(N'2019-04-13' AS Date))
INSERT [dbo].[tbPhieuNhap] ([ipBillId], [priceTotal], [producerId], [accountId], [whatDate]) VALUES (10, 10000, 1, 100000, CAST(N'2019-05-17' AS Date))
INSERT [dbo].[tbPhieuNhap] ([ipBillId], [priceTotal], [producerId], [accountId], [whatDate]) VALUES (11, 10000, 1, 100000, CAST(N'2019-05-17' AS Date))
INSERT [dbo].[tbPhieuNhap] ([ipBillId], [priceTotal], [producerId], [accountId], [whatDate]) VALUES (12, 10000, 1, 100000, CAST(N'2019-05-17' AS Date))
SET IDENTITY_INSERT [dbo].[tbPhieuNhap] OFF
SET IDENTITY_INSERT [dbo].[tbTaiKhoan] ON 

INSERT [dbo].[tbTaiKhoan] ([accountName], [accountDate], [accountSex], [accountHometown], [accountNumberPhone], [accountAddress], [accountTown], [userName], [passWord], [accountImage], [accountId]) VALUES (N'Nguyễn Văn  A ', CAST(N'1998-09-12' AS Date), N'Nam', 14623, N'01672592144', N'số 9, ngõ 100', 10597, N'kutyboy98           ', N'5def7bfa5f0352d85a7db8259d5887ba', N'/Data/images/Avatar/kutyboy98.jpg', 100000)
SET IDENTITY_INSERT [dbo].[tbTaiKhoan] OFF
ALTER TABLE [dbo].[Menu]  WITH CHECK ADD FOREIGN KEY([parentId])
REFERENCES [dbo].[Menu] ([id])
GO
ALTER TABLE [dbo].[tbCT_PhieuNhap]  WITH CHECK ADD FOREIGN KEY([ipBillId])
REFERENCES [dbo].[tbPhieuNhap] ([ipBillId])
GO
ALTER TABLE [dbo].[tbCT_PhieuNhap]  WITH CHECK ADD FOREIGN KEY([productId])
REFERENCES [dbo].[tbHangHoa] ([productId])
GO
ALTER TABLE [dbo].[tbCT_PhieuXuat]  WITH CHECK ADD FOREIGN KEY([opBillId])
REFERENCES [dbo].[tbPhieuXuat] ([opBillId])
GO
ALTER TABLE [dbo].[tbCT_PhieuXuat]  WITH CHECK ADD FOREIGN KEY([productId])
REFERENCES [dbo].[tbHangHoa] ([productId])
GO
ALTER TABLE [dbo].[tbHangHoa]  WITH CHECK ADD FOREIGN KEY([categoryId])
REFERENCES [dbo].[tbLoaiHangHoa] ([categoryId])
GO
ALTER TABLE [dbo].[tbPhieuNhap]  WITH CHECK ADD FOREIGN KEY([accountId])
REFERENCES [dbo].[tbTaiKhoan] ([accountId])
GO
ALTER TABLE [dbo].[tbPhieuNhap]  WITH CHECK ADD FOREIGN KEY([producerId])
REFERENCES [dbo].[tbNhaSanXuat] ([producerId])
GO
ALTER TABLE [dbo].[tbPhieuXuat]  WITH CHECK ADD FOREIGN KEY([accountId])
REFERENCES [dbo].[tbTaiKhoan] ([accountId])
GO
ALTER TABLE [dbo].[tbPhieuXuat]  WITH CHECK ADD FOREIGN KEY([distributorId])
REFERENCES [dbo].[tbNhaPhanPhoi] ([distributorId])
GO
/****** Object:  Trigger [dbo].[addIpBillDetail]    Script Date: 6/4/2019 9:45:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER [dbo].[addIpBillDetail]  ON [dbo].[tbCT_PhieuNhap] AFTER INSERT,DELETE,UPDATE
AS
	BEGIN
	DECLARE @productId INT,@amount INT,@amount2 int,@currentPrice INT,@currentPrice2 int,@id INT,@myId int 
	IF EXISTS(SELECT * FROM inserted) AND NOT EXISTS(SELECT * FROM deleted)
	BEGIN
		SELECT @productId = productId,@amount=amount,@id=ipBillId,@currentPrice = priceCurrent
		FROM inserted
		UPDATE dbo.tbHangHoa SET amount +=@amount WHERE productId = @productId
		UPDATE dbo.tbPhieuNhap SET priceTotal +=@amount*@currentPrice WHERE ipBillId=@id
	END
	IF NOT EXISTS(SELECT * FROM inserted) AND  EXISTS(SELECT * FROM deleted)
	BEGIN
		SELECT @productId = productId,@amount=amount,@id=ipBillId,@currentPrice = priceCurrent
		FROM deleted
		UPDATE dbo.tbHangHoa SET amount -=@amount WHERE productId = @productId
		UPDATE dbo.tbPhieuNhap SET priceTotal -=@amount*@currentPrice WHERE ipBillId=@id
	END
	IF  EXISTS(SELECT * FROM inserted) AND  EXISTS(SELECT * FROM deleted)
	BEGIN
		DECLARE @productAmount INT
		SELECT @productId = productId,@amount=amount,@id=ipBillId,@currentPrice = priceCurrent,@myId = id
		FROM deleted
		SELECT @amount2=amount,@currentPrice2 = priceCurrent
		FROM inserted
		SELECT @productAmount = amount FROM dbo.tbHangHoa WHERE productId=@productId		
		IF @productAmount+@amount2-@amount<0
		BEGIN
			UPDATE dbo.tbCT_PhieuNhap SET amount+=@amount-@amount2 WHERE id=@myId
		END
		ELSE
		begin
			UPDATE dbo.tbHangHoa SET amount +=@amount2-@amount WHERE productId = @productId
			UPDATE dbo.tbPhieuNhap SET priceTotal +=(@amount2*@currentPrice2-@amount*@currentPrice) WHERE ipBillId=@id			
		END	
	END
	END
GO
/****** Object:  Trigger [dbo].[addOpBillDetail]    Script Date: 6/4/2019 9:45:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER [dbo].[addOpBillDetail]  ON [dbo].[tbCT_PhieuXuat] AFTER INSERT,DELETE,UPDATE
AS
	BEGIN
	DECLARE @productId INT,@amount INT,@amount2 int,@currentPrice INT,@currentPrice2 int,@id INT,@myId int 
	IF EXISTS(SELECT * FROM inserted) AND NOT EXISTS(SELECT * FROM deleted)
	BEGIN
		SELECT @productId = productId,@amount=amount,@id=opBillId,@currentPrice = priceCurrent
		FROM inserted
		UPDATE dbo.tbHangHoa SET amount -=@amount WHERE productId = @productId
		UPDATE dbo.tbPhieuXuat SET priceTotal +=@amount*@currentPrice WHERE opBillId=@id
	END
	IF NOT EXISTS(SELECT * FROM inserted) AND  EXISTS(SELECT * FROM deleted)
	BEGIN
		SELECT @productId = productId,@amount=amount,@id=opBillId,@currentPrice = priceCurrent
		FROM deleted
		UPDATE dbo.tbHangHoa SET amount +=@amount WHERE productId = @productId
		UPDATE dbo.tbPhieuXuat SET priceTotal -=@amount*@currentPrice WHERE opBillId=@id
	END
	IF  EXISTS(SELECT * FROM inserted) AND  EXISTS(SELECT * FROM deleted)
	BEGIN
		DECLARE @productAmount INT
		SELECT @productId = productId,@amount=amount,@id=opBillId,@currentPrice = priceCurrent,@myId = id
		FROM deleted
		SELECT @amount2=amount,@currentPrice2 = priceCurrent
		FROM inserted
		SELECT @productAmount = amount FROM dbo.tbHangHoa WHERE productId=@productId	
		IF @productAmount-@amount2+@amount<0
		BEGIN
			UPDATE dbo.tbCT_PhieuXuat SET amount-=@amount2-@amount WHERE id=@myId
		END
		ELSE
		begin
			UPDATE dbo.tbHangHoa SET amount -=@amount2-@amount WHERE productId = @productId
			UPDATE dbo.tbPhieuXuat SET priceTotal +=(@amount2*@currentPrice2-@amount*@currentPrice) WHERE opBillId=@id			
		END	
	END
	END
GO
USE [master]
GO
ALTER DATABASE [dbQLKho_2] SET  READ_WRITE 
GO
