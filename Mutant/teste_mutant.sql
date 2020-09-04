-- Dados da conexao estao no arquivo mutant.udl
-- Alterar o caminho na linha 8 em Biblio.asp udl = "D:\Temp\Mutant\mutant\My Project\mutant.udl"
-- pagina inicial defaul.asp
-- Criação do Banco de Dados
CREATE DATABASE [mutant]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'mutant', FILENAME = N'D:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\mutant.mdf' , SIZE = 8192KB , FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'mutant_log', FILENAME = N'D:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\mutant_log.ldf' , SIZE = 8192KB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [mutant] SET COMPATIBILITY_LEVEL = 150
GO
ALTER DATABASE [mutant] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [mutant] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [mutant] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [mutant] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [mutant] SET ARITHABORT OFF 
GO
ALTER DATABASE [mutant] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [mutant] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [mutant] SET AUTO_CREATE_STATISTICS ON(INCREMENTAL = OFF)
GO
ALTER DATABASE [mutant] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [mutant] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [mutant] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [mutant] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [mutant] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [mutant] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [mutant] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [mutant] SET  DISABLE_BROKER 
GO
ALTER DATABASE [mutant] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [mutant] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [mutant] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [mutant] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [mutant] SET  READ_WRITE 
GO
ALTER DATABASE [mutant] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [mutant] SET  MULTI_USER 
GO
ALTER DATABASE [mutant] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [mutant] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [mutant] SET DELAYED_DURABILITY = DISABLED 
GO
USE [mutant]
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = Off;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET LEGACY_CARDINALITY_ESTIMATION = Primary;
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET MAXDOP = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = On;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET PARAMETER_SNIFFING = Primary;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = Off;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET QUERY_OPTIMIZER_HOTFIXES = Primary;
GO
USE [mutant]
GO
IF NOT EXISTS (SELECT name FROM sys.filegroups WHERE is_default=1 AND name = N'PRIMARY') ALTER DATABASE [mutant] MODIFY FILEGROUP [PRIMARY] DEFAULT
GO
--Criação das Tabelas
USE [mutant]
GO

