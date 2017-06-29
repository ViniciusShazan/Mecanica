CREATE TABLE [dbo].[Pecas] (
    [id]         INT          IDENTITY (1, 1) NOT NULL,
    [nome]       VARCHAR (25) NULL,
    [marca]      VARCHAR (15) NULL,
    [modelo]     VARCHAR (20) NULL,
    [preço]      INT          NULL,
    [quantidade] INT          NULL,
    [descricao]  VARCHAR (50) NULL,
    [servico_id] INT          NULL,
    CONSTRAINT [PK_Pecas] PRIMARY KEY CLUSTERED ([id] ASC)
);

