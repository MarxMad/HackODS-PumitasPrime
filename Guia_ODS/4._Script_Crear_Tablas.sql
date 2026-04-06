USE [ODS]
GO
/****** Table [PubV2].[Usuarios] ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [PubV2].[Usuarios](
	[usuClave] [nvarchar](24) NOT NULL,
	[usuContraseña] [nvarchar](8) NULL,
	[usuNombre] [nvarchar](50) NULL,
	[usuTipo] [nvarchar](1) NULL,
	[usuClaveDep] [int] NULL,
	[usuCargo] [nvarchar](100) NULL,
 CONSTRAINT [PK_Usuarios] PRIMARY KEY CLUSTERED 
(
	[usuClave] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Table [PreV2].[Usuarios] ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [PreV2].[Usuarios](
	[usuClave] [nvarchar](24) NOT NULL,
	[usuContraseña] [nvarchar](8) NULL,
	[usuNombre] [nvarchar](50) NULL,
	[usuTipo] [nvarchar](1) NULL,
	[usuClaveDep] [int] NULL,
	[usuCargo] [nvarchar](100) NULL,
 CONSTRAINT [PK_Usuarios] PRIMARY KEY CLUSTERED 
(
	[usuClave] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/******Table [ManV2].[Usuarios]******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [ManV2].[Usuarios](
	[usuClave] [nvarchar](24) NOT NULL,
	[usuContraseña] [nvarchar](8) NULL,
	[usuNombre] [nvarchar](50) NULL,
	[usuTipo] [nvarchar](1) NULL,
	[usuClaveDep] [int] NULL,
	[usuCargo] [nvarchar](100) NULL,
 CONSTRAINT [PK_Usuarios] PRIMARY KEY CLUSTERED 
(
	[usuClave] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/******Table [PubV2].[Unidad]******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [PubV2].[Unidad](
	[uniClave] [int] NOT NULL,
	[uniDescrip] [nvarchar](150) NULL,
	[uniAbrevia] [nvarchar](50) NULL,
	[uniDescripIng] [nvarchar](150) NULL,
	[uniAbreviaIng] [nvarchar](50) NULL,
 CONSTRAINT [PK_Unidad] PRIMARY KEY CLUSTERED 
(
	[uniClave] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/******Table [PreV2].[Unidad]******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [PreV2].[Unidad](
	[uniClave] [int] NOT NULL,
	[uniDescrip] [nvarchar](150) NULL,
	[uniAbrevia] [nvarchar](50) NULL,
	[uniDescripIng] [nvarchar](150) NULL,
	[uniAbreviaIng] [nvarchar](50) NULL,
 CONSTRAINT [PK_Unidad] PRIMARY KEY CLUSTERED 
(
	[uniClave] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/******Table [ManV2].[Unidad]******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [ManV2].[Unidad](
	[uniClave] [int] NOT NULL,
	[uniDescrip] [nvarchar](150) NULL,
	[uniAbrevia] [nvarchar](50) NULL,
	[uniDescripIng] [nvarchar](150) NULL,
	[uniAbreviaIng] [nvarchar](50) NULL,
 CONSTRAINT [PK_Unidad] PRIMARY KEY CLUSTERED 
(
	[uniClave] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/******Table [PubV2].[TipoIndicador]******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [PubV2].[TipoIndicador](
	[tatrCve] [nvarchar](1) NOT NULL,
	[tatrDescripP] [nvarchar](255) NULL,
	[tatrDescripS] [nvarchar](255) NULL,
	[tatrInforme] [nvarchar](255) NULL,
	[tatrDescripPIng] [nvarchar](255) NULL,
	[tatrDescripSIng] [nvarchar](255) NULL,
	[tatrInformeIng] [nvarchar](255) NULL,
 CONSTRAINT [PK_TipoIndicador] PRIMARY KEY CLUSTERED 
(
	[tatrCve] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/******Table [PreV2].[TipoIndicador]******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [PreV2].[TipoIndicador](
	[tatrCve] [nvarchar](2) NOT NULL,
	[tatrDescripP] [nvarchar](255) NULL,
	[tatrDescripS] [nvarchar](255) NULL,
	[tatrInforme] [nvarchar](255) NULL,
	[tatrDescripPIng] [nvarchar](255) NULL,
	[tatrDescripSIng] [nvarchar](255) NULL,
	[tatrInformeIng] [nvarchar](255) NULL,
 CONSTRAINT [PK_TipoIndicador] PRIMARY KEY CLUSTERED 
(
	[tatrCve] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/******Table [ManV2].[TipoIndicador]******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [ManV2].[TipoIndicador](
	[tatrCve] [nvarchar](1) NOT NULL,
	[tatrDescripP] [nvarchar](255) NULL,
	[tatrDescripS] [nvarchar](255) NULL,
	[tatrInforme] [nvarchar](255) NULL,
	[tatrDescripPIng] [nvarchar](255) NULL,
	[tatrDescripSIng] [nvarchar](255) NULL,
	[tatrInformeIng] [nvarchar](255) NULL,
 CONSTRAINT [PK_TipoIndicador] PRIMARY KEY CLUSTERED 
(
	[tatrCve] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/******Table [PubV2].[TipoCobGeo]******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [PubV2].[TipoCobGeo](
	[tcgClave] [int] NOT NULL,
	[tcgDescrip] [nvarchar](255) NULL,
	[tcgDescripIng] [nvarchar](255) NULL,
	[tcgCveAPIMapa] [nvarchar](5) NULL,
	[tcgCodigo] [nvarchar](10) NULL,
	[tcgCodigoINg] [nvarchar](10) NULL,
 CONSTRAINT [PK_TipoCobGeo] PRIMARY KEY CLUSTERED 
(
	[tcgClave] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/******Table [PreV2].[TipoCobGeo] ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [PreV2].[TipoCobGeo](
	[tcgClave] [int] NOT NULL,
	[tcgDescrip] [nvarchar](255) NULL,
	[tcgDescripIng] [nvarchar](255) NULL,
	[tcgCveAPIMapa] [nvarchar](5) NULL,
	[tcgCodigo] [nvarchar](10) NULL,
	[tcgCodigoINg] [nvarchar](10) NULL,
 CONSTRAINT [PK_TipoCobGeo] PRIMARY KEY CLUSTERED 
(
	[tcgClave] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/******Table [ManV2].[TipoCobGeo]******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [ManV2].[TipoCobGeo](
	[tcgClave] [int] NOT NULL,
	[tcgDescrip] [nvarchar](255) NULL,
	[tcgDescripIng] [nvarchar](255) NULL,
	[tcgCveAPIMapa] [nvarchar](5) NULL,
	[tcgCodigo] [nvarchar](10) NULL,
	[tcgCodigoINg] [nvarchar](10) NULL,
 CONSTRAINT [PK_TipoCobGeo] PRIMARY KEY CLUSTERED 
(
	[tcgClave] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/******Table [PubV2].[Temas]******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [PubV2].[Temas](
	[temClave] [nvarchar](3) NOT NULL,
	[temDescrip] [nvarchar](255) NULL,
	[temClaveMet] [int] NULL,
	[temDescripIng] [nvarchar](255) NULL,
 CONSTRAINT [PK_Temas] PRIMARY KEY CLUSTERED 
(
	[temClave] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/******Table [PreV2].[Temas]******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [PreV2].[Temas](
	[temClave] [nvarchar](3) NOT NULL,
	[temDescrip] [nvarchar](255) NULL,
	[temClaveMet] [int] NULL,
	[temDescripIng] [nvarchar](255) NULL,
 CONSTRAINT [PK_Temas] PRIMARY KEY CLUSTERED 
(
	[temClave] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/******Table [ManV2].[Temas]******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [ManV2].[Temas](
	[temClave] [nvarchar](3) NOT NULL,
	[temDescrip] [nvarchar](255) NULL,
	[temClaveMet] [int] NULL,
	[temDescripIng] [nvarchar](255) NULL,
 CONSTRAINT [PK_Temas] PRIMARY KEY CLUSTERED 
(
	[temClave] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/******Table [PubV2].[SitioRel]******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [PubV2].[SitioRel](
	[srClaveTem] [nvarchar](3) NULL,
	[srClaveSitio] [int] NULL,
	[srDescrip] [nvarchar](255) NULL,
	[srURL] [nvarchar](255) NULL
) ON [PRIMARY]
GO
/******Table [PreV2].[SitioRel]******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [PreV2].[SitioRel](
	[srClaveTem] [nvarchar](3) NULL,
	[srClaveSitio] [int] NULL,
	[srDescrip] [nvarchar](255) NULL,
	[srURL] [nvarchar](255) NULL
) ON [PRIMARY]
GO
/******Table [ManV2].[SitioRel]******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [ManV2].[SitioRel](
	[srClaveTem] [nvarchar](3) NULL,
	[srClaveSitio] [int] NULL,
	[srDescrip] [nvarchar](255) NULL,
	[srURL] [nvarchar](255) NULL
) ON [PRIMARY]
GO
CREATE UNIQUE CLUSTERED INDEX [FK_SitioRel] ON [ManV2].[SitioRel] 
(
	[srClaveTem] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/******Table [PubV2].[Serie]******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [PubV2].[Serie](
	[serCveCobAgrupAnt] [nvarchar](12) NULL,
	[serCveClaAgrup] [nvarchar](30) NOT NULL,
	[serClave] [int] NOT NULL,
	[serAADato] [int] NOT NULL,
	[serMMDato] [int] NOT NULL,
	[serDDDato] [int] NOT NULL,
	[serDato] [float] NULL,
	[serNoDato] [int] NULL,
	[serNota] [int] NULL,
	[serLeyenda] [nvarchar](255) NULL,
	[serLeyendaIng] [nvarchar](255) NULL,
	[serCveCobAgrup] [nvarchar](20) NOT NULL,
 CONSTRAINT [PK_Serie] PRIMARY KEY CLUSTERED 
(
	[serCveCobAgrup] ASC,
	[serCveClaAgrup] ASC,
	[serClave] ASC,
	[serAADato] ASC,
	[serMMDato] ASC,
	[serDDDato] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/******Table [PreV2].[Serie]******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [PreV2].[Serie](
	[serCveCobAgrupAnt] [nvarchar](12) NULL,
	[serCveClaAgrup] [nvarchar](30) NOT NULL,
	[serClave] [int] NOT NULL,
	[serAADato] [int] NOT NULL,
	[serMMDato] [int] NOT NULL,
	[serDDDato] [int] NOT NULL,
	[serDato] [float] NULL,
	[serNoDato] [int] NULL,
	[serNota] [int] NULL,
	[serLeyenda] [nvarchar](255) NULL,
	[serLeyendaIng] [nvarchar](255) NULL,
	[serCveCobAgrup] [nvarchar](20) NOT NULL,
 CONSTRAINT [PK_Serie] PRIMARY KEY CLUSTERED 
(
	[serCveCobAgrup] ASC,
	[serCveClaAgrup] ASC,
	[serClave] ASC,
	[serAADato] ASC,
	[serMMDato] ASC,
	[serDDDato] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/******Table [ManV2].[Serie]******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [ManV2].[Serie](
	[serCveCobAgrupAnt] [nvarchar](12) NULL,
	[serCveClaAgrup] [nvarchar](30) NOT NULL,
	[serClave] [int] NOT NULL,
	[serAADato] [int] NOT NULL,
	[serMMDato] [int] NOT NULL,
	[serDDDato] [int] NOT NULL,
	[serDato] [float] NULL,
	[serNoDato] [int] NULL,
	[serNota] [int] NULL,
	[serLeyenda] [nvarchar](255) NULL,
	[serLeyendaIng] [nvarchar](255) NULL,
	[serCveCobAgrup] [nvarchar](20) NOT NULL,
 CONSTRAINT [PK_Serie] PRIMARY KEY CLUSTERED 
(
	[serCveCobAgrup] ASC,
	[serCveClaAgrup] ASC,
	[serClave] ASC,
	[serAADato] ASC,
	[serMMDato] ASC,
	[serDDDato] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/******Table [PubV2].[SDMX]******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [PubV2].[SDMX](
	[sdmxCod] [nvarchar](50) NULL,
	[sdmxDescrip] [nvarchar](max) NULL,
	[sdmxCodInd] [nvarchar](max) NULL,
	[sdmxCodDescrip] [nvarchar](max) NULL,
	[sdmxArea] [nvarchar](max) NULL,
	[sdmxFrec] [nvarchar](max) NULL,
	[sdmxPrelim] [nvarchar](max) NULL,
	[sdmxRev] [nvarchar](max) NULL,
	[sdmxEst] [nvarchar](max) NULL,
	[sdmxUnidad] [nvarchar](max) NULL,
	[sdmxngpo1] [nvarchar](max) NULL,
	[sdmxdesclas1] [nvarchar](max) NULL,
	[sdmxngpo2] [nvarchar](max) NULL,
	[sdmxdesclas2] [nvarchar](max) NULL,
	[sdmxngpo3] [nvarchar](max) NULL,
	[sdmxdesclas3] [nvarchar](max) NULL,
	[sdmxngpo4] [nvarchar](max) NULL,
	[sdmxdesclas4] [nvarchar](max) NULL
) ON [PRIMARY]
GO

/****** Table [PubV2].[RefInter]******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [PubV2].[RefInter](
	[riClave] [int] NOT NULL,
	[riDescrip] [nvarchar](max) NULL,
	[riDescripIng] [nvarchar](max) NULL,
 CONSTRAINT [PK_RefInter] PRIMARY KEY CLUSTERED 
(
	[riClave] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/******Table [PreV2].[RefInter]******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [PreV2].[RefInter](
	[riClave] [int] NOT NULL,
	[riDescrip] [nvarchar](max) NULL,
	[riDescripIng] [nvarchar](max) NULL,
 CONSTRAINT [PK_RefInter] PRIMARY KEY CLUSTERED 
(
	[riClave] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [ManV2].[RefInter]    Script Date: 01/15/2020 16:57:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [ManV2].[RefInter](
	[riClave] [int] NOT NULL,
	[riDescrip] [nvarchar](max) NULL,
	[riDescripIng] [nvarchar](max) NULL,
 CONSTRAINT [PK_RefInter] PRIMARY KEY CLUSTERED 
(
	[riClave] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/******Table [PubV2].[Periodo]******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [PubV2].[Periodo](
	[perClave] [int] NOT NULL,
	[perDescrip] [nvarchar](255) NULL,
	[perAbrevia] [nvarchar](255) NULL,
	[perDescripIng] [nvarchar](255) NULL,
	[perAbreviaIng] [nvarchar](255) NULL,
 CONSTRAINT [PK_Periodo] PRIMARY KEY CLUSTERED 
(
	[perClave] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/******Table [PreV2].[Periodo] ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [PreV2].[Periodo](
	[perClave] [int] NOT NULL,
	[perDescrip] [nvarchar](255) NULL,
	[perAbrevia] [nvarchar](255) NULL,
	[perDescripIng] [nvarchar](255) NULL,
	[perAbreviaIng] [nvarchar](255) NULL,
 CONSTRAINT [PK_Periodo] PRIMARY KEY CLUSTERED 
(
	[perClave] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/******Table [ManV2].[Periodo]******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [ManV2].[Periodo](
	[perClave] [int] NOT NULL,
	[perDescrip] [nvarchar](255) NULL,
	[perAbrevia] [nvarchar](255) NULL,
	[perDescripIng] [nvarchar](255) NULL,
	[perAbreviaIng] [nvarchar](255) NULL,
 CONSTRAINT [PK_Periodo] PRIMARY KEY CLUSTERED 
(
	[perClave] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/******Table [PubV2].[Notas]******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [PubV2].[Notas](
	[notClave] [int] NOT NULL,
	[NotNota] [nvarchar](max) NULL,
	[NotNotaIng] [nvarchar](max) NULL,
 CONSTRAINT [PK_Notas] PRIMARY KEY CLUSTERED 
(
	[notClave] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Table [PreV2].[Notas] ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [PreV2].[Notas](
	[notClave] [int] NOT NULL,
	[NotNota] [nvarchar](max) NULL,
	[NotNotaIng] [nvarchar](max) NULL,
 CONSTRAINT [PK_Notas] PRIMARY KEY CLUSTERED 
(
	[notClave] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/******Table [ManV2].[Notas]******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [ManV2].[Notas](
	[notClave] [int] NOT NULL,
	[NotNota] [nvarchar](max) NULL,
	[NotNotaIng] [nvarchar](max) NULL,
 CONSTRAINT [PK_Notas] PRIMARY KEY CLUSTERED 
(
	[notClave] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/******Table [PubV2].[NoDato]******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [PubV2].[NoDato](
	[ndClave] [int] NOT NULL,
	[ndCodigo] [nvarchar](3) NULL,
	[ndDescrip] [nvarchar](100) NULL,
	[ndDescripIng] [nvarchar](100) NULL,
	[ndCodigoIng] [nvarchar](3) NULL,
	[ndCodigoMapa] [smallint] NULL,
 CONSTRAINT [PK_NoDato] PRIMARY KEY CLUSTERED 
(
	[ndClave] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/******Table [PreV2].[NoDato]******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [PreV2].[NoDato](
	[ndClave] [int] NOT NULL,
	[ndCodigo] [nvarchar](3) NULL,
	[ndDescrip] [nvarchar](100) NULL,
	[ndDescripIng] [nvarchar](100) NULL,
	[ndCodigoIng] [nvarchar](3) NULL,
	[ndCodigoMapa] [smallint] NULL,
 CONSTRAINT [PK_NoDato] PRIMARY KEY CLUSTERED 
(
	[ndClave] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/******Table [ManV2].[NoDato]******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [ManV2].[NoDato](
	[ndClave] [int] NOT NULL,
	[ndCodigo] [nvarchar](3) NULL,
	[ndDescrip] [nvarchar](100) NULL,
	[ndDescripIng] [nvarchar](100) NULL,
	[ndCodigoIng] [nvarchar](3) NULL,
	[ndCodigoMapa] [smallint] NULL,
 CONSTRAINT [PK_NoDato] PRIMARY KEY CLUSTERED 
(
	[ndClave] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/******Table [PubV2].[Movimientos]******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [PubV2].[Movimientos](
	[movClave] [bigint] IDENTITY(1,1) NOT NULL,
	[movUsuario] [nvarchar](24) NULL,
	[movFecha] [nchar](10) NULL,
	[movHora] [nvarchar](50) NULL,
	[movSQL] [nvarchar](max) NULL,
	[movIndicador] [int] NULL,
	[movCatalogo] [nvarchar](30) NULL,
	[movComentario] [nvarchar](max) NULL,
	[movEstatus] [varchar](1) NULL,
	[movIP] [nvarchar](20) NULL,
 CONSTRAINT [PK_Movimientos] PRIMARY KEY CLUSTERED 
(
	[movClave] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/******Table [PreV2].[Movimientos]******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [PreV2].[Movimientos](
	[movClave] [bigint] NOT NULL,
	[movUsuario] [nvarchar](24) NULL,
	[movFecha] [nchar](10) NULL,
	[movHora] [nvarchar](50) NULL,
	[movSQL] [nvarchar](max) NULL,
	[movIndicador] [int] NULL,
	[movCatalogo] [nvarchar](30) NULL,
	[movComentario] [nvarchar](max) NULL,
	[movEstatus] [varchar](1) NULL,
	[movIP] [nvarchar](20) NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/******Table [ManV2].[Movimientos]******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [ManV2].[Movimientos](
	[movClave] [bigint] IDENTITY(1,1) NOT NULL,
	[movUsuario] [nvarchar](24) NULL,
	[movFecha] [nchar](10) NULL,
	[movHora] [nvarchar](50) NULL,
	[movSQL] [nvarchar](max) NULL,
	[movIndicador] [int] NULL,
	[movCatalogo] [nvarchar](30) NULL,
	[movComentario] [nvarchar](max) NULL,
	[movEstatus] [varchar](1) NULL,
	[movIP] [nvarchar](20) NULL,
 CONSTRAINT [PK_Movimientos] PRIMARY KEY CLUSTERED 
(
	[movClave] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/******Table [PubV2].[Metadato]******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [PubV2].[Metadato](
	[metClave] [int] NOT NULL,
	[metDescrip] [nvarchar](max) NULL,
	[metDescripIng] [nvarchar](max) NULL,
 CONSTRAINT [PK_Metadato] PRIMARY KEY CLUSTERED 
(
	[metClave] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/******Table [PreV2].[Metadato]******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [PreV2].[Metadato](
	[metClave] [int] NOT NULL,
	[metDescrip] [nvarchar](max) NULL,
	[metDescripIng] [nvarchar](max) NULL,
 CONSTRAINT [PK_Metadato] PRIMARY KEY CLUSTERED 
(
	[metClave] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Table [ManV2].[Metadato]******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [ManV2].[Metadato](
	[metClave] [int] NOT NULL,
	[metDescrip] [nvarchar](max) NULL,
	[metDescripIng] [nvarchar](max) NULL,
 CONSTRAINT [PK_Metadato] PRIMARY KEY CLUSTERED 
(
	[metClave] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Table [PubV2].[LexicoPCveIng]******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [PubV2].[LexicoPCveIng](
	[lpcPalabraCveIng] [nvarchar](30) NOT NULL,
	[lpcClavePalCveIng] [int] NOT NULL,
 CONSTRAINT [PK_LexicoPCveIng] PRIMARY KEY CLUSTERED 
(
	[lpcPalabraCveIng] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/******Table [PreV2].[LexicoPCveIng]******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [PreV2].[LexicoPCveIng](
	[lpcPalabraCveIng] [nvarchar](30) NOT NULL,
	[lpcClavePalCveIng] [int] NOT NULL,
 CONSTRAINT [PK_LexicoPCveIng] PRIMARY KEY CLUSTERED 
(
	[lpcPalabraCveIng] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Table [ManV2].[LexicoPCveIng]******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [ManV2].[LexicoPCveIng](
	[lpcPalabraCveIng] [nvarchar](30) NOT NULL,
	[lpcClavePalCveIng] [int] NOT NULL,
 CONSTRAINT [PK_LexicoPCveIng] PRIMARY KEY CLUSTERED 
(
	[lpcPalabraCveIng] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/******Table [PubV2].[LexicoPCve]******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [PubV2].[LexicoPCve](
	[lpcPalabraCve] [nvarchar](30) NOT NULL,
	[lpcClavePalCve] [int] NOT NULL,
 CONSTRAINT [PK_LexicoPCve] PRIMARY KEY CLUSTERED 
(
	[lpcPalabraCve] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/******Table [PreV2].[LexicoPCve]******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [PreV2].[LexicoPCve](
	[lpcPalabraCve] [nvarchar](30) NOT NULL,
	[lpcClavePalCve] [int] NOT NULL,
 CONSTRAINT [PK_LexicoPCve] PRIMARY KEY CLUSTERED 
(
	[lpcPalabraCve] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/******Table [ManV2].[LexicoPCve]******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [ManV2].[LexicoPCve](
	[lpcPalabraCve] [nvarchar](30) NOT NULL,
	[lpcClavePalCve] [int] NOT NULL,
 CONSTRAINT [PK_LexicoPCve] PRIMARY KEY CLUSTERED 
(
	[lpcPalabraCve] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/******Table [PubV2].[LexicoING]******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [PubV2].[LexicoING](
	[lexPalabraIng] [nvarchar](30) NOT NULL,
	[lexClavePalabraIng] [int] NOT NULL,
 CONSTRAINT [PK_LexicoING] PRIMARY KEY CLUSTERED 
(
	[lexPalabraIng] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/******Table [PreV2].[LexicoING]******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [PreV2].[LexicoING](
	[lexPalabraIng] [nvarchar](30) NOT NULL,
	[lexClavePalabraIng] [int] NOT NULL,
 CONSTRAINT [PK_LexicoING] PRIMARY KEY CLUSTERED 
(
	[lexPalabraIng] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/******Table [ManV2].[LexicoING]******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [ManV2].[LexicoING](
	[lexPalabraIng] [nvarchar](30) NOT NULL,
	[lexClavePalabraIng] [int] NOT NULL,
 CONSTRAINT [PK_LexicoING] PRIMARY KEY CLUSTERED 
(
	[lexPalabraIng] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Table [PubV2].[Lexico]******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [PubV2].[Lexico](
	[lexPalabra] [nvarchar](30) NOT NULL,
	[lexClavePalabra] [int] NOT NULL,
 CONSTRAINT [PK_Lexico_1] PRIMARY KEY CLUSTERED 
(
	[lexPalabra] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
CREATE UNIQUE NONCLUSTERED INDEX [lexClavePalabra] ON [PubV2].[Lexico] 
(
	[lexClavePalabra] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/******Table [PreV2].[Lexico]******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [PreV2].[Lexico](
	[lexPalabra] [nvarchar](30) NOT NULL,
	[lexClavePalabra] [int] NOT NULL,
 CONSTRAINT [PK_Lexico_1] PRIMARY KEY CLUSTERED 
(
	[lexPalabra] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
CREATE UNIQUE NONCLUSTERED INDEX [lexClavePalabra] ON [PreV2].[Lexico] 
(
	[lexClavePalabra] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/******Table [ManV2].[Lexico]******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [ManV2].[Lexico](
	[lexPalabra] [nvarchar](30) NOT NULL,
	[lexClavePalabra] [int] NOT NULL,
 CONSTRAINT [PK_Lexico_1] PRIMARY KEY CLUSTERED 
(
	[lexPalabra] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
CREATE UNIQUE NONCLUSTERED INDEX [lexClavePalabra] ON [ManV2].[Lexico] 
(
	[lexClavePalabra] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/******Table [PubV2].[Institucion]******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [PubV2].[Institucion](
	[insClave] [int] NOT NULL,
	[insDescrip] [nvarchar](255) NULL,
	[insURL] [nvarchar](255) NULL,
	[insAbrevia] [nvarchar](50) NULL,
	[insDescripIng] [nvarchar](255) NULL,
	[insAbreviaIng] [nvarchar](50) NULL,
 CONSTRAINT [PK_Institucion] PRIMARY KEY CLUSTERED 
(
	[insClave] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/******Table [PreV2].[Institucion]******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [PreV2].[Institucion](
	[insClave] [int] NOT NULL,
	[insDescrip] [nvarchar](255) NULL,
	[insURL] [nvarchar](255) NULL,
	[insAbrevia] [nvarchar](50) NULL,
	[insDescripIng] [nvarchar](255) NULL,
	[insAbreviaIng] [nvarchar](50) NULL,
 CONSTRAINT [PK_Institucion] PRIMARY KEY CLUSTERED 
(
	[insClave] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Table [ManV2].[Institucion] ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [ManV2].[Institucion](
	[insClave] [int] NOT NULL,
	[insDescrip] [nvarchar](255) NULL,
	[insURL] [nvarchar](255) NULL,
	[insAbrevia] [nvarchar](50) NULL,
	[insDescripIng] [nvarchar](255) NULL,
	[insAbreviaIng] [nvarchar](50) NULL,
 CONSTRAINT [PK_Institucion] PRIMARY KEY CLUSTERED 
(
	[insClave] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/******Table [PubV2].[Grupo]******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [PubV2].[Grupo](
	[gpoClave] [int] NOT NULL,
	[gpoDescrip] [nvarchar](255) NULL,
	[gpoDescripIng] [nvarchar](255) NULL,
	[gpoAlias] [nvarchar](255) NULL,
	[gpoAliasIng] [nvarchar](255) NULL,
 CONSTRAINT [PK_Grupo] PRIMARY KEY CLUSTERED 
(
	[gpoClave] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/******Table [PreV2].[Grupo] ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [PreV2].[Grupo](
	[gpoClave] [int] NOT NULL,
	[gpoDescrip] [nvarchar](255) NULL,
	[gpoDescripIng] [nvarchar](255) NULL,
	[gpoAlias] [nvarchar](255) NULL,
	[gpoAliasIng] [nvarchar](255) NULL,
 CONSTRAINT [PK_Grupo] PRIMARY KEY CLUSTERED 
(
	[gpoClave] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/******Table [ManV2].[Grupo] ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [ManV2].[Grupo](
	[gpoClave] [int] NOT NULL,
	[gpoDescrip] [nvarchar](255) NULL,
	[gpoDescripIng] [nvarchar](255) NULL,
	[gpoAlias] [nvarchar](255) NULL,
	[gpoAliasIng] [nvarchar](255) NULL,
 CONSTRAINT [PK_Grupo] PRIMARY KEY CLUSTERED 
(
	[gpoClave] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/******Table [PubV2].[Grafica] ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [PubV2].[Grafica](
	[graClave] [smallint] NOT NULL,
	[graDescrip] [nvarchar](50) NULL,
	[graAbrevia] [nchar](10) NULL,
	[graDescripIng] [nvarchar](50) NULL,
	[graAbreviaIng] [nchar](10) NULL,
 CONSTRAINT [PK_Grafica_1] PRIMARY KEY CLUSTERED 
(
	[graClave] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/******Table [PreV2].[Grafica] ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [PreV2].[Grafica](
	[graClave] [smallint] NOT NULL,
	[graDescrip] [nvarchar](50) NULL,
	[graAbrevia] [nchar](10) NULL,
	[graDescripIng] [nvarchar](50) NULL,
	[graAbreviaIng] [nchar](10) NULL,
 CONSTRAINT [PK_Grafica] PRIMARY KEY CLUSTERED 
(
	[graClave] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Table [ManV2].[Grafica] ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [ManV2].[Grafica](
	[graClave] [smallint] NOT NULL,
	[graDescrip] [nvarchar](50) NULL,
	[graAbrevia] [nchar](10) NULL,
	[graDescripIng] [nvarchar](50) NULL,
	[graAbreviaIng] [nchar](10) NULL,
 CONSTRAINT [PK_Grafica_1] PRIMARY KEY CLUSTERED 
(
	[graClave] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Table [PubV2].[Fuentes] ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [PubV2].[Fuentes](
	[fueClave] [int] NOT NULL,
	[fueDescrip] [nvarchar](max) NOT NULL,
	[fueDescripIng] [nvarchar](max) NULL,
 CONSTRAINT [PK_Fuentes] PRIMARY KEY CLUSTERED 
(
	[fueClave] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Table [PreV2].[Fuentes]******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [PreV2].[Fuentes](
	[fueClave] [int] NOT NULL,
	[fueDescrip] [nvarchar](max) NOT NULL,
	[fueDescripIng] [nvarchar](max) NULL,
 CONSTRAINT [PK_Fuentes] PRIMARY KEY CLUSTERED 
(
	[fueClave] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Table [ManV2].[Fuentes]******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [ManV2].[Fuentes](
	[fueClave] [int] NOT NULL,
	[fueDescrip] [nvarchar](max) NOT NULL,
	[fueDescripIng] [nvarchar](max) NULL,
 CONSTRAINT [PK_Fuentes] PRIMARY KEY CLUSTERED 
(
	[fueClave] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/******Table [PubV2].[FTCob] ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [PubV2].[FTCob](
	[fcgClave] [int] NOT NULL,
	[fcgDescrip] [nvarchar](255) NULL,
	[fcgDescripIng] [nvarchar](255) NULL,
	[fcgAbrevia] [varchar](10) NULL,
	[fcgAbreviaIng] [varchar](10) NULL,
 CONSTRAINT [PK_FTCob] PRIMARY KEY CLUSTERED 
(
	[fcgClave] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/******Table [PreV2].[FTCob] ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [PreV2].[FTCob](
	[fcgClave] [int] NOT NULL,
	[fcgDescrip] [nvarchar](255) NULL,
	[fcgDescripIng] [nvarchar](255) NULL,
	[fcgAbrevia] [varchar](10) NULL,
	[fcgAbreviaIng] [varchar](10) NULL,
 CONSTRAINT [PK_FTCob] PRIMARY KEY CLUSTERED 
(
	[fcgClave] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/******Table [ManV2].[FTCob] ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [ManV2].[FTCob](
	[fcgClave] [int] NOT NULL,
	[fcgDescrip] [nvarchar](255) NULL,
	[fcgDescripIng] [nvarchar](255) NULL,
	[fcgAbrevia] [varchar](10) NULL,
	[fcgAbreviaIng] [varchar](10) NULL,
 CONSTRAINT [PK_FTCob] PRIMARY KEY CLUSTERED 
(
	[fcgClave] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/******Table [PubV2].[Frecuencia] ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [PubV2].[Frecuencia](
	[freClave] [int] NOT NULL,
	[freDescrip] [nvarchar](50) NULL,
	[freCodigo] [nvarchar](2) NULL,
	[freNumAA] [int] NULL,
	[freNumMM] [int] NULL,
	[freNumQQ] [int] NULL,
	[freTipo] [nvarchar](1) NULL,
	[freDescripIng] [nvarchar](50) NULL,
 CONSTRAINT [PK_Frecuencia] PRIMARY KEY CLUSTERED 
(
	[freClave] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Table [PreV2].[Frecuencia] ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [PreV2].[Frecuencia](
	[freClave] [int] NOT NULL,
	[freDescrip] [nvarchar](50) NULL,
	[freCodigo] [nvarchar](2) NULL,
	[freNumAA] [int] NULL,
	[freNumMM] [int] NULL,
	[freNumQQ] [int] NULL,
	[freTipo] [nvarchar](1) NULL,
	[freDescripIng] [nvarchar](50) NULL,
 CONSTRAINT [PK_Frecuencia] PRIMARY KEY CLUSTERED 
(
	[freClave] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/******Table [ManV2].[Frecuencia]******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [ManV2].[Frecuencia](
	[freClave] [int] NOT NULL,
	[freDescrip] [nvarchar](50) NULL,
	[freCodigo] [nvarchar](2) NULL,
	[freNumAA] [int] NULL,
	[freNumMM] [int] NULL,
	[freNumQQ] [int] NULL,
	[freTipo] [nvarchar](1) NULL,
	[freDescripIng] [nvarchar](50) NULL,
 CONSTRAINT [PK_Frecuencia] PRIMARY KEY CLUSTERED 
(
	[freClave] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Table [PubV2].[FichaTecnica] ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [PubV2].[FichaTecnica](
	[ftClave] [int] NOT NULL,
	[ftDefinicion] [nvarchar](max) NULL,
	[ftAlgoritmo] [nvarchar](30) NULL,
	[ftUnidad] [int] NULL,
	[ftImportancia] [nvarchar](max) NULL,
	[ftCobGeo] [nvarchar](9) NULL,
	[ftPeriodo] [int] NULL,
	[ftFecEsp] [nvarchar](255) NULL,
	[ftObs] [nvarchar](max) NULL,
	[ftDefinicionIng] [nvarchar](max) NULL,
	[ftImportanciaIng] [nvarchar](max) NULL,
	[ftObsIng] [nvarchar](max) NULL,
	[ftFecEspIng] [nvarchar](255) NULL,
	[ftDescripCal] [nvarchar](max) NULL,
	[ftDescripCalIng] [nvarchar](max) NULL,
	[ftOportunidad] [nvarchar](255) NULL,
	[ftOportunidadIng] [nvarchar](255) NULL,
	[ftCobGeoft] [int] NULL,
	[ftAlgoritmoIng] [nvarchar](30) NULL,
 CONSTRAINT [PK_FichaTecnica] PRIMARY KEY CLUSTERED 
(
	[ftClave] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Table [PreV2].[FichaTecnica]******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [PreV2].[FichaTecnica](
	[ftClave] [int] NOT NULL,
	[ftDefinicion] [nvarchar](max) NULL,
	[ftAlgoritmo] [nvarchar](30) NULL,
	[ftUnidad] [int] NULL,
	[ftImportancia] [nvarchar](max) NULL,
	[ftCobGeo] [nvarchar](9) NULL,
	[ftPeriodo] [int] NULL,
	[ftFecEsp] [nvarchar](255) NULL,
	[ftObs] [nvarchar](max) NULL,
	[ftDefinicionIng] [nvarchar](max) NULL,
	[ftImportanciaIng] [nvarchar](max) NULL,
	[ftObsIng] [nvarchar](max) NULL,
	[ftFecEspIng] [nvarchar](255) NULL,
	[ftDescripCal] [nvarchar](max) NULL,
	[ftDescripCalIng] [nvarchar](max) NULL,
	[ftOportunidad] [nvarchar](255) NULL,
	[ftOportunidadIng] [nvarchar](255) NULL,
	[ftCobGeoft] [int] NULL,
	[ftAlgoritmoIng] [nvarchar](30) NULL,
 CONSTRAINT [PK_FichaTecnica] PRIMARY KEY CLUSTERED 
(
	[ftClave] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/******Table [ManV2].[FichaTecnica]  ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [ManV2].[FichaTecnica](
	[ftClave] [int] NOT NULL,
	[ftDefinicion] [nvarchar](max) NULL,
	[ftAlgoritmo] [nvarchar](30) NULL,
	[ftUnidad] [int] NULL,
	[ftImportancia] [nvarchar](max) NULL,
	[ftCobGeo] [nvarchar](9) NULL,
	[ftPeriodo] [int] NULL,
	[ftFecEsp] [nvarchar](255) NULL,
	[ftObs] [nvarchar](max) NULL,
	[ftDefinicionIng] [nvarchar](max) NULL,
	[ftImportanciaIng] [nvarchar](max) NULL,
	[ftObsIng] [nvarchar](max) NULL,
	[ftFecEspIng] [nvarchar](255) NULL,
	[ftDescripCal] [nvarchar](max) NULL,
	[ftDescripCalIng] [nvarchar](max) NULL,
	[ftOportunidad] [nvarchar](255) NULL,
	[ftOportunidadIng] [nvarchar](255) NULL,
	[ftCobGeoft] [int] NULL,
	[ftAlgoritmoIng] [nvarchar](30) NULL,
 CONSTRAINT [PK_FichaTecnica] PRIMARY KEY CLUSTERED 
(
	[ftClave] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/******Table [PubV2].[FecAct] ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [PubV2].[FecAct](
	[faClave] [int] NULL,
	[faDescrip] [nvarchar](255) NULL
) ON [PRIMARY]
GO
/******Table [PreV2].[FecAct] ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [PreV2].[FecAct](
	[faClave] [int] NULL,
	[faDescrip] [nvarchar](255) NULL
) ON [PRIMARY]
GO
/******Table [ManV2].[FecAct] ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [ManV2].[FecAct](
	[faClave] [int] NULL,
	[faDescrip] [nvarchar](255) NULL
) ON [PRIMARY]
GO
CREATE UNIQUE CLUSTERED INDEX [FK_FecAct] ON [ManV2].[FecAct] 
(
	[faClave] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Table [PubV2].[Estatus] ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [PubV2].[Estatus](
	[estClave] [int] NOT NULL,
	[estDescrip] [nvarchar](255) NULL,
	[estNomImg] [nvarchar](50) NULL,
	[estDescripIng] [nvarchar](255) NULL,
	[estColor] [nvarchar](11) NULL,
 CONSTRAINT [PK_Estatus] PRIMARY KEY CLUSTERED 
(
	[estClave] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/******Table [PreV2].[Estatus]******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [PreV2].[Estatus](
	[estClave] [int] NOT NULL,
	[estDescrip] [nvarchar](255) NULL,
	[estNomImg] [nvarchar](50) NULL,
	[estDescripIng] [nvarchar](255) NULL,
	[estColor] [nvarchar](11) NULL,
 CONSTRAINT [PK_Estatus] PRIMARY KEY CLUSTERED 
(
	[estClave] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/******Table [ManV2].[Estatus] ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [ManV2].[Estatus](
	[estClave] [int] NOT NULL,
	[estDescrip] [nvarchar](255) NULL,
	[estNomImg] [nvarchar](50) NULL,
	[estDescripIng] [nvarchar](255) NULL,
	[estColor] [nvarchar](11) NULL,
 CONSTRAINT [PK_Estatus] PRIMARY KEY CLUSTERED 
(
	[estClave] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/******Table [PubV2].[EnlSerInd] ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [PubV2].[EnlSerInd](
	[esiClaveInd] [int] NOT NULL,
	[esiClaveSerie] [int] NOT NULL,
	[esiOrden] [smallint] NULL,
 CONSTRAINT [PK_EnlSerInd] PRIMARY KEY CLUSTERED 
(
	[esiClaveInd] ASC,
	[esiClaveSerie] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/******Table [PreV2].[EnlSerInd]  ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [PreV2].[EnlSerInd](
	[esiClaveInd] [int] NOT NULL,
	[esiClaveSerie] [int] NOT NULL,
	[esiOrden] [smallint] NULL,
 CONSTRAINT [PK_EnlSerInd] PRIMARY KEY CLUSTERED 
(
	[esiClaveInd] ASC,
	[esiClaveSerie] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Table [ManV2].[EnlSerInd]******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [ManV2].[EnlSerInd](
	[esiClaveInd] [int] NOT NULL,
	[esiClaveSerie] [int] NOT NULL,
	[esiOrden] [smallint] NULL,
 CONSTRAINT [PK_EnlSerInd] PRIMARY KEY CLUSTERED 
(
	[esiClaveInd] ASC,
	[esiClaveSerie] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/******Table [PubV2].[EnlIndTipo]******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [PubV2].[EnlIndTipo](
	[eitCveInd] [int] NOT NULL,
	[eitCveTipoInd] [nvarchar](2) NOT NULL,
	[eitOrden] [smallint] NULL,
 CONSTRAINT [PK_EnlIndTipo] PRIMARY KEY CLUSTERED 
(
	[eitCveInd] ASC,
	[eitCveTipoInd] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/******Table [PreV2].[EnlIndTipo] ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [PreV2].[EnlIndTipo](
	[eitCveInd] [int] NOT NULL,
	[eitCveTipoInd] [nvarchar](2) NOT NULL,
	[eitOrden] [smallint] NULL,
 CONSTRAINT [PK_EnlIndTipo] PRIMARY KEY CLUSTERED 
(
	[eitCveInd] ASC,
	[eitCveTipoInd] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/******Table [ManV2].[EnlIndTipo]******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [ManV2].[EnlIndTipo](
	[eitCveInd] [int] NOT NULL,
	[eitCveTipoInd] [nvarchar](2) NOT NULL,
	[eitOrden] [smallint] NULL,
 CONSTRAINT [PK_EnlIndTipo] PRIMARY KEY CLUSTERED 
(
	[eitCveInd] ASC,
	[eitCveTipoInd] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/******Table [PubV2].[EnlIndPCve] ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [PubV2].[EnlIndPCve](
	[eipcCveInd] [int] NOT NULL,
	[eipcCveDesPCve] [int] NOT NULL,
 CONSTRAINT [PK_EnlIndPCve] PRIMARY KEY CLUSTERED 
(
	[eipcCveInd] ASC,
	[eipcCveDesPCve] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Table [PreV2].[EnlIndPCve]  ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [PreV2].[EnlIndPCve](
	[eipcCveInd] [int] NOT NULL,
	[eipcCveDesPCve] [int] NOT NULL,
 CONSTRAINT [PK_EnlIndPCve] PRIMARY KEY CLUSTERED 
(
	[eipcCveInd] ASC,
	[eipcCveDesPCve] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/******Table [ManV2].[EnlIndPCve]  ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [ManV2].[EnlIndPCve](
	[eipcCveInd] [int] NOT NULL,
	[eipcCveDesPCve] [int] NOT NULL,
 CONSTRAINT [PK_EnlIndPCve] PRIMARY KEY CLUSTERED 
(
	[eipcCveInd] ASC,
	[eipcCveDesPCve] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Table [PubV2].[EnlIndGra] ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [PubV2].[EnlIndGra](
	[eigCveInd] [int] NOT NULL,
	[eigCveGra] [smallint] NOT NULL,
	[eigSeccion] [nchar](1) NOT NULL,
 CONSTRAINT [PK_EnlIndGra] PRIMARY KEY CLUSTERED 
(
	[eigCveInd] ASC,
	[eigCveGra] ASC,
	[eigSeccion] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Table [PreV2].[EnlIndGra]******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [PreV2].[EnlIndGra](
	[eigCveInd] [int] NOT NULL,
	[eigCveGra] [int] NOT NULL,
	[eigSeccion] [nchar](1) NOT NULL,
 CONSTRAINT [PK_EnlIndGra] PRIMARY KEY CLUSTERED 
(
	[eigCveInd] ASC,
	[eigCveGra] ASC,
	[eigSeccion] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Table [ManV2].[EnlIndGra]  ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [ManV2].[EnlIndGra](
	[eigCveInd] [int] NOT NULL,
	[eigCveGra] [smallint] NOT NULL,
	[eigSeccion] [nchar](1) NOT NULL,
 CONSTRAINT [PK_EnlIndGra] PRIMARY KEY CLUSTERED 
(
	[eigCveInd] ASC,
	[eigCveGra] ASC,
	[eigSeccion] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Table [PubV2].[EnlIndCal] ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [PubV2].[EnlIndCal](
	[eicCveInd] [int] NOT NULL,
	[eicCveInst] [int] NULL,
	[eicFecAct] [nvarchar](100) NULL,
	[eicCveNotaI] [int] NULL,
	[eicCveNotaF] [int] NULL,
	[eicFecActIng] [nvarchar](100) NULL,
 CONSTRAINT [PK_EnlIndCal] PRIMARY KEY CLUSTERED 
(
	[eicCveInd] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/******Table [PreV2].[EnlIndCal] ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [PreV2].[EnlIndCal](
	[eicCveInd] [int] NOT NULL,
	[eicCveInst] [int] NULL,
	[eicFecAct] [nvarchar](100) NULL,
	[eicCveNotaI] [int] NULL,
	[eicCveNotaF] [int] NULL,
	[eicFecActIng] [nvarchar](100) NULL,
 CONSTRAINT [PK_EnlIndCal] PRIMARY KEY CLUSTERED 
(
	[eicCveInd] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Table [ManV2].[EnlIndCal] ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [ManV2].[EnlIndCal](
	[eicCveInd] [int] NOT NULL,
	[eicCveInst] [int] NULL,
	[eicFecAct] [nvarchar](100) NULL,
	[eicCveNotaI] [int] NULL,
	[eicCveNotaF] [int] NULL,
	[eicFecActIng] [nvarchar](100) NULL,
 CONSTRAINT [PK_EnlIndCal] PRIMARY KEY CLUSTERED 
(
	[eicCveInd] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/******Table [PubV2].[EnlFTRRI] ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [PubV2].[EnlFTRRI](
	[efrClave] [int] NOT NULL,
	[efrClaveRI] [int] NOT NULL,
	[efrOrden] [smallint] NULL,
 CONSTRAINT [PK_EnlFTRRI] PRIMARY KEY CLUSTERED 
(
	[efrClave] ASC,
	[efrClaveRI] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Table [PreV2].[EnlFTRRI] ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [PreV2].[EnlFTRRI](
	[efrClave] [int] NOT NULL,
	[efrClaveRI] [int] NOT NULL,
	[efrOrden] [smallint] NULL,
 CONSTRAINT [PK_EnlFTRRI] PRIMARY KEY CLUSTERED 
(
	[efrClave] ASC,
	[efrClaveRI] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Table [ManV2].[EnlFTRRI]  ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [ManV2].[EnlFTRRI](
	[efrClave] [int] NOT NULL,
	[efrClaveRI] [int] NOT NULL,
	[efrOrden] [smallint] NULL,
 CONSTRAINT [PK_EnlFTRRI] PRIMARY KEY CLUSTERED 
(
	[efrClave] ASC,
	[efrClaveRI] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/******Table [PubV2].[EnlFTRInst] ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [PubV2].[EnlFTRInst](
	[efiClave] [int] NOT NULL,
	[efiClaveInst] [int] NOT NULL,
	[efiOrden] [smallint] NULL,
 CONSTRAINT [PK_EnlFTRInst] PRIMARY KEY CLUSTERED 
(
	[efiClave] ASC,
	[efiClaveInst] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Table [PreV2].[EnlFTRInst]  ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [PreV2].[EnlFTRInst](
	[efiClave] [int] NOT NULL,
	[efiClaveInst] [int] NOT NULL,
	[efiOrden] [smallint] NULL,
 CONSTRAINT [PK_EnlFTRInst] PRIMARY KEY CLUSTERED 
(
	[efiClave] ASC,
	[efiClaveInst] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/******Table [ManV2].[EnlFTRInst]******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [ManV2].[EnlFTRInst](
	[efiClave] [int] NOT NULL,
	[efiClaveInst] [int] NOT NULL,
	[efiOrden] [smallint] NULL,
 CONSTRAINT [PK_EnlFTRInst] PRIMARY KEY CLUSTERED 
(
	[efiClave] ASC,
	[efiClaveInst] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Table [PubV2].[EnlFTMFte] ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [PubV2].[EnlFTMFte](
	[effClave] [int] NOT NULL,
	[effClaveFue] [int] NOT NULL,
	[effOrden] [smallint] NULL,
 CONSTRAINT [PK_EnlFTMFte] PRIMARY KEY CLUSTERED 
(
	[effClave] ASC,
	[effClaveFue] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/******Table [PreV2].[EnlFTMFte] ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [PreV2].[EnlFTMFte](
	[effClave] [int] NOT NULL,
	[effClaveFue] [int] NOT NULL,
	[effOrden] [smallint] NULL,
 CONSTRAINT [PK_EnlFTMFte] PRIMARY KEY CLUSTERED 
(
	[effClave] ASC,
	[effClaveFue] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/******Table [ManV2].[EnlFTMFte] ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [ManV2].[EnlFTMFte](
	[effClave] [int] NOT NULL,
	[effClaveFue] [int] NOT NULL,
	[effOrden] [smallint] NULL,
 CONSTRAINT [PK_EnlFTMFte] PRIMARY KEY CLUSTERED 
(
	[effClave] ASC,
	[effClaveFue] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/******Table [PubV2].[EnlFTCon] ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [PubV2].[EnlFTCon](
	[efcClaveFT] [int] NOT NULL,
	[efcClaveCon] [int] NOT NULL,
	[efcOrden] [smallint] NULL,
 CONSTRAINT [PK_EnlFTCon] PRIMARY KEY CLUSTERED 
(
	[efcClaveFT] ASC,
	[efcClaveCon] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Table [PreV2].[EnlFTCon] ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [PreV2].[EnlFTCon](
	[efcClaveFT] [int] NOT NULL,
	[efcClaveCon] [int] NOT NULL,
	[efcOrden] [smallint] NULL,
 CONSTRAINT [PK_EnlFTCon] PRIMARY KEY CLUSTERED 
(
	[efcClaveFT] ASC,
	[efcClaveCon] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/******Table [ManV2].[EnlFTCon]  ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [ManV2].[EnlFTCon](
	[efcClaveFT] [int] NOT NULL,
	[efcClaveCon] [int] NOT NULL,
	[efcOrden] [smallint] NULL,
 CONSTRAINT [PK_EnlFTCon] PRIMARY KEY CLUSTERED 
(
	[efcClaveFT] ASC,
	[efcClaveCon] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Table [PubV2].[EnlacePCveIng] ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [PubV2].[EnlacePCveIng](
	[epcCvePCveIng] [int] NOT NULL,
	[epcCveDesPCveIng] [int] NOT NULL,
 CONSTRAINT [PK_EnlacePCveIng] PRIMARY KEY CLUSTERED 
(
	[epcCvePCveIng] ASC,
	[epcCveDesPCveIng] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Table [PreV2].[EnlacePCveIng] ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [PreV2].[EnlacePCveIng](
	[epcCvePCveIng] [int] NOT NULL,
	[epcCveDesPCveIng] [int] NOT NULL,
 CONSTRAINT [PK_EnlacePCveIng] PRIMARY KEY CLUSTERED 
(
	[epcCvePCveIng] ASC,
	[epcCveDesPCveIng] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Table [ManV2].[EnlacePCveIng] ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [ManV2].[EnlacePCveIng](
	[epcCvePCveIng] [int] NOT NULL,
	[epcCveDesPCveIng] [int] NOT NULL,
 CONSTRAINT [PK_EnlacePCveIng] PRIMARY KEY CLUSTERED 
(
	[epcCvePCveIng] ASC,
	[epcCveDesPCveIng] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Table [PubV2].[EnlacePCve]  ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [PubV2].[EnlacePCve](
	[epcCvePCve] [int] NOT NULL,
	[epcCveDesPCve] [int] NOT NULL,
 CONSTRAINT [PK_EnlacePCve] PRIMARY KEY CLUSTERED 
(
	[epcCvePCve] ASC,
	[epcCveDesPCve] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/******Table [PreV2].[EnlacePCve]  ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [PreV2].[EnlacePCve](
	[epcCvePCve] [int] NOT NULL,
	[epcCveDesPCve] [int] NOT NULL,
 CONSTRAINT [PK_EnlacePCve] PRIMARY KEY CLUSTERED 
(
	[epcCvePCve] ASC,
	[epcCveDesPCve] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/******Table [ManV2].[EnlacePCve]  ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [ManV2].[EnlacePCve](
	[epcCvePCve] [int] NOT NULL,
	[epcCveDesPCve] [int] NOT NULL,
 CONSTRAINT [PK_EnlacePCve] PRIMARY KEY CLUSTERED 
(
	[epcCvePCve] ASC,
	[epcCveDesPCve] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/******Table [PubV2].[EnlaceING] ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [PubV2].[EnlaceING](
	[enlClavePalabraIng] [int] NOT NULL,
	[enlClaveDescripIng] [int] NOT NULL,
 CONSTRAINT [PK_EnlaceING] PRIMARY KEY CLUSTERED 
(
	[enlClavePalabraIng] ASC,
	[enlClaveDescripIng] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Table [PreV2].[EnlaceING] ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [PreV2].[EnlaceING](
	[enlClavePalabraIng] [int] NOT NULL,
	[enlClaveDescripIng] [int] NOT NULL,
 CONSTRAINT [PK_EnlaceING] PRIMARY KEY CLUSTERED 
(
	[enlClavePalabraIng] ASC,
	[enlClaveDescripIng] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/******Table [ManV2].[EnlaceING] ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [ManV2].[EnlaceING](
	[enlClavePalabraIng] [int] NOT NULL,
	[enlClaveDescripIng] [int] NOT NULL,
 CONSTRAINT [PK_EnlaceING] PRIMARY KEY CLUSTERED 
(
	[enlClavePalabraIng] ASC,
	[enlClaveDescripIng] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/******Table [PubV2].[Enlace] ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [PubV2].[Enlace](
	[enlClavePalabra] [int] NOT NULL,
	[enlClaveDescrip] [int] NOT NULL,
 CONSTRAINT [PK_Enlace] PRIMARY KEY CLUSTERED 
(
	[enlClavePalabra] ASC,
	[enlClaveDescrip] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/******Table [PreV2].[Enlace]  ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [PreV2].[Enlace](
	[enlClavePalabra] [int] NOT NULL,
	[enlClaveDescrip] [int] NOT NULL,
 CONSTRAINT [PK_Enlace] PRIMARY KEY CLUSTERED 
(
	[enlClavePalabra] ASC,
	[enlClaveDescrip] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/******Table [ManV2].[Enlace] ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [ManV2].[Enlace](
	[enlClavePalabra] [int] NOT NULL,
	[enlClaveDescrip] [int] NOT NULL,
 CONSTRAINT [PK_Enlace] PRIMARY KEY CLUSTERED 
(
	[enlClavePalabra] ASC,
	[enlClaveDescrip] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Table [PubV2].[DesgloseGeo] ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [PubV2].[DesgloseGeo](
	[dgClave] [smallint] NOT NULL,
	[dgCodigo] [nchar](5) NULL,
	[dgCodigoIng] [nchar](5) NULL,
	[dgDescrip] [nvarchar](255) NULL,
	[dgDescripIng] [nvarchar](255) NULL,
	[dgNomImg] [nvarchar](50) NULL,
	[dgNomImgIng] [nvarchar](50) NULL,
 CONSTRAINT [PK_DesgloseGeo] PRIMARY KEY CLUSTERED 
(
	[dgClave] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/******Table [PreV2].[DesgloseGeo]  ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [PreV2].[DesgloseGeo](
	[dgClave] [smallint] NOT NULL,
	[dgCodigo] [nchar](5) NULL,
	[dgCodigoIng] [nchar](5) NULL,
	[dgDescrip] [nvarchar](255) NULL,
	[dgDescripIng] [nvarchar](255) NULL,
	[dgNomImg] [nvarchar](50) NULL,
	[dgNomImgIng] [nvarchar](50) NULL,
 CONSTRAINT [PK_DesgloseGeo] PRIMARY KEY CLUSTERED 
(
	[dgClave] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Table [ManV2].[DesgloseGeo] ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [ManV2].[DesgloseGeo](
	[dgClave] [smallint] NOT NULL,
	[dgCodigo] [nchar](5) NULL,
	[dgCodigoIng] [nchar](5) NULL,
	[dgDescrip] [nvarchar](255) NULL,
	[dgDescripIng] [nvarchar](255) NULL,
	[dgNomImg] [nvarchar](50) NULL,
	[dgNomImgIng] [nvarchar](50) NULL,
 CONSTRAINT [PK_DesgloseGeo] PRIMARY KEY CLUSTERED 
(
	[dgClave] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Table [PubV2].[DescripcionPCve]  ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [PubV2].[DescripcionPCve](
	[dpcClave] [int] NOT NULL,
	[dpcDescrip] [nvarchar](max) NOT NULL,
	[dpcAbrevia] [nvarchar](255) NULL,
	[dpcDescripIng] [nvarchar](max) NULL,
	[dpcAbreviaIng] [nvarchar](255) NULL,
 CONSTRAINT [PK_DescripcionPCve] PRIMARY KEY CLUSTERED 
(
	[dpcClave] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Table [PreV2].[DescripcionPCve] ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [PreV2].[DescripcionPCve](
	[dpcClave] [int] NOT NULL,
	[dpcDescrip] [nvarchar](max) NOT NULL,
	[dpcAbrevia] [nvarchar](255) NULL,
	[dpcDescripIng] [nvarchar](max) NULL,
	[dpcAbreviaIng] [nvarchar](255) NULL,
 CONSTRAINT [PK_DescripcionPCve] PRIMARY KEY CLUSTERED 
(
	[dpcClave] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Table [ManV2].[DescripcionPCve] ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [ManV2].[DescripcionPCve](
	[dpcClave] [int] NOT NULL,
	[dpcDescrip] [nvarchar](max) NOT NULL,
	[dpcAbrevia] [nvarchar](255) NULL,
	[dpcDescripIng] [nvarchar](max) NULL,
	[dpcAbreviaIng] [nvarchar](255) NULL,
 CONSTRAINT [PK_DescripcionPCve] PRIMARY KEY CLUSTERED 
(
	[dpcClave] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/******Table [PubV2].[Descripcion] ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [PubV2].[Descripcion](
	[desClave] [int] NOT NULL,
	[desDescrip] [nvarchar](max) NOT NULL,
	[desAbrevia] [nvarchar](255) NULL,
	[desCodigo] [nvarchar](50) NULL,
	[desDescripIng] [nvarchar](max) NULL,
	[desAbreviaIng] [nvarchar](255) NULL,
	[desCodigoIng] [nvarchar](50) NULL,
 CONSTRAINT [PK_Descripcion] PRIMARY KEY CLUSTERED 
(
	[desClave] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Table [PreV2].[Descripcion] ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [PreV2].[Descripcion](
	[desClave] [int] NOT NULL,
	[desDescrip] [nvarchar](max) NOT NULL,
	[desAbrevia] [nvarchar](255) NULL,
	[desCodigo] [nvarchar](50) NULL,
	[desDescripIng] [nvarchar](max) NULL,
	[desAbreviaIng] [nvarchar](255) NULL,
	[desCodigoIng] [nvarchar](50) NULL,
 CONSTRAINT [PK_Descripcion] PRIMARY KEY CLUSTERED 
(
	[desClave] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/******Table [ManV2].[Descripcion]  ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [ManV2].[Descripcion](
	[desClave] [int] NOT NULL,
	[desDescrip] [nvarchar](max) NOT NULL,
	[desAbrevia] [nvarchar](255) NULL,
	[desCodigo] [nvarchar](50) NULL,
	[desDescripIng] [nvarchar](max) NULL,
	[desAbreviaIng] [nvarchar](255) NULL,
	[desCodigoIng] [nvarchar](50) NULL,
 CONSTRAINT [PK_Descripcion] PRIMARY KEY CLUSTERED 
(
	[desClave] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Table [PubV2].[Contacto] ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [PubV2].[Contacto](
	[conClave] [int] NOT NULL,
	[conNombre] [nvarchar](100) NULL,
	[conPuesto] [nvarchar](255) NULL,
	[conTelefono] [nvarchar](255) NULL,
	[conCorreo] [nvarchar](255) NULL,
	[conDomicilio] [nvarchar](255) NULL,
 CONSTRAINT [PK_Contacto] PRIMARY KEY CLUSTERED 
(
	[conClave] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Table [PreV2].[Contacto] ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [PreV2].[Contacto](
	[conClave] [int] NOT NULL,
	[conNombre] [nvarchar](100) NULL,
	[conPuesto] [nvarchar](255) NULL,
	[conTelefono] [nvarchar](255) NULL,
	[conCorreo] [nvarchar](255) NULL,
	[conDomicilio] [nvarchar](255) NULL,
 CONSTRAINT [PK_Contacto] PRIMARY KEY CLUSTERED 
(
	[conClave] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Table [ManV2].[Contacto]  ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [ManV2].[Contacto](
	[conClave] [int] NOT NULL,
	[conNombre] [nvarchar](100) NULL,
	[conPuesto] [nvarchar](255) NULL,
	[conTelefono] [nvarchar](255) NULL,
	[conCorreo] [nvarchar](255) NULL,
	[conDomicilio] [nvarchar](255) NULL,
 CONSTRAINT [PK_Contacto] PRIMARY KEY CLUSTERED 
(
	[conClave] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Table [PreV2].[CobTem] ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [PreV2].[CobTem](
	[ctClave] [int] NULL,
	[ctDescrip] [nvarchar](255) NULL,
	[ctDescripIng] [nvarchar](255) NULL
) ON [PRIMARY]
GO
/****** Table [ManV2].[CobTem] ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [ManV2].[CobTem](
	[ctClave] [int] NULL,
	[ctDescrip] [nvarchar](255) NULL,
	[ctDescripIng] [nvarchar](255) NULL
) ON [PRIMARY]
GO
CREATE UNIQUE NONCLUSTERED INDEX [PK_CobTem] ON [ManV2].[CobTem] 
(
	[ctClave] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/******Table [PubV2].[CobGeo] ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [PubV2].[CobGeo](
	[cgClave] [nvarchar](9) NOT NULL,
	[cgDescrip] [nvarchar](255) NULL,
	[cgDescripIng] [nvarchar](255) NULL,
	[cgAbrevia] [varchar](10) NULL,
	[cgAbreviaIng] [varchar](10) NULL,
	[cgGrupo] [int] NULL,
	[cgCveTipoCobGeo] [int] NULL,
 CONSTRAINT [PK_CobGeo] PRIMARY KEY CLUSTERED 
(
	[cgClave] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/******Table [PreV2].[CobGeo] ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [PreV2].[CobGeo](
	[cgClave] [nvarchar](9) NOT NULL,
	[cgDescrip] [nvarchar](255) NULL,
	[cgDescripIng] [nvarchar](255) NULL,
	[cgAbrevia] [varchar](10) NULL,
	[cgAbreviaIng] [varchar](10) NULL,
	[cgGrupo] [int] NULL,
	[cgCveTipoCobGeo] [int] NULL,
 CONSTRAINT [PK_CobGeo] PRIMARY KEY CLUSTERED 
(
	[cgClave] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/******Table [ManV2].[CobGeo] ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [ManV2].[CobGeo](
	[cgClave] [nvarchar](9) NOT NULL,
	[cgDescrip] [nvarchar](255) NULL,
	[cgDescripIng] [nvarchar](255) NULL,
	[cgAbrevia] [varchar](10) NULL,
	[cgAbreviaIng] [varchar](10) NULL,
	[cgGrupo] [int] NULL,
	[cgCveTipoCobGeo] [int] NULL,
 CONSTRAINT [PK_CobGeo] PRIMARY KEY CLUSTERED 
(
	[cgClave] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Table [PubV2].[Clasificacion] ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [PubV2].[Clasificacion](
	[claClave] [int] NOT NULL,
	[claGrupo] [int] NULL,
	[claClaveDescrip] [int] NULL,
	[claOrden] [smallint] NULL,
 CONSTRAINT [PK_Clasificacion] PRIMARY KEY CLUSTERED 
(
	[claClave] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/******Table [PreV2].[Clasificacion] ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [PreV2].[Clasificacion](
	[claClave] [int] NOT NULL,
	[claGrupo] [int] NULL,
	[claClaveDescrip] [int] NULL,
	[claOrden] [smallint] NULL,
 CONSTRAINT [PK_Clasificacion] PRIMARY KEY CLUSTERED 
(
	[claClave] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/******Table [ManV2].[Clasificacion] ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [ManV2].[Clasificacion](
	[claClave] [int] NOT NULL,
	[claGrupo] [int] NULL,
	[claClaveDescrip] [int] NULL,
	[claOrden] [smallint] NULL,
 CONSTRAINT [PK_Clasificacion] PRIMARY KEY CLUSTERED 
(
	[claClave] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/******Table [PubV2].[Calendario] ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [PubV2].[Calendario](
	[calClave] [nchar](3) NOT NULL,
	[calTitulo] [nvarchar](255) NULL,
	[calSubTitulo] [nvarchar](255) NULL,
	[calCveNota] [int] NULL,
	[calTituloIng] [nvarchar](255) NULL,
	[calSubtituloIng] [nvarchar](255) NULL,
 CONSTRAINT [PK_Calendario] PRIMARY KEY CLUSTERED 
(
	[calClave] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/******Table [PreV2].[Calendario] ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [PreV2].[Calendario](
	[calClave] [nchar](3) NOT NULL,
	[calTitulo] [nvarchar](255) NULL,
	[calSubTitulo] [nvarchar](255) NULL,
	[calCveNota] [int] NULL,
	[calTituloIng] [nvarchar](255) NULL,
	[calSubtituloIng] [nvarchar](255) NULL,
 CONSTRAINT [PK_Calendario] PRIMARY KEY CLUSTERED 
(
	[calClave] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/******Table [ManV2].[Calendario] ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [ManV2].[Calendario](
	[calClave] [nchar](3) NOT NULL,
	[calTitulo] [nvarchar](255) NULL,
	[calSubTitulo] [nvarchar](255) NULL,
	[calCveNota] [int] NULL,
	[calTituloIng] [nvarchar](255) NULL,
	[calSubtituloIng] [nvarchar](255) NULL,
 CONSTRAINT [PK_Calendario] PRIMARY KEY CLUSTERED 
(
	[calClave] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

/******Table [PubV2].[AtrSerie] ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [PubV2].[AtrSerie](
	[atsClaveSerie] [int] NOT NULL,
	[atsClaveDescrip] [int] NULL,
	[atsClaveFre] [int] NULL,
	[atsAAPrelim] [int] NULL,
	[atsMMPrelim] [int] NULL,
	[atsDDPrelim] [int] NULL,
	[atsAAEst] [int] NULL,
	[atsMMEst] [int] NULL,
	[atsDDEst] [int] NULL,
	[atsDecimales] [int] NULL,
	[atsClaveNota] [int] NULL,
	[atsClaveFT] [int] NULL,
	[atsClaveFuente] [int] NULL,
	[atsClaveUnidad] [int] NULL,
	[atsTipo] [nvarchar](1) NULL,
	[atsSalida] [bit] NOT NULL,
	[atsAARev] [int] NULL,
	[atsMMRev] [int] NULL,
	[atsDDRev] [int] NULL,
	[atsClaveAgrupaCob] [nvarchar](30) NULL,
	[atsClaveAgrupaClas] [nvarchar](12) NULL,
	[atsColMatriz] [nvarchar](50) NULL,
	[atsColMatrizIng] [nvarchar](50) NULL,
	[atsTipoGra] [int] NULL,
	[atsInicio] [int] NULL,
	[atsTipoCua] [nvarchar](4) NULL,
 CONSTRAINT [PK_AtrSerie] PRIMARY KEY CLUSTERED 
(
	[atsClaveSerie] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Table [PreV2].[AtrSerie] ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [PreV2].[AtrSerie](
	[atsClaveSerie] [int] NOT NULL,
	[atsClaveDescrip] [int] NULL,
	[atsClaveFre] [int] NULL,
	[atsAAPrelim] [int] NULL,
	[atsMMPrelim] [int] NULL,
	[atsDDPrelim] [int] NULL,
	[atsAAEst] [int] NULL,
	[atsMMEst] [int] NULL,
	[atsDDEst] [int] NULL,
	[atsDecimales] [int] NULL,
	[atsClaveNota] [int] NULL,
	[atsClaveFT] [int] NULL,
	[atsClaveFuente] [int] NULL,
	[atsClaveUnidad] [int] NULL,
	[atsTipo] [nvarchar](1) NULL,
	[atsSalida] [bit] NOT NULL,
	[atsAARev] [int] NULL,
	[atsMMRev] [int] NULL,
	[atsDDRev] [int] NULL,
	[atsClaveAgrupaCob] [nvarchar](30) NULL,
	[atsClaveAgrupaClas] [nvarchar](12) NULL,
	[atsColMatriz] [nvarchar](50) NULL,
	[atsColMatrizIng] [nvarchar](50) NULL,
	[atsTipoGra] [int] NULL,
	[atsInicio] [int] NULL,
	[atsTipoCua] [nvarchar](4) NULL,
 CONSTRAINT [PK_AtrSerie] PRIMARY KEY CLUSTERED 
(
	[atsClaveSerie] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/******Table [ManV2].[AtrSerie] ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [ManV2].[AtrSerie](
	[atsClaveSerie] [int] NOT NULL,
	[atsClaveDescrip] [int] NULL,
	[atsClaveFre] [int] NULL,
	[atsAAPrelim] [int] NULL,
	[atsMMPrelim] [int] NULL,
	[atsDDPrelim] [int] NULL,
	[atsAAEst] [int] NULL,
	[atsMMEst] [int] NULL,
	[atsDDEst] [int] NULL,
	[atsDecimales] [int] NULL,
	[atsClaveNota] [int] NULL,
	[atsClaveFT] [int] NULL,
	[atsClaveFuente] [int] NULL,
	[atsClaveUnidad] [int] NULL,
	[atsTipo] [nvarchar](1) NULL,
	[atsSalida] [bit] NOT NULL,
	[atsAARev] [int] NULL,
	[atsMMRev] [int] NULL,
	[atsDDRev] [int] NULL,
	[atsClaveAgrupaCob] [nvarchar](30) NULL,
	[atsClaveAgrupaClas] [nvarchar](12) NULL,
	[atsColMatriz] [nvarchar](50) NULL,
	[atsColMatrizIng] [nvarchar](50) NULL,
	[atsTipoGra] [int] NULL,
	[atsInicio] [int] NULL,
	[atsTipoCua] [nvarchar](4) NULL,
 CONSTRAINT [PK_AtrSerie] PRIMARY KEY CLUSTERED 
(
	[atsClaveSerie] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/******Table [PubV2].[AtrPeriodoPorInd] ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [PubV2].[AtrPeriodoPorInd](
	[apiCveSer] [int] NOT NULL,
	[apiPerAA] [int] NOT NULL,
	[apiPerMM] [int] NOT NULL,
	[apiPerDD] [int] NOT NULL,
	[apiCveNota] [int] NOT NULL,
 CONSTRAINT [PK_AtrPeriodoPorInd] PRIMARY KEY CLUSTERED 
(
	[apiCveSer] ASC,
	[apiPerAA] ASC,
	[apiPerMM] ASC,
	[apiPerDD] ASC,
	[apiCveNota] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/******Table [PreV2].[AtrPeriodoPorInd] ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [PreV2].[AtrPeriodoPorInd](
	[apiCveSer] [int] NOT NULL,
	[apiPerAA] [int] NOT NULL,
	[apiPerMM] [int] NOT NULL,
	[apiPerDD] [int] NOT NULL,
	[apiCveNota] [int] NOT NULL,
 CONSTRAINT [PK_AtrPeriodoPorInd] PRIMARY KEY CLUSTERED 
(
	[apiCveSer] ASC,
	[apiPerAA] ASC,
	[apiPerMM] ASC,
	[apiPerDD] ASC,
	[apiCveNota] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Table [ManV2].[AtrPeriodoPorInd] ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [ManV2].[AtrPeriodoPorInd](
	[apiCveSer] [int] NOT NULL,
	[apiPerAA] [int] NOT NULL,
	[apiPerMM] [int] NOT NULL,
	[apiPerDD] [int] NOT NULL,
	[apiCveNota] [int] NOT NULL,
 CONSTRAINT [PK_AtrPeriodoPorInd] PRIMARY KEY CLUSTERED 
(
	[apiCveSer] ASC,
	[apiPerAA] ASC,
	[apiPerMM] ASC,
	[apiPerDD] ASC,
	[apiCveNota] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/******Table [PubV2].[AtrIndicador] ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [PubV2].[AtrIndicador](
	[atrClaveInd] [int] NOT NULL,
	[atrFechaAct] [nvarchar](50) NULL,
	[atrMeta] [float] NULL,
	[atrDesMeta] [nvarchar](255) NULL,
	[atrCalculo] [nvarchar](3) NULL,
	[atrEstadisticos] [nvarchar](2) NULL,
	[atrClaveEst] [int] NULL,
	[atrFechaActIng] [nvarchar](50) NULL,
	[atrDesMetaIng] [nvarchar](255) NULL,
	[atrVisualizaMapa] [nvarchar](2) NULL,
	[atrEtiPeriodo] [nvarchar](50) NULL,
	[atrEtiCobTem] [nvarchar](50) NULL,
	[atrEstado] [nvarchar](3) NULL,
 CONSTRAINT [PK_AtrIndicador] PRIMARY KEY CLUSTERED 
(
	[atrClaveInd] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Table [PreV2].[AtrIndicador] ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [PreV2].[AtrIndicador](
	[atrClaveInd] [int] NOT NULL,
	[atrFechaAct] [nvarchar](50) NULL,
	[atrMeta] [float] NULL,
	[atrDesMeta] [nvarchar](255) NULL,
	[atrCalculo] [nvarchar](3) NULL,
	[atrEstadisticos] [nvarchar](2) NULL,
	[atrClaveEst] [int] NULL,
	[atrFechaActIng] [nvarchar](50) NULL,
	[atrDesMetaIng] [nvarchar](255) NULL,
	[atrVisualizaMapa] [nvarchar](2) NULL,
	[atrEtiPeriodo] [nvarchar](50) NULL,
	[atrEtiCobTem] [nvarchar](50) NULL,
	[atrEstado] [nvarchar](3) NULL,
 CONSTRAINT [PK_AtrIndicador] PRIMARY KEY CLUSTERED 
(
	[atrClaveInd] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Table [ManV2].[AtrIndicador] ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [ManV2].[AtrIndicador](
	[atrClaveInd] [int] NOT NULL,
	[atrFechaAct] [nvarchar](50) NULL,
	[atrMeta] [float] NULL,
	[atrDesMeta] [nvarchar](255) NULL,
	[atrCalculo] [nvarchar](3) NULL,
	[atrEstadisticos] [nvarchar](2) NULL,
	[atrClaveEst] [int] NULL,
	[atrFechaActIng] [nvarchar](50) NULL,
	[atrDesMetaIng] [nvarchar](255) NULL,
	[atrVisualizaMapa] [nvarchar](2) NULL,
	[atrEtiPeriodo] [nvarchar](50) NULL,
	[atrEtiCobTem] [nvarchar](50) NULL,
	[atrEstado] [nvarchar](3) NULL,
 CONSTRAINT [PK_AtrIndicador] PRIMARY KEY CLUSTERED 
(
	[atrClaveInd] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/******Table [PubV2].[AtrAgrupaCobPorInd] ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [PubV2].[AtrAgrupaCobPorInd](
	[aacoCveSer] [int] NOT NULL,
	[aacoAgrCob] [nvarchar](20) NOT NULL,
	[aacoCveNota] [int] NOT NULL,
 CONSTRAINT [PK_AtrAgrupaCobPorInd] PRIMARY KEY CLUSTERED 
(
	[aacoCveSer] ASC,
	[aacoAgrCob] ASC,
	[aacoCveNota] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Table [PreV2].[AtrAgrupaCobPorInd] ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [PreV2].[AtrAgrupaCobPorInd](
	[aacoCveSer] [int] NOT NULL,
	[aacoAgrCob] [nvarchar](20) NOT NULL,
	[aacoCveNota] [int] NOT NULL,
 CONSTRAINT [PK_AtrAgrupaCobPorInd] PRIMARY KEY CLUSTERED 
(
	[aacoCveSer] ASC,
	[aacoAgrCob] ASC,
	[aacoCveNota] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Table [ManV2].[AtrAgrupaCobPorInd] ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [ManV2].[AtrAgrupaCobPorInd](
	[aacoCveSer] [int] NOT NULL,
	[aacoAgrCob] [nvarchar](20) NOT NULL,
	[aacoCveNota] [int] NOT NULL,
 CONSTRAINT [PK_AtrAgrupaCobPorInd] PRIMARY KEY CLUSTERED 
(
	[aacoCveSer] ASC,
	[aacoAgrCob] ASC,
	[aacoCveNota] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/******Table [PubV2].[AtrAgrupaClaPorInd]  ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [PubV2].[AtrAgrupaClaPorInd](
	[aaclCveSer] [int] NOT NULL,
	[aaclAgrCla] [nvarchar](30) NOT NULL,
	[aaclTipCla] [nvarchar](1) NOT NULL,
	[aaclCveNota] [int] NULL,
	[aaclOrdenTab] [int] NULL,
	[aaclOrdenGra] [int] NULL,
	[aaclOrdenMap] [int] NULL,
 CONSTRAINT [PK_AtrAgrupaClaPorInd] PRIMARY KEY CLUSTERED 
(
	[aaclCveSer] ASC,
	[aaclAgrCla] ASC,
	[aaclTipCla] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Table [PreV2].[AtrAgrupaClaPorInd] ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [PreV2].[AtrAgrupaClaPorInd](
	[aaclCveSer] [int] NOT NULL,
	[aaclAgrCla] [nvarchar](30) NOT NULL,
	[aaclTipCla] [nvarchar](1) NOT NULL,
	[aaclCveNota] [int] NULL,
	[aaclOrdenTab] [int] NULL,
	[aaclOrdenGra] [int] NULL,
	[aaclOrdenMap] [int] NULL,
 CONSTRAINT [PK_AtrAgrupaClaPorInd] PRIMARY KEY CLUSTERED 
(
	[aaclCveSer] ASC,
	[aaclAgrCla] ASC,
	[aaclTipCla] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/******Table [ManV2].[AtrAgrupaClaPorInd] ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [ManV2].[AtrAgrupaClaPorInd](
	[aaclCveSer] [int] NOT NULL,
	[aaclAgrCla] [nvarchar](30) NOT NULL,
	[aaclTipCla] [nvarchar](1) NOT NULL,
	[aaclCveNota] [int] NULL,
	[aaclOrdenTab] [int] NULL,
	[aaclOrdenGra] [int] NULL,
	[aaclOrdenMap] [int] NULL,
 CONSTRAINT [PK_AtrAgrupaClaPorInd] PRIMARY KEY CLUSTERED 
(
	[aaclCveSer] ASC,
	[aaclAgrCla] ASC,
	[aaclTipCla] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Table [PubV2].[Arbol]  ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [PubV2].[Arbol](
	[arbClave] [nvarchar](43) NOT NULL,
	[arbClaveInd] [int] NULL,
	[arbClaveFT] [int] NULL,
	[arbClaveDescrip] [int] NOT NULL,
	[arbClaveMetadato] [int] NULL,
 CONSTRAINT [PK_Arbol] PRIMARY KEY CLUSTERED 
(
	[arbClave] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Table [PreV2].[Arbol] ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [PreV2].[Arbol](
	[arbClave] [nvarchar](43) NOT NULL,
	[arbClaveInd] [int] NULL,
	[arbClaveFT] [int] NULL,
	[arbClaveDescrip] [int] NOT NULL,
	[arbClaveMetadato] [int] NULL,
 CONSTRAINT [PK_Arbol] PRIMARY KEY CLUSTERED 
(
	[arbClave] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Table [ManV2].[Arbol] ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [ManV2].[Arbol](
	[arbClave] [nvarchar](43) NOT NULL,
	[arbClaveInd] [int] NULL,
	[arbClaveFT] [int] NULL,
	[arbClaveDescrip] [int] NOT NULL,
	[arbClaveMetadato] [int] NULL,
 CONSTRAINT [PK_Arbol] PRIMARY KEY CLUSTERED 
(
	[arbClave] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Table [PubV2].[AgrupaCob] ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [PubV2].[AgrupaCob](
	[acoClave] [nvarchar](20) NOT NULL,
	[acoCveGeo] [nvarchar](9) NULL,
	[acoCveDesGeo] [int] NULL,
	[acoOrden] [int] NULL,
	[acoClaveAnt] [nvarchar](12) NULL,
 CONSTRAINT [PK_AgrupaCob] PRIMARY KEY CLUSTERED 
(
	[acoClave] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/******Table [PreV2].[AgrupaCob] ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [PreV2].[AgrupaCob](
	[acoClave] [nvarchar](20) NOT NULL,
	[acoCveGeo] [nvarchar](9) NULL,
	[acoCveDesGeo] [int] NULL,
	[acoOrden] [int] NULL,
	[acoClaveAnt] [nvarchar](12) NULL,
 CONSTRAINT [PK_AgrupaCob] PRIMARY KEY CLUSTERED 
(
	[acoClave] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Table [ManV2].[AgrupaCob] ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [ManV2].[AgrupaCob](
	[acoClave] [nvarchar](20) NOT NULL,
	[acoCveGeo] [nvarchar](9) NULL,
	[acoCveDesGeo] [int] NULL,
	[acoOrden] [int] NULL,
	[acoClaveAnt] [nvarchar](12) NULL,
 CONSTRAINT [PK_AgrupaCob] PRIMARY KEY CLUSTERED 
(
	[acoClave] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Table [PubV2].[AgrupaClas]  ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [PubV2].[AgrupaClas](
	[acClave] [nvarchar](30) NOT NULL,
	[acCveGpo] [int] NULL,
	[acCveClas] [int] NULL,
	[acDescrip] [varchar](255) NULL,
	[acDescripIng] [varchar](255) NULL,
 CONSTRAINT [PK_AgrupaClas] PRIMARY KEY CLUSTERED 
(
	[acClave] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/******Table [PreV2].[AgrupaClas] ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [PreV2].[AgrupaClas](
	[acClave] [nvarchar](30) NOT NULL,
	[acCveGpo] [int] NULL,
	[acCveClas] [int] NULL,
	[acDescrip] [varchar](255) NULL,
	[acDescripIng] [varchar](255) NULL,
 CONSTRAINT [PK_AgrupaClas] PRIMARY KEY CLUSTERED 
(
	[acClave] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Table [ManV2].[AgrupaClas]  ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [ManV2].[AgrupaClas](
	[acClave] [nvarchar](30) NOT NULL,
	[acCveGpo] [int] NULL,
	[acCveClas] [int] NULL,
	[acDescrip] [varchar](255) NULL,
	[acDescripIng] [varchar](255) NULL,
 CONSTRAINT [PK_AgrupaClas] PRIMARY KEY CLUSTERED 
(
	[acClave] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
