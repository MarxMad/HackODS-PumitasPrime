/****** Script para Insertar Datos en el indicador 5_5_1 en el Esquema ManV2 ******/

USE [ODS]
GO
/****** Arbol ******/
-------------- AJUSTADO
INSERT [ManV2].[Arbol] ([arbClave], [arbClaveInd], [arbClaveFT], [arbClaveDescrip], [arbClaveMetadato]) VALUES (N'ODS0050',	0	,	0	,	36	,	13	)
INSERT [ManV2].[Arbol] ([arbClave], [arbClaveInd], [arbClaveFT], [arbClaveDescrip], [arbClaveMetadato]) VALUES (N'ODS00500035',	0	,	0	,	23	,	0	)
INSERT [ManV2].[Arbol] ([arbClave], [arbClaveInd], [arbClaveFT], [arbClaveDescrip], [arbClaveMetadato]) VALUES (N'ODS005000350075',	324	,	105	,	804	,	0	)


/****** Metadato ******/

INSERT [ManV2].[Metadato] ([metClave], [metDescrip], [metDescripIng]) VALUES (13, N'"Si bien se han producido avances a nivel mundial con relación a la igualdad entre los géneros a través de los Objetivos de Desarrollo del Milenio (incluida la igualdad de acceso entre niñas y niños a la enseñanza primaria), las mujeres y las niñas siguen sufriendo discriminación y violencia en todos los lugares del mundo. La igualdad entre los géneros no es solo un derecho humano fundamental, sino la base necesaria para conseguir un mundo pacífico, próspero y sostenible. Si se facilita a las mujeres y niñas igualdad en el acceso a la educación, atención médica, un trabajo decente y representación en los procesos de adopción de decisiones políticas y económicas, se impulsarán las economías sostenibles y se beneficiará a las sociedades
 y a la humanidad en su conjunto."  Fuente: http://www.un.org/sustainabledevelopment/es/gender-equality/ (consultado el 3 de junio de 2016).
Fuente: http://www.un.org/sustainabledevelopment/es/gender-equality/ (consultado el 3 de junio de 2016)', N'"hile the world has achieved progress towards gender equality  and women’s empowerment under the Millennium Development Goals (including equal access to primary education between girls and boys), women and girls continue to suffer discrimination and violence in every part of the world. Gender equality is not only a fundamental human right, but a necessary foundation for a peaceful, prosperous and sustainable world. Providing women and girls with equal access to education, health care, decent work, and representation in political and economic decision-making processes will fuel sustainable economies and benefit societies and humanity at large."  Source: http://www.un.org/sustainabledevelopment/gender-equality/ (consulted on June 3, 2016)')


/****** Descripcion ******/

INSERT [ManV2].[Descripcion] ([desClave], [desDescrip], [desAbrevia], [desCodigo], [desDescripIng], [desAbreviaIng], [desCodigoIng]) VALUES (	23	,N'Asegurar la participación plena y efectiva de las mujeres y la igualdad de oportunidades de liderazgo a todos los niveles decisorios en la vida política, económica y pública',N'',N'Meta 5.5',N'Ensure women’s full and effective participation and equal opportunities for leadership at all levels of decision-making in political, economic and public life',N'',N'Target  5.5')
INSERT [ManV2].[Descripcion] ([desClave], [desDescrip], [desAbrevia], [desCodigo], [desDescripIng], [desAbreviaIng], [desCodigoIng]) VALUES (	36	,N'Lograr la igualdad de género y empoderar a todas las mujeres y las niñas',N'Igualdad de género',N'5.',N'Achieve gender equality and empower all women and girls',N'Gender equality',N'5.')
INSERT [ManV2].[Descripcion] ([desClave], [desDescrip], [desAbrevia], [desCodigo], [desDescripIng], [desAbreviaIng], [desCodigoIng]) VALUES (	804	,N'Proporción de escaños ocupados por mujeres en la Cámara de Diputados',N'',N'5.5.1.a',N'Proportion of seats held by women in the Chamber of Deputies',N'',N'5.5.1.a')



/****** Enlace ******/
--
INSERT [ManV2].[Enlace] ([enlClavePalabra], [enlClaveDescrip]) VALUES (	44	,	804	)
INSERT [ManV2].[Enlace] ([enlClavePalabra], [enlClaveDescrip]) VALUES (	78	,	804	)
INSERT [ManV2].[Enlace] ([enlClavePalabra], [enlClaveDescrip]) VALUES (	1877	,	804	)
INSERT [ManV2].[Enlace] ([enlClavePalabra], [enlClaveDescrip]) VALUES (	1878	,	804	)
INSERT [ManV2].[Enlace] ([enlClavePalabra], [enlClaveDescrip]) VALUES (	1879	,	804	)
INSERT [ManV2].[Enlace] ([enlClavePalabra], [enlClaveDescrip]) VALUES (	1880	,	804	)

/****** Lexico ******/

--INSERT [ManV2].[Lexico] ([lexPalabra], [lexClavePalabra]) values (N'PROPORCION',	44	)
INSERT [ManV2].[Lexico] ([lexPalabra], [lexClavePalabra]) values (N'NUJEREC',	78	)
INSERT [ManV2].[Lexico] ([lexPalabra], [lexClavePalabra]) values (N'ECCANOC',	1877	)
INSERT [ManV2].[Lexico] ([lexPalabra], [lexClavePalabra]) values (N'OCUPADOC',	1878	)
INSERT [ManV2].[Lexico] ([lexPalabra], [lexClavePalabra]) values (N'CANARA',	1879	)
INSERT [ManV2].[Lexico] ([lexPalabra], [lexClavePalabra]) values (N'DIPUTADOC',	1880	)

/****** EnlaceIng ******/

INSERT [ManV2].[EnlaceING] ([enlClavePalabraIng], [enlClaveDescripIng]) VALUES(	32	,	804	)
INSERT [ManV2].[EnlaceING] ([enlClavePalabraIng], [enlClaveDescripIng]) VALUES(	100	,	804	)
INSERT [ManV2].[EnlaceING] ([enlClavePalabraIng], [enlClaveDescripIng]) VALUES(	1583	,	804	)
INSERT [ManV2].[EnlaceING] ([enlClavePalabraIng], [enlClaveDescripIng]) VALUES(	1584	,	804	)
INSERT [ManV2].[EnlaceING] ([enlClavePalabraIng], [enlClaveDescripIng]) VALUES(	1585	,	804	)
INSERT [ManV2].[EnlaceING] ([enlClavePalabraIng], [enlClaveDescripIng]) VALUES(	1586	,	804	)


/****** LexicoIng ******/

--INSERT [ManV2].[LexicoING] ([lexPalabraIng], [lexClavePalabraIng]) VALUES (N'PROPORTION',	32	)
INSERT [ManV2].[LexicoING] ([lexPalabraIng], [lexClavePalabraIng]) VALUES (N'WOMEN',	100	)
INSERT [ManV2].[LexicoING] ([lexPalabraIng], [lexClavePalabraIng]) VALUES (N'SEATS',	1583	)
INSERT [ManV2].[LexicoING] ([lexPalabraIng], [lexClavePalabraIng]) VALUES (N'HELD',	1584	)
INSERT [ManV2].[LexicoING] ([lexPalabraIng], [lexClavePalabraIng]) VALUES (N'CHAMBER',	1585	)
INSERT [ManV2].[LexicoING] ([lexPalabraIng], [lexClavePalabraIng]) VALUES (N'DEPUTIES',	1586	)


/****** AtrIndicador ******/

INSERT [ManV2].[AtrIndicador] ([atrClaveInd], [atrFechaAct], [atrMeta], [atrDesMeta], [atrCalculo], [atrEstadisticos], [atrClaveEst], [atrFechaActIng], [atrDesMetaIng], [atrVisualizaMapa], [atrEtiPeriodo], [atrEtiCobTem], [atrEstado]) VALUES (	324	,	N'25 de noviembre de 2019'	,	NULL	,	N'Por definir'	,	N'SV'	,	N'N',	0	,N'November 25th, 2019'	,N'To be define',	N'N',	NULL	,	NULL	,N'PUB'	)

/****** EnlIndCal ******/

INSERT [ManV2].[EnlIndCal] ([eicCveInd], [eicCveInst], [eicFecAct], [eicCveNotaI], [eicCveNotaF], [eicFecActIng]) VALUES(324	,70,N'Por definir',	0,	0	,N'To be announced (TBA)')

/****** Institucion ******/

INSERT [ManV2].[Institucion] ([insClave], [insDescrip], [insURL], [insAbrevia], [insDescripIng], [insAbreviaIng]) VALUES (68, N'Instituto Federal de Telecomunicaciones (IFT).', N'http://www.ift.org.mx/', N'IFT', N'Instituto Federal de Telecomunicaciones (IFT).', N'IFT')

/****** EnlIndGra ******/
--akistad 
INSERT [ManV2].[EnlIndGra] ([eigCveInd], [eigCveGra], [eigSeccion]) VALUES (	324	,	0	,N'C')
INSERT [ManV2].[EnlIndGra] ([eigCveInd], [eigCveGra], [eigSeccion]) VALUES (	324	,	0	,N'E')
INSERT [ManV2].[EnlIndGra] ([eigCveInd], [eigCveGra], [eigSeccion]) VALUES (324	,	0	,N'M')
INSERT [ManV2].[EnlIndGra] ([eigCveInd], [eigCveGra], [eigSeccion]) VALUES (	324	,	2	,N'T')

/****** EnlIndTipo ******/


 INSERT [ManV2].[EnlIndTipo] ([eitCveInd], [eitCveTipoInd], [eitOrden]) VALUES (	324	,N'G',	NULL	)
 
/****** EnlIndPCve ******/

INSERT [ManV2].[EnlIndPCve] ([eipcCveInd], [eipcCveDesPCve]) VALUES (	324	,	28	)

/****** DescripcionPCve ******/

INSERT [ManV2].[DescripcionPCve] ([dpcClave], [dpcDescrip], [dpcAbrevia], [dpcDescripIng], [dpcAbreviaIng]) VALUES (	28	,N'participación de la mujer, mujeres electas, diputadas, curules ocupados por mujeres, puestos de toma de decisión',	NULL	,	NULL	,	NULL	)

/****** EnlacePCve ******/

INSERT [ManV2].[EnlacePCve] ([epcCvePCve], [epcCveDesPCve]) VALUES (	28	,	4	)
INSERT [ManV2].[EnlacePCve] ([epcCvePCve], [epcCveDesPCve]) VALUES (	28	,	5	)


/****** LexicoPCve ******/

INSERT [ManV2].[LexicoPCve] ([lpcPalabraCve], [lpcClavePalCve]) VALUES (N'NALNUTRICION	',	28	)

/****** EnlacePCveIng ******/
--NO HAY DATOS

/****** EnlSerInd ******/
-------------------------------------- Ajustado
INSERT [ManV2].[EnlSerInd] ([esiClaveInd], [esiClaveSerie], [esiOrden]) VALUES (324,358	,1)
INSERT [ManV2].[EnlSerInd] ([esiClaveInd], [esiClaveSerie], [esiOrden]) VALUES (324,359	,2)
INSERT [ManV2].[EnlSerInd] ([esiClaveInd], [esiClaveSerie], [esiOrden]) VALUES (324,360	,3)

/****** AtrSerie ******/
---------------------------------------Indicador  358,359 y 360
INSERT [ManV2].[AtrSerie] ([atsClaveSerie], [atsClaveDescrip], [atsClaveFre], [atsAAPrelim], [atsMMPrelim], [atsDDPrelim], [atsAAEst], [atsMMEst], [atsDDEst], [atsDecimales], [atsClaveNota], [atsClaveFT], [atsClaveFuente], [atsClaveUnidad], [atsTipo], [atsSalida], [atsAARev], [atsMMRev], [atsDDRev], [atsClaveAgrupaCob], [atsClaveAgrupaClas], [atsColMatriz], [atsColMatrizIng], [atsTipoGra], [atsInicio], [atsTipoCua]) VALUES (358, 804, 1, 0, 0, 0, 0, 0, 0, 1, 0, 0, 395, 60, N'R', 1, 0, 0, 0, N'0010', NULL, N'Periodo', N'Period', NULL, 2014, N'AS')
INSERT [ManV2].[AtrSerie] ([atsClaveSerie], [atsClaveDescrip], [atsClaveFre], [atsAAPrelim], [atsMMPrelim], [atsDDPrelim], [atsAAEst], [atsMMEst], [atsDDEst], [atsDecimales], [atsClaveNota], [atsClaveFT], [atsClaveFuente], [atsClaveUnidad], [atsTipo], [atsSalida], [atsAARev], [atsMMRev], [atsDDRev], [atsClaveAgrupaCob], [atsClaveAgrupaClas], [atsColMatriz], [atsColMatrizIng], [atsTipoGra], [atsInicio], [atsTipoCua]) VALUES (359, 809, 1, 2019, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, N'I', 0, 0, 0, 0, N'0010', NULL, N'Periodo', N'Period', NULL, 2014, N'AS')
INSERT [ManV2].[AtrSerie] ([atsClaveSerie], [atsClaveDescrip], [atsClaveFre], [atsAAPrelim], [atsMMPrelim], [atsDDPrelim], [atsAAEst], [atsMMEst], [atsDDEst], [atsDecimales], [atsClaveNota], [atsClaveFT], [atsClaveFuente], [atsClaveUnidad], [atsTipo], [atsSalida], [atsAARev], [atsMMRev], [atsDDRev], [atsClaveAgrupaCob], [atsClaveAgrupaClas], [atsColMatriz], [atsColMatrizIng], [atsTipoGra], [atsInicio], [atsTipoCua]) VALUES (350, 810, 1, 0,  0, 0, 0, 0, 0, 0, 0, 0, 0, 0, N'I', 0, 0, 0, 0, N'0010', NULL, N'Periodo', N'Period', NULL, 2014, N'AS')

 
-------------------------------------- Ajustado
 INSERT [ManV2].[Serie] ([serCveCobAgrupAnt], [serCveClaAgrup], [serClave], [serAADato], [serMMDato], [serDDDato], [serDato], [serNoDato], [serNota], [serLeyenda], [serLeyendaIng], [serCveCobAgrup]) VALUES (	NULL	,N'',358,2015,0,0,39.8,0,NULL,NULL,NULL	,N'00100010')
INSERT [ManV2].[Serie] ([serCveCobAgrupAnt], [serCveClaAgrup], [serClave], [serAADato], [serMMDato], [serDDDato], [serDato], [serNoDato], [serNota], [serLeyenda], [serLeyendaIng], [serCveCobAgrup]) VALUES (	NULL	,N'',358,2016,0,0,42.4,0,NULL,NULL,NULL	,N'00100010')
INSERT [ManV2].[Serie] ([serCveCobAgrupAnt], [serCveClaAgrup], [serClave], [serAADato], [serMMDato], [serDDDato], [serDato], [serNoDato], [serNota], [serLeyenda], [serLeyendaIng], [serCveCobAgrup]) VALUES (	NULL	,N'',358,2017,0,0,42.6,0,NULL,NULL,NULL	,N'00100010')
INSERT [ManV2].[Serie] ([serCveCobAgrupAnt], [serCveClaAgrup], [serClave], [serAADato], [serMMDato], [serDDDato], [serDato], [serNoDato], [serNota], [serLeyenda], [serLeyendaIng], [serCveCobAgrup]) VALUES (	NULL	,N'',358,2018,0,0,48.2,0,NULL,NULL,NULL	,N'00100010')
INSERT [ManV2].[Serie] ([serCveCobAgrupAnt], [serCveClaAgrup], [serClave], [serAADato], [serMMDato], [serDDDato], [serDato], [serNoDato], [serNota], [serLeyenda], [serLeyendaIng], [serCveCobAgrup]) VALUES (	NULL	,N'',358,2019,0,0,48.2,0,NULL,NULL,NULL	,N'00100010')
INSERT [ManV2].[Serie] ([serCveCobAgrupAnt], [serCveClaAgrup], [serClave], [serAADato], [serMMDato], [serDDDato], [serDato], [serNoDato], [serNota], [serLeyenda], [serLeyendaIng], [serCveCobAgrup]) VALUES (	NULL	,N'',359,2015,0,0,199,0,NULL,NULL,NULL	,N'00100010')
INSERT [ManV2].[Serie] ([serCveCobAgrupAnt], [serCveClaAgrup], [serClave], [serAADato], [serMMDato], [serDDDato], [serDato], [serNoDato], [serNota], [serLeyenda], [serLeyendaIng], [serCveCobAgrup]) VALUES (	NULL	,N'',359,2016,0,0,212,0,NULL,NULL,NULL	,N'00100010')
INSERT [ManV2].[Serie] ([serCveCobAgrupAnt], [serCveClaAgrup], [serClave], [serAADato], [serMMDato], [serDDDato], [serDato], [serNoDato], [serNota], [serLeyenda], [serLeyendaIng], [serCveCobAgrup]) VALUES (	NULL	,N'',359,2017,0,0,213,0,NULL,NULL,NULL	,N'00100010')
INSERT [ManV2].[Serie] ([serCveCobAgrupAnt], [serCveClaAgrup], [serClave], [serAADato], [serMMDato], [serDDDato], [serDato], [serNoDato], [serNota], [serLeyenda], [serLeyendaIng], [serCveCobAgrup]) VALUES (	NULL	,N'',359,2018,0,0,241,0,NULL,NULL,NULL	,N'00100010')
INSERT [ManV2].[Serie] ([serCveCobAgrupAnt], [serCveClaAgrup], [serClave], [serAADato], [serMMDato], [serDDDato], [serDato], [serNoDato], [serNota], [serLeyenda], [serLeyendaIng], [serCveCobAgrup]) VALUES (	NULL	,N'',359,2019,0,0,241,0,NULL,NULL,NULL	,N'00100010')
INSERT [ManV2].[Serie] ([serCveCobAgrupAnt], [serCveClaAgrup], [serClave], [serAADato], [serMMDato], [serDDDato], [serDato], [serNoDato], [serNota], [serLeyenda], [serLeyendaIng], [serCveCobAgrup]) VALUES (	NULL	,N'',360,2015,0,0,500,0,NULL,NULL,NULL	,N'00100010')
INSERT [ManV2].[Serie] ([serCveCobAgrupAnt], [serCveClaAgrup], [serClave], [serAADato], [serMMDato], [serDDDato], [serDato], [serNoDato], [serNota], [serLeyenda], [serLeyendaIng], [serCveCobAgrup]) VALUES (	NULL	,N'',360,2016,0,0,500,0,NULL,NULL,NULL	,N'00100010')
INSERT [ManV2].[Serie] ([serCveCobAgrupAnt], [serCveClaAgrup], [serClave], [serAADato], [serMMDato], [serDDDato], [serDato], [serNoDato], [serNota], [serLeyenda], [serLeyendaIng], [serCveCobAgrup]) VALUES (	NULL	,N'',360,2017,0,0,500,0,NULL,NULL,NULL	,N'00100010')
INSERT [ManV2].[Serie] ([serCveCobAgrupAnt], [serCveClaAgrup], [serClave], [serAADato], [serMMDato], [serDDDato], [serDato], [serNoDato], [serNota], [serLeyenda], [serLeyendaIng], [serCveCobAgrup]) VALUES (	NULL	,N'',360,2018,0,0,500,0,NULL,NULL,NULL	,N'00100010')
INSERT [ManV2].[Serie] ([serCveCobAgrupAnt], [serCveClaAgrup], [serClave], [serAADato], [serMMDato], [serDDDato], [serDato], [serNoDato], [serNota], [serLeyenda], [serLeyendaIng], [serCveCobAgrup]) VALUES (	NULL	,N'',360,2019,0,0,500,0,NULL,NULL,NULL	,N'00100010')


/****** AgrupaCob ******/


/****** FichaTecnica ******/
INSERT [ManV2].[FichaTecnica] ([ftClave], [ftDefinicion], [ftAlgoritmo], [ftUnidad], [ftImportancia], [ftCobGeo], [ftPeriodo], [ftFecEsp], [ftObs], [ftDefinicionIng], [ftImportanciaIng], [ftObsIng], [ftFecEspIng], [ftDescripCal], [ftDescripCalIng], [ftOportunidad], [ftOportunidadIng], [ftCobGeoft], [ftAlgoritmoIng]) VALUES (227, N'Es el número de  líneas del servicio fijo de telefonía por cada 100 habitantes en el país, al 31 de diciembre de cada año.', N'9_C_2_ES', 0, N'Este indicador permite medir el nivel de acceso de la población al servicio de telefonía fija, y en el caso de la desagregación por Entidad Federativa, la distribución de dicho acceso.', NULL, 2, NULL, N'Las Líneas Totales del Servicio Fijo de Telefonía son  la suma del total de líneas activas del Servicio Fijo de Telefonía por cada Operador. El número de líneas activas se contabiliza al finalizar el periodo monitoreado. Por ejemplo, para el reporte del segundo trimestre de 2017, el número reportado será el total de líneas activas al día 30 de junio de dicho año.', N'It is the number of fixed telephone service lines per 100 inhabitants in the country, as of December 31 of each year.', N'This indicator allows the measure of the population´s access level to fixed telephone service and in the case of state disaggregation, the distribution of said access.', N'The Total Lines of the Fixed Telephone Service are the sum of the total active lines of the Fixed Telephone Service for each Operator. The number of active lines is counted at the end of the monitored period. For example, for the report for the second quarter of 2017, the number reported will be the total number of active lines as of June 30 of that year.', NULL, N'Este indicador resulta de dividir el número de líneas totales del servicio fijo en un año específico entre la población total de dicho año, multiplicado por 100. Se expresa por cada 100 habitantes.', N'This indicator results from dividing the number of fixed service total lines in a specific year by the total population of that year, multiplied by 100. It is expressed per 100 inhabitants.', N'1 año', N'1 year', 4, N'9_C_2_EN')

/****** EnlFTMFte ******/

INSERT [ManV2].[EnlFTMFte] ([effClave], [effClaveFue], [effOrden]) VALUES (105,274,1)

/****** Fuentes ******/

INSERT [ManV2].[Fuentes] ([fueClave], [fueDescrip], [fueDescripIng]) VALUES (274, N'Cámara de Diputados <a target="_blank" class="liga3" href="http://www.diputados.gob.mx/">http://www.diputados.gob.mx/</a>', N'Cámara de Diputados <a target="_blank" class="liga3" href="http://www.diputados.gob.mx/">http://www.diputados.gob.mx/</a>')

/****** ENLFTRRI ******/

INSERT [ManV2].[EnlFTRRI] ([efrClave], [efrClaveRI], [efrOrden]) VALUES (105, 193, 1)

/****** RefInter ******/

INSERT [ManV2].[RefInter] ([riClave], [riDescrip], [riDescripIng]) VALUES (193, N'Sin referencia',N'Without reference')

/****** EnlFTRInst ******/

INSERT [ManV2].[EnlFTRInst] ([efiClave], [efiClaveInst], [efiOrden]) VALUES (105, 70, null)

/****** EnlFTCon ******/
INSERT [ManV2].[EnlFTCon] ([efcClaveFT], [efcClaveCon], [efcOrden]) VALUES (105, 33, 1)

/****** Contacto ******/
INSERT [ManV2].[Contacto] ([conClave], [conNombre], [conPuesto], [conTelefono], [conCorreo], [conDomicilio]) VALUES (33, N'María Eugenia Medina Domínguez', N'Directora de Estadística', N'55 5322 4200', N'mmedina@inmujeres.gob.mx', N'Boulevard Adolfo López Mateos # 3325 piso 5,¬Colonia San Jerónimo Lídice, C.P. 10200,¬Magdalena Contreras, Magdalena Contreras, Ciudad de México')

