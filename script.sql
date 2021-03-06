USE [master]
GO
/****** Object:  Database [J3.L.P0036]    Script Date: 3/24/2021 6:54:49 PM ******/
CREATE DATABASE [J3.L.P0036]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'J3.L.P0036', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\J3.L.P0036.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'J3.L.P0036_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\J3.L.P0036_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [J3.L.P0036] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [J3.L.P0036].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [J3.L.P0036] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [J3.L.P0036] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [J3.L.P0036] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [J3.L.P0036] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [J3.L.P0036] SET ARITHABORT OFF 
GO
ALTER DATABASE [J3.L.P0036] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [J3.L.P0036] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [J3.L.P0036] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [J3.L.P0036] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [J3.L.P0036] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [J3.L.P0036] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [J3.L.P0036] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [J3.L.P0036] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [J3.L.P0036] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [J3.L.P0036] SET  DISABLE_BROKER 
GO
ALTER DATABASE [J3.L.P0036] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [J3.L.P0036] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [J3.L.P0036] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [J3.L.P0036] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [J3.L.P0036] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [J3.L.P0036] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [J3.L.P0036] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [J3.L.P0036] SET RECOVERY FULL 
GO
ALTER DATABASE [J3.L.P0036] SET  MULTI_USER 
GO
ALTER DATABASE [J3.L.P0036] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [J3.L.P0036] SET DB_CHAINING OFF 
GO
ALTER DATABASE [J3.L.P0036] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [J3.L.P0036] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [J3.L.P0036] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [J3.L.P0036] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'J3.L.P0036', N'ON'
GO
ALTER DATABASE [J3.L.P0036] SET QUERY_STORE = OFF
GO
USE [J3.L.P0036]
GO
/****** Object:  Table [dbo].[Comment]    Script Date: 3/24/2021 6:54:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Comment](
	[comment_id] [int] IDENTITY(1,1) NOT NULL,
	[user_name] [nvarchar](50) NOT NULL,
	[post_id] [int] NOT NULL,
	[comment_content] [nvarchar](max) NOT NULL,
	[date_time] [datetime] NOT NULL,
	[isApproved] [bit] NOT NULL,
	[reject_reason_id] [int] NOT NULL,
	[status_alert] [bit] NOT NULL,
 CONSTRAINT [PK_Comment] PRIMARY KEY CLUSTERED 
(
	[comment_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Post]    Script Date: 3/24/2021 6:54:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Post](
	[post_id] [int] IDENTITY(1,1) NOT NULL,
	[author_name] [nvarchar](50) NOT NULL,
	[date_time] [datetime] NOT NULL,
	[content] [nvarchar](max) NOT NULL,
	[post_title] [nvarchar](100) NULL,
 CONSTRAINT [PK_Post] PRIMARY KEY CLUSTERED 
(
	[post_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Reason]    Script Date: 3/24/2021 6:54:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Reason](
	[reason_id] [int] NOT NULL,
	[reason_name] [nchar](50) NOT NULL,
 CONSTRAINT [PK_Reason] PRIMARY KEY CLUSTERED 
(
	[reason_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ReplyComment]    Script Date: 3/24/2021 6:54:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ReplyComment](
	[comment_id] [int] NOT NULL,
	[reply_content] [nvarchar](2000) NOT NULL,
	[author_name] [nvarchar](50) NOT NULL,
	[reply_id] [int] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK_ReplyComment] PRIMARY KEY CLUSTERED 
(
	[reply_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 3/24/2021 6:54:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[user_name] [nvarchar](50) NOT NULL,
	[password] [nchar](50) NOT NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[user_name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Comment] ON 

INSERT [dbo].[Comment] ([comment_id], [user_name], [post_id], [comment_content], [date_time], [isApproved], [reject_reason_id], [status_alert]) VALUES (3, N'user1', 1, N' alo 2121', CAST(N'2021-03-04T00:00:00.000' AS DateTime), 1, 1, 1)
INSERT [dbo].[Comment] ([comment_id], [user_name], [post_id], [comment_content], [date_time], [isApproved], [reject_reason_id], [status_alert]) VALUES (5, N'user1', 1, N'cai gi co', CAST(N'2021-03-04T00:00:00.000' AS DateTime), 1, 1, 0)
INSERT [dbo].[Comment] ([comment_id], [user_name], [post_id], [comment_content], [date_time], [isApproved], [reject_reason_id], [status_alert]) VALUES (1002, N'user2', 1, N'aloooooo', CAST(N'2021-03-03T00:00:00.000' AS DateTime), 1, 1, 1)
INSERT [dbo].[Comment] ([comment_id], [user_name], [post_id], [comment_content], [date_time], [isApproved], [reject_reason_id], [status_alert]) VALUES (1019, N'user1', 3, N'tai sao lai the????
', CAST(N'2021-03-21T00:00:00.000' AS DateTime), 1, 1, 1)
INSERT [dbo].[Comment] ([comment_id], [user_name], [post_id], [comment_content], [date_time], [isApproved], [reject_reason_id], [status_alert]) VALUES (1020, N'user1', 1, N'help!!!', CAST(N'2021-03-21T00:00:00.000' AS DateTime), 1, 1, 1)
INSERT [dbo].[Comment] ([comment_id], [user_name], [post_id], [comment_content], [date_time], [isApproved], [reject_reason_id], [status_alert]) VALUES (1021, N'user2', 1, N'a', CAST(N'2021-03-21T00:00:00.000' AS DateTime), 1, 1, 1)
INSERT [dbo].[Comment] ([comment_id], [user_name], [post_id], [comment_content], [date_time], [isApproved], [reject_reason_id], [status_alert]) VALUES (1022, N'user2', 3, N'aaa', CAST(N'2021-03-21T00:00:00.000' AS DateTime), 1, 1, 1)
INSERT [dbo].[Comment] ([comment_id], [user_name], [post_id], [comment_content], [date_time], [isApproved], [reject_reason_id], [status_alert]) VALUES (1023, N'user1', 1, N'5555', CAST(N'2021-03-21T00:00:00.000' AS DateTime), 1, 1, 1)
INSERT [dbo].[Comment] ([comment_id], [user_name], [post_id], [comment_content], [date_time], [isApproved], [reject_reason_id], [status_alert]) VALUES (1024, N'user3', 1, N'55555
', CAST(N'2021-03-22T00:00:00.000' AS DateTime), 0, 3, 1)
INSERT [dbo].[Comment] ([comment_id], [user_name], [post_id], [comment_content], [date_time], [isApproved], [reject_reason_id], [status_alert]) VALUES (1025, N'user3', 3, N'555555', CAST(N'2021-03-22T00:00:00.000' AS DateTime), 0, 3, 1)
INSERT [dbo].[Comment] ([comment_id], [user_name], [post_id], [comment_content], [date_time], [isApproved], [reject_reason_id], [status_alert]) VALUES (1026, N'user1', 1, N'oooo', CAST(N'2021-03-22T00:00:00.000' AS DateTime), 1, 1, 1)
INSERT [dbo].[Comment] ([comment_id], [user_name], [post_id], [comment_content], [date_time], [isApproved], [reject_reason_id], [status_alert]) VALUES (1027, N'user2', 1, N'hiiii', CAST(N'2021-03-22T00:00:00.000' AS DateTime), 1, 1, 1)
INSERT [dbo].[Comment] ([comment_id], [user_name], [post_id], [comment_content], [date_time], [isApproved], [reject_reason_id], [status_alert]) VALUES (1028, N'user1', 1, N'tai sao tai sao', CAST(N'2021-03-22T00:00:00.000' AS DateTime), 1, 1, 1)
INSERT [dbo].[Comment] ([comment_id], [user_name], [post_id], [comment_content], [date_time], [isApproved], [reject_reason_id], [status_alert]) VALUES (1029, N'user1', 1, N'ppppppppppppppp', CAST(N'2021-03-22T00:00:00.000' AS DateTime), 1, 1, 1)
INSERT [dbo].[Comment] ([comment_id], [user_name], [post_id], [comment_content], [date_time], [isApproved], [reject_reason_id], [status_alert]) VALUES (1030, N'user2', 3, N'2222', CAST(N'2021-03-24T00:00:00.000' AS DateTime), 1, 1, 1)
SET IDENTITY_INSERT [dbo].[Comment] OFF
GO
SET IDENTITY_INSERT [dbo].[Post] ON 

INSERT [dbo].[Post] ([post_id], [author_name], [date_time], [content], [post_title]) VALUES (1, N'user1', CAST(N'2021-03-02T00:00:00.000' AS DateTime), N'AWAL Digital Limited (Kobalt) (thay mặt cho Lauv); UNIAO BRASILEIRA DE EDITORAS DE MUSICA - UBEM, UMPI, BMI - Broadcast Music Inc., LatinAutor - Warner Chappell, AMRA, Kobalt Music Publishing, ASCAP, PEDL, Warner Chappell, LatinAutor, CMRRA, LatinAutorPerf và 16 Hiệp hội bảo vệ quyền âm nhạc', N'Create web layout')
INSERT [dbo].[Post] ([post_id], [author_name], [date_time], [content], [post_title]) VALUES (3, N'user1', CAST(N'2021-03-03T00:00:00.000' AS DateTime), N'岐阜県郡上市の八幡町を散策いたしました。水の郷百選に選ばれた街並みは、城下町の雰囲気と相まってより一層趣深く感じました。

Gujo Hachiman is city of waterways. The town is also famous for Gujo Odori dance in Summer. Some people call Gujo Hachiman Castle a castle in the sky.', N'Create prototype
')
SET IDENTITY_INSERT [dbo].[Post] OFF
GO
INSERT [dbo].[Reason] ([reason_id], [reason_name]) VALUES (1, N'no                                                ')
INSERT [dbo].[Reason] ([reason_id], [reason_name]) VALUES (2, N'Spam                                              ')
INSERT [dbo].[Reason] ([reason_id], [reason_name]) VALUES (3, N'Trash                                             ')
GO
SET IDENTITY_INSERT [dbo].[ReplyComment] ON 

INSERT [dbo].[ReplyComment] ([comment_id], [reply_content], [author_name], [reply_id]) VALUES (1027, N'what?????', N'user1', 1)
INSERT [dbo].[ReplyComment] ([comment_id], [reply_content], [author_name], [reply_id]) VALUES (1027, N'age??', N'user1', 2)
INSERT [dbo].[ReplyComment] ([comment_id], [reply_content], [author_name], [reply_id]) VALUES (1027, N'dasdhashdbahsbdjsa', N'user1', 3)
INSERT [dbo].[ReplyComment] ([comment_id], [reply_content], [author_name], [reply_id]) VALUES (1027, N'dasdhashdbahsbdjsa', N'user1', 4)
INSERT [dbo].[ReplyComment] ([comment_id], [reply_content], [author_name], [reply_id]) VALUES (1027, N'dasdhashdbahsbdjsa', N'user1', 5)
INSERT [dbo].[ReplyComment] ([comment_id], [reply_content], [author_name], [reply_id]) VALUES (1022, N'repp1', N'user1', 6)
INSERT [dbo].[ReplyComment] ([comment_id], [reply_content], [author_name], [reply_id]) VALUES (1028, N'repp23232', N'user1', 7)
INSERT [dbo].[ReplyComment] ([comment_id], [reply_content], [author_name], [reply_id]) VALUES (1028, N'aaa', N'user1', 8)
INSERT [dbo].[ReplyComment] ([comment_id], [reply_content], [author_name], [reply_id]) VALUES (1030, N'4444', N'user1', 9)
INSERT [dbo].[ReplyComment] ([comment_id], [reply_content], [author_name], [reply_id]) VALUES (1030, N'ko sao', N'user1', 10)
INSERT [dbo].[ReplyComment] ([comment_id], [reply_content], [author_name], [reply_id]) VALUES (1029, N'lllll', N'user1', 11)
SET IDENTITY_INSERT [dbo].[ReplyComment] OFF
GO
INSERT [dbo].[User] ([user_name], [password]) VALUES (N'user1', N'123                                               ')
INSERT [dbo].[User] ([user_name], [password]) VALUES (N'user2', N'123                                               ')
INSERT [dbo].[User] ([user_name], [password]) VALUES (N'user3', N'123                                               ')
GO
ALTER TABLE [dbo].[Comment]  WITH CHECK ADD  CONSTRAINT [FK_Comment_Post] FOREIGN KEY([post_id])
REFERENCES [dbo].[Post] ([post_id])
GO
ALTER TABLE [dbo].[Comment] CHECK CONSTRAINT [FK_Comment_Post]
GO
ALTER TABLE [dbo].[Comment]  WITH CHECK ADD  CONSTRAINT [FK_Comment_Reason] FOREIGN KEY([reject_reason_id])
REFERENCES [dbo].[Reason] ([reason_id])
GO
ALTER TABLE [dbo].[Comment] CHECK CONSTRAINT [FK_Comment_Reason]
GO
ALTER TABLE [dbo].[Comment]  WITH CHECK ADD  CONSTRAINT [FK_Comment_User] FOREIGN KEY([user_name])
REFERENCES [dbo].[User] ([user_name])
GO
ALTER TABLE [dbo].[Comment] CHECK CONSTRAINT [FK_Comment_User]
GO
ALTER TABLE [dbo].[Post]  WITH CHECK ADD  CONSTRAINT [FK_Post_User] FOREIGN KEY([author_name])
REFERENCES [dbo].[User] ([user_name])
GO
ALTER TABLE [dbo].[Post] CHECK CONSTRAINT [FK_Post_User]
GO
ALTER TABLE [dbo].[ReplyComment]  WITH CHECK ADD  CONSTRAINT [FK_ReplyComment_Comment] FOREIGN KEY([comment_id])
REFERENCES [dbo].[Comment] ([comment_id])
GO
ALTER TABLE [dbo].[ReplyComment] CHECK CONSTRAINT [FK_ReplyComment_Comment]
GO
ALTER TABLE [dbo].[ReplyComment]  WITH CHECK ADD  CONSTRAINT [FK_ReplyComment_User] FOREIGN KEY([author_name])
REFERENCES [dbo].[User] ([user_name])
GO
ALTER TABLE [dbo].[ReplyComment] CHECK CONSTRAINT [FK_ReplyComment_User]
GO
USE [master]
GO
ALTER DATABASE [J3.L.P0036] SET  READ_WRITE 
GO
