USE [dbQLKho]
GO
/****** Object:  Table [dbo].[Menu]    Script Date: 2/19/2019 9:24:06 AM ******/
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
/****** Object:  Table [dbo].[tbCT_PhieuNhap]    Script Date: 2/19/2019 9:24:06 AM ******/
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
/****** Object:  Table [dbo].[tbCT_PhieuXuat]    Script Date: 2/19/2019 9:24:06 AM ******/
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
/****** Object:  Table [dbo].[tbHangHoa]    Script Date: 2/19/2019 9:24:06 AM ******/
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
/****** Object:  Table [dbo].[tbLoaiHangHoa]    Script Date: 2/19/2019 9:24:06 AM ******/
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
/****** Object:  Table [dbo].[tbNhaPhanPhoi]    Script Date: 2/19/2019 9:24:06 AM ******/
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
/****** Object:  Table [dbo].[tbNhaSanXuat]    Script Date: 2/19/2019 9:24:06 AM ******/
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
/****** Object:  Table [dbo].[tbPhieuNhap]    Script Date: 2/19/2019 9:24:06 AM ******/
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
/****** Object:  Table [dbo].[tbPhieuXuat]    Script Date: 2/19/2019 9:24:06 AM ******/
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
/****** Object:  Table [dbo].[tbTaiKhoan]    Script Date: 2/19/2019 9:24:06 AM ******/
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
INSERT [dbo].[Menu] ([id], [name], [parentId], [url], [index], [fontAwesome]) VALUES (16, N'Danh sách phiếu xuất', 5, N'/OpBill/showsOpBills', 2, N'fas fa-list-alt')
INSERT [dbo].[Menu] ([id], [name], [parentId], [url], [index], [fontAwesome]) VALUES (17, N'Thông tin', 6, N'/Account/showInformation', 1, N'fas fa-user')
INSERT [dbo].[Menu] ([id], [name], [parentId], [url], [index], [fontAwesome]) VALUES (18, N'Đổi mật khẩu', 6, N'/Account/changePass', 2, N'fas fa-cog')
INSERT [dbo].[Menu] ([id], [name], [parentId], [url], [index], [fontAwesome]) VALUES (19, N'Đăng xuất', 6, N'/Account/Login', 3, N'fas fa-power-off')
SET IDENTITY_INSERT [dbo].[Menu] OFF
SET IDENTITY_INSERT [dbo].[tbHangHoa] ON 

INSERT [dbo].[tbHangHoa] ([productId], [productName], [categoryId], [amount], [price]) VALUES (1, N'Áo thun', 1, 100, 35000)
SET IDENTITY_INSERT [dbo].[tbHangHoa] OFF
SET IDENTITY_INSERT [dbo].[tbLoaiHangHoa] ON 

INSERT [dbo].[tbLoaiHangHoa] ([categoryId], [categoryName]) VALUES (1, N'Áo')
INSERT [dbo].[tbLoaiHangHoa] ([categoryId], [categoryName]) VALUES (2, N'Quần')
INSERT [dbo].[tbLoaiHangHoa] ([categoryId], [categoryName]) VALUES (3, N'Giày')
INSERT [dbo].[tbLoaiHangHoa] ([categoryId], [categoryName]) VALUES (4, N'Mũ')
SET IDENTITY_INSERT [dbo].[tbLoaiHangHoa] OFF
SET IDENTITY_INSERT [dbo].[tbTaiKhoan] ON 

INSERT [dbo].[tbTaiKhoan] ([accountName], [accountDate], [accountSex], [accountHometown], [accountNumberPhone], [accountAddress], [accountTown], [userName], [passWord], [accountImage], [accountId]) VALUES (N'Trần Trọng Long', CAST(N'1998-09-12' AS Date), N'Nam', 14623, N'01672592144', N'số 9, ngõ 100', 4552, N'kutyboy98           ', N'5def7bfa5f0352d85a7db8259d5887ba', N'/Data/images/Avatar/kutyboy98.jpg', 100000)
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