/****** Object:  Table [dbo].[lanches]    Script Date: 31/08/2020 19:19:35 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[lanches](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[descricao] [varchar](50) NOT NULL,
 CONSTRAINT [PK_lanches] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

USE [mutant]
GO

/****** Object:  Table [dbo].[ingredientes]    Script Date: 31/08/2020 19:22:35 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[ingredientes](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[descricao] [varchar](50) NOT NULL,
	[valor] [numeric](12, 2) NOT NULL,
 CONSTRAINT [PK_ingredientes] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

USE [mutant]
GO

/****** Object:  Table [dbo].[lanche_x_ingredientes]    Script Date: 31/08/2020 19:31:23 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[lanche_x_ingredientes](
	[id_lanche] [int] NOT NULL,
	[id_ingrediente] [int] NOT NULL
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[lanche_x_ingredientes]  WITH CHECK ADD  CONSTRAINT [FK_lanche_x_ingredientes_ingredientes] FOREIGN KEY([id_ingrediente])
REFERENCES [dbo].[ingredientes] ([id])
GO

ALTER TABLE [dbo].[lanche_x_ingredientes] CHECK CONSTRAINT [FK_lanche_x_ingredientes_ingredientes]
GO

ALTER TABLE [dbo].[lanche_x_ingredientes]  WITH CHECK ADD  CONSTRAINT [FK_lanche_x_ingredientes_lanches] FOREIGN KEY([id_lanche])
REFERENCES [dbo].[lanches] ([ID])
GO

ALTER TABLE [dbo].[lanche_x_ingredientes] CHECK CONSTRAINT [FK_lanche_x_ingredientes_lanches]
GO

USE [mutant]
GO

/****** Object:  Table [dbo].[pedidos]    Script Date: 01/09/2020 15:11:02 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[pedidos](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[valor] [numeric](12, 2) NOT NULL,
 CONSTRAINT [PK_pedidos] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[pedidos]  WITH CHECK ADD  CONSTRAINT [FK_pedidos_pedidos] FOREIGN KEY([id])
REFERENCES [dbo].[pedidos] ([id])
GO

ALTER TABLE [dbo].[pedidos] CHECK CONSTRAINT [FK_pedidos_pedidos]
GO

USE [mutant]
GO

/****** Object:  Table [dbo].[pedidos_x_itens]    Script Date: 01/09/2020 15:18:18 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[pedidos_x_itens](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[id_pedido] [int] NOT NULL,
	[id_lanche] [int] NOT NULL,
	[id_ingrediente] [int] NOT NULL,
	[qt_ingrediente] [smallint] NOT NULL,
 CONSTRAINT [PK_pedidos_x_itens] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[pedidos_x_itens]  WITH CHECK ADD  CONSTRAINT [FK_pedidos_x_itens_ingredientes] FOREIGN KEY([id_ingrediente])
REFERENCES [dbo].[ingredientes] ([id])
GO

ALTER TABLE [dbo].[pedidos_x_itens] CHECK CONSTRAINT [FK_pedidos_x_itens_ingredientes]
GO

ALTER TABLE [dbo].[pedidos_x_itens]  WITH CHECK ADD  CONSTRAINT [FK_pedidos_x_itens_lanches] FOREIGN KEY([id_lanche])
REFERENCES [dbo].[lanches] ([ID])
GO

ALTER TABLE [dbo].[pedidos_x_itens] CHECK CONSTRAINT [FK_pedidos_x_itens_lanches]
GO



-- Inserts

USE [mutant]
GO

INSERT INTO dbo.lanches (descricao) VALUES ('X-Bacon')
GO
INSERT INTO dbo.lanches (descricao) VALUES ('X-Burger')
GO
INSERT INTO dbo.lanches (descricao) VALUES ('X-Egg')
GO
INSERT INTO dbo.lanches (descricao) VALUES ('X-Egg Bacon')
GO

USE [mutant]
GO

INSERT INTO dbo.ingredientes (descricao,valor) VALUES ('Alface', 0.40)
GO
INSERT INTO dbo.ingredientes (descricao,valor) VALUES ('Bacon', 2.00)
GO
INSERT INTO dbo.ingredientes (descricao,valor) VALUES ('Hambúrguer de carne', 3.00)
GO
INSERT INTO dbo.ingredientes (descricao,valor) VALUES ('Ovo', 0.80)
GO
INSERT INTO dbo.ingredientes (descricao,valor) VALUES ('Queijo',1.50)
GO

-- Criação de Procs
-- ================================================
-- Template generated from Template Explorer using:
-- Create Procedure (New Menu).SQL
--
-- Use the Specify Values for Template Parameters 
-- command (Ctrl-Shift-M) to fill in the parameter 
-- values below.
--
-- This block of comments will not be included in
-- the definition of the procedure.
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Alexandre Fernandes
-- Create date: 01/09/2020
-- Description:	Lista Lanches
-- =============================================
CREATE PROCEDURE sp_lista_lanches
	-- Add the parameters for the stored procedure here
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	DELETE
	FROM dbo.lanches
	WHERE descricao = '';
	SELECT id, descricao
	FROM dbo.lanches
	ORDER BY descricao
END
GO
--

USE [mutant]
GO

/****** Object:  StoredProcedure [dbo].[sp_lista_pedidos]    Script Date: 01/09/2020 15:44:56 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Author:		Alexandre Fernandes
-- Create date: 01/09/2020
-- Description:	Lista Pedidos
-- =============================================
CREATE PROCEDURE [dbo].[sp_lista_pedidos_itens]
	@vId as int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT cast(b.id as varchar(10)) as id, 
	       cast(b.qt_ingrediente as varchar(10)) as qt, 
		   c.descricao, 
		   cast(c.valor as varchar(12)) as valor,
		   cast(b.qt_ingrediente * c.valor as varchar(12)) as total
	FROM dbo.pedidos AS a
	INNER JOIN dbo.pedidos_x_itens AS b 
	ON (a.id=b.id_pedido)
	INNER JOIN dbo.ingredientes as c 
	ON (b.id_ingrediente = c.id)
	WHERE a.id = @vId
	ORDER BY a.id
END
GO

USE [mutant]
GO

/****** Object:  StoredProcedure [dbo].[sp_lista_pedidos_itens]    Script Date: 02/09/2020 12:59:49 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Alexandre Fernandes
-- Create date: 01/09/2020
-- Description:	Grava Ingrediente
-- =============================================
CREATE PROCEDURE dbo.sp_inserir_ingrediente
	@vDescricao as varchar(50),
	@vValor as numeric(12,2)
AS
BEGIN
	SET NOCOUNT ON;
    INSERT INTO dbo.ingredientes (descricao,valor)
	VALUES (@vDescricao,
	        @vValor)	
END
GO

USE [mutant]
GO

/****** Object:  StoredProcedure [dbo].[sp_inserir_ingrediente]    Script Date: 02/09/2020 12:59:49 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Alexandre Fernandes
-- Create date: 01/09/2020
-- Description:	Insere novo registro de lanche
-- =============================================
CREATE PROCEDURE dbo.sp_inserir_lanche
AS
BEGIN
	SET NOCOUNT ON;
    INSERT INTO dbo.lanches (descricao) VALUES (' ')	
	SELECT SCOPE_IDENTITY() AS [SCOPE_IDENTITY]
END
GO

/****** Object:  StoredProcedure [dbo].[sp_inserir_pedido]    Script Date: 02/09/2020 12:59:49 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Alexandre Fernandes
-- Create date: 01/09/2020
-- Description:	Insere novo registro de pedido
-- =============================================
CREATE PROCEDURE dbo.sp_inserir_pedido
AS
BEGIN
	SET NOCOUNT ON;
    INSERT INTO dbo.pedidos (valor) VALUES (0);	
	SELECT SCOPE_IDENTITY() AS [SCOPE_IDENTITY]
END
GO

USE [mutant]
GO

/****** Object:  StoredProcedure [dbo].[sp_lista_pedidos_itens]    Script Date: 02/09/2020 17:17:00 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



-- =============================================
-- Author:		Alexandre Fernandes
-- Create date: 01/09/2020
-- Description:	Lista Ingredientes do lanche
-- =============================================
CREATE PROCEDURE [dbo].[sp_lista_lanches_ingredientes]
	@vId as int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT cast(c.id as varchar(10)) as id, 
	       c.descricao,
		   c.valor
	FROM dbo.lanches AS a
	INNER JOIN dbo.lanche_x_ingredientes AS b 
	ON (a.id=b.id_lanche)
	INNER JOIN dbo.ingredientes as c 
	ON (b.id_ingrediente = c.id)
	WHERE a.id = @vId
	ORDER BY c.descricao
END
GO

USE [mutant]
GO

/****** Object:  StoredProcedure [dbo].[sp_atualizar_lanche]    Script Date: 03/09/2020 12:20:26 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Author:		Alexandre Fernandes
-- Create date: 01/09/2020
-- Description:	Atualiza registro de lanche
-- =============================================
CREATE PROCEDURE [dbo].[sp_atualizar_lanche]
@vId_lanche as int,
@vDescricao as varchar(50),
@vIngrediente as int
AS
BEGIN
	SET NOCOUNT ON;
    UPDATE dbo.lanches
	SET descricao = @vDescricao
	WHERE ID = @vId_lanche;
	INSERT INTO dbo.lanche_x_ingredientes (id_lanche, id_ingrediente)
	VALUES (@vId_lanche,@vIngrediente);
END
GO

USE [mutant]
GO

/****** Object:  StoredProcedure [dbo].[sp_lista_lanches]    Script Date: 03/09/2020 13:36:03 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Alexandre Fernandes
-- Create date: 01/09/2020
-- Description:	Busca Descricao do Lanche
-- =============================================
CREATE PROCEDURE [dbo].[sp_busca_lanche]
	@vId as int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    SELECT descricao
	FROM dbo.lanches
	WHERE id = @vId
END
GO

USE [mutant]
GO

/****** Object:  StoredProcedure [dbo].[sp_atualizar_lanche]    Script Date: 03/09/2020 14:55:22 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



-- =============================================
-- Author:		Alexandre Fernandes
-- Create date: 01/09/2020
-- Description:	Excluir Ingrediente Do Lanche
-- =============================================
CREATE PROCEDURE [dbo].[sp_excluir_ingrediente_lanche]
@vId_lanche as int,
@vIngrediente as int
AS
BEGIN
	SET NOCOUNT ON;
    DELETE FROM dbo.lanche_x_ingredientes 
	WHERE id_lanche = @vId_lanche
	AND id_ingrediente = @vIngrediente
END
GO

USE [mutant]
GO

/****** Object:  StoredProcedure [dbo].[sp_excluir_lanche]    Script Date: 03/09/2020 14:55:22 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Alexandre Fernandes
-- Create date: 01/09/2020
-- Description:	Excluir Lanche
-- =============================================
CREATE PROCEDURE [dbo].[sp_excluir_lanche]
@vId_lanche as int
AS
BEGIN
	SET NOCOUNT ON;
    DELETE FROM dbo.lanche_x_ingredientes 
	WHERE id_lanche = @vId_lanche;
	DELETE FROM dbo.lanches
	WHERE id = @vId_lanche;
END
GO


USE [mutant]
GO

/****** Object:  StoredProcedure [dbo].[sp_excluir_ingrediente]    Script Date: 03/09/2020 14:55:22 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Alexandre Fernandes
-- Create date: 01/09/2020
-- Description:	Excluir Ingrediente
-- =============================================
CREATE PROCEDURE [dbo].[sp_excluir_ingrediente]
@vId as int
AS
BEGIN
	SET NOCOUNT ON;
    DELETE FROM dbo.ingredientes 
	WHERE id = @vId;
END
GO

/****** Object:  StoredProcedure [dbo].[sp_inserir_pedido]    Script Date: 02/09/2020 12:59:49 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Alexandre Fernandes
-- Create date: 01/09/2020
-- Description:	Insere novo registro de pedido x Item
-- =============================================
CREATE PROCEDURE dbo.sp_inserir_pedido_x_itens
@vid_pedido as int,
@vid_lanche as int,
@vid_ingrediente as int,
@vqt_ingrediente as smallint
AS
BEGIN
	SET NOCOUNT ON;
    INSERT INTO dbo.pedidos_x_itens (id_pedido, id_lanche, id_ingrediente, qt_ingrediente) 
	VALUES (@vid_pedido, @vid_lanche, @vid_ingrediente, @vqt_ingrediente);	
END
GO

/****** Object:  StoredProcedure [dbo].[sp_atualizar_valor_pedido]    Script Date: 02/09/2020 12:59:49 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Alexandre Fernandes
-- Create date: 01/09/2020
-- Description:	Atualiza Valor do pedido
-- =============================================
CREATE PROCEDURE dbo.sp_atualizar_valor_pedido
@vid_pedido as int
AS
BEGIN
	SET NOCOUNT ON;
	DECLARE @soma numeric(12,2);
	DECLARE @soma_sem_carne_sem_queijo numeric(12,2);
	DECLARE @valor_carne numeric(12,2);
	DECLARE @valor_queijo numeric(12,2);
	DECLARE @qt_carne_original smallint;
	DECLARE @qt_queijo_original smallint;
	DECLARE @qt_carne smallint;
	DECLARE @qt_queijo smallint;
	--busca total de carne
	SET @qt_carne_original = (SELECT qt_ingrediente
	                 FROM dbo.pedidos_x_itens
					 WHERE id_ingrediente = (SELECT id
					                         FROM dbo.ingredientes
											 WHERE UPPER(descricao) LIKE '%CARNE%')
					   AND id_pedido = @vid_pedido)
	SET @qt_queijo_original = (SELECT qt_ingrediente
	                           FROM dbo.pedidos_x_itens
					           WHERE id_ingrediente = (SELECT id
					                                   FROM dbo.ingredientes
											           WHERE UPPER(descricao) LIKE '%QUEIJO%')
					   AND id_pedido = @vid_pedido)
	SET @qt_carne =  @qt_carne_original
	SET @qt_queijo =  @qt_queijo_original
	If (@qt_carne_original > 2) 
		begin
			SET @qt_carne =  @qt_carne_original - CAST(@qt_carne_original/3 as int)
		end 
	If (@qt_queijo_original > 2) 
		begin
			SET @qt_queijo =  @qt_queijo_original - CAST(@qt_queijo_original/3 as int)
		end 
	SET @soma_sem_carne_sem_queijo = (SELECT SUM(b.qt_ingrediente * c.valor) as total
						              FROM dbo.pedidos AS a
						              INNER JOIN dbo.pedidos_x_itens AS b 
						              ON (a.id=b.id_pedido)
						              INNER JOIN dbo.ingredientes as c 
						              ON (b.id_ingrediente = c	.id
						                  AND NOT UPPER(c.descricao) LIKE '%CARNE%'
						                  AND NOT UPPER(c.descricao) LIKE '%QUEIJO%')
						              WHERE a.id = @vid_pedido
						             )
	SET @valor_queijo = @qt_queijo * (SELECT valor 
									  FROM dbo.ingredientes
									  WHERE UPPER(descricao) LIKE '%QUEIJO%')
    SET @valor_carne = @qt_carne * (SELECT valor 
								    FROM dbo.ingredientes
									WHERE UPPER(descricao) LIKE '%CARNE%')
	SET @soma = @soma_sem_carne_sem_queijo + @valor_carne + @valor_queijo 

	if ((SELECT COUNT(*) FROM dbo.pedidos AS a
						INNER JOIN dbo.pedidos_x_itens AS b 
						ON (a.id=b.id_pedido)
						INNER JOIN dbo.ingredientes as c 
						ON (b.id_ingrediente = c.id
						   AND UPPER(c.descricao) LIKE '%ALFACE%')
						WHERE a.id = @vid_pedido) = 1
		AND (SELECT COUNT(*) FROM dbo.pedidos AS a
						INNER JOIN dbo.pedidos_x_itens AS b 
						ON (a.id=b.id_pedido)
						INNER JOIN dbo.ingredientes as c 
						ON (b.id_ingrediente = c.id
						   AND UPPER(c.descricao) LIKE '%BACON%')
						WHERE a.id = @vid_pedido) = 0)
		begin
			UPDATE dbo.pedidos
			SET valor = @soma * 0.9
			WHERE id = @vid_pedido
		end
	else
		begin
			UPDATE dbo.pedidos
			SET valor = @soma 
			WHERE id = @vid_pedido
		end
	--PRINT 'vid_pedido' + CAST(@vid_pedido as varchar(10))
	--PRINT 'soma - ' + CAST(@soma as varchar(10))
	--PRINT 'soma_sem_carne_sem_queijo - ' + CAST(@soma_sem_carne_sem_queijo  as varchar(10))
	--PRINT 'valor_carne - ' + CAST(@valor_carne as varchar(15))
	--PRINT 'valor_queijo - ' + CAST(@valor_queijo  as varchar(10))
	--PRINT 'qt_carne_original - ' + CAST(@qt_carne_original  as varchar(10))
	--PRINT 'qt_queijo_original - ' + CAST(@qt_queijo_original as varchar(10))
	--PRINT 'qt_carne - ' + CAST(@qt_carne  as varchar(10))
	--PRINT 'qt_queijo - ' + CAST(@qt_queijo as varchar(10))
END
