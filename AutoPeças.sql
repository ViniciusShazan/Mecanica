USE [master]
GO
/****** Object:  Database [AutoPecas]    Script Date: 27/06/2017 00:49:57 ******/
CREATE DATABASE [AutoPecas]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'AutoPecas', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\AutoPecas.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'AutoPecas_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\AutoPecas_log.ldf' , SIZE = 2048KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [AutoPecas] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [AutoPecas].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [AutoPecas] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [AutoPecas] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [AutoPecas] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [AutoPecas] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [AutoPecas] SET ARITHABORT OFF 
GO
ALTER DATABASE [AutoPecas] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [AutoPecas] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [AutoPecas] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [AutoPecas] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [AutoPecas] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [AutoPecas] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [AutoPecas] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [AutoPecas] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [AutoPecas] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [AutoPecas] SET  DISABLE_BROKER 
GO
ALTER DATABASE [AutoPecas] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [AutoPecas] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [AutoPecas] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [AutoPecas] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [AutoPecas] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [AutoPecas] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [AutoPecas] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [AutoPecas] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [AutoPecas] SET  MULTI_USER 
GO
ALTER DATABASE [AutoPecas] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [AutoPecas] SET DB_CHAINING OFF 
GO
ALTER DATABASE [AutoPecas] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [AutoPecas] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [AutoPecas] SET DELAYED_DURABILITY = DISABLED 
GO
USE [AutoPecas]
GO
/****** Object:  Table [dbo].[Cliente]    Script Date: 27/06/2017 00:49:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Cliente](
	[id] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[nome] [varchar](25) NULL,
	[endereco] [varchar](40) NULL,
	[cidade] [varchar](25) NULL,
	[estado] [char](2) NULL,
	[idade] [int] NULL,
	[cpf] [varchar](12) NULL,
 CONSTRAINT [PK_Cliente] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Motos]    Script Date: 27/06/2017 00:49:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Motos](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[nome] [varchar](10) NULL,
	[modelo] [int] NULL,
	[placa] [char](9) NULL,
	[ano] [char](4) NULL,
 CONSTRAINT [PK_Motos] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Pecas]    Script Date: 27/06/2017 00:49:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Pecas](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[nome] [varchar](25) NULL,
	[marca] [varchar](15) NULL,
	[modelo] [varchar](20) NULL,
	[preço] [int] NULL,
	[quantidade] [int] NULL,
	[descricao] [varchar](50) NULL,
	[servico_id] [int] NULL,
 CONSTRAINT [PK_Pecas] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Servico]    Script Date: 27/06/2017 00:49:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Servico](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[motos_id] [int] NULL,
	[cliente_id] [int] NULL,
 CONSTRAINT [PK_Servico] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[Cliente] ON 

INSERT [dbo].[Cliente] ([id], [nome], [endereco], [cidade], [estado], [idade], [cpf]) VALUES (1, N'Vinicius Gabriel', N'Ezequias Antunes Ribeiro 51', N'Maracai', N'SP', 18, N'1234567890')
INSERT [dbo].[Cliente] ([id], [nome], [endereco], [cidade], [estado], [idade], [cpf]) VALUES (2, N'Paulo Marcelo', N'Ezequias Antunes', N'Maracai', N'SP', 42, N'1234567890')
SET IDENTITY_INSERT [dbo].[Cliente] OFF
SET IDENTITY_INSERT [dbo].[Motos] ON 

INSERT [dbo].[Motos] ([id], [nome], [modelo], [placa], [ano]) VALUES (1, N'Cg Today', 125, N'abc1234  ', N'1998')
INSERT [dbo].[Motos] ([id], [nome], [modelo], [placa], [ano]) VALUES (2, N'Cg Titan', 150, N'abc 4567 ', N'2012')
SET IDENTITY_INSERT [dbo].[Motos] OFF
SET IDENTITY_INSERT [dbo].[Pecas] ON 

INSERT [dbo].[Pecas] ([id], [nome], [marca], [modelo], [preço], [quantidade], [descricao], [servico_id]) VALUES (1, N'Kit Corrente', N'Unibear', N'Cg150', 85, 5, N'4', 0)
INSERT [dbo].[Pecas] ([id], [nome], [marca], [modelo], [preço], [quantidade], [descricao], [servico_id]) VALUES (2, N'Pisca', N'Max Premium', N'Cg Todas', 6, 10, N'Pisca ambos os lados', NULL)
SET IDENTITY_INSERT [dbo].[Pecas] OFF
ALTER TABLE [dbo].[Servico]  WITH CHECK ADD  CONSTRAINT [FK_Servico_Cliente] FOREIGN KEY([cliente_id])
REFERENCES [dbo].[Cliente] ([id])
GO
ALTER TABLE [dbo].[Servico] CHECK CONSTRAINT [FK_Servico_Cliente]
GO
ALTER TABLE [dbo].[Servico]  WITH CHECK ADD  CONSTRAINT [FK_Servico_Motos] FOREIGN KEY([motos_id])
REFERENCES [dbo].[Motos] ([id])
GO
ALTER TABLE [dbo].[Servico] CHECK CONSTRAINT [FK_Servico_Motos]
GO
USE [master]
GO
ALTER DATABASE [AutoPecas] SET  READ_WRITE 
GO
