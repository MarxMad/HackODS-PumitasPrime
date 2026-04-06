USE [ODS]
GO

BEGIN TRANSACTION [TransADD]
BEGIN TRY
	/*--------------- 1.1.1 */
	INSERT INTO [ManV2].[EnlIndTipo] values (1,'G',NULL)
	INSERT INTO [PreV2].[EnlIndTipo] values (1,'G',NULL)
	INSERT INTO [PubV2].[EnlIndTipo] values (1,'G',NULL)
	
	INSERT INTO [ManV2].[FTCob] VALUES (2,'Nacional, urbano y rural.','National, urban and rural','.','.')
	INSERT INTO [PreV2].[FTCob] VALUES (2,'Nacional, urbano y rural.','National, urban and rural','.','.')
	INSERT INTO [PubV2].[FTCob] VALUES (2,'Nacional, urbano y rural.','National, urban and rural','.','.')
	-------------
	INSERT INTO [ManV2].[Periodo] VALUES (31,'Bienal (1992-2018); 2005 <sup>1/</sup>','Bienal','Biennial (1992-2018); 2005 <sup>1/</sup>','Biennial')
	INSERT INTO [PreV2].[Periodo] VALUES (31,'Bienal (1992-2018); 2005 <sup>1/</sup>','Bienal','Biennial (1992-2018); 2005 <sup>1/</sup>','Biennial')
	INSERT INTO [PubV2].[Periodo] VALUES (31,'Bienal (1992-2018); 2005 <sup>1/</sup>','Bienal','Biennial (1992-2018); 2005 <sup>1/</sup>','Biennial')
	/*----------- */
	/* 1.2.1.a */
	INSERT INTO [ManV2].[FTCob] VALUES (21,'Nacional, entidad federativa y municipio.','National, by state and municipality.','.','.')
	INSERT INTO [PreV2].[FTCob] VALUES (21,'Nacional, entidad federativa y municipio.','National, by state and municipality.','.','.')
	INSERT INTO [PubV2].[FTCob] VALUES (21,'Nacional, entidad federativa y municipio.','National, by state and municipality.','.','.')
	-----------
	INSERT INTO [ManV2].[Periodo] VALUES (30,'Nacional y entidad federativa: Bienal. Municipios: Quinquenal','','National and by state: Biennial. Municipality: Quinquenal','')
	INSERT INTO [PreV2].[Periodo] VALUES (30,'Nacional y entidad federativa: Bienal. Municipios: Quinquenal','','National and by state: Biennial. Municipality: Quinquenal','')
	INSERT INTO [PubV2].[Periodo] VALUES (30,'Nacional y entidad federativa: Bienal. Municipios: Quinquenal','','National and by state: Biennial. Municipality: Quinquenal','')
	/*-------------INDICADOR 2.1.2 */
	INSERT INTO [ManV2].[FTCob] VALUES (24,'Nacional, grupos de edad y sexo','National, age groups and sex','','')
	INSERT INTO [PreV2].[FTCob] VALUES (24,'Nacional, grupos de edad y sexo','National, age groups and sex','','')
	INSERT INTO [PubV2].[FTCob] VALUES (24,'Nacional, grupos de edad y sexo','National, age groups and sex','','')
	----------
	INSERT INTO [ManV2].[Periodo] VALUES (20,'Bienal','Bienal','Biennial','Biennial')
	INSERT INTO [PreV2].[Periodo] VALUES (20,'Bienal','Bienal','Biennial','Biennial')
	INSERT INTO [PubV2].[Periodo] VALUES (20,'Bienal','Bienal','Biennial','Biennial')
	-------------
	/* indicador 3 -- */
	INSERT INTO [ManV2].[FTCob] VALUES (4,'Nacional y entidad federativa','National and state','NE','NE')
	INSERT INTO [PreV2].[FTCob] VALUES (4,'Nacional y entidad federativa','National and state','NE','NE')
	INSERT INTO [PubV2].[FTCob] VALUES (4,'Nacional y entidad federativa','National and state','NE','NE')
	--------
	INSERT INTO [ManV2].[Periodo] VALUES (2,'Anual','','Annual','')
	INSERT INTO [PreV2].[Periodo] VALUES (2,'Anual','','Annual','')
	INSERT INTO [PubV2].[Periodo] VALUES (2,'Anual','','Annual','')
	/*----- INDICADOR 5 ---*/
	INSERT INTO [ManV2].[FichaTecnica] VALUES (105,'Es la participación de las mujeres en los puestos de elección popular dentro de la Cámara de Diputados.','5_5_1_a_ES',0,'Medir la participación de las mujeres en puestos de toma de decisiones que son electas por consulta popular.','070',2,NULL,'La información de participación política es muy variante en el tiempo por lo cual no tiene una periodicidad establecida, sin embargo, se considerará a las mujeres que se encuentren en el cargo a la fecha de corte de la información.','Number of women that occupy seats in the Chamber of Deputies at the beginning of every term for every hundred deputies of the same term.','Measure the participation of women in decision-making positions that are elected by popular consultation.','The information on political participation is very variable over time, which is why it does not have an established periodicity, however, the women who are in office will be considered at the cut-off date of the information.',NULL,'Proporción de mujeres que fueron electas y/o fungen como diputadas con respecto al total de curules en la Cámara de Diputados.','The number of women members of the Chamber of Deputies of Congress divided by the total number of members in the corresponding legislature. The result is expressed as a percentage.','3 meses.','Three months.',6,'5_5_1_a_EN')
	INSERT INTO [PreV2].[FichaTecnica] VALUES (105,'Es la participación de las mujeres en los puestos de elección popular dentro de la Cámara de Diputados.','5_5_1_a_ES',0,'Medir la participación de las mujeres en puestos de toma de decisiones que son electas por consulta popular.','070',2,NULL,'La información de participación política es muy variante en el tiempo por lo cual no tiene una periodicidad establecida, sin embargo, se considerará a las mujeres que se encuentren en el cargo a la fecha de corte de la información.','Number of women that occupy seats in the Chamber of Deputies at the beginning of every term for every hundred deputies of the same term.','Measure the participation of women in decision-making positions that are elected by popular consultation.','The information on political participation is very variable over time, which is why it does not have an established periodicity, however, the women who are in office will be considered at the cut-off date of the information.',NULL,'Proporción de mujeres que fueron electas y/o fungen como diputadas con respecto al total de curules en la Cámara de Diputados.','The number of women members of the Chamber of Deputies of Congress divided by the total number of members in the corresponding legislature. The result is expressed as a percentage.','3 meses.','Three months.',6,'5_5_1_a_EN')
	INSERT INTO [PubV2].[FichaTecnica] VALUES (105,'Es la participación de las mujeres en los puestos de elección popular dentro de la Cámara de Diputados.','5_5_1_a_ES',0,'Medir la participación de las mujeres en puestos de toma de decisiones que son electas por consulta popular.','070',2,NULL,'La información de participación política es muy variante en el tiempo por lo cual no tiene una periodicidad establecida, sin embargo, se considerará a las mujeres que se encuentren en el cargo a la fecha de corte de la información.','Number of women that occupy seats in the Chamber of Deputies at the beginning of every term for every hundred deputies of the same term.','Measure the participation of women in decision-making positions that are elected by popular consultation.','The information on political participation is very variable over time, which is why it does not have an established periodicity, however, the women who are in office will be considered at the cut-off date of the information.',NULL,'Proporción de mujeres que fueron electas y/o fungen como diputadas con respecto al total de curules en la Cámara de Diputados.','The number of women members of the Chamber of Deputies of Congress divided by the total number of members in the corresponding legislature. The result is expressed as a percentage.','3 meses.','Three months.',6,'5_5_1_a_EN')
	---------
	INSERT INTO [ManV2].[FTCob] VALUES (6,'Nacional','National','Nal.','Nal.')
	INSERT INTO [PreV2].[FTCob] VALUES (6,'Nacional','National','Nal.','Nal.')
	INSERT INTO [PubV2].[FTCob] VALUES (6,'Nacional','National','Nal.','Nal.')
	---------
	------ 1.1.1
	-- notClave	NotNota	NotNotaIng
	INSERT INTO [ManV2].[Notas] VALUES (329,'La actualización del indicador está sujeta a la publicación de los microdatos por parte de INEGI.','The updating of the indicator is subject to the publication of microdata by INEGI.')
	INSERT INTO [PreV2].[Notas] VALUES (329,'La actualización del indicador está sujeta a la publicación de los microdatos por parte de INEGI.','The updating of the indicator is subject to the publication of microdata by INEGI.')
	INSERT INTO [PubV2].[Notas] VALUES (329,'La actualización del indicador está sujeta a la publicación de los microdatos por parte de INEGI.','The updating of the indicator is subject to the publication of microdata by INEGI.')

	--eigCveInd	eigCveGra	eigSeccion
	INSERT INTO [ManV2].[EnlIndGra] VALUES (1,1,'E')
	INSERT INTO [ManV2].[EnlIndGra] VALUES (1,2,'M')
	INSERT INTO [ManV2].[EnlIndGra] VALUES (1,2,'T')
	INSERT INTO [ManV2].[EnlIndGra] VALUES (1,6,'C')
	--eigCveInd	eigCveGra	eigSeccion
	INSERT INTO [PreV2].[EnlIndGra] VALUES (1,1,'E')
	INSERT INTO [PreV2].[EnlIndGra] VALUES (1,2,'M')
	INSERT INTO [PreV2].[EnlIndGra] VALUES (1,2,'T')
	INSERT INTO [PreV2].[EnlIndGra] VALUES (1,6,'C')
	--eigCveInd	eigCveGra	eigSeccion
	INSERT INTO [PubV2].[EnlIndGra] VALUES (1,1,'E')
	INSERT INTO [PubV2].[EnlIndGra] VALUES (1,2,'M')
	INSERT INTO [PubV2].[EnlIndGra] VALUES (1,2,'T')
	INSERT INTO [PubV2].[EnlIndGra] VALUES (1,6,'C')

	--graClave	graDescrip	graAbrevia	graDescripIng	graAbreviaIng
	INSERT INTO [ManV2].[Grafica] VALUES (3,'Columna','C',NULL,NULL)
	INSERT INTO [ManV2].[Grafica] VALUES (4,'Burbuja','Bj',NULL,NULL)
	INSERT INTO [ManV2].[Grafica] VALUES (5,'Pie','P',NULL,NULL)
	INSERT INTO [ManV2].[Grafica] VALUES (7,'Barras 32 edos','Be',NULL,NULL)
	--graClave	graDescrip	graAbrevia	graDescripIng	graAbreviaIng
	INSERT INTO [PreV2].[Grafica] VALUES (3,'Columna','C',NULL,NULL)
	INSERT INTO [PreV2].[Grafica] VALUES (4,'Burbuja','Bj',NULL,NULL)
	INSERT INTO [PreV2].[Grafica] VALUES (5,'Pie','P',NULL,NULL)
	INSERT INTO [PreV2].[Grafica] VALUES (7,'Barras 32 edos','Be',NULL,NULL)
	--graClave	graDescrip	graAbrevia	graDescripIng	graAbreviaIng
	INSERT INTO [PubV2].[Grafica] VALUES (3,'Columna','C',NULL,NULL)
	INSERT INTO [PubV2].[Grafica] VALUES (4,'Burbuja','Bj',NULL,NULL)
	INSERT INTO [PubV2].[Grafica] VALUES (5,'Pie','P',NULL,NULL)
	INSERT INTO [PubV2].[Grafica] VALUES (7,'Barras 32 edos','Be',NULL,NULL)

	--notClave	NotNota	NotNotaIng
	INSERT INTO [ManV2].[Notas] VALUES (282,'A partir de 2006 se utiliza la ENIGH con factores ajustados a las proyecciones de población de CONAPO, actualizadas en abril de 2013.¬La información de 1992 se toma de los datos históricos del indicador.¬Urbana: Localidades de 15,000 habitantes y más.¬Rural: Localidades de menos de 15,000 habitantes.','As of 2006, the ENIGH is used with factors adjusted to the population projections of CONAPO, updated in April 2013.¬The 1992 information is taken from the historical data of the indicator.¬Urban: Localities of 15,000 inhabitants and more.¬Rural: Localities of less than 15,000 inhabitants.')
	INSERT INTO [PreV2].[Notas] VALUES (282,'A partir de 2006 se utiliza la ENIGH con factores ajustados a las proyecciones de población de CONAPO, actualizadas en abril de 2013.¬La información de 1992 se toma de los datos históricos del indicador.¬Urbana: Localidades de 15,000 habitantes y más.¬Rural: Localidades de menos de 15,000 habitantes.','As of 2006, the ENIGH is used with factors adjusted to the population projections of CONAPO, updated in April 2013.¬The 1992 information is taken from the historical data of the indicator.¬Urban: Localities of 15,000 inhabitants and more.¬Rural: Localities of less than 15,000 inhabitants.')
	INSERT INTO [PubV2].[Notas] VALUES (282,'A partir de 2006 se utiliza la ENIGH con factores ajustados a las proyecciones de población de CONAPO, actualizadas en abril de 2013.¬La información de 1992 se toma de los datos históricos del indicador.¬Urbana: Localidades de 15,000 habitantes y más.¬Rural: Localidades de menos de 15,000 habitantes.','As of 2006, the ENIGH is used with factors adjusted to the population projections of CONAPO, updated in April 2013.¬The 1992 information is taken from the historical data of the indicator.¬Urban: Localities of 15,000 inhabitants and more.¬Rural: Localities of less than 15,000 inhabitants.')

	--fueClave	fueDescrip	fueDescripIng
	INSERT INTO [ManV2].[Fuentes] VALUES (249,'Estimaciones del CONEVAL con base en información del INEGI, ENIGH 1992 - 2014 y el MEC del MCS-ENIGH 2016 y 2018.','CONEVAL estimates based on information from INEGI, ENIGH 1992 - 2014 and the MEC of MCS-ENIGH 2016 and 2018.')
	INSERT INTO [PreV2].[Fuentes] VALUES (249,'Estimaciones del CONEVAL con base en información del INEGI, ENIGH 1992 - 2014 y el MEC del MCS-ENIGH 2016 y 2018.','CONEVAL estimates based on information from INEGI, ENIGH 1992 - 2014 and the MEC of MCS-ENIGH 2016 and 2018.')
	INSERT INTO [PubV2].[Fuentes] VALUES (249,'Estimaciones del CONEVAL con base en información del INEGI, ENIGH 1992 - 2014 y el MEC del MCS-ENIGH 2016 y 2018.','CONEVAL estimates based on information from INEGI, ENIGH 1992 - 2014 and the MEC of MCS-ENIGH 2016 and 2018.')
	-------
	/******/
	-- catálogos
	INSERT INTO [ManV2].[Unidad] VALUES (239,'Miles de personas','','Thousands of people','')
	INSERT INTO [PreV2].[Unidad] VALUES (239,'Miles de personas','','Thousands of people','')
	INSERT INTO [PubV2].[Unidad] VALUES (239,'Miles de personas','','Thousands of people','')
	-------------- 
	INSERT INTO [ManV2].[TipoIndicador] VALUES('C','Regionales','R','Son los indicadores definidos en el marco de la CEA-CEPAL.','Regional','R','These are the indicators defined within the framework of the SCA-ECLAC).')
	INSERT INTO [PreV2].[TipoIndicador] VALUES('C','Regionales','R','Son los indicadores definidos en el marco de la CEA-CEPAL.','Regional','R','These are the indicators defined within the framework of the SCA-ECLAC).')
	INSERT INTO [PubV2].[TipoIndicador] VALUES('C','Regionales','R','Son los indicadores definidos en el marco de la CEA-CEPAL.','Regional','R','These are the indicators defined within the framework of the SCA-ECLAC).')

	----------
	INSERT  INTO [ManV2].[DescripcionPCve] VALUES (1,'Pobres, canasta básica, personas con ingreso insuficiente, miseria, bienestar, rezago, desigualdad, carencia, hambre','','','')
	----------
	INSERT INTO [ManV2].[EnlIndPCve] VALUES (1,1)
	INSERT INTO [PreV2].[EnlIndPCve] VALUES (1,1)
	INSERT INTO [PubV2].[EnlIndPCve] VALUES (1,1)
	---------
	INSERT INTO [ManV2].[EnlacePCve] VALUES (1,1)
	INSERT INTO [ManV2].[EnlacePCve] VALUES (1,79)
	INSERT INTO [ManV2].[EnlacePCve] VALUES (1,80)
	INSERT INTO [ManV2].[EnlacePCve] VALUES (37,96)
	---------
	INSERT INTO [PreV2].[EnlacePCve] VALUES (1,1)
	INSERT INTO [PreV2].[EnlacePCve] VALUES (1,79)
	INSERT INTO [PreV2].[EnlacePCve] VALUES (1,80)
	INSERT INTO [PreV2].[EnlacePCve] VALUES (37,96)
	---------
	INSERT INTO [PubV2].[EnlacePCve] VALUES (1,1)
	INSERT INTO [PubV2].[EnlacePCve] VALUES (1,79)
	INSERT INTO [PubV2].[EnlacePCve] VALUES (1,80)
	INSERT INTO [PubV2].[EnlacePCve] VALUES (37,96)
	-----------
	INSERT INTO [ManV2].[EnlacePCveIng] VALUES (1, 67)
	INSERT INTO [ManV2].[EnlacePCveIng] VALUES (4, 67)
	INSERT INTO [ManV2].[EnlacePCveIng] VALUES (4, 78)
	INSERT INTO [ManV2].[EnlacePCveIng] VALUES (8, 6)
	INSERT INTO [ManV2].[EnlacePCveIng] VALUES (8, 68)
	INSERT INTO [ManV2].[EnlacePCveIng] VALUES (8, 77)
	INSERT INTO [ManV2].[EnlacePCveIng] VALUES (8, 78)
	INSERT INTO [ManV2].[EnlacePCveIng] VALUES (28, 72)
	INSERT INTO [ManV2].[EnlacePCveIng] VALUES (28, 73)
	INSERT INTO [ManV2].[EnlacePCveIng] VALUES (37, 74)
	INSERT INTO [ManV2].[EnlacePCveIng] VALUES (37, 75)
	INSERT INTO [ManV2].[EnlacePCveIng] VALUES (80, 81)
	INSERT INTO [ManV2].[EnlacePCveIng] VALUES (80, 82)
	-----------
	INSERT INTO [PreV2].[EnlacePCveIng] VALUES (1, 67)
	INSERT INTO [PreV2].[EnlacePCveIng] VALUES (4, 67)
	INSERT INTO [PreV2].[EnlacePCveIng] VALUES (4, 78)
	INSERT INTO [PreV2].[EnlacePCveIng] VALUES (8, 6)
	INSERT INTO [PreV2].[EnlacePCveIng] VALUES (8, 68)
	INSERT INTO [PreV2].[EnlacePCveIng] VALUES (8, 77)
	INSERT INTO [PreV2].[EnlacePCveIng] VALUES (8, 78)
	INSERT INTO [PreV2].[EnlacePCveIng] VALUES (28, 72)
	INSERT INTO [PreV2].[EnlacePCveIng] VALUES (28, 73)
	INSERT INTO [PreV2].[EnlacePCveIng] VALUES (37, 74)
	INSERT INTO [PreV2].[EnlacePCveIng] VALUES (37, 75)
	INSERT INTO [PreV2].[EnlacePCveIng] VALUES (80, 81)
	INSERT INTO [PreV2].[EnlacePCveIng] VALUES (80, 82)
	-----------
	INSERT INTO [PubV2].[EnlacePCveIng] VALUES (1, 67)
	INSERT INTO [PubV2].[EnlacePCveIng] VALUES (4, 67)
	INSERT INTO [PubV2].[EnlacePCveIng] VALUES (4, 78)
	INSERT INTO [PubV2].[EnlacePCveIng] VALUES (8, 6)
	INSERT INTO [PubV2].[EnlacePCveIng] VALUES (8, 68)
	INSERT INTO [PubV2].[EnlacePCveIng] VALUES (8, 77)
	INSERT INTO [PubV2].[EnlacePCveIng] VALUES (8, 78)
	INSERT INTO [PubV2].[EnlacePCveIng] VALUES (28, 72)
	INSERT INTO [PubV2].[EnlacePCveIng] VALUES (28, 73)
	INSERT INTO [PubV2].[EnlacePCveIng] VALUES (37, 74)
	INSERT INTO [PubV2].[EnlacePCveIng] VALUES (37, 75)
	INSERT INTO [PubV2].[EnlacePCveIng] VALUES (80, 81)
	INSERT INTO [PubV2].[EnlacePCveIng] VALUES (80, 82)
	------------
	INSERT INTO [ManV2].[LexicoPCve] VALUES ('POBREC',1)
	INSERT INTO [pREV2].[LexicoPCve] VALUES ('POBREC',1)
	INSERT INTO [PubV2].[LexicoPCve] VALUES ('POBREC',1)
	----------
	INSERT INTO [ManV2].[LexicoPCveIng] VALUES ('SCIENCE', 1)
	INSERT INTO [ManV2].[LexicoPCveIng] VALUES ('INNOVATION', 4)
	INSERT INTO [ManV2].[LexicoPCveIng] VALUES ('DONATION', 8)
	INSERT INTO [ManV2].[LexicoPCveIng] VALUES ('PARTICIPATION', 28)
	INSERT INTO [ManV2].[LexicoPCveIng] VALUES ('OFFER', 80)
		----------
	INSERT INTO [PreV2].[LexicoPCveIng] VALUES ('SCIENCE', 1)
	INSERT INTO [PreV2].[LexicoPCveIng] VALUES ('INNOVATION', 4)
	INSERT INTO [PreV2].[LexicoPCveIng] VALUES ('DONATION', 8)
	INSERT INTO [PreV2].[LexicoPCveIng] VALUES ('PARTICIPATION', 28)
	INSERT INTO [PreV2].[LexicoPCveIng] VALUES ('OFFER', 80)
		----------
	INSERT INTO [PubV2].[LexicoPCveIng] VALUES ('SCIENCE', 1)
	INSERT INTO [PubV2].[LexicoPCveIng] VALUES ('INNOVATION', 4)
	INSERT INTO [PubV2].[LexicoPCveIng] VALUES ('DONATION', 8)
	INSERT INTO [PubV2].[LexicoPCveIng] VALUES ('PARTICIPATION', 28)
	INSERT INTO [PubV2].[LexicoPCveIng] VALUES ('OFFER', 80)

	------- Actualización
	update [ManV2].[Descripcion] set desCodigo = 'Meta 1.1' where desClave = 2 and  desCodigo = 'Meta 1,1' 
	update [PreV2].[Descripcion] set desCodigo = 'Meta 1.1' where desClave = 2 and  desCodigo = 'Meta 1,1' 
	update [PubV2].[Descripcion] set desCodigo = 'Meta 1.1' where desClave = 2 and  desCodigo = 'Meta 1,1' 

	-------actualizaciones
	UPDATE [ManV2].[AtrSerie] set atsInicio = 2015 where atsClaveSerie = 358 and atsInicio = 2014
	UPDATE [PreV2].[AtrSerie] set atsInicio = 2015 where atsClaveSerie = 358 and atsInicio = 2014
	UPDATE [PubV2].[AtrSerie] set atsInicio = 2015 where atsClaveSerie = 358 and atsInicio = 2014
	--------------------
	UPDATE [ManV2].[AtrSerie] set atsAAPrelim = 0, atsInicio = 2015 WHERE atsClaveSerie =  359 and  atsAAPrelim = 2019
	UPDATE [PreV2].[AtrSerie] set atsAAPrelim = 0, atsInicio = 2015 WHERE atsClaveSerie =  359 and  atsAAPrelim = 2019
	UPDATE [PubV2].[AtrSerie] set atsAAPrelim = 0, atsInicio = 2015 WHERE atsClaveSerie =  359 and  atsAAPrelim = 2019
	----------
	INSERT INTO [ManV2].[AtrSerie] VALUES (360,810,1,0,0,0,0,0,0,0,0,0,0,0,'I',0,0,0,0,'0010',NULL,'Periodo','Period',NULL,2015,'AS')
	INSERT INTO [PreV2].[AtrSerie] VALUES (360,810,1,0,0,0,0,0,0,0,0,0,0,0,'I',0,0,0,0,'0010',NULL,'Periodo','Period',NULL,2015,'AS')
	INSERT INTO [PubV2].[AtrSerie] VALUES (360,810,1,0,0,0,0,0,0,0,0,0,0,0,'I',0,0,0,0,'0010',NULL,'Periodo','Period',NULL,2015,'AS')
	-------------------------------------
	INSERT INTO [ManV2].[Notas] VALUES(231,'Para 1990-2010 se utilizan los nacimientos del INEGI, y a partir de 2011 los nacimientos del  SINAC-SS (Subsistema de Información Sobre Nacimientos) con sus respectivos ajustes.','For 1990-2010 are used births of INEGI  and from 2011 live births of the SINAC-SS (Subsystem of Births Information) with their respective adjustments.')
	INSERT INTO [PreV2].[Notas] VALUES(231,'Para 1990-2010 se utilizan los nacimientos del INEGI, y a partir de 2011 los nacimientos del  SINAC-SS (Subsistema de Información Sobre Nacimientos) con sus respectivos ajustes.','For 1990-2010 are used births of INEGI  and from 2011 live births of the SINAC-SS (Subsystem of Births Information) with their respective adjustments.')
	INSERT INTO [PubV2].[Notas] VALUES(231,'Para 1990-2010 se utilizan los nacimientos del INEGI, y a partir de 2011 los nacimientos del  SINAC-SS (Subsistema de Información Sobre Nacimientos) con sus respectivos ajustes.','For 1990-2010 are used births of INEGI  and from 2011 live births of the SINAC-SS (Subsystem of Births Information) with their respective adjustments.')
	---------------
	INSERT INTO [ManV2].[Fuentes] VALUES(150,'SS. Dirección General de Información en Salud (DGIS).','SS. Directorate General on Health Information (DGIS).')
	INSERT INTO [ManV2].[Fuentes] VALUES(395,'Cámara de Diputados.','Chamber of Deputies')
	INSERT INTO [ManV2].[Fuentes] VALUES(486,'Estimaciones del CONEVAL con base en información del INEGI, MCS-ENIGH 2008 - 2014 y el MEC del MCS-ENIGH 2016 y 2018.','CONEVAL estimates based on information from INEGI, MCS-ENIGH 2008 - 2014 and the MEC of MCS-ENIGH 2016 and 2018.')
		---------------
	INSERT INTO [PreV2].[Fuentes] VALUES(150,'SS. Dirección General de Información en Salud (DGIS).','SS. Directorate General on Health Information (DGIS).')
	INSERT INTO [PreV2].[Fuentes] VALUES(395,'Cámara de Diputados.','Chamber of Deputies')
	INSERT INTO [PreV2].[Fuentes] VALUES(486,'Estimaciones del CONEVAL con base en información del INEGI, MCS-ENIGH 2008 - 2014 y el MEC del MCS-ENIGH 2016 y 2018.','CONEVAL estimates based on information from INEGI, MCS-ENIGH 2008 - 2014 and the MEC of MCS-ENIGH 2016 and 2018.')

	---------------
	INSERT INTO [PubV2].[Fuentes] VALUES(150,'SS. Dirección General de Información en Salud (DGIS).','SS. Directorate General on Health Information (DGIS).')
	INSERT INTO [PubV2].[Fuentes] VALUES(395,'Cámara de Diputados.','Chamber of Deputies')
	INSERT INTO [PubV2].[Fuentes] VALUES(486,'Estimaciones del CONEVAL con base en información del INEGI, MCS-ENIGH 2008 - 2014 y el MEC del MCS-ENIGH 2016 y 2018.','CONEVAL estimates based on information from INEGI, MCS-ENIGH 2008 - 2014 and the MEC of MCS-ENIGH 2016 and 2018.')
	-----------------------------------------------------------------------------
	INSERT INTO [ManV2].[atrAgrupaClaPorInd] VALUES (355,'020010','C',NULL,1,1,1)
	INSERT INTO [ManV2].[atrAgrupaClaPorInd] VALUES (355,'020020','C',NULL,2,2,2)
	INSERT INTO [ManV2].[atrAgrupaClaPorInd] VALUES (355,'020030','C',NULL,3,3,3)
	INSERT INTO [ManV2].[atrAgrupaClaPorInd] VALUES (634,'020010','C',NULL,1,1,1)
	INSERT INTO [ManV2].[atrAgrupaClaPorInd] VALUES (634,'020020','C',NULL,2,2,2)
	INSERT INTO [ManV2].[atrAgrupaClaPorInd] VALUES (634,'020030','C',NULL,3,3,3)
	INSERT INTO [ManV2].[atrAgrupaClaPorInd] VALUES (637,'020010','C',NULL,1,1,1)
	INSERT INTO [ManV2].[atrAgrupaClaPorInd] VALUES (637,'020020','C',NULL,2,2,2)
	INSERT INTO [ManV2].[atrAgrupaClaPorInd] VALUES (637,'020030','C',NULL,3,3,3)
	INSERT INTO [ManV2].[atrAgrupaClaPorInd] VALUES (854,'110010','C',NULL,1,1,1)
	INSERT INTO [ManV2].[atrAgrupaClaPorInd] VALUES (854,'110020','C',NULL,2,2,2)
	INSERT INTO [ManV2].[atrAgrupaClaPorInd] VALUES (854,'110030','C',NULL,3,3,3)
	INSERT INTO [ManV2].[atrAgrupaClaPorInd] VALUES (854,'110040','C',NULL,4,4,4)
	INSERT INTO [ManV2].[atrAgrupaClaPorInd] VALUES (854,'110050','C',NULL,5,5,5)
	INSERT INTO [ManV2].[atrAgrupaClaPorInd] VALUES (854,'110060','C',NULL,6,6,6)
	INSERT INTO [ManV2].[atrAgrupaClaPorInd] VALUES (854,'110070','C',NULL,7,7,7)
	INSERT INTO [ManV2].[atrAgrupaClaPorInd] VALUES (854,'110080','C',NULL,8,8,8)
	INSERT INTO [ManV2].[atrAgrupaClaPorInd] VALUES (854,'110090','C',NULL,9,9,9)
	INSERT INTO [ManV2].[atrAgrupaClaPorInd] VALUES (855,'110010','C',NULL,1,1,1)
	INSERT INTO [ManV2].[atrAgrupaClaPorInd] VALUES (855,'110020','C',NULL,2,2,2)
	INSERT INTO [ManV2].[atrAgrupaClaPorInd] VALUES (855,'110030','C',NULL,3,3,3)
	INSERT INTO [ManV2].[atrAgrupaClaPorInd] VALUES (855,'110040','C',NULL,4,4,4)
	INSERT INTO [ManV2].[atrAgrupaClaPorInd] VALUES (855,'110050','C',NULL,5,5,5)
	INSERT INTO [ManV2].[atrAgrupaClaPorInd] VALUES (855,'110060','C',NULL,6,6,6)
	INSERT INTO [ManV2].[atrAgrupaClaPorInd] VALUES (855,'110070','C',NULL,7,7,7)
	INSERT INTO [ManV2].[atrAgrupaClaPorInd] VALUES (855,'110080','C',NULL,8,8,8)
	INSERT INTO [ManV2].[atrAgrupaClaPorInd] VALUES (855,'110090','C',NULL,9,9,9)
	INSERT INTO [ManV2].[atrAgrupaClaPorInd] VALUES (856,'110010','C',NULL,1,1,1)
	INSERT INTO [ManV2].[atrAgrupaClaPorInd] VALUES (856,'110020','C',NULL,2,2,2)
	INSERT INTO [ManV2].[atrAgrupaClaPorInd] VALUES (856,'110030','C',NULL,3,3,3)
	INSERT INTO [ManV2].[atrAgrupaClaPorInd] VALUES (856,'110040','C',NULL,4,4,4)
	INSERT INTO [ManV2].[atrAgrupaClaPorInd] VALUES (856,'110050','C',NULL,5,5,5)
	INSERT INTO [ManV2].[atrAgrupaClaPorInd] VALUES (856,'110060','C',NULL,6,6,6)
	INSERT INTO [ManV2].[atrAgrupaClaPorInd] VALUES (856,'110070','C',NULL,7,7,7)
	INSERT INTO [ManV2].[atrAgrupaClaPorInd] VALUES (856,'110080','C',NULL,8,8,8)
	INSERT INTO [ManV2].[atrAgrupaClaPorInd] VALUES (856,'110090','C',NULL,9,9,9)
	-----------------------------------------------------------------------------
	INSERT INTO [PreV2].[atrAgrupaClaPorInd] VALUES (355,'020010','C',NULL,1,1,1)
	INSERT INTO [PreV2].[atrAgrupaClaPorInd] VALUES (355,'020020','C',NULL,2,2,2)
	INSERT INTO [PreV2].[atrAgrupaClaPorInd] VALUES (355,'020030','C',NULL,3,3,3)
	INSERT INTO [PreV2].[atrAgrupaClaPorInd] VALUES (634,'020010','C',NULL,1,1,1)
	INSERT INTO [PreV2].[atrAgrupaClaPorInd] VALUES (634,'020020','C',NULL,2,2,2)
	INSERT INTO [PreV2].[atrAgrupaClaPorInd] VALUES (634,'020030','C',NULL,3,3,3)
	INSERT INTO [PreV2].[atrAgrupaClaPorInd] VALUES (637,'020010','C',NULL,1,1,1)
	INSERT INTO [PreV2].[atrAgrupaClaPorInd] VALUES (637,'020020','C',NULL,2,2,2)
	INSERT INTO [PreV2].[atrAgrupaClaPorInd] VALUES (637,'020030','C',NULL,3,3,3)
	INSERT INTO [PreV2].[atrAgrupaClaPorInd] VALUES (854,'110010','C',NULL,1,1,1)
	INSERT INTO [PreV2].[atrAgrupaClaPorInd] VALUES (854,'110020','C',NULL,2,2,2)
	INSERT INTO [PreV2].[atrAgrupaClaPorInd] VALUES (854,'110030','C',NULL,3,3,3)
	INSERT INTO [PreV2].[atrAgrupaClaPorInd] VALUES (854,'110040','C',NULL,4,4,4)
	INSERT INTO [PreV2].[atrAgrupaClaPorInd] VALUES (854,'110050','C',NULL,5,5,5)
	INSERT INTO [PreV2].[atrAgrupaClaPorInd] VALUES (854,'110060','C',NULL,6,6,6)
	INSERT INTO [PreV2].[atrAgrupaClaPorInd] VALUES (854,'110070','C',NULL,7,7,7)
	INSERT INTO [PreV2].[atrAgrupaClaPorInd] VALUES (854,'110080','C',NULL,8,8,8)
	INSERT INTO [PreV2].[atrAgrupaClaPorInd] VALUES (854,'110090','C',NULL,9,9,9)
	INSERT INTO [PreV2].[atrAgrupaClaPorInd] VALUES (855,'110010','C',NULL,1,1,1)
	INSERT INTO [PreV2].[atrAgrupaClaPorInd] VALUES (855,'110020','C',NULL,2,2,2)
	INSERT INTO [PreV2].[atrAgrupaClaPorInd] VALUES (855,'110030','C',NULL,3,3,3)
	INSERT INTO [PreV2].[atrAgrupaClaPorInd] VALUES (855,'110040','C',NULL,4,4,4)
	INSERT INTO [PreV2].[atrAgrupaClaPorInd] VALUES (855,'110050','C',NULL,5,5,5)
	INSERT INTO [PreV2].[atrAgrupaClaPorInd] VALUES (855,'110060','C',NULL,6,6,6)
	INSERT INTO [PreV2].[atrAgrupaClaPorInd] VALUES (855,'110070','C',NULL,7,7,7)
	INSERT INTO [PreV2].[atrAgrupaClaPorInd] VALUES (855,'110080','C',NULL,8,8,8)
	INSERT INTO [PreV2].[atrAgrupaClaPorInd] VALUES (855,'110090','C',NULL,9,9,9)
	INSERT INTO [PreV2].[atrAgrupaClaPorInd] VALUES (856,'110010','C',NULL,1,1,1)
	INSERT INTO [PreV2].[atrAgrupaClaPorInd] VALUES (856,'110020','C',NULL,2,2,2)
	INSERT INTO [PreV2].[atrAgrupaClaPorInd] VALUES (856,'110030','C',NULL,3,3,3)
	INSERT INTO [PreV2].[atrAgrupaClaPorInd] VALUES (856,'110040','C',NULL,4,4,4)
	INSERT INTO [PreV2].[atrAgrupaClaPorInd] VALUES (856,'110050','C',NULL,5,5,5)
	INSERT INTO [PreV2].[atrAgrupaClaPorInd] VALUES (856,'110060','C',NULL,6,6,6)
	INSERT INTO [PreV2].[atrAgrupaClaPorInd] VALUES (856,'110070','C',NULL,7,7,7)
	INSERT INTO [PreV2].[atrAgrupaClaPorInd] VALUES (856,'110080','C',NULL,8,8,8)
	INSERT INTO [PreV2].[atrAgrupaClaPorInd] VALUES (856,'110090','C',NULL,9,9,9)
	-----------------------------------------------------------------------------
	INSERT INTO [PubV2].[atrAgrupaClaPorInd] VALUES (355,'020010','C',NULL,1,1,1)
	INSERT INTO [PubV2].[atrAgrupaClaPorInd] VALUES (355,'020020','C',NULL,2,2,2)
	INSERT INTO [PubV2].[atrAgrupaClaPorInd] VALUES (355,'020030','C',NULL,3,3,3)
	INSERT INTO [PubV2].[atrAgrupaClaPorInd] VALUES (634,'020010','C',NULL,1,1,1)
	INSERT INTO [PubV2].[atrAgrupaClaPorInd] VALUES (634,'020020','C',NULL,2,2,2)
	INSERT INTO [PubV2].[atrAgrupaClaPorInd] VALUES (634,'020030','C',NULL,3,3,3)
	INSERT INTO [PubV2].[atrAgrupaClaPorInd] VALUES (637,'020010','C',NULL,1,1,1)
	INSERT INTO [PubV2].[atrAgrupaClaPorInd] VALUES (637,'020020','C',NULL,2,2,2)
	INSERT INTO [PubV2].[atrAgrupaClaPorInd] VALUES (637,'020030','C',NULL,3,3,3)
	INSERT INTO [PubV2].[atrAgrupaClaPorInd] VALUES (854,'110010','C',NULL,1,1,1)
	INSERT INTO [PubV2].[atrAgrupaClaPorInd] VALUES (854,'110020','C',NULL,2,2,2)
	INSERT INTO [PubV2].[atrAgrupaClaPorInd] VALUES (854,'110030','C',NULL,3,3,3)
	INSERT INTO [PubV2].[atrAgrupaClaPorInd] VALUES (854,'110040','C',NULL,4,4,4)
	INSERT INTO [PubV2].[atrAgrupaClaPorInd] VALUES (854,'110050','C',NULL,5,5,5)
	INSERT INTO [PubV2].[atrAgrupaClaPorInd] VALUES (854,'110060','C',NULL,6,6,6)
	INSERT INTO [PubV2].[atrAgrupaClaPorInd] VALUES (854,'110070','C',NULL,7,7,7)
	INSERT INTO [PubV2].[atrAgrupaClaPorInd] VALUES (854,'110080','C',NULL,8,8,8)
	INSERT INTO [PubV2].[atrAgrupaClaPorInd] VALUES (854,'110090','C',NULL,9,9,9)
	INSERT INTO [PubV2].[atrAgrupaClaPorInd] VALUES (855,'110010','C',NULL,1,1,1)
	INSERT INTO [PubV2].[atrAgrupaClaPorInd] VALUES (855,'110020','C',NULL,2,2,2)
	INSERT INTO [PubV2].[atrAgrupaClaPorInd] VALUES (855,'110030','C',NULL,3,3,3)
	INSERT INTO [PubV2].[atrAgrupaClaPorInd] VALUES (855,'110040','C',NULL,4,4,4)
	INSERT INTO [PubV2].[atrAgrupaClaPorInd] VALUES (855,'110050','C',NULL,5,5,5)
	INSERT INTO [PubV2].[atrAgrupaClaPorInd] VALUES (855,'110060','C',NULL,6,6,6)
	INSERT INTO [PubV2].[atrAgrupaClaPorInd] VALUES (855,'110070','C',NULL,7,7,7)
	INSERT INTO [PubV2].[atrAgrupaClaPorInd] VALUES (855,'110080','C',NULL,8,8,8)
	INSERT INTO [PubV2].[atrAgrupaClaPorInd] VALUES (855,'110090','C',NULL,9,9,9)
	INSERT INTO [PubV2].[atrAgrupaClaPorInd] VALUES (856,'110010','C',NULL,1,1,1)
	INSERT INTO [PubV2].[atrAgrupaClaPorInd] VALUES (856,'110020','C',NULL,2,2,2)
	INSERT INTO [PubV2].[atrAgrupaClaPorInd] VALUES (856,'110030','C',NULL,3,3,3)
	INSERT INTO [PubV2].[atrAgrupaClaPorInd] VALUES (856,'110040','C',NULL,4,4,4)
	INSERT INTO [PubV2].[atrAgrupaClaPorInd] VALUES (856,'110050','C',NULL,5,5,5)
	INSERT INTO [PubV2].[atrAgrupaClaPorInd] VALUES (856,'110060','C',NULL,6,6,6)
	INSERT INTO [PubV2].[atrAgrupaClaPorInd] VALUES (856,'110070','C',NULL,7,7,7)
	INSERT INTO [PubV2].[atrAgrupaClaPorInd] VALUES (856,'110080','C',NULL,8,8,8)
	INSERT INTO [PubV2].[atrAgrupaClaPorInd] VALUES (856,'110090','C',NULL,9,9,9)
	-----------------------------------------------------------------------------
	/********************************************************************************************************************/
	INSERT INTO [ManV2].[Descripcion] VALUES(193,'Partos atendidos con asistencia de personal sanitario especializado','','','Deliveries attended by skilled health personnel','','')
	INSERT INTO [ManV2].[Descripcion] VALUES(194,'Total de partos atendidos','','','Total of attended births','','')
	-------
	INSERT INTO [PreV2].[Descripcion] VALUES(193,'Partos atendidos con asistencia de personal sanitario especializado','','','Deliveries attended by skilled health personnel','','')
	INSERT INTO [PreV2].[Descripcion] VALUES(194,'Total de partos atendidos','','','Total of attended births','','')
	-----
	INSERT INTO [PubV2].[Descripcion] VALUES(193,'Partos atendidos con asistencia de personal sanitario especializado','','','Deliveries attended by skilled health personnel','','')
	INSERT INTO [PubV2].[Descripcion] VALUES(194,'Total de partos atendidos','','','Total of attended births','','')
	------------------
	----- para el 5
	INSERT INTO [ManV2].[Descripcion] VALUES(809,'Mujeres titulares de una curul en la Cámara','','','Women holding a seat in the Chamber','','')
	INSERT INTO [ManV2].[Descripcion] VALUES(810,'Total de curules en la Cámara','','','Total seats in the Chamber','','')
	-----
	INSERT INTO [PreV2].[Descripcion] VALUES(809,'Mujeres titulares de una curul en la Cámara','','','Women holding a seat in the Chamber','','')
	INSERT INTO [PreV2].[Descripcion] VALUES(810,'Total de curules en la Cámaraa','','','Total seats in the Chamber','','')
	-----
	INSERT INTO [PubV2].[Descripcion] VALUES(809,'Mujeres titulares de una curul en la Cámara','','','Women holding a seat in the Chamber','','')
	INSERT INTO [PubV2].[Descripcion] VALUES(810,'Total de curules en la Cámara','','','Total seats in the Chamber','','')
	---------------------------------
	---- calendario
	INSERT INTO [ManV2].[Calendario] VALUES ('ODS','OBJETIVOS DE DESARROLLO SOSTENIBLE','Calendario de actualización de indicadores',200,'SUSTAINABLE DEVELOPMENT GOALS','Calendar of indicator updates')
	INSERT INTO [PreV2].[Calendario] VALUES ('ODS','OBJETIVOS DE DESARROLLO SOSTENIBLE','Calendario de actualización de indicadores',200,'SUSTAINABLE DEVELOPMENT GOALS','Calendar of indicator updates')
	INSERT INTO [PubV2].[Calendario] VALUES ('ODS','OBJETIVOS DE DESARROLLO SOSTENIBLE','Calendario de actualización de indicadores',200,'SUSTAINABLE DEVELOPMENT GOALS','Calendar of indicator updates')
	-----
	INSERT INTO [ManV2].[Notas] VALUES (200,'Las fechas son susceptibles de ser modificadas, en función de la disponibilidad de la información.','Dates are subject to change, depending on availability of information.')
	INSERT INTO [PreV2].[Notas] VALUES (200,'Las fechas son susceptibles de ser modificadas, en función de la disponibilidad de la información.','Dates are subject to change, depending on availability of information.')
	INSERT INTO [PubV2].[Notas] VALUES (200,'Las fechas son susceptibles de ser modificadas, en función de la disponibilidad de la información.','Dates are subject to change, depending on availability of information.')



	
	
	COMMIT TRANSACTION [TransADD]


END TRY
BEGIN CATCH
	PRINT 'catch  ROLLBACK TRANSACTION [TransADD]' 
	SELECT ERROR_MESSAGE() AS ErrorMessage; 
	ROLLBACK TRANSACTION [TransADD]
	SELECT 'ERROR' AS ERROR
END CATCH 

