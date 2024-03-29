USE [master]
GO
/****** Object:  Database [BooksDE170171]    Script Date: 3/14/2024 12:07:19 PM ******/
CREATE DATABASE [BooksDE170171]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'BooksDE170171', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\BooksDE170171.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'BooksDE170171_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\BooksDE170171_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [BooksDE170171] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [BooksDE170171].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [BooksDE170171] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [BooksDE170171] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [BooksDE170171] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [BooksDE170171] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [BooksDE170171] SET ARITHABORT OFF 
GO
ALTER DATABASE [BooksDE170171] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [BooksDE170171] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [BooksDE170171] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [BooksDE170171] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [BooksDE170171] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [BooksDE170171] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [BooksDE170171] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [BooksDE170171] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [BooksDE170171] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [BooksDE170171] SET  ENABLE_BROKER 
GO
ALTER DATABASE [BooksDE170171] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [BooksDE170171] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [BooksDE170171] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [BooksDE170171] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [BooksDE170171] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [BooksDE170171] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [BooksDE170171] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [BooksDE170171] SET RECOVERY FULL 
GO
ALTER DATABASE [BooksDE170171] SET  MULTI_USER 
GO
ALTER DATABASE [BooksDE170171] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [BooksDE170171] SET DB_CHAINING OFF 
GO
ALTER DATABASE [BooksDE170171] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [BooksDE170171] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [BooksDE170171] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [BooksDE170171] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'BooksDE170171', N'ON'
GO
ALTER DATABASE [BooksDE170171] SET QUERY_STORE = OFF
GO
USE [BooksDE170171]
GO
/****** Object:  Table [dbo].[Books]    Script Date: 3/14/2024 12:07:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Books](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[title] [nvarchar](30) NULL,
	[author] [nvarchar](30) NULL,
	[publication_date] [date] NULL,
	[quantity] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Loans]    Script Date: 3/14/2024 12:07:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Loans](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[book_id] [int] NOT NULL,
	[borrower_name] [nvarchar](30) NULL,
	[loan_date] [date] NOT NULL,
	[return_date] [date] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Books] ON 

INSERT [dbo].[Books] ([id], [title], [author], [publication_date], [quantity]) VALUES (1, N'To Kill a Mockingbird', N'Haper Lee', CAST(N'1960-07-11' AS Date), 10)
INSERT [dbo].[Books] ([id], [title], [author], [publication_date], [quantity]) VALUES (2, N'1984', N'George Orwell', CAST(N'1949-06-08' AS Date), 8)
INSERT [dbo].[Books] ([id], [title], [author], [publication_date], [quantity]) VALUES (3, N'The Great Gatsby', N'F. Scott Fitzgerald', CAST(N'1925-04-10' AS Date), 12)
INSERT [dbo].[Books] ([id], [title], [author], [publication_date], [quantity]) VALUES (4, N'Pride and Prejudice', N'Jane Austen', CAST(N'1813-01-28' AS Date), 15)
INSERT [dbo].[Books] ([id], [title], [author], [publication_date], [quantity]) VALUES (5, N'The Catcher in the Rye', N'J.D. Salinger', CAST(N'1951-07-16' AS Date), 7)
INSERT [dbo].[Books] ([id], [title], [author], [publication_date], [quantity]) VALUES (6, N'Good Morning', N'Haper Lee', CAST(N'1960-06-11' AS Date), 9)
SET IDENTITY_INSERT [dbo].[Books] OFF
GO
SET IDENTITY_INSERT [dbo].[Loans] ON 

INSERT [dbo].[Loans] ([id], [book_id], [borrower_name], [loan_date], [return_date]) VALUES (1, 1, N'John Doe', CAST(N'2024-03-01' AS Date), CAST(N'2024-03-15' AS Date))
INSERT [dbo].[Loans] ([id], [book_id], [borrower_name], [loan_date], [return_date]) VALUES (2, 2, N'Jane Smith', CAST(N'2024-02-28' AS Date), CAST(N'2024-03-14' AS Date))
INSERT [dbo].[Loans] ([id], [book_id], [borrower_name], [loan_date], [return_date]) VALUES (3, 3, N'Michael Johnson', CAST(N'2024-03-02' AS Date), CAST(N'2024-03-16' AS Date))
INSERT [dbo].[Loans] ([id], [book_id], [borrower_name], [loan_date], [return_date]) VALUES (4, 4, N'William', CAST(N'2024-02-02' AS Date), CAST(N'2024-03-01' AS Date))
INSERT [dbo].[Loans] ([id], [book_id], [borrower_name], [loan_date], [return_date]) VALUES (5, 5, N'Taylor', CAST(N'2024-02-02' AS Date), CAST(N'2024-02-29' AS Date))
SET IDENTITY_INSERT [dbo].[Loans] OFF
GO
ALTER TABLE [dbo].[Loans]  WITH CHECK ADD  CONSTRAINT [FK_Book] FOREIGN KEY([book_id])
REFERENCES [dbo].[Books] ([id])
GO
ALTER TABLE [dbo].[Loans] CHECK CONSTRAINT [FK_Book]
GO
USE [master]
GO
ALTER DATABASE [BooksDE170171] SET  READ_WRITE 
GO
