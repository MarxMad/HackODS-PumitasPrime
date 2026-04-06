-----------------------------------------------------------------------------------
------ Creacion de los usuarios
-----------------------------------------------------------------------------------
--------------------------------------------------------
-----  1. Crea las cuentas a nivel de servidor 
--------------------------------------------------------
USE [master]
GO


---------- Cuenta propietaria --------------------

CREATE LOGIN [ODS.Owner] WITH PASSWORD=N'REEMPLAZAR_CONTRASENA_DUENA_INSTALACION_LOCAL', DEFAULT_DATABASE=[ODS], DEFAULT_LANGUAGE=[us_english], CHECK_EXPIRATION=ON, CHECK_POLICY=ON
GO
ALTER LOGIN [ODS.Owner] DISABLE
GO
ALTER SERVER ROLE [bulkadmin] ADD MEMBER [ODS.Owner]
GO
ALTER LOGIN [ODS.Owner] ENABLE
GO

---------- cuenta de actualizacion --------------
CREATE LOGIN [ODS.Update] WITH PASSWORD=N'REEMPLAZAR_CONTRASENA_ACTUALIZA_INSTALACION_LOCAL', DEFAULT_DATABASE=[ODS], DEFAULT_LANGUAGE=[us_english], CHECK_EXPIRATION=ON, CHECK_POLICY=ON
GO
ALTER LOGIN [ODS.Update] DISABLE
GO
ALTER SERVER ROLE [bulkadmin] ADD MEMBER [ODS.Update]
GO
ALTER LOGIN [ODS.Update] ENABLE
GO

---- Cuenta de consulta  ------------------
CREATE LOGIN [ODS.Consulta] WITH PASSWORD=N'REEMPLAZAR_CONTRASENA_CONSULTA_INSTALACION_LOCAL', DEFAULT_DATABASE=[ODS], DEFAULT_LANGUAGE=[us_english], CHECK_EXPIRATION=ON, CHECK_POLICY=ON
GO
ALTER LOGIN [ODS.Consulta] DISABLE
GO
ALTER SERVER ROLE [bulkadmin] ADD MEMBER [ODS.Consulta]
GO
ALTER LOGIN [ODS.Consulta] ENABLE

--------------------------------------------------------
-----  2. Crea las cuentas a nivel de bd y asigna esquemas por defaul
--------------------------------------------------------
 
USE [ODS]

CREATE USER [ODS.Owner] FOR LOGIN [ODS.Owner] WITH    DEFAULT_SCHEMA=[ManV2]
CREATE USER [ODS.Update] FOR LOGIN [ODS.Update] WITH   DEFAULT_SCHEMA=[PreV2]
CREATE USER [ODS.consulta] FOR LOGIN [ODS.Consulta] WITH   DEFAULT_SCHEMA=[PubV2]

 
