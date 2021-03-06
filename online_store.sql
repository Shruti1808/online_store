USE [online_store]
GO
/****** Object:  Table [dbo].[activity_history]    Script Date: 3/8/2017 4:28:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[activity_history](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[user_id] [int] NULL,
	[product_id] [int] NULL,
	[time_stamp] [datetime] NULL,
	[activity] [varchar](255) NULL,
	[notes] [varchar](1000) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[cart_products]    Script Date: 3/8/2017 4:28:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cart_products](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[user_id] [int] NULL,
	[product_id] [int] NULL,
	[quantity] [int] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[categories]    Script Date: 3/8/2017 4:28:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[categories](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](255) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[pictures]    Script Date: 3/8/2017 4:28:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[pictures](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[picture_key] [varchar](255) NULL,
	[alt_text] [varchar](255) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[pictures_products]    Script Date: 3/8/2017 4:28:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[pictures_products](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[product_id] [int] NULL,
	[picture_id] [int] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[products]    Script Date: 3/8/2017 4:28:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[products](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](255) NULL,
	[count] [int] NULL,
	[rating] [int] NULL,
	[price] [decimal](9, 2) NULL,
	[description] [varchar](4000) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[products_categories]    Script Date: 3/8/2017 4:28:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[products_categories](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[product_id] [int] NULL,
	[category_id] [int] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[profiles]    Script Date: 3/8/2017 4:28:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[profiles](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[user_id] [int] NULL,
	[street] [varchar](255) NULL,
	[city] [varchar](255) NULL,
	[state] [varchar](255) NULL,
	[zip_code] [int] NULL,
	[phone_number] [varchar](255) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[reviews]    Script Date: 3/8/2017 4:28:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[reviews](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[user_id] [int] NULL,
	[product_id] [int] NULL,
	[rating] [int] NULL,
	[review_text] [varchar](5000) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[reviews_pictures]    Script Date: 3/8/2017 4:28:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[reviews_pictures](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[picture_id] [int] NULL,
	[review_id] [int] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[users]    Script Date: 3/8/2017 4:28:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[users](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[first_name] [varchar](255) NULL,
	[last_name] [varchar](255) NULL,
	[username] [varchar](255) NULL,
	[password] [varchar](255) NULL,
	[admin_privileges] [bit] NULL
) ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[categories] ON 

INSERT [dbo].[categories] ([id], [name]) VALUES (1, N'Dinnerware')
INSERT [dbo].[categories] ([id], [name]) VALUES (2, N'Serveware')
INSERT [dbo].[categories] ([id], [name]) VALUES (3, N'Glassware & Barware')
INSERT [dbo].[categories] ([id], [name]) VALUES (4, N'Appliances')
INSERT [dbo].[categories] ([id], [name]) VALUES (5, N'Cutting & Shredding')
INSERT [dbo].[categories] ([id], [name]) VALUES (6, N'Cutlery & Utensils')
INSERT [dbo].[categories] ([id], [name]) VALUES (7, N'Cookware')
INSERT [dbo].[categories] ([id], [name]) VALUES (8, N'Bakeware')
INSERT [dbo].[categories] ([id], [name]) VALUES (9, N'Storage')
SET IDENTITY_INSERT [dbo].[categories] OFF
SET IDENTITY_INSERT [dbo].[pictures] ON 

INSERT [dbo].[pictures] ([id], [picture_key], [alt_text]) VALUES (1, N'\Content\img\products\1_pizzafork.jpg', N'Pizza Slicing Fork')
SET IDENTITY_INSERT [dbo].[pictures] OFF
SET IDENTITY_INSERT [dbo].[pictures_products] ON 

INSERT [dbo].[pictures_products] ([id], [product_id], [picture_id]) VALUES (1, 1, 1)
SET IDENTITY_INSERT [dbo].[pictures_products] OFF
SET IDENTITY_INSERT [dbo].[products] ON 

INSERT [dbo].[products] ([id], [name], [count], [rating], [price], [description]) VALUES (1, N'Pizza Slicer Fork', 8, 0, CAST(4.99 AS Decimal(9, 2)), N'Easily slice and eat your pizza with this genius pizza slicer fork. This 2-in-1 eating utensil has the functionality of a pizza slicer with the practicality of a regular fork, making it perfect for people who like to eat their pizza with a knife and a fork.')
SET IDENTITY_INSERT [dbo].[products] OFF
SET IDENTITY_INSERT [dbo].[products_categories] ON 

INSERT [dbo].[products_categories] ([id], [product_id], [category_id]) VALUES (1, 1, 1)
SET IDENTITY_INSERT [dbo].[products_categories] OFF
