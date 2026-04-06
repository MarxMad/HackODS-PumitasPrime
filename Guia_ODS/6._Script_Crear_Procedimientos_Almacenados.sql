/****** Script para crear los Procedimientos Almacenados ******/
USE [ODS]
GO

/****** StoredProcedure [PreV2].[RevisaDuplicados]  ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [PreV2].[RevisaDuplicados]  --1
	-- Add the parameters for the stored procedure here
	@mClav int,
	@mSql  nvarChar(MAX), 
	@mIn int, 
	@mCto varchar(50),
	@mComen nvarchar(MAX)
	
AS
BEGIN
SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED
declare @cadSqlM nvarchar(Max),@cadSqlM1 nvarchar(Max),@cad1 nvarchar(Max),@cadPal nvarchar(Max), @cadDes nvarchar(Max),@cadSql nvarchar(Max),@claSer nvarchar(max), @claAgrOrd nvarchar(max), @PerAA nvarchar(6),@PerMM nvarchar(4), @PerDD nvarchar(4), @apiNota nvarchar(max),@cadSqlEnl nvarchar(max)
declare @claCve nvarchar(Max), @claGpo nvarchar(Max),@claCveDes nvarchar(Max),@Row int, @posA int
declare @Posicion int,@Posicion2 int, @Posicion3 int,@Posicion4 int, @Posicion5 int, @Posicion6 int, @Posicion7 int
declare @campM1 nvarchar(Max),@campM2 nvarchar(Max),@campM3 nvarchar(Max),@campM4 nvarchar(Max),@campM5 nvarchar(Max),@campM6 nvarchar(Max),@campM7 nvarchar(Max),@campM8 nvarchar(Max),@campM9 nvarchar(Max),@campM10 nvarchar(Max),@campM11 nvarchar(Max),@campM12 nvarchar(Max),@campM13 nvarchar(Max),@campM14 nvarchar(Max),@campM15 nvarchar(Max),@campM16 nvarchar(Max),@campM17 nvarchar(Max),@campM18 nvarchar(Max),@campM19 nvarchar(Max),@campM20 nvarchar(Max),@campM21 nvarchar(Max),@campM22 nvarchar(Max),@campM23 nvarchar(Max),@campM24 nvarchar(Max),@campM25 nvarchar(Max),@campM26 nvarchar(Max)
declare @campP1 nvarchar(Max),@campP2 nvarchar(Max),@campP3 nvarchar(Max),@campP4 nvarchar(Max),@campP5 nvarchar(Max),@campP6 nvarchar(Max),@campP7 nvarchar(Max),@campP8 nvarchar(Max),@campP9 nvarchar(Max),@campP10 nvarchar(Max),@campP11 nvarchar(Max),@campP12 nvarchar(Max),@campP13 nvarchar(Max),@campP14 nvarchar(Max),@campP15 nvarchar(Max),@campP16 nvarchar(Max),@campP17 nvarchar(Max),@campP18 nvarchar(Max),@campP19 nvarchar(Max),@campP20 nvarchar(Max),@campP21 nvarchar(Max),@campP22 nvarchar(Max),@campP23 nvarchar(Max),@campP24 nvarchar(Max),@campP25 nvarchar(Max),@campP26 nvarchar(Max)
declare @returnMsj nvarchar(Max), @banMsj nvarchar(1),@MsjTemp nvarchar(Max),@TipoCla nvarchar(max)
--declare @TabAgrupaClas table (acClave nvarchar(Max),acCveGpo nvarChar(Max),acCveClas nvarChar(Max), acDescrip nvarchar(Max), acDescripIng nvarchar(Max))--tabla para obtener los campos de la tabla agrupaCob
--declare @TabAgrupaCob table (acoClave nvarchar(Max),acoCveGeo nvarChar(Max),acoCveDesGeo nvarChar(Max), acoOrden nvarchar(Max))--tabla para obtener los campos de la tabla agrupaCob
--declare @TabGeneral table (tg1 nvarchar(Max),tg2 nvarchar(Max),tg3 nvarchar(Max),tg4 nvarchar(Max),tg5 nvarchar(Max),tg6 nvarchar(Max),tg7 nvarchar(Max),tg8 nvarchar(Max),tg9 nvarchar(Max),tg10 nvarchar(Max),tg11 nvarchar(Max),tg12 nvarchar(Max),tg13 nvarchar(Max),tg14 nvarchar(Max),tg15 nvarchar(Max),tg16 nvarchar(Max),tg17 nvarchar(Max),tg18 nvarchar(Max),tg19 nvarchar(Max),tg20 nvarchar(Max),tg21 nvarchar(Max),tg22 nvarchar(Max),tg23 nvarchar(Max),tg24 nvarchar(Max),tg25 nvarchar(Max),tg26 nvarchar(Max))

set @returnMsj=''
set @MsjTemp=''
set @banMsj=''
set @Row=0
print 'Estoy en revisaDuplicados'
print @mCto
if @mCto='Descripcion'
begin
	if EXISTS (select  * from PreV2.Descripcion with(nolock) where desclave = @mComen)
	begin set @Row=1 end
	--select  @Row = COUNT(*) from PreV2.Descripcion with(nolock) where desclave = @mComen
	if @Row = 0
	Begin  set @banMsj='0' end
	else
	begin
		select top 1  @campM1=desdescrip, @campM2=desAbrevia, @campM3=desCodigo, @campM4=desDescripIng, @campM5=desAbreviaIng, @campM6=desCodigoIng  from ManV2.Descripcion with(nolock) where desclave=@mComen
		select top 1  @campP1=desdescrip, @campP2=desAbrevia, @campP3=desCodigo, @campP4=desDescripIng, @campP5=desAbreviaIng, @campP6=desCodigoIng  from PreV2.Descripcion with(nolock) where desclave=@mComen
		if @campM1= @campP1 and @campM2= @campP2 and @campM3= @campP3 and @campM4= @campP4 and @campM5= @campP5 and @campM6= @campP6
		begin set @banMsj='F' end
		else 
		begin 
			set @banMsj='T' 
			--update ' + @Esq + 'Serie set serDato=' + @serDtF + ', serNoDato=0 where  serclave= ' + Convert(nvarchar(255),@serCve) + ' and serCveCobAgrup=''' + @serCveCG + ''' and serCveClaAgrup= ''' + @serCveCla + ''' and seraaDato= ' + Convert(nvarchar(4),@serADato) + ' and serMMDato=' + Convert(nvarchar(2),@serMDato) + ' and serddDato=' + Convert(nvarchar(2),@serDDato) --serclaveind= ' + CONVERT(nvarchar(10),@serCveI) + ' and
			--set @cadSql='update PreV2.Descripcion set desDescrip=''' + @campM1 +  ''',desAbrevia=''' + @campM2 + ''' ,desCodigo=''' + @campM3 + ''',desDescripIng= ''' + @campM4 + ''',desAbreviaIng=''' + @campM5 + ''',desCodigoIng=''' + @campM6 + ''' where desclave= ' + @mComen
			set @cadSql='Delete from PreV2.Descripcion where desclave= ' + @mComen
			--set @cadSql ='delete from pre.Descripcion where desclave=' + @mComen
			--set @cadSqlM = 'insert into pre.Descripción (desclave,desdescrip,desAbrevia,descodigo,desDescriping,desAbreviaIng,desCodigoing) select desclave,desdescrip,desAbrevia,descodigo,desDescriping,desAbreviaIng,desCodigoing from man.Descripcion where desclave=' + @mComen 
		end
	end
end
if @mCto='DescripcionPCve'
begin
print 'DescripcionPCve'
print @mComen
	if EXISTS (select * from PreV2.DescripcionPCve with(nolock) where dpcClave = @mComen)
	begin set @Row=1 end
	--select  @Row = COUNT(*) from PreV2.DescripcionPCve with(nolock) where dpcClave = @mComen
	if @Row = 0
	Begin  set @banMsj='0' end
	else
	begin
		select top 1  @campM1=dpcdescrip, @campM2=dpcAbrevia, @campM3=dpcdescripIng, @campM4=dpcAbreviaIng  from ManV2.DescripcionPCve with(nolock) where dpcClave=@mComen
		select top 1  @campP1=dpcdescrip, @campP2=dpcAbrevia, @campP3=dpcDescripIng, @campP4=dpcAbreviaIng   from PreV2.DescripcionPCve with(nolock) where dpcClave=@mComen
		if @campM1= @campP1 and @campM2= @campP2 and @campM3= @campP3 and @campM4= @campP4 and @campM5= @campP5 and @campM6= @campP6
		begin set @banMsj='F' end
		else 
		begin 
			set @banMsj='T' 
			--update ' + @Esq + 'Serie set serDato=' + @serDtF + ', serNoDato=0 where  serclave= ' + Convert(nvarchar(255),@serCve) + ' and serCveCobAgrup=''' + @serCveCG + ''' and serCveClaAgrup= ''' + @serCveCla + ''' and seraaDato= ' + Convert(nvarchar(4),@serADato) + ' and serMMDato=' + Convert(nvarchar(2),@serMDato) + ' and serddDato=' + Convert(nvarchar(2),@serDDato) --serclaveind= ' + CONVERT(nvarchar(10),@serCveI) + ' and
			--set @cadSql='update PreV2.Descripcion set desDescrip=''' + @campM1 +  ''',desAbrevia=''' + @campM2 + ''' ,desCodigo=''' + @campM3 + ''',desDescripIng= ''' + @campM4 + ''',desAbreviaIng=''' + @campM5 + ''',desCodigoIng=''' + @campM6 + ''' where desclave= ' + @mComen
			set @cadSql='Delete from PreV2.DescripcionPCve where dpcClave= ' + @mComen
			--set @cadSql ='delete from pre.Descripcion where desclave=' + @mComen
			--set @cadSqlM = 'insert into pre.Descripción (desclave,desdescrip,desAbrevia,descodigo,desDescriping,desAbreviaIng,desCodigoing) select desclave,desdescrip,desAbrevia,descodigo,desDescriping,desAbreviaIng,desCodigoing from man.Descripcion where desclave=' + @mComen 
		end
	end
end
if @mCto='AgrupaClas'
begin
	if EXISTS (select *  from PreV2.AgrupaClas with(nolock) where acClave= @mComen)
	begin set @Row=1 end
	--select @Row = COUNT(*)  from PreV2.AgrupaClas with(nolock) where acClave= @mComen
	print @Row
	if @Row=0
	Begin  set @banMsj='0' end
	else
	begin
	print 'Buscar iguales'
		select top 1  @campM1=acCveGpo, @campM2=acCveClas, @campM3=acDescrip, @campM4=acDescripIng  from ManV2.AgrupaClas with(nolock) where acclave=@mComen
		select top 1  @campP1=acCveGpo, @campP2=acCveClas, @campP3=acDescrip, @campP4=acDescripIng  from PreV2.AgrupaClas with(nolock) where acclave=@mComen
		if @campM1= @campP1 and @campM2= @campP2 and @campM3= @campP3 and @campM4= @campP4 
		begin set @banMsj='F' end
		else 
		begin 
			print 'entre al update'
			set @banMsj='T' 
			print @banMsj
			--set @cadSql='update PreV2.AgrupaClas set acCveGpo=' +  @campM1 + ',acCveClas = ' + @campM2 + ' where acclave= ''' + @mComen + ''''
			--print @cadSql
			--set @cadSql='update PreV2.AgrupaClas set acCveGpo=' +  @campM1 + ',acCveClas = ' + @campM2 + ', acDescrip=' + @campM3 + ', acDescripIng=' + @campM4 + ' where acclave= ''' + @mComen + ''''
			set @cadSql='Delete from  PreV2.AgrupaClas where acclave= ''' + @mComen + ''''
			print @cadSql
			--set @cadSql ='delete from pre.AgrupaClas where acClave=' + @mComen
			--set @cadSqlM = 'insert into pre.AgrupaClas (acClave,acCveGpo,acCveClas,acDescrip,acDescriping) select acClave,acCveGpo,acCveClas,acDescrip,acDescriping from man.AgrupaClas where acclave=' + @mComen 
		end
	end
end

if @mCto='AtrAgrupaClaPorInd'
begin
	select @Posicion2 =   patindex('%-%' ,@mComen ) --obtener la posicion del separador de la clave de serie y agrupamiento
	select @claSer = left(@mComen, @Posicion2 -1)-- obtener la clave de serie
	SELECT @mComen= stuff(@mComen, 1, @Posicion2, '')--quitar la clave de serie
	select @Posicion2 =   patindex('%-%' ,@mComen ) --obtener la posicion del separador de la clave de serie y agrupamiento 
	select @claAgrOrd = left(@mComen, @Posicion2 -1)-- obtener la clave de agrupamiento
	SELECT @mComen= stuff(@mComen, 1, @Posicion2, '')--quitar la clave de agrupamiento
	set @TipoCla = @mComen -- asignar a otra variable si es C=clasificacion o G= grupo
	if EXISTS (select *  from PreV2.AtrAgrupaClaPorInd with(nolock) where aaclCveSer= @claser and aaclAgrCla= @claAgrOrd  and aaclTipCla= @TipoCla)
	begin set @Row=1 end
	--select @Row = COUNT(*)  from PreV2.AtrAgrupaClaPorInd with(nolock) where aaclCveSer= @claser and aaclAgrCla= @claAgrOrd  and aaclTipCla= @TipoCla
	print @Row
	if @Row=0
	Begin  set @banMsj='0' end
	else
	begin
	print 'Buscar iguales'
		select top 1  @campM1=aaclCveSer, @campM2=aaclAgrCla, @campM3=aaclCveNota, @campM4=aaclOrdenTab, @campM5=aaclOrdenGra, @campM6=aaclOrdenMap  from ManV2.AtrAgrupaClaPorInd with(nolock) where aaclCveSer= @claser and aaclAgrCla= @claAgrOrd and aaclTipCla= @TipoCla
		select top 1  @campP1=aaclCveSer, @campP2=aaclAgrCla, @campP3=aaclCveNota, @campP4=aaclOrdenTab,@campP5=aaclOrdenGra,@campP6=aaclOrdenMap  from PreV2.AtrAgrupaClaPorInd with(nolock) where aaclCveSer= @claser and aaclAgrCla= @claAgrOrd and aaclTipCla= @TipoCla
		if @campM1= @campP1 and @campM2= @campP2 and @campM3= @campP3 and @campM4= @campP4 and @campM5= @campP5 and @campM6= @campP6 
		begin set @banMsj='F' end
		else 
		begin 
			print 'entre al update'
			set @banMsj='T' 
			print @banMsj
			set @cadSql='Delete from  PreV2.AtrAgrupaClaPorInd where aaclCveSer = ' + @claSer + '  and aaclAgrCla= ''' + @claAgrOrd + ''' and aaclTipCla= ''' + @TipoCla + ''''
			print @cadSql
		end
	end
end

if @mCto='AtrAgrupaCobPorInd'
begin
	select @Posicion2 =   patindex('%-%' ,@mComen ) --obtener la posicion del separador de la clave de serie y agrupamiento
	select @claSer = left(@mComen, @Posicion2 -1)-- obtener la clave de serie
	SELECT @mComen= stuff(@mComen, 1, @Posicion2, '')--quitar la clave de serie
	select @claAgrOrd = @mComen -- obtener la clave de agrupamiento
	set @claAgrOrd = '' + @claAgrOrd + ''
	print @claAgrOrd
	PRINT @claser
	if EXISTS (select * from PreV2.AtrAgrupaCobPorInd with(nolock) where aacoCveSer= @claser and aacoAgrCob= @claAgrOrd )
	begin set @Row=1 end
	--select @Row = aacoCveSer  from PreV2.AtrAgrupaCobPorInd with(nolock) where aacoCveSer= @claser and aacoAgrCob= @claAgrOrd 
	print @Row
	if @Row =0
	Begin  set @banMsj='0' end
	else
	begin
	print 'Buscar iguales'
		select top 1  @campM1=aacoCveSer, @campM2=aacoAgrCob, @campM3=aacoCveNota from ManV2.AtrAgrupaCobPorInd with(nolock) where aacoCveSer= @claser and aacoAgrCob= @claAgrOrd 
		select top 1  @campP1=aacoCveSer, @campP2=aacoAgrCob, @campP3=aacoCveNota from PreV2.AtrAgrupaCobPorInd with(nolock) where aacoCveSer= @claser and aacoAgrCob= @claAgrOrd 
		if @campM1= @campP1 and @campM2= @campP2 and @campM3= @campP3 and @campM4= @campP4 and @campM5= @campP5 and @campM6= @campP6 
		begin set @banMsj='F' end
		else 
			begin 
			print 'entre al update'
			set @banMsj='T' 
			print @banMsj
			set @cadSql='Delete from  PreV2.AtrAgrupaCobPorInd where aacoCveSer = ' + @claSer + '  and aacoAgrCob= ''' + @claAgrOrd + ''''
			print @cadSql
		end
	end
end

if @mCto='AtrPeriodoPorInd'
begin
	print @mSql
	select @Posicion2 =   patindex('%Values%' ,@mSql ) --obtener la posicion del Values
	set @cad1 = @mSql
	SELECT @cad1= stuff(@cad1, 1, @Posicion2, '')--1,2014,0,0,350) serie, año, mes, día, nota
	print @cad1
	select @Posicion =  patindex('%(%' ,@cad1)
	SELECT @cad1= stuff(@cad1, 1, @Posicion, '')--1,2014,0,0,350)
	select @Posicion =  patindex('%,%' ,@cad1)
	SELECT @cad1= stuff(@cad1, 1, @Posicion, '')--2014,0,0,350)
	select @Posicion =  patindex('%,%' ,@cad1)
	select @PerAA = left(@cad1, @Posicion-1)--año
	print @PerAA
	SELECT @cad1= stuff(@cad1, 1, @Posicion, '')--0,0,350)
	select @Posicion =  patindex('%,%' ,@cad1)
	select @PerMM = left(@cad1, @Posicion-1)--mes
	print @PerMM
	SELECT @cad1= stuff(@cad1, 1, @Posicion, '')--0,350)
	select @Posicion =  patindex('%,%' ,@cad1)
	select @PerDD = left(@cad1, @Posicion-1)--día
	print @PerDD
	SELECT @cad1= stuff(@cad1, 1, @Posicion, '')--350)
	select @Posicion =  patindex('%)%' ,@cad1)
	select @apiNota = left(@cad1, @Posicion-1)--nota
	print @apiNota
	if EXISTS (select *  from PreV2.AtrPeriodoPorInd with(nolock) where apiCveSer= @mComen and apiPerAA= @PerAA  and apiPerMM= @PerMM and apiPerDD= @PerDD and apiCveNota= @apiNota)
	begin		set @Row=1	end
	print @Row
	if @Row=0
	Begin  set @banMsj='0' end
	else
	begin
	print 'Buscar iguales'
		select top 1  @campM1=apiCveSer, @campM2=apiPerAA, @campM3=apiPerMM, @campM4=apiPerDD, @campM5=apiCveNota from ManV2.AtrPeriodoPorInd with(nolock) where apiCveSer= @mComen and apiPerAA= @PerAA  and apiPerMM= @PerMM and apiPerDD= @PerDD and apiCveNota= @apiNota
		select top 1  @campP1=apiCveSer, @campP2=apiPerAA, @campP3=apiPerMM, @campP4=apiPerDD, @campP5=apiCveNota from PreV2.AtrPeriodoPorInd with(nolock) where apiCveSer= @mComen and apiPerAA= @PerAA  and apiPerMM= @PerMM and apiPerDD= @PerDD and apiCveNota= @apiNota
		if @campM1= @campP1 and @campM2= @campP2 and @campM3= @campP3 and @campM4= @campP4 and @campM5= @campP5 
		begin set @banMsj='F' end
		else 
		begin 
			print 'entre al update'
			set @banMsj='T' --apiPerAA= @PerAA  and apiPerMM= @PerMM and apiPerDD= @PerDD and apiCveNota= @apiNota
			print @banMsj
			set @cadSql='Delete from  PreV2.AtrPeriodoPorInd where apiCveSer = ' + @mComen + ' and  apiPerAA=' +  @PerAA + ' and  apiPerMM=' + @PerMM + ' and  apiPerDD=' + @PerDD
			print @cadSql
		end
	end
end


--print @mCto
if @mCto='AgrupaCob'
begin
	if EXISTS (select *  from PreV2.AgrupaCob with(nolock) where acoClave= @mComen)
	begin	set @Row=1	end
	--select @Row = COUNT(*)  from PreV2.AgrupaCob with(nolock) where acoClave= @mComen
	if @Row=0
	Begin  set @banMsj='0' end
	else
	begin
		select top 1  @campM1=acoCveGeo, @campM2=acoCveDesGeo, @campM3=acoOrden  from ManV2.AgrupaCob with(nolock) where acoclave=@mComen
		select top 1  @campP1=acoCveGeo, @campP2=acoCveDesGeo, @campP3=acoOrden  from PreV2.AgrupaCob with(nolock) where acoclave=@mComen
		if @campM1= @campP1 and @campM2= @campP2 and @campM3= @campP3 
		begin set @banMsj='F' end
		else 
		begin 
			set @banMsj='T'
			--set @cadSql='update PreV2.AgrupaCob set acoCveGeo=''' +  @campM1 + ''',acoCveDesGeo = ''' + @campM2 + ''', acoOrden=' + @campM3 + ' where acoclave= ''' + @mComen  + ''
			set @cadSql='Delete from PreV2.AgrupaCob  where acoclave= ''' + @mComen  + ''''
			--set @cadSql ='delete from pre.AgrupaCob where acoClave=' + @mComen
			--set @cadSqlM = 'insert into pre.AgrupaCob (acoClave,acoCveGeo,acoCveDesGeo,acoOrden) select acoClave,acoCveGeo,acoCveDesGeo,acoOrden from man.AgrupaCob where acoclave=' + @mComen 
		end
	end
end
if @mCto='Arbol'
begin
	if EXISTS (select * from PreV2.Arbol with(nolock) where arbClave= @mComen)
	begin	set @Row=1	end
	--select @Row = COUNT(*)  from PreV2.Arbol with(nolock) where arbClave= @mComen
	if @Row=0
	Begin  set @banMsj='0' end
	else
	begin
		select top 1  @campM1=arbClaveInd, @campM2=arbClaveFT, @campM3=arbClaveDescrip, @campM4=arbClaveMetadato  from ManV2.Arbol with(nolock) where arbclave=@mComen
		select top 1  @campP1=arbClaveInd, @campP2=arbClaveFT, @campP3=arbClaveDescrip, @campP4=arbClaveMetadato  from PreV2.Arbol with(nolock) where arbclave=@mComen
		if @campM1= @campP1 and @campM2= @campP2 and @campM3= @campP3 and @campM4= @campP4  
		begin set @banMsj='F' end
		else 
		begin 
			set @banMsj='T' 
			--set @cadSql='update PreV2.Arbol set arbClaveInd=' +  @campM1 + ',arbClaveFT = ' + @campM2 + ', arbClaveDescrip=' + @campM3 + ',arbClaveMetadato=' + @campM4 +' where arbclave= ''' + @mComen  + ''
			set @cadSql='Delete  from PreV2.Arbol  where arbclave= ''' + @mComen  + ''''
			--set @cadSql ='delete from pre.Arbol where arbClave=' + @mComen
			--set @cadSqlM = 'insert into pre.Arbol (arbClave,arbClaveInd,arbClaveFT,arbClaveDescrip,arbClaveMetadato) select arbClave,arbClaveInd,arbClaveFT,arbClaveDescrip,arbClaveMetadato from man.Arbol where arbclave=' + @mComen 
		end
	end
end

if @mCto='AtrIndicador'
begin
	if EXISTS (select *  from PreV2.AtrIndicador with(nolock) where atrClaveInd= @mComen)
	begin	set @Row=1	end
	--select @Row = COUNT(*)  from PreV2.AtrIndicador with(nolock) where atrClaveInd= @mComen
	if @Row=0
	Begin  set @banMsj='0' end
	else
	begin
		select top 1  @campM1=atrFechaAct, @campM2=atrMeta, @campM3=atrDesMeta, @campM4=atrCalculo, @campM5=atrClaveEst, @campM6=atrFechaActIng, @campM7=atrDesMetaIng, @campM8=atrEstadisticos, @campM9=atrVisualizaMapa  from ManV2.AtrIndicador with(nolock) where atrClaveInd=@mComen
		select top 1  @campP1=atrFechaAct, @campP2=atrMeta, @campP3=atrDesMeta, @campP4=atrCalculo, @campP5=atrClaveEst, @campP6=atrFechaActIng, @campP7=atrDesMetaIng, @campP8=atrEstadisticos, @campP9=atrVisualizaMapa  from PreV2.AtrIndicador with(nolock) where atrClaveInd=@mComen
		if @campM1= @campP1 and @campM2= @campP2 and @campM3= @campP3 and @campM4= @campP4  and @campM5= @campP5  and @campM6= @campP6  and @campM7= @campP7  and @campM8= @campP8  and @campM9= @campP9  
		begin set @banMsj='F' end
		else 
		begin 
			set @banMsj='T' 
			--set @cadSql='update PreV2.AtrIndicador set atrFechaAct=''' +  @campM1 + ''',atrMeta = ' + @campM2 + ', atrDesMeta=''' + @campM3 + ''',atrCalculo=''' + @campM4 + ''',atrClaveEst=' + @campM5 + ',atrFechaActIng=''' + @campM6 + ''',atrDesMetaIng=''' + @campM7 + ''',atrEstatidticos=''' + @campM8 + ''',atrVisualizaMapa=''' + @campM9 + '''   where atrClaveInd= ' + @mComen 
			set @cadSql='Delete from PreV2.AtrIndicador where atrClaveInd= ' + @mComen 
			--set @cadSql ='delete from pre.AtrIndicador where atrClaveInd=' + @mComen
			--set @cadSqlM = 'insert into pre.AtrIndicador (atrClaveInd,atrFechaAct,atrMeta,atrDesMeta,atrCalculo,atrClaveEst,atrFechaActInd,atrDesMetaIng,atrEstadisticos,atrVisualizaMapa) select atrClaveInd,atrFechaAct,atrMeta,atrDesMeta,atrCalculo,atrClaveEst,atrFechaActInd,atrDesMetaIng,atrEstadisticos,atrVisualizaMapa from man.AtrIndicador where atrClaveInd=' + @mComen 
		end
	end
end

if @mCto='AtrSerie'
begin
	if EXISTS (select *  from PreV2.AtrSerie with(nolock) where atsClaveSerie= @mComen)
	begin	set @Row=1	end
	--select @Row = COUNT(*)  from PreV2.AtrSerie with(nolock) where atsClaveSerie= @mComen
	if @Row=0
	Begin  set @banMsj='0' end
	else
	begin
		select top 1  @campM1=atsClaveDescrip, @campM2=atsClaveFre, @campM3=atsAAPrelim, @campM4=atsMMPrelim, @campM5=atsDDPrelim, @campM6=atsAAEst, @campM7=atsMMEst, @campM8=atsDDEst, @campM9=atsDecimales, @campM10=atsClaveNota, @campM11=atsClaveFT, @campM12=atsClaveFuente,@campM13=atsClaveUnidad,@campM14=atsTipo,@campM15=atsSalida,@campM16=atsAARev,@campM17=atsMMRev,@campM18=atsDDRev,@campM19=atsClaveAgrupaCob,@campM20=atsClaveAgrupaClas,@campM21=atsColMatriz,@campM22=atsColMatrizIng,@campM23=atsTipoGra,@campM24=atsInicio,@campM25=atsTipoCua  from ManV2.AtrSerie with(nolock) where atsClaveSerie=@mComen
		select top 1  @campP1=atsClaveDescrip, @campP2=atsClaveFre, @campP3=atsAAPrelim, @campP4=atsMMPrelim, @campP5=atsDDPrelim, @campP6=atsAAEst, @campP7=atsMMEst, @campP8=atsDDEst, @campP9=atsDecimales, @campP10=atsClaveNota, @campP11=atsClaveFT, @campP12=atsClaveFuente,@campP13=atsClaveUnidad,@campP14=atsTipo,@campP15=atsSalida,@campP16=atsAARev,@campP17=atsMMRev,@campP18=atsDDRev,@campP19=atsClaveAgrupaCob,@campP20=atsClaveAgrupaClas,@campP21=atsColMatriz,@campP22=atsColMatrizIng,@campP23=atsTipoGra,@campP24=atsInicio,@campP25=atsTipoCua  from PreV2.AtrSerie with(nolock) where atsClaveSerie=@mComen
		if @campM1= @campP1 and @campM2= @campP2 and @campM3= @campP3 and @campM4= @campP4  and @campM5= @campP5  and @campM6= @campP6  and @campM7= @campP7  and @campM8= @campP8 and @campM9= @campP9  and @campM10= @campP10 and @campM11= @campP11 and @campM12= @campP12 and @campM13= @campP13 and @campM14= @campP14 and @campM15= @campP15 and @campM16= @campP16 and @campM17= @campP17 and @campM18= @campP18 and @campM19= @campP19 and @campM20= @campP20 and @campM21= @campP21 and @campM22= @campP22 and @campM23= @campP23 and @campM24= @campP24 and @campM25= @campP25                                
		begin set @banMsj='F' end
		else 
		begin 
			set @banMsj='T' 
			--set @cadSql='update PreV2.AtrSerie set atsClaveDescrip=' + @campM1 + ', atsClaveFre =' + @campM2 + ', atsAAPrelim =' + @campM3 + ', atsMMPrelim = ' + @campM4 + ' , atsDDPrelim= ' + @campM5 + ', atsAAEst= ' + @campM6 + ' , atsMMEst= ' + @campM7 + ', atsDDEst=' + @campM8 + ', atsDecimales=' + @campM9 + ', atsClaveNota=' + @campM10 + ', atsClaveFT =' + @campM11 + ',atsClaveFuente=' +  @campM12 + ',atsClaveUnidad=' + @campM13 + ',atsTipo=''' + @campM14 + ''',atsAARev= ' + @campM16 + ',atsMMRev=' + @campM17 + ',atsDDRev=' + @campM18 + ',atsClaveAgrupaCob=''' + @campM19 + ''',atsClaveAgrupaClas=''' + @campM20 + ''',atsColMatriz=''' + @campM21 + ''',atsColMatrizIng=''' + @campM22 + ''',atsTipoGra=' + @campM23 + ',atsInicio= ' + @campM24 + ' ,atsTipoCua=''' + @campM25 +'''  where atsClaveSerie= ' + @mComen 
			set @cadSql='Delete from  PreV2.AtrSerie where atsClaveSerie= ' + @mComen 
			--set @cadSql ='delete from pre.AtrSerie where atsClaveSerie=' + @mComen
			--set @cadSqlM = 'insert into pre.AtrSerie (atsClaveSerie,atsClaveDescrip,atsClaveFre,atsAAPrelim,atsMMPrelim,atsDDPrelim,atsAAEst,atsMMEst,atsDDEst,atsDecimales,atsClaveNota,atsClaveFT,atsClaveFuente,atsClaveUnida,atsTipo,atsSalida,atsAARev,atsMMRev,atsDDRev,atsClaveAgrupaCob,atsClaveAgrupaClas,atsColMatriz,atsColMatrizIng,atsTipoGra,atsInicio,atsTipoCua) select atsClaveSerie,atsClaveDescrip,atsClaveFre,atsAAPrelim,atsMMPrelim,atsDDPrelim,atsAAEst,atsMMEst,atsDDEst,atsDecimales,atsClaveNota,atsClaveFT,atsClaveFuente,atsClaveUnida,atsTipo,atsSalida,atsAARev,atsMMRev,atsDDRev,atsClaveAgrupaCob,atsClaveAgrupaClas,atsColMatriz,atsColMatrizIng,atsTipoGra,atsInicio,atsTipoCua from man.AtrSerie where atsClaveSerie=' + @mComen 

		end
	end
end
if @mCto='Calendario'
begin
	if EXISTS (select *  from PreV2.Calendario with(nolock) where calClave= @mComen)
	begin	set @Row=1	end
	--select @Row = COUNT(*)  from PreV2.Calendario with(nolock) where calClave= @mComen
	if @Row=0
	Begin  set @banMsj='0' end
	else
	begin
		select top 1  @campM1=calTitulo, @campM2=calSubTitulo, @campM3=calCveNota, @campM4=calTituloIng, @campM5=calSubtituloIng  from ManV2.Calendario with(nolock) where calClave=@mComen
		select top 1  @campP1=calTitulo, @campP2=calSubTitulo, @campP3=calCveNota, @campP4=calTituloIng, @campP5=calSubtituloIng  from PreV2.Calendario with(nolock) where calClave=@mComen
		if @campM1= @campP1 and @campM2= @campP2 and @campM3= @campP3 and @campM4= @campP4  and @campM5= @campP5
		begin set @banMsj='F' end
		else 
		begin 
			set @banMsj='T' 
			--set @cadSql='update PreV2.Calendario set calTitulo=''' + @campM1 + ''', calSubTitulo=''' + @campM2 + ''', calCveNota=' + @campM3 + ', calTituloIng=''' + @campM4 + ''', calSubtituloIng=''' + @campM5 + '''   where calClave= ''' + @mComen  + ''
			set @cadSql='Delete from  PreV2.Calendario    where calClave= ''' + @mComen  + ''''
			--set @cadSql ='delete from pre.Calendario where calClave=' + @mComen
			--set @cadSqlM = 'insert into pre.Calendario (calClave,calTitulo,calSubTitulo,calCveNota,calTituloIng,calSubtituloIng) select calClave,calTitulo,calSubTitulo,calCveNota,calTituloIng,calSubtituloIng from man.calendario where calClave=' + @mComen 

		end
	end
end

if @mCto='CobGeo'
begin
	if EXISTS (select *  from PreV2.CobGeo with(nolock) where cgClave= @mComen)
	begin	set @Row=1	end
	--select @Row = COUNT(*)  from PreV2.CobGeo with(nolock) where cgClave= @mComen
	if @Row=0
	Begin  set @banMsj='0' end
	else
	begin
		select top 1  @campM1=cgDescrip, @campM2=cgDescripIng, @campM3=cgAbrevia, @campM4=cgAbreviaIng, @campM5=cgCveTipoCobGeo  from ManV2.CobGeo with(nolock) where cgClave=@mComen
		select top 1  @campP1=cgDescrip, @campP2=cgDescripIng, @campP3=cgAbrevia, @campP4=cgAbreviaIng, @campP5=cgCveTipoCobGeo  from PreV2.CobGeo with(nolock) where cgClave=@mComen
		if @campM1= @campP1 and @campM2= @campP2 and @campM3= @campP3 and @campM4= @campP4  and @campM5= @campP5
		begin set @banMsj='F' end
		else 
		begin 
			set @banMsj='T' 
			--set @cadSql='update PreV2.CobGeo set cgDescrip=''' + @campM1 + ''', cgDescripIng=''' + @campM2 + ''', cgAbrevia=''' + @campM3 + ''', cgAbreviaIng=''' + @campM4 + ''', cgCveTipoCobGeo=' + @campM5 +'  where cgClave= ''' + @mComen + ''
			set @cadSql='Delete from PreV2.CobGeo where  cgClave= ''' + @mComen + ''''
			--set @cadSql ='delete from pre.CobGeo where cgClave=' + @mComen
			--set @cadSqlM = 'insert into pre.CobGeo (cgClave,cgDescrip,cgDescriping,cgAbrevia,cgAbreviaing,cgCveTipoCobGeo) select cgClave,cgDescrip,cgDescriping,cgAbrevia,cgAbreviaing,cgCveTipoCobGeo from man.CobGeo where cgClave=' + @mComen 
		end
	end
end

if @mCto='CobTem'
begin
	if EXISTS (select *  from PreV2.CobTem with(nolock) where ctClave= @mComen)
	begin	set @Row=1	end
	--select @Row = COUNT(*)  from PreV2.CobTem with(nolock) where ctClave= @mComen
	if @Row=0
	Begin  set @banMsj='0' end
	else
	begin
		select top 1  @campM1=ctDescrip, @campM2=ctDescripIng  from ManV2.CobTem with(nolock) where ctClave=@mComen
		select top 1  @campP1=ctDescrip, @campP2=ctDescripIng  from PreV2.CobTem with(nolock) where ctClave=@mComen
		if @campM1= @campP1 and @campM2= @campP2
		begin set @banMsj='F' end
		else 
		begin 
			set @banMsj='T' 
			--set @cadSql='update PreV2.CobTem set ctDescrip=''' + @campM1 + ''', ctDescripIng=''' + @campM2 + '''  where cgClave= ' + @mComen 
			set @cadSql='Delete from  PreV2.CobTem  where ctClave= ' + @mComen 
			--set @cadSql ='delete from pre.CobTem where ctClave=' + @mComen
			--set @cadSqlM = 'insert into pre.CobTem (ctDescrip,ctDescripIng) select ctDescrip,ctDescripIng from man.CobTem where ctClave=' + @mComen 
		end
	end
end

if @mCto='Contacto'
begin
	if EXISTS (select *  from PreV2.Contacto with(nolock) where conClave= @mComen)
	begin	set @Row=1	end
	--select @Row = COUNT(*)  from PreV2.Contacto with(nolock) where conClave= @mComen
	if @Row=0
	Begin  set @banMsj='0' end
	else
	begin
		select top 1  @campM1=conNombre, @campM2=conPuesto, @campM3=conTelefono, @campM4=conCorreo, @campM5=conDomicilio  from ManV2.Contacto with(nolock) where conClave=@mComen
		select top 1  @campP1=conNombre, @campP2=conPuesto, @campP3=conTelefono, @campP4=conCorreo, @campP5=conDomicilio  from PreV2.Contacto with(nolock) where conClave=@mComen
		if @campM1= @campP1 and @campM2= @campP2 and @campM3= @campP3 and @campM4= @campP4 and @campM5= @campP5
		begin set @banMsj='F' end
		else 
		begin 
			set @banMsj='T' 
			--set @cadSql='update PreV2.Contacto set conNombre=''' + @campM1 + ''',conPuesto=''' +  @campM2 + ''',conTelefono=''' +  @campM3 + ''', conCorreo= ''' + @campM4 + ''', conDomicilio=''' + @campM5 + '''  where conClave= ' + @mComen 
			set @cadSql='Delete from  PreV2.Contacto where conClave= ' + @mComen 
			--set @cadSql ='delete from pre.Contacto where conClave=' + @mComen
			--set @cadSqlM = 'insert into pre.Contacto (conClave,conNombre,conPuesto,conTelefono,conCorreo,conDomicilio) select conClave,conNombre,conPuesto,conTelefono,conCorreo,conDomicilio from man.Contacto where conClave=' + @mComen 

		end
	end
end

if @mCto='DesgloseGeo'
begin
	if EXISTS (select * from PreV2.DesgloseGeo with(nolock) where dgClave= @mComen)
	begin	set @Row=1	end
	--select @Row = COUNT(*)  from PreV2.DesgloseGeo with(nolock) where dgClave= @mComen
	if @Row=0
	Begin  set @banMsj='0' end
	else
	begin
		select top 1  @campM1=dgCodigo, @campM2=dgCodigoing, @campM3=dgDescrip, @campM4=dgDescripIng, @campM5=dgNomImg, @campM6=dgNomImgIng   from ManV2.DesgloseGeo with(nolock) where dgClave=@mComen
		select top 1  @campP1=dgCodigo, @campP2=dgCodigoing, @campP3=dgDescrip, @campP4=dgDescripIng, @campP5=dgNomImg, @campP6=dgNomImgIng   from PreV2.DesgloseGeo with(nolock) where dgClave=@mComen
		if @campM1= @campP1 and @campM2= @campP2 and @campM3= @campP3 and @campM4= @campP4 and @campM5= @campP5
		begin set @banMsj='F' end
		else 
		begin 
			set @banMsj='T' 
			--set @cadSql='update PreV2.DesgloseGeo set dgCodigo=''' + @campM1 + ''',dgCodigoing=''' +  @campM2 + ''', dgDescrip=''' + @campM3 + ''', dgDescripIng=''' + @campM4 + ''', dgNomImg=''' + @campM5 + ''', dgNomImgIng=''' + @campM6 + '''   where dgClave= ' + @mComen 
			set @cadSql='Delete from  PreV2.DesgloseGeo   where dgClave= ' + @mComen 
			--set @cadSql ='delete from pre.DesgloseGeo where dgClave=' + @mComen
			--set @cadSqlM = 'insert into pre.DesgloseGeo (dgClave,dgCodigo,dgCodigoIng,dgconClave,conNombre,conPuesto,conTelefono,conCorreo,conDomicilio) select conClave,conNombre,conPuesto,conTelefono,conCorreo,conDomicilio from man.Contacto where conClave=' + @mComen 
		end
	end
end

if @mCto='Estatus'
begin
	if EXISTS (select *  from PreV2.Estatus with(nolock) where estClave= @mComen)
	begin	set @Row=1	end
	--select @Row = COUNT(*)  from PreV2.Estatus with(nolock) where estClave= @mComen
	if @Row=0
	Begin  set @banMsj='0' end
	else
	begin
		select top 1  @campM1=estDescrip, @campM2=estNomImg, @campM3=estDescripIng, @campM4=estColor   from ManV2.Estatus with(nolock) where estClave=@mComen
		select top 1  @campP1=estDescrip, @campP2=estNomImg, @campP3=estDescripIng, @campP4=estColor   from PreV2.Estatus with(nolock) where estClave=@mComen
		if @campM1= @campP1 and @campM2= @campP2 and @campM3= @campP3 and @campM4= @campP4
		begin set @banMsj='F' end
		else 
		begin 
			set @banMsj='T' 
			--set @cadSql='update PreV2.Estatus set estDescrip=''' + @campM1 + ''',estNomImg=''' +  @campM2 + ''', estDescripIng=''' + @campM3 + ''', estColor=''' + @campM4 + '''   where estClave= ' + @mComen 
			set @cadSql='Delete from PreV2.Estatus   where estClave= ' + @mComen 
		end
	end
end

if @mCto='FecAct'
begin
	if EXISTS (select * from PreV2.FecAct with(nolock)  where faClave= @mComen)
	begin	set @Row=1	end
	--select @Row = COUNT(*)  from PreV2.FecAct with(nolock)  where faClave= @mComen
	if @Row=0
	Begin  set @banMsj='0' end
	else
	begin
		select top 1  @campM1=faDescrip  from ManV2.FecAct with(nolock) where faClave=@mComen
		select top 1  @campP1=faDescrip  from PreV2.FecAct with(nolock) where faClave=@mComen
		if @campM1= @campP1 
		begin set @banMsj='F' end
		else 
		begin 
			set @banMsj='T' 
			--set @cadSql='update PreV2.FecAct set faDescrip=''' + @campM1 + '''   where faClave= ' + @mComen 
			set @cadSql='Delete from PreV2.FecAct  where faClave= ' + @mComen 
		end
	end
end

if @mCto='FichaTecnica'
begin
	if EXISTS (select *  from PreV2.FichaTecnica with(nolock)  where ftClave= @mComen)
	begin	set @Row=1	end
	--select @Row = COUNT(*)  from PreV2.FichaTecnica with(nolock)  where ftClave= @mComen
	if @Row=0
	Begin  set @banMsj='0' end
	else
	begin
		select top 1  @campM1=ftDefinicion,@campM2=ftAlgoritmo,@campM3=ftUnidad,@campM4=ftImportancia,@campM5=ftCobGeo,@campM6=ftPeriodo,@campM7=ftFecEsp,@campM8=ftObs,@campM9=ftDefinicionIng,@campM10=ftImportanciaIng,@campM11=ftObsIng,@campM12=ftFecEspIng,@campM13=ftDescripCal,@campM14=ftDescripCalIng,@campM15=ftOportunidad,@campM16=ftOportunidadIng,@campM17=ftCobGeoft  from ManV2.FichaTecnica with(nolock) where ftClave=@mComen
		select top 1  @campP1=ftDefinicion,@campP2=ftAlgoritmo,@campP3=ftUnidad,@campP4=ftImportancia,@campP5=ftCobGeo,@campP6=ftPeriodo,@campP7=ftFecEsp,@campP8=ftObs,@campP9=ftDefinicionIng,@campP10=ftImportanciaIng,@campP11=ftObsIng,@campP12=ftFecEspIng,@campP13=ftDescripCal,@campP14=ftDescripCalIng,@campP15=ftOportunidad,@campP16=ftOportunidadIng,@campP17=ftCobGeoft  from PreV2.FichaTecnica with(nolock) where ftClave=@mComen
		if @campM1= @campP1 and @campM2= @campP2 and @campM3= @campP3 and @campM4= @campP4 and @campM5= @campP5 and @campM6= @campP6 and @campM7= @campP7 and @campM8= @campP8 and @campM9= @campP9 and @campM10= @campP10 and @campM11= @campP11 and @campM12= @campP12 and @campM13= @campP13 and @campM14= @campP14 and @campM15= @campP15 and @campM16= @campP16 and @campM17= @campP17 
		begin set @banMsj='F' end
		else 
		begin 
			set @banMsj='T' 
			--set @cadSql='update PreV2.FichaTecnica set ftDefinicion=''' + @campM1 + ''',ftAlgoritmo=''' + @campM2 + ''',ftUnidad=' + @campM3 + ',ftImportancia=''' + @campM4 + ''',ftCobGeo=''' + @campM5 + ''',ftPeriodo=' + @campM6 + ',ftFecEsp=''' + @campM7 + ''',ftObs=''' + @campM8 + ''',ftDefinicionIng=''' + @campM9 + ''',ftImportanciaIng=''' + @campM10 + ''',ftObsIng=''' + @campM11 + ''',ftFecEspIng=''' + @campM12 + ''',ftDescripCal=''' + @campM13 + ''',ftDescripCalIng=''' + @campM14 + ''',ftOportunidad=''' + @campM15 + ''',ftOportunidadIng=''' + @campM16 + ''',ftCobGeoft=' + @campM17 +'   where ftClave= ' + @mComen 
			set @cadSql='Delete from PreV2.FichaTecnica where ftClave= ' + @mComen 
		end
	end
end

if @mCto='Frecuencia'
begin
	if EXISTS (select *  from PreV2.Frecuencia with(nolock)  where freClave= @mComen)
	begin	set @Row=1	end
	--select @Row = COUNT(*)  from PreV2.Frecuencia with(nolock)  where freClave= @mComen
	if @Row=0
	Begin  set @banMsj='0' end
	else
	begin
		select top 1  @campM1=freDescrip,@campM2=freCodigo,@campM3=freNumAA,@campM4=freNumMM,@campM5=freNumQQ,@campM6=freTipo,@campM7=freDescripIng from ManV2.Frecuencia with(nolock) where freClave=@mComen
		select top 1  @campP1=freDescrip,@campP2=freCodigo,@campP3=freNumAA,@campP4=freNumMM,@campP5=freNumQQ,@campP6=freTipo,@campP7=freDescripIng from PreV2.Frecuencia with(nolock) where freClave=@mComen
		if @campM1= @campP1 and @campM2= @campP2 and @campM3= @campP3 and @campM4= @campP4 and @campM5= @campP5 and @campM6= @campP6 and @campM7= @campP7
		begin set @banMsj='F' end
		else 
		begin 
			set @banMsj='T' 
			--set @cadSql='update PreV2.Frecuencia set freDescrip=''' + @campM1 + ''',freCodigo=''' + @campM2 + ''',freNumAA= ' + @campM3 + ',freNumMM= ' + @campM4 + ',freNumQQ= ' + @campM5 + ',freTipo=''' + @campM6 + ''',freDescripIng=''' + @campM7 +''' where freClave= ' + @mComen 
			set @cadSql='Delete from PreV2.Frecuencia  where freClave= ' + @mComen 
		end
	end
end

if @mCto='FTCob'
begin
	if EXISTS (select *  from PreV2.FTCob with(nolock)  where fcgClave= @mComen)
	begin	set @Row=1	end
	--select @Row = COUNT(*)  from PreV2.FTCob with(nolock)  where fcgClave= @mComen
	if @Row=0
	Begin  set @banMsj='0' end
	else
	begin
		select top 1  @campM1=fcgDescrip,@campM2=fcgDescripIng,@campM3=fcgAbrevia,@campM4=fcgAbreviaIng from ManV2.FTCob with(nolock) where fcgClave=@mComen
		select top 1  @campP1=fcgDescrip,@campP2=fcgDescripIng,@campP3=fcgAbrevia,@campP4=fcgAbreviaIng from PreV2.FTCob with(nolock) where fcgClave=@mComen
		if @campM1= @campP1 and @campM2= @campP2 and @campM3= @campP3 and @campM4= @campP4 
		begin set @banMsj='F' end
		else 
		begin 
			set @banMsj='T' 
			--set @cadSql='update PreV2.FTCob set fcgDescrip=''' + @campM1 + ''',fcgDescripIng=''' + @campM2 + ''',fcgAbrevia=''' + @campM3 + ''',fcgAbreviaIng=''' + @campM4 + ''' where fcgClave= ' + @mComen 
			set @cadSql='Delete from PreV2.FTCob  where fcgClave= ' + @mComen 
		end
	end
end

if @mCto='Fuentes'
begin
	if EXISTS (select *  from PreV2.Fuentes with(nolock)  where fueClave= @mComen)
	begin	set @Row=1	end
	--select @Row = COUNT(*)  from PreV2.Fuentes with(nolock)  where fueClave= @mComen
	if @Row=0
	Begin  set @banMsj='0' end
	else
	begin
		select top 1  @campM1=fueDescrip,@campM2=fueDescripIng from ManV2.Fuentes with(nolock) where fueClave=@mComen
		select top 1  @campP1=fueDescrip,@campP2=fueDescripIng from PreV2.Fuentes with(nolock) where fueClave=@mComen
		if @campM1= @campP1 and @campM2= @campP2
		begin set @banMsj='F' end
		else 
		begin 
			set @banMsj='T' 
			--set @cadSql='update PreV2.Fuentes set fueDescrip=''' + @campM1 + ''',fueDescripIng=''' + @campM2 + ''' where fueClave= ' + @mComen 
			set @cadSql='Delete from PreV2.Fuentes  where fueClave= ' + @mComen 
		end
	end
end

if @mCto='Grafica'
begin
	if EXISTS (select * from PreV2.Grafica with(nolock)  where graClave= @mComen)
	begin	set @Row=1	end
	--select @Row = COUNT(*)  from PreV2.Grafica with(nolock)  where graClave= @mComen
	if @Row=0
	Begin  set @banMsj='0' end
	else
	begin
		select top 1  @campM1=graDescrip,@campM2=graDescripIng,@campM3=graAbrevia,@campM4=graAbreviaIng from ManV2.Grafica with(nolock) where graClave=@mComen
		select top 1  @campP1=graDescrip,@campP2=graDescripIng,@campP3=graAbrevia,@campP4=graAbreviaIng from PreV2.Grafica with(nolock) where graClave=@mComen
		if @campM1= @campP1 and @campM2= @campP2 and @campM3= @campP3 and @campM4= @campP4
		begin set @banMsj='F' end
		else 
		begin 
			set @banMsj='T' 
			--set @cadSql='update PreV2.Grafica set graDescrip=''' + @campM1 + ''',graDescripIng=''' + @campM2 + ''',graAbrevia=''' + @campM3 + ''',graAbreviaIng=''' + @campM4 + ''' where graClave= ' + @mComen 
			set @cadSql='Delete from PreV2.Grafica  where graClave= ' + @mComen 
		end
	end
end

if @mCto='Grupo'
begin
	if EXISTS (select *  from PreV2.Grupo with(nolock)  where gpoClave= @mComen)
	begin	set @Row=1	end
	--select @Row = COUNT(*)  from PreV2.Grupo with(nolock)  where gpoClave= @mComen
	if @Row=0
	Begin  set @banMsj='0' end
	else
	begin
		select top 1  @campM1=gpoDescrip,@campM2=gpoDescripIng,@campM3=gpoAlias,@campM4=gpoAliasIng from ManV2.Grupo with(nolock) where gpoClave=@mComen
		select top 1  @campP1=gpoDescrip,@campP2=gpoDescripIng,@campP3=gpoAlias,@campP4=gpoAliasIng from PreV2.Grupo with(nolock) where gpoClave=@mComen
		if @campM1= @campP1 and @campM2= @campP2 and @campM3= @campP3 and @campM4= @campP4
		begin set @banMsj='F' end
		else 
		begin 
			set @banMsj='T' 
			--set @cadSql='update PreV2.Grupo set gpoDescrip=''' + @campM1 + ''',gpoDescripIng=''' + @campM2 + ''',gpoAlias=''' + @campM3 + ''',gpoAliasIng=''' + @campM4 + ''' where gpoClave= ' + @mComen 
			set @cadSql='Delete from PreV2.Grupo  where gpoClave= ' + @mComen 
		end
	end
end

if @mCto='Institucion'
begin
	if EXISTS (select *  from PreV2.Institucion with(nolock)  where insClave= @mComen)
	begin	set @Row=1	end
	--select @Row = COUNT(*)  from PreV2.Institucion with(nolock)  where insClave= @mComen
	if @Row=0
	Begin  set @banMsj='0' end
	else
	begin
		select top 1  @campM1=insDescrip,@campM2=insDescripIng,@campM3=insAbrevia,@campM4=insAbreviaIng,@campM5=insURL from ManV2.Institucion with(nolock) where insClave=@mComen
		select top 1  @campP1=insDescrip,@campP2=insDescripIng,@campP3=insAbrevia,@campP4=insAbreviaIng,@campP5=insURL from PreV2.Institucion with(nolock) where insClave=@mComen
		if @campM1= @campP1 and @campM2= @campP2 and @campM3= @campP3 and @campM4= @campP4 and @campM5= @campP5
		begin set @banMsj='F' end
		else 
		begin 
			set @banMsj='T' 
			--set @cadSql='update PreV2.Institucion set insDescrip=''' + @campM1 + ''',insDescripIng=''' + @campM2 + ''',insAbrevia=''' + @campM3 + ''',insAbreviaIng=''' + @campM4 + ''',insURL=''' + @campM5 + ''' where insClave= ' + @mComen 
			set @cadSql='Delete from PreV2.Institucion  where insClave= ' + @mComen 
		end
	end
end

if @mCto='Metadato'
begin
	if EXISTS (select * from PreV2.Metadato with(nolock)  where metClave= @mComen)
	begin	set @Row=1	end
	--select @Row = COUNT(*)  from PreV2.Metadato with(nolock)  where metClave= @mComen
	if @Row=0
	Begin  set @banMsj='0' end
	else
	begin
		select top 1  @campM1=metDescrip,@campM2=metDescripIng from ManV2.Metadato with(nolock) where metClave=@mComen
		select top 1  @campP1=metDescrip,@campP2=metDescripIng from PreV2.Metadato with(nolock) where metClave=@mComen
		if @campM1= @campP1 and @campM2= @campP2
		begin set @banMsj='F' end
		else 
		begin 
			set @banMsj='T' 
			--set @cadSql='update PreV2.Metadato set metDescrip=''' + @campM1 + ''',metDescripIng=''' + @campM2 + ''' where metClave= ' + @mComen 
			set @cadSql='Delete from PreV2.Metadato  where metClave= ' + @mComen 
		end
	end
end

if @mCto='NoDato'
begin
	if EXISTS (select *  from PreV2.NoDato with(nolock)  where ndClave= @mComen)
	begin	set @Row=1	end
	--select @Row = COUNT(*)  from PreV2.NoDato with(nolock)  where ndClave= @mComen
	if @Row=0
	Begin  set @banMsj='0' end
	else
	begin
		select top 1  @campM1=ndCodigo,@campM2=ndDescrip,@campM3=ndDescripIng,@campM4=ndCodigoIng,@campM5=ndCodigoMapa from ManV2.Nodato with(nolock) where ndClave=@mComen
		select top 1  @campP1=ndCodigo,@campP2=ndDescrip,@campP3=ndDescripIng,@campP4=ndCodigoIng,@campP5=ndCodigoMapa from PreV2.Nodato with(nolock) where ndClave=@mComen
		if @campM1= @campP1 and @campM2= @campP2 and @campM3= @campP3 and @campM4= @campP4 and @campM5= @campP5
		begin set @banMsj='F' end
		else 
		begin 
			set @banMsj='T' 
			--set @cadSql='update PreV2.NoDato set ndCodigo=''' + @campM1 + ''',ndDescrip=''' + @campM2 + ''',ndDescripIng=''' + @campM3 + ''',ndCodigoIng=''' + @campM4 + ''',ndCodigoMapa=' + @campM5 + ' where ndClave= ' + @mComen 
			set @cadSql='Delete from PreV2.NoDato  where ndClave= ' + @mComen 
		end
	end
end

if @mCto='Notas'
begin
	if EXISTS (select *  from PreV2.Notas with(nolock)  where notClave= @mComen)
	begin	set @Row=1	end
	--select @Row = COUNT(*)  from PreV2.Notas with(nolock)  where notClave= @mComen
	if @Row=0
	Begin  set @banMsj='0' end
	else
	begin
		select top 1  @campM1=notNota,@campM2=notNotaIng from ManV2.Notas with(nolock) where notClave=@mComen
		select top 1  @campP1=notNota,@campP2=notNotaIng from PreV2.Notas with(nolock) where notClave=@mComen
		if @campM1= @campP1 and @campM2= @campP2 
		begin set @banMsj='F' end
		else 
		begin 
			set @banMsj='T' 
			--set @cadSql='update PreV2.Notas set notNota=''' + @campM1 + ''',notNotaIng=''' + @campM2 + ''' where notClave= ' + @mComen 
			set @cadSql='Delete from PreV2.Notas  where notClave= ' + @mComen 
		end
	end
end

if @mCto='Periodo'
begin
	if EXISTS (select *  from PreV2.Periodo with(nolock)  where perClave= @mComen)
	begin	set @Row=1	end
	--select @Row = COUNT(*)  from PreV2.Periodo with(nolock)  where perClave= @mComen
	if @Row=0
	Begin  set @banMsj='0' end
	else
	begin
		select top 1  @campM1=perDescrip,@campM2=perDescripIng,@campM3=perAbrevia,@campM4=perAbreviaIng  from ManV2.Periodo with(nolock) where perClave=@mComen
		select top 1  @campP1=perDescrip,@campP2=perDescripIng,@campP3=perAbrevia,@campP4=perAbreviaIng  from PreV2.Periodo with(nolock) where perClave=@mComen
		if @campM1= @campP1 and @campM2= @campP2 and @campM3= @campP3 and @campM4= @campP4 
		begin set @banMsj='F' end
		else 
		begin 
			set @banMsj='T' 
			--set @cadSql='update PreV2.Periodo set perDescrip=''' + @campM1 + ''',perDescripIng=''' + @campM2 + ''',perAbrevia=''' + @campM3 + ''',perAbreviaIng=''' + @campM4 + ''' where perClave= ' + @mComen 
			set @cadSql='Delete from PreV2.Periodo  where perClave= ' + @mComen 
		end
	end
end

if @mCto='RefInter'
begin
	if EXISTS (select *  from PreV2.RefInter with(nolock)  where riClave= @mComen)
	begin	set @Row=1	end
	--select @Row = COUNT(*)  from PreV2.RefInter with(nolock)  where riClave= @mComen
	if @Row=0
	Begin  set @banMsj='0' end
	else
	begin
		select top 1  @campM1=riDescrip,@campM2=riDescripIng  from ManV2.RefInter with(nolock) where riClave=@mComen
		select top 1  @campP1=riDescrip,@campP2=riDescripIng  from PreV2.RefInter with(nolock) where riClave=@mComen
		if @campM1= @campP1 and @campM2= @campP2
		begin set @banMsj='F' end
		else 
		begin 
			set @banMsj='T' 
			--set @cadSql='update PreV2.RefInter set riDescrip=''' + @campM1 + ''',riDescripIng=''' + @campM2 + ''' where riClave= ' + @mComen 
			set @cadSql='Delete from PreV2.RefInter  where riClave= ' + @mComen 
		end
	end
end

if @mCto='Temas'
begin
	if EXISTS (select *  from PreV2.Temas with(nolock)  where temClave= @mComen)
	begin	set @Row=1	end
	--select @Row = COUNT(*)  from PreV2.Temas with(nolock)  where temClave= @mComen
	if @Row=0
	Begin  set @banMsj='0' end
	else
	begin
		select top 1  @campM1=temDescrip,@campM2=temDescripIng,@campM3=temClaveMet   from ManV2.Temas with(nolock) where temClave=@mComen
		select top 1  @campP1=temDescrip,@campP2=temDescripIng,@campP3=temClaveMet   from PreV2.Temas with(nolock) where temClave=@mComen
		if @campM1= @campP1 and @campM2= @campP2  and @campM3= @campP3
		begin set @banMsj='F' end
		else 
		begin 
			set @banMsj='T' 
			--set @cadSql='update PreV2.Temas set temDescrip=''' + @campM1 + ''',temDescripIng=''' + @campM2 + ''',temClaveMet= ' + @campM3 + ' where temClave= ''' + @mComen + '' 
			set @cadSql='Delete from PreV2.Temas  where temClave= ''' + @mComen + '''' 
		end
	end
end

if @mCto='TipoCobGeo'
begin
	if EXISTS (select *  from PreV2.TipoCobGeo with(nolock)  where tcgClave= @mComen)
	begin	set @Row=1	end
	--select @Row = COUNT(*)  from PreV2.TipoCobGeo with(nolock)  where tcgClave= @mComen
	if @Row=0
	Begin  set @banMsj='0' end
	else
	begin
		select top 1  @campM1=tcgDescrip,@campM2=tcgDescripIng,@campM3=tcgCveApiMapa,@campM4=tcgCodigo,@campM5=tcgCodigoIng   from ManV2.TipoCobGeo with(nolock) where tcgClave=@mComen
		select top 1  @campP1=tcgDescrip,@campP2=tcgDescripIng,@campP3=tcgCveApiMapa,@campP4=tcgCodigo,@campP5=tcgCodigoIng   from PreV2.TipoCobGeo with(nolock) where tcgClave=@mComen
		if @campM1= @campP1 and @campM2= @campP2  and @campM3= @campP3 and @campM4= @campP4 and @campM5= @campP5
		begin set @banMsj='F' end
		else 
		begin 
			set @banMsj='T' 
			--set @cadSql='update PreV2.TipoCobGeo set tcgDescrip=''' + @campM1 + ''',tcgDescripIng=''' + @campM2 + ''', tcgCveApiMapa= ''' + @campM3 + ''',tcgCodigo=''' + @campM4 + ''',tcgCodigoing=''' + @campM5 + ''' where tcgClave= ' + @mComen
			set @cadSql='Delete from PreV2.TipoCobGeo  where tcgClave= ' + @mComen
		end
	end
end

if @mCto='TipoIndicador'
begin
	if EXISTS (select *  from PreV2.TipoIndicador with(nolock)  where tatrCve= @mComen)
	begin	set @Row=1	end
	--select @Row = COUNT(*)  from PreV2.TipoIndicador with(nolock)  where tatrCve= @mComen
	if @Row=0
	Begin  set @banMsj='0' end
	else
	begin
		select top 1  @campM1=tatrDescripP,@campM2=tatrDescripS,@campM3=tatrInforme,@campM4=tatrDescripPIng,@campM5=tatrDescripSIng,@campM6=tatrInformeIng   from ManV2.TipoIndicador with(nolock) where tatrCve=@mComen
		select top 1  @campP1=tatrDescripP,@campP2=tatrDescripS,@campP3=tatrInforme,@campP4=tatrDescripPIng,@campP5=tatrDescripSIng,@campP6=tatrInformeIng   from PreV2.TipoIndicador with(nolock) where tatrCve=@mComen
		if @campM1= @campP1 and @campM2= @campP2  and @campM3= @campP3 and @campM4= @campP4 and @campM5= @campP5 and @campM6= @campP6
		begin set @banMsj='F' end
		else 
		begin 
			set @banMsj='T' 
			--set @cadSql='update PreV2.TipoIndicador set tatrDescripP=''' + @campM1 + ''',tatrDescripS=''' + @campM2 + ''', tatrInforme= ''' + @campM3 + ''',tatrDescripPIng=''' + @campM4 + ''',tatrDescripSIng=''' + @campM5 + ''',tatrInformeIng=''' + @campM6 + ''' where tatrCve= ''' + @mComen  + ''
			set @cadSql='Delete from PreV2.TipoIndicador  where tatrCve= ''' + @mComen  + ''''
		end
	end
end


if @mCto='Unidad'
begin
	if EXISTS (select * from PreV2.Unidad with(nolock)  where uniClave= @mComen)
	begin	set @Row=1	end
	--select @Row = COUNT(*)  from PreV2.Unidad with(nolock)  where uniClave= @mComen
	if @Row=0
	Begin  set @banMsj='0' end
	else
	begin
		select top 1  @campM1=uniDescrip,@campM2=uniDescripIng,@campM3=uniAbrevia,@campM4=uniAbreviaIng   from ManV2.Unidad with(nolock) where uniClave=@mComen
		select top 1  @campP1=uniDescrip,@campP2=uniDescripIng,@campP3=uniAbrevia,@campP4=uniAbreviaIng   from PreV2.Unidad with(nolock) where uniClave=@mComen
		if @campM1= @campP1 and @campM2= @campP2  and @campM3= @campP3 and @campM4= @campP4
		begin set @banMsj='F' end
		else 
		begin 
			set @banMsj='T' 
			--set @cadSql='update PreV2.Unidad set uniDescrip=''' + @campM1 + ''',uniDescripIng=''' + @campM2 + ''', uniAbrevia= ''' + @campM3 + ''',uniAbreviaIng=''' + @campM4 + ''' where uniClave= ' + @mComen 
			set @cadSql='Delete from PreV2.Unidad  where uniClave= ' + @mComen 
		end
	end
end

if @mCto='Usuarios'
begin
	if EXISTS (	select *  from PreV2.Usuarios with(nolock)  where usuClave= @mComen)
	begin	set @Row=1	end
	--select @Row = COUNT(*)  from PreV2.Usuarios with(nolock)  where usuClave= @mComen
	if @Row=0
	Begin  set @banMsj='0' end
	else
	begin
		select top 1  @campM1=usuContraseña,@campM2=usuNombre,@campM3=usuTipo,@campM4=usuClaveDep,@campM5=usuCargo   from ManV2.Usuarios with(nolock) where usuClave=@mComen
		select top 1  @campP1=usuContraseña,@campP2=usuNombre,@campP3=usuTipo,@campP4=usuClaveDep,@campP5=usuCargo   from PreV2.Usuarios with(nolock) where usuClave=@mComen
		if @campM1= @campP1 and @campM2= @campP2  and @campM3= @campP3 and @campM4= @campP4 and @campM5= @campP5
		begin set @banMsj='F' end
		else 
		begin 
			set @banMsj='T' 
			--set @cadSql='update PreV2.Usuarios set usuContraseña=''' + @campM1 + ''',usuNombre=''' + @campM2 + ''', usuTipo=''' + @campM3 + ''',usuClaveDep=' + @campM4 + ',usuCargo=''' + @campM5 + ''' where usuClave= ''' + @mComen + '' 
			set @cadSql='Delete from PreV2.Usuarios  where usuClave= ''' + @mComen + ''''
		end
	end
end

--if @mCto='Enlace' or @mCto='EnlaceIng' or @mCto='Lexico' or @mCto='LexicoIng'
--begin
	
--    select @Posicion =   patindex('%Values%' ,@mSql)
--    set @cad1 = @mSql
--    SELECT @cad1= stuff(@cad1, 1, @Posicion, '')--20,2,6)
--    select @Posicion =  patindex('%(%' ,@cad1)
--    SELECT @cad1= stuff(@cad1, 1, @Posicion, '')--20,2,6)
--   -- select @Posicion2 =   patindex('%,%' ,@cad1)
--     if @mCto='Enlace' or @mCto='EnlaceIng'
--    begin
--		select @Posicion2 =  patindex('%,%' ,@cad1)
--    end
--    set @posA=1
--    if @mCto='Lexico' or @mCto='LexicoIng'
--    begin
--		WHILE CHARINDEX(',', @cad1, @posA)>0
--		BEGIN
--			SET @Posicion2=CHARINDEX(',', @cad1, @posA)
--			SET @posA=@Posicion2+1
--			print @posA
--		END
	
--		--select @Posicion2 =  patindex('%,%' ,@cad1)
--    end 
--    select @cadPal = left(@cad1, @Posicion2 -1)--clave palabra
--    SELECT @cad1= stuff(@cad1, 1, @Posicion2, '')
--    select @cadDes = left(@cad1, LEN (@cad1)-1)--clave descripcion
--    print @cadPal + ' - ' +  @cadDes
--    if @mCto ='Enlace'
--    begin
--		if EXISTS (select *  from PreV2.Enlace with(nolock)  where enlClavePalabra= @cadPal and enlClaveDescrip = @cadDes )
--		begin	set @Row=1	end
--		--select @Row = COUNT(*)  from PreV2.Enlace with(nolock)  where enlClavePalabra= @cadPal and enlClaveDescrip = @cadDes 
--		--set @cadSql='update pre.Enlace set enlClaveDescrip=' + @cadDes  + ' where enlClavePalabra= ' + @cadPal 
--	end
--	if @mCto ='EnlaceIng'
--	begin
--		if EXISTS (select * from PreV2.EnlaceIng with(nolock)  where enlClavePalabraIng= @cadPal and enlClaveDescripIng = @cadDes  )
--		begin	set @Row=1	end
--		--select @Row = COUNT(*)  from PreV2.EnlaceIng with(nolock)  where enlClavePalabraIng= @cadPal and enlClaveDescripIng = @cadDes 
--		--set @cadSql='update pre.EnlaceIng set enlClaveDescripIng=' + @cadDes  + ' where enlClavePalabraIng= ' + @cadPal 
--	end
--	if @mCto ='Lexico'
--	begin
--		if EXISTS (select * from preV2.Lexico with(nolock)  where lexClavePalabra = @cadDes) --lexPalabra= @cadPal and   )
--		begin	set @Row=1	end
--		--select @Row = COUNT(*)  from preV2.Lexico with(nolock)  where lexClavePalabra = @cadDes --lexPalabra= @cadPal and 
--		--set @cadSql='update PreV2.Lexico set lexPalabra=' + @cadPal  + ' where lexClavePalabra= ' + @cadDes 
--		set @cadSql='Delete from PreV2.Lexico  where lexClavePalabra= ' + @cadDes 
		
--	end
--	if @mCto ='LexicoIng'
--	begin
--		if EXISTS (select *  from preV2.LexicoIng with(nolock)  where lexClavePalabraIng = @cadDes ) --lexPalabra= @cadPal and   )
--		begin	set @Row=1	end
--		--select @Row = COUNT(*)  from preV2.LexicoIng with(nolock)  where lexClavePalabraIng = @cadDes --lexPalabraIng= @cadPal and 
--		--set @cadSql='update PreV2.LexicoIng set lexPalabraIng=' + @cadPal  + ' where lexClavePalabraIng= ' + @cadDes 
--		set @cadSql='Delete from  PreV2.LexicoIng  where lexClavePalabraIng= ' + @cadDes 
--	end
--	if @Row=0
--	Begin  set @banMsj='0' end
--	else
--	begin  
--		set @banMsj='F'
--		--if @mCto ='Enlace'
--		--begin
--		--	select top 1  @campM1=enlClaveDescrip  from man.Enlace where enlClavePalabra= @cadPal
--		--	select top 1  @campP1=enlClaveDescrip  from pre.Enlace where enlClavePalabra= @cadPal
--		--end
--		--if @mCto ='EnlaceIng'
--		--begin
--		--	select top 1  @campM1=enlClaveDescripIng  from man.EnlaceIng where enlClavePalabraIng= @cadPal
--		--	select top 1  @campP1=enlClaveDescripIng  from pre.EnlaceIng where enlClavePalabraIng= @cadPal
--		--end
--		if @mCto <> 'Enlace' and  @mCto <> 'EnlaceIng'
--		begin
--			if @mCto ='Lexico'
--			begin
--				select top 1  @campM1=lexPalabra  from ManV2.Lexico with(nolock) where  lexClavePalabra = @cadDes
--				select top 1  @campP1=lexPalabra  from PreV2.Lexico with(nolock) where  lexClavePalabra = @cadDes
--			end
--			if @mCto ='LexicoIng'
--			begin
--				select top 1  @campM1=lexPalabraIng  from ManV2.LexicoIng with(nolock) where  lexClavePalabraIng = @cadDes
--				select top 1  @campP1=lexPalabraIng  from PreV2.LexicoIng with(nolock) where  lexClavePalabraIng = @cadDes
--			end
--			if @campM1= @campP1
--			begin	set @banMsj='F'	end
--			else
--			begin
--				set @banMsj='T'
--		 	end
--	 	end
--	 end
--end

if @mCto='EnlacePCve' or @mCto='EnlacePcveIng' or @mCto='LexicoPCve' or @mCto='LexicoPCveIng' or @mCto='EnlIndPCve' 
begin
	print @mSql
	select @Posicion =   patindex('%Values%' ,@mSql)
	set @cad1 = @mSql
	SELECT @cad1= stuff(@cad1, 1, @Posicion, '')--20,2,6)
	select @Posicion =  patindex('%(%' ,@cad1)
	SELECT @cad1= stuff(@cad1, 1, @Posicion, '')--20,2,6)
   -- select @Posicion2 =   patindex('%,%' ,@cad1)
	 if @mCto='EnlacePCve' or @mCto='EnlacePCveIng' or @mCto='EnlIndPCve' 
	begin
		select @Posicion2 =  patindex('%,%' ,@cad1)
	end
	set @posA=1
	if @mCto='LexicoPCve' or @mCto='LexicoPCveIng'
	begin
		WHILE CHARINDEX(',', @cad1, @posA)>0
		BEGIN
			SET @Posicion2=CHARINDEX(',', @cad1, @posA)
			SET @posA=@Posicion2+1
			print @posA
		END
	
		--select @Posicion2 =  patindex('%,%' ,@cad1)
	end 
	select @cadPal = left(@cad1, @Posicion2 -1)--clave palabra
	SELECT @cad1= stuff(@cad1, 1, @Posicion2, '')
	select @cadDes = left(@cad1, LEN (@cad1)-1)--clave descripcion
	print @cadPal + ' - ' +  @cadDes
	if @mCto ='EnlIndPCve'
	begin
		if EXISTS (select * from PreV2.EnlIndPCve with(nolock)  where eipcCveInd= @cadPal and eipcCveDesPCve = @cadDes  ) 
		begin	set @Row=1	end
		--select @Row = COUNT(*)  from PreV2.EnlacePCve with(nolock)  where epcCvePCve= @cadPal and epcCveDesPCve = @cadDes 
		--set @cadSql='update pre.Enlace set enlClaveDescrip=' + @cadDes  + ' where enlClavePalabra= ' + @cadPal 
	end
	if @mCto ='EnlacePCve'
	begin
		if EXISTS (select * from PreV2.EnlacePCve with(nolock)  where epcCvePCve= @cadPal and epcCveDesPCve = @cadDes  ) 
		begin	set @Row=1	end
		--select @Row = COUNT(*)  from PreV2.EnlacePCve with(nolock)  where epcCvePCve= @cadPal and epcCveDesPCve = @cadDes 
		--set @cadSql='update pre.Enlace set enlClaveDescrip=' + @cadDes  + ' where enlClavePalabra= ' + @cadPal 
	end
	if @mCto ='EnlacePCveIng'
	begin
		if EXISTS (select * from PreV2.EnlacePCveIng with(nolock)  where epcCvePCveIng= @cadPal and epcCveDesPCveIng = @cadDes  ) 
		begin	set @Row=1	end
		--select @Row = COUNT(*)  from PreV2.EnlacePCveIng with(nolock)  where epciCvePCveIng= @cadPal and epciCvePCveIng = @cadDes 
		--set @cadSql='update pre.EnlaceIng set enlClaveDescripIng=' + @cadDes  + ' where enlClavePalabraIng= ' + @cadPal 
	end
	if @mCto ='LexicoPCve'
	begin
		if EXISTS (select *  from preV2.LexicoPCve with(nolock)  where lpcClavePalCve = @cadDes) 
		begin	set @Row=1	end
		--select @Row = COUNT(*)  from preV2.LexicoPCve with(nolock)  where lpcClavePalCve = @cadDes --lexPalabra= @cadPal and 
		--set @cadSql='update PreV2.Lexico set lexPalabra=' + @cadPal  + ' where lexClavePalabra= ' + @cadDes 
		set @cadSql='Delete from PreV2.LexicoPCve  where lpcClavePalCve= ' + @cadDes 
		
	end
	if @mCto ='LexicoPCveIng'
	begin
		if EXISTS (select *  from preV2.LexicoPCveIng with(nolock)  where lpcClavePalCveIng = @cadDes)	
		begin	set @Row=1	end
		--select @Row = COUNT(*)  from preV2.LexicoPCveIng with(nolock)  where lpciClavePalCveIng = @cadDes --lexPalabraIng= @cadPal and 
		--set @cadSql='update PreV2.LexicoIng set lexPalabraIng=' + @cadPal  + ' where lexClavePalabraIng= ' + @cadDes 
		set @cadSql='Delete from  PreV2.LexicoPCveIng  where lpcClavePalCveIng= ' + @cadDes 
	end
	if @Row=0
	Begin  set @banMsj='0' end
	else
	begin  
		set @banMsj='F'
		if @mCto <> 'EnlacePCve' and  @mCto <> 'EnlacePCveIng' and @mCto<>'EnlIndPCve'
		begin
			if @mCto ='LexicoPCve'
			begin
				select top 1  @campM1=lpcPalabraCve  from ManV2.LexicoPCve with(nolock) where  lpcClavePalCve = @cadDes
				select top 1  @campP1=lpcPalabraCve  from PreV2.LexicoPCve with(nolock) where  lpcClavePalCve = @cadDes
			end
			if @mCto ='LexicoPCveIng'
			begin
				select top 1  @campM1=lpcPalabraCveIng  from ManV2.LexicoPCveIng with(nolock) where  lpcClavePalCveIng = @cadDes
				select top 1  @campP1=lpcPalabraCveIng  from PreV2.LexicoPCveIng with(nolock) where  lpcClavePalCveIng = @cadDes
			end
			if @campM1= @campP1
			begin	set @banMsj='F'	end
			else
			begin
				set @banMsj='T'
			end
		end
	 end
end


if @mCto='Clasificacion'
begin
	select @Posicion =   patindex('%Values%' ,@mSql)
	set @cad1 = @mSql
	SELECT @cad1= stuff(@cad1, 1, @Posicion, '')--20,2,6)
	select @Posicion =  patindex('%(%' ,@cad1)
	SELECT @cad1= stuff(@cad1, 1, @Posicion, '')--20,2,6)
	--select @cad1 = left(@mSql, @Posicion + 6)--20,2,6)
	select @Posicion2 =   patindex('%,%' ,@cad1) --20,2,6)
	select @claCve = left(@cad1, @Posicion2 -1)--clave clasificacion 20
	SELECT @cad1= stuff(@cad1, 1, @Posicion2, '')--2,6)
	select @Posicion3 =   patindex('%,%' ,@cad1) --2,6)
	select @claGpo = left(@cad1, @Posicion3 -1)--clave grupo 2
	SELECT @cad1= stuff(@cad1, 1, @Posicion3, '')--6)
	select @Posicion4 =   patindex('%,%' ,@cad1) 
	if @Posicion4 >0
	begin
		select @claCveDes = left(@cad1, @Posicion4 -1)--clave descripcion
	end
	else
	begin
		select @claCveDes = left(@cad1, LEN (@cad1)-1)--clave descripcion
	end
	if EXISTS (select *  from PreV2.Clasificacion with(nolock)  where claClave =@claCve )	
	begin	set @Row=1	end
	--select @Row = COUNT(*)  from PreV2.Clasificacion with(nolock)  where claClave =@claCve 
	if @Row=0
	Begin  set @banMsj='0' end
	else
	begin  
		select top 1  @campM1=claGrupo,@campM2=claClaveDescrip,@campM3=claOrden  from ManV2.Clasificacion with(nolock) where claClave=@claCve
		select top 1  @campP1=claGrupo,@campP2=claClaveDescrip,@campP3=claOrden  from PreV2.Clasificacion with(nolock) where claClave=@claCve
		if @campM1= @campP1 and @campM2= @campP2
		begin set @banMsj='F' end
		else 
		begin 
			set @banMsj='T'
			--set @cadSql='update PreV2.Clasificacion set claGrupo=' + @campM1 + ',claClaveDescrip=' + @campM2 + ',claOrden=' + @campM3 + ' where claClave= ' + @claCve
			set @cadSql='Delete from PreV2.Clasificacion where claClave= ' + @claCve
		end
	end
end

set @Row = 0
if @mCto='EnlFTCon' or @mCto='EnlFTMFte' or @mCto='EnlFTRInst' or @mCto='EnlFTRRI' or @mCto='EnlIndGra'  or @mCto='EnlIndTipo' 
begin
	select @Posicion =   patindex('%Values%' ,@mSql)
	set @cad1 = @mSql
	SELECT @cad1= stuff(@cad1, 1, @Posicion, '')--20,2,6)
	select @Posicion =  patindex('%(%' ,@cad1)
	SELECT @cad1= stuff(@cad1, 1, @Posicion, '')--20,2,6)
	--select @cad1 = left(@mSql, @Posicion + 6)--20,2,6)
	--PRINT @cad1
	select @Posicion2 =   patindex('%,%' ,@cad1) --20,2,6)
	select @claCve = left(@cad1, @Posicion2 -1)--clave Ficha tecnica 20
	SELECT @cad1= stuff(@cad1, 1, @Posicion2, '')--2,6)
	select @Posicion3 =   patindex('%,%' ,@cad1) --2,6)
	select @claGpo = left(@cad1, @Posicion3 -1)--clave contato, fuente, institucion y referencia internacional, grafica,tipo de indicador 2
	SELECT @cad1= stuff(@cad1, 1, @Posicion3, '')--6)
	select @claCveDes = left(@cad1, LEN (@cad1)-1)--orden
	set @MsjTemp=  @claCve  + ' - ' + @claGpo + ' - ' + @claCveDes
	PRINT @MsjTemp + ' - '  + @mCto
	if @mCto='EnlFTCon'
	begin
		if EXISTS (Select * from PreV2.EnlFtmFte with(nolock) where effClave= @claCve and effClaveFue =  @claGpo)
		begin
			set @Row=1
		end
		--select @Row = COUNT(*)  from PreV2.EnlFTCon with(nolock)  where efcClaveFT= @claCve and efcClaveCon = @claGpo
		--Select @Row = effClave from PreV2.EnlFtmFte with(nolock) where effClave= @claCve and effClaveFue =  @claGpo
		--set @cadSqlEnl = 'select COUNT(efcClaveFT)  from PreV2.EnlFTCon with(nolock)  where efcClaveFT=  '+  @claCve  + ' and efcClaveCon ='+ @claGpo  
		--exec(@cadSqlEnl) 
	end
	if @mCto='EnlFTMFte'
	begin
		if EXISTS(Select * from PreV2.EnlFtmFte with(nolock) where effClave= @claCve and effClaveFue =  @claGpo)
		begin
			set @Row=1
		end
		--Select @Row = COUNT(effClave) from PreV2.EnlFtmFte with(nolock) where effClave= @claCve and effClaveFue =  @claGpo
	--	Select @Row = effClave from PreV2.EnlFtmFte with(nolock) where effClave= @claCve and effClaveFue =  @claGpo
		--set @cadSqlEnl = 'select COUNT(effClave)  from PreV2.EnlFtmFte with(nolock) where effClave= '+  @claCve  + ' and effClaveFue ='+ @claGpo  
		--exec(@cadSqlEnl)
	end
	if @mCto='EnlFTRInst'
	begin
		IF EXISTS (select * from PreV2.EnlFTRInst with(nolock)  where efiClave=  @claCve  and efiClaveInst = @claGpo )
		BEGIN
			 set @Row=1
		end
		--select @Row = COUNT(efiClave)  from PreV2.EnlFTRInst with(nolock)  where efiClave=  @claCve  and efiClaveInst = @claGpo 
		--select @Row = efiClave  from PreV2.EnlFTRInst with(nolock)  where efiClave=  @claCve  and efiClaveInst = @claGpo 
		--set @cadSqlEnl = 'select COUNT(efiClave)  from PreV2.EnlFTRInst with(nolock)  where efiClave= '+  @claCve  + ' and efiClaveInst ='+ @claGpo  
		--exec(@cadSqlEnl)
	end
	if @mCto='EnlFTRRI'
	begin
		IF EXISTS (select * from PreV2.EnlFTRRI with(nolock)  where efrClave= @claCve  and efrClaveRI = @claGpo )
		BEGIN
			set @Row=1 
		end
		--select @Row = COUNT(efrClave)  from PreV2.EnlFTRRI with(nolock)  where efrClave= @claCve  and efrClaveRI = @claGpo 
		--select @Row = efrClave  from PreV2.EnlFTRRI with(nolock)  where efrClave= @claCve  and efrClaveRI = @claGpo 
		--set @cadSqlEnl = 'select COUNT(efrClave)  from PreV2.EnlFTRRI with(nolock)  where efrClave= '+  @claCve  + ' and efrClaveRI ='+ @claGpo  
		--exec(@cadSqlEnl)
	end
	if @mCto='EnlIndGra'
	begin
		--set @claCveDes ='' + @claCveDes  + ''
		print @claCveDes 
		select @Posicion3 =   patindex('%''%' ,@claCveDes ) --quitar la primer '
		select @claCveDes  =  stuff(@claCveDes , 1, @Posicion3, '')		
		select @Posicion3 =   patindex('%''%' ,@claCveDes ) --quitar la segunda '
		select @claCveDes  =  stuff(@claCveDes ,@Posicion3, 1, '')
		print @claCveDes 
		IF EXISTS (select  * from PreV2.EnlIndGra with(nolock) where eigCveInd = @claCve  and eigSeccion = @claCveDes) 
		BEGIN
			set @Row = 1
		end
		--select @Row = COUNT(eigCveInd)  from PreV2.EnlIndGra with(nolock)  where eigCveInd =  @claCve  and eigSeccion = @claCveDes 
--		select  @Row=eigCveInd from ManV2.EnlIndGra with(nolock) where eigCveInd = @claCve  and eigSeccion = @claCveDes
		--set @cadSqlEnl = 'select COUNT(eigCveInd)  from PreV2.EnlIndGra with(nolock)  where eigCveInd ='+  @claCve  + ' and eigSeccion ='+ @claCveDes  
		--exec(@cadSqlEnl)
		--print @cadSqlEnl
	end
	if @mCto='EnlIndTipo'
	begin
		--set @claGpo='' + @claGpo + ''
		--print 'Entre al enlindtipo'
		--print @claCve
		--print @claGpo
		select @Posicion3 =   patindex('%''%' ,@claGpo) --quitar la primer '
		select @claGpo =  stuff(@claGpo, 1, @Posicion3, '')		
		select @Posicion3 =   patindex('%''%' ,@claGpo) --quitar la segunda '
		select @claGpo =  stuff(@claGpo,@Posicion3, 1, '')
		--print @claGpo				
		IF EXISTS (select  * from PreV2.EnlIndTipo with(nolock) where eitCveInd =  @claCve  and eitCveTipoInd = @claGpo) 
		BEGIN 
			set @Row = 1
		end

--		select  @Row=eitCveInd from ManV2.EnlIndTipo with(nolock) where eitCveInd =  @claCve  and eitCveTipoInd = @claGpo
		--select @Row = COUNT(eitCveInd)  from PreV2.EnlIndTipo with(nolock)  where eitCveInd =  @claCve  and eitCveTipoInd = @claGpo
		--set @cadSqlEnl = 'select top 1 eitCveInd from PreV2.EnlIndTipo with(nolock) where eitCveInd =' +  @claCve  + ' and eitCveTipoInd= ' + @claGpo 
		--print @cadSqlEnl
		--exec(@cadSqlEnl)
		
	
	end
	print @mClav
	print @Row
	if  @Row = 0
	Begin  set @banMsj='0' end
	else
	begin 
		if @mCto='EnlIndGra'
		begin
			print 'Entre al begin'
			select top 1  @campM1=eigCveGra from ManV2.EnlIndGra with(nolock) where eigCveInd =@claCve and eigSeccion = @claCveDes 
			select top 1  @campP1=eigCveGra from PreV2.EnlIndGra with(nolock) where eigCveInd =@claCve and eigSeccion = @claCveDes 
			if @campM1= @campP1 
			begin set @banMsj='F' end
			else 
			begin 
				set @banMsj='T'
				--set @cadSql='update PreV2.EnlIndGra set eigCveGra=' + @campM1 + ' where eigCveInd =' + @claCve  + ' and eigSeccion =''' + @claCveDes + ''
				set @cadSql='Delete from PreV2.EnlIndGra  where eigCveInd =' + @claCve  + ' and eigSeccion =''' + @claCveDes + ''''
			end
		end
		else
		begin  set @banMsj='F' 	 end
	 end
end




if @mCto='EnlIndCal'   
begin
	if EXISTS (select * from PreV2.EnlIndCal with(nolock)  where eicCveInd =@mIn )	
	begin	set @Row=1	end
	--select @Row = COUNT(*) from PreV2.EnlIndCal with(nolock)  where eicCveInd =@mIn 
	if @Row=0
	Begin  set @banMsj='0' end
	else
	begin 
		select top 1  @campM1=eicCveInst, @campM2= eicFecAct, @campM3= eicCveNotaI, @campM4= eicCveNotaF, @campM5= eicFecActIng from ManV2.EnlIndCal with(nolock) where eicCveInd =@mIn 
		select top 1  @campP1=eicCveInst, @campP2= eicFecAct, @campP3= eicCveNotaI, @campP4= eicCveNotaF, @campP5= eicFecActIng from PreV2.EnlIndCal with(nolock) where eicCveInd =@mIn 
		if @campM1= @campP1 and @campM2= @campP2 and @campM3= @campP3 and @campM4= @campP4 and @campM5= @campP5 
		begin set @banMsj='F' end
		else 
		begin 
			set @banMsj='T' 
			--set @cadSql='update PreV2.EnlIndCal set eicCveInst=' + @campM1 + ', eicFecAct=''' + @campM2 + ''', eicCveNotaI=' + @campM3  + ',  eicCveNotaF=' + @campM4 + ', eicFecActIng=''' + @campM5 + ''' where eicCveInd =' + @mIn 
			set @cadSql='Delete from PreV2.EnlIndCal  where eicCveInd =' + @mIn 
		end
	end
end

if @mCto='EnlSerInd'
begin
	select @Posicion =   patindex('%Values%' ,@mSql)
	set @cad1 = @mSql
	SELECT @cad1= stuff(@cad1, 1, @Posicion, '')--20,2,6)
	select @Posicion =  patindex('%(%' ,@cad1)
	SELECT @cad1= stuff(@cad1, 1, @Posicion, '')--20,2,6)
	--select @cad1 = left(@mSql, @Posicion + 7)--20,2,6) puede tener 2 o 3 parámetros
	select @Posicion2 =   patindex('%,%' ,@cad1) --20,2,6)
	select @claCve = left(@cad1, @Posicion2 -1)--clave indicador 20
	SELECT @cad1= stuff(@cad1, 1, @Posicion2, '')--2,6)
	select @Posicion3 =   patindex('%,%' ,@cad1) --2,6)
	if @Posicion3 >0
	begin
		select @claCveDes = left(@cad1, @Posicion3 -1)--clave serie 2
	end
	else
	begin
		select @claCveDes = left(@cad1, LEN (@cad1)-1)--clave serie
	end
	if EXISTS (select * from PreV2.EnlSerInd with(nolock)  where esiClaveInd =@claCve and esiClaveSerie = @claCveDes)	
	begin	set @Row=1	end
	--select @Row = COUNT(*) from PreV2.EnlSerInd with(nolock)  where esiClaveInd =@claCve and esiClaveSerie = @claCveDes
	if @Row=0
	Begin  set @banMsj='0' end
	else  
	   begin set @banMsj='F' end
end


--Validar si se hizo el movimiento o hay duplicidad

if @banMsj ='0'
begin
	--print @banMsj
	select @Posicion2 =  patindex('%ManV2.%' , @mSql)--Buscamos la posicion de la primera ,
	select @cadSqlM = left(@mSql, @Posicion2 - 1)-- esquema
	select @mSql =  stuff(@mSql, 1, @Posicion2+5, '')			--Y obtenemos los caracteres hasta esa posicion
	set @cadSqlM1=  @cadSqlM + ' PreV2.' + @mSql   --SUBSTRING (@mS,@Posicion+4,len(@mS) - (@Posicion + 4))
	print 	@cadSqlM1
	exec(@cadSqlM1)
	update ManV2.movimientos SET movEstatus='P' where movClave=@mClav
	set @returnMsj=''
end
if @banMsj ='F'
begin
	--print @banMsj
	update ManV2.movimientos SET movEstatus='P' where movClave=@mClav
	set @returnMsj='' 
end
if @banMsj ='T'
begin
	print @cadSql
	exec(@cadSql)
	print @mClav
	
	select @Posicion2 =  patindex('%ManV2.%' , @mSql)--Buscamos la posicion de la primera ,
	select @cadSqlM = left(@mSql, @Posicion2 - 1)-- esquema
	select @mSql =  stuff(@mSql, 1, @Posicion2+5, '')			--Y obtenemos los caracteres hasta esa posicion
	set @cadSqlM1=  @cadSqlM + ' PreV2.' + @mSql   --SUBSTRING (@mS,@Posicion+4,len(@mS) - (@Posicion + 4))
	exec(@cadSqlM1)
	update ManV2.movimientos SET movEstatus='P' where movClave=@mClav
		
	----------
	--set @returnMsj= 'Indicador ' + @mIn + ', la clave ' + @mComen + ' del catálogo ' + @mCto + ' esta duplicada'
	--print @returnMsj
end

--return @returnMsj
END

GO
--ActualizaSerie2
/****** StoredProcedure [PreV2].[ActualizaSerie2]  ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [PreV2].[ActualizaSerie2]
	-- Add the parameters for the stored procedure here
	@serCveI int,
	@serCveCG nvarChar(MAX),
	@serCveCla nvarChar(MAX),
	@serCve int,
	@serADato int,
	@serMDato int,
	@serDDato int,
	@serDt  nvarChar(255), --float(38)
	@serNoD int,
	@serLey nvarChar(255),
	@serLeyIng nvarChar(255),
	@serCveS nvarChar(255),
	@CadLey nvarChar(255),
	@Esq nvarchar(6)
	--@TotalA int 
	--@movUsu nvarChar (24),
	--@movFe nvarChar(10),
 --   @movHo nvarChar(50),
 --   @movI nvarChar(20)

AS
BEGIN
Declare
@CveCgRem nvarchar(MAX),@serL varchar(255),@serLI varchar(255),
@cadSql2 nvarchar(MAX),@cadSql nvarchar(MAX),@cadSqlI nvarchar(MAX),@cadSqlU nvarchar(MAX),@cadSqlD nvarchar(MAX),
@cadSql3 nvarchar(MAX),
@CveClRem nvarchar(MAX),
@Posicion int,@Pos2 int,@Pos3 int,
@CveS nvarchar(max),@CveCg nvarchar(max),@CveCl nvarchar(max),
@serDtF nvarchar(max), --float(38),
--@serDt1 real,@serDt2 numeric(18,18),
@serDtM nvarChar(255)
declare @tabla table (c1 nvarchar(max))


--print @serCveI
--print @serCveCG
--print	@serCveCla
--print	@serCve
--print	@serADato
--print	@serMDato
--print	@serDDato
--print	@serDt 
--print	@serNoD 
--print	@serLey 
--print	@serLeyIng 
--print	@serCveS 
--print	@CadLey 
--print	@Esq

--set @serDtM = @serDt
set @serDtF= @serDt;
if @serDt=''
begin
	set @serDt =null
	set @serDtM ='null'
end
if @serCveCla='0'
begin
 set @serCveCla=''''
end

--insert into @tabla values (@serDt)
--select @serDtF= c1  from @tabla
--select @serDt1= convert(real,@serDtF)
--select @serDt2= CAST (@serDt as numeric (18,18))

	if @CadLey = '' -- registros con datos en series
	begin
	--print 'Entre cadLey vacio'
		--SELECT *  from man.serie where serClaveind= @serCveI  and serclavecobgeo= @serCveCG  and serclaveclasif= @serCveCla  and serclave= @serCve  and seraadato= @serADato and sermmdato= @serMDato  and serdddato= @serDDato
		set @cadSql = 'Select * from ' + @Esq + 'serie with(nolock) where serCveCobAgrup=' + @serCveCg + ' and serCveClaAgrup= ' + @serCveCla + ' and serclave= ' + Convert(nvarchar(255),@serCve) + ' and seraadato=' + Convert(nvarchar(4),@serADato) + ' and sermmdato=' + Convert(nvarchar(2),@serMDato) + '  and serdddato= ' + Convert(nvarchar(2),@serDDato) --serClaveInd= ' + CONVERT(nvarchar(10),@serCveI) + ' and 
		exec(@cadSql)
		if @@ROWCOUNT = 0 -- es insert
		begin
			if @serDt<>'' or @serNoD <>0
			begin
				if @serDt <>''
				begin--serClaveInd,   ' + CONVERT(nvarchar(10),@serCveI) + ',
					--insert into man.Serie (serClaveInd,serClaveCobGeo,serClaveClasif,serClave,serAADato,serMMDato,serDDDato,serDato,serNoDato) values ( @serCveI, @serCveCG,@serCveCla,@serCve,@serADato,@serMDato,@serDDato,@serDtF,@serNoD) 
					set @cadSqlI ='insert into ' + @Esq + 'Serie (serCveCobAgrup,serCveClaAgrup,serClave,serAADato,serMMDato,serDDDato,serDato,serNoDato) values ( ' + @serCveCG + ',' + @serCveCla + ',' + Convert(nvarchar(255),@serCve) + ',' + Convert(nvarchar(4),@serADato) + ',' + Convert(nvarchar(2),@serMDato) + ',' +  Convert(nvarchar(2),@serDDato) + ',' + @serDtF + ',0' + ')'
					exec(@cadSqlI)
				end
				if @serNoD <>0
				begin--serClaveInd,
					--insert into man.Serie (serClaveInd,serClaveCobGeo,serClaveClasif,serClave,serAADato,serMMDato,serDDDato,serDato,serNoDato) values ( @serCveI, @serCveCG,@serCveCla,@serCve,@serADato,@serMDato,@serDDato,@serDtF,@serNoD) 
					set @cadSqlI ='insert into ' + @Esq + 'Serie (serCveCobAgrup,serCveClaAgrup,serClave,serAADato,serMMDato,serDDDato,serDato,serNoDato) values ( ' + @serCveCG + ',' + @serCveCla + ',' + Convert(nvarchar(255),@serCve) + ',' + Convert(nvarchar(4),@serADato) + ',' + Convert(nvarchar(2),@serMDato) + ',' +  Convert(nvarchar(2),@serDDato) + ',null,' + Convert(nvarchar(255), @serNoD )+ ')'--' + CONVERT(nvarchar(10),@serCveI) + ',
					exec(@cadSqlI)
				end 
				
			end
		end
		else--es update
		begin 
			if @serDt<>'' or @serNoD <>0
			begin
				if @serDt <>''
				begin
					--update PreV2.Serie set serDato=@serDtF, serNoDato= @serNoD where serclaveind= @serCveI and serClave= @serCve and serClaveCobGeo= @serCveCG and serclaveclasif= @serCveCla and serAAdato= @serADato and serMMDato= @serMDato and serDDDato = @serDDato
					set @cadSqlU = 'update ' + @Esq + 'Serie set serDato=' + @serDtF + ', serNoDato=0 where  serclave= ' + Convert(nvarchar(255),@serCve) + ' and serCveCobAgrup=' + @serCveCG + ' and serCveClaAgrup= ' + @serCveCla + ' and seraaDato= ' + Convert(nvarchar(4),@serADato) + ' and serMMDato=' + Convert(nvarchar(2),@serMDato) + ' and serddDato=' + Convert(nvarchar(2),@serDDato) --serclaveind= ' + CONVERT(nvarchar(10),@serCveI) + ' and
					exec(@cadSqlU)
				end
				if @serNoD <>0
				begin
					--update PreV2.Serie set serDato=@serDtF, serNoDato= @serNoD where serclaveind= @serCveI and serClave= @serCve and serClaveCobGeo= @serCveCG and serclaveclasif= @serCveCla and serAAdato= @serADato and serMMDato= @serMDato and serDDDato = @serDDato
					set @cadSqlU = 'update ' + @Esq + 'Serie set serDato=null, serNoDato=' + Convert(nvarchar(255),@serNoD) + ' where  serclave= ' + Convert(nvarchar(255),@serCve) + ' and serCveCobAgrup=' + @serCveCG + ' and serCveClaAgrup= ' + @serCveCla + ' and seraaDato= ' + Convert(nvarchar(4),@serADato) + ' and serMMDato=' + Convert(nvarchar(2),@serMDato) + ' and serddDato=' + Convert(nvarchar(2),@serDDato)--serclaveind= ' + CONVERT(nvarchar(10),@serCveI) + ' and
					exec(@cadSqlU)
				end 
					--update man.Serie set serDato=@serDtF, serNoDato= @serNoD where serclaveind= @serCveI and serClave= @serCve and serClaveCobGeo= @serCveCG and serclaveclasif= @serCveCla and serAAdato= @serADato and serMMDato= @serMDato and serDDDato = @serDDato
			end
		   else--es delete
		   begin
				if @serDtM='null' and @serNoD=0
				begin
					--delete from man.Serie where serClaveind= @serCveI and serClave= @serCve and serAADato= @serADato and serMMDato= @serMDato and serDDDato= @serDDato and serClaveCobGeo = @serCveCG and serClaveClasif= @serCveCla 
					set @cadSqlD = 'delete from ' + @Esq + 'Serie where serclave= ' + Convert(nvarchar(255),@serCve) + ' and seraaDato= ' + Convert(nvarchar(4),@serADato) + ' and serMMDato=' + Convert(nvarchar(2),@serMDato) + ' and serddDato=' + Convert(nvarchar(2),@serDDato) + ' and serCveCobAgrup= ' + @serCveCG + '  and serCveClaAgrup= ' + @serCveCla + '' --serclaveind= ' + CONVERT(nvarchar(10),@serCveI) + ' and 
					exec(@cadSqlD)
				end
		   end
		end 
	end 
	else --registros con datos en leyendas
	begin
	  print 'Entre cadLey lleno'
	  set @serCveS = @serCveS + ','  
	  set @CveCgRem  = @serCveCG + ','  
	  set @CveClRem   = @serCveCla + ',' 
	   WHILE patindex('%,%' , @serCveS) <> 0
		BEGIN 
			 
			 SELECT @Pos2 =  patindex('%,%' , @serCveS)--ciclo de series --Buscamos la posicion de la primera ,
			 SELECT @CveS = left(@serCveS, @Pos2 - 1)--clave de serie --Y cogemos los caracteres hasta esa posicion
			set @cadSql3 = 'SELECT *  from ' + @Esq + 'serie with(nolock) where serclave in (' + @CveS + ') and seraadato= ' + Convert(nvarchar(4),@serADato) + ' and sermmdato= ' + Convert(nvarchar(2),@serMDato) + '  and serdddato= ' + Convert(nvarchar(2),@serDDato) --serClaveind=' + Convert(nvarchar(10),@serCveI) + ' and
			print @cadSql3
			exec(@cadSql3)
		
			if @@ROWCOUNT = 0 -- es insert
			begin
				print 'insert'
				set @Posicion=0
			 --  set @serCveS = @serCveS + ','  
			 --  set @CveCgRem  = @serCveCG + ','  
			 --  set @CveClRem  = @serCveCla + ','  
			 --  WHILE patindex('%,%' , @serCveS) <> 0
				----patindex busca un patron en una cadena y nos devuelve su posicion
				--BEGIN
				--  SELECT @Posicion =  patindex('%,%' , @serCveS)--ciclo de series --Buscamos la posicion de la primera ,
				--  SELECT @CveS = left(@serCveS, @Posicion - 1)--clave de serie --Y cogemos los caracteres hasta esa posicion
				--  WHILE patindex('%,%' , @CveCgRem) <> 0--ciclo de coberturas
				--  begin
				--	SELECT @Pos2 =  patindex('%,%' , @CveCgRem)--ciclo de series --Buscamos la posicion de la primera ,
				--	SELECT @CveCg  = left(@CveCgRem, @Pos2 - 1)--clave de cobertura
				--    while  patindex('%,%' , @CveClRem) <> 0--ciclo de clasificaciones
				--    begin
				--		SELECT @Pos3 =  patindex('%,%' , @CveClRem)--ciclo de series --Buscamos la posicion de la primera ,
				--		SELECT @CveCl  = left(@CveClRem, @Pos3 - 1)--clave de clasificaciones
				--		--insert into man.Serie (serClaveInd,serClaveCobGeo,serClaveClasif,serClave,serAADato,serMMDato,serDDDato,serLeyenda,serLeyendaIng,serDato,serNoDato) values (@serCveI, @CveCg,@CveCl,@CveS,@serADato,@serMDato,@serDDato,@serLey,@serLeyIng,null,0) 					
				--		--serClaveInd,
				--		set @cadSqlI ='insert into ' + @Esq + 'Serie (serCveCobAgrup,serCveClaAgrup,serClave,serAADato,serMMDato,serDDDato,serLeyenda,serLeyendaIng,serDato,serNoDato) values (''' + @CveCG + ''', ''' + @CveCl + ''',' + Convert(nvarchar(255),@CveS) + ',' + Convert(nvarchar(4),@serADato) + ',' + Convert(nvarchar(2),@serMDato) + ',' +  Convert(nvarchar(2),@serDDato) + ',''' + @serLey + ''',''' + @serLeyIng + ''',null,0)'--' + CONVERT(nvarchar(10),@serCveI) + ',
				--		exec(@cadSqlI)
				--		SELECT @CveClRem  = stuff(@CveClRem, 1, @Pos3, '')
				--	end
				--	set @CveClRem  = @serCveCla + ','  
				--	SELECT @CveCgRem  = stuff(@CveCgRem, 1, @Pos2, '')
				--  end
				--  set @CveCgRem  = @serCveCG + ','  
				--  --Reemplazamos lo procesado con nada con la funcion stuff
				--  SELECT @serCveS = stuff(@serCveS, 1, @Posicion, '')
				--  --set @TotalA = @TotalA -1
				--END	
			end--insert
			else--update
			begin
			print 'update'
				if @Esq = 'ManV2.' --serClaveind=@serCveI and
					SELECT Top 1 @serL=serLeyenda, @serLI=serLeyendaIng  from manv2.serie with(nolock) where serclave in (@CveS ) and  seraadato= @serADato and sermmdato= @serMDato and serdddato= @serDDato
			--if @Esq ='PreV2.'
			 --   SELECT Top 1 @serL=serLeyenda, @serLI=serLeyendaIng  from PreV2.serie with(nolock) where  serclave in (@serCveS) and seraadato= @serADato and sermmdato= @serMDato and serdddato= @serDDato
				if @Esq ='Pubv2.'
					SELECT Top 1 @serL=serLeyenda, @serLI=serLeyendaIng  from pubv2.serie with(nolock) where serclave in (@CveS )and seraadato= @serADato and sermmdato= @serMDato and serdddato= @serDDato
				if @Esq ='dbo.'
					SELECT Top 1 @serL=serLeyenda, @serLI=serLeyendaIng  from dbo.serie with(nolock) where serclave in (@CveS )and seraadato= @serADato and sermmdato= @serMDato and serdddato= @serDDato
				if @Esq ='Prev2.'
					SELECT Top 1 @serL=serLeyenda, @serLI=serLeyendaIng  from prev2.serie with(nolock) where serclave in (@CveS )and seraadato= @serADato and sermmdato= @serMDato and serdddato= @serDDato		    
			--if @Esq ='Paso.'
			--    SELECT Top 1 @serL=serLeyenda, @serLI=serLeyendaIng  from paso.serie with(nolock) where serclave in (@serCveS)and seraadato= @serADato and sermmdato= @serMDato and serdddato= @serDDato		    
		
			--SELECT Top 1 @serL=serLeyenda, @serLI=serLeyendaIng  from man.serie where serClaveind=@serCveI and seraadato= @serADato and sermmdato= @serMDato and serdddato= @serDDato
			
				set @serL= isnull(@SerL,'')
				set @serLI= isnull(@SerLI,'')
			
				--if  @serL <> @serLey or @serLI <> @serLeyIng 
				--begin
			--print 'entre if serL'
					--set @serCveS = @serCveS + ','  
					--set @CveCgRem  = @serCveCG + ','  
					--set @CveClRem   = @serCveCla + ',' 
				 --WHILE patindex('%,%' , @serCveS) <> 0
				 --BEGIN 
				 
		--		   SELECT @Pos2 =  patindex('%,%' , @serCveS)--ciclo de series --Buscamos la posicion de la primera ,
				 --  SELECT @CveS = left(@serCveS, @Pos2 - 1)--clave de serie --Y cogemos los caracteres hasta esa posicion
				   
				   WHILE patindex('%,%' , @CveCgRem) <> 0
					--patindex busca un patron en una cadena y nos devuelve su posicion
					BEGIN
						SELECT @Posicion =  patindex('%,%' , @CveCgRem)
						SELECT @CveCg  = left(@CveCgRem, @Posicion - 1)--clave de cobertura
						while  patindex('%,%' , @CveClRem) <> 0--ciclo de cobertura
						begin
							SELECT @Pos3 =  patindex('%,%' , @CveClRem)--ciclo de series --Buscamos la posicion de la primera ,
							SELECT @CveCl  = left(@CveClRem, @Pos3 - 1)--clave de clasificaciones
							--print @cadSql2
							set @cadSql2 = 'update ' + @Esq + 'serie set serleyenda= ''' + @serLey + ''', serLeyendaing= ''' +  @serLeyIng  + ''' where  serCveCobAgrup= ' + @CveCg + ' and serCveClaAgrup= ' + @CveCl + ' and serAAdato= ' + Convert(nvarchar(4),@serADato) + '  and serMMDato= ' + Convert(nvarchar(2),@serMDato) + ' and serDDDato = ' + Convert(nvarchar(2),@serDDato) + '  and serclave= ' + @CveS --serclaveind= ' + Convert(nvarchar(10),@serCveI) + ' and
							print @cadSql2
							exec(@cadSql2)
							SELECT @CveClRem  = stuff(@CveClRem, 1, @Pos3, '')
						end
						set @CveClRem   = @serCveCla + ',' 
						SELECT @CveCgRem = stuff(@CveCgRem, 1, @Posicion, '')
					end
					
				 --end	--if  @serL <> @serLey or @serLI <> @serLeyIng
				 --end
			  end--update
			  set @CveCgRem  = @serCveCG + ','  
			  SELECT @serCveS = stuff(@serCveS, 1, @Pos2, '')
		  end--while CveS
	  end --leyendas
END
GO



--Borrado
GO

/****** StoredProcedure [PreV2].[Borrado]  ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
create PROCEDURE [PreV2].[Borrado] 
	-- Add the parameters for the stored procedure here
	--@CveIn int,
	@CadExe nvarchar(MAX) --nombre de la tabla
AS
BEGIN
	exec(@cadExe)
END

GO


--ChecaMovi
GO

/****** StoredProcedure [PreV2].[ChecaMovi]  ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [PreV2].[ChecaMovi] 
	-- Add the parameters for the stored procedure here
	@CveIn int,
	@CR nvarchar(MAX), --nombre de catalogos
	@CS nvarchar(MAX), --claves a revisar
	@Esq varchar(6) --esquema
AS
BEGIN
SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED
declare @cadCDLE nvarchar(MAX), @est nvarchar(1)
declare @cadCat nvarChar(Max),@cadCD varchar(30),@cadCDS varchar(30), @cadCompleta nvarchar(max), @cadCompleta1 nvarchar(max)
declare @Pos int,@Pos3 int,
@Pos2 int
	set @cadCat = 'Lexico,Enlace,LexicoIng,EnlaceIng,'
	set @est='M'
	WHILE patindex('%,%' , @CR) <> 0
	begin
		--***obtener el catalogo
			SELECT @Pos2 =  patindex('%,%' , @CR)
			--Buscamos la posicion de la primera ,
			SELECT @cadCD= left(@CR, @Pos2 - 1)--nombre de catalogo
			--Reemplazamos lo procesado con nada con la funcion stuff
			SELECT @CR = stuff(@CR, 1, @Pos2, '')
			
		--** obtener la clave a buscar
			SELECT @Pos3 =  patindex('%,%' , @CS)
			--Buscamos la posicion de la primera ,
			SELECT @cadCDS= left(@CS, @Pos3 - 1)--clave a buscar
			--Reemplazamos lo procesado con nada con la funcion stuff
			SELECT @CS = stuff(@CS, 1, @Pos3, '')
			if (@CS <> '0')
			begin
				set @cadCompleta = 'update ' + @Esq + 'Movimientos set movIndicador= ' + Convert(nvarchar(10),@CveIn) + ' where movCatalogo= ''' + @cadCD + ''' and movComentario= ''' + @cadCDS + ''' and movEstatus= ''' + @est + ''''
				--update Man.Movimientos set movIndicador= @CveIn where movCatalogo= @cadCD  and movComentario = @cadCDS  and movEstatus='M'
				exec(@cadCompleta)
				--if (@cadCD = 'Descripcion')
				--begin
				--	WHILE patindex('%,%' , @cadCat) <> 0
				--	begin
				--	--***obtener el catalogo
				--		SELECT @Pos =  patindex('%,%' , @cadCat )
				--		--Buscamos la posicion de la primera ,
				--		SELECT @cadCDLE= left(@cadCat , @Pos - 1)--nombre de catalogo para lexico y enlace
				--		--Reemplazamos lo procesado con nada con la funcion stuff
				--		SELECT @cadCat = stuff(@cadCat, 1, @Pos, '')
				--		--update Man.Movimientos set movIndicador= @CveIn where movCatalogo= @cadCDLE  and movComentario = @cadCDS  and movEstatus='M'
				--		set @cadCompleta1 = 'update ' + @Esq + 'Movimientos set movIndicador= ' + Convert(nvarchar(10),@CveIn) + ' where movCatalogo= ''' + @cadCDLE + ''' and movComentario= ''' + @cadCDS + ''' and movEstatus= ''' + @est + ''''
				--		exec(@cadCompleta1)
				--	end 
				--end
			end
	end
				
END
GO


GO

/****** StoredProcedure [PreV2].[ReplicaPreCat]  ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [PreV2].[ReplicaPreCat] 
	-- Add the parameters for the stored procedure here
	@Cat nvarChar(MAX)
AS
BEGIN
SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED

declare @mCla int, @cveNt int,@mCla2 int,@mI int
declare @mS nvarchar(MAX),@mCve nvarChar(Max),@mS2 nvarchar(MAX),@Opci nvarchar(1), @banEstado nvarchar(6),@Estado nvarchar(3)
declare @cadSqlM nvarchar(Max),@cveAgruCl nvarChar(Max),@cveAgruCo nvarChar(MAX),@cveAgruCoDes nvarChar(MAX),@cveCoTipoGeo int,@cobCveTipoCobGeo int
declare @cadSqlM1 nvarchar(Max)
declare @cadSqlM2 nvarchar(Max)
declare @Posicion int,@Posicion3 int,@Posicion4 int,
@Posicion2 int,@CatS2 varchar(255),
@CatS varchar(255),@CatSAdic varchar(255),@CatSAdicTemp varchar(255)
declare @tablaCveAgrCl table (acCve nvarchar)
declare @tablaCveAgrCo table (acoCve nvarchar, acoCveGeo nvarChar, acoCveDes nvarChar)
set @mI=0
 WHILE patindex('%,%' , @Cat) <> 0
 begin
	SELECT @Posicion2 =  patindex('%,%' , @Cat)
	--Buscamos la posicion de la primera ,
	set @CatSAdic=''
	SELECT @CatS= left(@Cat, @Posicion2 - 1)--nombre de catalogo
	--if @CatS = 'Descripcion'
	--begin
	--	set @CatSAdic  ='Lexico,Enlace,LexicoIng,EnlaceIng,'
	--end
	if @CatS = 'DescripcionPCve'
	begin
		set @CatSAdic  ='LexicoPCve,EnlacePCve,LexicoPCveIng,EnlacePCveIng,'
	end
	if @CatS ='Grupo'
	begin
		set @CatSAdic  = 'Clasificacion,AgrupaClas,'
	end
	if @CatS ='CobGeo'
	begin
		set  @CatSAdic = 'AgrupaCob,DesgloseGeo,TipoCobGeo,'
	end
	set @CatSAdicTemp= @CatSAdic
	--Reemplazamos lo procesado con nada con la funcion stuff
	SELECT @Cat = stuff(@Cat, 1, @Posicion2, '')
	While exists (select movClave, movsql  from ManV2.movimientos with(nolock) where  movEstatus= 'M' and movCatalogo = @CatS )--replica cambios en toda la tabla de catalogos ****movIndicador=0 and
	Begin 
		set @CatSAdic = @CatSAdicTemp
		--@mCla=movClave,@mS=movsql, @mI=movIndicador, @mCt=movCatalogo, @mCom= movComentario
		Select top 1 @mCla=movClave,@mS=movsql,@mCve=movComentario from ManV2.movimientos with(nolock) where  movEstatus= 'M' and movCatalogo = @CatS order by  SUBSTRING(movFecha,7,4) asc, substring(movFecha,4,2) asc, SUBSTRING(movFecha,0,3) asc, substring(movhora,0,3) asc, substring(movhora,4,2) asc, substring(movhora,7,2) asc,movclave --*****movIndicador=0 and
		--Select top 1 @mS=movsql  from Man.movimientos where movIndicador=0 and movEstatus= 'M' and movCatalogo in (@Cat ) order by  SUBSTRING(movFecha,7,4) asc, substring(movFecha,4,2) asc, SUBSTRING(movFecha,0,3) asc, substring(movhora,0,3) asc, substring(movhora,4,2) asc, substring(movhora,7,2) asc 
		 select @Opci =  left(@mS,1)	--obtener el primer caracter
		  if @Opci='I' or  @Opci='i'
		  begin
				exec  PreV2.RevisaDuplicados @mCla,@mS, @mI, @CatS, @mCve
				--if @returnError<>''
				--begin
				--	set @msg = @msg + ' - '  + @returnError
				--end
		   end
		   else
		   begin
				select @Posicion =  patindex('%ManV2.%' , @mS)
				--Buscamos la posicion de la primera ,
				select @cadSqlM2 = left(@mS, @Posicion - 1)-- esquema
				select @mS =  stuff(@mS, 1, @Posicion+5, '')
				--Y obtenemos los caracteres hasta esa posicion
				set @cadSqlM1=  @cadSqlM2 + ' PreV2.' + @mS   --SUBSTRING (@mS,@Posicion+4,len(@mS) - (@Posicion + 4))
			--	print @cadSqlM1
				exec(@cadSqlM1)
				update ManV2.movimientos SET movEstatus='P' where movClave=@mCla
			end
		print @CatSAdic
		if (@CatSAdic <>'')
		begin
		  
			WHILE patindex('%,%' , @CatSAdic) <> 0
			begin
				SELECT @Posicion3 =  patindex('%,%' , @CatSAdic)
				SELECT @CatS2= left(@CatSAdic, @Posicion3 - 1)--nombre de catalogo
				print @CatS
				print @CatS2
				While exists (select movClave, movsql  from ManV2.movimientos with(nolock) where  movEstatus= 'M' and movCatalogo = @CatS2 and movComentario = @mCve )--replica cambios en toda la tabla de catalogos ****movIndicador=0 and
				Begin
					--if @CatS = 'Descripcion'
					--begin
					--	--revisa movimiento de la clave especifica
					--	Select top 1 @mCla2=movClave,@mS2=movsql from ManV2.movimientos with(nolock) where  movEstatus= 'M' and movCatalogo = @CatS2 and movComentario = @mCve order by  SUBSTRING(movFecha,7,4) asc, substring(movFecha,4,2) asc, SUBSTRING(movFecha,0,3) asc, substring(movhora,0,3) asc, substring(movhora,4,2) asc, substring(movhora,7,2) asc,movclave --*****movIndicador=0 and
					--	--Select top 1 @mS=movsql  from Man.movimientos where movIndicador=0 and movEstatus= 'M' and movCatalogo in (@Cat ) order by  SUBSTRING(movFecha,7,4) asc, substring(movFecha,4,2) asc, SUBSTRING(movFecha,0,3) asc, substring(movhora,0,3) asc, substring(movhora,4,2) asc, substring(movhora,7,2) asc 
					--	select @Opci =  left(@mS2,1)
					--	if @Opci='I' or  @Opci='i'
					--	begin
					--			exec  PreV2.RevisaDuplicados @mCla2,@mS2, @mI, @CatS2, @mCve
					--			--if @returnError<>''
					--			--begin
					--			--	set @msg = @msg + ' - '  + @returnError
					--			--end
					--	end
					--	else
					--	begin
					--		select @Posicion4 =  patindex('%ManV2.%' , @mS2)
					--		--Buscamos la posicion de la primera ,
					--		select @cadSqlM2 = left(@mS2, @Posicion4 - 1)-- esquema
					--		select @mS2 =  stuff(@mS2, 1, @Posicion4 +5, '')
					--		--Y obtenemos los caracteres hasta esa posicion
					--		set @cadSqlM1=  @cadSqlM2 + ' PreV2.' + @mS2   --SUBSTRING (@mS,@Posicion+4,len(@mS) - (@Posicion + 4))
					--	--	print @cadSqlM1
					--		exec(@cadSqlM1)
					--		update ManV2.movimientos SET movEstatus='P' where movClave=@mCla2
					--	end
					--end
					--palabras clave
					if @CatS = 'DescripcionPCve'
					begin
					print 'Primer DescripcionPCve'
						--revisa movimiento de la clave especifica
						Select top 1 @mCla2=movClave,@mS2=movsql, @mI=movindicador from ManV2.movimientos with(nolock) where  movEstatus= 'M' and movCatalogo = @CatS2 and movComentario = @mCve order by  SUBSTRING(movFecha,7,4) asc, substring(movFecha,4,2) asc, SUBSTRING(movFecha,0,3) asc, substring(movhora,0,3) asc, substring(movhora,4,2) asc, substring(movhora,7,2) asc,movclave --*****movIndicador=0 and
						--Select top 1 @mS=movsql  from Man.movimientos where movIndicador=0 and movEstatus= 'M' and movCatalogo in (@Cat ) order by  SUBSTRING(movFecha,7,4) asc, substring(movFecha,4,2) asc, SUBSTRING(movFecha,0,3) asc, substring(movhora,0,3) asc, substring(movhora,4,2) asc, substring(movhora,7,2) asc 
							
							select @Opci =  left(@mS2,1)
							if @Opci='I' or  @Opci='i'
							begin
									exec  PreV2.RevisaDuplicados @mCla2,@mS2, @mI, @CatS2, @mCve
									--if @returnError<>''
									--begin
									--	set @msg = @msg + ' - '  + @returnError
									--end
							end
							else
							begin
								select @Posicion4 =  patindex('%ManV2.%' , @mS2)
								--Buscamos la posicion de la primera ,
								select @cadSqlM2 = left(@mS2, @Posicion4 - 1)-- esquema
								select @mS2 =  stuff(@mS2, 1, @Posicion4 +5, '')
								--Y obtenemos los caracteres hasta esa posicion
								set @cadSqlM1=  @cadSqlM2 + ' PreV2.' + @mS2   --SUBSTRING (@mS,@Posicion+4,len(@mS) - (@Posicion + 4))
							--	print @cadSqlM1
								exec(@cadSqlM1)
								update ManV2.movimientos SET movEstatus='P' where movClave=@mCla2
							end
					
					end
					if @CatS = 'Grupo'
					begin
					
						--revisa movimiento de la clave especifica
						Select top 1 @mCla2=movClave,@mS2=movsql from ManV2.movimientos with(nolock) where  movEstatus= 'M' and movCatalogo = @CatS2 and movComentario = @mCve order by  SUBSTRING(movFecha,7,4) asc, substring(movFecha,4,2) asc, SUBSTRING(movFecha,0,3) asc, substring(movhora,0,3) asc, substring(movhora,4,2) asc, substring(movhora,7,2) asc,movclave --*****movIndicador=0 and
						--Select top 1 @mS=movsql  from Man.movimientos where movIndicador=0 and movEstatus= 'M' and movCatalogo in (@Cat ) order by  SUBSTRING(movFecha,7,4) asc, substring(movFecha,4,2) asc, SUBSTRING(movFecha,0,3) asc, substring(movhora,0,3) asc, substring(movhora,4,2) asc, substring(movhora,7,2) asc 
						select @Opci =  left(@mS2,1)
						if @Opci='I' or  @Opci='i'
						begin
								exec  PreV2.RevisaDuplicados @mCla2,@mS2, @mI, @CatS2, @mCve
								--if @returnError<>''
								--begin
								--	set @msg = @msg + ' - '  + @returnError
								--end
						end
						else
						begin
							select @Posicion4 =  patindex('%ManV2.%' , @mS2)
							--Buscamos la posicion de la primera ,
							select @cadSqlM2 = left(@mS2, @Posicion4 - 1)-- esquema
							select @mS2 =  stuff(@mS2, 1, @Posicion4 +5, '')
							--Y obtenemos los caracteres hasta esa posicion
							set @cadSqlM1=  @cadSqlM2 + ' PreV2.' + @mS2   --SUBSTRING (@mS,@Posicion+4,len(@mS) - (@Posicion + 4))
						--	print @cadSqlM1
							exec(@cadSqlM1)
							update ManV2.movimientos SET movEstatus='P' where movClave=@mCla2
							--SELECT @CatSAdic  = stuff(@CatSAdic, 1, @Posicion3, '')
						end
						if @CatS2 ='AgrupaClas'
						begin
							insert into @tablaCveAgrCl  select acClave  from ManV2.AgrupaClas with(nolock) where acCveGpo = @mCve--obtener clave de agrupamiento de clasificaciones
							while exists(select * from @tablaCveAgrCl )--revisar Agrupamiento del indicador
							begin
								select top 1 @cveAgruCl  = acCve  from @tablaCveAgrCl 
								while exists(select movClave,movsql  from ManV2.movimientos with(nolock) where  movCatalogo ='AgrupaClas' and movcomentario= @cveAgruCl  and  movEstatus='M' and movComentario = @cveAgruCl )
								begin
									Select top 1 @mCla2=movClave,@mS2=movsql from ManV2.movimientos with(nolock) where  movEstatus= 'M' and movCatalogo = @CatS2 and movComentario = @cveAgruCl order by  SUBSTRING(movFecha,7,4) asc, substring(movFecha,4,2) asc, SUBSTRING(movFecha,0,3) asc, substring(movhora,0,3) asc, substring(movhora,4,2) asc, substring(movhora,7,2) asc,movclave --*****movIndicador=0 and
									--Select top 1 @mS=movsql  from Man.movimientos where movIndicador=0 and movEstatus= 'M' and movCatalogo in (@Cat ) order by  SUBSTRING(movFecha,7,4) asc, substring(movFecha,4,2) asc, SUBSTRING(movFecha,0,3) asc, substring(movhora,0,3) asc, substring(movhora,4,2) asc, substring(movhora,7,2) asc 
									select @Opci =  left(@mS2,1)
									if @Opci='I' or  @Opci='i'
									begin
											exec  PreV2.RevisaDuplicados @mCla2,@mS2, @mI, @CatS2, @cveAgruCl
											--if @returnError<>''
											--begin
											--	set @msg = @msg + ' - '  + @returnError
											--end
									end
									else
									begin
										select @Posicion4 =  patindex('%ManV2.%' , @mS2)
										--Buscamos la posicion de la primera ,
										select @cadSqlM2 = left(@mS2, @Posicion4 - 1)-- esquema
										select @mS2 =  stuff(@mS2, 1, @Posicion4 +5, '')
										--Y obtenemos los caracteres hasta esa posicion
										set @cadSqlM1=  @cadSqlM2 + ' PreV2.' + @mS2   --SUBSTRING (@mS,@Posicion+4,len(@mS) - (@Posicion + 4))
									--	print @cadSqlM1
										exec(@cadSqlM1)
										update ManV2.movimientos SET movEstatus='P' where movClave=@mCla2
									end
								end
								delete from @tablaCveAgrCl  where acCve= @cveAgruCl
							end
	
						end
						
						
					end
					if @CatS='CobGeo'
					begin
							insert into @tablaCveAgrCo  select acoClave,acoCveGeo, acoCveDesGeo  from ManV2.AgrupaCob with(nolock) where acoCveGeo = @mCve--obtener clave de agrupamiento de clasificaciones
							while exists(select * from @tablaCveAgrCo )--revisar Agrupamiento del indicador
							begin
								select top 1 @cveAgruCo  = acoCve, @cveAgrucoDes= acoCveDes  from @tablaCveAgrCo 
								if @CatS2='AgrupaCob'
								begin
									while exists(select movClave,movsql  from ManV2.movimientos with(nolock) where  movCatalogo ='AgrupaCob' and movcomentario= @cveAgruCo  and  movEstatus='M' )
									begin
										Select top 1 @mCla2=movClave,@mS2=movsql from ManV2.movimientos with(nolock) where  movEstatus= 'M' and movCatalogo = @CatS2 and movComentario = @cveAgruCo order by  SUBSTRING(movFecha,7,4) asc, substring(movFecha,4,2) asc, SUBSTRING(movFecha,0,3) asc, substring(movhora,0,3) asc, substring(movhora,4,2) asc, substring(movhora,7,2) asc,movclave --*****movIndicador=0 and
										--Select top 1 @mS=movsql  from Man.movimientos where movIndicador=0 and movEstatus= 'M' and movCatalogo in (@Cat ) order by  SUBSTRING(movFecha,7,4) asc, substring(movFecha,4,2) asc, SUBSTRING(movFecha,0,3) asc, substring(movhora,0,3) asc, substring(movhora,4,2) asc, substring(movhora,7,2) asc 
										select @Opci =  left(@mS2,1)
										if @Opci='I' or  @Opci='i'
										begin
												exec  PreV2.RevisaDuplicados @mCla2,@mS2, @mI, @CatS2, @cveAgruCo
												--if @returnError<>''
												--begin
												--	set @msg = @msg + ' - '  + @returnError
												--end
										end
										else
										begin
											select @Posicion4 =  patindex('%ManV2.%' , @mS2)
											--Buscamos la posicion de la primera ,
											select @cadSqlM2 = left(@mS2, @Posicion4 - 1)-- esquema
											select @mS2 =  stuff(@mS2, 1, @Posicion4 +5, '')
											--Y obtenemos los caracteres hasta esa posicion
											set @cadSqlM1=  @cadSqlM2 + ' PreV2.' + @mS2   --SUBSTRING (@mS,@Posicion+4,len(@mS) - (@Posicion + 4))
										--	print @cadSqlM1
											exec(@cadSqlM1)
											update ManV2.movimientos SET movEstatus='P' where movClave=@mCla2
										end
									end
								end
								if @CatS2='DesgloseGeo'
								begin
								--revisar cambios en Tipo de desglose
									while exists(select movClave,movsql  from ManV2.movimientos with(nolock) where  movCatalogo ='DesgloseGeo' and movcomentario= @cveAgruCoDes  and  movEstatus='M' )
									begin
										Select top 1 @mCla2=movClave,@mS2=movsql from ManV2.movimientos with(nolock) where  movEstatus= 'M' and movCatalogo = @CatS2 and movComentario = @cveAgruCoDes order by  SUBSTRING(movFecha,7,4) asc, substring(movFecha,4,2) asc, SUBSTRING(movFecha,0,3) asc, substring(movhora,0,3) asc, substring(movhora,4,2) asc, substring(movhora,7,2) asc,movclave --*****movIndicador=0 and
										--Select top 1 @mS=movsql  from Man.movimientos where movIndicador=0 and movEstatus= 'M' and movCatalogo in (@Cat ) order by  SUBSTRING(movFecha,7,4) asc, substring(movFecha,4,2) asc, SUBSTRING(movFecha,0,3) asc, substring(movhora,0,3) asc, substring(movhora,4,2) asc, substring(movhora,7,2) asc 
										select @Opci =  left(@mS2,1)
										if @Opci='I' or  @Opci='i'
										begin
												exec  PreV2.RevisaDuplicados @mCla2,@mS2, @mI, @CatS2, @cveAgruCoDes
												--if @returnError<>''
												--begin
												--	set @msg = @msg + ' - '  + @returnError
												--end
										end
										else
										begin
											select @Posicion4 =  patindex('%ManV2.%' , @mS2)
											--Buscamos la posicion de la primera ,
											select @cadSqlM2 = left(@mS2, @Posicion4 - 1)-- esquema
											select @mS2 =  stuff(@mS2, 1, @Posicion4 +5, '')
											--Y obtenemos los caracteres hasta esa posicion
											set @cadSqlM1=  @cadSqlM2 + ' PreV2.' + @mS2   --SUBSTRING (@mS,@Posicion+4,len(@mS) - (@Posicion + 4))
										--	print @cadSqlM1
											exec(@cadSqlM1)
											update ManV2.movimientos SET movEstatus='P' where movClave=@mCla2
										end
									end
								end
								if @CatS2='TipoCobGeo'
								begin
								--revisar cambios en Tipo de desglose
									Select top 1 @cobCveTipoCobGeo=cgCveTipoCobGeo from ManV2.CobGeo with(nolock) where cgClave= @mCve
									while exists(select movClave,movsql  from ManV2.movimientos with(nolock) where  movCatalogo ='TipoCobGeo' and movcomentario= @cobCveTipoCobGeo  and  movEstatus='M' )
									begin
										Select top 1 @mCla2=movClave,@mS2=movsql from ManV2.movimientos with(nolock) where  movEstatus= 'M' and movCatalogo = @CatS2 and movComentario = @cobCveTipoCobGeo order by  SUBSTRING(movFecha,7,4) asc, substring(movFecha,4,2) asc, SUBSTRING(movFecha,0,3) asc, substring(movhora,0,3) asc, substring(movhora,4,2) asc, substring(movhora,7,2) asc,movclave --*****movIndicador=0 and
										--Select top 1 @mS=movsql  from Man.movimientos where movIndicador=0 and movEstatus= 'M' and movCatalogo in (@Cat ) order by  SUBSTRING(movFecha,7,4) asc, substring(movFecha,4,2) asc, SUBSTRING(movFecha,0,3) asc, substring(movhora,0,3) asc, substring(movhora,4,2) asc, substring(movhora,7,2) asc 
										select @Opci =  left(@mS2,1)
										if @Opci='I' or  @Opci='i'
										begin
												exec  PreV2.RevisaDuplicados @mCla2,@mS2, @mI, @CatS2, @cobCveTipoCobGeo
												--if @returnError<>''
												--begin
												--	set @msg = @msg + ' - '  + @returnError
												--end
										end
										else
										begin
											select @Posicion4 =  patindex('%ManV2.%' , @mS2)
											--Buscamos la posicion de la primera ,
											select @cadSqlM2 = left(@mS2, @Posicion4 - 1)-- esquema
											select @mS2 =  stuff(@mS2, 1, @Posicion4 +5, '')
											--Y obtenemos los caracteres hasta esa posicion
											set @cadSqlM1=  @cadSqlM2 + ' PreV2.' + @mS2   --SUBSTRING (@mS,@Posicion+4,len(@mS) - (@Posicion + 4))
										--	print @cadSqlM1
											exec(@cadSqlM1)
											update ManV2.movimientos SET movEstatus='P' where movClave=@mCla2
										end
									end
								end
								
								delete from @tablaCveAgrCo  where acoCve= @cveAgruCo
							end
	
						
					end
				end
				SELECT @CatSAdic  = stuff(@CatSAdic, 1, @Posicion3, '')
				
			end 
		end
		
	END
		if @CatS= 'DescripcionPCve'
		begin
		print 'segunda DescripcionPCve'
			While exists (select movClave, movsql  from ManV2.movimientos, manv2.atrIndicador with(nolock) where atrClaveInd= movIndicador and (atrEstado='PRE' or atrEstado='PUB')  and movEstatus= 'M' and movCatalogo = 'EnlIndPCve')--replica cambios en toda la tabla de catalogos ****movIndicador=0 and
			Begin
				set @mCve=''
				Select top 1 @mCla=movClave,@mS=movsql, @mI= movIndicador from ManV2.movimientos, manv2.atrIndicador with(nolock) where atrClaveInd= movIndicador and (atrEstado='PRE' or atrEstado='PUB')  and  movEstatus= 'M' and movCatalogo = 'EnlIndPCve' order by  SUBSTRING(movFecha,7,4) asc, substring(movFecha,4,2) asc, SUBSTRING(movFecha,0,3) asc, substring(movhora,0,3) asc, substring(movhora,4,2) asc, substring(movhora,7,2) asc,movclave --*****movIndicador=0 and
				select @Opci =  left(@mS,1)
				if @Opci='I' or  @Opci='i'
				begin
					exec  PreV2.RevisaDuplicados @mCla,@mS, @mI, @CatS, @mCve
					--if @returnError<>''
					--begin
					--	set @msg = @msg + ' - '  + @returnError
					--end
				end
				else
				begin
					select @Posicion =  patindex('%ManV2.%' , @mS)
					--Buscamos la posicion de la primera ,
					select @cadSqlM2 = left(@mS, @Posicion - 1)-- esquema
					select @mS =  stuff(@mS, 1, @Posicion+5, '')
					--Y obtenemos los caracteres hasta esa posicion
					set @cadSqlM1=  @cadSqlM2 + ' PreV2.' + @mS   --SUBSTRING (@mS,@Posicion+4,len(@mS) - (@Posicion + 4))
				--	print @cadSqlM1
					exec(@cadSqlM1)
					update ManV2.movimientos SET movEstatus='P' where movClave=@mCla
				end
			end
			
		
		end
		if @CatS ='Calendario'
		begin
		set @CatS2= 'Notas'
			Select top 1 @cveNt = calCveNota  from ManV2.Calendario with(nolock) where calClave ='ODS'
			While exists (select movClave, movsql  from ManV2.movimientos with(nolock) where  movEstatus= 'M' and movCatalogo = 'Notas' and movComentario= @cveNt )--replica cambios en toda la tabla de catalogos ****movIndicador=0 and
			Begin 
				Select top 1 @mCla=movClave,@mS=movsql  from ManV2.movimientos with(nolock) where  movEstatus= 'M' and movCatalogo = 'Notas' and movComentario = @cveNt order by  SUBSTRING(movFecha,7,4) asc, substring(movFecha,4,2) asc, SUBSTRING(movFecha,0,3) asc, substring(movhora,0,3) asc, substring(movhora,4,2) asc, substring(movhora,7,2) asc,movclave --*****movIndicador=0 and
				--Select top 1 @mS=movsql  from Man.movimientos where movIndicador=0 and movEstatus= 'M' and movCatalogo in (@Cat ) order by  SUBSTRING(movFecha,7,4) asc, substring(movFecha,4,2) asc, SUBSTRING(movFecha,0,3) asc, substring(movhora,0,3) asc, substring(movhora,4,2) asc, substring(movhora,7,2) asc 
				select @Opci =  left(@mS2,1)
				if @Opci='I' or  @Opci='i'
				begin
					exec  PreV2.RevisaDuplicados @mCla,@mS, @mI, @CatS2, @cveNt
					--if @returnError<>''
					--begin
					--	set @msg = @msg + ' - '  + @returnError
					--end
				end
				else
				begin
					select @Posicion =  patindex('%ManV2.%' , @mS)
					--Buscamos la posicion de la primera ,
					select @cadSqlM2 = left(@mS, @Posicion - 1)-- esquema
					select @mS =  stuff(@mS, 1, @Posicion+5, '')
					--Y obtenemos los caracteres hasta esa posicion
					set @cadSqlM1=  @cadSqlM2 + ' PreV2.' + @mS   --SUBSTRING (@mS,@Posicion+4,len(@mS) - (@Posicion + 4))
				--	print @cadSqlM1
					exec(@cadSqlM1)
					update ManV2.movimientos SET movEstatus='P' where movClave=@mCla
				end
			END
		end
 end
END

GO


GO

/******StoredProcedure [PreV2].[RevisaAtrSerie] ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [PreV2].[RevisaAtrSerie] 
	-- Add the parameters for the stored procedure here
	@CveIn int,
	@TPro varchar(2)
AS
BEGIN
SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED
declare @mClaA int,@mClaA2 int,@cveSer int, @cveDes nvarchar(Max), @cveFre nvarchar(Max), @cveNota nvarchar(Max), @cveFue nvarchar(Max), @cveUni nvarchar(Max), @cveGral nvarchar(Max), @cveGra nvarchar(Max), @CveGpo int,@cveDesCl int,@movCtoDes nvarChar(Max)
declare @mSA nvarchar(MAX),@CveAr varchar(50),@mSA2 nvarchar(MAX),@mSA3 nvarchar(MAX),@cveAgru nvarchar(Max), @cveAgruCl nvarchar(Max), @cveAgru2 nvarchar(Max), @cveAgruCo nvarchar(Max), @cadOrdClaC nvarchar(max),@cadOrdClaG nvarchar(max),@mComAgrCl nvarchar(max)
declare @cadSqlM nvarchar(Max), @cveAgruCoGeo nvarchar(Max), @cveAgruCoDesGeo nvarchar(Max),@cobCveTipoCobGeo int, @aaclNota int , @TipoCl nvarchar(max)
declare @cadSqlM1 nvarchar(Max),@Opci nvarchar(1),@returnErrorSer nvarchar(Max),@msgSer nvarchar(Max),@cadOrdCob nvarchar(max), @mComAgrCo nvarchar(max), @aacoNota int
declare @cadSqlM2 nvarchar(Max), @cadCat nvarChar(Max),@cadCD varchar(30),@CveGpoClas nvarchar(Max)
declare @Pos int,@Pos3 int, @Pos2 int, @CveNotDato int,@apiNota int
declare @tablaSer table (c1 int)

declare @tablaGp table (cG int)
declare @tablaDesClas table (cveClas int, cveDs int)
declare @tablaAgr table (cA nvarchar(Max))
declare @tablaCveAgr table (cCA nvarchar(Max))
declare @tablaAgrCo table (cACo nvarchar(Max),cACoGeo nvarChar(Max),cACoDes nvarChar(Max))--tabla para obtener los campos de la tabla agrupaCob
declare @tablaCveAgrCo table (cCACo nvarchar(Max))
declare @tablaNotasDatos table (CveNotDat int)
declare @tablaNotasPer table (CveNotPer int)



set @msgSer = ''
print 'Estoy en RevisaAtrSerie'
print @TPro
  if @TPro='C' -- es cambio
   begin
		insert into @tablaSer select atsClaveSerie from ManV2.AtrSerie with(nolock), ManV2.EnlSerInd with(nolock) where atsClaveSerie = esiClaveSerie and esiClaveInd = @CveIn 
		
		while exists(select * from @tablaSer )
		begin
					select top 1 @cveSer = c1  from @tablaSer  
					select @cveDes = atsClaveDescrip, @cveFre = atsClaveFre, @cveNota = atsClaveNota, @cveFue = atsClaveFuente, @cveUni = atsClaveUnidad, @cveGra = atsTipoGra, @cveAgru2 = atsClaveAgrupaCob, @cveAgru = atsClaveAgrupaClas   from ManV2.AtrSerie with(nolock) where atsClaveSerie = @cveSer
					
					print @cveSer
					set @cadCat = 'Descripcion,Frecuencia,Notas,Fuentes,Unidad,Grafica'
					WHILE patindex('%,%' , @cadCat) <> 0
					begin
						
						SELECT @Pos2 =  patindex('%,%' , @cadCat)
						--Buscamos la posicion de la primera ,
						SELECT @cadCD= left(@cadCat, @Pos2 - 1)--nombre de catalogo
						print @cadCD
						--Reemplazamos lo procesado con nada con la funcion stuff
						SELECT @cadCat = stuff(@cadCat, 1, @Pos2, '')
						if (@cadCD ='Descripcion' )
						begin set @cveGral= @cveDes	end
						if (@cadCD ='Frecuencia')
						begin set @cveGral= @cveFre	end
						if (@cadCD ='Notas')
						begin set @cveGral= @cveNota end
						if (@cadCD ='Fuentes')
						begin set @cveGral= @cveFue end
						if (@cadCD ='Unidad')
						begin set @cveGral= @cveUni	end
						if (@cadCD ='Grafica')
						begin set @cveGral= @cveGra	end
						
						if @cveGral <> 0
						begin
							--print @cveGral
							--set @cadSqlM1= 'select movClave,movsql  from ManV2.movimientos with(nolock) where movCatalogo=' + @cadCD  + ' and movcomentario= ' + @cveGral + '  and  movEstatus=M'
							--print @cadSqlM1
							while exists(select movClave,movsql  from ManV2.movimientos with(nolock) where movCatalogo=@cadCD and movcomentario= @cveGral  and  movEstatus='M' )
							begin
								print 'Entre2'
							select top 1 @mClaA2=movClave, @mSA2=movsql  from ManV2.movimientos with(nolock) where movCatalogo=@cadCD  and movcomentario= @cveGral and  movEstatus='M' order by SUBSTRING(movFecha,7,4) asc, substring(movFecha,4,2) asc, SUBSTRING(movFecha,0,3) asc, substring(movhora,0,3) asc, substring(movhora,4,2) asc, substring(movhora,7,2) asc, movClave
								print @mClaA2
								select @Opci =  left(@mSA2,1)	--obtener el primer caracter
								if @Opci='I' or  @Opci='i'
								begin
								print 'Insert'
									exec PreV2.RevisaDuplicados @mClaA2,@mSA2, @CveIn , @cadCD, @cveGral
								end
								else
								begin
									print 'Movi'
									select @Pos3 =  patindex('%ManV2.%' , @mSA2)--Buscamos la posicion de la primera ,
									select @cadSqlM = left(@mSA2, @Pos3 - 1)-- esquema
									select @mSA2 =  stuff(@mSA2, 1, @Pos3+5, '')			--Y obtenemos los caracteres hasta esa posicion
									set @cadSqlM1=  @cadSqlM + ' PreV2.' + @mSA2   --SUBSTRING (@mS,@Posicion+4,len(@mS) - (@Posicion + 4))
									exec(@cadSqlM1)
									update ManV2.movimientos SET movEstatus='P' where movClave=@mClaA2
								end
							end
						end 
					end
					--revisar notas en datos
					print 'revisar notas en datos'
					--select distinct serNota from ManV2.Serie with(nolock) where serClave = 903 and serNota <>'' and serNota <>0
					insert into @tablaNotasDatos select distinct serNota from ManV2.Serie with(nolock) where serClave = @cveSer and serNota <>'' and serNota <>0
					print 'insert en @TablaNotasDatos'
					while exists(select * from @tablaNotasDatos )--revisar notas que tiene el indicador en los datos se la serie
					begin
						print 'while de insert en @tablaNotasDatos'
						print 'antes del top 1 '
						select top 1 @CveNotDato = CveNotDat  from @tablaNotasDatos --obtenemos la primer nota
						print @CveNotDato
						while exists(select movClave,movsql  from ManV2.movimientos with(nolock) where movCatalogo='Notas'  and movcomentario= @CveNotDato  and  movEstatus='M' )
						begin
							select top 1 @mClaA2=movClave, @mSA2=movsql  from ManV2.movimientos with(nolock) where movCatalogo='Notas'  and movcomentario= @CveNotDato and  movEstatus='M' order by SUBSTRING(movFecha,7,4) asc, substring(movFecha,4,2) asc, SUBSTRING(movFecha,0,3) asc, substring(movhora,0,3) asc, substring(movhora,4,2) asc, substring(movhora,7,2) asc, movClave
							select @Opci =  left(@mSA2,1)	--obtener el primer caracter
							if @Opci='I' or  @Opci='i'
							begin
							   -- print 'Grupo: ' + @CveGpo
							   print 'Por entrar en RevisaDuplicados Notas'
								exec  PreV2.RevisaDuplicados @mClaA2,@mSA2, @CveIn , 'Notas', @CveNotDato
								print 'Sali de RevisaDuplicados Notas'
							end
							else
							begin
							  select @Pos3 =  patindex('%ManV2.%' , @mSA2)--Buscamos la posicion de la primera ,
							  select @cadSqlM = left(@mSA2, @Pos3 - 1)-- esquema
							  select @mSA2 =  stuff(@mSA2, 1, @Pos3+5, '')			--Y obtenemos los caracteres hasta esa posicion
							  set @cadSqlM1=  @cadSqlM + ' PreV2.' + @mSA2   --SUBSTRING (@mS,@Posicion+4,len(@mS) - (@Posicion + 4))
							  exec(@cadSqlM1)
							  update ManV2.movimientos SET movEstatus='P' where movClave=@mClaA2
							end
						end
						delete from @tablaNotasDatos where CveNotDat = @CveNotDato
					end
					--revisar atributos de periodos 
					print 'revisar atributos de periodos'
					while exists(select movClave,movsql  from ManV2.movimientos with(nolock) where  movCatalogo ='AtrPeriodoPorInd'  and movComentario= Convert(nvarchar(255),@cveSer)   and  movEstatus='M' )
					begin
					  select top 1 @mClaA2=movClave, @mSA2=movsql from ManV2.movimientos with(nolock) where movCatalogo ='AtrPeriodoPorInd'  and movComentario = Convert(nvarchar(255),@cveSer)   and  movEstatus='M' order by SUBSTRING(movFecha,7,4) asc, substring(movFecha,4,2) asc, SUBSTRING(movFecha,0,3) asc, substring(movhora,0,3) asc, substring(movhora,4,2) asc, substring(movhora,7,2) asc, movClave
					  select @Opci =  left(@mSA2,1)	--obtener el primer caracter
					  print @Opci
					  if @Opci='I' or  @Opci='i'
					  begin
							print 'Entrando de revisa duplicados AtrPeriodoPorInd'
							print @mClaA2
							print @mSA2
							--exec  PreV2.RevisaDuplicados @mClaA2,@mSA2, @CveIn , 'AtrAgrupaClaPorInd', @cveAgruCl
							exec  PreV2.RevisaDuplicados @mClaA2,@mSA2, @CveIn, 'AtrPeriodoPorInd', @cveSer
						end
						else
						begin
							select @Pos3 =  patindex('%ManV2.%' , @mSA2)--Buscamos la posicion de la primera ,
							select @cadSqlM = left(@mSA2, @Pos3 - 1)-- esquema
							select @mSA2 =  stuff(@mSA2, 1, @Pos3+5, '')			--Y obtenemos los caracteres hasta esa posicion
							set @cadSqlM1=  @cadSqlM + ' PreV2.' + @mSA2   --SUBSTRING (@mS,@Posicion+4,len(@mS) - (@Posicion + 4))
							exec(@cadSqlM1)
							update ManV2.movimientos SET movEstatus='P' where movClave=@mClaA2
						end
					 end--while de movimientos AtrPeriodoPorInd
					 
					 --revisar notas en periodos
					 print 'revisar notas en periodos'
					 insert into @tablaNotasPer select distinct apiCveNota   from ManV2.AtrPeriodoPorInd with(nolock)  where apiCveSer = @cveSer
					 while exists(select * from @tablaNotasPer)
					 begin
						 select top 1 @apiNota  = CveNotPer  from @tablaNotasPer  
							while exists(select movClave,movsql  from ManV2.movimientos with(nolock) where  movCatalogo ='Notas'  and movComentario= @apiNota and  movEstatus='M' )
							begin
							  select top 1 @mClaA2=movClave, @mSA2=movsql from ManV2.movimientos with(nolock) where movCatalogo ='Notas'  and movComentario= @apiNota and  movEstatus='M' order by SUBSTRING(movFecha,7,4) asc, substring(movFecha,4,2) asc, SUBSTRING(movFecha,0,3) asc, substring(movhora,0,3) asc, substring(movhora,4,2) asc, substring(movhora,7,2) asc, movClave
							  select @Opci =  left(@mSA2,1)	--obtener el primer caracter
							  print @Opci
							  if @Opci='I' or  @Opci='i'
							  begin
								print 'Entrando de revisa duplicados Notas en Periodo'
								print @mClaA2
								print @mSA2
								exec  PreV2.RevisaDuplicados @mClaA2,@mSA2, @CveIn , 'Notas', @apiNota
							  end
							  else
							  begin
									select @Pos3 =  patindex('%ManV2.%' , @mSA2)--Buscamos la posicion de la primera ,
									select @cadSqlM = left(@mSA2, @Pos3 - 1)-- esquema
									select @mSA2 =  stuff(@mSA2, 1, @Pos3+5, '')			--Y obtenemos los caracteres hasta esa posicion
									set @cadSqlM1=  @cadSqlM + ' PreV2.' + @mSA2   --SUBSTRING (@mS,@Posicion+4,len(@mS) - (@Posicion + 4))
									exec(@cadSqlM1)
									update ManV2.movimientos SET movEstatus='P' where movClave=@mClaA2
							  end
							end--while notas
						 delete from @tablaNotasPer  where CveNotPer = @apiNota	
					end--while de @tablaNotasPer
					
					-- tipo de cuadro para revisar el grupo y clasificaciones
					--if  @cveAgru IS NULL or @cveAgru <> '0'
					print @cveAgru
					if  @cveAgru IS not NULL or @cveAgru <> '0'
					begin
											
						--insert into @tablaCveAgr select atrClaveAgrupaClas  from Man.AtrIndicador where atrClaveInd = @CveIn--obtener clave de agrupamiento de clasificaciones
						
						  insert into @tablaGp select distinct acCveGpo   from ManV2.AgrupaClas with(nolock)  where acClave like @cveAgru + '%'  and LEN(acClave)>3
						  while exists(select * from @TablaGp )--revisar Grupos que tiene el indicador
						  begin
						 
							--insert into @tablaClas select gpoClave, claClave,claClaveDescrip from man.Grupo, man.Clasificacion, man.EnlIndCla where claClave = eiclClaveClas and claGrupo = gpoClave and eiclClaveInd = @CveIn 
							  select top 1 @CveGpo = cG  from @TablaGp --obtenemos el primer grupo 
							  print @CveGpo
							  insert into @tablaDesClas  select  claClave, claClaveDescrip  from ManV2.Clasificacion with(nolock) where claGrupo = @CveGpo--obtener las descripciones de las clasificaciones
							  --select top 1 @CveGpo= Clagrupo from man.Clasificacion, man.EnlIndCla where claClave = eiclClaveClas  and eiclClaveInd = @CveIn 
							  while exists(select movClave,movsql  from ManV2.movimientos with(nolock) where movCatalogo='Grupo'  and movcomentario= @CveGpo  and  movEstatus='M' )
								  begin
									  --select top 1 @mClaA2=movClave, @mSA2=movsql  from man.movimientos where (movCatalogo='Grupo' or movCatalogo ='Clasificacion' or movCatalogo ='AgrupaClas')  and movcomentario= @CveGpo and  movEstatus='M' order by SUBSTRING(movFecha,7,4) asc, substring(movFecha,4,2) asc, SUBSTRING(movFecha,0,3) asc, substring(movhora,0,3) asc, substring(movhora,4,2) asc, substring(movhora,7,2) asc, movClave
									  select top 1 @mClaA2=movClave, @mSA2=movsql  from ManV2.movimientos with(nolock) where movCatalogo='Grupo'  and movcomentario= @CveGpo and  movEstatus='M' order by SUBSTRING(movFecha,7,4) asc, substring(movFecha,4,2) asc, SUBSTRING(movFecha,0,3) asc, substring(movhora,0,3) asc, substring(movhora,4,2) asc, substring(movhora,7,2) asc, movClave
									  select @Opci =  left(@mSA2,1)	--obtener el primer caracter

									  if @Opci='I' or  @Opci='i'
										begin
										   -- print 'Grupo: ' + @CveGpo
											exec  PreV2.RevisaDuplicados @mClaA2,@mSA2, @CveIn , 'Grupo', @CveGpo
										end
										else
										begin
										  select @Pos3 =  patindex('%ManV2.%' , @mSA2)--Buscamos la posicion de la primera ,
										  select @cadSqlM = left(@mSA2, @Pos3 - 1)-- esquema
										  select @mSA2 =  stuff(@mSA2, 1, @Pos3+5, '')			--Y obtenemos los caracteres hasta esa posicion
										  set @cadSqlM1=  @cadSqlM + ' PreV2.' + @mSA2   --SUBSTRING (@mS,@Posicion+4,len(@mS) - (@Posicion + 4))
										  exec(@cadSqlM1)
										  update ManV2.movimientos SET movEstatus='P' where movClave=@mClaA2
										end
								  end
								   --Descripciones de clasificaciones
								  print 'Descripciones de clasificaciones'
							   while exists(select * from @tablaDesClas )
							   begin
								  select top 1 @cveDesCl  = cveDs  from @TablaDesClas --obtenemos la primer clasificacion
								  --while exists(select movClave,movsql  from ManV2.movimientos with(nolock) where (movCatalogo='Descripcion' or movCatalogo='Lexico' or movCatalogo='LexicoIng' or movCatalogo='Enlace' or movCatalogo='EnlaceIng') and movcomentario= Convert(nvarchar(255),@cveDesCl)  and  movEstatus='M' )
								  while exists(select movClave,movsql  from ManV2.movimientos with(nolock) where movCatalogo='Descripcion'  and movcomentario= Convert(nvarchar(255),@cveDesCl)  and  movEstatus='M' )
									  begin
										  --select top 1 @mClaA2=movClave, @mSA2=movsql, @movCtoDes= movCatalogo  from ManV2.movimientos with(nolock) where (movCatalogo='Descripcion' or movCatalogo='Lexico' or movCatalogo='LexicoIng' or movCatalogo='Enlace' or movCatalogo='EnlaceIng') and movcomentario= Convert(nvarchar(255),@cveDesCl) and  movEstatus='M' order by SUBSTRING(movFecha,7,4) asc, substring(movFecha,4,2) asc, SUBSTRING(movFecha,0,3) asc, substring(movhora,0,3) asc, substring(movhora,4,2) asc, substring(movhora,7,2) asc, movClave
										  select top 1 @mClaA2=movClave, @mSA2=movsql, @movCtoDes= movCatalogo  from ManV2.movimientos with(nolock) where movCatalogo='Descripcion'  and movcomentario= Convert(nvarchar(255),@cveDesCl) and  movEstatus='M' order by SUBSTRING(movFecha,7,4) asc, substring(movFecha,4,2) asc, SUBSTRING(movFecha,0,3) asc, substring(movhora,0,3) asc, substring(movhora,4,2) asc, substring(movhora,7,2) asc, movClave
										  
										  select @Opci =  left(@mSA2,1)	--obtener el primer caracter
										  if @Opci='I' or  @Opci='i'
											begin
												exec  PreV2.RevisaDuplicados @mClaA2,@mSA2, @CveIn , @movCtoDes, @cveDesCl
											end
											else
											begin
												select @Pos3 =  patindex('%ManV2.%' , @mSA2)--Buscamos la posicion de la primera ,
												select @cadSqlM = left(@mSA2, @Pos3 - 1)-- esquema
												select @mSA2 =  stuff(@mSA2, 1, @Pos3+5, '')			--Y obtenemos los caracteres hasta esa posicion
												set @cadSqlM1=  @cadSqlM + ' PreV2.' + @mSA2   --SUBSTRING (@mS,@Posicion+4,len(@mS) - (@Posicion + 4))
												exec(@cadSqlM1)
												update ManV2.movimientos SET movEstatus='P' where movClave=@mClaA2
											end
										  
									  end
								  ---Claves de clasificaciones
								  print 'Claves de clasificaciones'
								  while exists(select movClave,movsql  from ManV2.movimientos with(nolock) where movCatalogo='Clasificacion' and movcomentario= @CveGpo  and  movEstatus='M' )
									  begin
										  select top 1 @mClaA2=movClave, @mSA2=movsql  from ManV2.movimientos with(nolock) where movCatalogo='Clasificacion' and movcomentario= @CveGpo  and  movEstatus='M' order by SUBSTRING(movFecha,7,4) asc, substring(movFecha,4,2) asc, SUBSTRING(movFecha,0,3) asc, substring(movhora,0,3) asc, substring(movhora,4,2) asc, substring(movhora,7,2) asc, movClave
										  select @Opci =  left(@mSA2,1)	--obtener el primer caracter
										  
										  if @Opci='I' or  @Opci='i'
											begin
												--print 'Clasificacion:' + @CveGpo
												exec  PreV2.RevisaDuplicados @mClaA2,@mSA2, @CveIn , 'Clasificacion', @CveGpo
											end
											else
											begin
												select @Pos3 =  patindex('%ManV2.%' , @mSA2)--Buscamos la posicion de la primera ,
												select @cadSqlM = left(@mSA2, @Pos3 - 1)-- esquema
												select @mSA2 =  stuff(@mSA2, 1, @Pos3+5, '')			--Y obtenemos los caracteres hasta esa posicion
												set @cadSqlM1=  @cadSqlM + ' PreV2.' + @mSA2   --SUBSTRING (@mS,@Posicion+4,len(@mS) - (@Posicion + 4))
												exec(@cadSqlM1)
												update ManV2.movimientos SET movEstatus='P' where movClave=@mClaA2
											end
										  
									  end
									delete from @TablaDesClas where cveDs = @cveDesCl	
								  end
								   --revisa el caso especial de agrupaClas con clave de grupo en el movcomentario
								  set @CveGpoClas = 'U' + Convert(nvarchar(255),@CveGpo) 
								  while exists(select movClave,movsql  from ManV2.movimientos with(nolock) where  movCatalogo ='AgrupaClas' and movcomentario=  @CveGpoClas  and  movEstatus='M' )
								  begin
									  
									  select top 1 @mClaA2=movClave, @mSA2=movsql  from ManV2.movimientos with(nolock) where movCatalogo ='AgrupaClas'  and movcomentario= @CveGpoClas and  movEstatus='M' order by SUBSTRING(movFecha,7,4) asc, substring(movFecha,4,2) asc, SUBSTRING(movFecha,0,3) asc, substring(movhora,0,3) asc, substring(movhora,4,2) asc, substring(movhora,7,2) asc, movClave
									  select @Pos3 =  patindex('%ManV2.%' , @mSA2)--Buscamos la posicion de la primera ,
									  select @cadSqlM = left(@mSA2, @Pos3 - 1)-- esquema
									  select @mSA2 =  stuff(@mSA2, 1, @Pos3+5, '')			--Y obtenemos los caracteres hasta esa posicion
									  set @cadSqlM1=  @cadSqlM + ' PreV2.' + @mSA2   --SUBSTRING (@mS,@Posicion+4,len(@mS) - (@Posicion + 4))
									  exec(@cadSqlM1)
									  update ManV2.movimientos SET movEstatus='P' where movClave=@mClaA2
								  end
								 delete from @TablaGp where cG= @CveGpo
						end--fin del clave de grupo
			
						  --revisa Agrupamiento por clave '010', '010010'...
						  --select distinct acClave from PreV2.AgrupaClas, PreV2.EnlIndCla2  where acClave= eiclClaveAgrupa and eiclClaveInd  = 54 or acClave like '020%'
						 -- select top 1 @cveAgru  = cCA  from @tablaCveAgr 
						 
						  insert into @tablaAgr select distinct acClave from ManV2.AgrupaClas with(nolock) where acClave like @cveAgru + '%' --'%'+ @titulo +'%'
						  while exists(select * from @tablaAgr )--revisar Agrupamiento del indicador
						  begin
							--insert into @tablaClas select gpoClave, claClave,claClaveDescrip from man.Grupo, man.Clasificacion, man.EnlIndCla where claClave = eiclClaveClas and claGrupo = gpoClave and eiclClaveInd = @CveIn 
							  select top 1 @cveAgruCl  = cA  from @tablaAgr --obtenemos la primer clave del agrupamiento 
							  --select top 1 @CveGpo= Clagrupo from man.Clasificacion, man.EnlIndCla where claClave = eiclClaveClas  and eiclClaveInd = @CveIn 
							  while exists(select movClave,movsql  from ManV2.movimientos with(nolock) where  movCatalogo ='AgrupaClas' and movcomentario= @cveAgruCl  and  movEstatus='M' )
								  begin
									  
									  select top 1 @mClaA2=movClave, @mSA2=movsql  from ManV2.movimientos with(nolock) where movCatalogo ='AgrupaClas'  and movcomentario= @cveAgruCl and  movEstatus='M' order by SUBSTRING(movFecha,7,4) asc, substring(movFecha,4,2) asc, SUBSTRING(movFecha,0,3) asc, substring(movhora,0,3) asc, substring(movhora,4,2) asc, substring(movhora,7,2) asc, movClave
									  select @Opci =  left(@mSA2,1)	--obtener el primer caracter
									  print @Opci
									  if @Opci='I' or  @Opci='i'
										begin
											print 'Entrando de revisa duplicados agrupaclas'
											print @mClaA2
											print @mSA2
											print @cveAgruCl
											exec  PreV2.RevisaDuplicados @mClaA2,@mSA2, @CveIn , 'AgrupaClas', @cveAgruCl
										end
										else
										begin
											select @Pos3 =  patindex('%ManV2.%' , @mSA2)--Buscamos la posicion de la primera ,
											select @cadSqlM = left(@mSA2, @Pos3 - 1)-- esquema
											select @mSA2 =  stuff(@mSA2, 1, @Pos3+5, '')			--Y obtenemos los caracteres hasta esa posicion
											set @cadSqlM1=  @cadSqlM + ' PreV2.' + @mSA2   --SUBSTRING (@mS,@Posicion+4,len(@mS) - (@Posicion + 4))
											exec(@cadSqlM1)
											update ManV2.movimientos SET movEstatus='P' where movClave=@mClaA2
										end
									  
								  end--while exists(select movClave,movsql  from ManV2.movimientos with(nolock) where  movCatalogo ='AgrupaClas' 
						-- Buscar movimientos en AtrAgrupaClaPorInd   -- ordenamiento de clasifciaciones
							--buscar movimientos en las notas asignadas en AtrAgrupaClaPorInd
							--insert into @tablaAtribCl select distinct aaclCveNota  from ManV2.AtrAgrupaClaPorInd with(nolock) where aaclCveSer=  @cveSer and aaclAgrCla =  @cveAgruCl --'%'+ @titulo +'%'
							
						print 'AtrAgrupaClaPorInd'
							set @cadOrdClaC= Convert(nvarchar(max),@cveSer) + '-' + @cveAgruCl + '-C' 
							set @cadOrdClaG= Convert(nvarchar(max),@cveSer) + '-' + @cveAgruCl + '-G' 
							  while exists(select movClave,movsql  from ManV2.movimientos with(nolock) where  movCatalogo ='AtrAgrupaClaPorInd'  and (movComentario= @cadOrdClaC or  movComentario=@cadOrdClaG or movComentario = Convert(nvarchar(max),@cveSer))  and  movEstatus='M' )
								  begin
									  
									  select top 1 @mClaA2=movClave, @mSA2=movsql, @mComAgrCl= movComentario from ManV2.movimientos with(nolock) where movCatalogo ='AtrAgrupaClaPorInd'  and (movComentario= @cadOrdClaC or  movComentario=@cadOrdClaG or movComentario = @cveSer) and  movEstatus='M' order by SUBSTRING(movFecha,7,4) asc, substring(movFecha,4,2) asc, SUBSTRING(movFecha,0,3) asc, substring(movhora,0,3) asc, substring(movhora,4,2) asc, substring(movhora,7,2) asc, movClave
									  select @Opci =  left(@mSA2,1)	--obtener el primer caracter
									  print @Opci
									  if @Opci='I' or  @Opci='i'
										begin
											print 'Entrando de revisa duplicados AtrAgrupaClaPorInd'
											print @mClaA2
											print @mSA2
											print @cveAgruCl
											--exec  PreV2.RevisaDuplicados @mClaA2,@mSA2, @CveIn , 'AtrAgrupaClaPorInd', @cveAgruCl
											exec  PreV2.RevisaDuplicados @mClaA2,@mSA2, @CveIn  , 'AtrAgrupaClaPorInd', @mComAgrCl
										end
										else
										begin
											select @Pos3 =  patindex('%ManV2.%' , @mSA2)--Buscamos la posicion de la primera ,
											select @cadSqlM = left(@mSA2, @Pos3 - 1)-- esquema
											select @mSA2 =  stuff(@mSA2, 1, @Pos3+5, '')			--Y obtenemos los caracteres hasta esa posicion
											set @cadSqlM1=  @cadSqlM + ' PreV2.' + @mSA2   --SUBSTRING (@mS,@Posicion+4,len(@mS) - (@Posicion + 4))
											exec(@cadSqlM1)
											update ManV2.movimientos SET movEstatus='P' where movClave=@mClaA2
										end
									
									  
								  end--while de movimientos atrAtribAgrupaClInd
								  
								  --revisar nota del atributo de agrupamiento clasificacion
								  -- select @Pos3 =  patindex('%-%' , @mComAgrCl)--Buscamos la posicion de la primera -
									 --select @TipoCl =  stuff(@mComAgrCl, 1, @Pos3, '')	
									 --select @Pos3 =  patindex('%-%' , @TipoCl)--Buscamos la segunda posición de -	
									 --select @TipoCl =  stuff(@mComAgrCl, 1, @Pos3, '')--obtenemos C o G
									 select top 1 @aaclNota  = aaclCveNota  from manv2.AtrAgrupaClaPorInd where aaclCveSer=@cveSer and aaclAgrCla= @cveAgruCl --obtenemos la clave de nota del atributo de clasificacion 
									 if @aaclNota IS not NULL and @aaclNota <> 0
									 begin
										while exists(select movClave,movsql  from ManV2.movimientos with(nolock) where  movCatalogo ='Notas'  and movComentario= @aaclNota and  movEstatus='M' )
										begin
										  select top 1 @mClaA2=movClave, @mSA2=movsql from ManV2.movimientos with(nolock) where movCatalogo ='Notas'  and movComentario= @aaclNota and  movEstatus='M' order by SUBSTRING(movFecha,7,4) asc, substring(movFecha,4,2) asc, SUBSTRING(movFecha,0,3) asc, substring(movhora,0,3) asc, substring(movhora,4,2) asc, substring(movhora,7,2) asc, movClave
										  select @Opci =  left(@mSA2,1)	--obtener el primer caracter
										  print @Opci
										  if @Opci='I' or  @Opci='i'
											begin
												print 'Entrando de revisa duplicados Notas'
												print @mClaA2
												print @mSA2
												print @cveAgruCl
												--exec  PreV2.RevisaDuplicados @mClaA2,@mSA2, @CveIn , 'AtrAgrupaClaPorInd', @cveAgruCl
												exec  PreV2.RevisaDuplicados @mClaA2,@mSA2, @CveIn , 'Notas', @aaclNota
											end
											else
											begin
												select @Pos3 =  patindex('%ManV2.%' , @mSA2)--Buscamos la posicion de la primera ,
												select @cadSqlM = left(@mSA2, @Pos3 - 1)-- esquema
												select @mSA2 =  stuff(@mSA2, 1, @Pos3+5, '')			--Y obtenemos los caracteres hasta esa posicion
												set @cadSqlM1=  @cadSqlM + ' PreV2.' + @mSA2   --SUBSTRING (@mS,@Posicion+4,len(@mS) - (@Posicion + 4))
												exec(@cadSqlM1)
												update ManV2.movimientos SET movEstatus='P' where movClave=@mClaA2
											end
											
										end--while notas
									 end--if notas
									 
							delete from @TablaAgr where cA= @cveAgruCl
						  end--en del while exists(select * from @tablaAgr )--revisar Agrupamiento del indicador
						 
					  end--end del if (@Tipocua = 'CoCl' or @Tipocua = 'ACl' or @Tipocua = 'ClS' or @Tipocua = 'ClA')
				
					  --Agrupamiento de coberturas
					  --if (@Tipocua = 'CoCl' or @Tipocua = 'CoS')
					 -- begin
						--  insert into @tablaCveAgrCo select atrClaveAgrupaCob  from Man.AtrIndicador where atrClaveInd = @CveIn--obtener clave de agrupamiento de cobertura
						--revisa Agrupamiento cobertura por clave '010', '010010'...
						  --select distinct acClave from PreV2.AgrupaClas, PreV2.EnlIndCla2  where acClave= eiclClaveAgrupa and eiclClaveInd  = 54 or acClave like '020%'
						 -- select top 1 @cveAgru2  = cCACo  from @tablaCveAgrCo--clave general del agrupamiento 010,020, etc
						
						  insert into @tablaAgrCo select distinct acoClave,acoCveGeo, acoCveDesGeo from ManV2.AgrupaCob with(nolock) where  acoClave like @cveAgru2 + '%' --'%'+ @titulo +'%'
						  while exists(select * from @tablaAgrCo )--revisar Agrupamiento de coberturas del indicador
						  begin
							 
							  
							--insert into @tablaClas select gpoClave, claClave,claClaveDescrip from man.Grupo, man.Clasificacion, man.EnlIndCla where claClave = eiclClaveClas and claGrupo = gpoClave and eiclClaveInd = @CveIn 
							  select top 1 @cveAgruCo  = cACo, @cveAgruCoGeo = cACoGeo, @cveAgruCoDesGeo = cACoDes from @tablaAgrCo  --obtenemos la primer clave del agrupamiento de coberturas
							   --revisar coberturas
							  while exists(select movClave,movsql  from ManV2.movimientos with(nolock) where  movCatalogo ='CobGeo' and movcomentario= @cveAgruCoGeo  and  movEstatus='M' )
								  begin
									  select top 1 @mClaA2=movClave, @mSA2=movsql  from ManV2.movimientos with(nolock) where movCatalogo ='CobGeo'  and movcomentario= @cveAgruCoGeo and  movEstatus='M' order by SUBSTRING(movFecha,7,4) asc, substring(movFecha,4,2) asc, SUBSTRING(movFecha,0,3) asc, substring(movhora,0,3) asc, substring(movhora,4,2) asc, substring(movhora,7,2) asc, movClave
									  select @Opci =  left(@mSA2,1)	--obtener el primer caracter
									  if @Opci='I' or  @Opci='i'
										begin
											--print @cveAgruCoGeo
											exec  PreV2.RevisaDuplicados @mClaA2,@mSA2, @CveIn , 'CobGeo', @cveAgruCoGeo
										end
										else
										begin
											  select @Pos3 =  patindex('%ManV2.%' , @mSA2)--Buscamos la posicion de la primera ,
											  select @cadSqlM = left(@mSA2, @Pos3 - 1)-- esquema
											  select @mSA2 =  stuff(@mSA2, 1, @Pos3+5, '')			--Y obtenemos los caracteres hasta esa posicion
											  set @cadSqlM1=  @cadSqlM + ' PreV2.' + @mSA2   --SUBSTRING (@mS,@Posicion+4,len(@mS) - (@Posicion + 4))
											  exec(@cadSqlM1)
											  update ManV2.movimientos SET movEstatus='P' where movClave=@mClaA2
										end
								  end
							  --revisa desgloseGEo
							  while exists(select movClave,movsql  from ManV2.movimientos with(nolock) where  movCatalogo ='DesgloseGeo' and movcomentario= @cveAgruCoDesGeo  and  movEstatus='M' )
								  begin
									  select top 1 @mClaA2=movClave, @mSA2=movsql  from ManV2.movimientos with(nolock) where movCatalogo ='DesgloseGeo'  and movcomentario= @cveAgruCoDesGeo and  movEstatus='M' order by SUBSTRING(movFecha,7,4) asc, substring(movFecha,4,2) asc, SUBSTRING(movFecha,0,3) asc, substring(movhora,0,3) asc, substring(movhora,4,2) asc, substring(movhora,7,2) asc, movClave
									  select @Opci =  left(@mSA2,1)	--obtener el primer caracter
									  if @Opci='I' or  @Opci='i'
										begin
											exec  PreV2.RevisaDuplicados @mClaA2,@mSA2, @CveIn , 'DesgloseGeo', @cveAgruCoDesGeo
										end
									  else
									  begin
											  select @Pos3 =  patindex('%ManV2.%' , @mSA2)--Buscamos la posicion de la primera ,
											  select @cadSqlM = left(@mSA2, @Pos3 - 1)-- esquema
											  select @mSA2 =  stuff(@mSA2, 1, @Pos3+5, '')			--Y obtenemos los caracteres hasta esa posicion
											  set @cadSqlM1=  @cadSqlM + ' PreV2.' + @mSA2   --SUBSTRING (@mS,@Posicion+4,len(@mS) - (@Posicion + 4))
											  exec(@cadSqlM1)
											  update ManV2.movimientos SET movEstatus='P' where movClave=@mClaA2
									  end
								  end
							  --revisar agrupamiento
							  --select top 1 @CveGpo= Clagrupo from man.Clasificacion, man.EnlIndCla where claClave = eiclClaveClas  and eiclClaveInd = @CveIn 
							  while exists(select movClave,movsql  from ManV2.movimientos with(nolock) where  movCatalogo ='AgrupaCob' and movcomentario= @cveAgruCo  and  movEstatus='M' )
								  begin
									  select top 1 @mClaA2=movClave, @mSA2=movsql  from ManV2.movimientos with(nolock) where movCatalogo ='AgrupaCob'  and movcomentario= @cveAgruCo and  movEstatus='M' order by SUBSTRING(movFecha,7,4) asc, substring(movFecha,4,2) asc, SUBSTRING(movFecha,0,3) asc, substring(movhora,0,3) asc, substring(movhora,4,2) asc, substring(movhora,7,2) asc, movClave
									  select @Opci =  left(@mSA2,1)	--obtener el primer caracter
									  if @Opci='I' or  @Opci='i'
										begin
										print @cveAgruCo
											exec  PreV2.RevisaDuplicados @mClaA2,@mSA2, @CveIn , 'AgrupaCob', @cveAgruCo
										end
									  else
									  begin
										  select @Pos3 =  patindex('%ManV2.%' , @mSA2)--Buscamos la posicion de la primera ,
										  select @cadSqlM = left(@mSA2, @Pos3 - 1)-- esquema
										  select @mSA2 =  stuff(@mSA2, 1, @Pos3+5, '')			--Y obtenemos los caracteres hasta esa posicion
										  set @cadSqlM1=  @cadSqlM + ' PreV2.' + @mSA2   --SUBSTRING (@mS,@Posicion+4,len(@mS) - (@Posicion + 4))
										  exec(@cadSqlM1)
										  update ManV2.movimientos SET movEstatus='P' where movClave=@mClaA2
									  end
								  end
							 --revisar cambios en tipo de cobertura geográfica
							  Select top 1 @cobCveTipoCobGeo=cgCveTipoCobGeo from ManV2.CobGeo where cgClave= @cveAgruCoGeo
							   while exists(select movClave,movsql  from ManV2.movimientos with(nolock) where  movCatalogo ='TipoCobGeo' and movcomentario= @cobCveTipoCobGeo  and  movEstatus='M' )
								  begin
									  select top 1 @mClaA2=movClave, @mSA2=movsql  from ManV2.movimientos with(nolock) where movCatalogo ='TipoCobGeo'  and movcomentario= @cobCveTipoCobGeo and  movEstatus='M' order by SUBSTRING(movFecha,7,4) asc, substring(movFecha,4,2) asc, SUBSTRING(movFecha,0,3) asc, substring(movhora,0,3) asc, substring(movhora,4,2) asc, substring(movhora,7,2) asc, movClave
									  select @Opci =  left(@mSA2,1)	--obtener el primer caracter
									  if @Opci='I' or  @Opci='i'
										begin
											exec  PreV2.RevisaDuplicados @mClaA2,@mSA2, @CveIn , 'TipoCobGeo', @cobCveTipoCobGeo
										end
									  else
									  begin
											  select @Pos3 =  patindex('%ManV2.%' , @mSA2)--Buscamos la posicion de la primera ,
											  select @cadSqlM = left(@mSA2, @Pos3 - 1)-- esquema
											  select @mSA2 =  stuff(@mSA2, 1, @Pos3+5, '')			--Y obtenemos los caracteres hasta esa posicion
											  set @cadSqlM1=  @cadSqlM + ' PreV2.' + @mSA2   --SUBSTRING (@mS,@Posicion+4,len(@mS) - (@Posicion + 4))
											  exec(@cadSqlM1)
											  update ManV2.movimientos SET movEstatus='P' where movClave=@mClaA2
									  end
								  end
							  --revisar atributos de la cobertura
							  set @cadOrdCob= Convert(nvarchar(max),@cveSer) + '-' +  @cveAgruCo 
							  print 'AtrAgrupaCobPorInd'
							  print @cadOrdCob
							  while exists(select movClave,movsql  from ManV2.movimientos with(nolock) where  movCatalogo ='AtrAgrupaCobPorInd'  and (movComentario= @cadOrdCob or movComentario = Convert(nvarchar(max),@cveSer))  and  movEstatus='M' )
								  begin
									   print 'entre a AtrAgrupaCobPorInd'
									  select top 1 @mClaA2=movClave, @mSA2=movsql, @mComAgrCo= movComentario from ManV2.movimientos with(nolock) where movCatalogo ='AtrAgrupaCobPorInd'  and (movComentario= @cadOrdCob or movComentario = @cveSer ) and  movEstatus='M' order by SUBSTRING(movFecha,7,4) asc, substring(movFecha,4,2) asc, SUBSTRING(movFecha,0,3) asc, substring(movhora,0,3) asc, substring(movhora,4,2) asc, substring(movhora,7,2) asc, movClave
									  select @Opci =  left(@mSA2,1)	--obtener el primer caracter
									  print @Opci
									  if @Opci='I' or  @Opci='i'
										begin
											print 'Entrando de revisa duplicados AtrAgrupaCobPorInd'
											print @mClaA2
											print @mSA2
											print @cveAgruCo
											--exec  PreV2.RevisaDuplicados @mClaA2,@mSA2, @CveIn , 'AtrAgrupaClaPorInd', @cveAgruCl
											exec  PreV2.RevisaDuplicados @mClaA2,@mSA2, @CveIn  , 'AtrAgrupaCobPorInd', @mComAgrCo
										end
										else
										begin
											select @Pos3 =  patindex('%ManV2.%' , @mSA2)--Buscamos la posicion de la primera ,
											select @cadSqlM = left(@mSA2, @Pos3 - 1)-- esquema
											select @mSA2 =  stuff(@mSA2, 1, @Pos3+5, '')			--Y obtenemos los caracteres hasta esa posicion
											set @cadSqlM1=  @cadSqlM + ' PreV2.' + @mSA2   --SUBSTRING (@mS,@Posicion+4,len(@mS) - (@Posicion + 4))
											exec(@cadSqlM1)
											update ManV2.movimientos SET movEstatus='P' where movClave=@mClaA2
										end
								  end--while de movimientos atrAtribAgrupaCoInd
								--revisar nota del atributo de agrupamiento clasificacion
									 select top 1 @aacoNota  = aacoCveNota  from manv2.AtrAgrupaCobPorInd where aacoCveSer=@cveSer and aacoAgrCob= @cveAgruCo  --obtenemos la clave de nota del atributo de cobertura 
									 if @aacoNota IS not NULL and @aacoNota <> 0
									 begin
										while exists(select movClave,movsql  from ManV2.movimientos with(nolock) where  movCatalogo ='Notas'  and movComentario= @aacoNota and  movEstatus='M' )
										begin
										  select top 1 @mClaA2=movClave, @mSA2=movsql from ManV2.movimientos with(nolock) where movCatalogo ='Notas'  and movComentario= @aacoNota and  movEstatus='M' order by SUBSTRING(movFecha,7,4) asc, substring(movFecha,4,2) asc, SUBSTRING(movFecha,0,3) asc, substring(movhora,0,3) asc, substring(movhora,4,2) asc, substring(movhora,7,2) asc, movClave
										  select @Opci =  left(@mSA2,1)	--obtener el primer caracter
										  print @Opci
										  if @Opci='I' or  @Opci='i'
											begin
												print 'Entrando de revisa duplicados Notas en atributos de cobertura'
												print @mClaA2
												print @mSA2
												print @cveAgruCl
												--exec  PreV2.RevisaDuplicados @mClaA2,@mSA2, @CveIn , 'AtrAgrupaClaPorInd', @cveAgruCl
												exec  PreV2.RevisaDuplicados @mClaA2,@mSA2, @CveIn , 'Notas', @aacoNota
											end
											else
											begin
												select @Pos3 =  patindex('%ManV2.%' , @mSA2)--Buscamos la posicion de la primera ,
												select @cadSqlM = left(@mSA2, @Pos3 - 1)-- esquema
												select @mSA2 =  stuff(@mSA2, 1, @Pos3+5, '')			--Y obtenemos los caracteres hasta esa posicion
												set @cadSqlM1=  @cadSqlM + ' PreV2.' + @mSA2   --SUBSTRING (@mS,@Posicion+4,len(@mS) - (@Posicion + 4))
												exec(@cadSqlM1)
												update ManV2.movimientos SET movEstatus='P' where movClave=@mClaA2
											end
											
										end--while notas
									 end--if notas
							
							delete from @tablaAgrCo where cACo= @cveAgruCo
						  end--while exists(select * from @tablaAgrCo )
			 
					  
			delete from @tablaSer where c1= @cveSer	
		end
	end
	else --es borrado
	begin
	print 'entre en B'
	  insert into @tablaSer select atsClaveSerie from PreV2.AtrSerie with(nolock), PreV2.EnlSerInd with(nolock) where atsClaveSerie = esiClaveSerie and esiClaveInd = @CveIn 
		while exists(select * from @tablaSer )
		begin
		print 'Entre en while 1'
					select top 1 @cveSer = c1  from @tablaSer  
					select @cveDes = atsClaveDescrip, @cveFre = atsClaveFre, @cveNota = atsClaveNota, @cveFue = atsClaveFuente, @cveUni = atsClaveUnidad, @cveGra = atsTipoGra, @cveAgru2 = atsClaveAgrupaCob, @cveAgru = atsClaveAgrupaClas   from PreV2.AtrSerie with(nolock) where atsClaveSerie = @cveSer
					print @cveSer
					set @cadCat = 'Descripcion,Frecuencia,Notas,Fuentes,Unidad,Grafica,'
					WHILE patindex('%,%' , @cadCat) <> 0
					begin
						SELECT @Pos2 =  patindex('%,%' , @cadCat)
						--Buscamos la posicion de la primera ,
						SELECT @cadCD= left(@cadCat, @Pos2 - 1)--nombre de catalogo
						--Reemplazamos lo procesado con nada con la funcion stuff
						SELECT @cadCat = stuff(@cadCat, 1, @Pos2, '')
						if (@cadCD ='Descripcion' )
						begin set @cveGral= @cveDes	end
						if (@cadCD ='Frecuencia')
						begin set @cveGral= @cveFre	end
						if (@cadCD ='Notas')
						begin set @cveGral= @cveNota end
						if (@cadCD ='Fuentes')
						begin set @cveGral= @cveFue 	end
						if (@cadCD ='Unidad')
						begin set @cveGral= @cveUni	end
						if (@cadCD ='Grafica')
						begin set @cveGral= @cveGra	end
						if @cveGral <> 0
						begin
							while exists(select movClave,movsql  from ManV2.movimientos with(nolock) where movCatalogo=@cadCD and movcomentario= @cveGral  and  movEstatus='M' )
							begin
							select top 1 @mClaA2=movClave, @mSA2=movsql  from ManV2.movimientos with(nolock) where movCatalogo=@cadCD  and movcomentario= @cveGral and  movEstatus='M' order by SUBSTRING(movFecha,7,4) asc, substring(movFecha,4,2) asc, SUBSTRING(movFecha,0,3) asc, substring(movhora,0,3) asc, substring(movhora,4,2) asc, substring(movhora,7,2) asc, movClave
								select @Opci =  left(@mSA2,1)	--obtener el primer caracter
								if @Opci='I' or  @Opci='i'
								begin
									exec PreV2.RevisaDuplicados @mClaA2,@mSA2, @CveIn , @cadCD, @cveGral
								end
								else
								begin
									select @Pos3 =  patindex('%ManV2.%' , @mSA2)--Buscamos la posicion de la primera ,
									select @cadSqlM = left(@mSA2, @Pos3 - 1)-- esquema
									select @mSA2 =  stuff(@mSA2, 1, @Pos3+5, '')			--Y obtenemos los caracteres hasta esa posicion
									set @cadSqlM1=  @cadSqlM + ' PreV2.' + @mSA2   --SUBSTRING (@mS,@Posicion+4,len(@mS) - (@Posicion + 4))
									exec(@cadSqlM1)
									update ManV2.movimientos SET movEstatus='P' where movClave=@mClaA2
								end
							end
						end 
					end
					print 'notas'
					--revisar notas en datos
					--insert into @tablaNotasDatos select serNota from PreV2.Serie with(nolock) where serClave = @cveSer and serNota<>''
					insert into @tablaNotasDatos select distinct serNota from PreV2.Serie with(nolock) where serClave = @cveSer and serNota <>'' and serNota <>0
					while exists(select * from @tablaNotasDatos )--revisar notas que tiene el indicador en los datos se la serie
					begin
					print 'while notas 1'
					print @cveSer
						select top 1 @CveNotDato = CveNotDat  from @tablaNotasDatos --obtenemos la primer nota
						print @CveNotDato
						while exists(select movClave,movsql  from ManV2.movimientos with(nolock) where movCatalogo='Notas'  and movcomentario= @CveNotDato  and  movEstatus='M' )
						begin
						print 'while notas 2'
							select top 1 @mClaA2=movClave, @mSA2=movsql  from ManV2.movimientos with(nolock) where movCatalogo='Notas'  and movcomentario= @CveNotDato and  movEstatus='M' order by SUBSTRING(movFecha,7,4) asc, substring(movFecha,4,2) asc, SUBSTRING(movFecha,0,3) asc, substring(movhora,0,3) asc, substring(movhora,4,2) asc, substring(movhora,7,2) asc, movClave
							select @Opci =  left(@mSA2,1)	--obtener el primer caracter
							if @Opci='I' or  @Opci='i'
							begin
							   -- print 'Grupo: ' + @CveGpo
								exec  PreV2.RevisaDuplicados @mClaA2,@mSA2, @CveIn , 'Notas', @CveNotDato
							end
							else
							begin
							  select @Pos3 =  patindex('%ManV2.%' , @mSA2)--Buscamos la posicion de la primera ,
							  select @cadSqlM = left(@mSA2, @Pos3 - 1)-- esquema
							  select @mSA2 =  stuff(@mSA2, 1, @Pos3+5, '')			--Y obtenemos los caracteres hasta esa posicion
							  set @cadSqlM1=  @cadSqlM + ' PreV2.' + @mSA2   --SUBSTRING (@mS,@Posicion+4,len(@mS) - (@Posicion + 4))
							  exec(@cadSqlM1)
							  update ManV2.movimientos SET movEstatus='P' where movClave=@mClaA2
							end
						end
						delete from @tablaNotasDatos where CveNotDat = @CveNotDato
					end
					print 'revisar atributos de periodos'
					--revisar atributos de periodos 
					while exists(select movClave,movsql  from ManV2.movimientos with(nolock) where  movCatalogo ='AtrPeriodoPorInd'  and movComentario= Convert(nvarchar(255),@cveSer)  and  movEstatus='M' )
					begin
					  select top 1 @mClaA2=movClave, @mSA2=movsql from ManV2.movimientos with(nolock) where movCatalogo ='AtrPeriodoPorInd'  and movComentario = Convert(nvarchar(255),@cveSer)  and  movEstatus='M' order by SUBSTRING(movFecha,7,4) asc, substring(movFecha,4,2) asc, SUBSTRING(movFecha,0,3) asc, substring(movhora,0,3) asc, substring(movhora,4,2) asc, substring(movhora,7,2) asc, movClave
					  select @Opci =  left(@mSA2,1)	--obtener el primer caracter
					  print @Opci
					  if @Opci='I' or  @Opci='i'
					  begin
							print 'Entrando de revisa duplicados AtrPeriodoPorInd'
							print @mClaA2
							print @mSA2
							--exec  PreV2.RevisaDuplicados @mClaA2,@mSA2, @CveIn , 'AtrAgrupaClaPorInd', @cveAgruCl
							exec  PreV2.RevisaDuplicados @mClaA2,@mSA2, @CveIn, 'AtrPeriodoPorInd', @cveSer
						end
						else
						begin
							select @Pos3 =  patindex('%ManV2.%' , @mSA2)--Buscamos la posicion de la primera ,
							select @cadSqlM = left(@mSA2, @Pos3 - 1)-- esquema
							select @mSA2 =  stuff(@mSA2, 1, @Pos3+5, '')			--Y obtenemos los caracteres hasta esa posicion
							set @cadSqlM1=  @cadSqlM + ' PreV2.' + @mSA2   --SUBSTRING (@mS,@Posicion+4,len(@mS) - (@Posicion + 4))
							exec(@cadSqlM1)
							update ManV2.movimientos SET movEstatus='P' where movClave=@mClaA2
						end
					 end--while de movimientos AtrPeriodoPorInd
					 print 'revisar notas en periodos'
					 --revisar notas en periodos
					 insert into @tablaNotasPer select distinct apiCveNota   from PreV2.AtrPeriodoPorInd with(nolock)  where apiCveSer = @cveSer
					 while exists(select * from @tablaNotasPer)
					 begin
						 select top 1 @apiNota  = CveNotPer  from @tablaNotasPer  
							while exists(select movClave,movsql  from ManV2.movimientos with(nolock) where  movCatalogo ='Notas'  and movComentario= @apiNota and  movEstatus='M' )
							begin
							  select top 1 @mClaA2=movClave, @mSA2=movsql from ManV2.movimientos with(nolock) where movCatalogo ='Notas'  and movComentario= @apiNota and  movEstatus='M' order by SUBSTRING(movFecha,7,4) asc, substring(movFecha,4,2) asc, SUBSTRING(movFecha,0,3) asc, substring(movhora,0,3) asc, substring(movhora,4,2) asc, substring(movhora,7,2) asc, movClave
							  select @Opci =  left(@mSA2,1)	--obtener el primer caracter
							  print @Opci
							  if @Opci='I' or  @Opci='i'
							  begin
								print 'Entrando de revisa duplicados Notas en Periodo'
								print @mClaA2
								print @mSA2
								exec  PreV2.RevisaDuplicados @mClaA2,@mSA2, @CveIn , 'Notas', @apiNota
							  end
							  else
							  begin
									select @Pos3 =  patindex('%ManV2.%' , @mSA2)--Buscamos la posicion de la primera ,
									select @cadSqlM = left(@mSA2, @Pos3 - 1)-- esquema
									select @mSA2 =  stuff(@mSA2, 1, @Pos3+5, '')			--Y obtenemos los caracteres hasta esa posicion
									set @cadSqlM1=  @cadSqlM + ' PreV2.' + @mSA2   --SUBSTRING (@mS,@Posicion+4,len(@mS) - (@Posicion + 4))
									exec(@cadSqlM1)
									update ManV2.movimientos SET movEstatus='P' where movClave=@mClaA2
							  end
							end--while notas
						 delete from @tablaNotasPer  where CveNotPer = @apiNota	
					end--while de @tablaNotasPer
					
				 -- tipo de cuadro para revisar el grupo y clasificaciones
					--if  @cveAgru IS NULL or @cveAgru <> '0'
					print @cveAgru
					if  @cveAgru IS not NULL or @cveAgru <> '0'
					begin
					print 'entre a agrupaclas'
						--insert into @tablaCveAgr select atrClaveAgrupaClas  from Man.AtrIndicador where atrClaveInd = @CveIn--obtener clave de agrupamiento de clasificaciones
						
						  insert into @tablaGp select distinct acCveGpo   from PreV2.AgrupaClas with(nolock)  where acClave like @cveAgru + '%'  and LEN(acClave)>3
						  while exists(select * from @TablaGp )--revisar Grupos que tiene el indicador
						  begin
						 
							--insert into @tablaClas select gpoClave, claClave,claClaveDescrip from man.Grupo, man.Clasificacion, man.EnlIndCla where claClave = eiclClaveClas and claGrupo = gpoClave and eiclClaveInd = @CveIn 
							  select top 1 @CveGpo = cG  from @TablaGp --obtenemos el primer grupo 
							 -- print @CveGpo
							  insert into @tablaDesClas  select  claClave, claClaveDescrip  from PreV2.Clasificacion with(nolock) where claGrupo = @CveGpo--obtener las descripciones de las clasificaciones
							  --select top 1 @CveGpo= Clagrupo from man.Clasificacion, man.EnlIndCla where claClave = eiclClaveClas  and eiclClaveInd = @CveIn 
							  while exists(select movClave,movsql  from ManV2.movimientos with(nolock) where movCatalogo='Grupo'  and movcomentario= @CveGpo  and  movEstatus='M' )
								  begin
									  --select top 1 @mClaA2=movClave, @mSA2=movsql  from man.movimientos where (movCatalogo='Grupo' or movCatalogo ='Clasificacion' or movCatalogo ='AgrupaClas')  and movcomentario= @CveGpo and  movEstatus='M' order by SUBSTRING(movFecha,7,4) asc, substring(movFecha,4,2) asc, SUBSTRING(movFecha,0,3) asc, substring(movhora,0,3) asc, substring(movhora,4,2) asc, substring(movhora,7,2) asc, movClave
									  select top 1 @mClaA2=movClave, @mSA2=movsql  from ManV2.movimientos with(nolock) where movCatalogo='Grupo'  and movcomentario= @CveGpo and  movEstatus='M' order by SUBSTRING(movFecha,7,4) asc, substring(movFecha,4,2) asc, SUBSTRING(movFecha,0,3) asc, substring(movhora,0,3) asc, substring(movhora,4,2) asc, substring(movhora,7,2) asc, movClave
									  select @Opci =  left(@mSA2,1)	--obtener el primer caracter

									  if @Opci='I' or  @Opci='i'
										begin
										   -- print 'Grupo: ' + @CveGpo
											exec  PreV2.RevisaDuplicados @mClaA2,@mSA2, @CveIn , 'Grupo', @CveGpo
										end
										else
										begin
										  select @Pos3 =  patindex('%ManV2.%' , @mSA2)--Buscamos la posicion de la primera ,
										  select @cadSqlM = left(@mSA2, @Pos3 - 1)-- esquema
										  select @mSA2 =  stuff(@mSA2, 1, @Pos3+5, '')			--Y obtenemos los caracteres hasta esa posicion
										  set @cadSqlM1=  @cadSqlM + ' PreV2.' + @mSA2   --SUBSTRING (@mS,@Posicion+4,len(@mS) - (@Posicion + 4))
										  exec(@cadSqlM1)
										  update ManV2.movimientos SET movEstatus='P' where movClave=@mClaA2
									  end
								  end
								   --Descripciones de clasificaciones
							   while exists(select * from @tablaDesClas )
							   begin
								  select top 1 @cveDesCl  = cveDs  from @TablaDesClas --obtenemos la primer clasificacion
								  while exists(select movClave,movsql  from ManV2.movimientos with(nolock) where movCatalogo='Descripcion' and movcomentario= @cveDesCl  and  movEstatus='M' )
									  begin
										  select top 1 @mClaA2=movClave, @mSA2=movsql  from ManV2.movimientos with(nolock) where movCatalogo='Descripcion' and movcomentario= @cveDesCl and  movEstatus='M' order by SUBSTRING(movFecha,7,4) asc, substring(movFecha,4,2) asc, SUBSTRING(movFecha,0,3) asc, substring(movhora,0,3) asc, substring(movhora,4,2) asc, substring(movhora,7,2) asc, movClave
										  select @Opci =  left(@mSA2,1)	--obtener el primer caracter
										  if @Opci='I' or  @Opci='i'
											begin
												exec  PreV2.RevisaDuplicados @mClaA2,@mSA2, @CveIn , 'Descripcion', @cveDesCl
											end
											else
											begin
												select @Pos3 =  patindex('%ManV2.%' , @mSA2)--Buscamos la posicion de la primera ,
												select @cadSqlM = left(@mSA2, @Pos3 - 1)-- esquema
												select @mSA2 =  stuff(@mSA2, 1, @Pos3+5, '')			--Y obtenemos los caracteres hasta esa posicion
												set @cadSqlM1=  @cadSqlM + ' PreV2.' + @mSA2   --SUBSTRING (@mS,@Posicion+4,len(@mS) - (@Posicion + 4))
												exec(@cadSqlM1)
												update ManV2.movimientos SET movEstatus='P' where movClave=@mClaA2
											end
										  
									  end--while
								  ---Claves de clasificaciones
								print 'entre a clasificaciones'  
								  while exists(select movClave,movsql  from ManV2.movimientos with(nolock) where movCatalogo='Clasificacion' and movcomentario= @CveGpo  and  movEstatus='M' )
									  begin
										  select top 1 @mClaA2=movClave, @mSA2=movsql  from ManV2.movimientos with(nolock) where movCatalogo='Clasificacion' and movcomentario= @CveGpo  and  movEstatus='M' order by SUBSTRING(movFecha,7,4) asc, substring(movFecha,4,2) asc, SUBSTRING(movFecha,0,3) asc, substring(movhora,0,3) asc, substring(movhora,4,2) asc, substring(movhora,7,2) asc, movClave
										  select @Opci =  left(@mSA2,1)	--obtener el primer caracter
										  
										  if @Opci='I' or  @Opci='i'
											begin
												--print 'Clasificacion:' + @CveGpo
												exec  PreV2.RevisaDuplicados @mClaA2,@mSA2, @CveIn , 'Clasificacion', @CveGpo
											end
											else
											begin
												select @Pos3 =  patindex('%ManV2.%' , @mSA2)--Buscamos la posicion de la primera ,
												select @cadSqlM = left(@mSA2, @Pos3 - 1)-- esquema
												select @mSA2 =  stuff(@mSA2, 1, @Pos3+5, '')			--Y obtenemos los caracteres hasta esa posicion
												set @cadSqlM1=  @cadSqlM + ' PreV2.' + @mSA2   --SUBSTRING (@mS,@Posicion+4,len(@mS) - (@Posicion + 4))
												exec(@cadSqlM1)
												update ManV2.movimientos SET movEstatus='P' where movClave=@mClaA2
											end
										  
									  end--while
									  print 'Descripcion de clas'
									  print @cveDesCl
									delete from @TablaDesClas where cveDs = @cveDesCl	
								  end--while tabladesClas
								   --revisa el caso especial de agrupaClas con clave de grupo en el movcomentario
								  set @CveGpoClas = 'U' + Convert(nvarchar(255),@CveGpo) 
								  while exists(select movClave,movsql  from ManV2.movimientos with(nolock) where  movCatalogo ='AgrupaClas' and movcomentario=  @CveGpoClas  and  movEstatus='M' )
								  begin
									  
									  select top 1 @mClaA2=movClave, @mSA2=movsql  from ManV2.movimientos with(nolock) where movCatalogo ='AgrupaClas'  and movcomentario= @CveGpoClas and  movEstatus='M' order by SUBSTRING(movFecha,7,4) asc, substring(movFecha,4,2) asc, SUBSTRING(movFecha,0,3) asc, substring(movhora,0,3) asc, substring(movhora,4,2) asc, substring(movhora,7,2) asc, movClave
									  select @Pos3 =  patindex('%ManV2.%' , @mSA2)--Buscamos la posicion de la primera ,
									  select @cadSqlM = left(@mSA2, @Pos3 - 1)-- esquema
									  select @mSA2 =  stuff(@mSA2, 1, @Pos3+5, '')			--Y obtenemos los caracteres hasta esa posicion
									  set @cadSqlM1=  @cadSqlM + ' PreV2.' + @mSA2   --SUBSTRING (@mS,@Posicion+4,len(@mS) - (@Posicion + 4))
									  exec(@cadSqlM1)
									  update ManV2.movimientos SET movEstatus='P' where movClave=@mClaA2
								  end
								  print 'grupo'
								  print @CveGpo
								 delete from @TablaGp where cG= @CveGpo
						end--fin del clave de grupo
						print 'entre a agrupaclas2'
						  --revisa Agrupamiento por clave '010', '010010'...
						  --select distinct acClave from PreV2.AgrupaClas, PreV2.EnlIndCla2  where acClave= eiclClaveAgrupa and eiclClaveInd  = 54 or acClave like '020%'
						 -- select top 1 @cveAgru  = cCA  from @tablaCveAgr 
						 
						  insert into @tablaAgr select distinct acClave from PreV2.AgrupaClas with(nolock) where acClave like @cveAgru + '%' --'%'+ @titulo +'%'
						  while exists(select * from @tablaAgr )--revisar Agrupamiento del indicador
						  begin
							--insert into @tablaClas select gpoClave, claClave,claClaveDescrip from man.Grupo, man.Clasificacion, man.EnlIndCla where claClave = eiclClaveClas and claGrupo = gpoClave and eiclClaveInd = @CveIn 
							  select top 1 @cveAgruCl  = cA  from @tablaAgr --obtenemos la primer clave del agrupamiento 
							  --select top 1 @CveGpo= Clagrupo from man.Clasificacion, man.EnlIndCla where claClave = eiclClaveClas  and eiclClaveInd = @CveIn 
							  while exists(select movClave,movsql  from ManV2.movimientos with(nolock) where  movCatalogo ='AgrupaClas' and movcomentario= @cveAgruCl  and  movEstatus='M' )
								  begin
									  
									  select top 1 @mClaA2=movClave, @mSA2=movsql  from ManV2.movimientos with(nolock) where movCatalogo ='AgrupaClas'  and movcomentario= @cveAgruCl and  movEstatus='M' order by SUBSTRING(movFecha,7,4) asc, substring(movFecha,4,2) asc, SUBSTRING(movFecha,0,3) asc, substring(movhora,0,3) asc, substring(movhora,4,2) asc, substring(movhora,7,2) asc, movClave
									  select @Opci =  left(@mSA2,1)	--obtener el primer caracter
									  print @Opci
									  if @Opci='I' or  @Opci='i'
										begin
											print 'Entrando de revisa duplicados agrupaclas'
											print @mClaA2
											print @mSA2
											print @cveAgruCl
											exec  PreV2.RevisaDuplicados @mClaA2,@mSA2, @CveIn , 'AgrupaClas', @cveAgruCl
										end
										else
										begin
											select @Pos3 =  patindex('%ManV2.%' , @mSA2)--Buscamos la posicion de la primera ,
											select @cadSqlM = left(@mSA2, @Pos3 - 1)-- esquema
											select @mSA2 =  stuff(@mSA2, 1, @Pos3+5, '')			--Y obtenemos los caracteres hasta esa posicion
											set @cadSqlM1=  @cadSqlM + ' PreV2.' + @mSA2   --SUBSTRING (@mS,@Posicion+4,len(@mS) - (@Posicion + 4))
											exec(@cadSqlM1)
											update ManV2.movimientos SET movEstatus='P' where movClave=@mClaA2
										end
									  
								  end
								  print 'Agrupaclas'
								  print @cveAgruCl
								  set @cadOrdClaC= Convert(nvarchar(max),@cveSer) + '-' + @cveAgruCl + 'C'
								  set @cadOrdClaG= Convert(nvarchar(max),@cveSer) + '-' + @cveAgruCl + 'G'
								  print @cadOrdClaC 
								  print @cadOrdClaG
								-- Buscar movimientos en AtrAgrupaClaPorInd   -- ordenamiento de clasifciaciones
								while exists(select movClave,movsql  from ManV2.movimientos with(nolock) where  movCatalogo ='AtrAgrupaClaPorInd'  and (movComentario= @cadOrdClaC or movComentario= @cadOrdClaG or movComentario= Convert(nvarchar(max),@cveSer))  and  movEstatus='M' )
								  begin
								  --set @mSA2=''
									  print 'Mov-Agrupaclas'
									  --select top 1 @mClaA2=movClave, @mSA3=movSQL, @mComAgrCl= movComentario  from ManV2.movimientos with(nolock) where movCatalogo ='AtrAgrupaClaPorInd'  and (movComentario= @cadOrdClaC or movComentario= @cadOrdClaG) and  movEstatus='M' order by SUBSTRING(movFecha,7,4) asc, substring(movFecha,4,2) asc, SUBSTRING(movFecha,0,3) asc, substring(movhora,0,3) asc, substring(movhora,4,2) asc, substring(movhora,7,2) asc, movClave
									  select top 1 @mClaA2=movClave, @mSA3=movsql, @mComAgrCl= movComentario from ManV2.movimientos with(nolock) where movCatalogo ='AtrAgrupaClaPorInd'  and (movComentario= @cadOrdClaC or  movComentario=@cadOrdClaG or movComentario = Convert(nvarchar(max),@cveSer)) and  movEstatus='M' order by SUBSTRING(movFecha,7,4) asc, substring(movFecha,4,2) asc, SUBSTRING(movFecha,0,3) asc, substring(movhora,0,3) asc, substring(movhora,4,2) asc, substring(movhora,7,2) asc, movClave
									  print @mSA3
									  print @mClaA2
									  select @Opci =  left(@mSA3,1)	--obtener el primer caracter
									  print @Opci
									  if @Opci='I' or  @Opci='i'
										begin
											print 'Entrando de revisa duplicados AtrAgrupaClaPorInd'
											print @mClaA2
											print @mSA3
											print @cveAgruCl
											--exec  PreV2.RevisaDuplicados @mClaA2,@mSA2, @CveIn , 'AtrAgrupaClaPorInd', @cveAgruCl
											exec  PreV2.RevisaDuplicados @mClaA2,@mSA3, @CveIn  , 'AtrAgrupaClaPorInd', @mComAgrCl
										end
										else
										begin
											select @Pos3 =  patindex('%ManV2.%' , @mSA3)--Buscamos la posicion de la primera ,
											select @cadSqlM = left(@mSA3, @Pos3 - 1)-- esquema
											select @mSA3 =  stuff(@mSA3, 1, @Pos3+5, '')			--Y obtenemos los caracteres hasta esa posicion
											set @cadSqlM1=  @cadSqlM + ' PreV2.' + @mSA3   --SUBSTRING (@mS,@Posicion+4,len(@mS) - (@Posicion + 4))
											exec(@cadSqlM1)
											update ManV2.movimientos SET movEstatus='P' where movClave=@mClaA2
										end
									  
								  end 
								   --revisar nota del atributo de agrupamiento clasificacion
								
									 select top 1 @aaclNota  = aaclCveNota  from prev2.AtrAgrupaClaPorInd where aaclCveSer=@cveSer and aaclAgrCla= @cveAgruCl --obtenemos la clave de nota del atributo de clasificacion 
									 if @aaclNota IS not NULL and @aaclNota <> 0
									 begin
										while exists(select movClave,movsql  from ManV2.movimientos with(nolock) where  movCatalogo ='Notas'  and movComentario= @aaclNota and  movEstatus='M' )
										begin
										  select top 1 @mClaA2=movClave, @mSA2=movsql from ManV2.movimientos with(nolock) where movCatalogo ='Notas'  and movComentario= @aaclNota and  movEstatus='M' order by SUBSTRING(movFecha,7,4) asc, substring(movFecha,4,2) asc, SUBSTRING(movFecha,0,3) asc, substring(movhora,0,3) asc, substring(movhora,4,2) asc, substring(movhora,7,2) asc, movClave
										  select @Opci =  left(@mSA2,1)	--obtener el primer caracter
										  print @Opci
										  if @Opci='I' or  @Opci='i'
											begin
												print 'Entrando de revisa duplicados Notas'
												print @mClaA2
												print @mSA2
												print @cveAgruCl
												--exec  PreV2.RevisaDuplicados @mClaA2,@mSA2, @CveIn , 'AtrAgrupaClaPorInd', @cveAgruCl
												exec  PreV2.RevisaDuplicados @mClaA2,@mSA2, @CveIn , 'Notas', @aaclNota
											end
											else
											begin
												select @Pos3 =  patindex('%ManV2.%' , @mSA2)--Buscamos la posicion de la primera ,
												select @cadSqlM = left(@mSA2, @Pos3 - 1)-- esquema
												select @mSA2 =  stuff(@mSA2, 1, @Pos3+5, '')			--Y obtenemos los caracteres hasta esa posicion
												set @cadSqlM1=  @cadSqlM + ' PreV2.' + @mSA2   --SUBSTRING (@mS,@Posicion+4,len(@mS) - (@Posicion + 4))
												exec(@cadSqlM1)
												update ManV2.movimientos SET movEstatus='P' where movClave=@mClaA2
											end
											
										end--while notas
									 end--if notas
								delete from @TablaAgr where cA= @cveAgruCl
						  end
						 
					  end--end del if (@Tipocua = 'CoCl' or @Tipocua = 'ACl' or @Tipocua = 'ClS' or @Tipocua = 'ClA')
					  --Agrupamiento de coberturas
					  --if (@Tipocua = 'CoCl' or @Tipocua = 'CoS')
					 -- begin
						--  insert into @tablaCveAgrCo select atrClaveAgrupaCob  from Man.AtrIndicador where atrClaveInd = @CveIn--obtener clave de agrupamiento de cobertura
						--revisa Agrupamiento cobertura por clave '010', '010010'...
						  --select distinct acClave from PreV2.AgrupaClas, PreV2.EnlIndCla2  where acClave= eiclClaveAgrupa and eiclClaveInd  = 54 or acClave like '020%'
						 -- select top 1 @cveAgru2  = cCACo  from @tablaCveAgrCo--clave general del agrupamiento 010,020, etc
						 print 'entre a agrupaCob'
						 print @cveAgru2
						  insert into @tablaAgrCo select distinct acoClave,acoCveGeo, acoCveDesGeo from PreV2.AgrupaCob with(nolock) where  acoClave like @cveAgru2 + '___%' --'%'+ @titulo +'%'
						  while exists(select * from @tablaAgrCo )--revisar Agrupamiento de coberturas del indicador
						  begin
							 
							   print 'entre a agrupaCob while 1'
							--insert into @tablaClas select gpoClave, claClave,claClaveDescrip from man.Grupo, man.Clasificacion, man.EnlIndCla where claClave = eiclClaveClas and claGrupo = gpoClave and eiclClaveInd = @CveIn 
							  select top 1 @cveAgruCo  = cACo, @cveAgruCoGeo = cACoGeo, @cveAgruCoDesGeo = cACoDes from @tablaAgrCo 
							  --select top 1 @cveAgruCo  = cACo, @cveAgruCoGeo = cACoGeo, @cveAgruCoDesGeo = cACoDes from @tablaAgrCo  --obtenemos la primer clave del agrupamiento de coberturas
							   --revisar coberturas
							   print @cveAgruCoGeo
							  while exists(select movClave,movsql  from ManV2.movimientos with(nolock) where  movCatalogo ='CobGeo' and movcomentario= Convert(nvarchar(max),@cveAgruCoGeo)  and  movEstatus='M' )
								  begin
								  print 'entre a agrupaCob while 2'
									  select top 1 @mClaA2=movClave, @mSA2=movsql  from ManV2.movimientos with(nolock) where movCatalogo ='CobGeo'  and movcomentario= Convert(nvarchar(max),@cveAgruCoGeo) and  movEstatus='M' order by SUBSTRING(movFecha,7,4) asc, substring(movFecha,4,2) asc, SUBSTRING(movFecha,0,3) asc, substring(movhora,0,3) asc, substring(movhora,4,2) asc, substring(movhora,7,2) asc, movClave
									  select @Opci =  left(@mSA2,1)	--obtener el primer caracter
									  if @Opci='I' or  @Opci='i'
										begin
											exec  PreV2.RevisaDuplicados @mClaA2,@mSA2, @CveIn , 'CobGeo', @cveAgruCoGeo
										end
										else
										begin
											  select @Pos3 =  patindex('%ManV2.%' , @mSA2)--Buscamos la posicion de la primera ,
											  select @cadSqlM = left(@mSA2, @Pos3 - 1)-- esquema
											  select @mSA2 =  stuff(@mSA2, 1, @Pos3+5, '')			--Y obtenemos los caracteres hasta esa posicion
											  set @cadSqlM1=  @cadSqlM + ' PreV2.' + @mSA2   --SUBSTRING (@mS,@Posicion+4,len(@mS) - (@Posicion + 4))
											  exec(@cadSqlM1)
											  update ManV2.movimientos SET movEstatus='P' where movClave=@mClaA2
										end
								  end
							  --revisa desgloseGEo
							  while exists(select movClave,movsql  from ManV2.movimientos with(nolock) where  movCatalogo ='DesgloseGeo' and movcomentario= Convert(nvarchar(max),@cveAgruCoDesGeo)  and  movEstatus='M' )
								  begin
									  select top 1 @mClaA2=movClave, @mSA2=movsql  from ManV2.movimientos with(nolock) where movCatalogo ='DesgloseGeo'  and movcomentario= Convert(nvarchar(max),@cveAgruCoDesGeo) and  movEstatus='M' order by SUBSTRING(movFecha,7,4) asc, substring(movFecha,4,2) asc, SUBSTRING(movFecha,0,3) asc, substring(movhora,0,3) asc, substring(movhora,4,2) asc, substring(movhora,7,2) asc, movClave
									  select @Opci =  left(@mSA2,1)	--obtener el primer caracter
									  if @Opci='I' or  @Opci='i'
										begin
											exec  PreV2.RevisaDuplicados @mClaA2,@mSA2, @CveIn , 'DesgloseGeo', @cveAgruCoDesGeo
										end
									  else
									  begin
											  select @Pos3 =  patindex('%ManV2.%' , @mSA2)--Buscamos la posicion de la primera ,
											  select @cadSqlM = left(@mSA2, @Pos3 - 1)-- esquema
											  select @mSA2 =  stuff(@mSA2, 1, @Pos3+5, '')			--Y obtenemos los caracteres hasta esa posicion
											  set @cadSqlM1=  @cadSqlM + ' PreV2.' + @mSA2   --SUBSTRING (@mS,@Posicion+4,len(@mS) - (@Posicion + 4))
											  exec(@cadSqlM1)
											  update ManV2.movimientos SET movEstatus='P' where movClave=@mClaA2
									  end
								  end
							  --revisar agrupamiento
							  --select top 1 @CveGpo= Clagrupo from man.Clasificacion, man.EnlIndCla where claClave = eiclClaveClas  and eiclClaveInd = @CveIn 
							  while exists(select movClave,movsql  from ManV2.movimientos with(nolock) where  movCatalogo ='AgrupaCob' and movcomentario= Convert(nvarchar(max),@cveAgruCo)  and  movEstatus='M' )
								  begin
									  select top 1 @mClaA2=movClave, @mSA2=movsql  from ManV2.movimientos with(nolock) where movCatalogo ='AgrupaCob'  and movcomentario= Convert(nvarchar(max),@cveAgruCo) and  movEstatus='M' order by SUBSTRING(movFecha,7,4) asc, substring(movFecha,4,2) asc, SUBSTRING(movFecha,0,3) asc, substring(movhora,0,3) asc, substring(movhora,4,2) asc, substring(movhora,7,2) asc, movClave
									  select @Opci =  left(@mSA2,1)	--obtener el primer caracter
									  if @Opci='I' or  @Opci='i'
										begin
										print @cveAgruCo
											exec  PreV2.RevisaDuplicados @mClaA2,@mSA2, @CveIn , 'AgrupaCob', @cveAgruCo
										end
									  else
									  begin
										  select @Pos3 =  patindex('%ManV2.%' , @mSA2)--Buscamos la posicion de la primera ,
										  select @cadSqlM = left(@mSA2, @Pos3 - 1)-- esquema
										  select @mSA2 =  stuff(@mSA2, 1, @Pos3+5, '')			--Y obtenemos los caracteres hasta esa posicion
										  set @cadSqlM1=  @cadSqlM + ' PreV2.' + @mSA2   --SUBSTRING (@mS,@Posicion+4,len(@mS) - (@Posicion + 4))
										  exec(@cadSqlM1)
										  update ManV2.movimientos SET movEstatus='P' where movClave=@mClaA2
									  end
								  end
								  print 'tipo de cobertura'
							 --revisar cambios en tipo de cobertura geográfica
							  Select top 1 @cobCveTipoCobGeo=cgCveTipoCobGeo from PreV2.CobGeo where cgClave= @cveAgruCoGeo
							   while exists(select movClave,movsql  from ManV2.movimientos with(nolock) where  movCatalogo ='TipoCobGeo' and movcomentario= Convert(nvarchar(max),@cobCveTipoCobGeo)  and  movEstatus='M' )
								  begin
									  select top 1 @mClaA2=movClave, @mSA2=movsql  from ManV2.movimientos with(nolock) where movCatalogo ='TipoCobGeo'  and movcomentario= Convert(nvarchar(max),@cobCveTipoCobGeo) and  movEstatus='M' order by SUBSTRING(movFecha,7,4) asc, substring(movFecha,4,2) asc, SUBSTRING(movFecha,0,3) asc, substring(movhora,0,3) asc, substring(movhora,4,2) asc, substring(movhora,7,2) asc, movClave
									  select @Opci =  left(@mSA2,1)	--obtener el primer caracter
									  if @Opci='I' or  @Opci='i'
										begin
											exec  PreV2.RevisaDuplicados @mClaA2,@mSA2, @CveIn , 'TipoCobGeo', @cobCveTipoCobGeo
										end
									  else
									  begin
											  select @Pos3 =  patindex('%ManV2.%' , @mSA2)--Buscamos la posicion de la primera ,
											  select @cadSqlM = left(@mSA2, @Pos3 - 1)-- esquema
											  select @mSA2 =  stuff(@mSA2, 1, @Pos3+5, '')			--Y obtenemos los caracteres hasta esa posicion
											  set @cadSqlM1=  @cadSqlM + ' PreV2.' + @mSA2   --SUBSTRING (@mS,@Posicion+4,len(@mS) - (@Posicion + 4))
											  exec(@cadSqlM1)
											  update ManV2.movimientos SET movEstatus='P' where movClave=@mClaA2
									  end
								  end
							  
							  ----------------------------------------------------
							  --revisar atributos de la cobertura
							  set @cadOrdCob= Convert(nvarchar(max),@cveSer) + '-' +  @cveAgruCo 
							  
							  while exists(select movClave,movsql  from ManV2.movimientos with(nolock) where  movCatalogo ='AtrAgrupaCobPorInd'  and (movComentario= @cadOrdCob or movComentario = Convert(nvarchar(max),@cveSer))  and  movEstatus='M' )
								  begin
									  
									  select top 1 @mClaA2=movClave, @mSA2=movsql, @mComAgrCo= movComentario from ManV2.movimientos with(nolock) where movCatalogo ='AtrAgrupaCobPorInd'  and (movComentario= @cadOrdCob or movComentario = Convert(nvarchar(max),@cveSer) ) and  movEstatus='M' order by SUBSTRING(movFecha,7,4) asc, substring(movFecha,4,2) asc, SUBSTRING(movFecha,0,3) asc, substring(movhora,0,3) asc, substring(movhora,4,2) asc, substring(movhora,7,2) asc, movClave
									  select @Opci =  left(@mSA2,1)	--obtener el primer caracter
									  print @Opci
									  if @Opci='I' or  @Opci='i'
										begin
											print 'Entrando de revisa duplicados AtrAgrupaCobPorInd'
											print @mClaA2
											print @mSA2
											print @cveAgruCo
											--exec  PreV2.RevisaDuplicados @mClaA2,@mSA2, @CveIn , 'AtrAgrupaClaPorInd', @cveAgruCl
											exec  PreV2.RevisaDuplicados @mClaA2,@mSA2, @CveIn  , 'AtrAgrupaCobPorInd', @mComAgrCo
										end
										else
										begin
											select @Pos3 =  patindex('%ManV2.%' , @mSA2)--Buscamos la posicion de la primera ,
											select @cadSqlM = left(@mSA2, @Pos3 - 1)-- esquema
											select @mSA2 =  stuff(@mSA2, 1, @Pos3+5, '')			--Y obtenemos los caracteres hasta esa posicion
											set @cadSqlM1=  @cadSqlM + ' PreV2.' + @mSA2   --SUBSTRING (@mS,@Posicion+4,len(@mS) - (@Posicion + 4))
											exec(@cadSqlM1)
											update ManV2.movimientos SET movEstatus='P' where movClave=@mClaA2
										end
								  end--while de movimientos atrAtribAgrupaCoInd
								--revisar nota del atributo de agrupamiento clasificacion
									 select top 1 @aacoNota  = aacoCveNota  from prev2.AtrAgrupaCobPorInd where aacoCveSer=@cveSer and aacoAgrCob= @cveAgruCl --obtenemos la clave de nota del atributo de cobertura 
									 if @aaclNota IS not NULL and @aaclNota <> 0
									 begin
										while exists(select movClave,movsql  from ManV2.movimientos with(nolock) where  movCatalogo ='Notas'  and movComentario= Convert(nvarchar(max),@aacoNota) and  movEstatus='M' )
										begin
										  select top 1 @mClaA2=movClave, @mSA2=movsql from ManV2.movimientos with(nolock) where movCatalogo ='Notas'  and movComentario= Convert(nvarchar(max),@aacoNota) and  movEstatus='M' order by SUBSTRING(movFecha,7,4) asc, substring(movFecha,4,2) asc, SUBSTRING(movFecha,0,3) asc, substring(movhora,0,3) asc, substring(movhora,4,2) asc, substring(movhora,7,2) asc, movClave
										  select @Opci =  left(@mSA2,1)	--obtener el primer caracter
										  print @Opci
										  if @Opci='I' or  @Opci='i'
											begin
												print 'Entrando de revisa duplicados Notas en atributos de cobertura'
												print @mClaA2
												print @mSA2
												print @cveAgruCl
												--exec  PreV2.RevisaDuplicados @mClaA2,@mSA2, @CveIn , 'AtrAgrupaClaPorInd', @cveAgruCl
												exec  PreV2.RevisaDuplicados @mClaA2,@mSA2, @CveIn , 'Notas', @aacoNota
											end
											else
											begin
												select @Pos3 =  patindex('%ManV2.%' , @mSA2)--Buscamos la posicion de la primera ,
												select @cadSqlM = left(@mSA2, @Pos3 - 1)-- esquema
												select @mSA2 =  stuff(@mSA2, 1, @Pos3+5, '')			--Y obtenemos los caracteres hasta esa posicion
												set @cadSqlM1=  @cadSqlM + ' PreV2.' + @mSA2   --SUBSTRING (@mS,@Posicion+4,len(@mS) - (@Posicion + 4))
												exec(@cadSqlM1)
												update ManV2.movimientos SET movEstatus='P' where movClave=@mClaA2
											end
											
										end--while notas
									 end--if notas
			  
							print 'Agrupa Cob'
							print @cveAgruCo
							delete from @tablaAgrCo where cACo= @cveAgruCo
						  end
					  --end
					  
				print 'Serie'
				print @cveSer
			delete from @tablaSer where c1= @cveSer	
		end
	end
END

GO



GO

/******StoredProcedure [PreV2].[RevisaCamArb]  ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [PreV2].[RevisaCamArb] 
	-- Add the parameters for the stored procedure here
	@CveIn int,
	@CveAr nvarchar(MAX),
	@TPro varchar(2)
AS
BEGIN
SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED
declare @mClaA int,@mClaA2 int, @mIA int 
declare @mSA nvarchar(MAX),@mSA2 nvarchar(MAX),@Opci nvarchar(1),@returnErrorA varchar(Max),@msgA nvarchar(Max) --@CveAr varchar(50),
declare @cadSqlM nvarchar(Max)
declare @cadSqlM1 nvarchar(Max),@cveDA varchar(20),@CveMd nvarchar(max)
declare @cadSqlM2 nvarchar(Max), @cadCat nvarChar(Max),@cadCD varchar(30)
declare @Pos int,@Pos3 int,
@Pos2 int


print @CveAr
print @Tpro
set @mIA= @CveIn 
set @msgA=''
	--Select @CveAr=arbclave from man.arbol where arbClaveInd = @CveIn
	while len(@CveAr)>=7
	begin
	print 'while len(@CveAr)>=7'
		--while exists(select movClave,movsql  from ManV2.movimientos with(nolock) where movCatalogo='Arbol' and movcomentario= @CveAr and  movEstatus='M' )
		--begin
		--	select top 1 @mClaA=movClave, @mSA=movsql from ManV2.movimientos with(nolock) where movCatalogo='Arbol' and movcomentario= @CveAr and  movEstatus='M' order by SUBSTRING(movFecha,7,4) asc, substring(movFecha,4,2) asc, SUBSTRING(movFecha,0,3) asc, substring(movhora,0,3) asc, substring(movhora,4,2) asc, substring(movhora,7,2) asc, movClave 
			
		--	 select @Opci =  left(@mSA,1)	--obtener el primer caracter
		--		if @Opci='I' or @Opci ='i'
		--		begin
		--			exec  PreV2.RevisaDuplicados @mClaA,@mSA, @mIA, 'Arbol', @CveAr
		--		   end
		--	     else
		--	     begin
		--			select @Pos =  patindex('%ManV2.%' , @mSA)--Buscamos la posicion de la primera ,
		--			select @cadSqlM2 = left(@mSA, @Pos - 1)-- esquema
		--			select @mSA =  stuff(@mSA, 1, @Pos+5, '')			--Y obtenemos los caracteres hasta esa posicion
		--			set @cadSqlM1=  @cadSqlM2 + ' PreV2.' + @mSA   --SUBSTRING (@mS,@Posicion+4,len(@mS) - (@Posicion + 4))
		--			exec(@cadSqlM1)
		--			update ManV2.movimientos SET movEstatus='P' where movClave=@mClaA
		--		 end
		--end
			if @TPro='C'--proceso cambio
			begin
				select @cveDA=arbClaveDescrip from ManV2.Arbol with(nolock) where arbClave = @CveAr --Revisa catalogo de descripciones
				print 'C - '
				print @CveAr
			end
			else--proceso borrar
			begin
				print @CveAr
				select @cveDA=arbClaveDescrip from preV2.Arbol with(nolock) where arbClave = @CveAr --Revisa catalogo de descripciones
				print 'primer if'
			end
				set @cadCat = 'Descripcion,'
				WHILE patindex('%,%' , @cadCat) <> 0
				begin
					SELECT @Pos2 =  patindex('%,%' , @cadCat)
					--Buscamos la posicion de la primera ,
					SELECT @cadCD= left(@cadCat, @Pos2 - 1)--nombre de catalogo
					--Reemplazamos lo procesado con nada con la funcion stuff
					SELECT @cadCat = stuff(@cadCat, 1, @Pos2, '')
					print @cadCD 
					print @cveDA
					while exists(select movClave,movsql  from ManV2.movimientos with(nolock) where movCatalogo=@cadCD and movcomentario= @cveDA  and  movEstatus='M' )
					begin
						select top 1 @mClaA2=movClave, @mSA2=movsql  from ManV2.movimientos with(nolock) where movCatalogo=@cadCD  and movcomentario= @cveDA and  movEstatus='M' order by SUBSTRING(movFecha,7,4) asc, substring(movFecha,4,2) asc, SUBSTRING(movFecha,0,3) asc, substring(movhora,0,3) asc, substring(movhora,4,2) asc, substring(movhora,7,2) asc, movClave
						select @Opci =  left(@mSA2,1)	--obtener el primer caracter
						if @Opci='I' or @Opci ='i'
						begin
							print 'Entré a RevisaDuplicados' 
							
							exec  PreV2.RevisaDuplicados @mClaA2,@mSA2, @mIA, @cadCD, @cveDA
							print 'Sali de RevisaDuplicados'
						end
						 else
						 begin
							select @Pos3 =  patindex('%ManV2.%' , @mSA2)--Buscamos la posicion de la primera ,
							select @cadSqlM = left(@mSA2, @Pos3 - 1)-- esquema
							select @mSA2 =  stuff(@mSA2, 1, @Pos3+5, '')			--Y obtenemos los caracteres hasta esa posicion
							set @cadSqlM1=  @cadSqlM + ' PreV2.' + @mSA2   --SUBSTRING (@mS,@Posicion+4,len(@mS) - (@Posicion + 4))
							exec(@cadSqlM1)
							update ManV2.movimientos SET movEstatus='P' where movClave=@mClaA2
						end
					end
				end
				----
				if @TPro='C'
				begin
					select @CveMd =arbClaveMetadato from ManV2.Arbol with(nolock) where arbClave = @CveAr --Revisa catalogo de metadatos
					print 'C -'
					print @CveMd
				end
				else
				begin
					print @CveAr
					select  @CveMd =arbClaveMetadato from preV2.Arbol with(nolock) where arbClave = @CveAr  --Revisa catalogo de metadatos
					print 'segundo if'
				end
					print @CveMd
					while exists(select movClave,movsql  from ManV2.movimientos with(nolock) where movCatalogo='Metadato' and movcomentario= @CveMd  and  movEstatus='M' )
					begin
						print 'while'
						select top 1 @mClaA2=movClave, @mSA2=movsql  from ManV2.movimientos with(nolock) where movCatalogo='Metadato' and movcomentario= @CveMd and  movEstatus='M' order by SUBSTRING(movFecha,7,4) asc, substring(movFecha,4,2) asc, SUBSTRING(movFecha,0,3) asc, substring(movhora,0,3) asc, substring(movhora,4,2) asc, substring(movhora,7,2) asc, movClave
						select @Opci =  left(@mSA2,1)	--obtener el primer caracter
						if @Opci='I' or @Opci ='i'
						begin
							print 'I'
							exec PreV2.RevisaDuplicados @mClaA2,@mSA2, @mIA, 'Metadato', @CveMd
						 end
						 else
						 begin
								select @Pos3 =  patindex('%ManV2.%' , @mSA2)--Buscamos la posicion de la primera ,
								select @cadSqlM = left(@mSA2, @Pos3 - 1)-- esquema
								select @mSA2 =  stuff(@mSA2, 1, @Pos3+5, '')			--Y obtenemos los caracteres hasta esa posicion
								set @cadSqlM1=  @cadSqlM + ' PreV2.' + @mSA2   --SUBSTRING (@mS,@Posicion+4,len(@mS) - (@Posicion + 4))
								exec(@cadSqlM1)
								update ManV2.movimientos SET movEstatus='P' where movClave=@mClaA2
						end
					end
		while exists(select movClave,movsql  from ManV2.movimientos with(nolock) where movCatalogo='Arbol' and movcomentario= @CveAr and  movEstatus='M' )
		begin
			select top 1 @mClaA=movClave, @mSA=movsql from ManV2.movimientos with(nolock) where movCatalogo='Arbol' and movcomentario= @CveAr and  movEstatus='M' order by SUBSTRING(movFecha,7,4) asc, substring(movFecha,4,2) asc, SUBSTRING(movFecha,0,3) asc, substring(movhora,0,3) asc, substring(movhora,4,2) asc, substring(movhora,7,2) asc, movClave 
			
			 select @Opci =  left(@mSA,1)	--obtener el primer caracter
				if @Opci='I' or @Opci ='i'
				begin
					exec  PreV2.RevisaDuplicados @mClaA,@mSA, @mIA, 'Arbol', @CveAr
				   end
				 else
				 begin
					select @Pos =  patindex('%ManV2.%' , @mSA)--Buscamos la posicion de la primera ,
					select @cadSqlM2 = left(@mSA, @Pos - 1)-- esquema
					select @mSA =  stuff(@mSA, 1, @Pos+5, '')			--Y obtenemos los caracteres hasta esa posicion
					set @cadSqlM1=  @cadSqlM2 + ' PreV2.' + @mSA   --SUBSTRING (@mS,@Posicion+4,len(@mS) - (@Posicion + 4))
					exec(@cadSqlM1)
					update ManV2.movimientos SET movEstatus='P' where movClave=@mClaA
				 end
		end
					
		select @CveAr = left(@CveAr, len(@CveAr) - 4);
		print @CveAr
	end

END

GO


USE [ODS]
GO

/****** StoredProcedure [PreV2].[RevisaCamAtrIndicador] ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [PreV2].[RevisaCamAtrIndicador] 
	-- Add the parameters for the stored procedure here
	@CveIn int,
	@TPro varchar(2)
AS
BEGIN
SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED
declare @mClaA int,@mClaA2 int,@cveSer int, @cveEst int, @cveNota int, @cveFue int, @cveUni int, @cveGral int, @CveGpo int, @cveGrafM  int, @cveGrafT int, @cveGrafC int, @cg int, @cveGrafD int ,@cveTCob int,@cvePCve int --, @CveClas int, @CveDs int
declare @mSA nvarchar(MAX),@CveAr varchar(50),@mSA2 nvarchar(MAX),@cveTI nvarchar(5), @Tipocua nvarchar(5), @cveAgru nvarchar(Max), @cveAgruCl nvarchar(Max), @cveAgru2 nvarchar(Max), @cveAgruCo nvarchar(Max)
declare @cadSqlM nvarchar(Max), @cveAgruCoGeo nvarchar(Max), @cveAgruCoDesGeo nvarchar(Max),@Opci nvarchar(1),@returnErrorSer nvarchar(Max),@msgSer nvarchar(Max),@cadCatPCve nvarchar(max), @cadCDPCve nvarchar(max)
declare @cadSqlM1 nvarchar(Max)
declare @cadSqlM2 nvarchar(Max), @cadCat nvarChar(Max),@cadCD varchar(30)
declare @Pos int,@Pos3 int, @Pos2 int
declare @tablaTI table (cT nvarchar(Max))
declare @tablaPCve table (cvePal int)
--declare @tablaGp table (cG int)
--declare @tablaAgr table (cA nvarchar(Max))
--declare @tablaCveAgr table (cCA nvarchar(Max))
--declare @tablaAgrCo table (cACo nvarchar(Max),cACoGeo nvarChar(Max),cACoDes nvarChar(Max))--tabla para obtener los campos de la tabla agrupaCob
--declare @tablaCveAgrCo table (cCACo nvarchar(Max))

insert into @tablaTI select eitCveTipoInd  from ManV2.EnlIndTipo with(nolock) where eitCveInd = @CveIn
insert into @tablaPCve select eipcCveDesPCve  from ManV2.EnlIndPCve with(nolock) where eipcCveInd = @CveIn

--select top 1 @cveAgruCo  = cACo, @cveAgruCoGeo = cACoGeo, @cveAgruCoDesGeo = cACoDes from @tablaAgrCo

set @cg=0
set @msgSer = ''
print @TPro
--declare @tablaClas table (gpo int, Cla int, CDes int)
				--, @cveGraf = atrTipoGra
				--Grafica del Mapa
				if @TPro='C' --es cambio
				begin
					select @cveGrafM = eigCveGra  from ManV2.EnlIndGra with(nolock)  where eigCveInd  = @CveIn  and eigSeccion='M'
					--Grafica del Mapa
					select @cveGrafT = eigCveGra  from ManV2.EnlIndGra with(nolock)  where eigCveInd  = @CveIn  and eigSeccion='T'
					--Grafica del Mapa
					select @cveGrafC = eigCveGra  from ManV2.EnlIndGra with(nolock)  where eigCveInd  = @CveIn  and eigSeccion='C'
					--Grafica del Mapa
					select @cveGrafD = eigCveGra  from ManV2.EnlIndGra with(nolock)  where eigCveInd  = @CveIn  and eigSeccion='E'
					
					--atributos del indicador
					--select @Tipocua= atrTipoCua, @cveTI = atrTipoInd, @cveEst = atrClaveEst, @cveNota = atrClaveNota, @cveFue = atrClaveFue, @cveUni = atrClaveUni  from man.AtrIndicador where atrClaveInd  = @CveIn 
					--select @Tipocua= atrTipoCua, @cveEst = atrClaveEst, @cveNota = atrClaveNota, @cveFue = atrClaveFue, @cveUni = atrClaveUni, @cveTCob= atrClaveTipoDes from man.AtrIndicador where atrClaveInd  = @CveIn 
					select  @cveEst = atrClaveEst from ManV2.AtrIndicador with(nolock)  where atrClaveInd  = @CveIn 
					
				end
				else--es borrado
				begin
					select @cveGrafM = eigCveGra  from PreV2.EnlIndGra with(nolock)  where eigCveInd  = @CveIn  and eigSeccion='M'
					--Grafica del Mapa
					select @cveGrafT = eigCveGra  from PreV2.EnlIndGra with(nolock)  where eigCveInd  = @CveIn  and eigSeccion='T'
					--Grafica del Mapa
					select @cveGrafC = eigCveGra  from PreV2.EnlIndGra with(nolock)  where eigCveInd  = @CveIn  and eigSeccion='C'
					--Grafica del Mapa
					select @cveGrafD = eigCveGra  from PreV2.EnlIndGra with(nolock)  where eigCveInd  = @CveIn  and eigSeccion='E'
					
					select  @cveEst = atrClaveEst from PreV2.AtrIndicador with(nolock)  where atrClaveInd  = @CveIn 
				end
				set @cadCat = 'TipoIndicador,Estatus,Grafica,Grafica,Grafica,Grafica,DescripcionPCve,'
				WHILE patindex('%,%' , @cadCat) <> 0
				begin
					SELECT @Pos2 =  patindex('%,%' , @cadCat)
					--Buscamos la posicion de la primera ,
					SELECT @cadCD= left(@cadCat, @Pos2 - 1)--nombre de catalogo
					--Reemplazamos lo procesado con nada con la funcion stuff
					SELECT @cadCat = stuff(@cadCat, 1, @Pos2, '')
					--if (@cadCD ='Notas')
					--begin set @cveGral= @cveNota end
					--if (@cadCD ='Fuentes')
					--begin set @cveGral= @cveFue 	end
					--if (@cadCD ='Unidad')
					--begin set @cveGral= @cveUni	end
					if (@cadCD ='Estatus')
					begin set @cveGral= @cveEst	end
					if (@cadCD ='Grafica')
					begin
						set @cg= @cg+1 
						if @cg=1
						begin set @cveGral= @cveGrafM	end
						if @cg=2
						begin set @cveGral= @cveGrafT	end
						if @cg=3
						begin set @cveGral= @cveGrafC	end
						if @cg=4
						begin set @cveGral= @cveGrafD	end
					end
					--if (@cadCD ='DesgloseGeo')
					--begin set @cveGral= @cveTCob  end
					
					if (@cveGral<>0 and @cadCD <> 'TipoIndicador' and @cadCD <>'DescripcionPCve')
					begin
						while exists(select movClave,movsql  from ManV2.movimientos with(nolock) where movCatalogo=@cadCD and movcomentario= @cveGral  and  movEstatus='M' )
						begin
							select top 1 @mClaA2=movClave, @mSA2=movsql  from ManV2.movimientos with(nolock) where movCatalogo=@cadCD  and movcomentario= @cveGral and  movEstatus='M' order by SUBSTRING(movFecha,7,4) asc, substring(movFecha,4,2) asc, SUBSTRING(movFecha,0,3) asc, substring(movhora,0,3) asc, substring(movhora,4,2) asc, substring(movhora,7,2) asc, movClave
							select @Opci =  left(@mSA2,1)	--obtener el primer caracter
							if @Opci='I' or  @Opci='i'
							begin
								exec  PreV2.RevisaDuplicados @mClaA2,@mSA2, @CveIn , @cadCD, @cveGral
							end
							else
							begin
								select @Pos3 =  patindex('%ManV2.%' , @mSA2)--Buscamos la posicion de la primera ,
								select @cadSqlM = left(@mSA2, @Pos3 - 1)-- esquema
								select @mSA2 =  stuff(@mSA2, 1, @Pos3+5, '')			--Y obtenemos los caracteres hasta esa posicion
								set @cadSqlM1=  @cadSqlM + ' PreV2.' + @mSA2   --SUBSTRING (@mS,@Posicion+4,len(@mS) - (@Posicion + 4))
								exec(@cadSqlM1)
								update ManV2.movimientos SET movEstatus='P' where movClave=@mClaA2
							end 
						end
					end
					else
					begin
						if (@cadCD = 'TipoIndicador')--tabla tipo de indicador
						begin
						  while exists(select * from @tablaTI )
						  begin
							   select top 1 @cveTI = cT  from @tablaTI
								while exists(select movClave,movsql  from ManV2.movimientos with(nolock) where movCatalogo=@cadCD and movcomentario= @cveTI  and  movEstatus='M' )
								begin
									select top 1 @mClaA2=movClave, @mSA2=movsql  from ManV2.movimientos with(nolock) where movCatalogo=@cadCD  and movcomentario= @cveTI and  movEstatus='M' order by SUBSTRING(movFecha,7,4) asc, substring(movFecha,4,2) asc, SUBSTRING(movFecha,0,3) asc, substring(movhora,0,3) asc, substring(movhora,4,2) asc, substring(movhora,7,2) asc, movClave
									select @Opci =  left(@mSA2,1)	--obtener el primer caracter
									if @Opci='I' or  @Opci='i'
									begin
										exec  PreV2.RevisaDuplicados @mClaA2,@mSA2, @CveIn , @cadCD, @cveTI
									end
									else
									begin
										select @Pos3 =  patindex('%ManV2.%' , @mSA2)--Buscamos la posicion de la primera ,
										select @cadSqlM = left(@mSA2, @Pos3 - 1)-- esquema
										select @mSA2 =  stuff(@mSA2, 1, @Pos3+5, '')			--Y obtenemos los caracteres hasta esa posicion
										set @cadSqlM1=  @cadSqlM + ' PreV2.' + @mSA2   --SUBSTRING (@mS,@Posicion+4,len(@mS) - (@Posicion + 4))
										exec(@cadSqlM1)
										update ManV2.movimientos SET movEstatus='P' where movClave=@mClaA2
									end 
								end
								delete from @tablaTI where cT= @cveTI
							end
						end
						--palabras clave
						if (@cadCD = 'DescripcionPCve')--tabla descripción de palabras clave
						begin
						  while exists(select * from @tablaPCve )
						  begin
							   select top 1 @cvePCve = cvePal  from @tablaPCve 
								while exists(select movClave,movsql  from ManV2.movimientos with(nolock) where movCatalogo=@cadCD and movcomentario= @cvePCve  and  movEstatus='M' )
								begin
									select top 1 @mClaA2=movClave, @mSA2=movsql  from ManV2.movimientos with(nolock) where movCatalogo=@cadCD  and movcomentario= @cvePCve and  movEstatus='M' order by SUBSTRING(movFecha,7,4) asc, substring(movFecha,4,2) asc, SUBSTRING(movFecha,0,3) asc, substring(movhora,0,3) asc, substring(movhora,4,2) asc, substring(movhora,7,2) asc, movClave
									select @Opci =  left(@mSA2,1)	--obtener el primer caracter
									if @Opci='I' or  @Opci='i'
									begin
										Print 'palabra clave'
										print @cvePCve
										exec  PreV2.RevisaDuplicados @mClaA2,@mSA2, @CveIn , @cadCD, @cvePCve
									end
									else
									begin
										select @Pos3 =  patindex('%ManV2.%' , @mSA2)--Buscamos la posicion de la primera ,
										select @cadSqlM = left(@mSA2, @Pos3 - 1)-- esquema
										select @mSA2 =  stuff(@mSA2, 1, @Pos3+5, '')			--Y obtenemos los caracteres hasta esa posicion
										set @cadSqlM1=  @cadSqlM + ' PreV2.' + @mSA2   --SUBSTRING (@mS,@Posicion+4,len(@mS) - (@Posicion + 4))
										exec(@cadSqlM1)
										update ManV2.movimientos SET movEstatus='P' where movClave=@mClaA2
									end 
								end
								
								--revisar lexico y enlace de palabras clave
								set @cadCatPCve = 'LexicoPCve,EnlacePCve,LexicoPCveIng,EnlacePCveIng,'
									WHILE patindex('%,%' , @cadCat) <> 0
									begin
										SELECT @Pos2 =  patindex('%,%' , @cadCatPCve)
										--Buscamos la posicion de la primera ,
										SELECT @cadCDPCve= left(@cadCatPCve, @Pos2 - 1)--nombre de catalogo
										--Reemplazamos lo procesado con nada con la funcion stuff
										SELECT @cadCatPCve = stuff(@cadCatPCve, 1, @Pos2, '')
										set @cveGral= @cvePCve 
										if @cveGral <> 0
										begin
											while exists(select movClave,movsql  from ManV2.movimientos with(nolock) where movCatalogo=@cadCDPCve and movcomentario= @cveGral  and  movEstatus='M' )
											begin
											select top 1 @mClaA2=movClave, @mSA2=movsql  from ManV2.movimientos with(nolock) where movCatalogo=@cadCDPCve  and movcomentario= @cveGral and  movEstatus='M' order by SUBSTRING(movFecha,7,4) asc, substring(movFecha,4,2) asc, SUBSTRING(movFecha,0,3) asc, substring(movhora,0,3) asc, substring(movhora,4,2) asc, substring(movhora,7,2) asc, movClave
												select @Opci =  left(@mSA2,1)	--obtener el primer caracter
												if @Opci='I' or  @Opci='i'
												begin
													exec PreV2.RevisaDuplicados @mClaA2,@mSA2, @CveIn , @cadCDPCve, @cveGral
												end
												else
												begin
													select @Pos3 =  patindex('%ManV2.%' , @mSA2)--Buscamos la posicion de la primera ,
													select @cadSqlM = left(@mSA2, @Pos3 - 1)-- esquema
													select @mSA2 =  stuff(@mSA2, 1, @Pos3+5, '')			--Y obtenemos los caracteres hasta esa posicion
													set @cadSqlM1=  @cadSqlM + ' PreV2.' + @mSA2   --SUBSTRING (@mS,@Posicion+4,len(@mS) - (@Posicion + 4))
													exec(@cadSqlM1)
													update ManV2.movimientos SET movEstatus='P' where movClave=@mClaA2
												end
											end
										end 
									end
									delete from @tablaPCve where cvePal= @cvePCve
							end
						end
						
					end
				end

			
 END


GO

GO

/****** StoredProcedure [PreV2].[RevisaCamFichaT]  ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [PreV2].[RevisaCamFichaT] 
	-- Add the parameters for the stored procedure here
	@CveIn int,
	@TPro varchar(2)
AS
BEGIN
SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED
declare @mClaA int,@mClaA2 int,@cveFT int,@cveFue int, @cveInst int, @cveRI int, @CvePeri int, @CveCo int, @CveCG int
declare @mSA nvarchar(MAX),@CveAr varchar(50),@mSA2 nvarchar(MAX),@Opci nvarchar(1),@returnErrorSer nvarchar(Max),@msgSer nvarchar(Max)
declare @cadSqlM nvarchar(Max)
declare @cadSqlM1 nvarchar(Max)
declare @cadSqlM2 nvarchar(Max), @cadCat nvarChar(Max),@cadCD varchar(30)
declare @Pos int,@Pos3 int, @Pos2 int
declare @tablafue table (cF int)
declare @tablaIns table (cI int)
declare @tablaRI table (cR int)
declare @tablaCo table (cC int)

set @msgSer = ''
  if @TPro='C'
  begin
  
	select top 1 @cveFT = ftClave, @CveCG = ftCobGeoft, @CvePeri = ftPeriodo from ManV2.FichaTecnica with(nolock), ManV2.Arbol with(nolock) where ftClave = arbClaveFT  and arbClaveInd = @CveIn
	insert into @tablafue select effClaveFue from ManV2.EnlFTMFte with(nolock)  where effClave = @CveFT 
	insert into @tablaIns select efiClaveInst  from ManV2.EnlFTRInst with(nolock) where efiClave = @cveFT
	insert into @tablaRI select efrClaveRI from ManV2.EnlFTRRI with(nolock) where efrClave = @cveFT
	insert into @tablaCo select efcClaveCon from ManV2.EnlFTCon with(nolock) where efcClaveFt = @cveFT
 end
 else
 begin
	select top 1 @cveFT = ftClave, @CveCG = ftCobGeoft, @CvePeri = ftPeriodo from PreV2.FichaTecnica with(nolock), PreV2.Arbol with(nolock) where ftClave = arbClaveFT  and arbClaveInd = @CveIn
	insert into @tablafue select effClaveFue from PreV2.EnlFTMFte with(nolock)  where effClave = @CveFT 
	insert into @tablaIns select efiClaveInst  from PreV2.EnlFTRInst with(nolock) where efiClave = @cveFT
	insert into @tablaRI select efrClaveRI from PreV2.EnlFTRRI with(nolock) where efrClave = @cveFT
	insert into @tablaCo select efcClaveCon from PreV2.EnlFTCon with(nolock) where efcClaveFt = @cveFT
 end
	while exists(select * from @tablafue )--revisar fuentes enlazadas
	begin
		select top 1 @cveFue = cf  from @tablafue  
		while exists(select movClave,movsql  from ManV2.movimientos with(nolock) where movCatalogo='Fuentes' and movcomentario= @cveFue  and  movEstatus='M' )
		begin
			select top 1 @mClaA2=movClave, @mSA2=movsql  from ManV2.movimientos with(nolock) where movCatalogo='Fuentes'  and movcomentario= @cveFue and  movEstatus='M' order by SUBSTRING(movFecha,7,4) asc, substring(movFecha,4,2) asc, SUBSTRING(movFecha,0,3) asc, substring(movhora,0,3) asc, substring(movhora,4,2) asc, substring(movhora,7,2) asc, movClave
			select @Opci =  left(@mSA2,1)	--obtener el primer caracter
			if @Opci='I' or  @Opci='i'
			begin
				exec  PreV2.RevisaDuplicados @mClaA2,@mSA2, @CveIn , 'Fuentes', @cveFue
			end
			else
			begin
				select @Pos3 =  patindex('%ManV2.%' , @mSA2)--Buscamos la posicion de la primera ,
				select @cadSqlM = left(@mSA2, @Pos3 - 1)-- esquema
				select @mSA2 =  stuff(@mSA2, 1, @Pos3+5, '')			--Y obtenemos los caracteres hasta esa posicion
				set @cadSqlM1=  @cadSqlM + ' PreV2.' + @mSA2   --SUBSTRING (@mS,@Posicion+4,len(@mS) - (@Posicion + 4))
				exec(@cadSqlM1)
				update ManV2.movimientos SET movEstatus='P' where movClave=@mClaA2
			end
		end
		delete from @tablafue where cf= @cveFue	
	end
	--
   while exists(select * from @tablaIns )--revisar instituciones enlazadas
	begin
		select top 1 @CveInst = cI  from @tablaIns 
		while exists(select movClave,movsql  from ManV2.movimientos with(nolock) where movCatalogo='Institucion' and movcomentario= @CveInst  and  movEstatus='M' )
		begin
			select top 1 @mClaA2=movClave, @mSA2=movsql  from ManV2.movimientos with(nolock) where movCatalogo='Institucion'  and movcomentario= @CveInst  and  movEstatus='M' order by SUBSTRING(movFecha,7,4) asc, substring(movFecha,4,2) asc, SUBSTRING(movFecha,0,3) asc, substring(movhora,0,3) asc, substring(movhora,4,2) asc, substring(movhora,7,2) asc, movClave
			select @Opci =  left(@mSA2,1)	--obtener el primer caracter
			if @Opci='I' or  @Opci='i'
			begin
				exec PreV2.RevisaDuplicados @mClaA2,@mSA2, @CveIn , 'Institucion', @CveInst
			end
			else
			begin
				select @Pos3 =  patindex('%ManV2.%' , @mSA2)--Buscamos la posicion de la primera ,
				select @cadSqlM = left(@mSA2, @Pos3 - 1)-- esquema
				select @mSA2 =  stuff(@mSA2, 1, @Pos3+5, '')			--Y obtenemos los caracteres hasta esa posicion
				set @cadSqlM1=  @cadSqlM + ' PreV2.' + @mSA2   --SUBSTRING (@mS,@Posicion+4,len(@mS) - (@Posicion + 4))
				exec(@cadSqlM1)
				update ManV2.movimientos SET movEstatus='P' where movClave=@mClaA2
			end
		end
		delete from @tablaIns where cI= @cveInst 	
	end
	--
	while exists(select * from @tablaRI )--revisar referencias internacionales 
	begin
		select top 1 @CveRI = cR  from @tablaRI 
		while exists(select movClave,movsql  from ManV2.movimientos with(nolock) where movCatalogo='RefInter' and movcomentario= @CveRI  and  movEstatus='M' )
		begin
			select top 1 @mClaA2=movClave, @mSA2=movsql  from ManV2.movimientos with(nolock) where movCatalogo='RefInter'  and movcomentario= @CveRI  and  movEstatus='M' order by SUBSTRING(movFecha,7,4) asc, substring(movFecha,4,2) asc, SUBSTRING(movFecha,0,3) asc, substring(movhora,0,3) asc, substring(movhora,4,2) asc, substring(movhora,7,2) asc, movClave
			select @Opci =  left(@mSA2,1)	--obtener el primer caracter
			if @Opci='I' or  @Opci='i'
			begin
				exec  PreV2.RevisaDuplicados @mClaA2,@mSA2, @CveIn , 'RefInter', @CveRI
			end
			else
			begin
				select @Pos3 =  patindex('%ManV2.%' , @mSA2)--Buscamos la posicion de la primera ,
				select @cadSqlM = left(@mSA2, @Pos3 - 1)-- esquema
				select @mSA2 =  stuff(@mSA2, 1, @Pos3+5, '')			--Y obtenemos los caracteres hasta esa posicion
				set @cadSqlM1=  @cadSqlM + ' PreV2.' + @mSA2   --SUBSTRING (@mS,@Posicion+4,len(@mS) - (@Posicion + 4))
				exec(@cadSqlM1)
				update ManV2.movimientos SET movEstatus='P' where movClave=@mClaA2
			end
		end
		delete from @tablaRI where cR= @CveRI	
	end
   --
	while exists(select * from @tablaCo )--revisar contactos enlazados
	begin
		select top 1 @cveCo = cC  from @tablaCo  
		while exists(select movClave,movsql  from ManV2.movimientos with(nolock) where movCatalogo='Contacto' and movcomentario= @cveCo  and  movEstatus='M' )
		begin
			select top 1 @mClaA2=movClave, @mSA2=movsql  from ManV2.movimientos with(nolock) where movCatalogo='Contacto'  and movcomentario= @cveCo and  movEstatus='M' order by SUBSTRING(movFecha,7,4) asc, substring(movFecha,4,2) asc, SUBSTRING(movFecha,0,3) asc, substring(movhora,0,3) asc, substring(movhora,4,2) asc, substring(movhora,7,2) asc, movClave
			select @Opci =  left(@mSA2,1)	--obtener el primer caracter
			if @Opci='I' or  @Opci='i'
			begin
				exec  PreV2.RevisaDuplicados @mClaA2,@mSA2, @CveIn , 'Contacto', @cveCo
			end
			else
			begin
				select @Pos3 =  patindex('%ManV2.%' , @mSA2)--Buscamos la posicion de la primera ,
				select @cadSqlM = left(@mSA2, @Pos3 - 1)-- esquema
				select @mSA2 =  stuff(@mSA2, 1, @Pos3+5, '')			--Y obtenemos los caracteres hasta esa posicion
				set @cadSqlM1=  @cadSqlM + ' PreV2.' + @mSA2   --SUBSTRING (@mS,@Posicion+4,len(@mS) - (@Posicion + 4))
				exec(@cadSqlM1)
				update ManV2.movimientos SET movEstatus='P' where movClave=@mClaA2
			end
		end
		delete from @tablaCo where cC= @cveCo	
	end
	
	  --revisar la cobertura
		while exists(select movClave,movsql  from ManV2.movimientos with(nolock) where movCatalogo='FTCob' and movcomentario= @CveCG  and  movEstatus='M' )
		begin
			select top 1 @mClaA2=movClave, @mSA2=movsql  from ManV2.movimientos with(nolock) where movCatalogo='FTCob'  and movcomentario= @CveCG  and  movEstatus='M' order by SUBSTRING(movFecha,7,4) asc, substring(movFecha,4,2) asc, SUBSTRING(movFecha,0,3) asc, substring(movhora,0,3) asc, substring(movhora,4,2) asc, substring(movhora,7,2) asc, movClave
			select @Opci =  left(@mSA2,1)	--obtener el primer caracter
			if @Opci='I' or  @Opci='i'
			begin
				exec  PreV2.RevisaDuplicados @mClaA2,@mSA2, @CveIn , 'FTCob', @CveCG
			end
			else
			begin
				select @Pos3 =  patindex('%ManV2.%' , @mSA2)--Buscamos la posicion de la primera ,
				select @cadSqlM = left(@mSA2, @Pos3 - 1)-- esquema
				select @mSA2 =  stuff(@mSA2, 1, @Pos3+5, '')			--Y obtenemos los caracteres hasta esa posicion
				set @cadSqlM1=  @cadSqlM + ' PreV2.' + @mSA2   --SUBSTRING (@mS,@Posicion+4,len(@mS) - (@Posicion + 4))
				exec(@cadSqlM1)
				update ManV2.movimientos SET movEstatus='P' where movClave=@mClaA2
			end
		end
		 --revisar periodo
		while exists(select movClave,movsql  from ManV2.movimientos with(nolock) where movCatalogo='Periodo' and movcomentario= @CvePeri  and  movEstatus='M' )
		begin
			select top 1 @mClaA2=movClave, @mSA2=movsql  from ManV2.movimientos with(nolock) where movCatalogo='Periodo'  and movcomentario= @CvePeri  and  movEstatus='M' order by SUBSTRING(movFecha,7,4) asc, substring(movFecha,4,2) asc, SUBSTRING(movFecha,0,3) asc, substring(movhora,0,3) asc, substring(movhora,4,2) asc, substring(movhora,7,2) asc, movClave
			select @Opci =  left(@mSA2,1)	--obtener el primer caracter
			if @Opci='I' or  @Opci='i'
			begin
				exec  PreV2.RevisaDuplicados @mClaA2,@mSA2, @CveIn , 'Periodo', @CvePeri
			end
			else
			begin
				select @Pos3 =  patindex('%ManV2.%' , @mSA2)--Buscamos la posicion de la primera ,
				select @cadSqlM = left(@mSA2, @Pos3 - 1)-- esquema
				select @mSA2 =  stuff(@mSA2, 1, @Pos3+5, '')			--Y obtenemos los caracteres hasta esa posicion
				set @cadSqlM1=  @cadSqlM + ' PreV2.' + @mSA2   --SUBSTRING (@mS,@Posicion+4,len(@mS) - (@Posicion + 4))
				exec(@cadSqlM1)
				update ManV2.movimientos SET movEstatus='P' where movClave=@mClaA2
			end
		end
--return @msgSer

END



GO


GO

/****** StoredProcedure [PreV2].[RevisaInformacion] ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [PreV2].[RevisaInformacion] 
	-- Add the parameters for the stored procedure here
	@CveIn nvarChar(MAX),
	@CveArb nvarchar(MAX),
	@TipoPro nvarchar(2),
	@CveAtsSer nvarchar(max),
	@CvePFic nvarchar (max),
	@AtrEst nvarchar(max)
AS
BEGIN
SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED
declare @RowInf int,@RowInf2 int,@cadSql1 nvarchar(Max),@cadSql2 nvarchar(Max),@cveTI nvarchar(Max), @cveSrs nvarchar(Max),@cadSqlU nvarchar(max), @Orden nvarchar(max),@cveAgrOrd nvarchar(max), @TipoAgrCl nvarchar(max), @cveOrdAgrNot int, @cveNotasDat int,@CvePalCve nvarchar(max), @CveAgruCob nvarchar(max),@cveAgrCoNot int,@apiPAA int, @apiPMM int, @apiPDD int,@apiCvNota int,@RowInfT int,@RowInf2T int
declare @campM1 nvarchar(Max),@campM2 nvarchar(Max),@campM3 nvarchar(Max),@campM4 nvarchar(Max),@campM5 nvarchar(Max),@campM6 nvarchar(Max),@campM7 nvarchar(Max),@campM8 nvarchar(Max),@campM9 nvarchar(Max),@campM10 nvarchar(Max),@campM11 nvarchar(Max),@campM12 nvarchar(Max),@campM13 nvarchar(Max),@campM14 nvarchar(Max),@campM15 nvarchar(Max),@campM16 nvarchar(Max),@campM17 nvarchar(Max),@campM18 nvarchar(Max),@campM19 nvarchar(Max),@campM20 nvarchar(Max),@campM21 nvarchar(Max),@campM22 nvarchar(Max),@campM23 nvarchar(Max),@campM24 nvarchar(Max),@campM25 nvarchar(Max),@campM26 nvarchar(Max)
declare @campP1 nvarchar(Max),@campP2 nvarchar(Max),@campP3 nvarchar(Max),@campP4 nvarchar(Max),@campP5 nvarchar(Max),@campP6 nvarchar(Max),@campP7 nvarchar(Max),@campP8 nvarchar(Max),@campP9 nvarchar(Max),@campP10 nvarchar(Max),@campP11 nvarchar(Max),@campP12 nvarchar(Max),@campP13 nvarchar(Max),@campP14 nvarchar(Max),@campP15 nvarchar(Max),@campP16 nvarchar(Max),@campP17 nvarchar(Max),@campP18 nvarchar(Max),@campP19 nvarchar(Max),@campP20 nvarchar(Max),@campP21 nvarchar(Max),@campP22 nvarchar(Max),@campP23 nvarchar(Max),@campP24 nvarchar(Max),@campP25 nvarchar(Max),@campP26 nvarchar(Max)
declare @Igual nvarchar(3), @CveFicha nvarchar(Max),@CveMetadat nvarchar(Max), @CveDescripArb nvarchar(Max), @CveNotaI nvarchar(Max), @CveNotaF nvarchar(Max),@CveInsCal nvarchar(Max)
declare @Pos2 int, @cadRes nvarchar(Max), @cveGrafM nvarchar(Max),@cveGrafT nvarchar(Max), @cveGrafC nvarchar (Max), @cveGrafD nvarchar(Max), @CadGraf nvarchar(Max), @CadResGraf nvarchar(Max)
declare @CveGraF nvarchar(max),@banEnlIndSer nvarchar(max),@banEnlIndPCve nvarchar(max), @banEnlIndTipo nvarchar (max),@CveGpo nvarchar(Max),@CveClas nvarchar(max), @cveAgr nvarchar(max),@CveCob nvarchar(max),@CveCg nvarchar(max),@CveND nvarchar(max)
declare @tablafue table (cF int)
declare @tablaIns table (cI int)
declare @tablaRI table (cR int)
declare @tablaCo table (cC int)
declare @tablaTipoInd table (TipI nvarchar(max))
declare @tablaTipoInd2 table (TipI2 nvarchar(max))
declare @tablaSerie table (CveSr nvarchar(max), SerOrden nvarchar(max))
declare @tablaSerie2 table (CveSr2 nvarchar(max), SerOrden2 nvarchar(max))
declare @tablaAtrSer table (CveSer nvarchar(max), CveDescr nvarchar(max), CveFrec nvarchar(max), CveNota nvarchar(max), CveFuente nvarchar(max), CveUni nvarchar(max), CveAgClas nvarchar (max),CveAgCob nvarchar(max))
declare @tablaGpo table (CveGpo nvarchar(max))
declare @tablaAgrupaClas table (CveAgCl nvarchar(max))
declare @tablaOrdAgrupaClas table (CveOrdAgCl nvarchar(max), cveOrdAgrClNota int,  tipoCl nvarchar(max))
declare @tablaAgrupaCobs table (CveAgCob nvarchar(max))
declare @tablaClas table (CveCl  nvarchar(max),CveGpo nvarchar(max))
declare @tablaCobGeo table (CveAgruCg nvarchar(max),CveCg  nvarchar(max),  CveDesG nvarchar(max))
declare @tablaNoDato table (CveND  nvarchar(max))
declare @tablaLexico table (CvePal  nvarchar(max))
declare @tablaLexicoIng table (CvePalIng  nvarchar(max))
declare @tablaNotasDatos table (cveNotDat  int)
declare @tablaPalCve table (cvePC int)
declare @tablaPerInd table (apiAA int, apiMM int,apiDD int, apiCveNota int)
declare @CveDescr nvarchar(max), @CveFrec nvarchar(max), @CveNota nvarchar(max), @CveFuente nvarchar(max), @CveUni nvarchar(max), @CveAgClas nvarchar (max),@CveAgCob nvarchar(max), @CvePal nvarchar(max), @CvePalIng nvarchar(max)
declare @CveDesGeo nvarchar(max),@CveDesG nvarchar(max), @CveDesGAnt nvarchar(max),@CveTipoDGAnt nvarchar(max), @CveTipoDG nvarchar (max),@CvePer nvarchar(max), @CveFtCob nvarchar (max),@CveIns nvarchar(max),@CveRI nvarchar(max),@CveCo nvarchar(max)



--revisar arbol 
--select * from manv2.Arbol where arbClaveInd=339
--select * from prev2.Arbol where arbClaveInd=339
if @TipoPro='C'
begin
	set @RowInf=0
	  --select  @RowInf = COUNT(*) from PreV2.Arbol with(nolock) where arbClaveInd = @CveIn and arbClave= @CveArb
	  if EXISTS (select  * from PreV2.Arbol with(nolock) where arbClaveInd = @CveIn and arbClave= @CveArb)
	  begin set @RowInf=1 end
	  --select  @RowInf = COUNT(*) from PreV2.Arbol with(nolock) where arbClaveInd = @CveIn and arbClave= @CveArb
		if @RowInf = 0
		Begin  
			set @cadSql1 = 'INSERT INTO preV2.Arbol ([arbClave],[arbClaveInd],[arbClaveFT],[arbClaveDescrip],[arbClaveMetadato])
							select [arbClave],[arbClaveInd],[arbClaveFT],[arbClaveDescrip],[arbClaveMetadato]
							from ManV2.Arbol with(nolock) where arbclave =''' + @CveArb + ''' and arbClaveInd= ' + @CveIn 
			print @cadSql1
			EXEC (@cadSql1) 
			select top 1  @CveDescripArb= arbclaveDescrip, @CveFicha=arbClaveFT, @CveMetadat=arbClaveMetadato  from PreV2.Arbol with(nolock) where arbclave=@CveArb
		end
		else
		begin
			select top 1  @campM1=arbClaveInd, @campM2=arbClaveFT, @campM3=arbClaveDescrip, @campM4=arbClaveMetadato  from ManV2.Arbol with(nolock) where arbclave=@CveArb
			select top 1  @campP1=arbClaveInd, @campP2=arbClaveFT, @campP3=arbClaveDescrip, @campP4=arbClaveMetadato  from PreV2.Arbol with(nolock) where arbclave=@CveArb
			set @CveDescripArb= @campM3
			set @CveFicha= @campM2
			set @CveMetadat= @campM4
			if @campM1= @campP1 and @campM2= @campP2 and @campM3= @campP3 and @campM4= @campP4  
			begin 
				set @Igual='I'
			end
			else 
			begin 
				set @cadSql1 ='delete from preV2.Arbol where arbclaveind='+ @CveIn +' and arbClave= '''+ @CveArb + '''' 
				print @cadSql1
				EXEC (@cadSql1)
				set @cadSql2 = 'INSERT INTO preV2.Arbol ([arbClave],[arbClaveInd],[arbClaveFT],[arbClaveDescrip],[arbClaveMetadato])
								select [arbClave],[arbClaveInd],[arbClaveFT],[arbClaveDescrip],[arbClaveMetadato]
								from ManV2.Arbol with(nolock) where arbclave =''' + @CveArb + ''' and arbClaveInd= ' + @CveIn 
				print @cadSql2
				EXEC  (@cadSql2) 
			end
		end
	--revisar metadato
		--select * from Manv2.metadato where metClave=339
		--select * from prev2.metadato where metClave=339
		if @CveMetadat!='0'
		begin
		set @RowInf=0
			--select  @RowInf = COUNT(*) from PreV2.Metadato with(nolock) where metClave=@CveMetadat
			if EXISTS (select * from PreV2.Metadato with(nolock) where metClave=@CveMetadat)
			begin set @RowInf=1 end
			if @RowInf = 0
			Begin  
				set @cadSql1 = 'INSERT INTO preV2.metadato ([metClave],[metDescrip],[metDescripIng])
								select [metClave],[metDescrip],[metDescripIng]
								from ManV2.metadato with(nolock) where metclave =' + @CveMetadat
				print @cadSql1
				EXEC (@cadSql1) 
			end
			else
			begin
				select top 1  @campM1=metDescrip,@campM2=metDescripIng from ManV2.Metadato with(nolock) where metClave=@CveMetadat
				select top 1  @campP1=metDescrip,@campP2=metDescripIng from PreV2.Metadato with(nolock) where metClave=@CveMetadat
				if @campM1= @campP1 and @campM2= @campP2
				begin
					set @Igual='I'
				end
				else 
				begin 
					set @cadSql1 ='delete from preV2.metadato where metclave= ' + @CveMetadat
					print @cadSql1
					EXEC (@cadSql1)
					set @cadSql2 = 'INSERT INTO preV2.metadato ([metClave],[metDescrip],[metDescripIng])
									select [metClave],[metDescrip],[metDescripIng]
									from ManV2.metadato with(nolock) where metClave= ' + @CveMetadat
					print @cadSql2
					EXEC  (@cadSql2) 
				end
			end
		end 
	--revisar descripción de indicador
		--select * from Manv2.descripcion where desClave=339
		--select * from prev2.descripcion where desClave=339
		set @RowInf=0
		if EXISTS (select  * from PreV2.descripcion with(nolock) where desClave=@CveDescripArb)
		begin set @RowInf=1 end
		--select  @RowInf = COUNT(*) from PreV2.descripcion with(nolock) where desClave=@CveDescripArb
		if @RowInf = 0
		Begin  
			set @cadSql1 = 'INSERT INTO preV2.descripcion ([desClave],[desDescrip],[desAbrevia],[desCodigo],[desDescripIng],[desAbreviaIng],[desCodigoIng])
							select [desClave],[desDescrip],[desAbrevia],[desCodigo],[desDescripIng],[desAbreviaIng],[desCodigoIng]
							from ManV2.descripcion with(nolock) where desclave =' + @CveDescripArb
			print @cadSql1
			EXEC (@cadSql1) 
		end
		else
		begin
			select top 1  @campM1=desdescrip, @campM2=desAbrevia, @campM3=desCodigo, @campM4=desDescripIng, @campM5=desAbreviaIng, @campM6=desCodigoIng  from ManV2.Descripcion with(nolock) where desclave=@CveDescripArb
			select top 1  @campP1=desdescrip, @campP2=desAbrevia, @campP3=desCodigo, @campP4=desDescripIng, @campP5=desAbreviaIng, @campP6=desCodigoIng  from PreV2.Descripcion with(nolock) where desclave=@CveDescripArb
			if @campM1= @campP1 and @campM2= @campP2 and @campM3= @campP3 and @campM4= @campP4 and @campM5= @campP5 and @campM6= @campP6
			begin
				set @Igual='I'
			end
			else 
			begin 
				set @cadSql1 ='delete from preV2.Descripcion where desclave= ' + @CveDescripArb
				print @cadSql1
				EXEC (@cadSql1)
				set @cadSql2 = 'INSERT INTO preV2.descripcion ([desClave],[desDescrip],[desAbrevia],[desCodigo],[desDescripIng],[desAbreviaIng],[desCodigoIng])
								select [desClave],[desDescrip],[desAbrevia],[desCodigo],[desDescripIng],[desAbreviaIng],[desCodigoIng]
								from ManV2.Descripcion with(nolock) where desClave= ' + @CveDescripArb
				print @cadSql2
				EXEC  (@cadSql2) 
			end
		end
	--revisar los atributos del indicador
		--select * from Manv2.AtrIndicador where atrClaveInd=339
		--select * from Prev2.AtrIndicador where atrClaveInd=339
		set @RowInf=0
		if EXISTS (select  * from PreV2.AtrIndicador with(nolock) where atrClaveInd=@CveIn)
		begin set @RowInf=1 end
--		select  @RowInf = COUNT(*) from PreV2.AtrIndicador with(nolock) where atrClaveInd=@CveIn
		if @RowInf = 0
		Begin  
			set @cadSql1 = 'INSERT INTO preV2.AtrIndicador ([atrClaveInd],[atrFechaAct],[atrMeta],[atrDesMeta],[atrCalculo],[atrEstadisticos],[atrClaveEst],[atrFechaActIng],[atrDesMetaIng],[atrVisualizaMapa],[atrEtiPeriodo],[atrEtiCobTem],[atrEstado])
							select [atrClaveInd],[atrFechaAct],[atrMeta],[atrDesMeta],[atrCalculo],[atrEstadisticos],[atrClaveEst],[atrFechaActIng],[atrDesMetaIng],[atrVisualizaMapa],[atrEtiPeriodo],[atrEtiCobTem],[atrEstado]
							from ManV2.AtrIndicador with(nolock) where atrClaveInd =' + @CveIn
			print @cadSql1
			EXEC (@cadSql1) 
		end
		else
		begin
			select top 1  @campM1=atrFechaAct, @campM2=atrMeta, @campM3=atrDesMeta, @campM4=atrCalculo, @campM5=atrClaveEst, @campM6=atrFechaActIng, @campM7=atrDesMetaIng, @campM8=atrEstadisticos, @campM9=atrVisualizaMapa  from ManV2.AtrIndicador with(nolock) where atrClaveInd=@CveIn
			select top 1  @campP1=atrFechaAct, @campP2=atrMeta, @campP3=atrDesMeta, @campP4=atrCalculo, @campP5=atrClaveEst, @campP6=atrFechaActIng, @campP7=atrDesMetaIng, @campP8=atrEstadisticos, @campP9=atrVisualizaMapa  from PreV2.AtrIndicador with(nolock) where atrClaveInd=@CveIn
			if @campM1= @campP1 and @campM2= @campP2 and @campM3= @campP3 and @campM4= @campP4  and @campM5= @campP5  and @campM6= @campP6  and @campM7= @campP7  and @campM8= @campP8  and @campM9= @campP9  
			begin
				set @Igual='I'
			end
			else 
			begin 
				set @cadSql1 ='delete from preV2.AtrIndicador where atrClaveInd= ' + @CveIn
				print @cadSql1
				EXEC (@cadSql1)
				set @cadSql2 = 'INSERT INTO preV2.AtrIndicador ([atrClaveInd],[atrFechaAct],[atrMeta],[atrDesMeta],[atrCalculo],[atrEstadisticos],[atrClaveEst],[atrFechaActIng],[atrDesMetaIng],[atrVisualizaMapa],[atrEtiPeriodo],[atrEtiCobTem],[atrEstado])
								select [atrClaveInd],[atrFechaAct],[atrMeta],[atrDesMeta],[atrCalculo],[atrEstadisticos],[atrClaveEst],[atrFechaActIng],[atrDesMetaIng],[atrVisualizaMapa],[atrEtiPeriodo],[atrEtiCobTem],[atrEstado]
								from ManV2.AtrIndicador with(nolock) where atrClaveInd= ' + @CveIn
				print @cadSql2
				EXEC  (@cadSql2) 
			end
		end
	--revisar enlace indicador - calendario
		--select * from manv2.EnlIndCal where eicCveInd=339
		--select * from prev2.EnlIndCal where eicCveInd=339
		set @RowInf=0
		if EXISTS (select * from PreV2.EnlIndCal with(nolock) where eicCveInd=@CveIn)
		begin set @RowInf=1 end
		--select  @RowInf = COUNT(*) from PreV2.EnlIndCal with(nolock) where eicCveInd=@CveIn
		if @RowInf = 0
		Begin  
			set @cadSql1 = 'INSERT INTO preV2.EnlIndCal ([eicCveInd],[eicCveInst],[eicFecAct],[eicCveNotaI],[eicCveNotaF],[eicFecActIng])
							select [eicCveInd],[eicCveInst],[eicFecAct],[eicCveNotaI],[eicCveNotaF],[eicFecActIng]
							from ManV2.EnlIndCal with(nolock) where eicCveInd=' + @CveIn
			print @cadSql1
			EXEC (@cadSql1) 
			select top 1  @CveInsCal=eicCveInst, @CveNotaI= eicCveNotaI, @CveNotaF= eicCveNotaF from PreV2.EnlIndCal with(nolock) where eicCveInd =@CveIn
		end
		else
		begin
			select top 1  @campM1=eicCveInst, @campM2= eicFecAct, @campM3= eicCveNotaI, @campM4= eicCveNotaF, @campM5= eicFecActIng from ManV2.EnlIndCal with(nolock) where eicCveInd =@CveIn 
			select top 1  @campP1=eicCveInst, @campP2= eicFecAct, @campP3= eicCveNotaI, @campP4= eicCveNotaF, @campP5= eicFecActIng from PreV2.EnlIndCal with(nolock) where eicCveInd =@CveIn
			set @CveInsCal=@campM1
			set @CveNotaI= @campM3
			set @CveNotaF= @campM4
			if @campM1= @campP1 and @campM2= @campP2 and @campM3= @campP3 and @campM4= @campP4 and @campM5= @campP5 
			begin
				set @Igual='I'
			end
			else 
			begin 
				set @cadSql1 ='delete from preV2.EnlIndCal where eicCveInd= ' + @CveIn
				print @cadSql1
				EXEC (@cadSql1)
				set @cadSql2 = 'INSERT INTO preV2.EnlIndCal ([eicCveInd],[eicCveInst],[eicFecAct],[eicCveNotaI],[eicCveNotaF],[eicFecActIng])
								select [eicCveInd],[eicCveInst],[eicFecAct],[eicCveNotaI],[eicCveNotaF],[eicFecActIng]
								from ManV2.EnlIndCal with(nolock) where eicCveInd= ' + @CveIn
				print @cadSql2
				EXEC  (@cadSql2) 
			end
		end
	--revisar la institucion  de enlace indicador - calendario
		--select * from manv2.Institucion where insclave=339
		--select * from prev2.Institucion where insclave=339
		set @RowInf=0
		if EXISTS (select * from PreV2.Institucion with(nolock) where insclave=@CveInsCal)
		begin set @RowInf=1 end
--		select  @RowInf = COUNT(*) from PreV2.Institucion with(nolock) where insclave=@CveInsCal
		if @RowInf = 0
		Begin  
			set @cadSql1 = 'INSERT INTO preV2.Institucion ([insClave],[insDescrip],[insURL],[insAbrevia],[insDescripIng],[insAbreviaIng])
							select [insClave],[insDescrip],[insURL],[insAbrevia],[insDescripIng],[insAbreviaIng]
							from ManV2.Institucion with(nolock) where insclave=' + @CveInsCal
			print @cadSql1
			EXEC (@cadSql1) 
		end
		else
		begin
			select top 1  @campM1=insDescrip,@campM2=insDescripIng,@campM3=insAbrevia,@campM4=insAbreviaIng,@campM5=insURL from ManV2.Institucion with(nolock) where insClave=@CveInsCal
			select top 1  @campP1=insDescrip,@campP2=insDescripIng,@campP3=insAbrevia,@campP4=insAbreviaIng,@campP5=insURL from PreV2.Institucion with(nolock) where insClave=@CveInsCal
			if @campM1= @campP1 and @campM2= @campP2 and @campM3= @campP3 and @campM4= @campP4 and @campM5= @campP5
			begin
				set @Igual='I'
			end
			else 
			begin 
				set @cadSql1 ='delete from preV2.Institucion where insclave= ' + @CveInsCal
				print @cadSql1
				EXEC (@cadSql1)
				set @cadSql2 = 'INSERT INTO preV2.Institucion ([insClave],[insDescrip],[insURL],[insAbrevia],[insDescripIng],[insAbreviaIng])
								select [insClave],[insDescrip],[insURL],[insAbrevia],[insDescripIng],[insAbreviaIng]
								from ManV2.Institucion with(nolock) where insclave= ' + @CveInsCal
				print @cadSql2
				EXEC  (@cadSql2) 
			end
		end
	--revisar las notas  de enlace indicador - calendario
		--select * from manv2.Notas where notclave=339
		--select * from prev2.Notas where notclave=339
		set @CveNotaI = @CveNotaI + ',' + @CveNotaF + ','
		WHILE patindex('%,%' , @CveNotaI) <> 0
			begin
				SELECT @Pos2 =  patindex('%,%' , @CveNotaI)
				--Buscamos la posicion de la primera ,
				SELECT @cadRes= left(@CveNotaI, @Pos2 - 1)--clave de nota
				--Reemplazamos lo procesado con nada con la funcion stuff
				SELECT @CveNotaI = stuff(@CveNotaI, 1, @Pos2, '')
				if @cadRes <> '0' and @cadRes <> ''
				begin
					set @RowInf=0
					if EXISTS (select  * from PreV2.Notas with(nolock) where notclave=@cadRes)
					begin set @RowInf=1 end
					--select  @RowInf = COUNT(*) from PreV2.Notas with(nolock) where notclave=@cadRes
					if @RowInf = 0
					Begin  
						set @cadSql1 = 'INSERT INTO preV2.Notas ([notClave],[NotNota],[NotNotaIng])
										select [notClave],[NotNota],[NotNotaIng]
										from ManV2.Notas with(nolock) where notclave=' + @cadRes
						print @cadSql1
						EXEC (@cadSql1) 
					end
					else
					begin
						select top 1  @campM1=notNota,@campM2=notNotaIng from ManV2.Notas with(nolock) where notClave=@cadRes
						select top 1  @campP1=notNota,@campP2=notNotaIng from PreV2.Notas with(nolock) where notClave=@cadRes
						if @campM1= @campP1 and @campM2= @campP2 
						begin
							set @Igual='I'
						end
						else 
						begin 
							set @cadSql1 ='delete from preV2.Notas where notclave= ' + @CveInsCal
							print 'nota calendario'
							print @cadSql1
							EXEC (@cadSql1)
							set @cadSql2 = 'INSERT INTO preV2.Notas ([notClave],[NotNota],[NotNotaIng])
											select [notClave],[NotNota],[NotNotaIng]
											from ManV2.Notas with(nolock) where notclave= ' + @CveInsCal
							print @cadSql2
							EXEC  (@cadSql2) 
						end
					end
			   end
			end--end del while
	--revisar enlace indicador - gráfica
		--select * from manv2.EnlIndGra where eigCveInd=339
		--select * from prev2.EnlIndGra where eigCveInd=339
		set @CadGraf = 'M,T,C,E,'
		select @cveGrafM = eigCveGra  from ManV2.EnlIndGra with(nolock)  where eigCveInd  = @CveIn  and eigSeccion='M'
		--Grafica del Mapa
		select @cveGrafT = eigCveGra  from ManV2.EnlIndGra with(nolock)  where eigCveInd  = @CveIn  and eigSeccion='T'
		--Grafica del Mapa
		select @cveGrafC = eigCveGra  from ManV2.EnlIndGra with(nolock)  where eigCveInd  = @CveIn  and eigSeccion='C'
		--Grafica del Mapa
		select @cveGrafD = eigCveGra  from ManV2.EnlIndGra with(nolock)  where eigCveInd  = @CveIn  and eigSeccion='E'
		WHILE patindex('%,%' , @CadGraf) <> 0
			begin
				SELECT @Pos2 =  patindex('%,%' , @CadGraf)
				--Buscamos la posicion de la primera ,
				SELECT @cadResGraf= left(@CadGraf, @Pos2 - 1)--clave de nota
				--Reemplazamos lo procesado con nada con la funcion stuff
				SELECT @CadGraf= stuff(@CadGraf, 1, @Pos2, '')
				if @cadResGraf='M'
				begin set @CveGraF = @cveGrafM end
				if @cadResGraf='T'
				begin set @CveGraF = @cveGrafT end
				if @cadResGraf='C'
				begin set @CveGraF = @cveGrafC end
				if @cadResGraf='E'
				begin set @CveGraF = @cveGrafD end
				set @RowInf=0
				if EXISTS (select * from PreV2.EnlIndGra with(nolock) where eigCveInd=@CveIn and eigSeccion=@CadResGraf)
				begin set @RowInf=1 end
				--select  @RowInf = COUNT(*) from PreV2.EnlIndGra with(nolock) where eigCveInd=@CveIn and eigSeccion=@CadResGraf
				if @RowInf = 0
				Begin  
					set @cadSql1 = 'INSERT INTO preV2.EnlIndGra ([eigCveInd],[eigCveGra],[eigSeccion])
									select [eigCveInd],[eigCveGra],[eigSeccion]
									from ManV2.EnlIndGra with(nolock) where eigCveInd=' + @CveIn + ' and eigSeccion =''' + @CadResGraf + ''''
					print @cadSql1
					EXEC (@cadSql1) 
				end
				else
				begin
					select top 1  @campM1=eigCveGra from ManV2.EnlIndGra with(nolock) where eigCveInd =@CveIn and eigSeccion = @CadResGraf
					select top 1  @campP1=eigCveGra from PreV2.EnlIndGra with(nolock) where eigCveInd =@CveIn and eigSeccion = @CadResGraf
					if @campM1= @campP1 
					begin
						set @Igual='I'
					end
					else 
					begin 
						set @cadSql1 ='delete from preV2.EnlIndGra where eigCveInd=' + @CveIn + ' and eigSeccion =''' + @CadResGraf + ''''
						print @cadSql1
						EXEC (@cadSql1)
						set @cadSql2 = 'INSERT INTO preV2.EnlIndGra ([eigCveInd],[eigCveGra],[eigSeccion])
										select [eigCveInd],[eigCveGra],[eigSeccion]
										from ManV2.EnlIndGra with(nolock) where eigCveInd=' + @CveIn + ' and eigSeccion =''' + @CadResGraf + ''''
						print @cadSql2
						EXEC  (@cadSql2) 
					end
				end
				--revisar la tabla de grafica
				set @RowInf=0
				if EXISTS (select * from PreV2.Grafica with(nolock) where graClave=@CveGraF)
				begin set @RowInf=1 end
				--select  @RowInf = COUNT(*) from PreV2.Grafica with(nolock) where graClave=@CveGraF
				if @RowInf = 0
				Begin  
					set @cadSql1 = 'INSERT INTO preV2.Grafica ([graClave],[graDescrip],[graAbrevia] ,[graDescripIng],[graAbreviaIng])
									select [graClave],[graDescrip],[graAbrevia] ,[graDescripIng],[graAbreviaIng]
									from ManV2.Grafica with(nolock) where graClave=' + @CveGraF
					print @cadSql1
					EXEC (@cadSql1) 
				end
				else
				begin
					select top 1  @campM1=eigCveGra from ManV2.EnlIndGra with(nolock) where eigCveInd =@CveIn and eigSeccion = @CadResGraf
					select top 1  @campP1=eigCveGra from PreV2.EnlIndGra with(nolock) where eigCveInd =@CveIn and eigSeccion = @CadResGraf
					if @campM1= @campP1 
					begin
						set @Igual='I'
					end
					else 
					begin 
						set @cadSql1 ='delete from preV2.Grafica where graClave=' + @CveGraF
						print @cadSql1
						EXEC (@cadSql1)
						set @cadSql2 = 'INSERT INTO preV2.Grafica ([graClave],[graDescrip],[graAbrevia] ,[graDescripIng],[graAbreviaIng])
										select [graClave],[graDescrip],[graAbrevia] ,[graDescripIng],[graAbreviaIng]
										from ManV2.Grafica with(nolock) where graClave=' + @CveGraF
						print @cadSql2
						EXEC  (@cadSql2) 
					end
				end
		end
	--Revisar enlace indicador- tipo
		--select * from manv2.EnlIndTipo where eitCveInd=339
		--select * from prev2.EnlIndTipo where eitCveInd=339
		set @RowInf=0
		set @RowInf2=0
		insert into @tablaTipoInd select eitCveTipoInd  from ManV2.EnlIndTipo with(nolock) where eitCveInd = @CveIn
		insert into @tablaTipoInd2 select eitCveTipoInd  from ManV2.EnlIndTipo with(nolock) where eitCveInd = @CveIn
		if EXISTS (select * from ManV2.EnlIndTipo with(nolock) where eitCveInd = @CveIn)
		begin set @RowInf=1 end
		if EXISTS (select  * from PreV2.EnlIndTipo with(nolock) where  eitCveInd = @CveIn)
		begin set @RowInf2=1 end
		--select  @RowInf = COUNT(*) from ManV2.EnlIndTipo with(nolock) where eitCveInd = @CveIn
		--select  @RowInf2 = COUNT(*) from PreV2.EnlIndTipo with(nolock) where  eitCveInd = @CveIn
		set @banEnlIndTipo='False'
			if @RowInf = @RowInf2
				Begin  
					while exists(select * from @tablaTipoInd2 )
					 begin
						select top 1 @cveTI = TipI2  from @tablaTipoInd2
						set @RowInf=0
						if EXISTS (select  * from PreV2.EnlIndTipo with(nolock) where eitCveInd = @CveIn and eitCveTipoInd = @cveTI)
						begin set @RowInf=1 end
						--select  @RowInf = COUNT(*) from PreV2.EnlIndTipo with(nolock) where eitCveInd = @CveIn and eitCveTipoInd = @cveTI
						 if @RowInf= 0
						 Begin  
								set @banEnlIndTipo='True'
						 end
					   delete from @tablaTipoInd2 where TipI2= @cveTI
					 end
					 if @banEnlIndTipo='True'
					 begin
						set @cadSql1 ='delete from preV2.EnlIndTipo where  eitCveInd = ' + @CveIn
						print @cadSql1
						EXEC (@cadSql1)
						set @cadSql2 = 'INSERT INTO preV2.EnlIndTipo ([eitCveInd],[eitCveTipoInd],[eitOrden])
										select [eitCveInd],[eitCveTipoInd],[eitOrden]
										from ManV2.EnlIndTipo with(nolock) where eitCveInd = ' + @CveIn
						print @cadSql2
						EXEC  (@cadSql2) 
					 end
				end 
				else
				begin
					set @cadSql1 ='delete from preV2.EnlIndTipo where  eitCveInd = ' + @CveIn
					print @cadSql1
					EXEC (@cadSql1)
					set @cadSql2 = 'INSERT INTO preV2.EnlIndTipo ([eitCveInd],[eitCveTipoInd],[eitOrden])
									select [eitCveInd],[eitCveTipoInd],[eitOrden]
									from ManV2.EnlIndTipo with(nolock) where eitCveInd = ' + @CveIn
					print @cadSql2
					EXEC  (@cadSql2) 
				end
	--revisar que las claves de tipo de indicador existan
			--select * from prev2.TipoIndicador where tatrCve=''
			--select * from pubv2.TipoIndicador where tatrCve=''
		 while exists(select * from @tablaTipoInd )
		  begin
				set @RowInf=0
				select top 1 @cveTI = TipI  from @tablaTipoInd
				if EXISTS (select  * from PreV2.TipoIndicador with(nolock) where tatrCve = @cveTI)
				begin set @RowInf=1 end
				--select  @RowInf = COUNT(*) from PreV2.TipoIndicador with(nolock) where tatrCve = @cveTI
				 if @RowInf= 0
					Begin  
						set @cadSql1 = 'INSERT INTO preV2.TipoIndicador ([tatrCve],[tatrDescripP],[tatrDescripS],[tatrInforme],[tatrDescripPIng],[tatrDescripSIng],[tatrInformeIng])
									select [tatrCve],[tatrDescripP],[tatrDescripS],[tatrInforme],[tatrDescripPIng],[tatrDescripSIng],[tatrInformeIng]
									from ManV2.TipoIndicador with(nolock) where tatrCve = ''' + @cveTI + ''''
						print @cadSql1
						EXEC (@cadSql1) 
					end
					else
					begin
						select top 1  @campM1=tatrDescripP,@campM2=tatrDescripS,@campM3=tatrInforme,@campM4=tatrDescripPIng,@campM5=tatrDescripSIng,@campM6=tatrInformeIng   from ManV2.TipoIndicador with(nolock) where tatrCve=@cveTI
						select top 1  @campP1=tatrDescripP,@campP2=tatrDescripS,@campP3=tatrInforme,@campP4=tatrDescripPIng,@campP5=tatrDescripSIng,@campP6=tatrInformeIng   from PreV2.TipoIndicador with(nolock) where tatrCve=@cveTI
						if @campM1= @campP1 and @campM2= @campP2  and @campM3= @campP3 and @campM4= @campP4 and @campM5= @campP5 and @campM6= @campP6
						begin
							set @Igual='I'
						end
						else 
						begin 
							set @cadSql1 ='delete from preV2.TipoIndicador where tatrCve = ''' + @cveTI + ''''
							print @cadSql1
							EXEC (@cadSql1)
							set @cadSql2 = 'INSERT INTO preV2.TipoIndicador ([tatrCve],[tatrDescripP],[tatrDescripS],[tatrInforme],[tatrDescripPIng],[tatrDescripSIng],[tatrInformeIng])
											select [tatrCve],[tatrDescripP],[tatrDescripS],[tatrInforme],[tatrDescripPIng],[tatrDescripSIng],[tatrInformeIng]
											from ManV2.TipoIndicador with(nolock) where tatrCve = ''' + @cveTI + ''''
							print @cadSql2
							EXEC  (@cadSql2) 
						end
					end
				delete from @tablaTipoInd where TipI= @cveTI
			end
	--revisar enlaces entre indicador y palabras clave
		insert into @tablaPalCve select eipcCveDesPCve  from ManV2.EnlIndPCve with(nolock) where eipcCveInd= @CveIn
		set @RowInf=0
		set @RowInf2=0
		if EXISTS (select * from ManV2.EnlIndPCve with(nolock) where eipcCveInd= @CveIn)
		begin set @RowInf=1 end
		if EXISTS (select * from PreV2.EnlIndPCve with(nolock) where eipcCveInd= @CveIn)
		begin set @RowInf2=1 end
		--select  @RowInf = COUNT(*) from ManV2.EnlIndPCve with(nolock) where eipcCveInd= @CveIn
		--select  @RowInf2 = COUNT(*) from PreV2.EnlIndPCve with(nolock) where eipcCveInd= @CveIn
		set @banEnlIndPCve='False'
		--enlaces indicador palabras clave
		if @RowInf=@RowInf2
		begin
			while exists(select * from @tablaPalCve)
			 begin
				select top 1 @CvePalCve= cvePC  from @tablaPalCve
				set @RowInf=0
				if EXISTS (select * from PreV2.EnlIndPCve with(nolock) where eipcCveInd= @CveIn and eipcCveDesPCve = @CvePalCve)
				begin set @RowInf=1 end
				--select  @RowInf = COUNT(*) from PreV2.EnlIndPCve with(nolock) where eipcCveInd= @CveIn and eipcCveDesPCve = @CvePalCve
				 if @RowInf = 0
				 Begin  
						set @banEnlIndPCve = 'True'
				 end
				delete from @tablaPalCve where cvePC= @CvePalCve
			 end
			if @banEnlIndSer = 'True'
			begin
				set @cadSql1 ='delete from preV2.EnlIndPCve where  eipcCveInd = ' + @CveIn
				print @cadSql1
				EXEC (@cadSql1)
				set @cadSql2 = 'INSERT INTO preV2.EnlIndPCve ([eipcCveInd],[eipcCveDesPCve])
								select [eipcCveInd],[eipcCveDesPCve]
								from ManV2.EnlIndPCve with(nolock) where eipcCveInd = ' + @CveIn
				print @cadSql2
				EXEC  (@cadSql2) 
			end
		end 
		else
		begin
			set @cadSql1 ='delete from preV2.EnlIndPCve where  eipcCveInd = ' + @CveIn
			print @cadSql1
			EXEC (@cadSql1)
			set @cadSql2 = 'INSERT INTO preV2.EnlIndPCve ([eipcCveInd],[eipcCveDesPCve])
							select [eipcCveInd],[eipcCveDesPCve]
							from ManV2.EnlIndPCve with(nolock) where eipcCveInd = ' + @CveIn
			print @cadSql2
			EXEC  (@cadSql2) 
		end
	--revisar que las palabras clave existan
		insert into @tablaPalCve select eipcCveDesPCve  from ManV2.EnlIndPCve with(nolock) where eipcCveInd= @CveIn
		while exists(select * from @tablaPalCve )
		  begin
				select top 1  @CvePalCve = cvePC  from @tablaPalCve
				set @RowInf=0
				if EXISTS (select  * from PreV2.DescripcionPCve with(nolock) where dpcClave = @CvePalCve)
				begin set @RowInf=1 end
--				select  @RowInf = COUNT(*) from PreV2.DescripcionPCve with(nolock) where dpcClave = @CvePalCve
				 if @RowInf= 0
					Begin  
						set @cadSql1 = 'INSERT INTO preV2.DescripcionPCve ([dpcClave],[dpcDescrip],[dpcAbrevia],[dpcDescripIng],[dpcAbreviaIng])
									select [dpcClave],[dpcDescrip],[dpcAbrevia],[dpcDescripIng],[dpcAbreviaIng]
									from ManV2.DescripcionPCve with(nolock) where dpcClave= ' + @CvePalCve
						print @cadSql1
						EXEC (@cadSql1) 
					end
					else
					begin
						select top 1  @campM1=dpcDescrip,@campM2=dpcAbrevia,@campM3=dpcDescripIng,@campM4=dpcAbreviaIng  from ManV2.DescripcionPCve with(nolock) where dpcClave= @CvePalCve
						select top 1  @campP1=dpcDescrip,@campP2=dpcAbrevia,@campP3=dpcDescripIng,@campP4=dpcAbreviaIng  from PreV2.DescripcionPCve with(nolock) where dpcClave= @CvePalCve
						if @campM1= @campP1 and @campM2= @campP2  and @campM3= @campP3 and @campM4= @campP4
						begin
							set @Igual='I'
						end
						else 
						begin 
							set @cadSql1 ='delete from preV2.DescripcionPCve where dpcClave = ' + @CvePalCve
							print @cadSql1
							EXEC (@cadSql1)
							set @cadSql2 = 'INSERT INTO preV2.DescripcionPCve ([dpcClave],[dpcDescrip],[dpcAbrevia],[dpcDescriping],[dpcAbreviaing])
											select [dpcClave],[dpcDescrip],[dpcAbrevia],[dpcDescriping],[dpcAbreviaing]
											from ManV2.DescripcionPCve with(nolock) where dpcClave = ' + @CvePalCve
							print @cadSql2
							EXEC  (@cadSql2) 
						end
					end
				--revisar enlace y lexico de palabras clave
				set @cadSql1 ='delete from preV2.EnlacePCve where epcCveDesPCve = ' +  @CvePalCve
				print @cadSql1
				EXEC (@cadSql1)
				set @cadSql2 = 'INSERT INTO preV2.EnlacePCve ([epcCvePCve],[epcCveDesPCve])
											select [epcCvePCve],[epcCveDesPCve]
											from ManV2.EnlacePCve with(nolock) where epcCveDesPCve = ' +  @CvePalCve
				print @cadSql2
				EXEC  (@cadSql2)
				set @cadSql1 ='delete from preV2.EnlacePCveIng where epcCveDesPCveIng = ' +  @CvePalCve
				print @cadSql1
				EXEC (@cadSql1)
				set @cadSql2 = 'INSERT INTO preV2.EnlacePCveIng ([epcCvePCveIng],[epcCveDesPCveIng])
											select [epcCvePCveIng],[epcCveDesPCveIng]
											from ManV2.EnlacePCveIng with(nolock) where epcCveDesPCveIng = ' +  @CvePalCve
				print @cadSql2
				EXEC  (@cadSql2)
				insert into @tablaLexico select  epcCvePCve  from ManV2.EnlacePCve with(nolock) where epcCveDesPCve = @CvePalCve
				while exists(select * from @tablaLexico )
				begin
					select top 1 @CvePal = CvePal from @tablaLexico
					select top 1  @campM1=lpcPalabraCve from ManV2.LexicoPCve with(nolock) where  lpcClavePalCve = @CvePal 
					select top 1  @campP1=lpcPalabraCve  from PreV2.LexicoPCve with(nolock) where  lpcClavePalCve = @CvePal 
					if  @campM1= @campP1
					begin
						set @Igual='I'
					end
					else
					begin
						set @cadSql1 ='delete from preV2.LexicoPCve where lpcClavePalCve = ' +  @CvePal
						print @cadSql1
						EXEC (@cadSql1)
						set @cadSql2 = 'INSERT INTO preV2.LexicoPCve ([lpcClavePalCve],[lpcPalabraCve])
												select [lpcClavePalCve],[lpcPalabraCve]
												from ManV2.LexicoPCve with(nolock) where lpcClavePalCve = ' +  @CvePal
						print @cadSql2
						EXEC  (@cadSql2)	
					end
					delete from @tablaLexico where CvePal= @CvePal
				end
				insert into @tablaLexicoIng select  epcCvePCveIng  from ManV2.EnlacePCveIng with(nolock) where epcCveDesPCveIng =  @CvePalCve
				while exists(select * from @tablaLexicoIng )
				begin
					select top 1 @CvePalIng = CvePalIng from @tablaLexicoIng
					select top 1  @campM1=lpcPalabraCveIng  from ManV2.LexicoPCveing with(nolock) where  lpcClavePalCveIng = @CvePalIng 
					select top 1  @campP1=lpcPalabraCveIng  from PreV2.LexicoPCveing with(nolock) where  lpcClavePalCveIng = @CvePalIng 
					if  @campM1= @campP1
					begin
						set @Igual='I'
					end
					else
					begin
						set @cadSql1 ='delete from preV2.LexicoPCveIng where lpcClavePalCveIng = ' +  @CvePalIng
						print @cadSql1
						EXEC (@cadSql1)
						set @cadSql2 = 'INSERT INTO preV2.LexicoPCveIng ([lpcPalabraCveIng],[lpcClavePalCveIng])
												select [lpcPalabraCveIng],[lpcClavePalCveIng]
												from ManV2.LexicoPCveIng with(nolock) where lpcClavePalCveIng = ' +  @CvePalIng
						print @cadSql2
						EXEC (@cadSql1)
					end
					delete from @tablaLexicoIng where CvePalIng= @CvePalIng
				end
			 delete from @tablaPalCve where cvePC = @CvePalCve
			end
	
	--revisar enlace indicador-series
		--select * from prev2.EnlSerInd where esiClaveInd=339
		--select * from pubv2.EnlSerInd where esiClaveInd=339
		if @CveAtsSer<>''
		begin
		--declare @tablaSerie table (CveSr nvarchar(max), SerOrden nvarchar(max))
--declare @tablaSerie2 table (CveSr2 nvarchar(max), SerOrden2 nvarchar(max))
			set @cadSql1 =' declare @tablaSerie table (CveSr nvarchar(max), SerOrden nvarchar(max)) insert into @tablaSerie  select esiClaveSerie,esiOrden  from ManV2.EnlSerInd with(nolock) where esiClaveInd =' +  @CveIn  + 'and esiclaveserie in ('+ @CveAtsSer + ')'			
			EXEC (@cadSql1)
			set @cadSql2 ='declare @tablaSerie2 table (CveSr2 nvarchar(max), SerOrden2 nvarchar(max)) insert into @tablaSerie2  select esiClaveSerie,esiOrden  from ManV2.EnlSerInd with(nolock) where esiClaveInd =' +  @CveIn  + 'and esiclaveserie in ('+ @CveAtsSer + ')'
			EXEC (@cadSql2)
			--insert into @tablaSerie select esiClaveSerie,esiOrden  from ManV2.EnlSerInd with(nolock) where esiClaveInd = @CveIn and esiclaveserie in (@CveAtsSer)
			--insert into @tablaSerie2 select esiClaveSerie,esiOrden  from ManV2.EnlSerInd with(nolock) where esiClaveInd = @CveIn and esiclaveserie in (@CveAtsSer)
			set @RowInf=0
			set @RowInf2=0
			if EXISTS (select * from ManV2.EnlSerInd with(nolock) where esiClaveInd = @CveIn)
			begin set @RowInf=1 end
			if EXISTS (select * from PreV2.EnlSerInd with(nolock) where  esiClaveInd = @CveIn)
			begin set @RowInf2=1 end
			--select  @RowInf = COUNT(*) from ManV2.EnlSerInd with(nolock) where esiClaveInd = @CveIn
			--select  @RowInf2 = COUNT(*) from PreV2.EnlSerInd with(nolock) where  esiClaveInd = @CveIn
			set @banEnlIndSer='False'
			if @RowInf=@RowInf2
			begin
				while exists(select * from @tablaSerie2 )
				 begin
					select top 1 @cveSrs = CveSr2, @Orden=SerOrden2   from @tablaSerie2
					set @RowInf=0
					if EXISTS (select * from PreV2.EnlSerInd with(nolock) where  esiClaveInd = @CveIn and esiClaveSerie= @cveSrs and esiOrden= @Orden)
					begin set @RowInf=1 end
					--select  @RowInf = COUNT(*) from PreV2.EnlSerInd with(nolock) where  esiClaveInd = @CveIn and esiClaveSerie= @cveSrs and esiOrden= @Orden
					 if @RowInf = 0
					 Begin  
							set @banEnlIndSer = 'True'
					 end
					delete from @tablaSerie2 where CveSr2= @cveSrs
				 end
				if @banEnlIndSer = 'True'
				begin
					set @cadSql1 ='delete from preV2.EnlSerInd where  esiClaveInd = ' + @CveIn
					print @cadSql1
					EXEC (@cadSql1)
					set @cadSql2 = 'INSERT INTO preV2.EnlSerInd ([esiClaveInd],[esiClaveSerie],[esiOrden])
									select [esiClaveInd],[esiClaveSerie],[esiOrden]
									from ManV2.EnlSerInd with(nolock) where esiClaveInd= ' + @CveIn
					print @cadSql2
					EXEC  (@cadSql2) 
				end
			end 
			else
			begin
				set @cadSql1 ='delete from preV2.EnlSerInd where  esiClaveInd = ' + @CveIn
				print @cadSql1
				EXEC (@cadSql1)
				set @cadSql2 = 'INSERT INTO preV2.EnlSerInd ([esiClaveInd],[esiClaveSerie],[esiOrden])
								select [esiClaveInd],[esiClaveSerie],[esiOrden]
								from ManV2.EnlSerInd with(nolock) where esiClaveInd = ' + @CveIn
				print @cadSql2
				EXEC  (@cadSql2) 
			end
		end
	--revisar la ficha tecnica
		--select * from manv2.FichaTecnica where ftClave = 197
		--select * from prev2.FichaTecnica where ftClave = 197
		set @RowInf=0
		if EXISTS (select * from PreV2.FichaTecnica with(nolock) where ftclave=@CveFicha)
		begin set @RowInf=1 end
		--select  @RowInf = COUNT(*) from PreV2.FichaTecnica with(nolock) where ftclave=@CveFicha
		if @RowInf = 0
		Begin  
			set @cadSql1 = 'INSERT INTO preV2.FichaTecnica ([ftClave],[ftDefinicion],[ftAlgoritmo],[ftUnidad],[ftImportancia],[ftCobGeo],[ftPeriodo],[ftFecEsp],[ftObs],[ftDefinicionIng],[ftImportanciaIng],[ftObsIng],[ftFecEspIng],[ftDescripCal],[ftDescripCalIng],[ftOportunidad],[ftOportunidadIng],[ftCobGeoft],[ftAlgoritmoIng])
							select [ftClave],[ftDefinicion],[ftAlgoritmo],[ftUnidad],[ftImportancia],[ftCobGeo],[ftPeriodo],[ftFecEsp],[ftObs],[ftDefinicionIng],[ftImportanciaIng],[ftObsIng],[ftFecEspIng],[ftDescripCal],[ftDescripCalIng],[ftOportunidad],[ftOportunidadIng],[ftCobGeoft],[ftAlgoritmoIng]
							from ManV2.FichaTecnica with(nolock) where ftclave= ' + @CveFicha
			print @cadSql1
			EXEC (@cadSql1) 
		end
		else
		begin
			select top 1  @campM1=ftDefinicion,@campM2=ftAlgoritmo,@campM3=ftUnidad,@campM4=ftImportancia,@campM5=ftCobGeo,@campM6=ftPeriodo,@campM7=ftFecEsp,@campM8=ftObs,@campM9=ftDefinicionIng,@campM10=ftImportanciaIng,@campM11=ftObsIng,@campM12=ftFecEspIng,@campM13=ftDescripCal,@campM14=ftDescripCalIng,@campM15=ftOportunidad,@campM16=ftOportunidadIng,@campM17=ftCobGeoft  from ManV2.FichaTecnica with(nolock) where ftClave=@CveFicha
			select top 1  @campP1=ftDefinicion,@campP2=ftAlgoritmo,@campP3=ftUnidad,@campP4=ftImportancia,@campP5=ftCobGeo,@campP6=ftPeriodo,@campP7=ftFecEsp,@campP8=ftObs,@campP9=ftDefinicionIng,@campP10=ftImportanciaIng,@campP11=ftObsIng,@campP12=ftFecEspIng,@campP13=ftDescripCal,@campP14=ftDescripCalIng,@campP15=ftOportunidad,@campP16=ftOportunidadIng,@campP17=ftCobGeoft  from PreV2.FichaTecnica with(nolock) where ftClave=@CveFicha
			if @campM1= @campP1 and @campM2= @campP2 and @campM3= @campP3 and @campM4= @campP4 and @campM5= @campP5 and @campM6= @campP6 and @campM7= @campP7 and @campM8= @campP8 and @campM9= @campP9 and @campM10= @campP10 and @campM11= @campP11 and @campM12= @campP12 and @campM13= @campP13 and @campM14= @campP14 and @campM15= @campP15 and @campM16= @campP16 and @campM17= @campP17 
			begin
				set @Igual='I'
			end
			else 
			begin 
				set @cadSql1 ='delete from preV2.FichaTecnica  where ftclave= ' + @CveFicha
				print @cadSql1
				EXEC (@cadSql1)
				set @cadSql2 = 'INSERT INTO preV2.FichaTecnica  ([ftClave],[ftDefinicion],[ftAlgoritmo],[ftUnidad],[ftImportancia],[ftCobGeo],[ftPeriodo],[ftFecEsp],[ftObs],[ftDefinicionIng],[ftImportanciaIng],[ftObsIng],[ftFecEspIng],[ftDescripCal],[ftDescripCalIng],[ftOportunidad],[ftOportunidadIng],[ftCobGeoft],[ftAlgoritmoIng])
								select [ftClave],[ftDefinicion],[ftAlgoritmo],[ftUnidad],[ftImportancia],[ftCobGeo],[ftPeriodo],[ftFecEsp],[ftObs],[ftDefinicionIng],[ftImportanciaIng],[ftObsIng],[ftFecEspIng],[ftDescripCal],[ftDescripCalIng],[ftOportunidad],[ftOportunidadIng],[ftCobGeoft],[ftAlgoritmoIng]
								from ManV2.FichaTecnica with(nolock) where ftclave= ' + @CveFicha
				print @cadSql2
				EXEC  (@cadSql2) 
			end
		end
	--revisar  ficha tecnica y periodo
		--select * from prev2.Periodo where perClave=197
		--select * from pubv2.Periodo where perClave=197
		set @RowInf=0
		select top 1  @CvePer= ftPeriodo,@CveFtCob=ftCobGeoft  from ManV2.FichaTecnica with(nolock) where ftClave=@CveFicha
		if EXISTS (select  * from PreV2.Periodo with(nolock) where perClave=@CvePer)
		begin set @RowInf=1 end
		--select  @RowInf = COUNT(*) from PreV2.Periodo with(nolock) where perClave=@CvePer
		if @RowInf = 0
		Begin  
			set @cadSql1 = 'INSERT INTO preV2.Periodo ([perClave],[perDescrip],[perAbrevia],[perDescripIng],[perAbreviaIng])
							select [perClave],[perDescrip],[perAbrevia],[perDescripIng],[perAbreviaIng]
							from ManV2.Periodo with(nolock) where perClave=' + @CvePer
			print @cadSql1
			EXEC (@cadSql1) 
		end
		else
		begin
			select top 1  @campM1=perDescrip,@campM2=perDescripIng,@campM3=perAbrevia,@campM4=perAbreviaIng  from ManV2.Periodo with(nolock) where perClave=@CvePer
			select top 1  @campP1=perDescrip,@campP2=perDescripIng,@campP3=perAbrevia,@campP4=perAbreviaIng  from PreV2.Periodo with(nolock) where perClave=@CvePer
			if @campM1= @campP1 and @campM2= @campP2 and @campM3= @campP3 and @campM4= @campP4 
			begin
				set @Igual='I'
			end
			else 
			begin 
				set @cadSql1 ='delete from preV2.Periodo  where perClave=' + @CvePer
				print @cadSql1
				EXEC (@cadSql1)
				set @cadSql2 = 'INSERT INTO preV2.Periodo ([perClave],[perDescrip],[perAbrevia],[perDescripIng],[perAbreviaIng])
								select [perClave],[perDescrip],[perAbrevia],[perDescripIng],[perAbreviaIng]
								from ManV2.Periodo with(nolock) where perClave=' + @CvePer
				print @cadSql2
				EXEC  (@cadSql2) 
			end
		end
	--revisar  ficha tecnica y FTCob
		--select * from manv2.FTCob where fcgClave=197
		--select * from prev2.FTCob where fcgClave=197
		set @RowInf=0
		if EXISTS (select  * from PreV2.FTCob with(nolock) where fcgClave=@CveFtCob)
		begin set @RowInf=1 end
		--select  @RowInf = COUNT(*) from PreV2.FTCob with(nolock) where fcgClave=@CveFtCob
		if @RowInf = 0
		Begin  
			set @cadSql1 = 'INSERT INTO preV2.FTCob ([fcgClave],[fcgDescrip],[fcgDescripIng],[fcgAbrevia],[fcgAbreviaIng])
							select [fcgClave],[fcgDescrip],[fcgDescripIng],[fcgAbrevia],[fcgAbreviaIng]
							from ManV2.FTCob with(nolock) where fcgClave=' + @CveFtCob
			print @cadSql1
			EXEC (@cadSql1) 
		end
		else
		begin
			select top 1  @campM1=fcgDescrip,@campM2=fcgDescripIng,@campM3=fcgAbrevia,@campM4=fcgAbreviaIng from ManV2.FTCob with(nolock) where fcgClave=@CveFtCob
		select top 1  @campP1=fcgDescrip,@campP2=fcgDescripIng,@campP3=fcgAbrevia,@campP4=fcgAbreviaIng from PreV2.FTCob with(nolock) where fcgClave=@CveFtCob
		if @campM1= @campP1 and @campM2= @campP2 and @campM3= @campP3 and @campM4= @campP4 
			begin
				set @Igual='I'
			end
			else 
			begin 
				set @cadSql1 ='delete from preV2.FTCob where fcgClave=' + @CveFtCob
				print @cadSql1
				EXEC (@cadSql1)
				set @cadSql2 = 'INSERT INTO preV2.FTCob ([fcgClave],[fcgDescrip],[fcgDescripIng],[fcgAbrevia],[fcgAbreviaIng])
								select [fcgClave],[fcgDescrip],[fcgDescripIng],[fcgAbrevia],[fcgAbreviaIng]
								from ManV2.FTCob with(nolock) where fcgClave=' + @CveFtCob
				print @cadSql2
				EXEC  (@cadSql2) 
			end
		end
	--revisar enlaces entre ficha tecnica y fuentes
		--select * from manv2.EnlFTMFte where effClave=197
		--select * from prev2.EnlFTMFte where effClave=197
		set @RowInf=0
		set @RowInf2=0
		insert into @tablafue select effClaveFue  from ManV2.EnlFTMFte with(nolock) where effClave = @CveFicha
		if EXISTS (select * from ManV2.EnlFTMFte with(nolock) where effClave = @CveFicha)
		begin set @RowInf=1 end
		if EXISTS (select * from PreV2.EnlFTMFte with(nolock) where effClave = @CveFicha)
		begin set @RowInf2=1 end
		--select  @RowInf = COUNT(*) from ManV2.EnlFTMFte with(nolock) where effClave = @CveFicha
		--select  @RowInf2 = COUNT(*) from PreV2.EnlFTMFte with(nolock) where  effClave = @CveFicha
		set @banEnlIndSer='False'
		--enlaces fuente fichatecnica
		if @RowInf=@RowInf2
		begin
			while exists(select * from @tablafue)
			 begin
				select top 1 @CveFuente= cF  from @tablafue
				set @RowInf=0
				if EXISTS (select * from PreV2.EnlFTMFte with(nolock) where effClave  = @CveFicha and effClaveFue = @CveFuente)
				begin set @RowInf=1 end
				--select  @RowInf = COUNT(*) from PreV2.EnlFTMFte with(nolock) where effClave  = @CveFicha and effClaveFue = @CveFuente
				 if @RowInf = 0
				 Begin  
						set @banEnlIndSer = 'True'
				 end
				delete from @tablafue where cf= @CveFuente
			 end
			if @banEnlIndSer = 'True'
			begin
				set @cadSql1 ='delete from preV2.EnlFTMFte where  effClave = ' + @CveFicha
				print @cadSql1
				EXEC (@cadSql1)
				set @cadSql2 = 'INSERT INTO preV2.EnlFTMFte ([effClave],[effClaveFue],[effOrden])
								select [effClave],[effClaveFue],[effOrden]
								from ManV2.EnlFTMFte with(nolock) where effClave = ' + @CveFicha
				print @cadSql2
				EXEC  (@cadSql2) 
			end
		end 
		else
		begin
			set @cadSql1 ='delete from preV2.EnlFTMFte where  effClave = ' + @CveFicha
			print @cadSql1
			EXEC (@cadSql1)
			set @cadSql2 = 'INSERT INTO preV2.EnlFTMFte ([effClave],[effClaveFue],[effOrden])
							select [effClave],[effClaveFue],[effOrden]
							from ManV2.EnlFTMFte with(nolock) where effClave = ' + @CveFicha
			print @cadSql2
			EXEC  (@cadSql2) 
		end
		--fuentes
		insert into @tablafue select effClaveFue  from ManV2.EnlFTMFte with(nolock) where effClave = @CveFicha
		while exists(select * from @tablafue )
				 begin
						set @RowInf=0
						select top 1 @CveFuente = cF  from @tablafue
						if EXISTS (select * from PreV2.Fuentes with(nolock) where fueClave= @CveFuente)
						begin set @RowInf=1 end
						--select  @RowInf = COUNT(*) from PreV2.Fuentes with(nolock) where fueClave= @CveFuente
						 if @RowInf = 0
						 Begin  
								set @cadSql1 = 'INSERT INTO preV2.Fuentes ([fueClave],[fueDescrip],[fueDescripIng])
										select [fueClave],[fueDescrip],[fueDescripIng]
										from ManV2.Fuentes with(nolock) where fueClave= ' + @CveFuente
								print @cadSql1
								EXEC (@cadSql1) 
						 end
						 else
						 begin
								select top 1  @campM1=fueDescrip,@campM2=fueDescripIng from ManV2.Fuentes with(nolock) where fueClave=@CveFuente
								select top 1  @campP1=fueDescrip,@campP2=fueDescripIng from PreV2.Fuentes with(nolock) where fueClave=@CveFuente
								if @campM1= @campP1 and @campM2= @campP2	
								begin
									set @Igual='I'
								end
								else
								begin
									set @cadSql1 ='delete from preV2.Fuentes where  fueClave= ' + @CveFuente
									print @cadSql1
									EXEC (@cadSql1)
									set @cadSql2 = 'INSERT INTO preV2.Fuentes ([fueClave],[fueDescrip],[fueDescripIng])
											select [fueClave],[fueDescrip],[fueDescripIng]
											from ManV2.Fuentes with(nolock) where fueClave= ' + @CveFuente
									print @cadSql2
									EXEC  (@cadSql2) 
								end
						 end
						 
						delete from @tablafue where cF= @CveFuente
		end--while fuente
		--revisar enlaces entre ficha tecnica e instituciones
			--select * from manv2.EnlFTRInst where efiClave=197
			--select * from prev2.EnlFTRInst where efiClave=197
			
			--enlace institucion fichatecnica
			insert into @tablaIns select efiClaveInst  from ManV2.EnlFTRInst with(nolock) where efiClave = @CveFicha
			set @RowInf=0
			set @RowInf2=0
			if EXISTS (select  * from ManV2.EnlFTRInst with(nolock) where efiClave = @CveFicha)
			begin set @RowInf=1 end
			if EXISTS (select * from PreV2.EnlFTRInst with(nolock) where  efiClave = @CveFicha)
			begin set @RowInf2=1 end
			--select  @RowInf = COUNT(*) from ManV2.EnlFTRInst with(nolock) where efiClave = @CveFicha
			--select  @RowInf2 = COUNT(*) from PreV2.EnlFTRInst with(nolock) where  efiClave = @CveFicha
			set @banEnlIndSer='False'
			--enlaces fuente fichatecnica
			if @RowInf=@RowInf2
			begin
				while exists(select * from @tablaIns)
				 begin
					select top 1 @CveIns= cI from @tablaIns
					set @RowInf=0
					if EXISTS (select * from PreV2.EnlFTRInst with(nolock) where efiClave  = @CveFicha and efiClaveInst = @CveIns)
					begin set @RowInf=1 end
					--select  @RowInf = COUNT(*) from PreV2.EnlFTRInst with(nolock) where efiClave  = @CveFicha and efiClaveInst = @CveIns
					 if @RowInf = 0
					 Begin  
							set @banEnlIndSer = 'True'
					 end
					delete from @tablaIns where cI= @CveIns
				 end
				if @banEnlIndSer = 'True'
				begin
					set @cadSql1 ='delete from preV2.EnlFTRInst where  efiClave = ' + @CveFicha
					print @cadSql1
					EXEC (@cadSql1)
					set @cadSql2 = 'INSERT INTO preV2.EnlFTRInst ( [efiClave],[efiClaveInst],[efiOrden])
									select  [efiClave],[efiClaveInst],[efiOrden]
									from ManV2.EnlFTRInst with(nolock) where effClave = ' + @CveFicha
					print @cadSql2
					EXEC  (@cadSql2) 
				end
			end 
			else
			begin
				set @cadSql1 ='delete from preV2.EnlFTRInst where  efiClave = ' + @CveFicha
				print @cadSql1
				EXEC (@cadSql1)
				set @cadSql2 = 'INSERT INTO preV2.EnlFTRInst ( [efiClave],[efiClaveInst],[efiOrden])
								select  [efiClave],[efiClaveInst],[efiOrden]
								from ManV2.EnlFTRInst with(nolock) where efiClave = ' + @CveFicha
				print @cadSql2
				EXEC  (@cadSql2) 
			end
		
		--institucion	
			 insert into @tablaIns select efiClaveInst  from ManV2.EnlFTRInst with(nolock) where efiClave = @CveFicha
			 while exists(select * from @tablaIns )
				 begin
						select top 1 @CveIns = cI  from @tablaIns
						set @RowInf=0
						if EXISTS (select * from PreV2.Institucion with(nolock) where insClave= @CveIns)
						begin set @RowInf=1 end
						--select  @RowInf = COUNT(*) from PreV2.Institucion with(nolock) where insClave= @CveIns
						 if @RowInf = 0
						 Begin  
								set @cadSql1 = 'INSERT INTO preV2.Institucion ([insClave],[insDescrip],[insURL],[insAbrevia],[insDescripIng],[insAbreviaIng])
										select [insClave],[insDescrip],[insURL],[insAbrevia],[insDescripIng],[insAbreviaIng]
										from ManV2.Institucion with(nolock) where insClave=' +  @CveIns
								print @cadSql1
								EXEC (@cadSql1) 
						 end
						 else
						 begin
								select top 1  @campM1=insDescrip,@campM2=insDescripIng,@campM3=insAbrevia,@campM4=insAbreviaIng,@campM5=insURL from ManV2.Institucion with(nolock) where insClave=@CveIns
								select top 1  @campP1=insDescrip,@campP2=insDescripIng,@campP3=insAbrevia,@campP4=insAbreviaIng,@campP5=insURL from PreV2.Institucion with(nolock) where insClave=@CveIns
								if @campM1= @campP1 and @campM2= @campP2 and @campM3= @campP3 and @campM4= @campP4 and @campM5= @campP5	
								begin
									set @Igual='I'
								end
								else
								begin
									set @cadSql1 ='delete from preV2.Institucion where  insClave=' +  @CveIns
									print @cadSql1
									EXEC (@cadSql1)
									set @cadSql2 = 'INSERT INTO preV2.Institucion ([insClave],[insDescrip],[insURL],[insAbrevia],[insDescripIng],[insAbreviaIng])
											select [insClave],[insDescrip],[insURL],[insAbrevia],[insDescripIng],[insAbreviaIng]
											from ManV2.Institucion with(nolock) where insClave=' +  @CveIns
									print @cadSql2
									EXEC  (@cadSql2) 
								end
						 end
						 
						delete from @tablaIns where cI= @CveIns
			end--while instituciones
		--revisar enlaces entre ficha tecnica y referencia internacional
			--select * from manv2.EnlFTRRI where efrClave=197
			--select * from prev2.EnlFTRRI where efrClave=197
			--enlace referencia internacional fichatecnica
			insert into @tablaRI select efrClaveRI  from ManV2.EnlFTRRI with(nolock) where efrClave = @CveFicha
			set @RowInf=0
			set @RowInf2=0
			if EXISTS (select * from ManV2.EnlFTRRI with(nolock) where efrClave = @CveFicha)
			begin set @RowInf=1 end
			if EXISTS (select * from PreV2.EnlFTRRI with(nolock) where efrClave = @CveFicha)
			begin set @RowInf2=1 end
			--select  @RowInf = COUNT(*) from ManV2.EnlFTRRI with(nolock) where efrClave = @CveFicha
			--select  @RowInf2 = COUNT(*) from PreV2.EnlFTRRI with(nolock) where  efrClave = @CveFicha
			set @banEnlIndSer='False'
			--enlaces fuente fichatecnica
			if @RowInf=@RowInf2
			begin
				while exists(select * from @tablaRI)
				 begin
					select top 1 @CveRI= cR from @tablaRI
					set @RowInf=0
					if EXISTS (select  * from PreV2.EnlFTRRI with(nolock) where efrClave  = @CveFicha and efrClaveRI = @CveRI)
					begin set @RowInf=1 end
					--select  @RowInf = COUNT(*) from PreV2.EnlFTRRI with(nolock) where efrClave  = @CveFicha and efrClaveRI = @CveRI
					 if @RowInf = 0
					 Begin  
							set @banEnlIndSer = 'True'
					 end
					delete from @tablaRI where cR= @CveRI
				 end
				if @banEnlIndSer = 'True'
				begin
					set @cadSql1 ='delete from preV2.EnlFTRRI where  efrClave = ' + @CveFicha
					print @cadSql1
					EXEC (@cadSql1)
					set @cadSql2 = 'INSERT INTO preV2.EnlFTRRI ( [efrClave],[efrClaveRI],[efrOrden])
									select [efrClave],[efrClaveRI],[efrOrden]
									from ManV2.EnlFTRRI with(nolock) where efrClave = ' + @CveFicha
					print @cadSql2
					EXEC  (@cadSql2) 
				end
			end 
			else
			begin
				set @cadSql1 ='delete from preV2.EnlFTRRI where  efrClave = ' + @CveFicha
				print @cadSql1
				EXEC (@cadSql1)
				set @cadSql2 = 'INSERT INTO preV2.EnlFTRRI ( [efrClave],[efrClaveRI],[efrOrden])
								select  [efrClave],[efrClaveRI],[efrOrden]
								from ManV2.EnlFTRRI with(nolock) where efrClave = ' + @CveFicha
				print @cadSql2
				EXEC  (@cadSql2) 
			end
			
			--Referencia internacional
			 insert into @tablaRI select efrClaveRI  from ManV2.EnlFTRRI with(nolock) where efrClave = @CveFicha
			 while exists(select * from @tablaRI )
				 begin
						select top 1 @CveRI = cR  from @tablaRI
						set @RowInf=0
						if EXISTS (select * from PreV2.RefInter with(nolock) where riClave= @CveRI)
						begin set @RowInf=1 end
						--select  @RowInf = COUNT(*) from PreV2.RefInter with(nolock) where riClave= @CveRI
						 if @RowInf = 0
						 Begin  
								set @cadSql1 = 'INSERT INTO preV2.RefInter ([riClave],[riDescrip],[riDescripIng])
										select [riClave],[riDescrip],[riDescripIng]
										from ManV2.RefInter with(nolock) where riClave=' + @CveRI
								print @cadSql1
								EXEC (@cadSql1) 
						 end
						 else
						 begin
								select top 1  @campM1=riDescrip,@campM2=riDescripIng  from ManV2.RefInter with(nolock) where riClave=@CveRI
								select top 1  @campP1=riDescrip,@campP2=riDescripIng  from PreV2.RefInter with(nolock) where riClave=@CveRI
								if @campM1= @campP1 and @campM2= @campP2	
								begin
									set @Igual='I'
								end
								else
								begin
									set @cadSql1 ='delete from preV2.RefInter where riClave=' + @CveRI
									print @cadSql1
									EXEC (@cadSql1)
									set @cadSql2 = 'INSERT INTO preV2.RefInter ([riClave],[riDescrip],[riDescripIng])
											select [riClave],[riDescrip],[riDescripIng]
											from ManV2.RefInter with(nolock) where riClave=' + @CveRI
									print @cadSql2
									EXEC  (@cadSql2) 
								end
						 end
						 
						delete from @tablaRI where cR= @CveRI
			end--while Referencia internacional
		--revisar enlaces entre ficha tecnica y contacto
			--select * from manv2.EnlFTCon where efcClaveFT=197
			--select * from prev2.EnlFTCon where efcClaveFT=197	 
			--enlace contacto ficha tecnica
			--enlace referencia internacional fichatecnica
			insert into @tablaCo select efcClaveCon  from ManV2.EnlFTCon with(nolock) where efcClaveFT = @CveFicha
			set @RowInf=0
			set @RowInf2=0
			if EXISTS (select * from ManV2.EnlFTCon with(nolock) where efcClaveFT = @CveFicha)
			begin set @RowInf=1 end
			if EXISTS (select * from PreV2.EnlFTCon with(nolock) where  efcClaveFT = @CveFicha)
			begin set @RowInf2=1 end
			--select  @RowInf = COUNT(*) from ManV2.EnlFTCon with(nolock) where efcClaveFT = @CveFicha
			--select  @RowInf2 = COUNT(*) from PreV2.EnlFTCon with(nolock) where  efcClaveFT = @CveFicha
			set @banEnlIndSer='False'
			--enlaces fuente fichatecnica
			if @RowInf=@RowInf2
			begin
				while exists(select * from @tablaCo)
				 begin
					select top 1 @CveCo= cC from @tablaCo
					set @RowInf=0
					if EXISTS (select * from PreV2.EnlFTCon with(nolock) where efcClaveFT  = @CveFicha and efcClaveCon = @CveCo)
					begin set @RowInf=1 end
					--select  @RowInf = COUNT(*) from PreV2.EnlFTCon with(nolock) where efcClaveFT  = @CveFicha and efcClaveCon = @CveCo
					 if @RowInf = 0
					 Begin  
							set @banEnlIndSer = 'True'
					 end
					delete from @tablaCo where cC= @CveCo
				 end
				if @banEnlIndSer = 'True'
				begin
					set @cadSql1 ='delete from preV2.EnlFTCon where  efcClaveFT = ' + @CveFicha
					print @cadSql1
					EXEC (@cadSql1)
					set @cadSql2 = 'INSERT INTO preV2.EnlFTCon ([efcClaveFT],[efcClaveCon],[efcOrden])
									select [efcClaveFT],[efcClaveCon],[efcOrden]
									from ManV2.EnlFTCon with(nolock) where efcClaveFT = ' + @CveFicha
					print @cadSql2
					EXEC  (@cadSql2) 
				end
			end 
			else
			begin
				set @cadSql1 ='delete from preV2.EnlFTCon where  efcClaveFT = ' + @CveFicha
				print @cadSql1
				EXEC (@cadSql1)
				set @cadSql2 = 'INSERT INTO preV2.EnlFTCon ( [efcClaveFT],[efcClaveCon],[efcOrden])
								select  [efcClaveFT],[efcClaveCon],[efcOrden]
								from ManV2.EnlFTCon with(nolock) where efcClaveFT = ' + @CveFicha
				print @cadSql2
				EXEC  (@cadSql2) 
			end
			--contacto
			 insert into @tablaCo select efcClaveCon  from ManV2.EnlFTCon with(nolock) where efcClaveFT = @CveFicha
			 while exists(select * from @tablaCo )
				 begin
						select top 1 @CveCo = cC  from @tablaCo
						set @RowInf=0
						if EXISTS (select * from PreV2.Contacto with(nolock) where conClave= @CveCo)
						begin set @RowInf=1 end
						--select  @RowInf = COUNT(*) from PreV2.Contacto with(nolock) where conClave= @CveCo
						 if @RowInf = 0
						 Begin  
								set @cadSql1 = 'INSERT INTO preV2.Contacto ([conClave],[conNombre],[conPuesto],[conTelefono],[conCorreo],[conDomicilio])
										select [conClave],[conNombre],[conPuesto],[conTelefono],[conCorreo],[conDomicilio]
										from ManV2.Contacto with(nolock) where conClave= ' + @CveCo
								print @cadSql1
								EXEC (@cadSql1) 
						 end
						 else
						 begin
								select top 1  @campM1=conNombre, @campM2=conPuesto, @campM3=conTelefono, @campM4=conCorreo, @campM5=conDomicilio  from ManV2.Contacto with(nolock) where conClave=@CveCo
								select top 1  @campP1=conNombre, @campP2=conPuesto, @campP3=conTelefono, @campP4=conCorreo, @campP5=conDomicilio  from PreV2.Contacto with(nolock) where conClave=@CveCo
								if @campM1= @campP1 and @campM2= @campP2 and @campM3= @campP3 and @campM4= @campP4 and @campM5= @campP5	
								begin
									set @Igual='I'
								end
								else
								begin
									set @cadSql1 ='delete from preV2.Contacto where conClave= ' + @CveCo
									print @cadSql1
									EXEC (@cadSql1)
									set @cadSql2 = 'INSERT INTO preV2.Contacto ([conClave],[conNombre],[conPuesto],[conTelefono],[conCorreo],[conDomicilio])
											select [conClave],[conNombre],[conPuesto],[conTelefono],[conCorreo],[conDomicilio]
											from ManV2.Contacto with(nolock) where conClave= ' + @CveCo
									print @cadSql2
									EXEC  (@cadSql2) 
								end
						 end
						 
						delete from @tablaCo where cC= @CveCo
			end--while contacto				 
	
	--revisar atributos de las series
		--declare @tablaSerie table (CveSr nvarchar(max), CveDescr nvarchar(max), CveFrec nvarchar(max), CveNota nvarchar(max), CveFuente nvarchar(max), CveUni nvarchar(max), CveAgClas nvarchar (max),CveAgCob nvarchar(max))
		--select * from manv2.AtrSerie where atsClaveSerie in (822,823,824)
		--select * from prev2.AtrSerie where atsClaveSerie in (822,823,824)
		if @CveAtsSer<>''
		begin
		 while exists(select * from @tablaSerie )
		  begin
				select top 1 @cveSrs = CveSr from @tablaSerie 
				--revisar notas de los datos
				
				  insert into @tablaNotasDatos   select sernota  from ManV2.serie with(nolock) where serclave = @cveSrs and serNota<>0
				  while exists(select * from @tablaNotasDatos  )
					 begin
						select top 1 @cveNotasDat = cveNotDat from @tablaNotasDatos 
						if @cveNotasDat IS not NULL  and @cveNotasDat <>0
						begin
							print 'Nota en datos'
							select top 1  @campM1= notClave, @campM2=notNota, @campM3=notNotaIng  from ManV2.Notas with(nolock) where notClave = @cveNotasDat
							select top 1  @campP1= notClave, @campP2=notNota, @campP3=notNotaIng  from PreV2.Notas with(nolock) where notClave = @cveNotasDat
							if @campM1= @campP1 and @campM2= @campP2 and @campM3= @campP3 
							Begin  
								set @Igual='I'
							end
							else
							begin
								print 'Nota en datos ejec'
								print @cveNotasDat
								set @cadSql1 ='delete from preV2.notas where notclave = ' + Convert(nvarchar(255),@cveNotasDat)
								print 'Nota en datos despues'
								print @cadSql1
								EXEC (@cadSql1)
								set @cadSql2 = 'INSERT INTO preV2.Notas ([notclave],[notnota],[notnotaIng])
									select [notclave],[notnota],[notnotaIng]
									from ManV2.Notas with(nolock) where notclave = ' + Convert(nvarchar(255),@cveNotasDat)
								print @cadSql2
								EXEC  (@cadSql2) 
							end
						end
						delete from @tablaNotasDatos where cveNotDat= @cveNotasDat
					 end
				
		   
				--insert into @tablaAtrSer select atsClaveSerie,atsClaveDescrip,atsClaveFre,atsClaveNota,atsClaveFuente,atsClaveUnidad,atsClaveAgrupaCob,atsClaveAgrupaClas  from ManV2.AtrSerie with(nolock) where atsClaveSerie = @CveSrs
				select top 1  @CveDescr=atsClaveDescrip, @CveFrec=atsClaveFre, @CveNota=atsClaveNota,  @CveFuente=atsClaveFuente,@CveUni=atsClaveUnidad,@CveAgCob=atsClaveAgrupaCob,@CveAgClas=atsClaveAgrupaClas from ManV2.AtrSerie with(nolock) where atsClaveSerie=@cveSrs
				--atrSerie
				set @RowInf=0
				if EXISTS (select * from PreV2.AtrSerie with(nolock) where atsClaveSerie = @cveSrs)
				begin set @RowInf=1 end
				--select  @RowInf = COUNT(*) from PreV2.AtrSerie with(nolock) where atsClaveSerie = @cveSrs
				 if @RowInf= 0
					Begin  
						set @cadSql1 = 'INSERT INTO preV2.AtrSerie ([atsClaveSerie],[atsClaveDescrip] ,[atsClaveFre] ,[atsAAPrelim],[atsMMPrelim],[atsDDPrelim],[atsAAEst],[atsMMEst],[atsDDEst],[atsDecimales],[atsClaveNota],[atsClaveFT],[atsClaveFuente],[atsClaveUnidad],[atsTipo] ,[atsSalida],[atsAARev],[atsMMRev],[atsDDRev],[atsClaveAgrupaCob],[atsClaveAgrupaClas],[atsColMatriz],[atsColMatrizIng],[atsTipoGra],[atsInicio],[atsTipoCua])
									select [atsClaveSerie],[atsClaveDescrip] ,[atsClaveFre] ,[atsAAPrelim],[atsMMPrelim],[atsDDPrelim],[atsAAEst],[atsMMEst],[atsDDEst],[atsDecimales],[atsClaveNota],[atsClaveFT],[atsClaveFuente],[atsClaveUnidad],[atsTipo] ,[atsSalida],[atsAARev],[atsMMRev],[atsDDRev],[atsClaveAgrupaCob],[atsClaveAgrupaClas],[atsColMatriz],[atsColMatrizIng],[atsTipoGra],[atsInicio],[atsTipoCua]
									from ManV2.AtrSerie with(nolock) where atsClaveSerie = ' + @cveSrs
						print @cadSql1
						EXEC (@cadSql1) 
					end
					else
					begin
						select top 1  @campM1=atsClaveDescrip, @campM2=atsClaveFre, @campM3=atsAAPrelim, @campM4=atsMMPrelim, @campM5=atsDDPrelim, @campM6=atsAAEst, @campM7=atsMMEst, @campM8=atsDDEst, @campM9=atsDecimales, @campM10=atsClaveNota, @campM11=atsClaveFT, @campM12=atsClaveFuente,@campM13=atsClaveUnidad,@campM14=atsTipo,@campM15=atsSalida,@campM16=atsAARev,@campM17=atsMMRev,@campM18=atsDDRev,@campM19=atsClaveAgrupaCob,@campM20=atsClaveAgrupaClas,@campM21=atsColMatriz,@campM22=atsColMatrizIng,@campM23=atsTipoGra,@campM24=atsInicio,@campM25=atsTipoCua  from ManV2.AtrSerie with(nolock) where atsClaveSerie=@cveSrs
						select top 1  @campP1=atsClaveDescrip, @campP2=atsClaveFre, @campP3=atsAAPrelim, @campP4=atsMMPrelim, @campP5=atsDDPrelim, @campP6=atsAAEst, @campP7=atsMMEst, @campP8=atsDDEst, @campP9=atsDecimales, @campP10=atsClaveNota, @campP11=atsClaveFT, @campP12=atsClaveFuente,@campP13=atsClaveUnidad,@campP14=atsTipo,@campP15=atsSalida,@campP16=atsAARev,@campP17=atsMMRev,@campP18=atsDDRev,@campP19=atsClaveAgrupaCob,@campP20=atsClaveAgrupaClas,@campP21=atsColMatriz,@campP22=atsColMatrizIng,@campP23=atsTipoGra,@campP24=atsInicio,@campP25=atsTipoCua  from PreV2.AtrSerie with(nolock) where atsClaveSerie=@cveSrs
						if @campM1= @campP1 and @campM2= @campP2 and @campM3= @campP3 and @campM4= @campP4  and @campM5= @campP5  and @campM6= @campP6  and @campM7= @campP7  and @campM8= @campP8 and @campM9= @campP9  and @campM10= @campP10 and @campM11= @campP11 and @campM12= @campP12 and @campM13= @campP13 and @campM14= @campP14 and @campM15= @campP15 and @campM16= @campP16 and @campM17= @campP17 and @campM18= @campP18 and @campM19= @campP19 and @campM20= @campP20 and @campM21= @campP21 and @campM22= @campP22 and @campM23= @campP23 and @campM24= @campP24 and @campM25= @campP25                                
						begin
							set @Igual='I'
						end
						else 
						begin 
							set @cadSql1 ='delete from preV2.AtrSerie where atsClaveSerie = ' + @cveSrs
							print @cadSql1
							EXEC (@cadSql1)
							set @cadSql2 = 'INSERT INTO preV2.AtrSerie ([atsClaveSerie],[atsClaveDescrip] ,[atsClaveFre] ,[atsAAPrelim],[atsMMPrelim],[atsDDPrelim],[atsAAEst],[atsMMEst],[atsDDEst],[atsDecimales],[atsClaveNota],[atsClaveFT],[atsClaveFuente],[atsClaveUnidad],[atsTipo] ,[atsSalida],[atsAARev],[atsMMRev],[atsDDRev],[atsClaveAgrupaCob],[atsClaveAgrupaClas],[atsColMatriz],[atsColMatrizIng],[atsTipoGra],[atsInicio],[atsTipoCua])
											select [atsClaveSerie],[atsClaveDescrip] ,[atsClaveFre] ,[atsAAPrelim],[atsMMPrelim],[atsDDPrelim],[atsAAEst],[atsMMEst],[atsDDEst],[atsDecimales],[atsClaveNota],[atsClaveFT],[atsClaveFuente],[atsClaveUnidad],[atsTipo] ,[atsSalida],[atsAARev],[atsMMRev],[atsDDRev],[atsClaveAgrupaCob],[atsClaveAgrupaClas],[atsColMatriz],[atsColMatrizIng],[atsTipoGra],[atsInicio],[atsTipoCua]
											from ManV2.AtrSerie with(nolock) where atsClaveSerie = ' + @cveSrs
							print @cadSql2
							EXEC  (@cadSql2) 
						end
					end
				--Descripcion
				--revisar claves de descripcion
				--select * from manv2.Descripcion where desClave  in (1055,1193,1195)
				--select * from prev2.Descripcion where desClave  in (1055,1193,1195)
				set @RowInf=0
				if EXISTS (select * from PreV2.Descripcion with(nolock) where desClave = @CveDescr)
				begin set @RowInf=1 end
				--select  @RowInf = COUNT(*) from PreV2.Descripcion with(nolock) where desClave = @CveDescr
				 if @RowInf= 0
					Begin  
						set @cadSql1 = 'INSERT INTO preV2.Descripcion ([desClave],[desDescrip],[desAbrevia],[desCodigo],[desDescripIng],[desAbreviaIng],[desCodigoIng])
									select [desClave],[desDescrip],[desAbrevia],[desCodigo],[desDescripIng],[desAbreviaIng],[desCodigoIng]
									from ManV2.Descripcion with(nolock) where desClave = ' +  @CveDescr
						print @cadSql1
						EXEC (@cadSql1) 
					end
					else
					begin
						select top 1  @campM1=desdescrip, @campM2=desAbrevia, @campM3=desCodigo, @campM4=desDescripIng, @campM5=desAbreviaIng, @campM6=desCodigoIng  from ManV2.Descripcion with(nolock) where desclave=@CveDescr
						select top 1  @campP1=desdescrip, @campP2=desAbrevia, @campP3=desCodigo, @campP4=desDescripIng, @campP5=desAbreviaIng, @campP6=desCodigoIng  from PreV2.Descripcion with(nolock) where desclave=@CveDescr
						if @campM1= @campP1 and @campM2= @campP2 and @campM3= @campP3 and @campM4= @campP4 and @campM5= @campP5 and @campM6= @campP6
						begin
							set @Igual='I'
						end
						else 
						begin 
							set @cadSql1 ='delete from preV2.Descripcion where desClave = ' +  @CveDescr
							print @cadSql1
							EXEC (@cadSql1)
							set @cadSql2 = 'INSERT INTO preV2.Descripcion ([desClave],[desDescrip],[desAbrevia],[desCodigo],[desDescripIng],[desAbreviaIng],[desCodigoIng])
											select [desClave],[desDescrip],[desAbrevia],[desCodigo],[desDescripIng],[desAbreviaIng],[desCodigoIng]
											from ManV2.Descripcion with(nolock) where desClave = ' +  @CveDescr
							print @cadSql2
							EXEC  (@cadSql2) 
						end
					end
				----revisar enlace y lexico de la descripcion
				--set @cadSql1 ='delete from preV2.Enlace where enlClaveDescrip = ' +  @CveDescr
				--print @cadSql1
				--EXEC (@cadSql1)
				--set @cadSql2 = 'INSERT INTO preV2.Enlace ([enlClavePalabra],[enlClaveDescrip])
				--							select [enlClavePalabra],[enlClaveDescrip]
				--							from ManV2.Enlace with(nolock) where enlClaveDescrip = ' +  @CveDescr
				--print @cadSql2
				--EXEC  (@cadSql2)
				--set @cadSql1 ='delete from preV2.EnlaceIng where enlClaveDescripIng = ' +  @CveDescr
				--print @cadSql1
				--EXEC (@cadSql1)
				--set @cadSql2 = 'INSERT INTO preV2.EnlaceIng ([enlClavePalabraIng],[enlClaveDescripIng])
				--							select [enlClavePalabraIng],[enlClaveDescripIng]
				--							from ManV2.EnlaceIng with(nolock) where enlClaveDescripIng = ' +  @CveDescr
				--print @cadSql2
				--EXEC  (@cadSql2)
				--insert into @tablaLexico select  enlClavePalabra  from ManV2.Enlace with(nolock) where enlClaveDescrip = @CveDescr
				--print 'clave de palabra'
				--print @CveDescr
				--while exists(select * from @tablaLexico )
				--begin
				--	select top 1 @CvePal = CvePal from @tablaLexico
				--	select top 1  @campM1=lexPalabra  from ManV2.Lexico with(nolock) where  lexClavePalabra = @CvePal 
				--	select top 1  @campP1=lexPalabra  from PreV2.Lexico with(nolock) where  lexClavePalabra = @CvePal 
				--	print @CvePal
				--	if  @campM1= @campP1
				--	begin
				--		set @Igual='I'
				--	end
				--	else
				--	begin
				--		set @cadSql1 ='delete from preV2.Lexico where lexclavepalabra = ' +  @CvePal
				--		print @cadSql1
				--		EXEC (@cadSql1)
				--		set @cadSql2 = 'INSERT INTO preV2.Lexico ([lexclavepalabra],[lexPalabra])
				--								select [lexclavepalabra],[lexPalabra]
				--								from ManV2.Lexico with(nolock) where lexclavepalabra = ' +  @CvePal
				--		print @cadSql2
				--		EXEC  (@cadSql2)	
				--	end
				--	delete from @tablaLexico where CvePal= @CvePal
		  --      end
		  --      insert into @tablaLexicoIng select  enlClavePalabraIng  from ManV2.EnlaceIng with(nolock) where enlClaveDescripIng = @CveDescr
				--while exists(select * from @tablaLexicoIng )
				--begin
				--	select top 1 @CvePalIng = CvePalIng from @tablaLexicoIng
				--	select top 1  @campM1=lexPalabraing  from ManV2.Lexicoing with(nolock) where  lexClavePalabraing = @CvePalIng 
				--	select top 1  @campP1=lexPalabraing  from PreV2.Lexicoing with(nolock) where  lexClavePalabraing = @CvePalIng 
				--	if  @campM1= @campP1
				--	begin
				--		set @Igual='I'
				--	end
				--	else
				--	begin
				--		set @cadSql1 ='delete from preV2.LexicoIng where lexclavepalabraIng = ' +  @CvePalIng
				--		print @cadSql1
				--		EXEC (@cadSql1)
				--		set @cadSql2 = 'INSERT INTO preV2.LexicoIng ([lexclavepalabraIng],[lexPalabraIng])
				--								select [lexclavepalabraIng],[lexPalabraIng]
				--								from ManV2.LexicoIng with(nolock) where lexclavepalabraIng = ' +  @CvePalIng
				--		print @cadSql2
				--		EXEC  (@cadSql2)
				--	end
				--	delete from @tablaLexicoIng where CvePalIng= @CvePalIng
		  --      end
				 
					
				--Frecuencia
				--revisar la clave de frecuencia de las series
				--select * from prev2.Frecuencia where freClave = 13
				--select * from pubv2.Frecuencia where freClave = 13
				set @RowInf=0
				if EXISTS (select * from PreV2.Frecuencia with(nolock) where freClave = @CveFrec)
				begin set @RowInf=1 end
				--select  @RowInf = COUNT(*) from PreV2.Frecuencia with(nolock) where freClave = @CveFrec
				 if @RowInf= 0
					Begin  
						set @cadSql1 = 'INSERT INTO preV2.Frecuencia ([freClave],[freDescrip],[freCodigo],[freNumAA],[freNumMM],[freNumQQ],[freTipo],[freDescripIng])
									select [freClave],[freDescrip],[freCodigo],[freNumAA],[freNumMM],[freNumQQ],[freTipo],[freDescripIng]
									from ManV2.Frecuencia with(nolock) where freClave = ' + @CveFrec
						print @cadSql1
						EXEC (@cadSql1) 
					end
					else
					begin
						select top 1  @campM1=freDescrip,@campM2=freCodigo,@campM3=freNumAA,@campM4=freNumMM,@campM5=freNumQQ,@campM6=freTipo,@campM7=freDescripIng from ManV2.Frecuencia with(nolock) where freClave=@CveFrec
						select top 1  @campP1=freDescrip,@campP2=freCodigo,@campP3=freNumAA,@campP4=freNumMM,@campP5=freNumQQ,@campP6=freTipo,@campP7=freDescripIng from PreV2.Frecuencia with(nolock) where freClave=@CveFrec
						if @campM1= @campP1 and @campM2= @campP2 and @campM3= @campP3 and @campM4= @campP4 and @campM5= @campP5 and @campM6= @campP6 and @campM7= @campP7
						begin
							set @Igual='I'
						end
						else 
						begin 
							set @cadSql1 ='delete from preV2.Frecuencia where freClave = ' + @CveFrec
							print @cadSql1
							EXEC (@cadSql1)
							set @cadSql2 = 'INSERT INTO preV2.Frecuencia ([freClave],[freDescrip],[freCodigo],[freNumAA],[freNumMM],[freNumQQ],[freTipo],[freDescripIng])
											select [freClave],[freDescrip],[freCodigo],[freNumAA],[freNumMM],[freNumQQ],[freTipo],[freDescripIng]
											from ManV2.Frecuencia with(nolock) where freClave = ' + @CveFrec
							print @cadSql2
							EXEC  (@cadSql2) 
						end
					end
				--revisar las claves de nota de las series
					--select * from manv2.Notas where notClave=290
					--select * from prev2.Notas where notClave=290
				 set @RowInf=0	
				 if EXISTS (select * from PreV2.Notas with(nolock) where notClave = @CveNota)
				 begin set @RowInf=1 end
				 --select  @RowInf = COUNT(*) from PreV2.Notas with(nolock) where notClave = @CveNota
				 if @RowInf= 0
					Begin  
						set @cadSql1 = 'INSERT INTO preV2.Notas ([notClave],[NotNota],[NotNotaIng])
									select [notClave],[NotNota],[NotNotaIng]
									from ManV2.Notas with(nolock) where notClave = ' + Convert(nvarchar(255),@CveNota)
						print @cadSql1
						EXEC (@cadSql1) 
					end
					else
					begin
						select top 1  @campM1=notNota,@campM2=notNotaIng from ManV2.Notas with(nolock) where notClave=@CveNota
						select top 1  @campP1=notNota,@campP2=notNotaIng from PreV2.Notas with(nolock) where notClave=@CveNota
						if @campM1= @campP1 and @campM2= @campP2 
						begin
							set @Igual='I'
						end
						else 
						begin 
							set @cadSql1 ='delete from preV2.Notas where notClave = ' + Convert(nvarchar(255),@CveNota)
							print 'Nota en serie'
							print @cadSql1
							EXEC (@cadSql1)
							set @cadSql2 = 'INSERT INTO preV2.Notas ([notClave],[NotNota],[NotNotaIng])
											select [notClave],[NotNota],[NotNotaIng]
											from ManV2.Notas with(nolock) where notClave = ' + Convert(nvarchar(255),@CveNota)
							print @cadSql2
							EXEC  (@cadSql2) 
						end
					end
				--revisar las claves de fuente de las series
				--select * from manv2.Fuentes where fueClave=415
				--select * from prev2.Fuentes where fueClave=415
				set @RowInf=0
				if EXISTS (select * from PreV2.Fuentes with(nolock) where fueClave = @CveFuente)
				begin set @RowInf=1 end
				--select  @RowInf = COUNT(*) from PreV2.Fuentes with(nolock) where fueClave = @CveFuente
				 if @RowInf= 0
					Begin  
						set @cadSql1 = 'INSERT INTO preV2.Fuentes ([fueClave],[fueDescrip],[fueDescripIng])
									select [fueClave],[fueDescrip],[fueDescripIng]
									from ManV2.Fuentes with(nolock) where fueClave = ' + @CveFuente
						print @cadSql1
						EXEC (@cadSql1) 
					end
					else
					begin
						select top 1  @campM1=fueDescrip,@campM2=fueDescripIng from ManV2.Fuentes with(nolock) where fueClave=@CveFuente
						select top 1  @campP1=fueDescrip,@campP2=fueDescripIng from PreV2.Fuentes with(nolock) where fueClave=@CveFuente
						if @campM1= @campP1 and @campM2= @campP2
						begin
							set @Igual='I'
						end
						else 
						begin 
							set @cadSql1 ='delete from preV2.Fuentes where fueClave = ' + @CveFuente
							print @cadSql1
							EXEC (@cadSql1)
							set @cadSql2 = 'INSERT INTO preV2.Fuentes ([fueClave],[fueDescrip],[fueDescripIng])
											select [fueClave],[fueDescrip],[fueDescripIng]
											from ManV2.Fuentes with(nolock) where fueClave = ' + @CveFuente
							print @cadSql2
							EXEC  (@cadSql2) 
						end
					end
				--revisar las claves de unidad de las series
				--select * from manv2.Unidad where uniClave in (60,257)
				--select * from prev2.Unidad where uniClave in (60,257)
				set @RowInf=0
				if EXISTS (select * from PreV2.Unidad with(nolock) where uniClave = @CveUni)
				begin set @RowInf=1 end
				 --select  @RowInf = COUNT(*) from PreV2.Unidad with(nolock) where uniClave = @CveUni
				 if @RowInf= 0
					Begin  
						set @cadSql1 = 'INSERT INTO preV2.Unidad ([uniClave],[uniDescrip],[uniAbrevia],[uniDescripIng],[uniAbreviaIng])
									select [uniClave],[uniDescrip],[uniAbrevia],[uniDescripIng],[uniAbreviaIng]
									from ManV2.Unidad with(nolock) where uniClave = ' + @CveUni
						print @cadSql1
						EXEC (@cadSql1) 
					end
					else
					begin
						select top 1  @campM1=uniDescrip,@campM2=uniDescripIng,@campM3=uniAbrevia,@campM4=uniAbreviaIng   from ManV2.Unidad with(nolock) where uniClave=@CveUni
						select top 1  @campP1=uniDescrip,@campP2=uniDescripIng,@campP3=uniAbrevia,@campP4=uniAbreviaIng   from PreV2.Unidad with(nolock) where uniClave=@CveUni
						if @campM1= @campP1 and @campM2= @campP2  and @campM3= @campP3 and @campM4= @campP4
						begin
							set @Igual='I'
						end
						else 
						begin 
							set @cadSql1 ='delete from preV2.Unidad where uniClave = ' + @CveUni
							print @cadSql1
							EXEC (@cadSql1)
							set @cadSql2 = 'INSERT INTO preV2.Unidad ([uniClave],[uniDescrip],[uniAbrevia],[uniDescripIng],[uniAbreviaIng])
											select [uniClave],[uniDescrip],[uniAbrevia],[uniDescripIng],[uniAbreviaIng]
											from ManV2.Unidad with(nolock) where uniClave = ' + @CveUni
							print @cadSql2
							EXEC  (@cadSql2) 
						end
					end
					--revisar AtrPeriodoPorInd
					insert into @tablaPerInd   select apiPerAA, apiPerMM, apiPerDD, apiCveNota  from ManV2.AtrPeriodoPorInd with(nolock) where apiCveSer = @cveSrs
					set @RowInf=0
					set @RowInf2=0
					if EXISTS (select * from ManV2.AtrPeriodoPorInd with(nolock) where apiCveSer=  @cveSrs)
					begin set @RowInf=1 end
					if EXISTS (select * from PreV2.AtrPeriodoPorInd with(nolock) where  apiCveSer=  @cveSrs )
					begin set @RowInf2=1 end
					--select  @RowInf = COUNT(*) from ManV2.AtrPeriodoPorInd with(nolock) where apiCveSer=  @cveSrs
					--select  @RowInf2 = COUNT(*) from PreV2.AtrPeriodoPorInd with(nolock) where  apiCveSer=  @cveSrs 
					set @banEnlIndSer='False' --indicad si hay diferencias en atributos de periodos
					if @RowInf=@RowInf2
					begin
					 while exists(select * from @tablaPerInd  )
					  begin
						select top 1 @apiPAA = apiAA, @apiPMM=apiMM, @apiPDD= apiDD, @apiCvNota= apiCveNota from @tablaPerInd
						select top 1  @campM1=apiCveSer, @campM2=apiPerAA, @campM3=apiPerMM, @campM4=apiPerDD, @campM5=apiCveNota  from ManV2.AtrPeriodoPorInd with(nolock) where apiCveSer = @cveSrs and apiPerAA= @apiPAA and apiPerMM= @apiPMM and apiPerDD = @apiPDD and apiCveNota= @apiCvNota
						select top 1  @campP1=apiCveSer, @campP2=apiPerAA, @campP3=apiPerMM, @campP4=apiPerDD, @campP5=apiCveNota  from PreV2.AtrPeriodoPorInd with(nolock) where apiCveSer = @cveSrs and apiPerAA= @apiPAA and apiPerMM= @apiPMM and apiPerDD = @apiPDD and apiCveNota= @apiCvNota
						if @campM1= @campP1 and @campM2= @campP2 and @campM3= @campP3 and @campM4= @campP4 and @campM5= @campP5 
						 Begin  
								set @Igual='I'
						 end
						 else
						 begin
								set @banEnlIndSer = 'True'
						 end
						delete from @tablaPerInd  where apiAA = @apiPAA and apiMM= @apiPMM and apiDD= @apiPDD and apiCveNota= @apiCvNota
					 end
						if @banEnlIndSer = 'True'
						begin
							set @cadSql1 ='delete from preV2.AtrPeriodoPorInd where apiCveSer=' + @cveSrs
							print @cadSql1
							EXEC (@cadSql1)
							set @cadSql2 = 'INSERT INTO preV2.AtrPeriodoPorInd ([apiCveSer] ,[apiPerAA],[apiPerMM],[apiPerDD],[apiCveNota])
									select [apiCveSer],[apiPerAA],[apiPerMM],[apiPerDD],[apiCveNota]
										from ManV2.AtrPeriodoPorInd with(nolock) where apiCveSer = ' + @cveSrs
							print @cadSql2
							EXEC  (@cadSql2) 
						end
				  end 
				  else--es diferente @RowInf
				  begin
					set @cadSql1 ='delete from preV2.AtrPeriodoPorInd where apiCveSer = ' + @cveSrs
					print @cadSql1
					EXEC (@cadSql1)
					set @cadSql2 = 'INSERT INTO preV2.AtrPeriodoPorInd ([apiCveSer] ,[apiPerAA],[apiPerMM],[apiPerDD],[apiCveNota])
									select [apiCveSer] ,[apiPerAA],[apiPerMM],[apiPerDD],[apiCveNota]
									from ManV2.AtrPeriodoPorInd with(nolock) where apiCveSer = ' + @cveSrs
					print @cadSql2
					EXEC  (@cadSql2) 
				  end
				  --revisar notas de periodos
				  insert into @tablaPerInd   select apiPerAA, apiPerMM, apiPerDD, apiCveNota  from ManV2.AtrPeriodoPorInd with(nolock) where apiCveSer = @cveSrs
				  while exists(select * from @tablaPerInd  )
					 begin
						select top 1 @apiPAA = apiAA, @apiPMM=apiMM, @apiPDD= apiDD, @apiCvNota= apiCveNota from @tablaPerInd
						select top 1  @campM1= notClave, @campM2=notNota, @campM3=notNotaIng  from ManV2.Notas with(nolock) where notClave = @apiCvNota
						select top 1  @campP1= notClave, @campP2=notNota, @campP3=notNotaIng  from PreV2.Notas with(nolock) where notClave = @apiCvNota
						if @campM1= @campP1 and @campM2= @campP2 and @campM3= @campP3 
						Begin  
							set @Igual='I'
						end
						else
						begin
							set @cadSql1 ='delete from preV2.notas where notclave = ' + Convert(nvarchar(255),@apiCvNota) 
							print 'Nota en periodos'
							print @cadSql1
							EXEC (@cadSql1)
							set @cadSql2 = 'INSERT INTO preV2.Notas ([notclave],[notnota],[notnotaIng])
								select [notclave],[notnota],[notnotaIng]
								from ManV2.Notas with(nolock) where notclave = ' + Convert(nvarchar(255),@apiCvNota) 
							print @cadSql2
							EXEC  (@cadSql2) 
						end
						delete from @tablaPerInd where apiAA = @apiPAA and apiMM= @apiPMM and apiDD= @apiPDD and apiCveNota= @apiCvNota
					 end--while @tablaPerInd
					
			--revisar claves agrupamiento de clasificación***
				--select * from prev2.AgrupaClas where acClave  like '320%'
				--select * from pubv2.AgrupaClas where acClave  like '320%'
				if @CveAgClas IS not NULL or @CveAgClas <> '0'
				begin
					--revisar si agrupaclas tiene los mismo datos
					insert into @tablaAgrupaClas   select acClave  from ManV2.AgrupaClas with(nolock) where acClave like @CveAgClas + '%'
					set @RowInf=0
					set @RowInf2=0
					if EXISTS (select * from ManV2.AgrupaClas with(nolock) where acClave like @CveAgClas + '%' )
					begin set @RowInf=1 end
					if EXISTS (select * from PreV2.AgrupaClas with(nolock) where  acClave like @CveAgClas + '%'  )
					begin set @RowInf2=1 end
					--select  @RowInf = COUNT(*) from ManV2.AgrupaClas with(nolock) where acClave like @CveAgClas + '%' 
					--select  @RowInf2 = COUNT(*) from PreV2.AgrupaClas with(nolock) where  acClave like @CveAgClas + '%' 
					set @banEnlIndSer='False' --indicad si hay diferencias en los agrupamientos de clasificaciones
				   if @RowInf=@RowInf2
				   begin
					while exists(select * from @tablaAgrupaClas  )
					 begin
						select top 1 @cveAgr = CveAgCl  from @tablaAgrupaClas 
						select top 1  @campM1=acCveGpo, @campM2=acCveClas, @campM3=acDescrip, @campM4=acDescripIng  from ManV2.AgrupaClas with(nolock) where acclave=@cveAgr
						select top 1  @campP1=acCveGpo, @campP2=acCveClas, @campP3=acDescrip, @campP4=acDescripIng  from PreV2.AgrupaClas with(nolock) where acclave=@cveAgr
						if @campM1= @campP1 and @campM2= @campP2 and @campM3= @campP3 and @campM4= @campP4 
						 Begin  
								set @Igual='I'
						 end
						 else
						 begin
								set @banEnlIndSer = 'True'
						 end
						delete from @TablaAgrupaClas where CveAgCl= @CveAgr
					 end
						if @banEnlIndSer = 'True'
						begin
							set @cadSql1 ='delete from preV2.AgrupaClas where acclave like ''' + @CveAgClas  +  '%'''  
							print @cadSql1
							EXEC (@cadSql1)
							set @cadSql2 = 'INSERT INTO preV2.AgrupaClas ([acClave],[acCveGpo],[acCveClas],[acDescrip],[acDescripIng])
										select [acClave],[acCveGpo],[acCveClas],[acDescrip],[acDescripIng]
										from ManV2.AgrupaClas with(nolock) where acclave like ''' + @CveAgClas  +  '%''' 
							print @cadSql2
							EXEC  (@cadSql2) 
						end
				  end 
				  else--es más de 0 @RowInf
				  begin
					set @cadSql1 ='delete from preV2.AgrupaClas where acclave  like ''' + @CveAgClas  +  '%'''
					print @cadSql1
					EXEC (@cadSql1)
					set @cadSql2 = 'INSERT INTO preV2.AgrupaClas ([acClave],[acCveGpo],[acCveClas],[acDescrip],[acDescripIng])
									select [acClave],[acCveGpo],[acCveClas],[acDescrip],[acDescripIng]
									from ManV2.AgrupaClas with(nolock) where acclave like ''' + @CveAgClas  +  '%'''
					print @cadSql2
					EXEC  (@cadSql2) 
				  end
				--revisar AtrAgrupaClaPorInd
					--revisar si agrupaclas tiene los mismo datos
					--@tablaOrdAgrupaClas table (CveOrdAgCl nvarchar(max))
					insert into @tablaOrdAgrupaClas   select aaclAgrCla, aaclCveNota, aaclTipCla  from ManV2.AtrAgrupaClaPorInd with(nolock) where aaclCveSer = @cveSrs
					set @RowInf=0
					set @RowInf2=0
					if EXISTS (select * from ManV2.AtrAgrupaClaPorInd with(nolock) where aaclCveSer=  @cveSrs )
					begin set @RowInf=1 end
					if EXISTS (select * from PreV2.AtrAgrupaClaPorInd with(nolock) where  aaclCveSer=  @cveSrs  )
					begin set @RowInf2=1 end
					--select  @RowInf = COUNT(*) from ManV2.AtrAgrupaClaPorInd with(nolock) where aaclCveSer=  @cveSrs
					--select  @RowInf2 = COUNT(*) from PreV2.AtrAgrupaClaPorInd with(nolock) where  aaclCveSer=  @cveSrs 
					set @banEnlIndSer='False' --indicad si hay diferencias en los agrupamientos de clasificaciones
					if @RowInf=@RowInf2
					begin
					 while exists(select * from @tablaOrdAgrupaClas  )
					  begin
						select top 1 @cveAgrOrd = CveOrdAgCl, @TipoAgrCl=tipoCl from @tablaOrdAgrupaClas 
						select top 1  @campM1=aaclCveSer, @campM2=aaclAgrCla, @campM3=aaclCveNota, @campM4=aaclOrdenTab, @campM5=aaclOrdenGra, @campM6=aaclOrdenMap   from ManV2.AtrAgrupaClaPorInd with(nolock) where aaclCveSer = @cveSrs and aaclAgrCla= @cveAgrOrd and aaclTipCla= @TipoAgrCl
						select top 1  @campP1=aaclCveSer, @campP2=aaclAgrCla, @campP3=aaclCveNota, @campP4=aaclOrdenTab, @campP5=aaclOrdenGra, @campP6=aaclOrdenMap  from PreV2.AtrAgrupaClaPorInd with(nolock) where aaclCveSer = @cveSrs and aaclAgrCla= @cveAgrOrd and aaclTipCla= @TipoAgrCl
						if @campM1= @campP1 and @campM2= @campP2 and @campM3= @campP3 and @campM4= @campP4 and @campM5= @campP5 and @campM6= @campP6 
						 Begin  
								set @Igual='I'
						 end
						 else
						 begin
								set @banEnlIndSer = 'True'
						 end
						delete from @tablaOrdAgrupaClas  where CveOrdAgCl= @cveAgrOrd and tipoCl= @TipoAgrCl
					 end
						if @banEnlIndSer = 'True'
						begin
							set @cadSql1 ='delete from preV2.AtrAgrupaClaPorInd where aaclCveSer=' + @cveSrs
							print @cadSql1
							EXEC (@cadSql1)
							set @cadSql2 = 'INSERT INTO preV2.AtrAgrupaClaPorInd ([aaclCveSer],[aaclAgrCla],[aaclCveNota],[aaclOrdenTab],[aaclOrdenGra],[aaclOrdenMap], [aaclTipCla])
										select [aaclCveSer],[aaclAgrCla],[aaclCveNota],[aaclOrdenTab],[aaclOrdenGra],[aaclOrdenMap],[aaclTipCla]
										from ManV2.AtrAgrupaClaPorInd with(nolock) where aaclCveSer = ' + @cveSrs
							print @cadSql2
							EXEC  (@cadSql2) 
						end
				  end 
				  else--es más de 0 @RowInf
				  begin
					set @cadSql1 ='delete from preV2.AtrAgrupaClaPorInd where aaclCveSer = ' + @cveSrs
					print @cadSql1
					EXEC (@cadSql1)
					set @cadSql2 = 'INSERT INTO preV2.AtrAgrupaClaPorInd ([aaclCveSer],[aaclAgrCla],[aaclCveNota],[aaclOrdenTab],[aaclOrdenGra],[aaclOrdenMap],[aaclTipCla])
									select [aaclCveSer],[aaclAgrCla],[aaclCveNota],[aaclOrdenTab],[aaclOrdenGra],[aaclOrdenMap],[aaclTipCla]
									from ManV2.AtrAgrupaClaPorInd with(nolock) where aaclCveSer = ' + @cveSrs
					print @cadSql2
					EXEC  (@cadSql2) 
				  end
				  --revisar notas de los atributos del agrupamiento de clasificaciones
				  insert into @tablaOrdAgrupaClas   select aaclAgrCla, aaclCveNota, aaclTipCla  from ManV2.AtrAgrupaClaPorInd with(nolock) where aaclCveSer = @cveSrs
				  while exists(select * from @tablaOrdAgrupaClas  )
					 begin
						select top 1 @cveAgrOrd = CveOrdAgCl, @cveOrdAgrNot= cveOrdAgrClNota, @TipoAgrCl=tipoCl from @tablaOrdAgrupaClas 
						if @cveOrdAgrNot IS not NULL  and @cveOrdAgrNot <>0
						begin
							select top 1  @campM1= notClave, @campM2=notNota, @campM3=notNotaIng  from ManV2.Notas with(nolock) where notClave = @cveOrdAgrNot
							select top 1  @campP1= notClave, @campP2=notNota, @campP3=notNotaIng  from PreV2.Notas with(nolock) where notClave = @cveOrdAgrNot
							if @campM1= @campP1 and @campM2= @campP2 and @campM3= @campP3 
							Begin  
								set @Igual='I'
							end
							else
							begin
								print @cveOrdAgrNot
								set @cadSql1 ='delete from preV2.notas where notclave = ' + Convert(nvarchar(255),@cveOrdAgrNot) 
								print 'Nota en Atributos de clasificaciones'
								print @cadSql1
								EXEC (@cadSql1)
								set @cadSql2 = 'INSERT INTO preV2.Notas ([notclave],[notnota],[notnotaIng])
									select [notclave],[notnota],[notnotaIng]
									from ManV2.Notas with(nolock) where notclave = ' + Convert(nvarchar(255),@cveOrdAgrNot)
								print @cadSql2
								EXEC  (@cadSql2) 
							end
						end
						delete from @tablaOrdAgrupaClas  where CveOrdAgCl= @cveAgrOrd and tipoCl= @TipoAgrCl
					 end
				  
			--revisar grupos
				insert into @tablaGpo   select distinct acCveGpo  from ManV2.AgrupaClas with(nolock) where acClave like @CveAgClas + '%' and len (acClave)>3
				while exists(select * from @tablaGpo  )
					 begin
						select top 1 @CveGpo = CveGpo  from @tablaGpo
						set @RowInf=0
						if EXISTS (select  * from PreV2.Grupo with(nolock) where gpoClave= @CveGpo)
						begin set @RowInf=1 end
						--select  @RowInf = COUNT(*) from PreV2.Grupo with(nolock) where gpoClave= @CveGpo
						if @RowInf=0
						begin
							set @cadSql1 = 'INSERT INTO preV2.Grupo ([gpoClave],[gpoDescrip],[gpoDescripIng],[gpoAlias],[gpoAliasIng])
									select [gpoClave],[gpoDescrip],[gpoDescripIng],[gpoAlias],[gpoAliasIng]
									from ManV2.Grupo with(nolock) where  gpoClave= ' + @CveGpo
							print @cadSql1
							EXEC (@cadSql1) 
						end
						else
						begin
							select top 1  @campM1=gpoDescrip,@campM2=gpoDescripIng,@campM3=gpoAlias,@campM4=gpoAliasIng from ManV2.Grupo with(nolock) where gpoClave=@CveGpo
							select top 1  @campP1=gpoDescrip,@campP2=gpoDescripIng,@campP3=gpoAlias,@campP4=gpoAliasIng from PreV2.Grupo with(nolock) where gpoClave=@CveGpo
							if @campM1= @campP1 and @campM2= @campP2 and @campM3= @campP3 and @campM4= @campP4
							begin
								set @Igual='I'
							end
							else
							begin
								set @cadSql1 ='delete from preV2.Grupo where gpoClave= ' + @CveGpo
								print @cadSql1
								EXEC (@cadSql1)
								set @cadSql2 = 'INSERT INTO preV2.Grupo ([gpoClave],[gpoDescrip],[gpoDescripIng],[gpoAlias],[gpoAliasIng])
											select [gpoClave],[gpoDescrip],[gpoDescripIng],[gpoAlias],[gpoAliasIng]
											from ManV2.Grupo with(nolock) where gpoClave= ' + @CveGpo
								print @cadSql2
								EXEC  (@cadSql2) 
							end
						end
						delete from @TablaGpo where CveGpo= @CveGpo
				end--while gpo
				--revisar clasificaciones y descripciones
				insert into @tablaClas   select distinct acCveClas, acCveGpo  from manv2.AgrupaClas with(nolock) where acClave like @CveAgClas + '%' and len (acClave)>3
				while exists(select * from @tablaClas   )
					 begin
						select top 1 @CveClas= CveCl, @CveGpo = CveGpo  from @tablaClas
						set @RowInf=0
						--set @cadSql1= 'select * from PreV2.Clasificacion with(nolock) where claClave='+ @CveClas  + ' and claGrupo=' + @CveGpo
						--print @cadSql1
						print @CveClas
						print @CveGpo
						if EXISTS (select * from PreV2.Clasificacion with(nolock) where claClave= @CveClas and claGrupo= @CveGpo)
						begin set @RowInf=1  print @RowInf end
						--select  @RowInf = COUNT(*) from PreV2.Clasificacion with(nolock) where claClave= @CveClas and claGrupo= @CveGpo
						if @RowInf=0
						begin
						print @RowInf 
							set @cadSql1 = 'INSERT INTO preV2.clasificacion ([claClave],[claGrupo],[claClaveDescrip],[claOrden])
									select [claClave],[claGrupo],[claClaveDescrip],[claOrden]
									from ManV2.clasificacion with(nolock) where  claClave= ' + @CveClas + ' and claGrupo=' + @CveGpo
							print @cadSql1
							EXEC (@cadSql1) 
						end
						else
						begin
							select top 1  @campM1=claGrupo,@campM2=claClaveDescrip,@campM3=claOrden  from ManV2.Clasificacion with(nolock) where claClave=@CveClas
							select top 1  @campP1=claGrupo,@campP2=claClaveDescrip,@campP3=claOrden  from PreV2.Clasificacion with(nolock) where claClave=@CveClas
							if @campM1= @campP1 and @campM2= @campP2
							begin
								set @Igual='I'
							end
							else
							begin
								set @cadSql1 ='delete from preV2.Clasificacion where claClave= ' + @CveClas + ' and clagrupo= ' + @CveGpo
								print @cadSql1
								EXEC (@cadSql1)
								set @cadSql2 = 'INSERT INTO preV2.Clasificacion ([claClave],[claGrupo],[claClaveDescrip],[claOrden])
											select [claClave],[claGrupo],[claClaveDescrip],[claOrden]
											from ManV2.Clasificacion with(nolock) where claClave= ' + @CveClas + ' and clagrupo= ' + @CveGpo
								print @cadSql2
								EXEC  (@cadSql2) 
							end
						end
						--revisar descripcion
						--select desClave,desDescrip,desCodigo,desDescripIng,desCodigoIng from manv2.Descripcion, manv2.Clasificacion where claClaveDescrip= desClave and claClave=27
						select top 1  @CveDescr=desclave  from ManV2.Descripcion, manv2.clasificacion with(nolock) where claClaveDescrip= desClave and  claclave=@CveClas and claGrupo= @CveGpo
						set @RowInf=0
						if EXISTS (select * from PreV2.Descripcion with(nolock) where desClave= @CveDescr)
						begin set @RowInf=1 end
						--select  @RowInf = COUNT(*) from PreV2.Descripcion with(nolock) where desClave= @CveDescr
						if @RowInf=0
						begin
							set @cadSql1 = 'INSERT INTO preV2.Descripcion ([desClave],[desDescrip],[desAbrevia],[desCodigo],[desDescripIng],[desAbreviaIng],[desCodigoIng])
									select [desClave],[desDescrip],[desAbrevia],[desCodigo],[desDescripIng],[desAbreviaIng],[desCodigoIng]
									from ManV2.Descripcion with(nolock) where desclave= ' + @CveDescr
							print @cadSql1
							EXEC (@cadSql1) 
						end
						else
						begin
							select top 1  @campM1=desdescrip, @campM2=desAbrevia, @campM3=desCodigo, @campM4=desDescripIng, @campM5=desAbreviaIng, @campM6=desCodigoIng  from ManV2.Descripcion with(nolock) where desclave=@CveDescr
							select top 1  @campP1=desdescrip, @campP2=desAbrevia, @campP3=desCodigo, @campP4=desDescripIng, @campP5=desAbreviaIng, @campP6=desCodigoIng  from PreV2.Descripcion with(nolock) where desclave=@CveDescr
							if @campM1= @campP1 and @campM2= @campP2 and @campM3= @campP3 and @campM4= @campP4 and @campM5= @campP5 and @campM6= @campP6
							begin
								set @Igual='I'
							end
							else
							begin
								set @cadSql1 ='delete from preV2.Descripcion where desClave= ' + @CveDescr
								print @cadSql1
								EXEC (@cadSql1)
								set @cadSql2 = 'INSERT INTO preV2.Descripcion ([desClave],[desDescrip],[desAbrevia],[desCodigo],[desDescripIng],[desAbreviaIng],[desCodigoIng])
											select [desClave],[desDescrip],[desAbrevia],[desCodigo],[desDescripIng],[desAbreviaIng],[desCodigoIng]
											from ManV2.Descripcion with(nolock) where desClave= ' + @CveDescr
								print @cadSql2
								EXEC  (@cadSql2) 
							end
						end
						
					delete from @tablaClas  where CveCl= @CveClas and CveGpo = @CveGpo
				end--while clas y desc
			end --if de clas
		--revisar las claves de agrupamiento de cobertura***
			--select * from manv2.AgrupaCob where acoClave  like '0010%'
			--select * from prev2.AgrupaCob where acoClave  like '0010%'
			insert into @tablaAgrupaCobs  select acoClave  from ManV2.AgrupaCob with(nolock) where acoClave like @CveAgCob + '%'
			set @RowInf=0
			set @RowInf2=0
			set @RowInfT=0
			set @RowInf2T=0
			if EXISTS (select * from ManV2.AgrupaCob with(nolock) where acoClave like @CveAgCob + '%')
			begin set @RowInf=1 end
			if EXISTS (select * from PreV2.AgrupaCob with(nolock) where  acoClave like @CveAgCob + '%' )
			begin set @RowInf2=1 end
			--select  @RowInf = COUNT(*) from ManV2.AgrupaCob with(nolock) where acoClave like @CveAgCob + '%' 
			--select  @RowInf2 = COUNT(*) from PreV2.AgrupaCob with(nolock) where  acoClave like @CveAgCob + '%' 
			set @banEnlIndSer='False' --indicad si hay diferencias en los agrupamientos de coberturas
			if @RowInf=@RowInf2--existe en man y en pre
			 begin
				--Revisar si tiene el mismo número de coberturas en el agrupamiento
				select  @RowInfT = COUNT(*) from ManV2.AgrupaCob with(nolock) where acoClave like @CveAgCob + '%' 
				select  @RowInf2T = COUNT(*) from PreV2.AgrupaCob with(nolock) where  acoClave like @CveAgCob + '%'
				print 'Total de agrupamiento cobertura'
				print @RowInfT
				print @RowInf2T
				if @RowInfT<>@RowInf2T
				begin
					set @cadSql1 ='delete from preV2.AgrupaCob where acoclave like ''' + @CveAgCob  +  '%'''  
					print @cadSql1
					EXEC (@cadSql1)
					set @cadSql2 = 'INSERT INTO preV2.AgrupaCob ([acoClave],[acoCveGeo],[acoCveDesGeo],[acoOrden],[acoClaveAnt])
								select [acoClave],[acoCveGeo],[acoCveDesGeo],[acoOrden],[acoClaveAnt]
								from ManV2.AgrupaCob with(nolock) where acoclave like ''' + @CveAgCob  +  '%''' 
					print @cadSql2
					EXEC  (@cadSql2) 
				end
				--while exists(select * from @tablaAgrupaCobs  )
				-- begin
				--		select top 1 @CveCob = CveAgCob  from @tablaAgrupaCobs 
				--		select top 1  @campM1=acoCveGeo, @campM2=acoCveDesGeo, @campM3=acoOrden  from ManV2.AgrupaCob with(nolock) where acoclave=@CveCob
				--		select top 1  @campP1=acoCveGeo, @campP2=acoCveDesGeo, @campP3=acoOrden  from PreV2.AgrupaCob with(nolock) where acoclave=@CveCob
				--		if @campM1= @campP1 and @campM2= @campP2 and @campM3= @campP3 
				--		 Begin  
				--				set @Igual='I'
				--		 end
				--		 else
				--		 begin
				--				set @banEnlIndSer = 'True'
				--		 end
				--		delete from @tablaAgrupaCobs where CveAgCob= @CveCob
				--   end--while
				--		if @banEnlIndSer = 'True'
				--		begin
				--			set @cadSql1 ='delete from preV2.AgrupaCob where acoclave like ''' + @CveAgCob  +  '%'''  
				--			print @cadSql1
				--			EXEC (@cadSql1)
				--			set @cadSql2 = 'INSERT INTO preV2.AgrupaCob ([acoClave],[acoCveGeo],[acoCveDesGeo],[acoOrden],[acoClaveAnt])
				--						select [acoClave],[acoCveGeo],[acoCveDesGeo],[acoOrden],[acoClaveAnt]
				--						from ManV2.AgrupaCob with(nolock) where acoclave like ''' + @CveAgCob  +  '%''' 
				--			print @cadSql2
				--			EXEC  (@cadSql2) 
				--		end
			  end --if @RowInf=@RowInf2
			  else--es más de 0
			  begin
					set @cadSql1 ='delete from preV2.AgrupaCob where acoclave like ''' + @CveAgCob  +  '%''' 
					print @cadSql1
					EXEC (@cadSql1)
					set @cadSql2 = 'INSERT INTO preV2.AgrupaCob ([acoClave],[acoCveGeo],[acoCveDesGeo],[acoOrden],[acoClaveAnt])
									select [acoClave],[acoCveGeo],[acoCveDesGeo],[acoOrden],[acoClaveAnt]
									from ManV2.AgrupaCob with(nolock) where acoclave like ''' + @CveAgCob  +  '%''' 
					print @cadSql2
					EXEC  (@cadSql2) 
			   end
				--revisar cobgeo
				--select * from manv2.AgrupaCob where acoClave like '0030%' and len(acoClave )>4
				set @CveDesGAnt = ''
				set @CveTipoDGAnt = ''
				insert into @tablaCobGeo  select acoClave, acoCveGeo, acoCveDesGeo  from ManV2.AgrupaCob with(nolock) where acoClave like @CveAgCob + '%' and LEN(acoclave)>4
				while exists(select * from @tablaCobGeo  )
				 begin
						--cobgeo
						select top 1 @CveAgruCob= CveAgruCg, @CveCg = CveCg, @CveDesG= CveDesG  from @tablaCobGeo 
						set @RowInf=0
						if EXISTS (select  * from PreV2.CobGeo with(nolock) where cgClave = @CveCg)
						begin set @RowInf=1 end
						--select  @RowInf = COUNT(*) from PreV2.CobGeo with(nolock) where cgClave = @CveCg
						if @RowInf=0
						begin
							set @cadSql1 = 'INSERT INTO preV2.CobGeo ([cgClave],[cgDescrip],[cgDescripIng],[cgAbrevia],[cgAbreviaIng],[cgCveTipoCobGeo])
									select [cgClave],[cgDescrip],[cgDescripIng],[cgAbrevia],[cgAbreviaIng],[cgCveTipoCobGeo]
									from ManV2.CobGeo with(nolock) where cgClave = ''' +  @CveCg + ''''
							print @cadSql1
							EXEC (@cadSql1) 
						end
						else
						begin
							select top 1  @campM1=cgDescrip, @campM2=cgDescripIng, @campM3=cgAbrevia, @campM4=cgAbreviaIng, @campM5=cgCveTipoCobGeo  from ManV2.CobGeo with(nolock) where cgClave=@CveCg
							select top 1  @campP1=cgDescrip, @campP2=cgDescripIng, @campP3=cgAbrevia, @campP4=cgAbreviaIng, @campP5=cgCveTipoCobGeo  from PreV2.CobGeo with(nolock) where cgClave=@CveCg
							if @campM1= @campP1 and @campM2= @campP2 and @campM3= @campP3 and @campM4= @campP4  and @campM5= @campP5
							 Begin  
								set @Igual='I'
							end
							else
							begin
								set @cadSql1 ='delete from preV2.CobGeo where cgClave = ''' +  @CveCg + ''''
								print @cadSql1
								EXEC (@cadSql1)
								set @cadSql2 = 'INSERT INTO preV2.CobGeo ([cgClave],[cgDescrip],[cgDescripIng],[cgAbrevia],[cgAbreviaIng],[cgCveTipoCobGeo])
										select [cgClave],[cgDescrip],[cgDescripIng],[cgAbrevia],[cgAbreviaIng],[cgCveTipoCobGeo]
										from ManV2.CobGeo with(nolock) where cgClave = ''' +  @CveCg + ''''
								print @cadSql2
								EXEC  (@cadSql2) 
							end
						end
						--Atributos de las coberturas
						
						select top 1  @campM1=aacoCveSer, @campM2=aacoAgrCob, @campM3=aacoCveNota from ManV2.AtrAgrupaCobPorInd with(nolock) where aacoCveSer = @cveSrs and aacoAgrCob= @CveAgruCob--@cveAgrOrd
						select top 1  @campP1=aacoCveSer, @campP2=aacoAgrCob, @campP3=aacoCveNota from PreV2.AtrAgrupaCobPorInd with(nolock) where aacoCveSer = @cveSrs and aacoAgrCob= @CveAgruCob--@cveAgrOrd
						if @campM1= @campP1 and @campM2= @campP2 and @campM3= @campP3 
						 Begin  
								set @Igual='I'
						 end
						 else
						 begin
							set @cadSql1 ='delete from preV2.AtrAgrupaCobPorInd where aacoCveSer=' + @cveSrs  + ' and aacoAgrCob=''' + @CveAgruCob + ''''
							print @cadSql1
							EXEC (@cadSql1)
							set @cadSql2 = 'INSERT INTO preV2.AtrAgrupaCobPorInd ([aacoCveSer],[aacoAgrCob],[aacoCveNota])
										select [aacoCveSer],[aacoAgrCob],[aacoCveNota]
										from ManV2.AtrAgrupaCobPorInd with(nolock) where aacoCveSer = ' + @cveSrs + ' and aacoAgrCob=''' + @CveAgruCob + ''''
							print @cadSql2
							EXEC  (@cadSql2) 
						end
				  --revisar notas de los atributos del agrupamiento de coberturas
				  print 'Antes de Nota en atributos de cobertura'
				 -- print @cveAgrOrd
						--insert into @tablaTempNotCob select aacoCveNota  from ManV2.AtrAgrupaCobPorInd with(nolock) where aacoCveSer = @cveSrs and aacoAgrCob= @CveAgruCob--@cveAgrOrd
						print  @CveAgruCob
						set @cveAgrCoNot=0
						select top 1  @cveAgrCoNot=aacoCveNota from ManV2.AtrAgrupaCobPorInd with(nolock) where aacoCveSer = @cveSrs and aacoAgrCob= @CveAgruCob--@cveAgrOrd
						print @cveAgrCoNot
						if @cveAgrCoNot IS not NULL  and @cveAgrCoNot <>0
							begin
								select top 1  @campM1= notClave, @campM2=notNota, @campM3=notNotaIng  from ManV2.Notas with(nolock) where notClave = @cveAgrCoNot
								select top 1  @campP1= notClave, @campP2=notNota, @campP3=notNotaIng  from PreV2.Notas with(nolock) where notClave = @cveAgrCoNot
								if @campM1= @campP1 and @campM2= @campP2 and @campM3= @campP3 
								Begin  
									set @Igual='I'
								end
								else
								begin
									set @cadSql1 ='delete from preV2.notas where notclave = ' + Convert(nvarchar(255),@cveAgrCoNot) 
									print 'Nota en atributos de cobertura'
									print @cadSql1
									EXEC (@cadSql1)
									set @cadSql2 = 'INSERT INTO preV2.Notas ([notclave],[notnota],[notnotaIng])
										select [notclave],[notnota],[notnotaIng]
										from ManV2.Notas with(nolock) where notclave = ' + Convert(nvarchar(255),@cveAgrCoNot) 
									print @cadSql2
									EXEC  (@cadSql2) 
								end
							end
						--delete from @tablaTempNotCob
						--desglosegeo
						if @CveDesGAnt<> @CveDesG
						begin
							set @RowInf=0
							if EXISTS (select  * from PreV2.DesgloseGeo with(nolock) where dgClave = @CveDesG)
							begin set @RowInf=1 end
							--select  @RowInf = COUNT(*) from PreV2.DesgloseGeo with(nolock) where dgClave = @CveDesG
							if @RowInf=0
							begin
								set @cadSql1 = 'INSERT INTO preV2.DesgloseGeo ([dgClave],[dgCodigo] ,[dgCodigoIng] ,[dgDescrip],[dgDescripIng],[dgNomImg],[dgNomImgIng])
										select [dgClave],[dgCodigo] ,[dgCodigoIng] ,[dgDescrip],[dgDescripIng],[dgNomImg],[dgNomImgIng]
										from ManV2.DesgloseGeo with(nolock) where dgClave = ' + @CveDesG
								print @cadSql1
								EXEC (@cadSql1) 
							end
							else
							begin
								select top 1  @campM1=dgCodigo, @campM2=dgCodigoing, @campM3=dgDescrip, @campM4=dgDescripIng, @campM5=dgNomImg, @campM6=dgNomImgIng   from ManV2.DesgloseGeo with(nolock) where dgClave=@CveDesG
								select top 1  @campP1=dgCodigo, @campP2=dgCodigoing, @campP3=dgDescrip, @campP4=dgDescripIng, @campP5=dgNomImg, @campP6=dgNomImgIng   from PreV2.DesgloseGeo with(nolock) where dgClave=@CveDesG
								if @campM1= @campP1 and @campM2= @campP2 and @campM3= @campP3 and @campM4= @campP4 and @campM5= @campP5
								 Begin  
									set @Igual='I'
								end
								else
								begin
									set @cadSql1 ='delete from preV2.DesgloseGeo where dgClave = ' + @CveDesG
									print @cadSql1
									EXEC (@cadSql1)
									set @cadSql2 = 'INSERT INTO preV2.DesgloseGeo ([dgClave],[dgCodigo] ,[dgCodigoIng] ,[dgDescrip],[dgDescripIng],[dgNomImg],[dgNomImgIng])
											select [dgClave],[dgCodigo] ,[dgCodigoIng] ,[dgDescrip],[dgDescripIng],[dgNomImg],[dgNomImgIng]
											from ManV2.DesgloseGeo with(nolock) where dgClave = ' + @CveDesG
									print @cadSql2
									EXEC  (@cadSql2) 
								end
							end
						end
						--tipo de desglosegeo
						if @CveTipoDGAnt<>@CveTipoDG
						begin
							select top 1 @CveTipoDG = cgCveTipoCobGeo  from manv2.CobGeo where cgClave=  @CveCg
							set @RowInf=0
							if EXISTS (select  * from PreV2.TipoCobGeo with(nolock) where tcgClave = @CveTipoDG)
							begin set @RowInf=1 end
							--select  @RowInf = COUNT(*) from PreV2.TipoCobGeo with(nolock) where tcgClave = @CveTipoDG
							
							if @RowInf=0
							begin
								set @cadSql1 = 'INSERT INTO preV2.TipoCobGeo ([tcgClave],[tcgDescrip],[tcgDescripIng],[tcgCveAPIMapa],[tcgCodigo],[tcgCodigoINg])
										select [tcgClave],[tcgDescrip],[tcgDescripIng],[tcgCveAPIMapa],[tcgCodigo],[tcgCodigoINg]
										from ManV2.TipoCobGeo with(nolock) where tcClave = ' + @CveTipoDG
								print @cadSql1
								EXEC (@cadSql1) 
							end
							else
							begin
								select top 1  @campM1=tcgDescrip,@campM2=tcgDescripIng,@campM3=tcgCveApiMapa,@campM4=tcgCodigo,@campM5=tcgCodigoIng   from ManV2.TipoCobGeo with(nolock) where tcgClave=@CveTipoDG
								select top 1  @campP1=tcgDescrip,@campP2=tcgDescripIng,@campP3=tcgCveApiMapa,@campP4=tcgCodigo,@campP5=tcgCodigoIng   from PreV2.TipoCobGeo with(nolock) where tcgClave=@CveTipoDG
								if @campM1= @campP1 and @campM2= @campP2  and @campM3= @campP3 and @campM4= @campP4 and @campM5= @campP5
								 Begin  
									set @Igual='I'
								end
								else
								begin
									set @cadSql1 ='delete from preV2.TipoCobGeo where tcClave = ' + @CveTipoDG
									print @cadSql1
									EXEC (@cadSql1)
									set @cadSql2 = 'INSERT INTO preV2.TipoCobGeo ([tcgClave],[tcgDescrip],[tcgDescripIng],[tcgCveAPIMapa],[tcgCodigo],[tcgCodigoINg])
											select [tcgClave],[tcgDescrip],[tcgDescripIng],[tcgCveAPIMapa],[tcgCodigo],[tcgCodigoINg]
											from ManV2.TipoCobGeo with(nolock) where tcClave = ' + @CveTipoDG
									print @cadSql2
									EXEC  (@cadSql2) 
								end
							end
						end
						
						set @CveTipoDGAnt = @CveTipoDG
						set @CveDesGAnt = @CveDesG
					delete from @tablaCobGeo where CveCg= @CveCg
				end--while de cobgeo
				
				
				--revisar datos de las series
				set @RowInf=0
				set @RowInf2=0
				if EXISTS (select * from ManV2.Serie with(nolock) where serClave = @cveSrs)
				begin set @RowInf=1 end
				if EXISTS (select * from PreV2.Serie with(nolock) where  serClave = @cveSrs)
				begin set @RowInf2=1 end
				--select  @RowInf = COUNT(*) from ManV2.Serie with(nolock) where serClave = @cveSrs
				--select  @RowInf2 = COUNT(*) from PreV2.Serie with(nolock) where  serClave = @cveSrs
				if @RowInf<>@RowInf2
				begin
						set @cadSql1 ='delete from preV2.Serie where serClave = ' + @cveSrs
						print @cadSql1
						EXEC (@cadSql1)
						set @cadSql2 = 'INSERT INTO preV2.Serie ([serCveCobAgrupAnt],[serCveClaAgrup],[serClave] ,[serAADato],[serMMDato],[serDDDato],[serDato],[serNoDato],[serNota],[serLeyenda],[serLeyendaIng],[serCveCobAgrup])
									select [serCveCobAgrupAnt],[serCveClaAgrup],[serClave] ,[serAADato],[serMMDato],[serDDDato],[serDato],[serNoDato],[serNota],[serLeyenda],[serLeyendaIng],[serCveCobAgrup]
									from ManV2.Serie with(nolock) where serClave = ' + @cveSrs
						print @cadSql2
						EXEC  (@cadSql2) 
				end
			--revisar no datos
				--obtener los no datos y revisar si existen***
				--select * from prev2.NoDato where ndClave=1
				--select * from pubv2.NoDato where ndClave=1
				--select distinct serNoDato from ManV2.Serie with(nolock) where serClave = 85
				insert into @tablaNoDato select distinct sernodato  from ManV2.Serie with(nolock) where serClave = @cveSrs
				while exists(select * from @tablaNoDato )
				 begin
						select top 1 @CveND = CveND  from @tablaNoDato
						set @RowInf=0
						if EXISTS (select * from PreV2.NoDato with(nolock) where  ndClave= @CveND)
						begin set @RowInf=1 end
						--select  @RowInf = COUNT(*) from PreV2.NoDato with(nolock) where  ndClave= @CveND
						 if @RowInf = 0
						 Begin  
								set @cadSql1 = 'INSERT INTO preV2.NoDato ([ndClave],[ndCodigo],[ndDescrip],[ndDescripIng],[ndCodigoIng],[ndCodigoMapa])
										select [ndClave],[ndCodigo],[ndDescrip],[ndDescripIng],[ndCodigoIng],[ndCodigoMapa]
										from ManV2.NoDato with(nolock) where ndClave= ' + @CveND
								print @cadSql1
								EXEC (@cadSql1) 
						 end
						 else
						 begin
								select top 1  @campM1=ndCodigo,@campM2=ndDescrip,@campM3=ndDescripIng,@campM4=ndCodigoIng,@campM5=ndCodigoMapa from ManV2.Nodato with(nolock) where ndClave=@CveND
								select top 1  @campP1=ndCodigo,@campP2=ndDescrip,@campP3=ndDescripIng,@campP4=ndCodigoIng,@campP5=ndCodigoMapa from PreV2.Nodato with(nolock) where ndClave=@CveND
								if @campM1= @campP1 and @campM2= @campP2 and @campM3= @campP3 and @campM4= @campP4 and @campM5= @campP5	
								begin
									set @Igual='I'
								end
								else
								begin
									set @cadSql1 ='delete from preV2.NoDato where ndClave = ' + @CveND
									print @cadSql1
									EXEC (@cadSql1)
									set @cadSql2 = 'INSERT INTO preV2.NoDato ([ndClave],[ndCodigo],[ndDescrip],[ndDescripIng],[ndCodigoIng],[ndCodigoMapa])
											select [ndClave],[ndCodigo],[ndDescrip],[ndDescripIng],[ndCodigoIng],[ndCodigoMapa]
											from ManV2.NoDato with(nolock) where ndClave = ' + @CveND
									print @cadSql2
									EXEC  (@cadSql2) 
								end
						 end
						 
						delete from @tablaNoDato where CveND= @CveND
				 end--while no dato
				
			delete from @tablaSerie where CveSr= @cveSrs
		  end--while de series
		end-- if @CveAtsSer<>''
	end
else--es borrado
begin
	--arbol
		set @RowInf=0
		if EXISTS (select * from PreV2.Arbol with(nolock) where arbClaveInd = @CveIn and arbClave= @CveArb)
		begin set @RowInf=1 end
		--select  @RowInf = COUNT(*) from PreV2.Arbol with(nolock) where arbClaveInd = @CveIn and arbClave= @CveArb
		if @RowInf = 0
		Begin  
			set @Igual='I'
		end
		else
		begin
			set @cadSql1 ='delete from preV2.Arbol where arbclaveind='+ @CveIn +' and arbClave= '''+ @CveArb + ''''
			print @cadSql1
			EXEC (@cadSql1)
		end
		--atrIndicador
		set @RowInf=0
		if EXISTS (select * from PreV2.AtrIndicador with(nolock) where atrClaveInd = @CveIn)
		begin set @RowInf=1 end
		--select  @RowInf = COUNT(*) from PreV2.AtrIndicador with(nolock) where atrClaveInd = @CveIn
		if @RowInf = 0
		Begin  
			set @Igual='I'
		end
		else
		begin
			set @cadSql1 ='delete from preV2.AtrIndicador where atrClaveInd='+ @CveIn
			print @cadSql1
			EXEC (@cadSql1)
		end
		--enlSerInd
		set @RowInf=0
		if EXISTS (select * from PreV2.EnlSerInd with(nolock) where esiClaveInd = @CveIn)
		begin set @RowInf=1 end
		--select  @RowInf = COUNT(*) from PreV2.EnlSerInd with(nolock) where esiClaveInd = @CveIn
		if @RowInf = 0
		Begin  
			set @Igual='I'
		end
		else
		begin
			set @cadSql1 ='delete from PreV2.EnlSerInd with(nolock) where esiClaveInd='+ @CveIn
			print @cadSql1
			EXEC (@cadSql1)
		end
		--enlIndGra
		set @RowInf=0
		if EXISTS (select * from PreV2.EnlIndGra with(nolock) where eigCveInd = @CveIn)
		begin set @RowInf=1 end
		--select  @RowInf = COUNT(*) from PreV2.EnlIndGra with(nolock) where eigCveInd = @CveIn
		if @RowInf = 0
		Begin  
			set @Igual='I'
		end
		else
		begin
			set @cadSql1 ='delete from PreV2.EnlIndGra with(nolock) where eigCveInd='+ @CveIn
			print @cadSql1
			EXEC (@cadSql1)
		end
		--enlIndTipo
		set @RowInf=0
		if EXISTS (select * from PreV2.EnlIndTipo with(nolock) where eitCveInd = @CveIn)
		begin set @RowInf=1 end
		--select  @RowInf = COUNT(*) from PreV2.EnlIndTipo with(nolock) where eitCveInd = @CveIn
		if @RowInf = 0
		Begin  
			set @Igual='I'
		end
		else
		begin
			set @cadSql1 ='delete from PreV2.EnlIndTipo with(nolock) where eitCveInd='+ @CveIn
			print @cadSql1
			EXEC (@cadSql1)
		end
		
		--enlIndPCve
		set @RowInf=0
		if EXISTS (select * from PreV2.EnlIndPCve with(nolock) where eipcCveInd= @CveIn)
		begin set @RowInf=1 end
		--select  @RowInf = COUNT(*) from PreV2.EnlIndPCve with(nolock) where eipcCveInd= @CveIn
		if @RowInf = 0
		Begin  
			set @Igual='I'
		end
		else
		begin
			set @cadSql1 ='delete from PreV2.EnlIndPCve with(nolock) where eipcCveInd='+ @CveIn
			print @cadSql1
			EXEC (@cadSql1)
		end
	
		--enlIndCal
		set @RowInf=0
		if EXISTS (select * from PreV2.EnlIndCal with(nolock) where eicCveInd = @CveIn)
		begin set @RowInf=1 end
		--select  @RowInf = COUNT(*) from PreV2.EnlIndCal with(nolock) where eicCveInd = @CveIn
		if @RowInf = 0
		Begin  
			set @Igual='I'
		end
		else
		begin
			set @cadSql1 ='delete from PreV2.EnlIndCal with(nolock) where eicCveInd='+ @CveIn
			print @cadSql1
			EXEC (@cadSql1)
		end
		--@CveAtsSer nvarchar(max),
		--@CvePFic nvarchar (max)
		--AtrSeries
		set @RowInf=0
		if EXISTS (select * from PreV2.AtrSerie with(nolock) where atsClaveSerie in (@CveAtsSer))
		begin set @RowInf=1 end
		--select  @RowInf = COUNT(*) from PreV2.AtrSerie with(nolock) where atsClaveSerie in (@CveAtsSer)
		if @RowInf = 0
		Begin  
			set @Igual='I'
		end
		else
		begin
			set @cadSql1 ='delete from PreV2.AtrSerie with(nolock) where atsClaveSerie in (' + @CveAtsSer + ')'
			print @cadSql1
			EXEC (@cadSql1)
		end
		--AtrPeriodoPoInd
		set @RowInf=0
		if EXISTS (select * from PreV2.AtrPeriodoPorInd with(nolock) where apiCveSer in (@CveAtsSer))
		begin set @RowInf=1 end
		--select  @RowInf = COUNT(*) from PreV2.AtrPeriodoPorInd with(nolock) where apiCveSer in (@CveAtsSer)
		if @RowInf = 0
		Begin  
			set @Igual='I'
		end
		else
		begin
			set @cadSql1 ='delete from PreV2.AtrPeriodoPorInd with(nolock) where apiCveSer in (' + @CveAtsSer + ')'
			print @cadSql1
			EXEC (@cadSql1)
		end
		--AtrAgrupaCobPorInd
		set @RowInf=0
		if EXISTS (select * from PreV2.AtrAgrupaCobPorInd with(nolock) where aacoCveSer in (@CveAtsSer))
		begin set @RowInf=1 end
		--select  @RowInf = COUNT(*) from PreV2.AtrPeriodoPorInd with(nolock) where apiCveSer in (@CveAtsSer)
		if @RowInf = 0
		Begin  
			set @Igual='I'
		end
		else
		begin
			set @cadSql1 ='delete from PreV2.AtrAgrupaCobPorInd with(nolock) where aaacoCveSer in (' + @CveAtsSer + ')'
			print @cadSql1
			EXEC (@cadSql1)
		end
		--AtrAgrupaClaPoInd
		set @RowInf=0
		if EXISTS (select * from PreV2.AtrAgrupaClaPorInd with(nolock) where aaclCveSer in (@CveAtsSer))
		begin set @RowInf=1 end
		--select  @RowInf = COUNT(*) from PreV2.AtrAgrupaClaPorInd with(nolock) where aaclCveSer in (@CveAtsSer)
		if @RowInf = 0
		Begin  
			set @Igual='I'
		end
		else
		begin
			set @cadSql1 ='delete from PreV2.AtrAgrupaClaPorInd with(nolock) where aaclCveSer in (' + @CveAtsSer + ')'
			print @cadSql1
			EXEC (@cadSql1)
		end
		--FichaTecnica
		set @RowInf=0
		if EXISTS (select * from PreV2.FichaTecnica with(nolock) where ftClave = @CvePFic)
		begin set @RowInf=1 end
		--select  @RowInf = COUNT(*) from PreV2.FichaTecnica with(nolock) where ftClave = @CvePFic
		if @RowInf = 0
		Begin  
			set @Igual='I'
		end
		else
		begin
			set @cadSql1 ='delete from PreV2.FichaTecnica with(nolock) where ftClave=' + @CvePFic
			print @cadSql1
			EXEC (@cadSql1)
		end
		--enlFTCon
		set @RowInf=0
		if EXISTS (select  * from PreV2.EnlFTCon with(nolock) where efcClaveFT = @CvePFic)
		begin set @RowInf=1 end
		--select  @RowInf = COUNT(*) from PreV2.EnlFTCon with(nolock) where efcClaveFT = @CvePFic
		if @RowInf = 0
		Begin  
			set @Igual='I'
		end
		else
		begin
			set @cadSql1 ='delete from PreV2.EnlFTCon with(nolock) where efcClaveFT=' + @CvePFic
			print @cadSql1
			EXEC (@cadSql1)
		end
		--enlFTMFte
		set @RowInf=0
		if EXISTS (select * from PreV2.EnlFTMFte with(nolock) where effClave = @CvePFic)
		begin set @RowInf=1 end
		--select  @RowInf = COUNT(*) from PreV2.EnlFTMFte with(nolock) where effClave = @CvePFic
		if @RowInf = 0
		Begin  
			set @Igual='I'
		end
		else
		begin
			set @cadSql1 ='delete from PreV2.EnlFTMFte with(nolock) where effClave=' + @CvePFic
			print @cadSql1
			EXEC (@cadSql1)
		end
		--EnlFTRInst
		set @RowInf=0
		if EXISTS (select * from PreV2.EnlFTRInst with(nolock) where efiClave = @CvePFic)
		begin set @RowInf=1 end
		--select  @RowInf = COUNT(*) from PreV2.EnlFTRInst with(nolock) where efiClave = @CvePFic
		if @RowInf = 0
		Begin  
			set @Igual='I'
		end
		else
		begin
			set @cadSql1 ='delete from PreV2.EnlFTRInst with(nolock) where efiClave=' + @CvePFic
			print @cadSql1
			EXEC (@cadSql1)
		end
		--EnlFTRRi
		set @RowInf=0
		if EXISTS (select * from PreV2.EnlFTRRI with(nolock) where efrClave = @CvePFic)
		begin set @RowInf=1 end
		--select  @RowInf = COUNT(*) from PreV2.EnlFTRRI with(nolock) where efrClave = @CvePFic
		if @RowInf = 0
		Begin  
			set @Igual='I'
		end
		else
		begin
			set @cadSql1 ='delete from PreV2.EnlFTRRI with(nolock) where efrClave =' + @CvePFic
			print @cadSql1
			EXEC (@cadSql1)
		end
	end	--else de borrado
	
		set @cadSqlU = 'update manv2.Movimientos set movEstatus=''P'' where movEstatus=''M'' and movindicador =' + @CveIn
		exec(@cadSqlU)
		print @cadSqlU
		set @cadSqlU = 'update manv2.Movimientos set movEstatus=''P'' where movEstatus=''M'' and movComentario =''' + @CveArb + ''''
		exec(@cadSqlU)
		print @cadSqlU
	
	--if @TipoPro='C'
	--begin
	--	set @cadSqlU = 'update manv2.Movimientos set movEstatus=''P'' where movindicador =' + @CveIn
	--	exec(@cadSqlU)
	--	print @cadSqlU
	--	set @cadSqlU = 'update manv2.Movimientos set movEstatus=''P'' where movComentario =''' + @CveArb + ''''
	--	exec(@cadSqlU)
	--	print @cadSqlU
	--end
	--else
	--begin
	--	if @AtrEst='PRE'
	--	begin
	--		set @cadSqlU = 'update manv2.Movimientos set movEstatus=''B'' where movindicador =' + @CveIn
	--		exec(@cadSqlU)
	--		print @cadSqlU
	--		set @cadSqlU = 'update manv2.Movimientos set movEstatus=''B'' where movComentario =''' + @CveArb + ''''
	--		exec(@cadSqlU)
	--		print @cadSqlU
	--	end
	--	else
	--	begin
	--		if @AtrEst='PUB'
	--		begin
	--			set @cadSqlU = 'update manv2.Movimientos set movEstatus=''P'' where movindicador =' + @CveIn
	--			exec(@cadSqlU)
	--			print @cadSqlU
	--			set @cadSqlU = 'update manv2.Movimientos set movEstatus=''P'' where movComentario =''' + @CveArb + ''''
	--			exec(@cadSqlU)
	--			print @cadSqlU
	--		end
	--	end
	--end
END


GO


GO

/******  StoredProcedure [PreV2].[ReplicaPreIndSerPer] ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [PreV2].[ReplicaPreIndSerPer]  --1
	-- Add the parameters for the stored procedure here
	@CveI nvarChar(MAX),
	@CveArb nvarchar(MAX),
	@TipoPro nvarchar(max),
	@msg nvarchar(Max) output
AS
BEGIN
SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED

declare @mCla int, @mI int, @banI int, @Con int,@CveI3 int
declare @mS nvarchar(MAX), @CveSr nvarchar(Max), @Periodos nvarchar (MAX), @PerTem  nvarchar(MAX), @MM nvarchar(5), @DD nvarchar(5), @AA nvarchar(10),@cadSerRev nvarchar(max)
declare @cadSqlM nvarchar(Max), @mCt varchar(50), @ley varchar(20), @CveI2 nvarchar(MAX), @CveArb2 nvarchar(MAX),@Opci nvarchar(1)
declare @cadSqlM1 nvarchar(Max),@CveSrAn nvarchar(MAX),@PeriodosAn nvarchar(MAX),@msg2 nvarchar(Max)
declare @cadSqlM2 nvarchar(Max), @mCom nvarchar(MAX),@CveCo nvarchar(MAX), @CveCl nvarchar(MAX), @TipoProces varchar(2)
declare @cadSqlM3 nvarchar(Max),@cadIns nvarchar(Max)
declare @cadSqlM4 nvarchar(Max)
declare @cadSqlM5 nvarchar(Max),@cadCat varchar(100),@returnError nvarchar(Max),@cadSqlM6 nvarchar(Max),@AtrEstatus varchar(4),@CveAtsSer nvarchar(max)
declare @Posicion int,@PosicionEsp int,@Posicion2 int, @Posicion3 int,@Posicion4 int, @Posicion5 int, @Posicion6 int, @Posicion7 int,@CveFt nvarchar(max), @cadCveSer nvarchar(max)
declare @tablaCveSer table (CveSr nvarchar(max))

Begin Try 
	   set @msg2=''
		set @msg = ''
		set @banI=0
		set @CveI2= @CveI + ','
		WHILE patindex('%,%' , @CveI2) <> 0
		begin
		  Begin Tran
		  
				select @Posicion3 =  patindex('%,%' , @CveI2)--Buscamos la posicion de la primera ,
				select @CveI3 = left(@CveI2, @Posicion3 - 1)-- Claves de indicadores
				select @Posicion4 =  patindex('%,%' , @CveArb)--Buscamos la posicion de la primera ,
				select @CveArb2 = left(@CveArb, @Posicion4 - 1)-- Claves de arbol
				select @Posicion7 =  patindex('%,%' , @TipoPro)--Buscamos la posicion de la primera ,
				select @TipoProces = left(@TipoPro, @Posicion7 - 1)-- Claves de arbol
				Select top 1 @AtrEstatus=atrEstado from ManV2.AtrIndicador with(nolock) where atrClaveInd= @CveI3
				print @AtrEstatus
				print @TipoProces
				if @TipoProces='C'
				begin
					print 'Entre a RevisaCambArb'
					exec  PreV2.RevisaCamArb @mI, @CveArb2,@TipoProces 
					--exec @returnError = man.RevisaCamArb @mI, @CveArb2,@TipoProces 
					--if @returnError<>''
					--  begin
					--	set @msg = @msg + ' - '  + @returnError
					--  end
					print 'Salí de RevisaCambArb'
					set @CveSrAn =''
					set @PeriodosAn =''
					set @cadSerRev=''
					
			--		set @cadSqlM = N'(select @Con1=count(movClave) from Man.movimientos where movEstatus=''M'' and movIndicador in (' + @CveI + '))'
			--		EXEC SP_EXECUTESQL @cadSqlM, N'@Con1 int OUTPUT',@Con1 = @Con 
					--select movClave from Man.movimientos where movEstatus='M' and movIndicador = @CveI 
					--While exists (select movClave from Man.movimientos,Man.Arbol  where movIndicador= arbClaveInd and movEstatus='M' and movIndicador = @CveI3 and arbClave =@CveArb2 )
					While exists (select movClave from ManV2.movimientos with(nolock),ManV2.Arbol with(nolock)  where  movIndicador= arbClaveInd and movEstatus='M' and movIndicador = @CveI3 and arbClave =@CveArb2 )
					--While exists (select movClave from Man.movimientos,Man.Arbol  where movIndicador= arbClaveInd and movEstatus='M' and movIndicador = 58 and arbClave ='ODS009000800005')
					--While (@Con > 0)
					Begin 
						--set @cadSqlM3 = 'Select top 1 @mCla1=movClave,@mS1=movsql, @mI1=movIndicador, @mCt1=movCatalogo  from Man.movimientos where movEstatus=''M'' and movIndicador in (' + @CveI + ') order by  SUBSTRING(movFecha,7,4) asc, substring(movFecha,4,2) asc, SUBSTRING(movFecha,0,3) asc, substring(movhora,0,3) asc, substring(movhora,4,2) asc, substring(movhora,7,2) asc'
						--EXEC SP_EXECUTESQL @cadSqlM3, N'@mCla1 int output, @mS1 nvarchar(MAX) output ,@mI1 int output, @mCt1 nvarchar(50) output',@mCla1 = @mCla,@mS1 = @mS, @mI1=@mI,@mCt1= @mCt 
						Select top 1 @mCla=movClave,@mS=movsql, @mI=movIndicador, @mCt=movCatalogo, @mCom= movComentario  from ManV2.movimientos with(nolock),ManV2.Arbol with(nolock) where movIndicador = arbClaveInd and movEstatus='M' and movIndicador =@CveI3 and arbClave =@CveArb2  order by  SUBSTRING(movFecha,7,4) asc, substring(movFecha,4,2) asc, SUBSTRING(movFecha,0,3) asc, substring(movhora,0,3) asc, substring(movhora,4,2) asc, substring(movhora,7,2) asc, movClave 
						--Select top 1 @mCla=movClave,@mS=movsql, @mI=movIndicador, @mCt=movCatalogo, @mCom= movComentario  from Man.movimientos,Man.Arbol where movIndicador = arbClaveInd and movEstatus='M' and movIndicador =58 and arbClave ='ODS009000800005'  order by  SUBSTRING(movFecha,7,4) asc, substring(movFecha,4,2) asc, SUBSTRING(movFecha,0,3) asc, substring(movhora,0,3) asc, substring(movhora,4,2) asc, substring(movhora,7,2) asc, movClave 
						--exec(@cadSqlM3)
						--revisar si tiene cambios en arbol
						--if (@mI <> @banI and @mI<> 0)
						--begin
							--exec man.RevisaCamArb @mI, @CveArb2 
						--end
						if @mCt ='Serie'
						begin
							select @PosicionEsp =  patindex('%¬%' , @mS)
							if @mCom <> '' and @PosicionEsp > 0 
							begin
								select @Posicion =  patindex('%¬%' , @mS)--Buscamos la posicion de la primera ¬
							
								select @CveSr = left(@mS, @Posicion - 1)-- Claves de series
								if SUBSTRING (@CveSr,1,1)='L'
								begin
									select @Posicion2 =  patindex('%-%' , @CveSr )--Buscamos la posicion de la primera -
									select @CveSr =  stuff(@CveSr, 1, @Posicion2, '')	
								end
								select @mS =  stuff(@mS, 1, @Posicion, '')	
								set @Periodos  = @mS --periodos
								set @Periodos= @Periodos + ','
								select @Posicion2 =  patindex('%¬%' , @mCom )--Buscamos la posicion de la primera ¬
								select @CveCo = left(@mCom, @Posicion2 - 1)-- Claves de coberturas
								select @CveCl =  stuff(@mCom, 1, @Posicion2, '')--claves de clasificaciones	
								if @cadSerRev=''
								begin 
									set @cadSerRev =  @cadSerRev  + @CveSr  
								end
								else
								begin
									set @cadSerRev =  @cadSerRev + ',' + @CveSr  
								end
								
								--select @Posicion4 =  patindex('%/%' , @Periodos)--Buscamos la posicion de la primera /
								--if (@Posicion4 >0)
								--begin
								--	exec (@Periodos= PeriodosAMD, @mS)
									
								--end
								--if(@CveSr <> @CveSrAn or @Periodos <>@PeriodosAn)
								--begin
								WHILE patindex('%,%' , @Periodos) <> 0
								begin
									set @MM='0'
									set @DD='0'
									select @Posicion5 =  patindex('%,%' , @Periodos)--Buscamos la posicion de la primera ,
									select @PerTem = left(@Periodos, @Posicion5 - 1)-- Periodos
									set @PerTem= @PerTem + '/'
									--select @AA = left(@PerTem, 4)-- Año
									if (Len(@PerTem)>7)
									  begin--tiene Año, mes y dia
										select @Posicion6 =  patindex('%/%' , @PerTem)--Buscamos la posicion de la primera /
										select @AA = left(@PerTem, @Posicion6 - 1)-- Año
										SELECT @PerTem= stuff(@PerTem, 1, @Posicion6, '')
										select @Posicion6 =  patindex('%/%' , @PerTem)--Buscamos la posicion de la primera /
										select @MM = left(@PerTem, @Posicion6 - 1)-- Mes
										SELECT @PerTem= stuff(@PerTem, 1, @Posicion6, '')
										if (@PerTem<>'')
										 begin
											select @Posicion6 =  patindex('%/%' , @PerTem)--Buscamos la posicion de la primera /
											select @DD = left(@PerTem, @Posicion6 - 1)-- Dia
											SELECT @PerTem= stuff(@PerTem, 1, @Posicion6, '')
										 end
									  end
									  else 
									   begin
											if (Len(@PerTem)>5) --tiene año y mes
											begin
												select @Posicion6 =  patindex('%/%' , @PerTem)--Buscamos la posicion de la primera /
												select @AA = left(@PerTem, @Posicion6 - 1)-- Año
												SELECT @PerTem= stuff(@PerTem, 1, @Posicion6, '')
												select @Posicion6 =  patindex('%/%' , @PerTem)--Buscamos la posicion de la primera /
												select @MM = left(@PerTem, @Posicion6 - 1)-- Mes
												SELECT @PerTem= stuff(@PerTem, 1, @Posicion6, '')
											end
											else
											begin --solo año
												select @Posicion6 =  patindex('%/%' , @PerTem)--Buscamos la posicion de la primera /
												select @AA = left(@PerTem,@Posicion6 - 1)-- Año
												set @PerTem='' --stuff(@PerTem, 1, @Posicion6, '')
											end
									  end --serClaveInd =' + convert(nvarchar(10),@CveI3) +'  and 
									  print 'datos'
									  print @mCla
									  print @CveCo
									set @cadSqlM4 ='delete from preV2.Serie where serClave in('+ @CveSr +') and serAADato= '+ @AA +' and serMMDato= ' + @MM + ' and serDDDato= ' + @DD + '  and sercvecobAgrup in (' + @CveCo + ') and sercveClaAgrup in (' + @CveCl + ')'
									print @cadSqlM4
									EXEC (@cadSqlM4)
									set @cadSqlM5 = 'INSERT INTO preV2.Serie
									   ([serCveCobAgrup]
									   ,[serCveClaAgrup]
									   ,[serClave]
									   ,[serAADato]
									   ,[serMMDato]
									   ,[serDDDato]
									   ,[serDato]
									   ,[serNoDato]
									   ,[serNota]
									   ,[serLeyenda]
									   ,[serLeyendaIng])
									   select [serCveCobAgrup]
									   ,[serCveClaAgrup]
									   ,[serClave]
									   ,[serAADato]
									   ,[serMMDato]
									   ,[serDDDato]
									   ,[serDato]
									   ,[serNoDato]
									   ,[serNota]
									   ,[serLeyenda]
									   ,[serLeyendaIng]
										from ManV2.Serie with(nolock) where serClave in (' + @CveSr + ') and  serAADato= ' + @AA + ' and serMMDato= ' + @MM + ' and serDDDato= ' + @DD + ' and sercvecobAgrup in (' + @CveCo + ') and sercveClaAgrup in (' + @CveCl + ')'
										print @cadSqlM5
										EXEC  (@cadSqlM5) --serClaveInd =' + CONVERT(nvarchar(10), @CveI3) + ' and 
									SELECT @Periodos= stuff(@Periodos, 1, @Posicion5, '')
								--end
								end
								update ManV2.movimientos SET movEstatus='P' where movClave=@mCla
								set @CveSrAn = @CveSr 
								set @PeriodosAn = @Periodos 
							end
							else --Es serie pero no se actualizaron datos
							begin
								select @Posicion =  patindex('%ManV2.%' , @mS)--Buscamos la posicion de la primera ,
								select @cadSqlM2 = left(@mS, @Posicion - 1)-- esquema
								select @mS =  stuff(@mS, 1, @Posicion+5, '')		--Y obtenemos los caracteres hasta esa posicion
								set @cadSqlM1=  @cadSqlM2 + ' PreV2.' + @mS   --SUBSTRING (@mS,@Posicion+4,len(@mS) - (@Posicion + 4))
								exec(@cadSqlM1)
								update ManV2.movimientos SET movEstatus='P' where movClave=@mCla
							end
							
						end
						 else --las demás tablas
						 begin 
							   --Revisar si es Insert	
							  --set @msg2 = @msg2  +  @mCla + '-' + @mS + '-' + @mI + '-' + @mCt + '-' + @mCom
							  print 'insert'
							  print @mCla
							   select @Opci =  left(@mS,1)	--obtener el primer caracter
							   if @Opci='I' or  @Opci='i'
							   begin
									exec  PreV2.RevisaDuplicados @mCla,@mS, @mI, @mCt, @mCom
									--if @returnError<>''
									--begin
									--	set @msg = @msg + ' - '  + @returnError
									--end
							   end
							   else
							   begin
									print 'update-delete'
									print @mCla	
								   select @Posicion =  patindex('%ManV2.%' , @mS)--Buscamos la posicion de la primera ,
								   select @cadSqlM2 = left(@mS, @Posicion - 1)-- esquema
								   select @mS =  stuff(@mS, 1, @Posicion+5, '')		--Y obtenemos los caracteres hasta esa posicion
								   set @cadSqlM1=  @cadSqlM2 + ' PreV2.' + @mS   --SUBSTRING (@mS,@Posicion+4,len(@mS) - (@Posicion + 4))
								   exec(@cadSqlM1)
								   update ManV2.movimientos SET movEstatus='P' where movClave=@mCla
							   end
						 end
						 set @banI = @mI
						 --set @cadSqlM = 'select @Con1=count(movClave) from Man.movimientos where movEstatus=''P'' and movIndicador in ('+ @CveSr +')'
						 --exec(@cadSqlM)
						 --EXEC SP_EXECUTESQL @cadSqlM, N'@Con1 int OUTPUT',@Con1 = @Con
					END
					print 'entre de RevisaCambArb----------' 
					exec PreV2.RevisaCamArb @mI, @CveArb2,@TipoProces
					print 'regrese de RevisaCambArb------------' 
					print 'entre de RevisaAtrSerie---------------------' 
					exec PreV2.RevisaAtrSerie @mI,@TipoProces 
					print 'regrese de RevisaAtrSerie----------------'
					print 'entre de RevisaCamAtrIndicador-----------' 
					exec PreV2.RevisaCamAtrIndicador @mI,@TipoProces 
					print 'regrese de RevisaCamAtrIndicador---------------'
					print 'entre de RevisaCamFichaT-------------------' 
					exec PreV2.RevisaCamFichaT @mI,@TipoProces 
					print 'regrese de RevisaCamFichaT-------------------'
					print 'entre de RevisaInformacion-------------------' 
					print @cadSerRev
					exec PreV2.RevisaInformacion @mI, @CveArb2,@TipoProces, @cadSerRev,'',@AtrEstatus --las 3 últimas son cveSeries, cveFichatecnica y estado del indicador
					print 'regrese de RevisaInformacion---------------'
					
				end
				else --proceso borrar
				begin
					print 'Borrar'
					print @CveI3
					print @CveArb2
					print @TipoProces 
					--print 'entre de RevisaAtrSerie' 
					exec PreV2.RevisaAtrSerie @CveI3,@TipoProces 
					print 'regrese de RevisaAtrSerie'
					exec PreV2.RevisaCamAtrIndicador @CveI3,@TipoProces 
					print 'regrese de RevisaCamAtrIndicador'
					exec PreV2.RevisaCamFichaT @CveI3,@TipoProces 
					print 'regrese de RevisaCamFichaT'
					exec  PreV2.RevisaCamArb @CveI3, @CveArb2,@TipoProces 
					print 'regrese de RevisaCambArb' 
					While exists (select movClave from ManV2.movimientos with(nolock)  where  movEstatus='M' and movIndicador = @CveI3  ) --and arbClave =@CveArb2
					begin
						print 'while movimientos'
						Select top 1 @mCla=movClave,@mS=movsql, @mI=movIndicador, @mCt=movCatalogo, @mCom= movComentario  from ManV2.movimientos with(nolock) where  movEstatus='M' and movIndicador =@CveI3   order by  SUBSTRING(movFecha,7,4) asc, substring(movFecha,4,2) asc, SUBSTRING(movFecha,0,3) asc, substring(movhora,0,3) asc, substring(movhora,4,2) asc, substring(movhora,7,2) asc, movClave  --and arbClave =@CveArb2
						print @mCla
						print @mS
						select @Posicion =  patindex('%ManV2.%' , @mS)--Buscamos la posicion de la primera ,
						select @cadSqlM2 = left(@mS, @Posicion - 1)-- esquema
						select @mS =  stuff(@mS, 1, @Posicion+5, '')		--Y obtenemos los caracteres hasta esa posicion
						set @cadSqlM1=  @cadSqlM2 + ' PreV2.' + @mS   --SUBSTRING (@mS,@Posicion+4,len(@mS) - (@Posicion + 4))
						print @cadSqlM1
						exec(@cadSqlM1)
						update ManV2.movimientos SET movEstatus='P' where movClave=@mCla
						--if @AtrEstatus ='PRE' --si está en estatus pre(no se ha pasado a PUB) se pone el movimiento en B para no tomarlo en cuenta en replica PROductivo
						--begin
						--	update ManV2.movimientos SET movEstatus='B' where movClave=@mCla
						--end
						--else
						--begin
						--	if @AtrEstatus ='PUB' --si está en estatus PUB (se pasó a PUB) se pone el movimiento en P para tomarlo en cuenta en replica PROductivo
						--	begin
						--		update ManV2.movimientos SET movEstatus='P' where movClave=@mCla
						--	end
						--end
					end
					print'antes del while FT'
					print @CveArb2
					print @CveI3
					Select top 1 @CveFt= arbClaveFT from PreV2.arbol where arbClaveInd= @CveI3 and arbClave=Convert(nvarchar(max),@CveArb2)
					print @CveFt
					insert into @tablaCveSer select  atsClaveSerie  from PreV2.AtrSerie, PreV2.EnlSerInd with(nolock) where atsClaveSerie= esiClaveSerie and esiClaveInd = @CveI3	
					while exists(select * from @tablaCveSer  )
					begin
					print'en el while FT'
						select top 1 @CveAtsSer = CveSr  from @tablaCveSer
						set @cadCveSer= @CveAtsSer + ',' + @cadCveSer  
						delete from @tablaCveSer where CveSr= @CveAtsSer
					end--while	
					exec PreV2.RevisaInformacion @CveI3, @CveArb2,@TipoProces, @cadCveSer,@CveFt,@AtrEstatus --las 3 últimas son cveSeries, cveFichatecnica y el estado del indicador
				end
				
				SELECT @CveI2= stuff(@CveI2, 1, @Posicion3, '')
				SELECT @CveArb= stuff(@CveArb, 1, @Posicion4, '')
				SELECT @TipoPro= stuff(@TipoPro, 1, @Posicion7, '')
			 COMMIT Tran
			 if @TipoProces='C'
			 begin
				 --Select top 1 @AtrEstatus=atrEstado from ManV2.AtrIndicador with(nolock) where atrClaveInd= @CveI3
				 if @AtrEstatus='MAN'
				 begin
					update ManV2.AtrIndicador set atrEstado='PRE' where atrClaveInd= @CveI3
					update preV2.AtrIndicador set atrEstado='PRE' where atrClaveInd= @CveI3
					set @cadIns= CONVERT(NVARCHAR(255),@CveI3) --'update ManV2.AtrIndicador set atrEstado=''Pre'' where atrClaveInd=' + 
					set @cadIns = 'update ManV2.AtrIndicador set atrEstado=''PRE'' where atrClaveInd=' + @cadIns
					insert into ManV2.Movimientos (movSQL,movIndicador,movCatalogo,movComentario,movEstatus) values(@cadIns,@CveI3,'AtrIndicador',CONVERT(NVARCHAR(255),@CveI3),'E')
				 end
				 else
				 begin
					set @cadIns= 'Indicador en estatus: ' + @AtrEstatus
					insert into ManV2.Movimientos (movSQL,movIndicador,movCatalogo,movComentario,movEstatus) values(@cadIns,@CveI3,'AtrIndicador',CONVERT(NVARCHAR(255),@CveI3),'E')
				 end
			 end 
			 else
			 begin
				set @cadIns= 'Indicador sin estatus ya que fue borrado esquema PRE'
				insert into ManV2.Movimientos (movSQL,movIndicador,movCatalogo,movComentario,movEstatus) values(@cadIns,@CveI3,'AtrIndicador',CONVERT(NVARCHAR(255),@CveI3),'E')
			 end
			 
			 
			 --update ManV2.AtrIndicador set atrEstado='PRE' where atrClaveInd= @CveI3
			 --update preV2.AtrIndicador set atrEstado='PRE' where atrClaveInd= @CveI3
			 --set @cadIns= CONVERT(NVARCHAR(255),@CveI3) --'update ManV2.AtrIndicador set atrEstado=''Pre'' where atrClaveInd=' + 
			 --set @cadIns = 'update ManV2.AtrIndicador set atrEstado=''PRE'' where atrClaveInd=' + @cadIns
			 --print @cadIns
			 --insert into ManV2.Movimientos (movSQL,movIndicador,movCatalogo,movComentario,movEstatus) values(@cadIns,@CveI3,'AtrIndicador',CONVERT(NVARCHAR(255),@CveI3),'E')
			 
		end
	 
	End try
	Begin Catch
		SET @msg = @msg +  char(13) + 'Ocurrio un Error: ' + ERROR_MESSAGE() + ' en la línea ' + CONVERT(NVARCHAR(255), ERROR_LINE() ) + '. Indicador ' + CONVERT(NVARCHAR(255),@mI) + char(13)
		Rollback TRAN
		PRINT @msg
	End Catch
	
END

GO
/****** Object:  StoredProcedure [PubV2].[ReplicaPubCat]    Script Date: 10/09/2020 01:24:07 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [PubV2].[ReplicaPubCat] 
	-- Add the parameters for the stored procedure here
	@Cat nvarChar(MAX)
AS
BEGIN
SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED

declare @mCla int, @cveNt int,@mCla2 int,@mI int
declare @mS nvarchar(MAX),@mCve nvarChar(Max),@mS2 nvarchar(MAX),@Opci nvarchar(1), @banEstado nvarchar(6),@Estado nvarchar(3)
declare @cadSqlM nvarchar(Max),@cveAgruCl nvarChar(Max),@cveAgruCo nvarChar(MAX),@cveAgruCoDes nvarChar(MAX),@cveCoTipoGeo int,@cobCveTipoCobGeo int
declare @cadSqlM1 nvarchar(Max)
declare @cadSqlM2 nvarchar(Max)
declare @Posicion int,@Posicion3 int,@Posicion4 int,
@Posicion2 int,@CatS2 varchar(255),
@CatS varchar(255),@CatSAdic varchar(255),@CatSAdicTemp varchar(255)
declare @tablaCveAgrCl table (acCve nvarchar)
declare @tablaCveAgrCo table (acoCve nvarchar, acoCveGeo nvarChar, acoCveDes nvarChar)
set @mI=0
 WHILE patindex('%,%' , @Cat) <> 0
 begin
	SELECT @Posicion2 =  patindex('%,%' , @Cat)
	--Buscamos la posicion de la primera ,
	set @CatSAdic=''
	SELECT @CatS= left(@Cat, @Posicion2 - 1)--nombre de catalogo
	--if @CatS = 'Descripcion'
	--begin
	--	set @CatSAdic  ='Lexico,Enlace,LexicoIng,EnlaceIng,'
	--end
	if @CatS = 'DescripcionPCve'
	begin
		set @CatSAdic  ='LexicoPCve,EnlacePCve,LexicoPCveIng,EnlacePCveIng,'
	end
	if @CatS ='Grupo'
	begin
		set @CatSAdic  = 'Clasificacion,AgrupaClas,'
	end
	if @CatS ='CobGeo'
	begin
		set  @CatSAdic = 'AgrupaCob,DesgloseGeo,TipoCobGeo,'
	end
	set @CatSAdicTemp= @CatSAdic
	--Reemplazamos lo procesado con nada con la funcion stuff
	SELECT @Cat = stuff(@Cat, 1, @Posicion2, '')
	While exists (select movClave, movsql  from ManV2.movimientos with(nolock) where  movEstatus= 'P' and movCatalogo = @CatS )--replica cambios en toda la tabla de catalogos ****movIndicador=0 and
	Begin 
		set @CatSAdic = @CatSAdicTemp
		--@mCla=movClave,@mS=movsql, @mI=movIndicador, @mCt=movCatalogo, @mCom= movComentario
		Select top 1 @mCla=movClave,@mS=movsql,@mCve=movComentario from ManV2.movimientos with(nolock) where  movEstatus= 'P' and movCatalogo = @CatS order by  SUBSTRING(movFecha,7,4) asc, substring(movFecha,4,2) asc, SUBSTRING(movFecha,0,3) asc, substring(movhora,0,3) asc, substring(movhora,4,2) asc, substring(movhora,7,2) asc,movclave --*****movIndicador=0 and
		--Select top 1 @mS=movsql  from Man.movimientos where movIndicador=0 and movEstatus= 'M' and movCatalogo in (@Cat ) order by  SUBSTRING(movFecha,7,4) asc, substring(movFecha,4,2) asc, SUBSTRING(movFecha,0,3) asc, substring(movhora,0,3) asc, substring(movhora,4,2) asc, substring(movhora,7,2) asc 
		select @Opci =  left(@mS,1)	--obtener el primer caracter
		  if @Opci='I' or  @Opci='i'
		  begin
				exec  PubV2.RevisaDuplicadosPub @mCla,@mS, @mI, @CatS, @mCve
		   end
		   else
		   begin
				select @Posicion =  patindex('%ManV2.%' , @mS)
				--Buscamos la posicion de la primera ,
				select @cadSqlM2 = left(@mS, @Posicion - 1)-- esquema
				select @mS =  stuff(@mS, 1, @Posicion+5, '')
				--Y obtenemos los caracteres hasta esa posicion
				set @cadSqlM1=  @cadSqlM2 + ' PubV2.' + @mS   --SUBSTRING (@mS,@Posicion+4,len(@mS) - (@Posicion + 4))
			--	print @cadSqlM1
				exec(@cadSqlM1)
				update ManV2.movimientos SET movEstatus='B' where movClave=@mCla
		end
		if (@CatSAdic <>'')
		begin
		  
			WHILE patindex('%,%' , @CatSAdic) <> 0
			begin
				SELECT @Posicion3 =  patindex('%,%' , @CatSAdic)
				SELECT @CatS2= left(@CatSAdic, @Posicion3 - 1)--nombre de catalogo
				While exists (select movClave, movsql  from ManV2.movimientos with(nolock) where  movEstatus= 'P' and movCatalogo = @CatS2 and movComentario = @mCve )--replica cambios en toda la tabla de catalogos ****movIndicador=0 and
				Begin
					--if @CatS = 'Descripcion'
					--begin
					--	--revisa movimiento de la clave especifica
					--	Select top 1 @mCla2=movClave,@mS2=movsql from ManV2.movimientos with(nolock) where  movEstatus= 'P' and movCatalogo = @CatS2 and movComentario = @mCve order by  SUBSTRING(movFecha,7,4) asc, substring(movFecha,4,2) asc, SUBSTRING(movFecha,0,3) asc, substring(movhora,0,3) asc, substring(movhora,4,2) asc, substring(movhora,7,2) asc,movclave --*****movIndicador=0 and
					--	--Select top 1 @mS=movsql  from Man.movimientos where movIndicador=0 and movEstatus= 'M' and movCatalogo in (@Cat ) order by  SUBSTRING(movFecha,7,4) asc, substring(movFecha,4,2) asc, SUBSTRING(movFecha,0,3) asc, substring(movhora,0,3) asc, substring(movhora,4,2) asc, substring(movhora,7,2) asc 
					--	select @Opci =  left(@mS2,1)
					--	if @Opci='I' or  @Opci='i'
					--	begin
					--			exec  PubV2.RevisaDuplicadosPub @mCla2,@mS2, @mI, @CatS2, @mCve
					--			--if @returnError<>''
					--			--begin
					--			--	set @msg = @msg + ' - '  + @returnError
					--			--end
					--	end
					--	else
					--	begin
					--		select @Posicion4 =  patindex('%ManV2.%' , @mS2)
					--		--Buscamos la posicion de la primera ,
					--		select @cadSqlM2 = left(@mS2, @Posicion4 - 1)-- esquema
					--		select @mS2 =  stuff(@mS2, 1, @Posicion4 +5, '')
					--		--Y obtenemos los caracteres hasta esa posicion
					--		set @cadSqlM1=  @cadSqlM2 + ' PubV2.' + @mS2   --SUBSTRING (@mS,@Posicion+4,len(@mS) - (@Posicion + 4))
					--	--	print @cadSqlM1
					--		exec(@cadSqlM1)
					--		update ManV2.movimientos SET movEstatus='B' where movClave=@mCla2
					--	end
					--end
					--palabras clave
					if @CatS = 'DescripcionPCve'
					begin
						--revisa movimiento de la clave especifica
						Select top 1 @mCla2=movClave,@mS2=movsql from ManV2.movimientos with(nolock) where  movEstatus= 'P' and movCatalogo = @CatS2 and movComentario = @mCve order by  SUBSTRING(movFecha,7,4) asc, substring(movFecha,4,2) asc, SUBSTRING(movFecha,0,3) asc, substring(movhora,0,3) asc, substring(movhora,4,2) asc, substring(movhora,7,2) asc,movclave --*****movIndicador=0 and
						--Select top 1 @mS=movsql  from Man.movimientos where movIndicador=0 and movEstatus= 'M' and movCatalogo in (@Cat ) order by  SUBSTRING(movFecha,7,4) asc, substring(movFecha,4,2) asc, SUBSTRING(movFecha,0,3) asc, substring(movhora,0,3) asc, substring(movhora,4,2) asc, substring(movhora,7,2) asc 
						select @Opci =  left(@mS2,1)
						if @Opci='I' or  @Opci='i'
						begin
								exec  PubV2.RevisaDuplicadosPub @mCla2,@mS2, @mI, @CatS2, @mCve
						end
						else
						begin
							select @Posicion4 =  patindex('%ManV2.%' , @mS2)
							--Buscamos la posicion de la primera ,
							select @cadSqlM2 = left(@mS2, @Posicion4 - 1)-- esquema
							select @mS2 =  stuff(@mS2, 1, @Posicion4 +5, '')
							--Y obtenemos los caracteres hasta esa posicion
							set @cadSqlM1=  @cadSqlM2 + ' PubV2.' + @mS2   --SUBSTRING (@mS,@Posicion+4,len(@mS) - (@Posicion + 4))
						--	print @cadSqlM1
							exec(@cadSqlM1)
							update ManV2.movimientos SET movEstatus='B' where movClave=@mCla2
						end
						
					end
					if @CatS = 'Grupo'
					begin
					
						--revisa movimiento de la clave especifica
						Select top 1 @mCla2=movClave,@mS2=movsql from ManV2.movimientos with(nolock) where  movEstatus= 'P' and movCatalogo = @CatS2 and movComentario = @mCve order by  SUBSTRING(movFecha,7,4) asc, substring(movFecha,4,2) asc, SUBSTRING(movFecha,0,3) asc, substring(movhora,0,3) asc, substring(movhora,4,2) asc, substring(movhora,7,2) asc,movclave --*****movIndicador=0 and
						--Select top 1 @mS=movsql  from Man.movimientos where movIndicador=0 and movEstatus= 'M' and movCatalogo in (@Cat ) order by  SUBSTRING(movFecha,7,4) asc, substring(movFecha,4,2) asc, SUBSTRING(movFecha,0,3) asc, substring(movhora,0,3) asc, substring(movhora,4,2) asc, substring(movhora,7,2) asc 
						select @Opci =  left(@mS2,1)
						if @Opci='I' or  @Opci='i'
						begin
								exec  PubV2.RevisaDuplicadosPub @mCla2,@mS2, @mI, @CatS2, @mCve
						end
						else
						begin
							select @Posicion4 =  patindex('%ManV2.%' , @mS2)
							--Buscamos la posicion de la primera ,
							select @cadSqlM2 = left(@mS2, @Posicion4 - 1)-- esquema
							select @mS2 =  stuff(@mS2, 1, @Posicion4 +5, '')
							--Y obtenemos los caracteres hasta esa posicion
							set @cadSqlM1=  @cadSqlM2 + ' PubV2.' + @mS2   --SUBSTRING (@mS,@Posicion+4,len(@mS) - (@Posicion + 4))
						--	print @cadSqlM1
							exec(@cadSqlM1)
							update ManV2.movimientos SET movEstatus='B' where movClave=@mCla2
							--SELECT @CatSAdic  = stuff(@CatSAdic, 1, @Posicion3, '')
						end
						if @CatS2 ='AgrupaClas'
						begin
							insert into @tablaCveAgrCl  select acClave  from PreV2.AgrupaClas with(nolock) where acCveGpo = @mCve--obtener clave de agrupamiento de clasificaciones
							while exists(select * from @tablaCveAgrCl )--revisar Agrupamiento del indicador
							begin
								select top 1 @cveAgruCl  = acCve  from @tablaCveAgrCl 
								while exists(select movClave,movsql  from ManV2.movimientos with(nolock) where  movCatalogo ='AgrupaClas' and movcomentario= @cveAgruCl  and  movEstatus='P' and movComentario = @cveAgruCl )
								begin
									Select top 1 @mCla2=movClave,@mS2=movsql from ManV2.movimientos with(nolock) where  movEstatus= 'P' and movCatalogo = @CatS2 and movComentario = @cveAgruCl order by  SUBSTRING(movFecha,7,4) asc, substring(movFecha,4,2) asc, SUBSTRING(movFecha,0,3) asc, substring(movhora,0,3) asc, substring(movhora,4,2) asc, substring(movhora,7,2) asc,movclave --*****movIndicador=0 and
									--Select top 1 @mS=movsql  from Man.movimientos where movIndicador=0 and movEstatus= 'M' and movCatalogo in (@Cat ) order by  SUBSTRING(movFecha,7,4) asc, substring(movFecha,4,2) asc, SUBSTRING(movFecha,0,3) asc, substring(movhora,0,3) asc, substring(movhora,4,2) asc, substring(movhora,7,2) asc 
									select @Opci =  left(@mS2,1)
									if @Opci='I' or  @Opci='i'
									begin
											exec  PubV2.RevisaDuplicadosPub @mCla2,@mS2, @mI, @CatS2, @cveAgruCl
									end
									else
									begin
										select @Posicion4 =  patindex('%ManV2.%' , @mS2)
										--Buscamos la posicion de la primera ,
										select @cadSqlM2 = left(@mS2, @Posicion4 - 1)-- esquema
										select @mS2 =  stuff(@mS2, 1, @Posicion4 +5, '')
										--Y obtenemos los caracteres hasta esa posicion
										set @cadSqlM1=  @cadSqlM2 + ' PubV2.' + @mS2   --SUBSTRING (@mS,@Posicion+4,len(@mS) - (@Posicion + 4))
									--	print @cadSqlM1
										exec(@cadSqlM1)
										update ManV2.movimientos SET movEstatus='B' where movClave=@mCla2
									end
								end
								delete from @tablaCveAgrCl  where acCve= @cveAgruCl
							end
	
						end
						
						
					end
					if @CatS='CobGeo'
					begin
							insert into @tablaCveAgrCo  select acoClave,acoCveGeo, acoCveDesGeo  from PreV2.AgrupaCob with(nolock) where acoCveGeo = @mCve--obtener clave de agrupamiento de clasificaciones
							while exists(select * from @tablaCveAgrCo )--revisar Agrupamiento del indicador
							begin
								select top 1 @cveAgruCo  = acoCve, @cveAgrucoDes= acoCveDes  from @tablaCveAgrCo 
								if @CatS2='AgrupaCob'
								begin
									while exists(select movClave,movsql  from ManV2.movimientos with(nolock) where  movCatalogo ='AgrupaCob' and movcomentario= @cveAgruCo  and  movEstatus='P' )
									begin
										Select top 1 @mCla2=movClave,@mS2=movsql from ManV2.movimientos with(nolock) where  movEstatus= 'P' and movCatalogo = @CatS2 and movComentario = @cveAgruCo order by  SUBSTRING(movFecha,7,4) asc, substring(movFecha,4,2) asc, SUBSTRING(movFecha,0,3) asc, substring(movhora,0,3) asc, substring(movhora,4,2) asc, substring(movhora,7,2) asc,movclave --*****movIndicador=0 and
										--Select top 1 @mS=movsql  from Man.movimientos where movIndicador=0 and movEstatus= 'M' and movCatalogo in (@Cat ) order by  SUBSTRING(movFecha,7,4) asc, substring(movFecha,4,2) asc, SUBSTRING(movFecha,0,3) asc, substring(movhora,0,3) asc, substring(movhora,4,2) asc, substring(movhora,7,2) asc 
										select @Opci =  left(@mS2,1)
										if @Opci='I' or  @Opci='i'
										begin
												exec  PubV2.RevisaDuplicadosPub @mCla2,@mS2, @mI, @CatS2, @cveAgruCo
										end
										else
										begin
											select @Posicion4 =  patindex('%ManV2.%' , @mS2)
											--Buscamos la posicion de la primera ,
											select @cadSqlM2 = left(@mS2, @Posicion4 - 1)-- esquema
											select @mS2 =  stuff(@mS2, 1, @Posicion4 +5, '')
											--Y obtenemos los caracteres hasta esa posicion
											set @cadSqlM1=  @cadSqlM2 + ' PubV2.' + @mS2   --SUBSTRING (@mS,@Posicion+4,len(@mS) - (@Posicion + 4))
										--	print @cadSqlM1
											exec(@cadSqlM1)
											update ManV2.movimientos SET movEstatus='B' where movClave=@mCla2
										end
									end
								end
								if @CatS2='DesgloseGeo'
								begin
								--revisar cambios en Tipo de desglose
									while exists(select movClave,movsql  from ManV2.movimientos with(nolock) where  movCatalogo ='DesgloseGeo' and movcomentario= @cveAgruCoDes  and  movEstatus='P' )
									begin
										Select top 1 @mCla2=movClave,@mS2=movsql from ManV2.movimientos with(nolock) where  movEstatus= 'P' and movCatalogo = @CatS2 and movComentario = @cveAgruCoDes order by  SUBSTRING(movFecha,7,4) asc, substring(movFecha,4,2) asc, SUBSTRING(movFecha,0,3) asc, substring(movhora,0,3) asc, substring(movhora,4,2) asc, substring(movhora,7,2) asc,movclave --*****movIndicador=0 and
										--Select top 1 @mS=movsql  from Man.movimientos where movIndicador=0 and movEstatus= 'M' and movCatalogo in (@Cat ) order by  SUBSTRING(movFecha,7,4) asc, substring(movFecha,4,2) asc, SUBSTRING(movFecha,0,3) asc, substring(movhora,0,3) asc, substring(movhora,4,2) asc, substring(movhora,7,2) asc 
										select @Opci =  left(@mS2,1)
										if @Opci='I' or  @Opci='i'
										begin
												exec  PubV2.RevisaDuplicadosPub @mCla2,@mS2, @mI, @CatS2, @cveAgruCoDes
										end
										else
										begin
											select @Posicion4 =  patindex('%ManV2.%' , @mS2)
											--Buscamos la posicion de la primera ,
											select @cadSqlM2 = left(@mS2, @Posicion4 - 1)-- esquema
											select @mS2 =  stuff(@mS2, 1, @Posicion4 +5, '')
											--Y obtenemos los caracteres hasta esa posicion
											set @cadSqlM1=  @cadSqlM2 + ' PubV2.' + @mS2   --SUBSTRING (@mS,@Posicion+4,len(@mS) - (@Posicion + 4))
										--	print @cadSqlM1
											exec(@cadSqlM1)
											update ManV2.movimientos SET movEstatus='B' where movClave=@mCla2
										end
									end
								end
								if @CatS2='TipoCobGeo'
								begin
								--revisar cambios en Tipo de desglose
									Select top 1 @cobCveTipoCobGeo=cgCveTipoCobGeo from PreV2.CobGeo with(nolock) where cgClave= @mCve
									while exists(select movClave,movsql  from ManV2.movimientos with(nolock) where  movCatalogo ='TipoCobGeo' and movcomentario= @cobCveTipoCobGeo  and  movEstatus='P' )
									begin
										Select top 1 @mCla2=movClave,@mS2=movsql from ManV2.movimientos with(nolock) where  movEstatus= 'P' and movCatalogo = @CatS2 and movComentario = @cobCveTipoCobGeo order by  SUBSTRING(movFecha,7,4) asc, substring(movFecha,4,2) asc, SUBSTRING(movFecha,0,3) asc, substring(movhora,0,3) asc, substring(movhora,4,2) asc, substring(movhora,7,2) asc,movclave --*****movIndicador=0 and
										--Select top 1 @mS=movsql  from Man.movimientos where movIndicador=0 and movEstatus= 'M' and movCatalogo in (@Cat ) order by  SUBSTRING(movFecha,7,4) asc, substring(movFecha,4,2) asc, SUBSTRING(movFecha,0,3) asc, substring(movhora,0,3) asc, substring(movhora,4,2) asc, substring(movhora,7,2) asc 
										select @Opci =  left(@mS2,1)
										if @Opci='I' or  @Opci='i'
										begin
												exec  PubV2.RevisaDuplicadosPub @mCla2,@mS2, @mI, @CatS2, @cobCveTipoCobGeo
										end
										else
										begin
											select @Posicion4 =  patindex('%ManV2.%' , @mS2)
											--Buscamos la posicion de la primera ,
											select @cadSqlM2 = left(@mS2, @Posicion4 - 1)-- esquema
											select @mS2 =  stuff(@mS2, 1, @Posicion4 +5, '')
											--Y obtenemos los caracteres hasta esa posicion
											set @cadSqlM1=  @cadSqlM2 + ' PubV2.' + @mS2   --SUBSTRING (@mS,@Posicion+4,len(@mS) - (@Posicion + 4))
										--	print @cadSqlM1
											exec(@cadSqlM1)
											update ManV2.movimientos SET movEstatus='B' where movClave=@mCla2
										end
									end
								end
								
								delete from @tablaCveAgrCo  where acoCve= @cveAgruCo
							end
	
						
					end
				end
				SELECT @CatSAdic  = stuff(@CatSAdic, 1, @Posicion3, '')
				
			end 
		end
		
	END
	if @CatS= 'DescripcionPCve'
		begin
			While exists (select movClave, movsql  from ManV2.movimientos , manv2.atrIndicador with(nolock) where atrClaveInd= movIndicador and  atrEstado='PUB'  and movEstatus= 'P' and movCatalogo = 'EnlIndPCve')--replica cambios en toda la tabla de catalogos ****movIndicador=0 and
			Begin
				set @mCve=''
				Select top 1 @mCla=movClave,@mS=movsql, @mI= movIndicador from ManV2.movimientos,manv2.atrIndicador with(nolock) where atrClaveInd= movIndicador and  atrEstado='PUB'  and  movEstatus= 'P' and movCatalogo = 'EnlIndPCve' order by  SUBSTRING(movFecha,7,4) asc, substring(movFecha,4,2) asc, SUBSTRING(movFecha,0,3) asc, substring(movhora,0,3) asc, substring(movhora,4,2) asc, substring(movhora,7,2) asc,movclave --*****movIndicador=0 and
				select @Opci =  left(@mS,1)
				if @Opci='I' or  @Opci='i'
				begin
					exec  PubV2.RevisaDuplicadosPub @mCla,@mS, @mI, @CatS, @mCve
					--if @returnError<>''
					--begin
					--	set @msg = @msg + ' - '  + @returnError
					--end
				end
				else
				begin
					select @Posicion =  patindex('%ManV2.%' , @mS)
					--Buscamos la posicion de la primera ,
					select @cadSqlM2 = left(@mS, @Posicion - 1)-- esquema
					select @mS =  stuff(@mS, 1, @Posicion+5, '')
					--Y obtenemos los caracteres hasta esa posicion
					set @cadSqlM1=  @cadSqlM2 + ' PubV2.' + @mS   --SUBSTRING (@mS,@Posicion+4,len(@mS) - (@Posicion + 4))
				--	print @cadSqlM1
					exec(@cadSqlM1)
					update ManV2.movimientos SET movEstatus='B' where movClave=@mCla
				end
			end
			
		
		end
		if @CatS ='Calendario'
		begin
			set @CatS2= 'Notas'
			Select top 1 @cveNt = calCveNota  from PreV2.Calendario with(nolock) where calClave ='ODS'
			While exists (select movClave, movsql  from ManV2.movimientos with(nolock) where  movEstatus= 'P' and movCatalogo = 'Notas' and movComentario= @cveNt )--replica cambios en toda la tabla de catalogos ****movIndicador=0 and
			Begin 
				Select top 1 @mCla=movClave,@mS=movsql  from ManV2.movimientos with(nolock) where  movEstatus= 'P' and movCatalogo = 'Notas' and movComentario = @cveNt order by  SUBSTRING(movFecha,7,4) asc, substring(movFecha,4,2) asc, SUBSTRING(movFecha,0,3) asc, substring(movhora,0,3) asc, substring(movhora,4,2) asc, substring(movhora,7,2) asc,movclave --*****movIndicador=0 and
				--Select top 1 @mS=movsql  from Man.movimientos where movIndicador=0 and movEstatus= 'M' and movCatalogo in (@Cat ) order by  SUBSTRING(movFecha,7,4) asc, substring(movFecha,4,2) asc, SUBSTRING(movFecha,0,3) asc, substring(movhora,0,3) asc, substring(movhora,4,2) asc, substring(movhora,7,2) asc 
				select @Opci =  left(@mS,1)
				if @Opci='I' or  @Opci='i'
				begin
					exec  PubV2.RevisaDuplicadosPub @mCla,@mS, @mI, @CatS2, @cveNt
					--if @returnError<>''
					--begin
					--	set @msg = @msg + ' - '  + @returnError
					--end
				end
				else
				begin
					select @Posicion =  patindex('%ManV2.%' , @mS)
					--Buscamos la posicion de la primera ,
					select @cadSqlM2 = left(@mS, @Posicion - 1)-- esquema
					select @mS =  stuff(@mS, 1, @Posicion+5, '')
					--Y obtenemos los caracteres hasta esa posicion
					set @cadSqlM1=  @cadSqlM2 + ' PubV2.' + @mS   --SUBSTRING (@mS,@Posicion+4,len(@mS) - (@Posicion + 4))
				--	print @cadSqlM1
					exec(@cadSqlM1)
					update ManV2.movimientos SET movEstatus='B' where movClave=@mCla
				end
			END
		end
 end
END


GO
/****** Object:  StoredProcedure [PubV2].[ReplicaPubIndSerPer]    Script Date: 10/09/2020 01:24:07 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [PubV2].[ReplicaPubIndSerPer] 
	-- Add the parameters for the stored procedure here
	@CveI nvarChar(MAX),
	@CveArb nvarchar(MAX),
	@TipoPro nvarchar(max),
	@msg nvarchar(Max) output
AS
BEGIN
SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED

declare @mCla int, @mI int, @banI int, @Con int,@CveI3 int
declare @mS nvarchar(MAX), @CveSr nvarchar(Max), @Periodos nvarchar (MAX), @PerTem  nvarchar(MAX), @MM nvarchar(5), @DD nvarchar(5), @AA nvarchar(10),@cadSerRev nvarchar(max)
declare @cadSqlM nvarchar(Max), @mCt varchar(50), @ley varchar(20), @CveI2 nvarchar(MAX), @CveArb2 nvarchar(MAX),@Opci nvarchar(1)
declare @cadSqlM1 nvarchar(Max),@CveSrAn nvarchar(MAX),@PeriodosAn nvarchar(MAX),@msg2 nvarchar(Max)
declare @cadSqlM2 nvarchar(Max), @mCom nvarchar(MAX),@CveCo nvarchar(MAX), @CveCl nvarchar(MAX), @TipoProces varchar(2)
declare @cadSqlM3 nvarchar(Max),@cadIns nvarchar(Max)
declare @cadSqlM4 nvarchar(Max)
declare @cadSqlM5 nvarchar(Max),@cadCat varchar(100),@returnError nvarchar(Max),@cadSqlM6 nvarchar(Max),@AtrEstatus varchar(4),@CveAtsSer nvarchar(max)
declare @Posicion int,@PosicionEsp int,@Posicion2 int, @Posicion3 int,@Posicion4 int, @Posicion5 int, @Posicion6 int, @Posicion7 int,@CveFt nvarchar(max), @cadCveSer nvarchar(max)
declare @tablaCveSer table (CveSr nvarchar(max))


Begin Try 
	   set @msg2=''
		set @msg = ''
		set @banI=0
		set @CveI2= @CveI + ','
		WHILE patindex('%,%' , @CveI2) <> 0
		begin
		  Begin Tran
		  
				select @Posicion3 =  patindex('%,%' , @CveI2)--Buscamos la posicion de la primera ,
				select @CveI3 = left(@CveI2, @Posicion3 - 1)-- Claves de indicadores
				select @Posicion4 =  patindex('%,%' , @CveArb)--Buscamos la posicion de la primera ,
				select @CveArb2 = left(@CveArb, @Posicion4 - 1)-- Claves de arbol
				select @Posicion7 =  patindex('%,%' , @TipoPro)--Buscamos la posicion de la primera ,
				select @TipoProces = left(@TipoPro, @Posicion7 - 1)-- Claves de arbol
				print @TipoProces
				if @TipoProces='C'
				begin
					
					exec  pubv2.RevisaCamArbPub @mI, @CveArb2,@TipoProces 
					--exec @returnError = man.RevisaCamArb @mI, @CveArb2,@TipoProces 
					--if @returnError<>''
					--  begin
					--	set @msg = @msg + ' - '  + @returnError
					--  end
					set @CveSrAn =''
					set @PeriodosAn =''
					set @cadSerRev=''
			--		set @cadSqlM = N'(select @Con1=count(movClave) from Man.movimientos where movEstatus=''M'' and movIndicador in (' + @CveI + '))'
			--		EXEC SP_EXECUTESQL @cadSqlM, N'@Con1 int OUTPUT',@Con1 = @Con 
					--select movClave from Man.movimientos where movEstatus='M' and movIndicador = @CveI 
					--While exists (select movClave from Man.movimientos,Man.Arbol  where movIndicador= arbClaveInd and movEstatus='M' and movIndicador = @CveI3 and arbClave =@CveArb2 )
					While exists (select movClave from ManV2.movimientos with(nolock),PreV2.Arbol with(nolock)  where  movIndicador= arbClaveInd and movEstatus='P' and movIndicador = @CveI3 and arbClave =@CveArb2 )
					--While exists (select movClave from Man.movimientos,Man.Arbol  where movIndicador= arbClaveInd and movEstatus='M' and movIndicador = 58 and arbClave ='ODS009000800005')
					--While (@Con > 0)
					Begin 
						--set @cadSqlM3 = 'Select top 1 @mCla1=movClave,@mS1=movsql, @mI1=movIndicador, @mCt1=movCatalogo  from Man.movimientos where movEstatus=''M'' and movIndicador in (' + @CveI + ') order by  SUBSTRING(movFecha,7,4) asc, substring(movFecha,4,2) asc, SUBSTRING(movFecha,0,3) asc, substring(movhora,0,3) asc, substring(movhora,4,2) asc, substring(movhora,7,2) asc'
						--EXEC SP_EXECUTESQL @cadSqlM3, N'@mCla1 int output, @mS1 nvarchar(MAX) output ,@mI1 int output, @mCt1 nvarchar(50) output',@mCla1 = @mCla,@mS1 = @mS, @mI1=@mI,@mCt1= @mCt 
						Select top 1 @mCla=movClave,@mS=movsql, @mI=movIndicador, @mCt=movCatalogo, @mCom= movComentario  from ManV2.movimientos with(nolock),PreV2.Arbol with(nolock) where movIndicador = arbClaveInd and movEstatus='P' and movIndicador =@CveI3 and arbClave =@CveArb2  order by  SUBSTRING(movFecha,7,4) asc, substring(movFecha,4,2) asc, SUBSTRING(movFecha,0,3) asc, substring(movhora,0,3) asc, substring(movhora,4,2) asc, substring(movhora,7,2) asc, movClave 
						--Select top 1 @mCla=movClave,@mS=movsql, @mI=movIndicador, @mCt=movCatalogo, @mCom= movComentario  from Man.movimientos,Man.Arbol where movIndicador = arbClaveInd and movEstatus='M' and movIndicador =58 and arbClave ='ODS009000800005'  order by  SUBSTRING(movFecha,7,4) asc, substring(movFecha,4,2) asc, SUBSTRING(movFecha,0,3) asc, substring(movhora,0,3) asc, substring(movhora,4,2) asc, substring(movhora,7,2) asc, movClave 
						--exec(@cadSqlM3)
						--revisar si tiene cambios en arbol
						--if (@mI <> @banI and @mI<> 0)
						--begin
							--exec man.RevisaCamArb @mI, @CveArb2 
						--end
						if @mCt ='Serie'
						begin
							select @PosicionEsp =  patindex('%¬%' , @mS)
							if @mCom <> '' and @PosicionEsp > 0 
							begin
								select @Posicion =  patindex('%¬%' , @mS)--Buscamos la posicion de la primera ¬
							
								select @CveSr = left(@mS, @Posicion - 1)-- Claves de series
								if SUBSTRING (@CveSr,1,1)='L'
								begin
									select @Posicion2 =  patindex('%-%' , @CveSr )--Buscamos la posicion de la primera -
									select @CveSr =  stuff(@CveSr, 1, @Posicion2, '')	
								end
								select @mS =  stuff(@mS, 1, @Posicion, '')	
								set @Periodos  = @mS --periodos
								set @Periodos= @Periodos + ','
								select @Posicion2 =  patindex('%¬%' , @mCom )--Buscamos la posicion de la primera ¬
								select @CveCo = left(@mCom, @Posicion2 - 1)-- Claves de coberturas
								select @CveCl =  stuff(@mCom, 1, @Posicion2, '')--claves de clasificaciones	
								if @cadSerRev=''
								begin 
									set @cadSerRev =  @cadSerRev  + @CveSr  
								end
								else
								begin
									set @cadSerRev =  @cadSerRev + ',' + @CveSr  
								end
								--select @Posicion4 =  patindex('%/%' , @Periodos)--Buscamos la posicion de la primera /
								--if (@Posicion4 >0)
								--begin
								--	exec (@Periodos= PeriodosAMD, @mS)
									
								--end
								--if(@CveSr <> @CveSrAn or @Periodos <>@PeriodosAn)
								--begin
								
								WHILE patindex('%,%' , @Periodos) <> 0
								begin
									set @MM='0'
									set @DD='0'
									select @Posicion5 =  patindex('%,%' , @Periodos)--Buscamos la posicion de la primera ,
									select @PerTem = left(@Periodos, @Posicion5 - 1)-- Periodos
									set @PerTem= @PerTem + '/'
									--select @AA = left(@PerTem, 4)-- Año
									if (Len(@PerTem)>7)
									  begin--tiene Año, mes y dia
										select @Posicion6 =  patindex('%/%' , @PerTem)--Buscamos la posicion de la primera /
										select @AA = left(@PerTem, @Posicion6 - 1)-- Año
										SELECT @PerTem= stuff(@PerTem, 1, @Posicion6, '')
										select @Posicion6 =  patindex('%/%' , @PerTem)--Buscamos la posicion de la primera /
										select @MM = left(@PerTem, @Posicion6 - 1)-- Mes
										SELECT @PerTem= stuff(@PerTem, 1, @Posicion6, '')
										if (@PerTem<>'')
										 begin
											select @Posicion6 =  patindex('%/%' , @PerTem)--Buscamos la posicion de la primera /
											select @DD = left(@PerTem, @Posicion6 - 1)-- Dia
											SELECT @PerTem= stuff(@PerTem, 1, @Posicion6, '')
										 end
									  end
									  else 
									   begin
											if (Len(@PerTem)>5) --tiene año y mes
											begin
												select @Posicion6 =  patindex('%/%' , @PerTem)--Buscamos la posicion de la primera /
												select @AA = left(@PerTem, @Posicion6 - 1)-- Año
												SELECT @PerTem= stuff(@PerTem, 1, @Posicion6, '')
												select @Posicion6 =  patindex('%/%' , @PerTem)--Buscamos la posicion de la primera /
												select @MM = left(@PerTem, @Posicion6 - 1)-- Mes
												SELECT @PerTem= stuff(@PerTem, 1, @Posicion6, '')
											end
											else
											begin --solo año
												select @Posicion6 =  patindex('%/%' , @PerTem)--Buscamos la posicion de la primera /
												select @AA = left(@PerTem,@Posicion6 - 1)-- Año
												set @PerTem='' --stuff(@PerTem, 1, @Posicion6, '')
											end
									  end --serClaveInd =' + convert(nvarchar(10),@CveI3) +'  and 
									  print 'datos'
									  print @CveCo
									  print @CveSr
									set @cadSqlM4 ='delete from pubV2.Serie where serClave in('+ @CveSr +') and serAADato= '+ @AA +' and serMMDato= ' + @MM + ' and serDDDato= ' + @DD + '  and sercvecobAgrup in (' + @CveCo + ') and sercveClaAgrup in (' + @CveCl + ')'
									print @cadSqlM4
									EXEC (@cadSqlM4)
									set @cadSqlM5 = 'INSERT INTO pubV2.Serie
									   ([serCveCobAgrup]
									   ,[serCveClaAgrup]
									   ,[serClave]
									   ,[serAADato]
									   ,[serMMDato]
									   ,[serDDDato]
									   ,[serDato]
									   ,[serNoDato]
									   ,[serNota]
									   ,[serLeyenda]
									   ,[serLeyendaIng])
									   select [serCveCobAgrup]
									   ,[serCveClaAgrup]
									   ,[serClave]
									   ,[serAADato]
									   ,[serMMDato]
									   ,[serDDDato]
									   ,[serDato]
									   ,[serNoDato]
									   ,[serNota]
									   ,[serLeyenda]
									   ,[serLeyendaIng]
										from PreV2.Serie with(nolock) where serClave in (' + @CveSr + ') and  serAADato= ' + @AA + ' and serMMDato= ' + @MM + ' and serDDDato= ' + @DD + ' and sercvecobAgrup in (' + @CveCo + ') and sercveClaAgrup in (' + @CveCl + ')'
										print @cadSqlM5
										EXEC  (@cadSqlM5) --serClaveInd =' + CONVERT(nvarchar(10), @CveI3) + ' and 
									SELECT @Periodos= stuff(@Periodos, 1, @Posicion5, '')
								--end
								end
								update ManV2.movimientos SET movEstatus='B' where movClave=@mCla
								set @CveSrAn = @CveSr 
								set @PeriodosAn = @Periodos 
							end
							else --Es serie pero no se actualizaron datos
							begin
								select @Posicion =  patindex('%ManV2.%' , @mS)--Buscamos la posicion de la primera ,
								select @cadSqlM2 = left(@mS, @Posicion - 1)-- esquema
								select @mS =  stuff(@mS, 1, @Posicion+5, '')		--Y obtenemos los caracteres hasta esa posicion
								set @cadSqlM1=  @cadSqlM2 + ' PubV2.' + @mS   --SUBSTRING (@mS,@Posicion+4,len(@mS) - (@Posicion + 4))
								exec(@cadSqlM1)
								update ManV2.movimientos SET movEstatus='B' where movClave=@mCla
							end
						end
						 else --las demás tablas
						 begin 
							   --Revisar si es Insert	
							  --set @msg2 = @msg2  +  @mCla + '-' + @mS + '-' + @mI + '-' + @mCt + '-' + @mCom
							  print 'insert'
							  print @mCla
							   select @Opci =  left(@mS,1)	--obtener el primer caracter
							   if @Opci='I' or  @Opci='i'
							   begin
									exec  pubv2.RevisaDuplicadosPub @mCla,@mS, @mI, @mCt, @mCom
									--if @returnError<>''
									--begin
									--	set @msg = @msg + ' - '  + @returnError
									--end
							   end
							   else
							   begin
									print 'update-delete'
									print @mCla	
								   select @Posicion =  patindex('%ManV2.%' , @mS)--Buscamos la posicion de la primera ,
								   select @cadSqlM2 = left(@mS, @Posicion - 1)-- esquema
								   select @mS =  stuff(@mS, 1, @Posicion+5, '')		--Y obtenemos los caracteres hasta esa posicion
								   set @cadSqlM1=  @cadSqlM2 + ' PubV2.' + @mS   --SUBSTRING (@mS,@Posicion+4,len(@mS) - (@Posicion + 4))
								   exec(@cadSqlM1)
								   update ManV2.movimientos SET movEstatus='B' where movClave=@mCla
							   end
						 end
						 set @banI = @mI
						 --set @cadSqlM = 'select @Con1=count(movClave) from Man.movimientos where movEstatus=''P'' and movIndicador in ('+ @CveSr +')'
						 --exec(@cadSqlM)
						 --EXEC SP_EXECUTESQL @cadSqlM, N'@Con1 int OUTPUT',@Con1 = @Con
					END
					--print 'entre de RevisaCambArb' 
					exec pubv2.RevisaCamArbPub @mI, @CveArb2,@TipoProces
					--print 'regrese de RevisaCambArb' 
					print 'entre de RevisaAtrSerie' 
					exec pubv2.RevisaAtrSeriePub @mI,@TipoProces 
					print 'regrese de RevisaAtrSerie'
					print 'entre de RevisaCamAtrIndicadorPub'
					exec pubv2.RevisaCamAtrIndicadorPub @mI,@TipoProces 
					print 'entre de RevisaCamFichaTPub'
					exec pubv2.RevisaCamFichaTPub @mI,@TipoProces
					print 'entre de RevisaInformacionPub' 
					exec pubv2.RevisaInformacionPub @mI, @CveArb2,@TipoProces, @cadSerRev,'','' --las 3 últimas son cveSeries, cveFichatecnica y estado del indicador
					--print 'regrese de RevisaInformacionPub'
				end
				else --proceso borrar
				begin
				print 'Borrar'
					print @CveI3
					print @CveArb2
					print @TipoProces 
					exec pubv2.RevisaAtrSeriePub @CveI3,@TipoProces 
					print 'regrese de RevisaAtrSerie'
					exec pubv2.RevisaCamAtrIndicadorPub @CveI3,@TipoProces 
					print 'regrese de RevisaCamAtrIndicadorPub'
					exec pubv2.RevisaCamFichaTPub @CveI3,@TipoProces 
					print 'regrese de RevisaCamFichaTPub'
				   exec  pubv2.RevisaCamArbPub @CveI3, @CveArb2,@TipoProces 
				   print 'regrese de RevisaCamArbPub'
				   
				 
				   While exists (select movClave from ManV2.movimientos with(nolock)  where  movEstatus='P' and movIndicador = @CveI3 ) -- and arbClave =@CveArb2
					begin
						
						Select top 1 @mCla=movClave,@mS=movsql, @mI=movIndicador, @mCt=movCatalogo, @mCom= movComentario  from ManV2.movimientos with(nolock) where  movEstatus='P' and movIndicador =@CveI3  order by  SUBSTRING(movFecha,7,4) asc, substring(movFecha,4,2) asc, SUBSTRING(movFecha,0,3) asc, substring(movhora,0,3) asc, substring(movhora,4,2) asc, substring(movhora,7,2) asc, movClave  --and arbClave =@CveArb2 
						print @mCla
						print @mS
						select @Posicion =  patindex('%ManV2.%' , @mS)--Buscamos la posicion de la primera ,
						select @cadSqlM2 = left(@mS, @Posicion - 1)-- esquema
						select @mS =  stuff(@mS, 1, @Posicion+5, '')		--Y obtenemos los caracteres hasta esa posicion
						set @cadSqlM1=  @cadSqlM2 + ' PubV2.' + @mS   --SUBSTRING (@mS,@Posicion+4,len(@mS) - (@Posicion + 4))
						print @cadSqlM1
						exec(@cadSqlM1)
						update ManV2.movimientos SET movEstatus='B' where movClave=@mCla
					end
					Select top 1 @CveFt= arbClaveFT from PubV2.arbol where arbClaveInd= @CveI3 and arbClave=CONVERT(NVARCHAR(255),@CveArb2)
					insert into @tablaCveSer select  atsClaveSerie  from PubV2.AtrSerie, PubV2.EnlSerInd with(nolock) where atsClaveSerie= esiClaveSerie and esiClaveInd = @CveI3	
					while exists(select * from @tablaCveSer  )
					begin
						select top 1 @CveAtsSer = CveSr  from @tablaCveSer
						set @cadCveSer= @CveAtsSer + ',' + @cadCveSer  
						delete from @tablaCveSer where CveSr= @CveAtsSer
					end--while	
					--exec pru.RevisaInformacion @CveI3, @CveArb2,@TipoProces, @cadCveSer,@CveFt,'' --las 3 últimas son cveSeries, cveFichatecnica y el estado del indicador
					--exec pubv2.RevisaInformacionPub @CveI3, @CveArb2,@TipoProces, @cadCveSer,@CveFt,'' --las 3 últimas son cveSeries, cveFichatecnica y el estado del indicador
				end
				
				SELECT @CveI2= stuff(@CveI2, 1, @Posicion3, '')
				SELECT @CveArb= stuff(@CveArb, 1, @Posicion4, '')
				SELECT @TipoPro= stuff(@TipoPro, 1, @Posicion7, '')
			 COMMIT Tran
			if @TipoProces='C'
			 begin
				 update ManV2.AtrIndicador set atrEstado='PUB' where atrClaveInd= @CveI3
				 update preV2.AtrIndicador set atrEstado='PUB' where atrClaveInd= @CveI3
				 update pubV2.AtrIndicador set atrEstado='PUB' where atrClaveInd= @CveI3
				 set @cadIns= CONVERT(NVARCHAR(255),@CveI3) --'update ManV2.AtrIndicador set atrEstado=''Pre'' where atrClaveInd=' + 
				 set @cadIns = 'update ManV2.AtrIndicador set atrEstado=''PUB'' where atrClaveInd=' + @cadIns
			 end
			 else
			 begin
				 set @cadIns= CONVERT(NVARCHAR(255),@CveI3) --'update ManV2.AtrIndicador set atrEstado=''Pre'' where atrClaveInd=' + 
				 set @cadIns = 'Indicador sin estatus ya que fue borrado esquema PUB'
			 end
			 
			 --print @cadIns
			 insert into ManV2.Movimientos (movSQL,movIndicador,movCatalogo,movComentario,movEstatus) values(@cadIns,@CveI3,'AtrIndicador',CONVERT(NVARCHAR(255),@CveI3),'E')
			 
		end
	 
	End try
	Begin Catch
		SET @msg = @msg +  char(13) + 'Ocurrio un Error: ' + ERROR_MESSAGE() + ' en la línea ' + CONVERT(NVARCHAR(255), ERROR_LINE() ) + '. Indicador ' + CONVERT(NVARCHAR(255),@mI) + char(13)
		Rollback TRAN
		PRINT @msg
	End Catch
	
END

GO
/****** Object:  StoredProcedure [PubV2].[RevisaAtrSeriePub]    Script Date: 10/09/2020 01:24:07 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [PubV2].[RevisaAtrSeriePub] 
	-- Add the parameters for the stored procedure here
	@CveIn int,
	@TPro varchar(2)
AS
BEGIN
SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED
declare @mClaA int,@mClaA2 int,@cveSer int, @cveDes nvarchar(Max), @cveFre nvarchar(Max), @cveNota nvarchar(Max), @cveFue nvarchar(Max), @cveUni nvarchar(Max), @cveGral nvarchar(Max), @cveGra nvarchar(Max), @CveGpo int,@cveDesCl int,@movCtoDes nvarChar(Max)
declare @mSA nvarchar(MAX),@CveAr varchar(50),@mSA2 nvarchar(MAX),@cveAgru nvarchar(Max), @cveAgruCl nvarchar(Max), @cveAgru2 nvarchar(Max), @cveAgruCo nvarchar(Max), @cadOrdClaC nvarchar(max),@cadOrdClaG nvarchar(max),@mComAgrCl nvarchar(max)
declare @cadSqlM nvarchar(Max), @cveAgruCoGeo nvarchar(Max), @cveAgruCoDesGeo nvarchar(Max),@cobCveTipoCobGeo int, @aaclNota int , @TipoCl nvarchar(max)
declare @cadSqlM1 nvarchar(Max),@Opci nvarchar(1),@returnErrorSer nvarchar(Max),@msgSer nvarchar(Max),@cadOrdCob nvarchar(max), @mComAgrCo nvarchar(max), @aacoNota int
declare @cadSqlM2 nvarchar(Max), @cadCat nvarChar(Max),@cadCD varchar(30),@CveGpoClas nvarchar(Max)
declare @Pos int,@Pos3 int, @Pos2 int, @CveNotDato int,@apiNota int
declare @tablaSer table (c1 int)

declare @tablaGp table (cG int)
declare @tablaDesClas table (cveClas int, cveDs int)
declare @tablaAgr table (cA nvarchar(Max))
declare @tablaCveAgr table (cCA nvarchar(Max))
declare @tablaAgrCo table (cACo nvarchar(Max),cACoGeo nvarChar(Max),cACoDes nvarChar(Max))--tabla para obtener los campos de la tabla agrupaCob
declare @tablaCveAgrCo table (cCACo nvarchar(Max))
declare @tablaNotasDatos table (CveNotDat int)
declare @tablaNotasPer table (CveNotPer int)

set @msgSer = ''
print 'Estoy en RevisaAtrSerie'
print @TPro
 if @TPro='C'--cambio
 begin
	insert into @tablaSer select atsClaveSerie from PreV2.AtrSerie with(nolock), PreV2.EnlSerInd with(nolock) where atsClaveSerie = esiClaveSerie and esiClaveInd = @CveIn 
	while exists(select * from @tablaSer )
	begin
				select top 1 @cveSer = c1  from @tablaSer  
				select @cveDes = atsClaveDescrip, @cveFre = atsClaveFre, @cveNota = atsClaveNota, @cveFue = atsClaveFuente, @cveUni = atsClaveUnidad, @cveGra = atsTipoGra, @cveAgru2 = atsClaveAgrupaCob, @cveAgru = atsClaveAgrupaClas   from PreV2.AtrSerie with(nolock) where atsClaveSerie = @cveSer
				
				set @cadCat = 'Descripcion,Frecuencia,Notas,Fuentes,Unidad,Grafica'
				WHILE patindex('%,%' , @cadCat) <> 0
				begin
					SELECT @Pos2 =  patindex('%,%' , @cadCat)
					--Buscamos la posicion de la primera ,
					SELECT @cadCD= left(@cadCat, @Pos2 - 1)--nombre de catalogo
					--Reemplazamos lo procesado con nada con la funcion stuff
					SELECT @cadCat = stuff(@cadCat, 1, @Pos2, '')
					if (@cadCD ='Descripcion')
					begin set @cveGral= @cveDes	end
					if (@cadCD ='Frecuencia')
					begin set @cveGral= @cveFre	end
					if (@cadCD ='Notas')
					begin set @cveGral= @cveNota end
					if (@cadCD ='Fuentes')
					begin set @cveGral= @cveFue 	end
					if (@cadCD ='Unidad')
					begin set @cveGral= @cveUni	end
					if (@cadCD ='Grafica')
					begin set @cveGral= @cveGra	end
					if @cveGral <> 0
					begin
						while exists(select movClave,movsql  from ManV2.movimientos with(nolock) where movCatalogo=@cadCD and movcomentario= @cveGral  and  movEstatus='P' )
						begin
						select top 1 @mClaA2=movClave, @mSA2=movsql  from ManV2.movimientos with(nolock) where movCatalogo=@cadCD  and movcomentario= @cveGral and  movEstatus='P' order by SUBSTRING(movFecha,7,4) asc, substring(movFecha,4,2) asc, SUBSTRING(movFecha,0,3) asc, substring(movhora,0,3) asc, substring(movhora,4,2) asc, substring(movhora,7,2) asc, movClave
							select @Opci =  left(@mSA2,1)	--obtener el primer caracter
							if @Opci='I' or  @Opci='i'
							begin
								exec pubv2.RevisaDuplicadosPub @mClaA2,@mSA2, @CveIn , @cadCD, @cveGral
							end
							else
							begin
								select @Pos3 =  patindex('%ManV2.%' , @mSA2)--Buscamos la posicion de la primera ,
								select @cadSqlM = left(@mSA2, @Pos3 - 1)-- esquema
								select @mSA2 =  stuff(@mSA2, 1, @Pos3+5, '')			--Y obtenemos los caracteres hasta esa posicion
								set @cadSqlM1=  @cadSqlM + ' PubV2.' + @mSA2   --SUBSTRING (@mS,@Posicion+4,len(@mS) - (@Posicion + 4))
								exec(@cadSqlM1)
								update ManV2.movimientos SET movEstatus='B' where movClave=@mClaA2
							end
						end
					end 
				end
				--revisar notas en datos
					print 'revisar notas en datos'
					--select distinct serNota from ManV2.Serie with(nolock) where serClave = 903 and serNota <>'' and serNota <>0
					insert into @tablaNotasDatos select distinct serNota from PreV2.Serie with(nolock) where serClave = @cveSer and serNota <>'' and serNota <>0
					print 'insert en @TablaNotasDatos'
					while exists(select * from @tablaNotasDatos )--revisar notas que tiene el indicador en los datos se la serie
					begin
						print 'while de insert en @tablaNotasDatos'
						print 'antes del top 1 '
						select top 1 @CveNotDato = CveNotDat  from @tablaNotasDatos --obtenemos la primer nota
						print @CveNotDato
						while exists(select movClave,movsql  from ManV2.movimientos with(nolock) where movCatalogo='Notas'  and movcomentario= @CveNotDato  and  movEstatus='P' )
						begin
							select top 1 @mClaA2=movClave, @mSA2=movsql  from ManV2.movimientos with(nolock) where movCatalogo='Notas'  and movcomentario= @CveNotDato and  movEstatus='P' order by SUBSTRING(movFecha,7,4) asc, substring(movFecha,4,2) asc, SUBSTRING(movFecha,0,3) asc, substring(movhora,0,3) asc, substring(movhora,4,2) asc, substring(movhora,7,2) asc, movClave
							select @Opci =  left(@mSA2,1)	--obtener el primer caracter
							if @Opci='I' or  @Opci='i'
							begin
							   -- print 'Grupo: ' + @CveGpo
							   print 'Por entrar en RevisaDuplicados Notas'
								exec  PubV2.RevisaDuplicadosPub @mClaA2,@mSA2, @CveIn , 'Notas', @CveNotDato
								print 'Sali de RevisaDuplicados Notas'
							end
							else
							begin
							  select @Pos3 =  patindex('%ManV2.%' , @mSA2)--Buscamos la posicion de la primera ,
							  select @cadSqlM = left(@mSA2, @Pos3 - 1)-- esquema
							  select @mSA2 =  stuff(@mSA2, 1, @Pos3+5, '')			--Y obtenemos los caracteres hasta esa posicion
							  set @cadSqlM1=  @cadSqlM + ' PubV2.' + @mSA2   --SUBSTRING (@mS,@Posicion+4,len(@mS) - (@Posicion + 4))
							  exec(@cadSqlM1)
							  update ManV2.movimientos SET movEstatus='B' where movClave=@mClaA2
							end
						end
						delete from @tablaNotasDatos where CveNotDat = @CveNotDato
					end
					--revisar atributos de periodos 
					print 'revisar atributos de periodos'
					
					while exists(select movClave,movsql  from ManV2.movimientos with(nolock) where  movCatalogo ='AtrPeriodoPorInd'  and movComentario= Convert(nvarchar(255),@cveSer)  and  movEstatus='P' )
					begin
					
					  select top 1 @mClaA2=movClave, @mSA2=movsql from ManV2.movimientos with(nolock) where movCatalogo ='AtrPeriodoPorInd'  and movComentario = Convert(nvarchar(255),@cveSer)  and  movEstatus='P' order by SUBSTRING(movFecha,7,4) asc, substring(movFecha,4,2) asc, SUBSTRING(movFecha,0,3) asc, substring(movhora,0,3) asc, substring(movhora,4,2) asc, substring(movhora,7,2) asc, movClave
					  select @Opci =  left(@mSA2,1)	--obtener el primer caracter
					  print @Opci
					  if @Opci='I' or  @Opci='i'
					  begin
							print 'Entrando de revisa duplicados AtrPeriodoPorInd'
							print @mClaA2
							print @mSA2
							--exec  pru.RevisaDuplicados @mClaA2,@mSA2, @CveIn , 'AtrAgrupaClaPorInd', @cveAgruCl
							exec  PubV2.RevisaDuplicadosPub @mClaA2,@mSA2, @CveIn, 'AtrPeriodoPorInd', @cveSer
						end
						else
						begin
							
							select @Pos3 =  patindex('%ManV2.%' , @mSA2)--Buscamos la posicion de la primera ,
							select @cadSqlM = left(@mSA2, @Pos3 - 1)-- esquema
							select @mSA2 =  stuff(@mSA2, 1, @Pos3+5, '')			--Y obtenemos los caracteres hasta esa posicion
							set @cadSqlM1=  @cadSqlM + ' PubV2.' + @mSA2   --SUBSTRING (@mS,@Posicion+4,len(@mS) - (@Posicion + 4))
							exec(@cadSqlM1)
							update ManV2.movimientos SET movEstatus='B' where movClave=@mClaA2
						end
					 end--while de movimientos AtrPeriodoPorInd
					 
					 --revisar notas en periodos
					 print 'revisar notas en periodos'
					 insert into @tablaNotasPer select distinct apiCveNota   from PreV2.AtrPeriodoPorInd with(nolock)  where apiCveSer = @cveSer
					 while exists(select * from @tablaNotasPer)
					 begin
						 select top 1 @apiNota  = CveNotPer  from @tablaNotasPer  
							while exists(select movClave,movsql  from ManV2.movimientos with(nolock) where  movCatalogo ='Notas'  and movComentario= @apiNota and  movEstatus='P' )
							begin
							  select top 1 @mClaA2=movClave, @mSA2=movsql from ManV2.movimientos with(nolock) where movCatalogo ='Notas'  and movComentario= @apiNota and  movEstatus='P' order by SUBSTRING(movFecha,7,4) asc, substring(movFecha,4,2) asc, SUBSTRING(movFecha,0,3) asc, substring(movhora,0,3) asc, substring(movhora,4,2) asc, substring(movhora,7,2) asc, movClave
							  select @Opci =  left(@mSA2,1)	--obtener el primer caracter
							  print @Opci
							  if @Opci='I' or  @Opci='i'
							  begin
								print 'Entrando de revisa duplicados Notas en Periodo'
								print @mClaA2
								print @mSA2
								exec  PubV2.RevisaDuplicadosPub @mClaA2,@mSA2, @CveIn , 'Notas', @apiNota
							  end
							  else
							  begin
									select @Pos3 =  patindex('%ManV2.%' , @mSA2)--Buscamos la posicion de la primera ,
									select @cadSqlM = left(@mSA2, @Pos3 - 1)-- esquema
									select @mSA2 =  stuff(@mSA2, 1, @Pos3+5, '')			--Y obtenemos los caracteres hasta esa posicion
									set @cadSqlM1=  @cadSqlM + ' PubV2.' + @mSA2   --SUBSTRING (@mS,@Posicion+4,len(@mS) - (@Posicion + 4))
									exec(@cadSqlM1)
									update ManV2.movimientos SET movEstatus='B' where movClave=@mClaA2
							  end
							end--while notas
						 delete from @tablaNotasPer  where CveNotPer = @apiNota	
					end--while de @tablaNotasPer
				
				-- tipo de cuadro para revisar el grupo y clasificaciones
				
				--if  @cveAgru IS NULL or @cveAgru <> '0'
				print @cveAgru
				if  @cveAgru IS not NULL or @cveAgru <> '0'
				begin
					--insert into @tablaCveAgr select atrClaveAgrupaClas  from Man.AtrIndicador where atrClaveInd = @CveIn--obtener clave de agrupamiento de clasificaciones
					
					  insert into @tablaGp select distinct acCveGpo   from PreV2.AgrupaClas with(nolock)  where acClave like @cveAgru + '%'  and LEN(acClave)>3
					  while exists(select * from @TablaGp )--revisar Grupos que tiene el indicador
					  begin
					 
						--insert into @tablaClas select gpoClave, claClave,claClaveDescrip from man.Grupo, man.Clasificacion, man.EnlIndCla where claClave = eiclClaveClas and claGrupo = gpoClave and eiclClaveInd = @CveIn 
						  select top 1 @CveGpo = cG  from @TablaGp --obtenemos el primer grupo 
						 -- print @CveGpo
						  insert into @tablaDesClas  select  claClave, claClaveDescrip  from PreV2.Clasificacion with(nolock) where claGrupo = @CveGpo--obtener las descripciones de las clasificaciones
						  --select top 1 @CveGpo= Clagrupo from man.Clasificacion, man.EnlIndCla where claClave = eiclClaveClas  and eiclClaveInd = @CveIn 
						  while exists(select movClave,movsql  from ManV2.movimientos with(nolock) where movCatalogo='Grupo'  and movcomentario= @CveGpo  and  movEstatus='P' )
							  begin
								  --select top 1 @mClaA2=movClave, @mSA2=movsql  from man.movimientos where (movCatalogo='Grupo' or movCatalogo ='Clasificacion' or movCatalogo ='AgrupaClas')  and movcomentario= @CveGpo and  movEstatus='M' order by SUBSTRING(movFecha,7,4) asc, substring(movFecha,4,2) asc, SUBSTRING(movFecha,0,3) asc, substring(movhora,0,3) asc, substring(movhora,4,2) asc, substring(movhora,7,2) asc, movClave
								  select top 1 @mClaA2=movClave, @mSA2=movsql  from ManV2.movimientos with(nolock) where movCatalogo='Grupo'  and movcomentario= @CveGpo and  movEstatus='P' order by SUBSTRING(movFecha,7,4) asc, substring(movFecha,4,2) asc, SUBSTRING(movFecha,0,3) asc, substring(movhora,0,3) asc, substring(movhora,4,2) asc, substring(movhora,7,2) asc, movClave
								  select @Opci =  left(@mSA2,1)	--obtener el primer caracter

								  if @Opci='I' or  @Opci='i'
									begin
									   -- print 'Grupo: ' + @CveGpo
										exec  pubv2.RevisaDuplicadosPub @mClaA2,@mSA2, @CveIn , 'Grupo', @CveGpo
									end
									else
									begin
									  select @Pos3 =  patindex('%ManV2.%' , @mSA2)--Buscamos la posicion de la primera ,
									  select @cadSqlM = left(@mSA2, @Pos3 - 1)-- esquema
									  select @mSA2 =  stuff(@mSA2, 1, @Pos3+5, '')			--Y obtenemos los caracteres hasta esa posicion
									  set @cadSqlM1=  @cadSqlM + ' PubV2.' + @mSA2   --SUBSTRING (@mS,@Posicion+4,len(@mS) - (@Posicion + 4))
									  exec(@cadSqlM1)
									  update ManV2.movimientos SET movEstatus='B' where movClave=@mClaA2
								  end
							  end
							   --Descripciones de clasificaciones
						   while exists(select * from @tablaDesClas )
						   begin
							  select top 1 @cveDesCl  = cveDs  from @TablaDesClas --obtenemos la primer clasificacion
							  --while exists(select movClave,movsql  from ManV2.movimientos with(nolock) where (movCatalogo='Descripcion' or movCatalogo='Lexico' or movCatalogo='LexicoIng' or movCatalogo='Enlace' or movCatalogo='EnlaceIng') and movcomentario= Convert(nvarchar(255),@cveDesCl)  and  movEstatus='P' )
							  while exists(select movClave,movsql  from ManV2.movimientos with(nolock) where movCatalogo='Descripcion'  and movcomentario= Convert(nvarchar(255),@cveDesCl)  and  movEstatus='P' )
								  begin
								  --select top 1 @mClaA2=movClave, @mSA2=movsql, @movCtoDes= movCatalogo  from ManV2.movimientos with(nolock) where (movCatalogo='Descripcion' or movCatalogo='Lexico' or movCatalogo='LexicoIng' or movCatalogo='Enlace' or movCatalogo='EnlaceIng') and movcomentario= Convert(nvarchar(255),@cveDesCl) and  movEstatus='P' order by SUBSTRING(movFecha,7,4) asc, substring(movFecha,4,2) asc, SUBSTRING(movFecha,0,3) asc, substring(movhora,0,3) asc, substring(movhora,4,2) asc, substring(movhora,7,2) asc, movClave
									  select top 1 @mClaA2=movClave, @mSA2=movsql, @movCtoDes= movCatalogo  from ManV2.movimientos with(nolock) where movCatalogo='Descripcion'  and movcomentario= Convert(nvarchar(255),@cveDesCl) and  movEstatus='P' order by SUBSTRING(movFecha,7,4) asc, substring(movFecha,4,2) asc, SUBSTRING(movFecha,0,3) asc, substring(movhora,0,3) asc, substring(movhora,4,2) asc, substring(movhora,7,2) asc, movClave
									  select @Opci =  left(@mSA2,1)	--obtener el primer caracter
									  if @Opci='I' or  @Opci='i'
										begin
											exec  pubv2.RevisaDuplicadosPub @mClaA2,@mSA2, @CveIn , @movCtoDes, @cveDesCl
										end
										else
										begin
											select @Pos3 =  patindex('%ManV2.%' , @mSA2)--Buscamos la posicion de la primera ,
											select @cadSqlM = left(@mSA2, @Pos3 - 1)-- esquema
											select @mSA2 =  stuff(@mSA2, 1, @Pos3+5, '')			--Y obtenemos los caracteres hasta esa posicion
											set @cadSqlM1=  @cadSqlM + ' PubV2.' + @mSA2   --SUBSTRING (@mS,@Posicion+4,len(@mS) - (@Posicion + 4))
											exec(@cadSqlM1)
											update ManV2.movimientos SET movEstatus='B' where movClave=@mClaA2
										end
									  
								  end
							  ---Claves de clasificaciones
							  
							  while exists(select movClave,movsql  from ManV2.movimientos with(nolock) where movCatalogo='Clasificacion' and movcomentario= @CveGpo  and  movEstatus='P' )
								  begin
									  select top 1 @mClaA2=movClave, @mSA2=movsql  from ManV2.movimientos with(nolock) where movCatalogo='Clasificacion' and movcomentario= @CveGpo  and  movEstatus='P' order by SUBSTRING(movFecha,7,4) asc, substring(movFecha,4,2) asc, SUBSTRING(movFecha,0,3) asc, substring(movhora,0,3) asc, substring(movhora,4,2) asc, substring(movhora,7,2) asc, movClave
									  select @Opci =  left(@mSA2,1)	--obtener el primer caracter
									  
									  if @Opci='I' or  @Opci='i'
										begin
											--print 'Clasificacion:' + @CveGpo
											exec  pubv2.RevisaDuplicadosPub @mClaA2,@mSA2, @CveIn , 'Clasificacion', @CveGpo
										end
										else
										begin
											select @Pos3 =  patindex('%ManV2.%' , @mSA2)--Buscamos la posicion de la primera ,
											select @cadSqlM = left(@mSA2, @Pos3 - 1)-- esquema
											select @mSA2 =  stuff(@mSA2, 1, @Pos3+5, '')			--Y obtenemos los caracteres hasta esa posicion
											set @cadSqlM1=  @cadSqlM + ' PubV2.' + @mSA2   --SUBSTRING (@mS,@Posicion+4,len(@mS) - (@Posicion + 4))
											exec(@cadSqlM1)
											update ManV2.movimientos SET movEstatus='B' where movClave=@mClaA2
										end
									  
								  end
								delete from @TablaDesClas where cveDs = @cveDesCl	
							  end
							   --revisa el caso especial de agrupaClas con clave de grupo en el movcomentario
							  set @CveGpoClas = 'U' + Convert(nvarchar(255),@CveGpo) 
							  while exists(select movClave,movsql  from ManV2.movimientos with(nolock) where  movCatalogo ='AgrupaClas' and movcomentario=  @CveGpoClas  and  movEstatus='P' )
							  begin
								  
								  select top 1 @mClaA2=movClave, @mSA2=movsql  from ManV2.movimientos with(nolock) where movCatalogo ='AgrupaClas'  and movcomentario= @CveGpoClas and  movEstatus='P' order by SUBSTRING(movFecha,7,4) asc, substring(movFecha,4,2) asc, SUBSTRING(movFecha,0,3) asc, substring(movhora,0,3) asc, substring(movhora,4,2) asc, substring(movhora,7,2) asc, movClave
								  select @Pos3 =  patindex('%ManV2.%' , @mSA2)--Buscamos la posicion de la primera ,
								  select @cadSqlM = left(@mSA2, @Pos3 - 1)-- esquema
								  select @mSA2 =  stuff(@mSA2, 1, @Pos3+5, '')			--Y obtenemos los caracteres hasta esa posicion
								  set @cadSqlM1=  @cadSqlM + ' PubV2.' + @mSA2   --SUBSTRING (@mS,@Posicion+4,len(@mS) - (@Posicion + 4))
								  exec(@cadSqlM1)
								  update ManV2.movimientos SET movEstatus='B' where movClave=@mClaA2
							  end
							 delete from @TablaGp where cG= @CveGpo
					end--fin del clave de grupo
					
					  --revisa Agrupamiento por clave '010', '010010'...
					  --select distinct acClave from pru.AgrupaClas, pru.EnlIndCla2  where acClave= eiclClaveAgrupa and eiclClaveInd  = 54 or acClave like '020%'
					 -- select top 1 @cveAgru  = cCA  from @tablaCveAgr 
					 
					  insert into @tablaAgr select distinct acClave from PreV2.AgrupaClas with(nolock) where acClave like @cveAgru + '%' --'%'+ @titulo +'%'
					  while exists(select * from @tablaAgr )--revisar Agrupamiento del indicador
					  begin
						--insert into @tablaClas select gpoClave, claClave,claClaveDescrip from man.Grupo, man.Clasificacion, man.EnlIndCla where claClave = eiclClaveClas and claGrupo = gpoClave and eiclClaveInd = @CveIn 
						  select top 1 @cveAgruCl  = cA  from @tablaAgr --obtenemos la primer clave del agrupamiento 
						  --select top 1 @CveGpo= Clagrupo from man.Clasificacion, man.EnlIndCla where claClave = eiclClaveClas  and eiclClaveInd = @CveIn 
						  while exists(select movClave,movsql  from ManV2.movimientos with(nolock) where  movCatalogo ='AgrupaClas' and movcomentario= @cveAgruCl  and  movEstatus='P' )
							  begin
								  
								  select top 1 @mClaA2=movClave, @mSA2=movsql  from ManV2.movimientos with(nolock) where movCatalogo ='AgrupaClas'  and movcomentario= @cveAgruCl and  movEstatus='P' order by SUBSTRING(movFecha,7,4) asc, substring(movFecha,4,2) asc, SUBSTRING(movFecha,0,3) asc, substring(movhora,0,3) asc, substring(movhora,4,2) asc, substring(movhora,7,2) asc, movClave
								  select @Opci =  left(@mSA2,1)	--obtener el primer caracter
								  print @Opci
								  if @Opci='I' or  @Opci='i'
									begin
										print 'Entrando de revisa duplicados agrupaclas'
										print @mClaA2
										print @mSA2
										print @cveAgruCl
										exec  pubv2.RevisaDuplicadosPub @mClaA2,@mSA2, @CveIn , 'AgrupaClas', @cveAgruCl
									end
									else
									begin
										select @Pos3 =  patindex('%ManV2.%' , @mSA2)--Buscamos la posicion de la primera ,
										select @cadSqlM = left(@mSA2, @Pos3 - 1)-- esquema
										select @mSA2 =  stuff(@mSA2, 1, @Pos3+5, '')			--Y obtenemos los caracteres hasta esa posicion
										set @cadSqlM1=  @cadSqlM + ' PubV2.' + @mSA2   --SUBSTRING (@mS,@Posicion+4,len(@mS) - (@Posicion + 4))
										exec(@cadSqlM1)
										update ManV2.movimientos SET movEstatus='B' where movClave=@mClaA2
									end
								  
							  end
							  
							  
							  print 'AtrAgrupaClaPorInd'
							set @cadOrdClaC= Convert(nvarchar(max),@cveSer) + '-' + @cveAgruCl + '-C' 
							set @cadOrdClaG= Convert(nvarchar(max),@cveSer) + '-' + @cveAgruCl + '-G' 
							  while exists(select movClave,movsql  from ManV2.movimientos with(nolock) where  movCatalogo ='AtrAgrupaClaPorInd'  and (movComentario= @cadOrdClaC or  movComentario=@cadOrdClaG or movComentario = Convert(nvarchar(max),@cveSer))  and  movEstatus='P' )
								  begin
									  
									  select top 1 @mClaA2=movClave, @mSA2=movsql, @mComAgrCl= movComentario from ManV2.movimientos with(nolock) where movCatalogo ='AtrAgrupaClaPorInd'  and (movComentario= @cadOrdClaC or  movComentario=@cadOrdClaG or movComentario = @cveSer) and  movEstatus='P' order by SUBSTRING(movFecha,7,4) asc, substring(movFecha,4,2) asc, SUBSTRING(movFecha,0,3) asc, substring(movhora,0,3) asc, substring(movhora,4,2) asc, substring(movhora,7,2) asc, movClave
									  select @Opci =  left(@mSA2,1)	--obtener el primer caracter
									  print @Opci
									  if @Opci='I' or  @Opci='i'
										begin
											print 'Entrando de revisa duplicados AtrAgrupaClaPorInd'
											print @mClaA2
											print @mSA2
											print @cveAgruCl
											--exec  pru.RevisaDuplicados @mClaA2,@mSA2, @CveIn , 'AtrAgrupaClaPorInd', @cveAgruCl
											exec  Pubv2.RevisaDuplicadosPub @mClaA2,@mSA2, @CveIn  , 'AtrAgrupaClaPorInd', @mComAgrCl
										end
										else
										begin
											select @Pos3 =  patindex('%ManV2.%' , @mSA2)--Buscamos la posicion de la primera ,
											select @cadSqlM = left(@mSA2, @Pos3 - 1)-- esquema
											select @mSA2 =  stuff(@mSA2, 1, @Pos3+5, '')			--Y obtenemos los caracteres hasta esa posicion
											set @cadSqlM1=  @cadSqlM + ' PubV2.' + @mSA2   --SUBSTRING (@mS,@Posicion+4,len(@mS) - (@Posicion + 4))
											exec(@cadSqlM1)
											update ManV2.movimientos SET movEstatus='B' where movClave=@mClaA2
										end
									
									  
								  end--while de movimientos atrAtribAgrupaClInd
								  
								  --revisar nota del atributo de agrupamiento clasificacion
								  -- select @Pos3 =  patindex('%-%' , @mComAgrCl)--Buscamos la posicion de la primera -
									 --select @TipoCl =  stuff(@mComAgrCl, 1, @Pos3, '')	
									 --select @Pos3 =  patindex('%-%' , @TipoCl)--Buscamos la segunda posición de -	
									 --select @TipoCl =  stuff(@mComAgrCl, 1, @Pos3, '')--obtenemos C o G
									 select top 1 @aaclNota  = aaclCveNota  from prev2.AtrAgrupaClaPorInd where aaclCveSer=@cveSer and aaclAgrCla= @cveAgruCl --obtenemos la clave de nota del atributo de clasificacion 
									 if @aaclNota IS not NULL and @aaclNota <> 0
									 begin
										while exists(select movClave,movsql  from ManV2.movimientos with(nolock) where  movCatalogo ='Notas'  and movComentario= @aaclNota and  movEstatus='P' )
										begin
										  select top 1 @mClaA2=movClave, @mSA2=movsql from ManV2.movimientos with(nolock) where movCatalogo ='Notas'  and movComentario= @aaclNota and  movEstatus='P' order by SUBSTRING(movFecha,7,4) asc, substring(movFecha,4,2) asc, SUBSTRING(movFecha,0,3) asc, substring(movhora,0,3) asc, substring(movhora,4,2) asc, substring(movhora,7,2) asc, movClave
										  select @Opci =  left(@mSA2,1)	--obtener el primer caracter
										  print @Opci
										  if @Opci='I' or  @Opci='i'
											begin
												print 'Entrando de revisa duplicados Notas'
												print @mClaA2
												print @mSA2
												print @cveAgruCl
												--exec  pru.RevisaDuplicados @mClaA2,@mSA2, @CveIn , 'AtrAgrupaClaPorInd', @cveAgruCl
												exec  pubv2.RevisaDuplicadosPub @mClaA2,@mSA2, @CveIn , 'Notas', @aaclNota
											end
											else
											begin
												select @Pos3 =  patindex('%ManV2.%' , @mSA2)--Buscamos la posicion de la primera ,
												select @cadSqlM = left(@mSA2, @Pos3 - 1)-- esquema
												select @mSA2 =  stuff(@mSA2, 1, @Pos3+5, '')			--Y obtenemos los caracteres hasta esa posicion
												set @cadSqlM1=  @cadSqlM + ' PubV2.' + @mSA2   --SUBSTRING (@mS,@Posicion+4,len(@mS) - (@Posicion + 4))
												exec(@cadSqlM1)
												update ManV2.movimientos SET movEstatus='B' where movClave=@mClaA2
											end
											
										end--while notas
									 end--if notas
							  
							delete from @TablaAgr where cA= @cveAgruCl
					  end
					 
				  end--end del if (@Tipocua = 'CoCl' or @Tipocua = 'ACl' or @Tipocua = 'ClS' or @Tipocua = 'ClA')
				  --Agrupamiento de coberturas
				  --if (@Tipocua = 'CoCl' or @Tipocua = 'CoS')
				 -- begin
					--  insert into @tablaCveAgrCo select atrClaveAgrupaCob  from Man.AtrIndicador where atrClaveInd = @CveIn--obtener clave de agrupamiento de cobertura
					--revisa Agrupamiento cobertura por clave '010', '010010'...
					  --select distinct acClave from pru.AgrupaClas, pru.EnlIndCla2  where acClave= eiclClaveAgrupa and eiclClaveInd  = 54 or acClave like '020%'
					 -- select top 1 @cveAgru2  = cCACo  from @tablaCveAgrCo--clave general del agrupamiento 010,020, etc
					  insert into @tablaAgrCo select distinct acoClave,acoCveGeo, acoCveDesGeo from PreV2.AgrupaCob with(nolock) where  acoClave like @cveAgru2 + '%' --'%'+ @titulo +'%'
					  while exists(select * from @tablaAgrCo )--revisar Agrupamiento de coberturas del indicador
					  begin
						 
						  
						--insert into @tablaClas select gpoClave, claClave,claClaveDescrip from man.Grupo, man.Clasificacion, man.EnlIndCla where claClave = eiclClaveClas and claGrupo = gpoClave and eiclClaveInd = @CveIn 
						  select top 1 @cveAgruCo  = cACo, @cveAgruCoGeo = cACoGeo, @cveAgruCoDesGeo = cACoDes from @tablaAgrCo  --obtenemos la primer clave del agrupamiento de coberturas
						   --revisar coberturas
						  while exists(select movClave,movsql  from ManV2.movimientos with(nolock) where  movCatalogo ='CobGeo' and movcomentario= @cveAgruCoGeo  and  movEstatus='P' )
							  begin
								  select top 1 @mClaA2=movClave, @mSA2=movsql  from ManV2.movimientos with(nolock) where movCatalogo ='CobGeo'  and movcomentario= @cveAgruCoGeo and  movEstatus='P' order by SUBSTRING(movFecha,7,4) asc, substring(movFecha,4,2) asc, SUBSTRING(movFecha,0,3) asc, substring(movhora,0,3) asc, substring(movhora,4,2) asc, substring(movhora,7,2) asc, movClave
								  select @Opci =  left(@mSA2,1)	--obtener el primer caracter
								  if @Opci='I' or  @Opci='i'
									begin
										exec  pubv2.RevisaDuplicadosPub @mClaA2,@mSA2, @CveIn , 'CobGeo', @cveAgruCoGeo
									end
									else
									begin
										  select @Pos3 =  patindex('%ManV2.%' , @mSA2)--Buscamos la posicion de la primera ,
										  select @cadSqlM = left(@mSA2, @Pos3 - 1)-- esquema
										  select @mSA2 =  stuff(@mSA2, 1, @Pos3+5, '')			--Y obtenemos los caracteres hasta esa posicion
										  set @cadSqlM1=  @cadSqlM + ' PubV2.' + @mSA2   --SUBSTRING (@mS,@Posicion+4,len(@mS) - (@Posicion + 4))
										  exec(@cadSqlM1)
										  update ManV2.movimientos SET movEstatus='B' where movClave=@mClaA2
									end
							  end
						  --revisa desgloseGEo
						  while exists(select movClave,movsql  from ManV2.movimientos with(nolock) where  movCatalogo ='DesgloseGeo' and movcomentario= @cveAgruCoDesGeo  and  movEstatus='P' )
							  begin
								  select top 1 @mClaA2=movClave, @mSA2=movsql  from ManV2.movimientos with(nolock) where movCatalogo ='DesgloseGeo'  and movcomentario= @cveAgruCoDesGeo and  movEstatus='P' order by SUBSTRING(movFecha,7,4) asc, substring(movFecha,4,2) asc, SUBSTRING(movFecha,0,3) asc, substring(movhora,0,3) asc, substring(movhora,4,2) asc, substring(movhora,7,2) asc, movClave
								  select @Opci =  left(@mSA2,1)	--obtener el primer caracter
								  if @Opci='I' or  @Opci='i'
									begin
										exec  pubv2.RevisaDuplicadosPub @mClaA2,@mSA2, @CveIn , 'DesgloseGeo', @cveAgruCoDesGeo
									end
								  else
								  begin
										  select @Pos3 =  patindex('%ManV2.%' , @mSA2)--Buscamos la posicion de la primera ,
										  select @cadSqlM = left(@mSA2, @Pos3 - 1)-- esquema
										  select @mSA2 =  stuff(@mSA2, 1, @Pos3+5, '')			--Y obtenemos los caracteres hasta esa posicion
										  set @cadSqlM1=  @cadSqlM + ' PubV2.' + @mSA2   --SUBSTRING (@mS,@Posicion+4,len(@mS) - (@Posicion + 4))
										  exec(@cadSqlM1)
										  update ManV2.movimientos SET movEstatus='B' where movClave=@mClaA2
								  end
							  end
						  --revisar agrupamiento
						  --select top 1 @CveGpo= Clagrupo from man.Clasificacion, man.EnlIndCla where claClave = eiclClaveClas  and eiclClaveInd = @CveIn 
						  while exists(select movClave,movsql  from ManV2.movimientos with(nolock) where  movCatalogo ='AgrupaCob' and movcomentario= @cveAgruCo  and  movEstatus='P' )
							  begin
								  select top 1 @mClaA2=movClave, @mSA2=movsql  from ManV2.movimientos with(nolock) where movCatalogo ='AgrupaCob'  and movcomentario= @cveAgruCo and  movEstatus='P' order by SUBSTRING(movFecha,7,4) asc, substring(movFecha,4,2) asc, SUBSTRING(movFecha,0,3) asc, substring(movhora,0,3) asc, substring(movhora,4,2) asc, substring(movhora,7,2) asc, movClave
								  select @Opci =  left(@mSA2,1)	--obtener el primer caracter
								  if @Opci='I' or  @Opci='i'
									begin
									print @cveAgruCo
										exec  pubv2.RevisaDuplicadosPub @mClaA2,@mSA2, @CveIn , 'AgrupaCob', @cveAgruCo
									end
								  else
								  begin
									  select @Pos3 =  patindex('%ManV2.%' , @mSA2)--Buscamos la posicion de la primera ,
									  select @cadSqlM = left(@mSA2, @Pos3 - 1)-- esquema
									  select @mSA2 =  stuff(@mSA2, 1, @Pos3+5, '')			--Y obtenemos los caracteres hasta esa posicion
									  set @cadSqlM1=  @cadSqlM + ' PubV2.' + @mSA2   --SUBSTRING (@mS,@Posicion+4,len(@mS) - (@Posicion + 4))
									  exec(@cadSqlM1)
									  update ManV2.movimientos SET movEstatus='B' where movClave=@mClaA2
								  end
							  end
						 --revisar cambios en tipo de cobertura geográfica
						  Select top 1 @cobCveTipoCobGeo=cgCveTipoCobGeo from PreV2.CobGeo where cgClave= @cveAgruCoGeo
						   while exists(select movClave,movsql  from ManV2.movimientos with(nolock) where  movCatalogo ='TipoCobGeo' and movcomentario= @cobCveTipoCobGeo  and  movEstatus='P' )
							  begin
								  select top 1 @mClaA2=movClave, @mSA2=movsql  from ManV2.movimientos with(nolock) where movCatalogo ='TipoCobGeo'  and movcomentario= @cobCveTipoCobGeo and  movEstatus='P' order by SUBSTRING(movFecha,7,4) asc, substring(movFecha,4,2) asc, SUBSTRING(movFecha,0,3) asc, substring(movhora,0,3) asc, substring(movhora,4,2) asc, substring(movhora,7,2) asc, movClave
								  select @Opci =  left(@mSA2,1)	--obtener el primer caracter
								  if @Opci='I' or  @Opci='i'
									begin
										exec  pubv2.RevisaDuplicadosPub @mClaA2,@mSA2, @CveIn , 'TipoCobGeo', @cobCveTipoCobGeo
									end
								  else
								  begin
										  select @Pos3 =  patindex('%ManV2.%' , @mSA2)--Buscamos la posicion de la primera ,
										  select @cadSqlM = left(@mSA2, @Pos3 - 1)-- esquema
										  select @mSA2 =  stuff(@mSA2, 1, @Pos3+5, '')			--Y obtenemos los caracteres hasta esa posicion
										  set @cadSqlM1=  @cadSqlM + ' PubV2.' + @mSA2   --SUBSTRING (@mS,@Posicion+4,len(@mS) - (@Posicion + 4))
										  exec(@cadSqlM1)
										  update ManV2.movimientos SET movEstatus='B' where movClave=@mClaA2
								  end
							  end
						  --revisar atributos de la cobertura
							  set @cadOrdCob= Convert(nvarchar(max),@cveSer) + '-' +  @cveAgruCo 
							  print 'AtrAgrupaCobPorInd'
							  print @cadOrdCob
							  while exists(select movClave,movsql  from ManV2.movimientos with(nolock) where  movCatalogo ='AtrAgrupaCobPorInd'  and (movComentario= @cadOrdCob or movComentario = Convert(nvarchar(max),@cveSer))  and  movEstatus='P' )
								  begin
									   print 'entre a AtrAgrupaCobPorInd'
									  select top 1 @mClaA2=movClave, @mSA2=movsql, @mComAgrCo= movComentario from ManV2.movimientos with(nolock) where movCatalogo ='AtrAgrupaCobPorInd'  and (movComentario= @cadOrdCob or movComentario = @cveSer ) and  movEstatus='P' order by SUBSTRING(movFecha,7,4) asc, substring(movFecha,4,2) asc, SUBSTRING(movFecha,0,3) asc, substring(movhora,0,3) asc, substring(movhora,4,2) asc, substring(movhora,7,2) asc, movClave
									  select @Opci =  left(@mSA2,1)	--obtener el primer caracter
									  print @Opci
									  if @Opci='I' or  @Opci='i'
										begin
											print 'Entrando de revisa duplicados AtrAgrupaCobPorInd'
											print @mClaA2
											print @mSA2
											print @cveAgruCo
											--exec  pru.RevisaDuplicados @mClaA2,@mSA2, @CveIn , 'AtrAgrupaClaPorInd', @cveAgruCl
											exec  pubv2.RevisaDuplicadosPub @mClaA2,@mSA2, @CveIn  , 'AtrAgrupaCobPorInd', @mComAgrCo
										end
										else
										begin
											select @Pos3 =  patindex('%ManV2.%' , @mSA2)--Buscamos la posicion de la primera ,
											select @cadSqlM = left(@mSA2, @Pos3 - 1)-- esquema
											select @mSA2 =  stuff(@mSA2, 1, @Pos3+5, '')			--Y obtenemos los caracteres hasta esa posicion
											set @cadSqlM1=  @cadSqlM + ' PubV2.' + @mSA2   --SUBSTRING (@mS,@Posicion+4,len(@mS) - (@Posicion + 4))
											exec(@cadSqlM1)
											update ManV2.movimientos SET movEstatus='B' where movClave=@mClaA2
										end
								  end--while de movimientos atrAtribAgrupaCoInd
								--revisar nota del atributo de agrupamiento clasificacion
									 select top 1 @aacoNota  = aacoCveNota  from prev2.AtrAgrupaCobPorInd where aacoCveSer=@cveSer and aacoAgrCob= @cveAgruCo  --obtenemos la clave de nota del atributo de cobertura 
									 if @aacoNota IS not NULL and @aacoNota <> 0
									 begin
										while exists(select movClave,movsql  from ManV2.movimientos with(nolock) where  movCatalogo ='Notas'  and movComentario= @aacoNota and  movEstatus='P' )
										begin
										  select top 1 @mClaA2=movClave, @mSA2=movsql from ManV2.movimientos with(nolock) where movCatalogo ='Notas'  and movComentario= @aacoNota and  movEstatus='P' order by SUBSTRING(movFecha,7,4) asc, substring(movFecha,4,2) asc, SUBSTRING(movFecha,0,3) asc, substring(movhora,0,3) asc, substring(movhora,4,2) asc, substring(movhora,7,2) asc, movClave
										  select @Opci =  left(@mSA2,1)	--obtener el primer caracter
										  print @Opci
										  if @Opci='I' or  @Opci='i'
											begin
												print 'Entrando de revisa duplicados Notas en atributos de cobertura'
												print @mClaA2
												print @mSA2
												print @cveAgruCl
												--exec  pru.RevisaDuplicados @mClaA2,@mSA2, @CveIn , 'AtrAgrupaClaPorInd', @cveAgruCl
												exec  pubv2.RevisaDuplicadosPub @mClaA2,@mSA2, @CveIn , 'Notas', @aacoNota
											end
											else
											begin
												select @Pos3 =  patindex('%ManV2.%' , @mSA2)--Buscamos la posicion de la primera ,
												select @cadSqlM = left(@mSA2, @Pos3 - 1)-- esquema
												select @mSA2 =  stuff(@mSA2, 1, @Pos3+5, '')			--Y obtenemos los caracteres hasta esa posicion
												set @cadSqlM1=  @cadSqlM + ' PubV2.' + @mSA2   --SUBSTRING (@mS,@Posicion+4,len(@mS) - (@Posicion + 4))
												exec(@cadSqlM1)
												update ManV2.movimientos SET movEstatus='B' where movClave=@mClaA2
											end
											
										end--while notas
									 end--if notas
						
						delete from @tablaAgrCo where cACo= @cveAgruCo
					  end
				  --end
				  
				  
		delete from @tablaSer where c1= @cveSer	
	end
 end
 else--borrado
 begin
   insert into @tablaSer select atsClaveSerie from PubV2.AtrSerie with(nolock), PubV2.EnlSerInd with(nolock) where atsClaveSerie = esiClaveSerie and esiClaveInd = @CveIn 
	while exists(select * from @tablaSer )
	begin
				select top 1 @cveSer = c1  from @tablaSer  
				select @cveDes = atsClaveDescrip, @cveFre = atsClaveFre, @cveNota = atsClaveNota, @cveFue = atsClaveFuente, @cveUni = atsClaveUnidad, @cveGra = atsTipoGra, @cveAgru2 = atsClaveAgrupaCob, @cveAgru = atsClaveAgrupaClas   from PubV2.AtrSerie with(nolock) where atsClaveSerie = @cveSer
				
				set @cadCat = 'Descripcion,Frecuencia,Notas,Fuentes,Unidad,Grafica'
				WHILE patindex('%,%' , @cadCat) <> 0
				begin
					SELECT @Pos2 =  patindex('%,%' , @cadCat)
					--Buscamos la posicion de la primera ,
					SELECT @cadCD= left(@cadCat, @Pos2 - 1)--nombre de catalogo
					--Reemplazamos lo procesado con nada con la funcion stuff
					SELECT @cadCat = stuff(@cadCat, 1, @Pos2, '')
					if (@cadCD ='Descripcion')
					begin set @cveGral= @cveDes	end
					if (@cadCD ='Frecuencia')
					begin set @cveGral= @cveFre	end
					if (@cadCD ='Notas')
					begin set @cveGral= @cveNota end
					if (@cadCD ='Fuentes')
					begin set @cveGral= @cveFue 	end
					if (@cadCD ='Unidad')
					begin set @cveGral= @cveUni	end
					if (@cadCD ='Grafica')
					begin set @cveGral= @cveGra	end
					if @cveGral <> 0
					begin
						while exists(select movClave,movsql  from ManV2.movimientos with(nolock) where movCatalogo=@cadCD and movcomentario= @cveGral  and  movEstatus='P' )
						begin
						select top 1 @mClaA2=movClave, @mSA2=movsql  from ManV2.movimientos with(nolock) where movCatalogo=@cadCD  and movcomentario= @cveGral and  movEstatus='P' order by SUBSTRING(movFecha,7,4) asc, substring(movFecha,4,2) asc, SUBSTRING(movFecha,0,3) asc, substring(movhora,0,3) asc, substring(movhora,4,2) asc, substring(movhora,7,2) asc, movClave
							select @Opci =  left(@mSA2,1)	--obtener el primer caracter
							if @Opci='I' or  @Opci='i'
							begin
								exec pubv2.RevisaDuplicadosPub @mClaA2,@mSA2, @CveIn , @cadCD, @cveGral
							end
							else
							begin
								select @Pos3 =  patindex('%ManV2.%' , @mSA2)--Buscamos la posicion de la primera ,
								select @cadSqlM = left(@mSA2, @Pos3 - 1)-- esquema
								select @mSA2 =  stuff(@mSA2, 1, @Pos3+5, '')			--Y obtenemos los caracteres hasta esa posicion
								set @cadSqlM1=  @cadSqlM + ' PubV2.' + @mSA2   --SUBSTRING (@mS,@Posicion+4,len(@mS) - (@Posicion + 4))
								exec(@cadSqlM1)
								update ManV2.movimientos SET movEstatus='B' where movClave=@mClaA2
							end
						end
					end 
				end
				
				--revisar notas en datos
					--insert into @tablaNotasDatos select serNota from PubV2.Serie with(nolock) where serClave = @cveSer
					insert into @tablaNotasDatos select distinct serNota from PubV2.Serie with(nolock) where serClave = @cveSer and serNota <>'' and serNota <>0
					while exists(select * from @tablaNotasDatos )--revisar notas que tiene el indicador en los datos se la serie
					begin
						select top 1 @CveNotDato = CveNotDat  from @tablaNotasDatos --obtenemos la primer nota
						while exists(select movClave,movsql  from ManV2.movimientos with(nolock) where movCatalogo='Notas'  and movcomentario= @CveNotDato  and  movEstatus='P' )
						begin
							select top 1 @mClaA2=movClave, @mSA2=movsql  from ManV2.movimientos with(nolock) where movCatalogo='Notas'  and movcomentario= @CveNotDato and  movEstatus='P' order by SUBSTRING(movFecha,7,4) asc, substring(movFecha,4,2) asc, SUBSTRING(movFecha,0,3) asc, substring(movhora,0,3) asc, substring(movhora,4,2) asc, substring(movhora,7,2) asc, movClave
							select @Opci =  left(@mSA2,1)	--obtener el primer caracter
							if @Opci='I' or  @Opci='i'
							begin
							   -- print 'Grupo: ' + @CveGpo
								exec  pubv2.RevisaDuplicadosPub @mClaA2,@mSA2, @CveIn , 'Notas', @CveNotDato
							end
							else
							begin
							  select @Pos3 =  patindex('%ManV2.%' , @mSA2)--Buscamos la posicion de la primera ,
							  select @cadSqlM = left(@mSA2, @Pos3 - 1)-- esquema
							  select @mSA2 =  stuff(@mSA2, 1, @Pos3+5, '')			--Y obtenemos los caracteres hasta esa posicion
							  set @cadSqlM1=  @cadSqlM + ' PubV2.' + @mSA2   --SUBSTRING (@mS,@Posicion+4,len(@mS) - (@Posicion + 4))
							  exec(@cadSqlM1)
							  update ManV2.movimientos SET movEstatus='B' where movClave=@mClaA2
							end
						end
						delete from @tablaNotasDatos where CveNotDat = @CveNotDato
					end
					--revisar atributos de periodos 
					while exists(select movClave,movsql  from ManV2.movimientos with(nolock) where  movCatalogo ='AtrPeriodoPorInd'  and movComentario= Convert(nvarchar(255),@cveSer)  and  movEstatus='P' )
					begin
					  select top 1 @mClaA2=movClave, @mSA2=movsql from ManV2.movimientos with(nolock) where movCatalogo ='AtrPeriodoPorInd'  and movComentario = Convert(nvarchar(255),@cveSer)  and  movEstatus='P' order by SUBSTRING(movFecha,7,4) asc, substring(movFecha,4,2) asc, SUBSTRING(movFecha,0,3) asc, substring(movhora,0,3) asc, substring(movhora,4,2) asc, substring(movhora,7,2) asc, movClave
					  select @Opci =  left(@mSA2,1)	--obtener el primer caracter
					  print @Opci
					  if @Opci='I' or  @Opci='i'
					  begin
							print 'Entrando de revisa duplicados AtrPeriodoPorInd'
							print @mClaA2
							print @mSA2
							--exec  pru.RevisaDuplicados @mClaA2,@mSA2, @CveIn , 'AtrAgrupaClaPorInd', @cveAgruCl
							exec  pubv2.RevisaDuplicadosPub @mClaA2,@mSA2, @CveIn, 'AtrPeriodoPorInd', @cveSer
						end
						else
						begin
							select @Pos3 =  patindex('%ManV2.%' , @mSA2)--Buscamos la posicion de la primera ,
							select @cadSqlM = left(@mSA2, @Pos3 - 1)-- esquema
							select @mSA2 =  stuff(@mSA2, 1, @Pos3+5, '')			--Y obtenemos los caracteres hasta esa posicion
							set @cadSqlM1=  @cadSqlM + ' PubV2.' + @mSA2   --SUBSTRING (@mS,@Posicion+4,len(@mS) - (@Posicion + 4))
							exec(@cadSqlM1)
							update ManV2.movimientos SET movEstatus='B' where movClave=@mClaA2
						end
					 end--while de movimientos AtrPeriodoPorInd
					 
					 --revisar notas en periodos
					 insert into @tablaNotasPer select distinct apiCveNota   from PubV2.AtrPeriodoPorInd with(nolock)  where apiCveSer = @cveSer
					 while exists(select * from @tablaNotasPer)
					 begin
						 select top 1 @apiNota  = CveNotPer  from @tablaNotasPer  
							while exists(select movClave,movsql  from ManV2.movimientos with(nolock) where  movCatalogo ='Notas'  and movComentario= @apiNota and  movEstatus='P' )
							begin
							  select top 1 @mClaA2=movClave, @mSA2=movsql from ManV2.movimientos with(nolock) where movCatalogo ='Notas'  and movComentario= @apiNota and  movEstatus='P' order by SUBSTRING(movFecha,7,4) asc, substring(movFecha,4,2) asc, SUBSTRING(movFecha,0,3) asc, substring(movhora,0,3) asc, substring(movhora,4,2) asc, substring(movhora,7,2) asc, movClave
							  select @Opci =  left(@mSA2,1)	--obtener el primer caracter
							  print @Opci
							  if @Opci='I' or  @Opci='i'
							  begin
								print 'Entrando de revisa duplicados Notas en Periodo'
								print @mClaA2
								print @mSA2
								exec  pubv2.RevisaDuplicadosPub @mClaA2,@mSA2, @CveIn , 'Notas', @apiNota
							  end
							  else
							  begin
									select @Pos3 =  patindex('%ManV2.%' , @mSA2)--Buscamos la posicion de la primera ,
									select @cadSqlM = left(@mSA2, @Pos3 - 1)-- esquema
									select @mSA2 =  stuff(@mSA2, 1, @Pos3+5, '')			--Y obtenemos los caracteres hasta esa posicion
									set @cadSqlM1=  @cadSqlM + ' PubV2.' + @mSA2   --SUBSTRING (@mS,@Posicion+4,len(@mS) - (@Posicion + 4))
									exec(@cadSqlM1)
									update ManV2.movimientos SET movEstatus='B' where movClave=@mClaA2
							  end
							end--while notas
						 delete from @tablaNotasPer  where CveNotPer = @apiNota	
					end--while de @tablaNotasPer
				
				
				-- tipo de cuadro para revisar el grupo y clasificaciones
				
				--if  @cveAgru IS NULL or @cveAgru <> '0'
				print @cveAgru
				if  @cveAgru IS not NULL or @cveAgru <> '0'
				begin
					--insert into @tablaCveAgr select atrClaveAgrupaClas  from Man.AtrIndicador where atrClaveInd = @CveIn--obtener clave de agrupamiento de clasificaciones
					
					  insert into @tablaGp select distinct acCveGpo   from PubV2.AgrupaClas with(nolock)  where acClave like @cveAgru + '%'  and LEN(acClave)>3
					  while exists(select * from @TablaGp )--revisar Grupos que tiene el indicador
					  begin
					 
						--insert into @tablaClas select gpoClave, claClave,claClaveDescrip from man.Grupo, man.Clasificacion, man.EnlIndCla where claClave = eiclClaveClas and claGrupo = gpoClave and eiclClaveInd = @CveIn 
						  select top 1 @CveGpo = cG  from @TablaGp --obtenemos el primer grupo 
						 -- print @CveGpo
						  insert into @tablaDesClas  select  claClave, claClaveDescrip  from PubV2.Clasificacion with(nolock) where claGrupo = @CveGpo--obtener las descripciones de las clasificaciones
						  --select top 1 @CveGpo= Clagrupo from man.Clasificacion, man.EnlIndCla where claClave = eiclClaveClas  and eiclClaveInd = @CveIn 
						  while exists(select movClave,movsql  from ManV2.movimientos with(nolock) where movCatalogo='Grupo'  and movcomentario= @CveGpo  and  movEstatus='P' )
							  begin
								  --select top 1 @mClaA2=movClave, @mSA2=movsql  from man.movimientos where (movCatalogo='Grupo' or movCatalogo ='Clasificacion' or movCatalogo ='AgrupaClas')  and movcomentario= @CveGpo and  movEstatus='M' order by SUBSTRING(movFecha,7,4) asc, substring(movFecha,4,2) asc, SUBSTRING(movFecha,0,3) asc, substring(movhora,0,3) asc, substring(movhora,4,2) asc, substring(movhora,7,2) asc, movClave
								  select top 1 @mClaA2=movClave, @mSA2=movsql  from ManV2.movimientos with(nolock) where movCatalogo='Grupo'  and movcomentario= @CveGpo and  movEstatus='P' order by SUBSTRING(movFecha,7,4) asc, substring(movFecha,4,2) asc, SUBSTRING(movFecha,0,3) asc, substring(movhora,0,3) asc, substring(movhora,4,2) asc, substring(movhora,7,2) asc, movClave
								  select @Opci =  left(@mSA2,1)	--obtener el primer caracter

								  if @Opci='I' or  @Opci='i'
									begin
									   -- print 'Grupo: ' + @CveGpo
										exec  pubv2.RevisaDuplicadosPub @mClaA2,@mSA2, @CveIn , 'Grupo', @CveGpo
									end
									else
									begin
									  select @Pos3 =  patindex('%ManV2.%' , @mSA2)--Buscamos la posicion de la primera ,
									  select @cadSqlM = left(@mSA2, @Pos3 - 1)-- esquema
									  select @mSA2 =  stuff(@mSA2, 1, @Pos3+5, '')			--Y obtenemos los caracteres hasta esa posicion
									  set @cadSqlM1=  @cadSqlM + ' PubV2.' + @mSA2   --SUBSTRING (@mS,@Posicion+4,len(@mS) - (@Posicion + 4))
									  exec(@cadSqlM1)
									  update ManV2.movimientos SET movEstatus='B' where movClave=@mClaA2
								  end
							  end
							   --Descripciones de clasificaciones
						   while exists(select * from @tablaDesClas )
						   begin
							  select top 1 @cveDesCl  = cveDs  from @TablaDesClas --obtenemos la primer clasificacion
							  while exists(select movClave,movsql  from ManV2.movimientos with(nolock) where movCatalogo='Descripcion' and movcomentario= @cveDesCl  and  movEstatus='P' )
								  begin
									  select top 1 @mClaA2=movClave, @mSA2=movsql  from ManV2.movimientos with(nolock) where movCatalogo='Descripcion' and movcomentario= @cveDesCl and  movEstatus='P' order by SUBSTRING(movFecha,7,4) asc, substring(movFecha,4,2) asc, SUBSTRING(movFecha,0,3) asc, substring(movhora,0,3) asc, substring(movhora,4,2) asc, substring(movhora,7,2) asc, movClave
									  select @Opci =  left(@mSA2,1)	--obtener el primer caracter
									  if @Opci='I' or  @Opci='i'
										begin
											exec  pubv2.RevisaDuplicadosPub @mClaA2,@mSA2, @CveIn , 'Descripcion', @cveDesCl
										end
										else
										begin
											select @Pos3 =  patindex('%ManV2.%' , @mSA2)--Buscamos la posicion de la primera ,
											select @cadSqlM = left(@mSA2, @Pos3 - 1)-- esquema
											select @mSA2 =  stuff(@mSA2, 1, @Pos3+5, '')			--Y obtenemos los caracteres hasta esa posicion
											set @cadSqlM1=  @cadSqlM + ' PubV2.' + @mSA2   --SUBSTRING (@mS,@Posicion+4,len(@mS) - (@Posicion + 4))
											exec(@cadSqlM1)
											update ManV2.movimientos SET movEstatus='B' where movClave=@mClaA2
										end
									  
								  end
							  ---Claves de clasificaciones
							  
							  while exists(select movClave,movsql  from ManV2.movimientos with(nolock) where movCatalogo='Clasificacion' and movcomentario= @CveGpo  and  movEstatus='P' )
								  begin
									  select top 1 @mClaA2=movClave, @mSA2=movsql  from ManV2.movimientos with(nolock) where movCatalogo='Clasificacion' and movcomentario= @CveGpo  and  movEstatus='P' order by SUBSTRING(movFecha,7,4) asc, substring(movFecha,4,2) asc, SUBSTRING(movFecha,0,3) asc, substring(movhora,0,3) asc, substring(movhora,4,2) asc, substring(movhora,7,2) asc, movClave
									  select @Opci =  left(@mSA2,1)	--obtener el primer caracter
									  
									  if @Opci='I' or  @Opci='i'
										begin
											--print 'Clasificacion:' + @CveGpo
											exec  pubv2.RevisaDuplicadosPub @mClaA2,@mSA2, @CveIn , 'Clasificacion', @CveGpo
										end
										else
										begin
											select @Pos3 =  patindex('%ManV2.%' , @mSA2)--Buscamos la posicion de la primera ,
											select @cadSqlM = left(@mSA2, @Pos3 - 1)-- esquema
											select @mSA2 =  stuff(@mSA2, 1, @Pos3+5, '')			--Y obtenemos los caracteres hasta esa posicion
											set @cadSqlM1=  @cadSqlM + ' PubV2.' + @mSA2   --SUBSTRING (@mS,@Posicion+4,len(@mS) - (@Posicion + 4))
											exec(@cadSqlM1)
											update ManV2.movimientos SET movEstatus='B' where movClave=@mClaA2
										end
									  
								  end
								delete from @TablaDesClas where cveDs = @cveDesCl	
							  end
							   --revisa el caso especial de agrupaClas con clave de grupo en el movcomentario
							  set @CveGpoClas = 'U' + Convert(nvarchar(255),@CveGpo) 
							  while exists(select movClave,movsql  from ManV2.movimientos with(nolock) where  movCatalogo ='AgrupaClas' and movcomentario=  @CveGpoClas  and  movEstatus='P' )
							  begin
								  
								  select top 1 @mClaA2=movClave, @mSA2=movsql  from ManV2.movimientos with(nolock) where movCatalogo ='AgrupaClas'  and movcomentario= @CveGpoClas and  movEstatus='P' order by SUBSTRING(movFecha,7,4) asc, substring(movFecha,4,2) asc, SUBSTRING(movFecha,0,3) asc, substring(movhora,0,3) asc, substring(movhora,4,2) asc, substring(movhora,7,2) asc, movClave
								  select @Pos3 =  patindex('%ManV2.%' , @mSA2)--Buscamos la posicion de la primera ,
								  select @cadSqlM = left(@mSA2, @Pos3 - 1)-- esquema
								  select @mSA2 =  stuff(@mSA2, 1, @Pos3+5, '')			--Y obtenemos los caracteres hasta esa posicion
								  set @cadSqlM1=  @cadSqlM + ' PubV2.' + @mSA2   --SUBSTRING (@mS,@Posicion+4,len(@mS) - (@Posicion + 4))
								  exec(@cadSqlM1)
								  update ManV2.movimientos SET movEstatus='B' where movClave=@mClaA2
							  end
							 delete from @TablaGp where cG= @CveGpo
					end--fin del clave de grupo
					
					  --revisa Agrupamiento por clave '010', '010010'...
					  --select distinct acClave from pru.AgrupaClas, pru.EnlIndCla2  where acClave= eiclClaveAgrupa and eiclClaveInd  = 54 or acClave like '020%'
					 -- select top 1 @cveAgru  = cCA  from @tablaCveAgr 
					 
					  insert into @tablaAgr select distinct acClave from PubV2.AgrupaClas with(nolock) where acClave like @cveAgru + '%' --'%'+ @titulo +'%'
					  while exists(select * from @tablaAgr )--revisar Agrupamiento del indicador
					  begin
						--insert into @tablaClas select gpoClave, claClave,claClaveDescrip from man.Grupo, man.Clasificacion, man.EnlIndCla where claClave = eiclClaveClas and claGrupo = gpoClave and eiclClaveInd = @CveIn 
						  select top 1 @cveAgruCl  = cA  from @tablaAgr --obtenemos la primer clave del agrupamiento 
						  --select top 1 @CveGpo= Clagrupo from man.Clasificacion, man.EnlIndCla where claClave = eiclClaveClas  and eiclClaveInd = @CveIn 
						  while exists(select movClave,movsql  from ManV2.movimientos with(nolock) where  movCatalogo ='AgrupaClas' and movcomentario= @cveAgruCl  and  movEstatus='P' )
							  begin
								  
								  select top 1 @mClaA2=movClave, @mSA2=movsql  from ManV2.movimientos with(nolock) where movCatalogo ='AgrupaClas'  and movcomentario= @cveAgruCl and  movEstatus='P' order by SUBSTRING(movFecha,7,4) asc, substring(movFecha,4,2) asc, SUBSTRING(movFecha,0,3) asc, substring(movhora,0,3) asc, substring(movhora,4,2) asc, substring(movhora,7,2) asc, movClave
								  select @Opci =  left(@mSA2,1)	--obtener el primer caracter
								  print @Opci
								  if @Opci='I' or  @Opci='i'
									begin
										print 'Entrando de revisa duplicados agrupaclas'
										print @mClaA2
										print @mSA2
										print @cveAgruCl
										exec  pubv2.RevisaDuplicadosPub @mClaA2,@mSA2, @CveIn , 'AgrupaClas', @cveAgruCl
									end
									else
									begin
										select @Pos3 =  patindex('%ManV2.%' , @mSA2)--Buscamos la posicion de la primera ,
										select @cadSqlM = left(@mSA2, @Pos3 - 1)-- esquema
										select @mSA2 =  stuff(@mSA2, 1, @Pos3+5, '')			--Y obtenemos los caracteres hasta esa posicion
										set @cadSqlM1=  @cadSqlM + ' PubV2.' + @mSA2   --SUBSTRING (@mS,@Posicion+4,len(@mS) - (@Posicion + 4))
										exec(@cadSqlM1)
										update ManV2.movimientos SET movEstatus='B' where movClave=@mClaA2
									end
								  
							  end
							  print 'Agrupaclas'
								  print @cveAgruCl
								  set @cadOrdClaC= Convert(nvarchar(max),@cveSer) + '-' + @cveAgruCl + 'C'
								  set @cadOrdClaG= Convert(nvarchar(max),@cveSer) + '-' + @cveAgruCl + 'G'
								-- Buscar movimientos en AtrAgrupaClaPorInd   -- ordenamiento de clasifciaciones
								while exists(select movClave,movsql  from ManV2.movimientos with(nolock) where  movCatalogo ='AtrAgrupaClaPorInd'  and (movComentario= @cadOrdClaC or movComentario= @cadOrdClaG or movComentario= Convert(nvarchar(max),@cveSer))  and  movEstatus='P' )
								  begin
									  
									  select top 1 @mClaA2=movClave, @mSA2=movsql, @mComAgrCl= movComentario  from ManV2.movimientos with(nolock) where movCatalogo ='AtrAgrupaClaPorInd'  and (movComentario= @cadOrdClaC or movComentario= @cadOrdClaG or movComentario= Convert(nvarchar(max),@cveSer)) and  movEstatus='P' order by SUBSTRING(movFecha,7,4) asc, substring(movFecha,4,2) asc, SUBSTRING(movFecha,0,3) asc, substring(movhora,0,3) asc, substring(movhora,4,2) asc, substring(movhora,7,2) asc, movClave
									  select @Opci =  left(@mSA2,1)	--obtener el primer caracter
									  print @Opci
									  if @Opci='I' or  @Opci='i'
										begin
											print 'Entrando de revisa duplicados AtrAgrupaClaPorInd'
											print @mClaA2
											print @mSA2
											print @cveAgruCl
											--exec  pru.RevisaDuplicados @mClaA2,@mSA2, @CveIn , 'AtrAgrupaClaPorInd', @cveAgruCl
											exec  pubv2.RevisaDuplicadosPub @mClaA2,@mSA2, @CveIn  , 'AtrAgrupaClaPorInd', @mComAgrCl
										end
										else
										begin
											select @Pos3 =  patindex('%ManV2.%' , @mSA2)--Buscamos la posicion de la primera ,
											select @cadSqlM = left(@mSA2, @Pos3 - 1)-- esquema
											select @mSA2 =  stuff(@mSA2, 1, @Pos3+5, '')			--Y obtenemos los caracteres hasta esa posicion
											set @cadSqlM1=  @cadSqlM + ' PubV2.' + @mSA2   --SUBSTRING (@mS,@Posicion+4,len(@mS) - (@Posicion + 4))
											exec(@cadSqlM1)
											update ManV2.movimientos SET movEstatus='B' where movClave=@mClaA2
										end
									  
								  end 
								   --revisar nota del atributo de agrupamiento clasificacion
								
									 select top 1 @aaclNota  = aaclCveNota  from pubv2.AtrAgrupaClaPorInd where aaclCveSer=@cveSer and aaclAgrCla= @cveAgruCl --obtenemos la clave de nota del atributo de clasificacion 
									 if @aaclNota IS not NULL and @aaclNota <> 0
									 begin
										while exists(select movClave,movsql  from ManV2.movimientos with(nolock) where  movCatalogo ='Notas'  and movComentario= @aaclNota and  movEstatus='P' )
										begin
										  select top 1 @mClaA2=movClave, @mSA2=movsql from ManV2.movimientos with(nolock) where movCatalogo ='Notas'  and movComentario= @aaclNota and  movEstatus='P' order by SUBSTRING(movFecha,7,4) asc, substring(movFecha,4,2) asc, SUBSTRING(movFecha,0,3) asc, substring(movhora,0,3) asc, substring(movhora,4,2) asc, substring(movhora,7,2) asc, movClave
										  select @Opci =  left(@mSA2,1)	--obtener el primer caracter
										  print @Opci
										  if @Opci='I' or  @Opci='i'
											begin
												print 'Entrando de revisa duplicados Notas'
												print @mClaA2
												print @mSA2
												print @cveAgruCl
												--exec  pru.RevisaDuplicados @mClaA2,@mSA2, @CveIn , 'AtrAgrupaClaPorInd', @cveAgruCl
												exec  pubv2.RevisaDuplicadosPub @mClaA2,@mSA2, @CveIn , 'Notas', @aaclNota
											end
											else
											begin
												select @Pos3 =  patindex('%ManV2.%' , @mSA2)--Buscamos la posicion de la primera ,
												select @cadSqlM = left(@mSA2, @Pos3 - 1)-- esquema
												select @mSA2 =  stuff(@mSA2, 1, @Pos3+5, '')			--Y obtenemos los caracteres hasta esa posicion
												set @cadSqlM1=  @cadSqlM + ' PubV2.' + @mSA2   --SUBSTRING (@mS,@Posicion+4,len(@mS) - (@Posicion + 4))
												exec(@cadSqlM1)
												update ManV2.movimientos SET movEstatus='B' where movClave=@mClaA2
											end
											
										end--while notas
									 end--if notas
							  
							delete from @TablaAgr where cA= @cveAgruCl
					  end
					 
				  end--end del if (@Tipocua = 'CoCl' or @Tipocua = 'ACl' or @Tipocua = 'ClS' or @Tipocua = 'ClA')
				  --Agrupamiento de coberturas
				  --if (@Tipocua = 'CoCl' or @Tipocua = 'CoS')
				 -- begin
					--  insert into @tablaCveAgrCo select atrClaveAgrupaCob  from Man.AtrIndicador where atrClaveInd = @CveIn--obtener clave de agrupamiento de cobertura
					--revisa Agrupamiento cobertura por clave '010', '010010'...
					  --select distinct acClave from pru.AgrupaClas, pru.EnlIndCla2  where acClave= eiclClaveAgrupa and eiclClaveInd  = 54 or acClave like '020%'
					 -- select top 1 @cveAgru2  = cCACo  from @tablaCveAgrCo--clave general del agrupamiento 010,020, etc
					  insert into @tablaAgrCo select distinct acoClave,acoCveGeo, acoCveDesGeo from PubV2.AgrupaCob with(nolock) where  acoClave like @cveAgru2 + '___%' --'%'+ @titulo +'%'
					  while exists(select * from @tablaAgrCo )--revisar Agrupamiento de coberturas del indicador
					  begin
						 
						  
						--insert into @tablaClas select gpoClave, claClave,claClaveDescrip from man.Grupo, man.Clasificacion, man.EnlIndCla where claClave = eiclClaveClas and claGrupo = gpoClave and eiclClaveInd = @CveIn 
						  select top 1 @cveAgruCo  = cACo, @cveAgruCoGeo = cACoGeo, @cveAgruCoDesGeo = cACoDes from @tablaAgrCo  --obtenemos la primer clave del agrupamiento de coberturas
						   --revisar coberturas
						  while exists(select movClave,movsql  from ManV2.movimientos with(nolock) where  movCatalogo ='CobGeo' and movcomentario= Convert(nvarchar(max),@cveAgruCoGeo)  and  movEstatus='P' )
							  begin
								  select top 1 @mClaA2=movClave, @mSA2=movsql  from ManV2.movimientos with(nolock) where movCatalogo ='CobGeo'  and movcomentario= Convert(nvarchar(max),@cveAgruCoGeo) and  movEstatus='P' order by SUBSTRING(movFecha,7,4) asc, substring(movFecha,4,2) asc, SUBSTRING(movFecha,0,3) asc, substring(movhora,0,3) asc, substring(movhora,4,2) asc, substring(movhora,7,2) asc, movClave
								  select @Opci =  left(@mSA2,1)	--obtener el primer caracter
								  if @Opci='I' or  @Opci='i'
									begin
										exec  pubv2.RevisaDuplicadosPub @mClaA2,@mSA2, @CveIn , 'CobGeo', @cveAgruCoGeo
									end
									else
									begin
										  select @Pos3 =  patindex('%ManV2.%' , @mSA2)--Buscamos la posicion de la primera ,
										  select @cadSqlM = left(@mSA2, @Pos3 - 1)-- esquema
										  select @mSA2 =  stuff(@mSA2, 1, @Pos3+5, '')			--Y obtenemos los caracteres hasta esa posicion
										  set @cadSqlM1=  @cadSqlM + ' PubV2.' + @mSA2   --SUBSTRING (@mS,@Posicion+4,len(@mS) - (@Posicion + 4))
										  exec(@cadSqlM1)
										  update ManV2.movimientos SET movEstatus='B' where movClave=@mClaA2
									end
							  end
						  --revisa desgloseGEo
						  while exists(select movClave,movsql  from ManV2.movimientos with(nolock) where  movCatalogo ='DesgloseGeo' and movcomentario= Convert(nvarchar(max),@cveAgruCoDesGeo)  and  movEstatus='P' )
							  begin
								  select top 1 @mClaA2=movClave, @mSA2=movsql  from ManV2.movimientos with(nolock) where movCatalogo ='DesgloseGeo'  and movcomentario= Convert(nvarchar(max),@cveAgruCoDesGeo) and  movEstatus='P' order by SUBSTRING(movFecha,7,4) asc, substring(movFecha,4,2) asc, SUBSTRING(movFecha,0,3) asc, substring(movhora,0,3) asc, substring(movhora,4,2) asc, substring(movhora,7,2) asc, movClave
								  select @Opci =  left(@mSA2,1)	--obtener el primer caracter
								  if @Opci='I' or  @Opci='i'
									begin
										exec  pubv2.RevisaDuplicadosPub @mClaA2,@mSA2, @CveIn , 'DesgloseGeo', @cveAgruCoDesGeo
									end
								  else
								  begin
										  select @Pos3 =  patindex('%ManV2.%' , @mSA2)--Buscamos la posicion de la primera ,
										  select @cadSqlM = left(@mSA2, @Pos3 - 1)-- esquema
										  select @mSA2 =  stuff(@mSA2, 1, @Pos3+5, '')			--Y obtenemos los caracteres hasta esa posicion
										  set @cadSqlM1=  @cadSqlM + ' PubV2.' + @mSA2   --SUBSTRING (@mS,@Posicion+4,len(@mS) - (@Posicion + 4))
										  exec(@cadSqlM1)
										  update ManV2.movimientos SET movEstatus='B' where movClave=@mClaA2
								  end
							  end
						  --revisar agrupamiento
						  --select top 1 @CveGpo= Clagrupo from man.Clasificacion, man.EnlIndCla where claClave = eiclClaveClas  and eiclClaveInd = @CveIn 
						  while exists(select movClave,movsql  from ManV2.movimientos with(nolock) where  movCatalogo ='AgrupaCob' and movcomentario= Convert(nvarchar(max),@cveAgruCo)  and  movEstatus='P' )
							  begin
								  select top 1 @mClaA2=movClave, @mSA2=movsql  from ManV2.movimientos with(nolock) where movCatalogo ='AgrupaCob'  and movcomentario= Convert(nvarchar(max),@cveAgruCo) and  movEstatus='P' order by SUBSTRING(movFecha,7,4) asc, substring(movFecha,4,2) asc, SUBSTRING(movFecha,0,3) asc, substring(movhora,0,3) asc, substring(movhora,4,2) asc, substring(movhora,7,2) asc, movClave
								  select @Opci =  left(@mSA2,1)	--obtener el primer caracter
								  if @Opci='I' or  @Opci='i'
									begin
									print @cveAgruCo
										exec  pubv2.RevisaDuplicadosPub @mClaA2,@mSA2, @CveIn , 'AgrupaCob', @cveAgruCo
									end
								  else
								  begin
									  select @Pos3 =  patindex('%ManV2.%' , @mSA2)--Buscamos la posicion de la primera ,
									  select @cadSqlM = left(@mSA2, @Pos3 - 1)-- esquema
									  select @mSA2 =  stuff(@mSA2, 1, @Pos3+5, '')			--Y obtenemos los caracteres hasta esa posicion
									  set @cadSqlM1=  @cadSqlM + ' PubV2.' + @mSA2   --SUBSTRING (@mS,@Posicion+4,len(@mS) - (@Posicion + 4))
									  exec(@cadSqlM1)
									  update ManV2.movimientos SET movEstatus='B' where movClave=@mClaA2
								  end
							  end
						 --revisar cambios en tipo de cobertura geográfica
						  Select top 1 @cobCveTipoCobGeo=cgCveTipoCobGeo from PubV2.CobGeo where cgClave= @cveAgruCoGeo
						   while exists(select movClave,movsql  from ManV2.movimientos with(nolock) where  movCatalogo ='TipoCobGeo' and movcomentario= Convert(nvarchar(max),@cobCveTipoCobGeo)  and  movEstatus='P' )
							  begin
								  select top 1 @mClaA2=movClave, @mSA2=movsql  from ManV2.movimientos with(nolock) where movCatalogo ='TipoCobGeo'  and movcomentario= Convert(nvarchar(max),@cobCveTipoCobGeo) and  movEstatus='P' order by SUBSTRING(movFecha,7,4) asc, substring(movFecha,4,2) asc, SUBSTRING(movFecha,0,3) asc, substring(movhora,0,3) asc, substring(movhora,4,2) asc, substring(movhora,7,2) asc, movClave
								  select @Opci =  left(@mSA2,1)	--obtener el primer caracter
								  if @Opci='I' or  @Opci='i'
									begin
										exec  pubv2.RevisaDuplicadosPub @mClaA2,@mSA2, @CveIn , 'TipoCobGeo', @cobCveTipoCobGeo
									end
								  else
								  begin
										  select @Pos3 =  patindex('%ManV2.%' , @mSA2)--Buscamos la posicion de la primera ,
										  select @cadSqlM = left(@mSA2, @Pos3 - 1)-- esquema
										  select @mSA2 =  stuff(@mSA2, 1, @Pos3+5, '')			--Y obtenemos los caracteres hasta esa posicion
										  set @cadSqlM1=  @cadSqlM + ' PubV2.' + @mSA2   --SUBSTRING (@mS,@Posicion+4,len(@mS) - (@Posicion + 4))
										  exec(@cadSqlM1)
										  update ManV2.movimientos SET movEstatus='B' where movClave=@mClaA2
								  end
							  end
						   ----------------------------------------------------
							  --revisar atributos de la cobertura
							  set @cadOrdCob= Convert(nvarchar(max),@cveSer) + '-' +  @cveAgruCo 
							  
							  while exists(select movClave,movsql  from ManV2.movimientos with(nolock) where  movCatalogo ='AtrAgrupaCobPorInd'  and (movComentario= @cadOrdCob or movComentario = Convert(nvarchar(max),@cveSer))  and  movEstatus='P' )
								  begin
									  
									  select top 1 @mClaA2=movClave, @mSA2=movsql, @mComAgrCo= movComentario from ManV2.movimientos with(nolock) where movCatalogo ='AtrAgrupaCobPorInd'  and (movComentario= @cadOrdCob or movComentario = Convert(nvarchar(max),@cveSer) ) and  movEstatus='P' order by SUBSTRING(movFecha,7,4) asc, substring(movFecha,4,2) asc, SUBSTRING(movFecha,0,3) asc, substring(movhora,0,3) asc, substring(movhora,4,2) asc, substring(movhora,7,2) asc, movClave
									  select @Opci =  left(@mSA2,1)	--obtener el primer caracter
									  print @Opci
									  if @Opci='I' or  @Opci='i'
										begin
											print 'Entrando de revisa duplicados AtrAgrupaCobPorInd'
											print @mClaA2
											print @mSA2
											print @cveAgruCo
											--exec  pru.RevisaDuplicados @mClaA2,@mSA2, @CveIn , 'AtrAgrupaClaPorInd', @cveAgruCl
											exec  pubv2.RevisaDuplicadosPub @mClaA2,@mSA2, @CveIn  , 'AtrAgrupaCobPorInd', @mComAgrCo
										end
										else
										begin
											select @Pos3 =  patindex('%ManV2.%' , @mSA2)--Buscamos la posicion de la primera ,
											select @cadSqlM = left(@mSA2, @Pos3 - 1)-- esquema
											select @mSA2 =  stuff(@mSA2, 1, @Pos3+5, '')			--Y obtenemos los caracteres hasta esa posicion
											set @cadSqlM1=  @cadSqlM + ' PubV2.' + @mSA2   --SUBSTRING (@mS,@Posicion+4,len(@mS) - (@Posicion + 4))
											exec(@cadSqlM1)
											update ManV2.movimientos SET movEstatus='B' where movClave=@mClaA2
										end
								  end--while de movimientos atrAtribAgrupaCoInd
								--revisar nota del atributo de agrupamiento clasificacion
									 select top 1 @aacoNota  = aacoCveNota  from pubv2.AtrAgrupaCobPorInd where aacoCveSer=@cveSer and aacoAgrCob= @cveAgruCl --obtenemos la clave de nota del atributo de cobertura 
									 if @aaclNota IS not NULL and @aaclNota <> 0
									 begin
										while exists(select movClave,movsql  from ManV2.movimientos with(nolock) where  movCatalogo ='Notas'  and movComentario= Convert(nvarchar(max),@aacoNota) and  movEstatus='P' )
										begin
										  select top 1 @mClaA2=movClave, @mSA2=movsql from ManV2.movimientos with(nolock) where movCatalogo ='Notas'  and movComentario= Convert(nvarchar(max),@aacoNota) and  movEstatus='P' order by SUBSTRING(movFecha,7,4) asc, substring(movFecha,4,2) asc, SUBSTRING(movFecha,0,3) asc, substring(movhora,0,3) asc, substring(movhora,4,2) asc, substring(movhora,7,2) asc, movClave
										  select @Opci =  left(@mSA2,1)	--obtener el primer caracter
										  print @Opci
										  if @Opci='I' or  @Opci='i'
											begin
												print 'Entrando de revisa duplicados Notas en atributos de cobertura'
												print @mClaA2
												print @mSA2
												print @cveAgruCl
												--exec  pru.RevisaDuplicados @mClaA2,@mSA2, @CveIn , 'AtrAgrupaClaPorInd', @cveAgruCl
												exec  pubv2.RevisaDuplicadosPub @mClaA2,@mSA2, @CveIn , 'Notas', @aacoNota
											end
											else
											begin
												select @Pos3 =  patindex('%ManV2.%' , @mSA2)--Buscamos la posicion de la primera ,
												select @cadSqlM = left(@mSA2, @Pos3 - 1)-- esquema
												select @mSA2 =  stuff(@mSA2, 1, @Pos3+5, '')			--Y obtenemos los caracteres hasta esa posicion
												set @cadSqlM1=  @cadSqlM + ' PubV2.' + @mSA2   --SUBSTRING (@mS,@Posicion+4,len(@mS) - (@Posicion + 4))
												exec(@cadSqlM1)
												update ManV2.movimientos SET movEstatus='B' where movClave=@mClaA2
											end
											
										end--while notas
									 end--if notas
			  
							print 'Agrupa Cob'
							print @cveAgruCo
						
						delete from @tablaAgrCo where cACo= @cveAgruCo
					  end
				  --end
	  delete from @tablaSer where c1= @cveSer	
	end
 end
 
END


GO
/****** Object:  StoredProcedure [PubV2].[RevisaCamArbPub]    Script Date: 10/09/2020 01:24:07 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [PubV2].[RevisaCamArbPub] 
	-- Add the parameters for the stored procedure here
	@CveIn int,
	@CveAr nvarchar(MAX),
	@TPro varchar(2)
AS
BEGIN
SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED
declare @mClaA int,@mClaA2 int, @mIA int 
declare @mSA nvarchar(MAX),@mSA2 nvarchar(MAX),@Opci nvarchar(1),@returnErrorA varchar(Max),@msgA nvarchar(Max) --@CveAr varchar(50),
declare @cadSqlM nvarchar(Max)
declare @cadSqlM1 nvarchar(Max),@cveDA varchar(20),@CveMd nvarchar(max)
declare @cadSqlM2 nvarchar(Max), @cadCat nvarChar(Max),@cadCD varchar(30)
declare @Pos int,@Pos3 int,
@Pos2 int

set @mIA= @CveIn 
set @msgA=''
	--Select @CveAr=arbclave from man.arbol where arbClaveInd = @CveIn
	while len(@CveAr)>=7
	begin
		print @TPro
			if @TPro='C'--proceso cambio
			begin
				select @cveDA=arbClaveDescrip from PreV2.Arbol with(nolock) where arbClave = @CveAr --Revisa catalogo de descripciones
			end
			else--proceso borrar
			begin
				select @cveDA=arbClaveDescrip from PubV2.Arbol with(nolock) where arbClave = @CveAr --Revisa catalogo de descripciones
			end
				set @cadCat = 'Descripcion,'
				WHILE patindex('%,%' , @cadCat) <> 0
				begin
					SELECT @Pos2 =  patindex('%,%' , @cadCat)
					--Buscamos la posicion de la primera ,
					SELECT @cadCD= left(@cadCat, @Pos2 - 1)--nombre de catalogo
					--Reemplazamos lo procesado con nada con la funcion stuff
					SELECT @cadCat = stuff(@cadCat, 1, @Pos2, '')
					while exists(select movClave,movsql  from ManV2.movimientos with(nolock) where movCatalogo=@cadCD and movcomentario= @cveDA  and  movEstatus='P' )
					begin
						select top 1 @mClaA2=movClave, @mSA2=movsql  from ManV2.movimientos with(nolock) where movCatalogo=@cadCD  and movcomentario= @cveDA and  movEstatus='P' order by SUBSTRING(movFecha,7,4) asc, substring(movFecha,4,2) asc, SUBSTRING(movFecha,0,3) asc, substring(movhora,0,3) asc, substring(movhora,4,2) asc, substring(movhora,7,2) asc, movClave
						select @Opci =  left(@mSA2,1)	--obtener el primer caracter
						if @Opci='I' or @Opci ='i'
						begin
							exec  pubv2.RevisaDuplicadosPub @mClaA2,@mSA2, @mIA, @cadCD, @cveDA
						end
						 else
						 begin
							select @Pos3 =  patindex('%ManV2.%' , @mSA2)--Buscamos la posicion de la primera ,
							select @cadSqlM = left(@mSA2, @Pos3 - 1)-- esquema
							select @mSA2 =  stuff(@mSA2, 1, @Pos3+5, '')			--Y obtenemos los caracteres hasta esa posicion
							set @cadSqlM1=  @cadSqlM + ' PubV2.' + @mSA2   --SUBSTRING (@mS,@Posicion+4,len(@mS) - (@Posicion + 4))
							print @cadSqlM1
							exec(@cadSqlM1)
							update ManV2.movimientos SET movEstatus='B' where movClave=@mClaA2
						end
					end
				end
				----
				if @TPro='C'
				begin
					select @CveMd =arbClaveMetadato from PreV2.Arbol with(nolock) where arbClave = @CveAr --Revisa catalogo de metadatos
				end
				else
				begin
					select @CveMd =arbClaveMetadato from PubV2.Arbol with(nolock) where arbClave = @CveAr --Revisa catalogo de metadatos
				end
					while exists(select movClave,movsql  from ManV2.movimientos with(nolock) where movCatalogo='Metadato' and movcomentario= @CveMd  and  movEstatus='P' )
					begin
					print 'entre while'
						select top 1 @mClaA2=movClave, @mSA2=movsql  from ManV2.movimientos with(nolock) where movCatalogo='Metadato' and movcomentario= @CveMd and  movEstatus='P' order by SUBSTRING(movFecha,7,4) asc, substring(movFecha,4,2) asc, SUBSTRING(movFecha,0,3) asc, substring(movhora,0,3) asc, substring(movhora,4,2) asc, substring(movhora,7,2) asc, movClave
						select @Opci =  left(@mSA2,1)	--obtener el primer caracter
						if @Opci='I' or @Opci ='i'
						begin
							exec pubv2.RevisaDuplicadosPub @mClaA2,@mSA2, @mIA, 'Metadato', @CveMd
						 end
						 else
						 begin
								select @Pos3 =  patindex('%ManV2.%' , @mSA2)--Buscamos la posicion de la primera ,
								select @cadSqlM = left(@mSA2, @Pos3 - 1)-- esquema
								select @mSA2 =  stuff(@mSA2, 1, @Pos3+5, '')			--Y obtenemos los caracteres hasta esa posicion
								set @cadSqlM1=  @cadSqlM + ' PubV2.' + @mSA2   --SUBSTRING (@mS,@Posicion+4,len(@mS) - (@Posicion + 4))
								exec(@cadSqlM1)
								update ManV2.movimientos SET movEstatus='B' where movClave=@mClaA2
						end
					end
				while exists(select movClave,movsql  from ManV2.movimientos with(nolock) where movCatalogo='Arbol' and movcomentario= @CveAr and  movEstatus='P' )
				begin
					select top 1 @mClaA=movClave, @mSA=movsql from ManV2.movimientos with(nolock) where movCatalogo='Arbol' and movcomentario= @CveAr and  movEstatus='P' order by SUBSTRING(movFecha,7,4) asc, substring(movFecha,4,2) asc, SUBSTRING(movFecha,0,3) asc, substring(movhora,0,3) asc, substring(movhora,4,2) asc, substring(movhora,7,2) asc, movClave 
					
					 select @Opci =  left(@mSA,1)	--obtener el primer caracter
						if @Opci='I' or @Opci ='i'
						begin
							exec  pubv2.RevisaDuplicadosPub @mClaA,@mSA, @mIA, 'Arbol', @CveAr
						   end
						 else
						 begin
							select @Pos =  patindex('%ManV2.%' , @mSA)--Buscamos la posicion de la primera ,
							select @cadSqlM2 = left(@mSA, @Pos - 1)-- esquema
							select @mSA =  stuff(@mSA, 1, @Pos+5, '')			--Y obtenemos los caracteres hasta esa posicion
							set @cadSqlM1=  @cadSqlM2 + ' PubV2.' + @mSA   --SUBSTRING (@mS,@Posicion+4,len(@mS) - (@Posicion + 4))
							exec(@cadSqlM1)
							update ManV2.movimientos SET movEstatus='B' where movClave=@mClaA
						 end
				end
			
		select @CveAr = left(@CveAr, len(@CveAr) - 4);
	end

END


GO
/****** Object:  StoredProcedure [PubV2].[RevisaCamAtrIndicadorPub]    Script Date: 10/09/2020 01:24:07 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [PubV2].[RevisaCamAtrIndicadorPub] 
	-- Add the parameters for the stored procedure here
	@CveIn int,
	@TPro varchar(2)
AS
BEGIN
SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED
declare @mClaA int,@mClaA2 int,@cveSer int, @cveEst int, @cveNota int, @cveFue int, @cveUni int, @cveGral int, @CveGpo int, @cveGrafM  int, @cveGrafT int, @cveGrafC int, @cg int, @cveGrafD int ,@cveTCob int,@cvePCve int --, @CveClas int, @CveDs int
declare @mSA nvarchar(MAX),@CveAr varchar(50),@mSA2 nvarchar(MAX),@cveTI nvarchar(5), @Tipocua nvarchar(5), @cveAgru nvarchar(Max), @cveAgruCl nvarchar(Max), @cveAgru2 nvarchar(Max), @cveAgruCo nvarchar(Max)
declare @cadSqlM nvarchar(Max), @cveAgruCoGeo nvarchar(Max), @cveAgruCoDesGeo nvarchar(Max),@Opci nvarchar(1),@returnErrorSer nvarchar(Max),@msgSer nvarchar(Max),@cadCatPCve nvarchar(max), @cadCDPCve nvarchar(max)
declare @cadSqlM1 nvarchar(Max)
declare @cadSqlM2 nvarchar(Max), @cadCat nvarChar(Max),@cadCD varchar(30)
declare @Pos int,@Pos3 int, @Pos2 int
declare @tablaTI table (cT nvarchar(Max))
declare @tablaPCve table (cvePal int)
--declare @tablaGp table (cG int)
--declare @tablaAgr table (cA nvarchar(Max))
--declare @tablaCveAgr table (cCA nvarchar(Max))
--declare @tablaAgrCo table (cACo nvarchar(Max),cACoGeo nvarChar(Max),cACoDes nvarChar(Max))--tabla para obtener los campos de la tabla agrupaCob
--declare @tablaCveAgrCo table (cCACo nvarchar(Max))

insert into @tablaTI select eitCveTipoInd  from PreV2.EnlIndTipo with(nolock) where eitCveInd = @CveIn
insert into @tablaPCve select eipcCveDesPCve  from PreV2.EnlIndPCve with(nolock) where eipcCveInd = @CveIn

--select top 1 @cveAgruCo  = cACo, @cveAgruCoGeo = cACoGeo, @cveAgruCoDesGeo = cACoDes from @tablaAgrCo

set @cg=0
set @msgSer = ''

--declare @tablaClas table (gpo int, Cla int, CDes int)
				--, @cveGraf = atrTipoGra
			 if @TPro='C'  --cambio
			 begin				
				--Grafica del Mapa
				select @cveGrafM = eigCveGra  from PreV2.EnlIndGra with(nolock)  where eigCveInd  = @CveIn  and eigSeccion='M'
				--Grafica del Mapa
				select @cveGrafT = eigCveGra  from PreV2.EnlIndGra with(nolock)  where eigCveInd  = @CveIn  and eigSeccion='T'
				--Grafica del Mapa
				select @cveGrafC = eigCveGra  from PreV2.EnlIndGra with(nolock)  where eigCveInd  = @CveIn  and eigSeccion='C'
				--Grafica del Mapa
				select @cveGrafD = eigCveGra  from PreV2.EnlIndGra with(nolock)  where eigCveInd  = @CveIn  and eigSeccion='E'
				
				--atributos del indicador
				--select @Tipocua= atrTipoCua, @cveTI = atrTipoInd, @cveEst = atrClaveEst, @cveNota = atrClaveNota, @cveFue = atrClaveFue, @cveUni = atrClaveUni  from man.AtrIndicador where atrClaveInd  = @CveIn 
				--select @Tipocua= atrTipoCua, @cveEst = atrClaveEst, @cveNota = atrClaveNota, @cveFue = atrClaveFue, @cveUni = atrClaveUni, @cveTCob= atrClaveTipoDes from man.AtrIndicador where atrClaveInd  = @CveIn 
				select  @cveEst = atrClaveEst from PreV2.AtrIndicador with(nolock)  where atrClaveInd  = @CveIn 
			end
			else
			begin
			--Grafica del Mapa
				select @cveGrafM = eigCveGra  from PubV2.EnlIndGra with(nolock)  where eigCveInd  = @CveIn  and eigSeccion='M'
				--Grafica del Mapa
				select @cveGrafT = eigCveGra  from PubV2.EnlIndGra with(nolock)  where eigCveInd  = @CveIn  and eigSeccion='T'
				--Grafica del Mapa
				select @cveGrafC = eigCveGra  from PubV2.EnlIndGra with(nolock)  where eigCveInd  = @CveIn  and eigSeccion='C'
				--Grafica del Mapa
				select @cveGrafD = eigCveGra  from PubV2.EnlIndGra with(nolock)  where eigCveInd  = @CveIn  and eigSeccion='E'
				
				--atributos del indicador
				select  @cveEst = atrClaveEst from PubV2.AtrIndicador with(nolock)  where atrClaveInd  = @CveIn 
			end
				set @cadCat = 'TipoIndicador,Estatus,Grafica,Grafica,Grafica,Grafica,DescripcionPCve,'
				WHILE patindex('%,%' , @cadCat) <> 0
				begin
					SELECT @Pos2 =  patindex('%,%' , @cadCat)
					--Buscamos la posicion de la primera ,
					SELECT @cadCD= left(@cadCat, @Pos2 - 1)--nombre de catalogo
					--Reemplazamos lo procesado con nada con la funcion stuff
					SELECT @cadCat = stuff(@cadCat, 1, @Pos2, '')
					--if (@cadCD ='Notas')
					--begin set @cveGral= @cveNota end
					--if (@cadCD ='Fuentes')
					--begin set @cveGral= @cveFue 	end
					--if (@cadCD ='Unidad')
					--begin set @cveGral= @cveUni	end
					if (@cadCD ='Estatus')
					begin set @cveGral= @cveEst	end
					if (@cadCD ='Grafica')
					begin
						set @cg= @cg+1 
						if @cg=1
						begin set @cveGral= @cveGrafM	end
						if @cg=2
						begin set @cveGral= @cveGrafT	end
						if @cg=3
						begin set @cveGral= @cveGrafC	end
						if @cg=4
						begin set @cveGral= @cveGrafD	end
					end
					--if (@cadCD ='DesgloseGeo')
					--begin set @cveGral= @cveTCob  end
					
					if (@cveGral<>0 and @cadCD <> 'TipoIndicador' and @cadCD <>'DescripcionPCve')
					begin
						while exists(select movClave,movsql  from ManV2.movimientos with(nolock) where movCatalogo=@cadCD and movcomentario= @cveGral  and  movEstatus='P' )
						begin
							select top 1 @mClaA2=movClave, @mSA2=movsql  from ManV2.movimientos with(nolock) where movCatalogo=@cadCD  and movcomentario= @cveGral and  movEstatus='P' order by SUBSTRING(movFecha,7,4) asc, substring(movFecha,4,2) asc, SUBSTRING(movFecha,0,3) asc, substring(movhora,0,3) asc, substring(movhora,4,2) asc, substring(movhora,7,2) asc, movClave
							select @Opci =  left(@mSA2,1)	--obtener el primer caracter
							if @Opci='I' or  @Opci='i'
							begin
								exec  pubv2.RevisaDuplicadosPub @mClaA2,@mSA2, @CveIn , @cadCD, @cveGral
							end
							else
							begin
								select @Pos3 =  patindex('%ManV2.%' , @mSA2)--Buscamos la posicion de la primera ,
								select @cadSqlM = left(@mSA2, @Pos3 - 1)-- esquema
								select @mSA2 =  stuff(@mSA2, 1, @Pos3+5, '')			--Y obtenemos los caracteres hasta esa posicion
								set @cadSqlM1=  @cadSqlM + ' PubV2.' + @mSA2   --SUBSTRING (@mS,@Posicion+4,len(@mS) - (@Posicion + 4))
								exec(@cadSqlM1)
								update ManV2.movimientos SET movEstatus='B' where movClave=@mClaA2
							end 
						end
					end
					else
					begin
						if (@cadCD = 'TipoIndicador')--tabla tipo de indicador
						begin
						  while exists(select * from @tablaTI )
						  begin
							   select top 1 @cveTI = cT  from @tablaTI
								while exists(select movClave,movsql  from ManV2.movimientos with(nolock) where movCatalogo=@cadCD and movcomentario= @cveTI  and  movEstatus='P' )
								begin
									select top 1 @mClaA2=movClave, @mSA2=movsql  from ManV2.movimientos with(nolock) where movCatalogo=@cadCD  and movcomentario= @cveTI and  movEstatus='P' order by SUBSTRING(movFecha,7,4) asc, substring(movFecha,4,2) asc, SUBSTRING(movFecha,0,3) asc, substring(movhora,0,3) asc, substring(movhora,4,2) asc, substring(movhora,7,2) asc, movClave
									select @Opci =  left(@mSA2,1)	--obtener el primer caracter
									if @Opci='I' or  @Opci='i'
									begin
										exec  pubv2.RevisaDuplicadosPub @mClaA2,@mSA2, @CveIn , @cadCD, @cveTI
									end
									else
									begin
										select @Pos3 =  patindex('%ManV2.%' , @mSA2)--Buscamos la posicion de la primera ,
										select @cadSqlM = left(@mSA2, @Pos3 - 1)-- esquema
										select @mSA2 =  stuff(@mSA2, 1, @Pos3+5, '')			--Y obtenemos los caracteres hasta esa posicion
										set @cadSqlM1=  @cadSqlM + ' PubV2.' + @mSA2   --SUBSTRING (@mS,@Posicion+4,len(@mS) - (@Posicion + 4))
										exec(@cadSqlM1)
										update ManV2.movimientos SET movEstatus='B' where movClave=@mClaA2
									end 
								end
								delete from @tablaTI where cT= @cveTI
							end
						end
						--palabras clave
						if (@cadCD = 'DescripcionPCve')--tabla descripción de palabras clave
						begin
						  while exists(select * from @tablaPCve )
						  begin
							   select top 1 @cvePCve = cvePal  from @tablaPCve 
								while exists(select movClave,movsql  from ManV2.movimientos with(nolock) where movCatalogo=@cadCD and movcomentario= @cvePCve  and  movEstatus='P' )
								begin
									select top 1 @mClaA2=movClave, @mSA2=movsql  from ManV2.movimientos with(nolock) where movCatalogo=@cadCD  and movcomentario= @cvePCve and  movEstatus='P' order by SUBSTRING(movFecha,7,4) asc, substring(movFecha,4,2) asc, SUBSTRING(movFecha,0,3) asc, substring(movhora,0,3) asc, substring(movhora,4,2) asc, substring(movhora,7,2) asc, movClave
									select @Opci =  left(@mSA2,1)	--obtener el primer caracter
									if @Opci='I' or  @Opci='i'
									begin
										exec  pubv2.RevisaDuplicadosPub @mClaA2,@mSA2, @CveIn , @cadCD, @cvePCve
									end
									else
									begin
										select @Pos3 =  patindex('%ManV2.%' , @mSA2)--Buscamos la posicion de la primera ,
										select @cadSqlM = left(@mSA2, @Pos3 - 1)-- esquema
										select @mSA2 =  stuff(@mSA2, 1, @Pos3+5, '')			--Y obtenemos los caracteres hasta esa posicion
										set @cadSqlM1=  @cadSqlM + ' PubV2.' + @mSA2   --SUBSTRING (@mS,@Posicion+4,len(@mS) - (@Posicion + 4))
										exec(@cadSqlM1)
										update ManV2.movimientos SET movEstatus='B' where movClave=@mClaA2
									end 
								end
								
								--revisar lexico y enlace de palabras clave
								set @cadCatPCve = 'LexicoPCve,EnlacePCve,LexicoPCveIng,EnlacePCveIng,'
									WHILE patindex('%,%' , @cadCat) <> 0
									begin
										SELECT @Pos2 =  patindex('%,%' , @cadCatPCve)
										--Buscamos la posicion de la primera ,
										SELECT @cadCDPCve= left(@cadCatPCve, @Pos2 - 1)--nombre de catalogo
										--Reemplazamos lo procesado con nada con la funcion stuff
										SELECT @cadCatPCve = stuff(@cadCatPCve, 1, @Pos2, '')
										set @cveGral= @cvePCve 
										if @cveGral <> 0
										begin
											while exists(select movClave,movsql  from ManV2.movimientos with(nolock) where movCatalogo=@cadCDPCve and movcomentario= @cveGral  and  movEstatus='P' )
											begin
											select top 1 @mClaA2=movClave, @mSA2=movsql  from ManV2.movimientos with(nolock) where movCatalogo=@cadCDPCve  and movcomentario= @cveGral and  movEstatus='P' order by SUBSTRING(movFecha,7,4) asc, substring(movFecha,4,2) asc, SUBSTRING(movFecha,0,3) asc, substring(movhora,0,3) asc, substring(movhora,4,2) asc, substring(movhora,7,2) asc, movClave
												select @Opci =  left(@mSA2,1)	--obtener el primer caracter
												if @Opci='I' or  @Opci='i'
												begin
													exec pubv2.RevisaDuplicadosPub @mClaA2,@mSA2, @CveIn , @cadCDPCve, @cveGral
												end
												else
												begin
													select @Pos3 =  patindex('%ManV2.%' , @mSA2)--Buscamos la posicion de la primera ,
													select @cadSqlM = left(@mSA2, @Pos3 - 1)-- esquema
													select @mSA2 =  stuff(@mSA2, 1, @Pos3+5, '')			--Y obtenemos los caracteres hasta esa posicion
													set @cadSqlM1=  @cadSqlM + ' PubV2.' + @mSA2   --SUBSTRING (@mS,@Posicion+4,len(@mS) - (@Posicion + 4))
													exec(@cadSqlM1)
													update ManV2.movimientos SET movEstatus='B' where movClave=@mClaA2
												end
											end
										end 
									end
									delete from @tablaPCve where cvePal= @cvePCve
							end
						end			
					
					end
				end

			
 END


GO
/****** Object:  StoredProcedure [PubV2].[RevisaCamFichaTPub]    Script Date: 10/09/2020 01:24:07 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [PubV2].[RevisaCamFichaTPub] 
	-- Add the parameters for the stored procedure here
	@CveIn int,
	@TPro varchar(2)
AS
BEGIN
SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED
declare @mClaA int,@mClaA2 int,@cveFT int,@cveFue int, @cveInst int, @cveRI int, @CvePeri int, @CveCo int, @CveCG int
declare @mSA nvarchar(MAX),@CveAr varchar(50),@mSA2 nvarchar(MAX),@Opci nvarchar(1),@returnErrorSer nvarchar(Max),@msgSer nvarchar(Max)
declare @cadSqlM nvarchar(Max)
declare @cadSqlM1 nvarchar(Max)
declare @cadSqlM2 nvarchar(Max), @cadCat nvarChar(Max),@cadCD varchar(30)
declare @Pos int,@Pos3 int, @Pos2 int
declare @tablafue table (cF int)
declare @tablaIns table (cI int)
declare @tablaRI table (cR int)
declare @tablaCo table (cC int)

set @msgSer = ''

  if @TPro='C'--cambio
  begin
	select top 1 @cveFT = ftClave, @CveCG = ftCobGeoft, @CvePeri = ftPeriodo from PreV2.FichaTecnica with(nolock), PreV2.Arbol with(nolock) where ftClave = arbClaveFT  and arbClaveInd = @CveIn
	insert into @tablafue select effClaveFue from PreV2.EnlFTMFte with(nolock)  where effClave = @CveFT 
	insert into @tablaIns select efiClaveInst  from PreV2.EnlFTRInst with(nolock) where efiClave = @cveFT
	insert into @tablaRI select efrClaveRI from PreV2.EnlFTRRI with(nolock) where efrClave = @cveFT
	insert into @tablaCo select efcClaveCon from PreV2.EnlFTCon with(nolock) where efcClaveFt = @cveFT
  end
  else--borrado
  begin
	select top 1 @cveFT = ftClave, @CveCG = ftCobGeoft, @CvePeri = ftPeriodo from PubV2.FichaTecnica with(nolock), PubV2.Arbol with(nolock) where ftClave = arbClaveFT  and arbClaveInd = @CveIn
	insert into @tablafue select effClaveFue from PubV2.EnlFTMFte with(nolock)  where effClave = @CveFT 
	insert into @tablaIns select efiClaveInst  from PubV2.EnlFTRInst with(nolock) where efiClave = @cveFT
	insert into @tablaRI select efrClaveRI from PubV2.EnlFTRRI with(nolock) where efrClave = @cveFT
	insert into @tablaCo select efcClaveCon from PubV2.EnlFTCon with(nolock) where efcClaveFt = @cveFT
  end
	while exists(select * from @tablafue )--revisar fuentes enlazadas
	begin
		select top 1 @cveFue = cf  from @tablafue  
		while exists(select movClave,movsql  from ManV2.movimientos with(nolock) where movCatalogo='Fuentes' and movcomentario= @cveFue  and  movEstatus='P' )
		begin
			select top 1 @mClaA2=movClave, @mSA2=movsql  from ManV2.movimientos with(nolock) where movCatalogo='Fuentes'  and movcomentario= @cveFue and  movEstatus='P' order by SUBSTRING(movFecha,7,4) asc, substring(movFecha,4,2) asc, SUBSTRING(movFecha,0,3) asc, substring(movhora,0,3) asc, substring(movhora,4,2) asc, substring(movhora,7,2) asc, movClave
			select @Opci =  left(@mSA2,1)	--obtener el primer caracter
			if @Opci='I' or  @Opci='i'
			begin
				exec  pubv2.RevisaDuplicadosPub @mClaA2,@mSA2, @CveIn , 'Fuentes', @cveFue
			end
			else
			begin
				select @Pos3 =  patindex('%ManV2.%' , @mSA2)--Buscamos la posicion de la primera ,
				select @cadSqlM = left(@mSA2, @Pos3 - 1)-- esquema
				select @mSA2 =  stuff(@mSA2, 1, @Pos3+5, '')			--Y obtenemos los caracteres hasta esa posicion
				set @cadSqlM1=  @cadSqlM + ' PubV2.' + @mSA2   --SUBSTRING (@mS,@Posicion+4,len(@mS) - (@Posicion + 4))
				exec(@cadSqlM1)
				update ManV2.movimientos SET movEstatus='B' where movClave=@mClaA2
			end
		end
		delete from @tablafue where cf= @cveFue	
	end
	--
   while exists(select * from @tablaIns )--revisar instituciones enlazadas
	begin
		select top 1 @CveInst = cI  from @tablaIns 
		while exists(select movClave,movsql  from ManV2.movimientos with(nolock) where movCatalogo='Institucion' and movcomentario= @CveInst  and  movEstatus='P' )
		begin
			select top 1 @mClaA2=movClave, @mSA2=movsql  from ManV2.movimientos with(nolock) where movCatalogo='Institucion'  and movcomentario= @CveInst  and  movEstatus='P' order by SUBSTRING(movFecha,7,4) asc, substring(movFecha,4,2) asc, SUBSTRING(movFecha,0,3) asc, substring(movhora,0,3) asc, substring(movhora,4,2) asc, substring(movhora,7,2) asc, movClave
			select @Opci =  left(@mSA2,1)	--obtener el primer caracter
			if @Opci='I' or  @Opci='i'
			begin
				exec pubv2.RevisaDuplicadosPub @mClaA2,@mSA2, @CveIn , 'Institucion', @CveInst
			end
			else
			begin
				select @Pos3 =  patindex('%ManV2.%' , @mSA2)--Buscamos la posicion de la primera ,
				select @cadSqlM = left(@mSA2, @Pos3 - 1)-- esquema
				select @mSA2 =  stuff(@mSA2, 1, @Pos3+5, '')			--Y obtenemos los caracteres hasta esa posicion
				set @cadSqlM1=  @cadSqlM + ' PubV2.' + @mSA2   --SUBSTRING (@mS,@Posicion+4,len(@mS) - (@Posicion + 4))
				exec(@cadSqlM1)
				update ManV2.movimientos SET movEstatus='B' where movClave=@mClaA2
			end
		end
		delete from @tablaIns where cI= @cveInst 	
	end
	--
	while exists(select * from @tablaRI )--revisar referencias internacionales 
	begin
		select top 1 @CveRI = cR  from @tablaRI 
		while exists(select movClave,movsql  from ManV2.movimientos with(nolock) where movCatalogo='RefInter' and movcomentario= @CveRI  and  movEstatus='P' )
		begin
			select top 1 @mClaA2=movClave, @mSA2=movsql  from ManV2.movimientos with(nolock) where movCatalogo='RefInter'  and movcomentario= @CveRI  and  movEstatus='P' order by SUBSTRING(movFecha,7,4) asc, substring(movFecha,4,2) asc, SUBSTRING(movFecha,0,3) asc, substring(movhora,0,3) asc, substring(movhora,4,2) asc, substring(movhora,7,2) asc, movClave
			select @Opci =  left(@mSA2,1)	--obtener el primer caracter
			if @Opci='I' or  @Opci='i'
			begin
				exec  pubv2.RevisaDuplicadosPub @mClaA2,@mSA2, @CveIn , 'RefInter', @CveRI
			end
			else
			begin
				select @Pos3 =  patindex('%ManV2.%' , @mSA2)--Buscamos la posicion de la primera ,
				select @cadSqlM = left(@mSA2, @Pos3 - 1)-- esquema
				select @mSA2 =  stuff(@mSA2, 1, @Pos3+5, '')			--Y obtenemos los caracteres hasta esa posicion
				set @cadSqlM1=  @cadSqlM + ' PubV2.' + @mSA2   --SUBSTRING (@mS,@Posicion+4,len(@mS) - (@Posicion + 4))
				exec(@cadSqlM1)
				update ManV2.movimientos SET movEstatus='B' where movClave=@mClaA2
			end
		end
		delete from @tablaRI where cR= @CveRI	
	end
   --
	while exists(select * from @tablaCo )--revisar contactos enlazados
	begin
		select top 1 @cveCo = cC  from @tablaCo  
		while exists(select movClave,movsql  from ManV2.movimientos with(nolock) where movCatalogo='Contacto' and movcomentario= @cveCo  and  movEstatus='P' )
		begin
			select top 1 @mClaA2=movClave, @mSA2=movsql  from ManV2.movimientos with(nolock) where movCatalogo='Contacto'  and movcomentario= @cveCo and  movEstatus='P' order by SUBSTRING(movFecha,7,4) asc, substring(movFecha,4,2) asc, SUBSTRING(movFecha,0,3) asc, substring(movhora,0,3) asc, substring(movhora,4,2) asc, substring(movhora,7,2) asc, movClave
			select @Opci =  left(@mSA2,1)	--obtener el primer caracter
			if @Opci='I' or  @Opci='i'
			begin
				exec  pubv2.RevisaDuplicadosPub @mClaA2,@mSA2, @CveIn , 'Contacto', @cveCo
			end
			else
			begin
				select @Pos3 =  patindex('%ManV2.%' , @mSA2)--Buscamos la posicion de la primera ,
				select @cadSqlM = left(@mSA2, @Pos3 - 1)-- esquema
				select @mSA2 =  stuff(@mSA2, 1, @Pos3+5, '')			--Y obtenemos los caracteres hasta esa posicion
				set @cadSqlM1=  @cadSqlM + ' PubV2.' + @mSA2   --SUBSTRING (@mS,@Posicion+4,len(@mS) - (@Posicion + 4))
				exec(@cadSqlM1)
				update ManV2.movimientos SET movEstatus='B' where movClave=@mClaA2
			end
		end
		delete from @tablaCo where cC= @cveCo	
	end
	
	  --revisar la cobertura
		while exists(select movClave,movsql  from ManV2.movimientos with(nolock) where movCatalogo='FTCob' and movcomentario= @CveCG  and  movEstatus='P' )
		begin
			select top 1 @mClaA2=movClave, @mSA2=movsql  from ManV2.movimientos with(nolock) where movCatalogo='FTCob'  and movcomentario= @CveCG  and  movEstatus='P' order by SUBSTRING(movFecha,7,4) asc, substring(movFecha,4,2) asc, SUBSTRING(movFecha,0,3) asc, substring(movhora,0,3) asc, substring(movhora,4,2) asc, substring(movhora,7,2) asc, movClave
			select @Opci =  left(@mSA2,1)	--obtener el primer caracter
			if @Opci='I' or  @Opci='i'
			begin
				exec  pubv2.RevisaDuplicadosPub @mClaA2,@mSA2, @CveIn , 'FTCob', @CveCG
			end
			else
			begin
				select @Pos3 =  patindex('%ManV2.%' , @mSA2)--Buscamos la posicion de la primera ,
				select @cadSqlM = left(@mSA2, @Pos3 - 1)-- esquema
				select @mSA2 =  stuff(@mSA2, 1, @Pos3+5, '')			--Y obtenemos los caracteres hasta esa posicion
				set @cadSqlM1=  @cadSqlM + ' PubV2.' + @mSA2   --SUBSTRING (@mS,@Posicion+4,len(@mS) - (@Posicion + 4))
				exec(@cadSqlM1)
				update ManV2.movimientos SET movEstatus='B' where movClave=@mClaA2
			end
		end
		 --revisar periodo
		while exists(select movClave,movsql  from ManV2.movimientos with(nolock) where movCatalogo='Periodo' and movcomentario= @CvePeri  and  movEstatus='P' )
		begin
			select top 1 @mClaA2=movClave, @mSA2=movsql  from ManV2.movimientos with(nolock) where movCatalogo='Periodo'  and movcomentario= @CvePeri  and  movEstatus='P' order by SUBSTRING(movFecha,7,4) asc, substring(movFecha,4,2) asc, SUBSTRING(movFecha,0,3) asc, substring(movhora,0,3) asc, substring(movhora,4,2) asc, substring(movhora,7,2) asc, movClave
			select @Opci =  left(@mSA2,1)	--obtener el primer caracter
			if @Opci='I' or  @Opci='i'
			begin
				exec  pubv2.RevisaDuplicadosPub @mClaA2,@mSA2, @CveIn , 'Periodo', @CvePeri
			end
			else
			begin
				select @Pos3 =  patindex('%ManV2.%' , @mSA2)--Buscamos la posicion de la primera ,
				select @cadSqlM = left(@mSA2, @Pos3 - 1)-- esquema
				select @mSA2 =  stuff(@mSA2, 1, @Pos3+5, '')			--Y obtenemos los caracteres hasta esa posicion
				set @cadSqlM1=  @cadSqlM + ' PubV2.' + @mSA2   --SUBSTRING (@mS,@Posicion+4,len(@mS) - (@Posicion + 4))
				exec(@cadSqlM1)
				update ManV2.movimientos SET movEstatus='B' where movClave=@mClaA2
			end
		end
--return @msgSer

END

GO
/****** Object:  StoredProcedure [PubV2].[RevisaDuplicadosPub]    Script Date: 10/09/2020 01:24:07 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [PubV2].[RevisaDuplicadosPub] 
	-- Add the parameters for the stored procedure here
	@mClav int,
	@mSql  nvarChar(MAX), 
	@mIn int, 
	@mCto varchar(50),
	@mComen nvarchar(MAX)
	
AS
BEGIN
SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED
declare @cadSqlM nvarchar(Max),@cadSqlM1 nvarchar(Max),@cad1 nvarchar(Max),@cadPal nvarchar(Max), @cadDes nvarchar(Max),@cadSql nvarchar(Max),@claSer nvarchar(max), @claAgrOrd nvarchar(max), @PerAA nvarchar(6),@PerMM nvarchar(4), @PerDD nvarchar(4), @apiNota nvarchar(max),@cadSqlEnl nvarchar(max)
declare @claCve nvarchar(Max), @claGpo nvarchar(Max),@claCveDes nvarchar(Max),@Row int,  @posA int 
declare @Posicion int,@Posicion2 int, @Posicion3 int,@Posicion4 int, @Posicion5 int, @Posicion6 int, @Posicion7 int
declare @campM1 nvarchar(Max),@campM2 nvarchar(Max),@campM3 nvarchar(Max),@campM4 nvarchar(Max),@campM5 nvarchar(Max),@campM6 nvarchar(Max),@campM7 nvarchar(Max),@campM8 nvarchar(Max),@campM9 nvarchar(Max),@campM10 nvarchar(Max),@campM11 nvarchar(Max),@campM12 nvarchar(Max),@campM13 nvarchar(Max),@campM14 nvarchar(Max),@campM15 nvarchar(Max),@campM16 nvarchar(Max),@campM17 nvarchar(Max),@campM18 nvarchar(Max),@campM19 nvarchar(Max),@campM20 nvarchar(Max),@campM21 nvarchar(Max),@campM22 nvarchar(Max),@campM23 nvarchar(Max),@campM24 nvarchar(Max),@campM25 nvarchar(Max),@campM26 nvarchar(Max)
declare @campP1 nvarchar(Max),@campP2 nvarchar(Max),@campP3 nvarchar(Max),@campP4 nvarchar(Max),@campP5 nvarchar(Max),@campP6 nvarchar(Max),@campP7 nvarchar(Max),@campP8 nvarchar(Max),@campP9 nvarchar(Max),@campP10 nvarchar(Max),@campP11 nvarchar(Max),@campP12 nvarchar(Max),@campP13 nvarchar(Max),@campP14 nvarchar(Max),@campP15 nvarchar(Max),@campP16 nvarchar(Max),@campP17 nvarchar(Max),@campP18 nvarchar(Max),@campP19 nvarchar(Max),@campP20 nvarchar(Max),@campP21 nvarchar(Max),@campP22 nvarchar(Max),@campP23 nvarchar(Max),@campP24 nvarchar(Max),@campP25 nvarchar(Max),@campP26 nvarchar(Max)
declare @returnMsj nvarchar(Max), @banMsj nvarchar(1),@MsjTemp nvarchar(Max),@TipoCla nvarchar(max)
--declare @TabAgrupaClas table (acClave nvarchar(Max),acCveGpo nvarChar(Max),acCveClas nvarChar(Max), acDescrip nvarchar(Max), acDescripIng nvarchar(Max))--tabla para obtener los campos de la tabla agrupaCob
--declare @TabAgrupaCob table (acoClave nvarchar(Max),acoCveGeo nvarChar(Max),acoCveDesGeo nvarChar(Max), acoOrden nvarchar(Max))--tabla para obtener los campos de la tabla agrupaCob
--declare @TabGeneral table (tg1 nvarchar(Max),tg2 nvarchar(Max),tg3 nvarchar(Max),tg4 nvarchar(Max),tg5 nvarchar(Max),tg6 nvarchar(Max),tg7 nvarchar(Max),tg8 nvarchar(Max),tg9 nvarchar(Max),tg10 nvarchar(Max),tg11 nvarchar(Max),tg12 nvarchar(Max),tg13 nvarchar(Max),tg14 nvarchar(Max),tg15 nvarchar(Max),tg16 nvarchar(Max),tg17 nvarchar(Max),tg18 nvarchar(Max),tg19 nvarchar(Max),tg20 nvarchar(Max),tg21 nvarchar(Max),tg22 nvarchar(Max),tg23 nvarchar(Max),tg24 nvarchar(Max),tg25 nvarchar(Max),tg26 nvarchar(Max))

set @returnMsj=''
set @MsjTemp=''
set @banMsj=''
set @Row=0
if @mCto='Descripcion'
begin
	if EXISTS (select  * from PubV2.Descripcion with(nolock) where desclave = @mComen)
	begin set @Row=1 end
	--select  @Row = COUNT(*) from PubV2.Descripcion with(nolock) where desclave = @mComen
	if @Row = 0
	Begin  set @banMsj='0' end
	else
	begin
		select top 1  @campM1=desdescrip, @campM2=desAbrevia, @campM3=desCodigo, @campM4=desDescripIng, @campM5=desAbreviaIng, @campM6=desCodigoIng  from PreV2.Descripcion with(nolock) where desclave=@mComen
		select top 1  @campP1=desdescrip, @campP2=desAbrevia, @campP3=desCodigo, @campP4=desDescripIng, @campP5=desAbreviaIng, @campP6=desCodigoIng  from PubV2.Descripcion with(nolock) where desclave=@mComen
		if @campM1= @campP1 and @campM2= @campP2 and @campM3= @campP3 and @campM4= @campP4 and @campM5= @campP5 and @campM6= @campP6
		begin set @banMsj='F' end
		else 
		begin 
			set @banMsj='T' 
			--update ' + @Esq + 'Serie set serDato=' + @serDtF + ', serNoDato=0 where  serclave= ' + Convert(nvarchar(255),@serCve) + ' and serCveCobAgrup=''' + @serCveCG + ''' and serCveClaAgrup= ''' + @serCveCla + ''' and seraaDato= ' + Convert(nvarchar(4),@serADato) + ' and serMMDato=' + Convert(nvarchar(2),@serMDato) + ' and serddDato=' + Convert(nvarchar(2),@serDDato) --serclaveind= ' + CONVERT(nvarchar(10),@serCveI) + ' and
			--set @cadSql='update PreV2.Descripcion set desDescrip=''' + @campM1 +  ''',desAbrevia=''' + @campM2 + ''' ,desCodigo=''' + @campM3 + ''',desDescripIng= ''' + @campM4 + ''',desAbreviaIng=''' + @campM5 + ''',desCodigoIng=''' + @campM6 + ''' where desclave= ' + @mComen
			set @cadSql='Delete from PubV2.Descripcion where desclave= ' + @mComen
			--set @cadSql ='delete from pre.Descripcion where desclave=' + @mComen
			--set @cadSqlM = 'insert into pre.Descripción (desclave,desdescrip,desAbrevia,descodigo,desDescriping,desAbreviaIng,desCodigoing) select desclave,desdescrip,desAbrevia,descodigo,desDescriping,desAbreviaIng,desCodigoing from man.Descripcion where desclave=' + @mComen 
		end
	end
end
if @mCto='DescripcionPCve'
begin
	if EXISTS (select * from PubV2.DescripcionPCve with(nolock) where dpcClave = @mComen)
	begin set @Row=1 end
	--select  @Row = COUNT(*) from PubV2.DescripcionPCve with(nolock) where dpcClave = @mComen
	if @Row = 0
	Begin  set @banMsj='0' end
	else
	begin
		select top 1  @campM1=dpcdescrip, @campM2=dpcAbrevia, @campM3=dpcdescripIng, @campM4=dpcAbreviaIng  from PreV2.DescripcionPCve with(nolock) where dpcClave=@mComen
		select top 1  @campP1=dpcdescrip, @campP2=dpcAbrevia, @campP3=dpcDescripIng, @campP4=dpcAbreviaIng   from PubV2.DescripcionPCve with(nolock) where dpcClave=@mComen
		if @campM1= @campP1 and @campM2= @campP2 and @campM3= @campP3 and @campM4= @campP4 and @campM5= @campP5 and @campM6= @campP6
		begin set @banMsj='F' end
		else 
		begin 
			set @banMsj='T' 
			--update ' + @Esq + 'Serie set serDato=' + @serDtF + ', serNoDato=0 where  serclave= ' + Convert(nvarchar(255),@serCve) + ' and serCveCobAgrup=''' + @serCveCG + ''' and serCveClaAgrup= ''' + @serCveCla + ''' and seraaDato= ' + Convert(nvarchar(4),@serADato) + ' and serMMDato=' + Convert(nvarchar(2),@serMDato) + ' and serddDato=' + Convert(nvarchar(2),@serDDato) --serclaveind= ' + CONVERT(nvarchar(10),@serCveI) + ' and
			--set @cadSql='update PreV2.Descripcion set desDescrip=''' + @campM1 +  ''',desAbrevia=''' + @campM2 + ''' ,desCodigo=''' + @campM3 + ''',desDescripIng= ''' + @campM4 + ''',desAbreviaIng=''' + @campM5 + ''',desCodigoIng=''' + @campM6 + ''' where desclave= ' + @mComen
			set @cadSql='Delete from PubV2.DescripcionPCve where dpcClave= ' + @mComen
			--set @cadSql ='delete from pre.Descripcion where desclave=' + @mComen
			--set @cadSqlM = 'insert into pre.Descripción (desclave,desdescrip,desAbrevia,descodigo,desDescriping,desAbreviaIng,desCodigoing) select desclave,desdescrip,desAbrevia,descodigo,desDescriping,desAbreviaIng,desCodigoing from man.Descripcion where desclave=' + @mComen 
		end
	end
end
if @mCto='AgrupaClas'
begin
	
	--select @Row = COUNT(*)  from PubV2.AgrupaClas with(nolock) where acClave= @mComen
	if EXISTS (select *  from PreV2.AgrupaClas with(nolock) where acClave= @mComen)
	begin set @Row=1 end
	print @Row
	if @Row=0
	Begin  set @banMsj='0' end
	else
	begin
	print 'Buscar iguales'
		select top 1  @campM1=acCveGpo, @campM2=acCveClas, @campM3=acDescrip, @campM4=acDescripIng  from PreV2.AgrupaClas with(nolock) where acclave=@mComen
		select top 1  @campP1=acCveGpo, @campP2=acCveClas, @campP3=acDescrip, @campP4=acDescripIng  from PubV2.AgrupaClas with(nolock) where acclave=@mComen
		if @campM1= @campP1 and @campM2= @campP2 and @campM3= @campP3 and @campM4= @campP4 
		begin set @banMsj='F' end
		else 
		begin 
			print 'entre al update'
			set @banMsj='T' 
			print @banMsj
			--set @cadSql='update PreV2.AgrupaClas set acCveGpo=' +  @campM1 + ',acCveClas = ' + @campM2 + ' where acclave= ''' + @mComen + ''''
			--print @cadSql
			--set @cadSql='update PreV2.AgrupaClas set acCveGpo=' +  @campM1 + ',acCveClas = ' + @campM2 + ', acDescrip=' + @campM3 + ', acDescripIng=' + @campM4 + ' where acclave= ''' + @mComen + ''''
			set @cadSql='Delete from  PubV2.AgrupaClas where acclave= ''' + @mComen + ''''
			print @cadSql
			--set @cadSql ='delete from pre.AgrupaClas where acClave=' + @mComen
			--set @cadSqlM = 'insert into pre.AgrupaClas (acClave,acCveGpo,acCveClas,acDescrip,acDescriping) select acClave,acCveGpo,acCveClas,acDescrip,acDescriping from man.AgrupaClas where acclave=' + @mComen 
		end
	end
end

if @mCto='AtrAgrupaClaPorInd'
begin
	select @Posicion2 =   patindex('%-%' ,@mComen ) --obtener la posicion del separador de la clave de serie y agrupamiento
	select @claSer = left(@mComen, @Posicion2 -1)-- obtener la clave de serie
	SELECT @mComen= stuff(@mComen, 1, @Posicion2, '')--quitar la clave de serie
	select @Posicion2 =   patindex('%-%' ,@mComen ) --obtener la posicion del separador de la clave de serie y agrupamiento 
	select @claAgrOrd = left(@mComen, @Posicion2 -1)-- obtener la clave de agrupamiento
	SELECT @mComen= stuff(@mComen, 1, @Posicion2, '')--quitar la clave de agrupamiento
	set @TipoCla = @mComen -- asignar a otra variable si es C=clasificacion o G= grupo
	if EXISTS (select *  from PubV2.AtrAgrupaClaPorInd with(nolock) where aaclCveSer= @claser and aaclAgrCla= @claAgrOrd  and aaclTipCla= @TipoCla)
	begin set @Row=1 end
	--select @Row = COUNT(*)  from PreV2.AtrAgrupaClaPorInd with(nolock) where aaclCveSer= @claser and aaclAgrCla= @claAgrOrd  and aaclTipCla= @TipoCla
	print @Row
	if @Row=0
	Begin  set @banMsj='0' end
	else
	begin
	print 'Buscar iguales'
		select top 1  @campM1=aaclCveSer, @campM2=aaclAgrCla, @campM3=aaclCveNota, @campM4=aaclOrdenTab, @campM5=aaclOrdenGra, @campM6=aaclOrdenMap  from PreV2.AtrAgrupaClaPorInd with(nolock) where aaclCveSer= @claser and aaclAgrCla= @claAgrOrd and aaclTipCla= @TipoCla
		select top 1  @campP1=aaclCveSer, @campP2=aaclAgrCla, @campP3=aaclCveNota, @campP4=aaclOrdenTab,@campP5=aaclOrdenGra,@campP6=aaclOrdenMap  from PubV2.AtrAgrupaClaPorInd with(nolock) where aaclCveSer= @claser and aaclAgrCla= @claAgrOrd and aaclTipCla= @TipoCla
		if @campM1= @campP1 and @campM2= @campP2 and @campM3= @campP3 and @campM4= @campP4 and @campM5= @campP5 and @campM6= @campP6 
		begin set @banMsj='F' end
		else 
		begin 
			print 'entre al update'
			set @banMsj='T' 
			print @banMsj
			set @cadSql='Delete from  PubV2.AtrAgrupaClaPorInd where aaclCveSer = ' + @claSer + '  and aaclAgrCla= ''' + @claAgrOrd + ''' and aaclTipCla= ''' + @TipoCla + ''''
			print @cadSql
		end
	end
end

if @mCto='AtrAgrupaCobPorInd'
begin
	select @Posicion2 =   patindex('%-%' ,@mComen ) --obtener la posicion del separador de la clave de serie y agrupamiento
	select @claSer = left(@mComen, @Posicion2 -1)-- obtener la clave de serie
	SELECT @mComen= stuff(@mComen, 1, @Posicion2, '')--quitar la clave de serie
	select @claAgrOrd = @mComen -- obtener la clave de agrupamiento
	set @claAgrOrd = '' + @claAgrOrd + ''
	print @claAgrOrd
	PRINT @claser
	if EXISTS (select * from PubV2.AtrAgrupaCobPorInd with(nolock) where aacoCveSer= @claser and aacoAgrCob= @claAgrOrd )
	begin set @Row=1 end
	--select @Row = aacoCveSer  from PreV2.AtrAgrupaCobPorInd with(nolock) where aacoCveSer= @claser and aacoAgrCob= @claAgrOrd 
	print @Row
	if @Row =0
	Begin  set @banMsj='0' end
	else
	begin
	print 'Buscar iguales'
		select top 1  @campM1=aacoCveSer, @campM2=aacoAgrCob, @campM3=aacoCveNota from PreV2.AtrAgrupaCobPorInd with(nolock) where aacoCveSer= @claser and aacoAgrCob= @claAgrOrd 
		select top 1  @campP1=aacoCveSer, @campP2=aacoAgrCob, @campP3=aacoCveNota from PubV2.AtrAgrupaCobPorInd with(nolock) where aacoCveSer= @claser and aacoAgrCob= @claAgrOrd 
		if @campM1= @campP1 and @campM2= @campP2 and @campM3= @campP3 and @campM4= @campP4 and @campM5= @campP5 and @campM6= @campP6 
		begin set @banMsj='F' end
		else 
			begin 
			print 'entre al update'
			set @banMsj='T' 
			print @banMsj
			set @cadSql='Delete from  PubV2.AtrAgrupaCobPorInd where aacoCveSer = ' + @claSer + '  and aacoAgrCob= ''' + @claAgrOrd + ''''
			print @cadSql
		end
	end
end
if @mCto='AtrPeriodoPorInd'
begin
	print @mSql
	select @Posicion2 =   patindex('%Values%' ,@mSql ) --obtener la posicion del Values
	set @cad1 = @mSql
	SELECT @cad1= stuff(@cad1, 1, @Posicion2, '')--1,2014,0,0,350) serie, año, mes, día, nota
	print @cad1
	select @Posicion =  patindex('%(%' ,@cad1)
	SELECT @cad1= stuff(@cad1, 1, @Posicion, '')--1,2014,0,0,350)
	select @Posicion =  patindex('%,%' ,@cad1)
	SELECT @cad1= stuff(@cad1, 1, @Posicion, '')--2014,0,0,350)
	select @Posicion =  patindex('%,%' ,@cad1)
	select @PerAA = left(@cad1, @Posicion-1)--año
	print @PerAA
	SELECT @cad1= stuff(@cad1, 1, @Posicion, '')--0,0,350)
	select @Posicion =  patindex('%,%' ,@cad1)
	select @PerMM = left(@cad1, @Posicion-1)--mes
	print @PerMM
	SELECT @cad1= stuff(@cad1, 1, @Posicion, '')--0,350)
	select @Posicion =  patindex('%,%' ,@cad1)
	select @PerDD = left(@cad1, @Posicion-1)--día
	print @PerDD
	SELECT @cad1= stuff(@cad1, 1, @Posicion, '')--350)
	select @Posicion =  patindex('%)%' ,@cad1)
	select @apiNota = left(@cad1, @Posicion-1)--nota
	print @apiNota
	if EXISTS (select *  from PubV2.AtrPeriodoPorInd with(nolock) where apiCveSer= @mComen and apiPerAA= @PerAA  and apiPerMM= @PerMM and apiPerDD= @PerDD and apiCveNota= @apiNota)
	begin		set @Row=1	end
	print @Row
	if @Row=0
	Begin  set @banMsj='0' end
	else
	begin
	print 'Buscar iguales'
		select top 1  @campM1=apiCveSer, @campM2=apiPerAA, @campM3=apiPerMM, @campM4=apiPerDD, @campM5=apiCveNota from PreV2.AtrPeriodoPorInd with(nolock) where apiCveSer= @mComen and apiPerAA= @PerAA  and apiPerMM= @PerMM and apiPerDD= @PerDD and apiCveNota= @apiNota
		select top 1  @campP1=apiCveSer, @campP2=apiPerAA, @campP3=apiPerMM, @campP4=apiPerDD, @campP5=apiCveNota from PubV2.AtrPeriodoPorInd with(nolock) where apiCveSer= @mComen and apiPerAA= @PerAA  and apiPerMM= @PerMM and apiPerDD= @PerDD and apiCveNota= @apiNota
		if @campM1= @campP1 and @campM2= @campP2 and @campM3= @campP3 and @campM4= @campP4 and @campM5= @campP5 
		begin set @banMsj='F' end
		else 
		begin 
			print 'entre al update'
			set @banMsj='T' --apiPerAA= @PerAA  and apiPerMM= @PerMM and apiPerDD= @PerDD and apiCveNota= @apiNota
			print @banMsj
			set @cadSql='Delete from  PubV2.AtrPeriodoPorInd where apiCveSer = ' + @mComen + ' and  apiPerAA=' +  @PerAA + ' and  apiPerMM=' + @PerMM + ' and  apiPerDD=' + @PerDD
			print @cadSql
		end
	end
end

--print @mCto
if @mCto='AgrupaCob'
begin
	if EXISTS (select *  from PubV2.AgrupaCob with(nolock) where acoClave= @mComen)
	begin	set @Row=1	end
	--select @Row = COUNT(*)  from PubV2.AgrupaCob with(nolock) where acoClave= @mComen
	if @Row=0
	Begin  set @banMsj='0' end
	else
	begin
		select top 1  @campM1=acoCveGeo, @campM2=acoCveDesGeo, @campM3=acoOrden  from PreV2.AgrupaCob with(nolock) where acoclave=@mComen
		select top 1  @campP1=acoCveGeo, @campP2=acoCveDesGeo, @campP3=acoOrden  from PubV2.AgrupaCob with(nolock) where acoclave=@mComen
		if @campM1= @campP1 and @campM2= @campP2 and @campM3= @campP3 
		begin set @banMsj='F' end
		else 
		begin 
			set @banMsj='T'
			--set @cadSql='update PreV2.AgrupaCob set acoCveGeo=''' +  @campM1 + ''',acoCveDesGeo = ''' + @campM2 + ''', acoOrden=' + @campM3 + ' where acoclave= ''' + @mComen  + ''
			set @cadSql='Delete from PubV2.AgrupaCob  where acoclave= ''' + @mComen  + ''''
			--set @cadSql ='delete from pre.AgrupaCob where acoClave=' + @mComen
			--set @cadSqlM = 'insert into pre.AgrupaCob (acoClave,acoCveGeo,acoCveDesGeo,acoOrden) select acoClave,acoCveGeo,acoCveDesGeo,acoOrden from man.AgrupaCob where acoclave=' + @mComen 
		end
	end
end
if @mCto='Arbol'
begin
	--select @Row = COUNT(*)  from PubV2.Arbol with(nolock) where arbClave= @mComen
	if EXISTS (select * from PubV2.Arbol with(nolock) where arbClave= @mComen)
	begin	set @Row=1	end
	if @Row=0
	Begin  set @banMsj='0' end
	else
	begin
		select top 1  @campM1=arbClaveInd, @campM2=arbClaveFT, @campM3=arbClaveDescrip, @campM4=arbClaveMetadato  from PreV2.Arbol with(nolock) where arbclave=@mComen
		select top 1  @campP1=arbClaveInd, @campP2=arbClaveFT, @campP3=arbClaveDescrip, @campP4=arbClaveMetadato  from PubV2.Arbol with(nolock) where arbclave=@mComen
		if @campM1= @campP1 and @campM2= @campP2 and @campM3= @campP3 and @campM4= @campP4  
		begin set @banMsj='F' end
		else 
		begin 
			set @banMsj='T' 
			--set @cadSql='update PreV2.Arbol set arbClaveInd=' +  @campM1 + ',arbClaveFT = ' + @campM2 + ', arbClaveDescrip=' + @campM3 + ',arbClaveMetadato=' + @campM4 +' where arbclave= ''' + @mComen  + ''
			set @cadSql='Delete  from PubV2.Arbol where arbclave= ''' + @mComen  + ''''
			--set @cadSql ='delete from pre.Arbol where arbClave=' + @mComen
			--set @cadSqlM = 'insert into pre.Arbol (arbClave,arbClaveInd,arbClaveFT,arbClaveDescrip,arbClaveMetadato) select arbClave,arbClaveInd,arbClaveFT,arbClaveDescrip,arbClaveMetadato from man.Arbol where arbclave=' + @mComen 
		end
	end
end

if @mCto='AtrIndicador'
begin
	--select @Row = COUNT(*)  from PubV2.AtrIndicador with(nolock) where atrClaveInd= @mComen
	if EXISTS (select *  from PubV2.AtrIndicador with(nolock) where atrClaveInd= @mComen)
	begin	set @Row=1	end
	if @Row=0
	Begin  set @banMsj='0' end
	else
	begin
		select top 1  @campM1=atrFechaAct, @campM2=atrMeta, @campM3=atrDesMeta, @campM4=atrCalculo, @campM5=atrClaveEst, @campM6=atrFechaActIng, @campM7=atrDesMetaIng, @campM8=atrEstadisticos, @campM9=atrVisualizaMapa  from PreV2.AtrIndicador with(nolock) where atrClaveInd=@mComen
		select top 1  @campP1=atrFechaAct, @campP2=atrMeta, @campP3=atrDesMeta, @campP4=atrCalculo, @campP5=atrClaveEst, @campP6=atrFechaActIng, @campP7=atrDesMetaIng, @campP8=atrEstadisticos, @campP9=atrVisualizaMapa  from PubV2.AtrIndicador with(nolock) where atrClaveInd=@mComen
		if @campM1= @campP1 and @campM2= @campP2 and @campM3= @campP3 and @campM4= @campP4  and @campM5= @campP5  and @campM6= @campP6  and @campM7= @campP7  and @campM8= @campP8  and @campM9= @campP9  
		begin set @banMsj='F' end
		else 
		begin 
			set @banMsj='T' 
			--set @cadSql='update PreV2.AtrIndicador set atrFechaAct=''' +  @campM1 + ''',atrMeta = ' + @campM2 + ', atrDesMeta=''' + @campM3 + ''',atrCalculo=''' + @campM4 + ''',atrClaveEst=' + @campM5 + ',atrFechaActIng=''' + @campM6 + ''',atrDesMetaIng=''' + @campM7 + ''',atrEstatidticos=''' + @campM8 + ''',atrVisualizaMapa=''' + @campM9 + '''   where atrClaveInd= ' + @mComen 
			set @cadSql='Delete from PubV2.AtrIndicador where atrClaveInd= ' + @mComen 
			--set @cadSql ='delete from pre.AtrIndicador where atrClaveInd=' + @mComen
			--set @cadSqlM = 'insert into pre.AtrIndicador (atrClaveInd,atrFechaAct,atrMeta,atrDesMeta,atrCalculo,atrClaveEst,atrFechaActInd,atrDesMetaIng,atrEstadisticos,atrVisualizaMapa) select atrClaveInd,atrFechaAct,atrMeta,atrDesMeta,atrCalculo,atrClaveEst,atrFechaActInd,atrDesMetaIng,atrEstadisticos,atrVisualizaMapa from man.AtrIndicador where atrClaveInd=' + @mComen 
		end
	end
end

if @mCto='AtrSerie'
begin
	--select @Row = COUNT(*)  from PubV2.AtrSerie with(nolock) where atsClaveSerie= @mComen
	if EXISTS (select *  from PubV2.AtrSerie with(nolock) where atsClaveSerie= @mComen)
	begin	set @Row=1	end
	if @Row=0
	Begin  set @banMsj='0' end
	else
	begin
		select top 1  @campM1=atsClaveDescrip, @campM2=atsClaveFre, @campM3=atsAAPrelim, @campM4=atsMMPrelim, @campM5=atsDDPrelim, @campM6=atsAAEst, @campM7=atsMMEst, @campM8=atsDDEst, @campM9=atsDecimales, @campM10=atsClaveNota, @campM11=atsClaveFT, @campM12=atsClaveFuente,@campM13=atsClaveUnidad,@campM14=atsTipo,@campM15=atsSalida,@campM16=atsAARev,@campM17=atsMMRev,@campM18=atsDDRev,@campM19=atsClaveAgrupaCob,@campM20=atsClaveAgrupaClas,@campM21=atsColMatriz,@campM22=atsColMatrizIng,@campM23=atsTipoGra,@campM24=atsInicio,@campM25=atsTipoCua  from PreV2.AtrSerie with(nolock) where atsClaveSerie=@mComen
		select top 1  @campP1=atsClaveDescrip, @campP2=atsClaveFre, @campP3=atsAAPrelim, @campP4=atsMMPrelim, @campP5=atsDDPrelim, @campP6=atsAAEst, @campP7=atsMMEst, @campP8=atsDDEst, @campP9=atsDecimales, @campP10=atsClaveNota, @campP11=atsClaveFT, @campP12=atsClaveFuente,@campP13=atsClaveUnidad,@campP14=atsTipo,@campP15=atsSalida,@campP16=atsAARev,@campP17=atsMMRev,@campP18=atsDDRev,@campP19=atsClaveAgrupaCob,@campP20=atsClaveAgrupaClas,@campP21=atsColMatriz,@campP22=atsColMatrizIng,@campP23=atsTipoGra,@campP24=atsInicio,@campP25=atsTipoCua  from PubV2.AtrSerie with(nolock) where atsClaveSerie=@mComen
		if @campM1= @campP1 and @campM2= @campP2 and @campM3= @campP3 and @campM4= @campP4  and @campM5= @campP5  and @campM6= @campP6  and @campM7= @campP7  and @campM8= @campP8 and @campM9= @campP9  and @campM10= @campP10 and @campM11= @campP11 and @campM12= @campP12 and @campM13= @campP13 and @campM14= @campP14 and @campM15= @campP15 and @campM16= @campP16 and @campM17= @campP17 and @campM18= @campP18 and @campM19= @campP19 and @campM20= @campP20 and @campM21= @campP21 and @campM22= @campP22 and @campM23= @campP23 and @campM24= @campP24 and @campM25= @campP25                                
		begin set @banMsj='F' end
		else 
		begin 
			set @banMsj='T' 
			--set @cadSql='update PreV2.AtrSerie set atsClaveDescrip=' + @campM1 + ', atsClaveFre =' + @campM2 + ', atsAAPrelim =' + @campM3 + ', atsMMPrelim = ' + @campM4 + ' , atsDDPrelim= ' + @campM5 + ', atsAAEst= ' + @campM6 + ' , atsMMEst= ' + @campM7 + ', atsDDEst=' + @campM8 + ', atsDecimales=' + @campM9 + ', atsClaveNota=' + @campM10 + ', atsClaveFT =' + @campM11 + ',atsClaveFuente=' +  @campM12 + ',atsClaveUnidad=' + @campM13 + ',atsTipo=''' + @campM14 + ''',atsAARev= ' + @campM16 + ',atsMMRev=' + @campM17 + ',atsDDRev=' + @campM18 + ',atsClaveAgrupaCob=''' + @campM19 + ''',atsClaveAgrupaClas=''' + @campM20 + ''',atsColMatriz=''' + @campM21 + ''',atsColMatrizIng=''' + @campM22 + ''',atsTipoGra=' + @campM23 + ',atsInicio= ' + @campM24 + ' ,atsTipoCua=''' + @campM25 +'''  where atsClaveSerie= ' + @mComen 
			set @cadSql='Delete from  PubV2.AtrSerie where atsClaveSerie= ' + @mComen 
			--set @cadSql ='delete from pre.AtrSerie where atsClaveSerie=' + @mComen
			--set @cadSqlM = 'insert into pre.AtrSerie (atsClaveSerie,atsClaveDescrip,atsClaveFre,atsAAPrelim,atsMMPrelim,atsDDPrelim,atsAAEst,atsMMEst,atsDDEst,atsDecimales,atsClaveNota,atsClaveFT,atsClaveFuente,atsClaveUnida,atsTipo,atsSalida,atsAARev,atsMMRev,atsDDRev,atsClaveAgrupaCob,atsClaveAgrupaClas,atsColMatriz,atsColMatrizIng,atsTipoGra,atsInicio,atsTipoCua) select atsClaveSerie,atsClaveDescrip,atsClaveFre,atsAAPrelim,atsMMPrelim,atsDDPrelim,atsAAEst,atsMMEst,atsDDEst,atsDecimales,atsClaveNota,atsClaveFT,atsClaveFuente,atsClaveUnida,atsTipo,atsSalida,atsAARev,atsMMRev,atsDDRev,atsClaveAgrupaCob,atsClaveAgrupaClas,atsColMatriz,atsColMatrizIng,atsTipoGra,atsInicio,atsTipoCua from man.AtrSerie where atsClaveSerie=' + @mComen 

		end
	end
end
if @mCto='Calendario'
begin
	--select @Row = COUNT(*)  from PubV2.Calendario with(nolock) where calClave= @mComen
	if EXISTS (select *  from PubV2.Calendario with(nolock) where calClave= @mComen)
	begin	set @Row=1	end
	if @Row=0
	Begin  set @banMsj='0' end
	else
	begin
		select top 1  @campM1=calTitulo, @campM2=calSubTitulo, @campM3=calCveNota, @campM4=calTituloIng, @campM5=calSubtituloIng  from PreV2.Calendario with(nolock) where calClave=@mComen
		select top 1  @campP1=calTitulo, @campP2=calSubTitulo, @campP3=calCveNota, @campP4=calTituloIng, @campP5=calSubtituloIng  from PubV2.Calendario with(nolock) where calClave=@mComen
		if @campM1= @campP1 and @campM2= @campP2 and @campM3= @campP3 and @campM4= @campP4  and @campM5= @campP5
		begin set @banMsj='F' end
		else 
		begin 
			set @banMsj='T' 
			--set @cadSql='update PreV2.Calendario set calTitulo=''' + @campM1 + ''', calSubTitulo=''' + @campM2 + ''', calCveNota=' + @campM3 + ', calTituloIng=''' + @campM4 + ''', calSubtituloIng=''' + @campM5 + '''   where calClave= ''' + @mComen  + ''
			set @cadSql='Delete from  PubV2.Calendario    where calClave= ''' + @mComen  + ''''
			--set @cadSql ='delete from pre.Calendario where calClave=' + @mComen
			--set @cadSqlM = 'insert into pre.Calendario (calClave,calTitulo,calSubTitulo,calCveNota,calTituloIng,calSubtituloIng) select calClave,calTitulo,calSubTitulo,calCveNota,calTituloIng,calSubtituloIng from man.calendario where calClave=' + @mComen 

		end
	end
end

if @mCto='CobGeo'
begin
	if EXISTS (select *  from PreV2.CobGeo with(nolock) where cgClave= @mComen)
	begin	set @Row=1	end
	--select @Row = COUNT(*)  from PubV2.CobGeo with(nolock) where cgClave= @mComen
	if @Row=0
	Begin  set @banMsj='0' end
	else
	begin
		select top 1  @campM1=cgDescrip, @campM2=cgDescripIng, @campM3=cgAbrevia, @campM4=cgAbreviaIng, @campM5=cgCveTipoCobGeo  from PreV2.CobGeo with(nolock) where cgClave=@mComen
		select top 1  @campP1=cgDescrip, @campP2=cgDescripIng, @campP3=cgAbrevia, @campP4=cgAbreviaIng, @campP5=cgCveTipoCobGeo  from PubV2.CobGeo with(nolock) where cgClave=@mComen
		if @campM1= @campP1 and @campM2= @campP2 and @campM3= @campP3 and @campM4= @campP4  and @campM5= @campP5
		begin set @banMsj='F' end
		else 
		begin 
			set @banMsj='T' 
			--set @cadSql='update PreV2.CobGeo set cgDescrip=''' + @campM1 + ''', cgDescripIng=''' + @campM2 + ''', cgAbrevia=''' + @campM3 + ''', cgAbreviaIng=''' + @campM4 + ''', cgCveTipoCobGeo=' + @campM5 +'  where cgClave= ''' + @mComen + ''
			set @cadSql='Delete from PubV2.CobGeo where  cgClave= ''' + @mComen + ''''
			--set @cadSql ='delete from pre.CobGeo where cgClave=' + @mComen
			--set @cadSqlM = 'insert into pre.CobGeo (cgClave,cgDescrip,cgDescriping,cgAbrevia,cgAbreviaing,cgCveTipoCobGeo) select cgClave,cgDescrip,cgDescriping,cgAbrevia,cgAbreviaing,cgCveTipoCobGeo from man.CobGeo where cgClave=' + @mComen 
		end
	end
end

if @mCto='CobTem'
begin
	if EXISTS (select *  from PubV2.CobTem with(nolock) where ctClave= @mComen)
	begin	set @Row=1	end
	--select @Row = COUNT(*)  from PubV2.CobTem with(nolock) where ctClave= @mComen
	if @Row=0
	Begin  set @banMsj='0' end
	else
	begin
		select top 1  @campM1=ctDescrip, @campM2=ctDescripIng  from PreV2.CobTem with(nolock) where ctClave=@mComen
		select top 1  @campP1=ctDescrip, @campP2=ctDescripIng  from PubV2.CobTem with(nolock) where ctClave=@mComen
		if @campM1= @campP1 and @campM2= @campP2
		begin set @banMsj='F' end
		else 
		begin 
			set @banMsj='T' 
			--set @cadSql='update PreV2.CobTem set ctDescrip=''' + @campM1 + ''', ctDescripIng=''' + @campM2 + '''  where cgClave= ' + @mComen 
			set @cadSql='Delete from  PubV2.CobTem  where ctClave= ' + @mComen 
			--set @cadSql ='delete from pre.CobTem where ctClave=' + @mComen
			--set @cadSqlM = 'insert into pre.CobTem (ctDescrip,ctDescripIng) select ctDescrip,ctDescripIng from man.CobTem where ctClave=' + @mComen 
		end
	end
end

if @mCto='Contacto'
begin
	--select @Row = COUNT(*)  from PubV2.Contacto with(nolock) where conClave= @mComen
	if EXISTS (select *  from PubV2.Contacto with(nolock) where conClave= @mComen)
	begin	set @Row=1	end
	if @Row=0
	Begin  set @banMsj='0' end
	else
	begin
		select top 1  @campM1=conNombre, @campM2=conPuesto, @campM3=conTelefono, @campM4=conCorreo, @campM5=conDomicilio  from PreV2.Contacto with(nolock) where conClave=@mComen
		select top 1  @campP1=conNombre, @campP2=conPuesto, @campP3=conTelefono, @campP4=conCorreo, @campP5=conDomicilio  from PubV2.Contacto with(nolock) where conClave=@mComen
		if @campM1= @campP1 and @campM2= @campP2 and @campM3= @campP3 and @campM4= @campP4 and @campM5= @campP5
		begin set @banMsj='F' end
		else 
		begin 
			set @banMsj='T' 
			--set @cadSql='update PreV2.Contacto set conNombre=''' + @campM1 + ''',conPuesto=''' +  @campM2 + ''',conTelefono=''' +  @campM3 + ''', conCorreo= ''' + @campM4 + ''', conDomicilio=''' + @campM5 + '''  where conClave= ' + @mComen 
			set @cadSql='Delete from  PubV2.Contacto where conClave= ' + @mComen 
			--set @cadSql ='delete from pre.Contacto where conClave=' + @mComen
			--set @cadSqlM = 'insert into pre.Contacto (conClave,conNombre,conPuesto,conTelefono,conCorreo,conDomicilio) select conClave,conNombre,conPuesto,conTelefono,conCorreo,conDomicilio from man.Contacto where conClave=' + @mComen 

		end
	end
end

if @mCto='DesgloseGeo'
begin
	--select @Row = COUNT(*)  from PubV2.DesgloseGeo with(nolock) where dgClave= @mComen
	if EXISTS (select * from PubV2.DesgloseGeo with(nolock) where dgClave= @mComen)
	begin	set @Row=1	end
	if @Row=0
	Begin  set @banMsj='0' end
	else
	begin
		select top 1  @campM1=dgCodigo, @campM2=dgCodigoing, @campM3=dgDescrip, @campM4=dgDescripIng, @campM5=dgNomImg, @campM6=dgNomImgIng   from PreV2.DesgloseGeo with(nolock) where dgClave=@mComen
		select top 1  @campP1=dgCodigo, @campP2=dgCodigoing, @campP3=dgDescrip, @campP4=dgDescripIng, @campP5=dgNomImg, @campP6=dgNomImgIng   from PubV2.DesgloseGeo with(nolock) where dgClave=@mComen
		if @campM1= @campP1 and @campM2= @campP2 and @campM3= @campP3 and @campM4= @campP4 and @campM5= @campP5
		begin set @banMsj='F' end
		else 
		begin 
			set @banMsj='T' 
			--set @cadSql='update PreV2.DesgloseGeo set dgCodigo=''' + @campM1 + ''',dgCodigoing=''' +  @campM2 + ''', dgDescrip=''' + @campM3 + ''', dgDescripIng=''' + @campM4 + ''', dgNomImg=''' + @campM5 + ''', dgNomImgIng=''' + @campM6 + '''   where dgClave= ' + @mComen 
			set @cadSql='Delete from  PubV2.DesgloseGeo   where dgClave= ' + @mComen 
			--set @cadSql ='delete from pre.DesgloseGeo where dgClave=' + @mComen
			--set @cadSqlM = 'insert into pre.DesgloseGeo (dgClave,dgCodigo,dgCodigoIng,dgconClave,conNombre,conPuesto,conTelefono,conCorreo,conDomicilio) select conClave,conNombre,conPuesto,conTelefono,conCorreo,conDomicilio from man.Contacto where conClave=' + @mComen 
		end
	end
end

if @mCto='Estatus'
begin
	--select @Row = COUNT(*)  from PubV2.Estatus with(nolock) where estClave= @mComen
	if EXISTS (select *  from PubV2.Estatus with(nolock) where estClave= @mComen)
	begin	set @Row=1	end
	if @Row=0
	Begin  set @banMsj='0' end
	else
	begin
		select top 1  @campM1=estDescrip, @campM2=estNomImg, @campM3=estDescripIng, @campM4=estColor   from PreV2.Estatus with(nolock) where estClave=@mComen
		select top 1  @campP1=estDescrip, @campP2=estNomImg, @campP3=estDescripIng, @campP4=estColor   from PubV2.Estatus with(nolock) where estClave=@mComen
		if @campM1= @campP1 and @campM2= @campP2 and @campM3= @campP3 and @campM4= @campP4
		begin set @banMsj='F' end
		else 
		begin 
			set @banMsj='T' 
			--set @cadSql='update PreV2.Estatus set estDescrip=''' + @campM1 + ''',estNomImg=''' +  @campM2 + ''', estDescripIng=''' + @campM3 + ''', estColor=''' + @campM4 + '''   where estClave= ' + @mComen 
			set @cadSql='Delete from PubV2.Estatus   where estClave= ' + @mComen 
		end
	end
end

if @mCto='FecAct'
begin
	--select @Row = COUNT(*)  from PubV2.FecAct with(nolock)  where faClave= @mComen
	if EXISTS (select * from PubV2.FecAct with(nolock)  where faClave= @mComen)
	begin	set @Row=1	end
	if @Row=0
	Begin  set @banMsj='0' end
	else
	begin
		select top 1  @campM1=faDescrip  from PreV2.FecAct with(nolock) where faClave=@mComen
		select top 1  @campP1=faDescrip  from PubV2.FecAct with(nolock) where faClave=@mComen
		if @campM1= @campP1 
		begin set @banMsj='F' end
		else 
		begin 
			set @banMsj='T' 
			--set @cadSql='update PreV2.FecAct set faDescrip=''' + @campM1 + '''   where faClave= ' + @mComen 
			set @cadSql='Delete from PubV2.FecAct  where faClave= ' + @mComen 
		end
	end
end

if @mCto='FichaTecnica'
begin
	--select @Row = COUNT(*)  from PubV2.FichaTecnica with(nolock)  where ftClave= @mComen
	if EXISTS (select *  from PubV2.FichaTecnica with(nolock)  where ftClave= @mComen)
	begin	set @Row=1	end
	if @Row=0
	Begin  set @banMsj='0' end
	else
	begin
		select top 1  @campM1=ftDefinicion,@campM2=ftAlgoritmo,@campM3=ftUnidad,@campM4=ftImportancia,@campM5=ftCobGeo,@campM6=ftPeriodo,@campM7=ftFecEsp,@campM8=ftObs,@campM9=ftDefinicionIng,@campM10=ftImportanciaIng,@campM11=ftObsIng,@campM12=ftFecEspIng,@campM13=ftDescripCal,@campM14=ftDescripCalIng,@campM15=ftOportunidad,@campM16=ftOportunidadIng,@campM17=ftCobGeoft  from PreV2.FichaTecnica with(nolock) where ftClave=@mComen
		select top 1  @campP1=ftDefinicion,@campP2=ftAlgoritmo,@campP3=ftUnidad,@campP4=ftImportancia,@campP5=ftCobGeo,@campP6=ftPeriodo,@campP7=ftFecEsp,@campP8=ftObs,@campP9=ftDefinicionIng,@campP10=ftImportanciaIng,@campP11=ftObsIng,@campP12=ftFecEspIng,@campP13=ftDescripCal,@campP14=ftDescripCalIng,@campP15=ftOportunidad,@campP16=ftOportunidadIng,@campP17=ftCobGeoft  from PubV2.FichaTecnica with(nolock) where ftClave=@mComen
		if @campM1= @campP1 and @campM2= @campP2 and @campM3= @campP3 and @campM4= @campP4 and @campM5= @campP5 and @campM6= @campP6 and @campM7= @campP7 and @campM8= @campP8 and @campM9= @campP9 and @campM10= @campP10 and @campM11= @campP11 and @campM12= @campP12 and @campM13= @campP13 and @campM14= @campP14 and @campM15= @campP15 and @campM16= @campP16 and @campM17= @campP17 
		begin set @banMsj='F' end
		else 
		begin 
			set @banMsj='T' 
			--set @cadSql='update PreV2.FichaTecnica set ftDefinicion=''' + @campM1 + ''',ftAlgoritmo=''' + @campM2 + ''',ftUnidad=' + @campM3 + ',ftImportancia=''' + @campM4 + ''',ftCobGeo=''' + @campM5 + ''',ftPeriodo=' + @campM6 + ',ftFecEsp=''' + @campM7 + ''',ftObs=''' + @campM8 + ''',ftDefinicionIng=''' + @campM9 + ''',ftImportanciaIng=''' + @campM10 + ''',ftObsIng=''' + @campM11 + ''',ftFecEspIng=''' + @campM12 + ''',ftDescripCal=''' + @campM13 + ''',ftDescripCalIng=''' + @campM14 + ''',ftOportunidad=''' + @campM15 + ''',ftOportunidadIng=''' + @campM16 + ''',ftCobGeoft=' + @campM17 +'   where ftClave= ' + @mComen 
			set @cadSql='Delete from PubV2.FichaTecnica where ftClave= ' + @mComen 
		end
	end
end

if @mCto='Frecuencia'
begin
	--select @Row = COUNT(*)  from PubV2.Frecuencia with(nolock)  where freClave= @mComen
	if EXISTS (select *  from PubV2.Frecuencia with(nolock)  where freClave= @mComen)
	begin	set @Row=1	end
	if @Row=0
	Begin  set @banMsj='0' end
	else
	begin
		select top 1  @campM1=freDescrip,@campM2=freCodigo,@campM3=freNumAA,@campM4=freNumMM,@campM5=freNumQQ,@campM6=freTipo,@campM7=freDescripIng from PreV2.Frecuencia with(nolock) where freClave=@mComen
		select top 1  @campP1=freDescrip,@campP2=freCodigo,@campP3=freNumAA,@campP4=freNumMM,@campP5=freNumQQ,@campP6=freTipo,@campP7=freDescripIng from PubV2.Frecuencia with(nolock) where freClave=@mComen
		if @campM1= @campP1 and @campM2= @campP2 and @campM3= @campP3 and @campM4= @campP4 and @campM5= @campP5 and @campM6= @campP6 and @campM7= @campP7
		begin set @banMsj='F' end
		else 
		begin 
			set @banMsj='T' 
			--set @cadSql='update PreV2.Frecuencia set freDescrip=''' + @campM1 + ''',freCodigo=''' + @campM2 + ''',freNumAA= ' + @campM3 + ',freNumMM= ' + @campM4 + ',freNumQQ= ' + @campM5 + ',freTipo=''' + @campM6 + ''',freDescripIng=''' + @campM7 +''' where freClave= ' + @mComen 
			set @cadSql='Delete from PubV2.Frecuencia  where freClave= ' + @mComen 
		end
	end
end

if @mCto='FTCob'
begin
	--select @Row = COUNT(*)  from PubV2.FTCob with(nolock)  where fcgClave= @mComen
	if EXISTS (select *  from PubV2.FTCob with(nolock)  where fcgClave= @mComen)
	begin	set @Row=1	end
	if @Row=0
	Begin  set @banMsj='0' end
	else
	begin
		select top 1  @campM1=fcgDescrip,@campM2=fcgDescripIng,@campM3=fcgAbrevia,@campM4=fcgAbreviaIng from PreV2.FTCob with(nolock) where fcgClave=@mComen
		select top 1  @campP1=fcgDescrip,@campP2=fcgDescripIng,@campP3=fcgAbrevia,@campP4=fcgAbreviaIng from PubV2.FTCob with(nolock) where fcgClave=@mComen
		if @campM1= @campP1 and @campM2= @campP2 and @campM3= @campP3 and @campM4= @campP4 
		begin set @banMsj='F' end
		else 
		begin 
			set @banMsj='T' 
			--set @cadSql='update PreV2.FTCob set fcgDescrip=''' + @campM1 + ''',fcgDescripIng=''' + @campM2 + ''',fcgAbrevia=''' + @campM3 + ''',fcgAbreviaIng=''' + @campM4 + ''' where fcgClave= ' + @mComen 
			set @cadSql='Delete from PubV2.FTCob  where fcgClave= ' + @mComen 
		end
	end
end

if @mCto='Fuentes'
begin
	--select @Row = COUNT(*)  from PubV2.Fuentes with(nolock)  where fueClave= @mComen
	if EXISTS (select *  from PubV2.Fuentes with(nolock)  where fueClave= @mComen)
	begin	set @Row=1	end
	if @Row=0
	Begin  set @banMsj='0' end
	else
	begin
		select top 1  @campM1=fueDescrip,@campM2=fueDescripIng from PreV2.Fuentes with(nolock) where fueClave=@mComen
		select top 1  @campP1=fueDescrip,@campP2=fueDescripIng from PubV2.Fuentes with(nolock) where fueClave=@mComen
		if @campM1= @campP1 and @campM2= @campP2
		begin set @banMsj='F' end
		else 
		begin 
			set @banMsj='T' 
			--set @cadSql='update PreV2.Fuentes set fueDescrip=''' + @campM1 + ''',fueDescripIng=''' + @campM2 + ''' where fueClave= ' + @mComen 
			set @cadSql='Delete from PubV2.Fuentes  where fueClave= ' + @mComen 
		end
	end
end

if @mCto='Grafica'
begin
	--select @Row = COUNT(*)  from PubV2.Grafica with(nolock)  where graClave= @mComen
	if EXISTS (select * from PubV2.Grafica with(nolock)  where graClave= @mComen)
	begin	set @Row=1	end
	if @Row=0
	Begin  set @banMsj='0' end
	else
	begin
		select top 1  @campM1=graDescrip,@campM2=graDescripIng,@campM3=graAbrevia,@campM4=graAbreviaIng from PreV2.Grafica with(nolock) where graClave=@mComen
		select top 1  @campP1=graDescrip,@campP2=graDescripIng,@campP3=graAbrevia,@campP4=graAbreviaIng from PubV2.Grafica with(nolock) where graClave=@mComen
		if @campM1= @campP1 and @campM2= @campP2 and @campM3= @campP3 and @campM4= @campP4
		begin set @banMsj='F' end
		else 
		begin 
			set @banMsj='T' 
			--set @cadSql='update PreV2.Grafica set graDescrip=''' + @campM1 + ''',graDescripIng=''' + @campM2 + ''',graAbrevia=''' + @campM3 + ''',graAbreviaIng=''' + @campM4 + ''' where graClave= ' + @mComen 
			set @cadSql='Delete from PubV2.Grafica  where graClave= ' + @mComen 
		end
	end
end

if @mCto='Grupo'
begin
	--select @Row = COUNT(*)  from PubV2.Grupo with(nolock)  where gpoClave= @mComen
	if EXISTS (select *  from PubV2.Grupo with(nolock)  where gpoClave= @mComen)
	begin	set @Row=1	end
	if @Row=0
	Begin  set @banMsj='0' end
	else
	begin
		select top 1  @campM1=gpoDescrip,@campM2=gpoDescripIng,@campM3=gpoAlias,@campM4=gpoAliasIng from PreV2.Grupo with(nolock) where gpoClave=@mComen
		select top 1  @campP1=gpoDescrip,@campP2=gpoDescripIng,@campP3=gpoAlias,@campP4=gpoAliasIng from PubV2.Grupo with(nolock) where gpoClave=@mComen
		if @campM1= @campP1 and @campM2= @campP2 and @campM3= @campP3 and @campM4= @campP4
		begin set @banMsj='F' end
		else 
		begin 
			set @banMsj='T' 
			--set @cadSql='update PreV2.Grupo set gpoDescrip=''' + @campM1 + ''',gpoDescripIng=''' + @campM2 + ''',gpoAlias=''' + @campM3 + ''',gpoAliasIng=''' + @campM4 + ''' where gpoClave= ' + @mComen 
			set @cadSql='Delete from PubV2.Grupo  where gpoClave= ' + @mComen 
		end
	end
end

if @mCto='Institucion'
begin
	--select @Row = COUNT(*)  from PubV2.Institucion with(nolock)  where insClave= @mComen
	if EXISTS (select *  from PubV2.Institucion with(nolock)  where insClave= @mComen)
	begin	set @Row=1	end
	if @Row=0
	Begin  set @banMsj='0' end
	else
	begin
		select top 1  @campM1=insDescrip,@campM2=insDescripIng,@campM3=insAbrevia,@campM4=insAbreviaIng,@campM5=insURL from PreV2.Institucion with(nolock) where insClave=@mComen
		select top 1  @campP1=insDescrip,@campP2=insDescripIng,@campP3=insAbrevia,@campP4=insAbreviaIng,@campP5=insURL from PubV2.Institucion with(nolock) where insClave=@mComen
		if @campM1= @campP1 and @campM2= @campP2 and @campM3= @campP3 and @campM4= @campP4 and @campM5= @campP5
		begin set @banMsj='F' end
		else 
		begin 
			set @banMsj='T' 
			--set @cadSql='update PreV2.Institucion set insDescrip=''' + @campM1 + ''',insDescripIng=''' + @campM2 + ''',insAbrevia=''' + @campM3 + ''',insAbreviaIng=''' + @campM4 + ''',insURL=''' + @campM5 + ''' where insClave= ' + @mComen 
			set @cadSql='Delete from PubV2.Institucion  where insClave= ' + @mComen 
		end
	end
end

if @mCto='Metadato'
begin
	--select @Row = COUNT(*)  from PubV2.Metadato with(nolock)  where metClave= @mComen
	if EXISTS (select * from PubV2.Metadato with(nolock)  where metClave= @mComen)
	begin	set @Row=1	end
	if @Row=0
	Begin  set @banMsj='0' end
	else
	begin
		select top 1  @campM1=metDescrip,@campM2=metDescripIng from PreV2.Metadato with(nolock) where metClave=@mComen
		select top 1  @campP1=metDescrip,@campP2=metDescripIng from PubV2.Metadato with(nolock) where metClave=@mComen
		if @campM1= @campP1 and @campM2= @campP2
		begin set @banMsj='F' end
		else 
		begin 
			set @banMsj='T' 
			--set @cadSql='update PreV2.Metadato set metDescrip=''' + @campM1 + ''',metDescripIng=''' + @campM2 + ''' where metClave= ' + @mComen 
			set @cadSql='Delete from PubV2.Metadato  where metClave= ' + @mComen 
		end
	end
end

if @mCto='NoDato'
begin
	--select @Row = COUNT(*)  from PubV2.NoDato with(nolock)  where ndClave= @mComen
	if EXISTS (select *  from PubV2.NoDato with(nolock)  where ndClave= @mComen)
	begin	set @Row=1	end
	if @Row=0
	Begin  set @banMsj='0' end
	else
	begin
		select top 1  @campM1=ndCodigo,@campM2=ndDescrip,@campM3=ndDescripIng,@campM4=ndCodigoIng,@campM5=ndCodigoMapa from PreV2.Nodato with(nolock) where ndClave=@mComen
		select top 1  @campP1=ndCodigo,@campP2=ndDescrip,@campP3=ndDescripIng,@campP4=ndCodigoIng,@campP5=ndCodigoMapa from PubV2.Nodato with(nolock) where ndClave=@mComen
		if @campM1= @campP1 and @campM2= @campP2 and @campM3= @campP3 and @campM4= @campP4 and @campM5= @campP5
		begin set @banMsj='F' end
		else 
		begin 
			set @banMsj='T' 
			--set @cadSql='update PreV2.NoDato set ndCodigo=''' + @campM1 + ''',ndDescrip=''' + @campM2 + ''',ndDescripIng=''' + @campM3 + ''',ndCodigoIng=''' + @campM4 + ''',ndCodigoMapa=' + @campM5 + ' where ndClave= ' + @mComen 
			set @cadSql='Delete from PubV2.NoDato  where ndClave= ' + @mComen 
		end
	end
end

if @mCto='Notas'
begin
	--select @Row = COUNT(*)  from PubV2.Notas with(nolock)  where notClave= @mComen
	if EXISTS (select *  from PubV2.Notas with(nolock)  where notClave= @mComen)
	begin	set @Row=1	end
	if @Row=0
	Begin  set @banMsj='0' end
	else
	begin
		select top 1  @campM1=notNota,@campM2=notNotaIng from PreV2.Notas with(nolock) where notClave=@mComen
		select top 1  @campP1=notNota,@campP2=notNotaIng from PubV2.Notas with(nolock) where notClave=@mComen
		if @campM1= @campP1 and @campM2= @campP2 
		begin set @banMsj='F' end
		else 
		begin 
			set @banMsj='T' 
			--set @cadSql='update PreV2.Notas set notNota=''' + @campM1 + ''',notNotaIng=''' + @campM2 + ''' where notClave= ' + @mComen 
			set @cadSql='Delete from PubV2.Notas  where notClave= ' + @mComen 
		end
	end
end

if @mCto='Periodo'
begin
	--select @Row = COUNT(*)  from PubV2.Periodo with(nolock)  where perClave= @mComen
	if EXISTS (select *  from PubV2.Periodo with(nolock)  where perClave= @mComen)
	begin	set @Row=1	end
	if @Row=0
	Begin  set @banMsj='0' end
	else
	begin
		select top 1  @campM1=perDescrip,@campM2=perDescripIng,@campM3=perAbrevia,@campM4=perAbreviaIng  from PreV2.Periodo with(nolock) where perClave=@mComen
		select top 1  @campP1=perDescrip,@campP2=perDescripIng,@campP3=perAbrevia,@campP4=perAbreviaIng  from PubV2.Periodo with(nolock) where perClave=@mComen
		if @campM1= @campP1 and @campM2= @campP2 and @campM3= @campP3 and @campM4= @campP4 
		begin set @banMsj='F' end
		else 
		begin 
			set @banMsj='T' 
			--set @cadSql='update PreV2.Periodo set perDescrip=''' + @campM1 + ''',perDescripIng=''' + @campM2 + ''',perAbrevia=''' + @campM3 + ''',perAbreviaIng=''' + @campM4 + ''' where perClave= ' + @mComen 
			set @cadSql='Delete from PubV2.Periodo  where perClave= ' + @mComen 
		end
	end
end

if @mCto='RefInter'
begin
	--select @Row = COUNT(*)  from PubV2.RefInter with(nolock)  where riClave= @mComen
	if EXISTS (select *  from PubV2.RefInter with(nolock)  where riClave= @mComen)
	begin	set @Row=1	end
	if @Row=0
	Begin  set @banMsj='0' end
	else
	begin
		select top 1  @campM1=riDescrip,@campM2=riDescripIng  from PreV2.RefInter with(nolock) where riClave=@mComen
		select top 1  @campP1=riDescrip,@campP2=riDescripIng  from PubV2.RefInter with(nolock) where riClave=@mComen
		if @campM1= @campP1 and @campM2= @campP2
		begin set @banMsj='F' end
		else 
		begin 
			set @banMsj='T' 
			--set @cadSql='update PreV2.RefInter set riDescrip=''' + @campM1 + ''',riDescripIng=''' + @campM2 + ''' where riClave= ' + @mComen 
			set @cadSql='Delete from PubV2.RefInter  where riClave= ' + @mComen 
		end
	end
end

if @mCto='Temas'
begin
	--select @Row = COUNT(*)  from PubV2.Temas with(nolock)  where temClave= @mComen
	if EXISTS (select *  from PubV2.Temas with(nolock)  where temClave= @mComen)
	begin	set @Row=1	end
	if @Row=0
	Begin  set @banMsj='0' end
	else
	begin
		select top 1  @campM1=temDescrip,@campM2=temDescripIng,@campM3=temClaveMet   from PreV2.Temas with(nolock) where temClave=@mComen
		select top 1  @campP1=temDescrip,@campP2=temDescripIng,@campP3=temClaveMet   from PubV2.Temas with(nolock) where temClave=@mComen
		if @campM1= @campP1 and @campM2= @campP2  and @campM3= @campP3
		begin set @banMsj='F' end
		else 
		begin 
			set @banMsj='T' 
			--set @cadSql='update PreV2.Temas set temDescrip=''' + @campM1 + ''',temDescripIng=''' + @campM2 + ''',temClaveMet= ' + @campM3 + ' where temClave= ''' + @mComen + '' 
			set @cadSql='Delete from PubV2.Temas  where temClave= ''' + @mComen + '''' 
		end
	end
end

if @mCto='TipoCobGeo'
begin
	--select @Row = COUNT(*)  from PubV2.TipoCobGeo with(nolock)  where tcgClave= @mComen
	if EXISTS (select *  from PubV2.TipoCobGeo with(nolock)  where tcgClave= @mComen)
	begin	set @Row=1	end
	if @Row=0
	Begin  set @banMsj='0' end
	else
	begin
		select top 1  @campM1=tcgDescrip,@campM2=tcgDescripIng,@campM3=tcgCveApiMapa,@campM4=tcgCodigo,@campM5=tcgCodigoIng   from PreV2.TipoCobGeo with(nolock) where tcgClave=@mComen
		select top 1  @campP1=tcgDescrip,@campP2=tcgDescripIng,@campP3=tcgCveApiMapa,@campP4=tcgCodigo,@campP5=tcgCodigoIng   from PubV2.TipoCobGeo with(nolock) where tcgClave=@mComen
		if @campM1= @campP1 and @campM2= @campP2  and @campM3= @campP3 and @campM4= @campP4 and @campM5= @campP5
		begin set @banMsj='F' end
		else 
		begin 
			set @banMsj='T' 
			--set @cadSql='update PreV2.TipoCobGeo set tcgDescrip=''' + @campM1 + ''',tcgDescripIng=''' + @campM2 + ''', tcgCveApiMapa= ''' + @campM3 + ''',tcgCodigo=''' + @campM4 + ''',tcgCodigoing=''' + @campM5 + ''' where tcgClave= ' + @mComen
			set @cadSql='Delete from PubV2.TipoCobGeo  where tcgClave= ' + @mComen
		end
	end
end

if @mCto='TipoIndicador'
begin
	--select @Row = COUNT(*)  from PubV2.TipoIndicador with(nolock)  where tatrCve= @mComen
	if EXISTS (select *  from PubV2.TipoIndicador with(nolock)  where tatrCve= @mComen)
	begin	set @Row=1	end
	if @Row=0
	Begin  set @banMsj='0' end
	else
	begin
		select top 1  @campM1=tatrDescripP,@campM2=tatrDescripS,@campM3=tatrInforme,@campM4=tatrDescripPIng,@campM5=tatrDescripSIng,@campM6=tatrInformeIng   from PreV2.TipoIndicador with(nolock) where tatrCve=@mComen
		select top 1  @campP1=tatrDescripP,@campP2=tatrDescripS,@campP3=tatrInforme,@campP4=tatrDescripPIng,@campP5=tatrDescripSIng,@campP6=tatrInformeIng   from PubV2.TipoIndicador with(nolock) where tatrCve=@mComen
		if @campM1= @campP1 and @campM2= @campP2  and @campM3= @campP3 and @campM4= @campP4 and @campM5= @campP5 and @campM6= @campP6
		begin set @banMsj='F' end
		else 
		begin 
			set @banMsj='T' 
			--set @cadSql='update PreV2.TipoIndicador set tatrDescripP=''' + @campM1 + ''',tatrDescripS=''' + @campM2 + ''', tatrInforme= ''' + @campM3 + ''',tatrDescripPIng=''' + @campM4 + ''',tatrDescripSIng=''' + @campM5 + ''',tatrInformeIng=''' + @campM6 + ''' where tatrCve= ''' + @mComen  + ''
			set @cadSql='Delete from PubV2.TipoIndicador  where tatrCve= ''' + @mComen  + ''''
		end
	end
end


if @mCto='Unidad'
begin
	--select @Row = COUNT(*)  from PubV2.Unidad with(nolock)  where uniClave= @mComen
	if EXISTS (select * from PubV2.Unidad with(nolock)  where uniClave= @mComen)
	begin	set @Row=1	end
	if @Row=0
	Begin  set @banMsj='0' end
	else
	begin
		select top 1  @campM1=uniDescrip,@campM2=uniDescripIng,@campM3=uniAbrevia,@campM4=uniAbreviaIng   from PreV2.Unidad with(nolock) where uniClave=@mComen
		select top 1  @campP1=uniDescrip,@campP2=uniDescripIng,@campP3=uniAbrevia,@campP4=uniAbreviaIng   from PubV2.Unidad with(nolock) where uniClave=@mComen
		if @campM1= @campP1 and @campM2= @campP2  and @campM3= @campP3 and @campM4= @campP4
		begin set @banMsj='F' end
		else 
		begin 
			set @banMsj='T' 
			--set @cadSql='update PreV2.Unidad set uniDescrip=''' + @campM1 + ''',uniDescripIng=''' + @campM2 + ''', uniAbrevia= ''' + @campM3 + ''',uniAbreviaIng=''' + @campM4 + ''' where uniClave= ' + @mComen 
			set @cadSql='Delete from PubV2.Unidad  where uniClave= ' + @mComen 
		end
	end
end

if @mCto='Usuarios'
begin
	--select @Row = COUNT(*)  from PubV2.Usuarios with(nolock)  where usuClave= @mComen
	if EXISTS (	select *  from PubV2.Usuarios with(nolock)  where usuClave= @mComen)
	begin	set @Row=1	end
	if @Row=0
	Begin  set @banMsj='0' end
	else
	begin
		select top 1  @campM1=usuContraseña,@campM2=usuNombre,@campM3=usuTipo,@campM4=usuClaveDep,@campM5=usuCargo   from PreV2.Usuarios with(nolock) where usuClave=@mComen
		select top 1  @campP1=usuContraseña,@campP2=usuNombre,@campP3=usuTipo,@campP4=usuClaveDep,@campP5=usuCargo   from PubV2.Usuarios with(nolock) where usuClave=@mComen
		if @campM1= @campP1 and @campM2= @campP2  and @campM3= @campP3 and @campM4= @campP4 and @campM5= @campP5
		begin set @banMsj='F' end
		else 
		begin 
			set @banMsj='T' 
			--set @cadSql='update PreV2.Usuarios set usuContraseña=''' + @campM1 + ''',usuNombre=''' + @campM2 + ''', usuTipo=''' + @campM3 + ''',usuClaveDep=' + @campM4 + ',usuCargo=''' + @campM5 + ''' where usuClave= ''' + @mComen + '' 
			set @cadSql='Delete from PubV2.Usuarios  where usuClave= ''' + @mComen + ''''
		end
	end
end

--if @mCto='Enlace' or @mCto='EnlaceIng' or @mCto='Lexico' or @mCto='LexicoIng'
--begin
	
--    select @Posicion =   patindex('%Values%' ,@mSql)
--    set @cad1 = @mSql
--    SELECT @cad1= stuff(@cad1, 1, @Posicion, '')--20,2,6)
--    select @Posicion =  patindex('%(%' ,@cad1)
--    SELECT @cad1= stuff(@cad1, 1, @Posicion, '')--20,2,6)
--    --select @Posicion2 =   patindex('%,%' ,@cad1)
--     if @mCto='Enlace' or @mCto='EnlaceIng'
--    begin
--		select @Posicion2 =  patindex('%,%' ,@cad1)
--    end
--    set @posA=1
--    if @mCto='Lexico' or @mCto='LexicoIng'
--    begin
--		WHILE CHARINDEX(',', @cad1, @posA)>0
--		BEGIN
--			SET @Posicion2=CHARINDEX(',', @cad1, @posA)
--			SET @posA=@Posicion2+1
--			print @posA
--		END
	
--		--select @Posicion2 =  patindex('%,%' ,@cad1)
--    end 
--    select @cadPal = left(@cad1, @Posicion2 -1)--clave palabra
--    SELECT @cad1= stuff(@cad1, 1, @Posicion2, '')
--    select @cadDes = left(@cad1, LEN (@cad1)-1)--clave descripcion
--    print @cadPal + ' - ' +  @cadDes
--    if @mCto ='Enlace'
--    begin
--		if EXISTS (select *  from PubV2.Enlace with(nolock)  where enlClavePalabra= @cadPal and enlClaveDescrip = @cadDes )
--		begin	set @Row=1	end
--		--select @Row = COUNT(*)  from PubV2.Enlace with(nolock)  where enlClavePalabra= @cadPal and enlClaveDescrip = @cadDes 
--		--set @cadSql='update pre.Enlace set enlClaveDescrip=' + @cadDes  + ' where enlClavePalabra= ' + @cadPal 
--	end
--	if @mCto ='EnlaceIng'
--	begin
--		if EXISTS (select * from PubV2.EnlaceIng with(nolock)  where enlClavePalabraIng= @cadPal and enlClaveDescripIng = @cadDes  )
--		begin	set @Row=1	end
--		--select @Row = COUNT(*)  from PubV2.EnlaceIng with(nolock)  where enlClavePalabraIng= @cadPal and enlClaveDescripIng = @cadDes 
--		--set @cadSql='update pre.EnlaceIng set enlClaveDescripIng=' + @cadDes  + ' where enlClavePalabraIng= ' + @cadPal 
--	end
--	if @mCto ='Lexico'
--	begin
--		if EXISTS (select * from pubV2.Lexico with(nolock)  where lexClavePalabra = @cadDes) --lexPalabra= @cadPal and   )
--		begin	set @Row=1	end
--		--select @Row = COUNT(*)  from PubV2.Lexico with(nolock)  where lexClavePalabra = @cadDes --lexPalabra= @cadPal and 
--		--set @cadSql='update PreV2.Lexico set lexPalabra=' + @cadPal  + ' where lexClavePalabra= ' + @cadDes 
--		set @cadSql='Delete from PubV2.Lexico  where lexClavePalabra= ' + @cadDes 
		
--	end
--	if @mCto ='LexicoIng'
--	begin
--		if EXISTS (select *  from pubV2.LexicoIng with(nolock)  where lexClavePalabraIng = @cadDes ) --lexPalabra= @cadPal and   )
--		begin	set @Row=1	end
--		--select @Row = COUNT(*)  from PubV2.LexicoIng with(nolock)  where lexClavePalabraIng = @cadDes --lexPalabraIng= @cadPal and 
--		--set @cadSql='update PreV2.LexicoIng set lexPalabraIng=' + @cadPal  + ' where lexClavePalabraIng= ' + @cadDes 
--		set @cadSql='Delete from  PubV2.LexicoIng  where lexClavePalabraIng= ' + @cadDes 
--	end
--	if @Row=0
--	Begin  set @banMsj='0' end
--	else
--	begin  
--		set @banMsj='F'
--		--if @mCto ='Enlace'
--		--begin
--		--	select top 1  @campM1=enlClaveDescrip  from man.Enlace where enlClavePalabra= @cadPal
--		--	select top 1  @campP1=enlClaveDescrip  from pre.Enlace where enlClavePalabra= @cadPal
--		--end
--		--if @mCto ='EnlaceIng'
--		--begin
--		--	select top 1  @campM1=enlClaveDescripIng  from man.EnlaceIng where enlClavePalabraIng= @cadPal
--		--	select top 1  @campP1=enlClaveDescripIng  from pre.EnlaceIng where enlClavePalabraIng= @cadPal
--		--end
--		if @mCto <> 'Enlace' and  @mCto <> 'EnlaceIng'
--		begin
--			if @mCto ='Lexico'
--			begin
--				select top 1  @campM1=lexPalabra  from PreV2.Lexico with(nolock) where  lexClavePalabra = @cadDes
--				select top 1  @campP1=lexPalabra  from PubV2.Lexico with(nolock) where  lexClavePalabra = @cadDes
--			end
--			if @mCto ='LexicoIng'
--			begin
--				select top 1  @campM1=lexPalabraIng  from PreV2.LexicoIng with(nolock) where  lexClavePalabraIng = @cadDes
--				select top 1  @campP1=lexPalabraIng  from PubV2.LexicoIng with(nolock) where  lexClavePalabraIng = @cadDes
--			end
--			if @campM1= @campP1
--			begin	set @banMsj='F'	end
--			else
--			begin
--				set @banMsj='T'
--		 	end
--	 	end
--	 end
--end

if @mCto='EnlacePCve' or @mCto='EnlacePcveIng' or @mCto='LexicoPCve' or @mCto='LexicoPCveIng' or @mCto='EnlIndPCve' 
begin
	
	select @Posicion =   patindex('%Values%' ,@mSql)
	set @cad1 = @mSql
	SELECT @cad1= stuff(@cad1, 1, @Posicion, '')--20,2,6)
	select @Posicion =  patindex('%(%' ,@cad1)
	SELECT @cad1= stuff(@cad1, 1, @Posicion, '')--20,2,6)
   -- select @Posicion2 =   patindex('%,%' ,@cad1)
	 if @mCto='EnlacePCve' or @mCto='EnlacePCveIng' or @mCto='EnlIndPCve'
	begin
		select @Posicion2 =  patindex('%,%' ,@cad1)
	end
	set @posA=1
	if @mCto='LexicoPCve' or @mCto='LexicoPCveIng'
	begin
		WHILE CHARINDEX(',', @cad1, @posA)>0
		BEGIN
			SET @Posicion2=CHARINDEX(',', @cad1, @posA)
			SET @posA=@Posicion2+1
			print @posA
		END
	
		--select @Posicion2 =  patindex('%,%' ,@cad1)
	end 
	select @cadPal = left(@cad1, @Posicion2 -1)--clave palabra
	SELECT @cad1= stuff(@cad1, 1, @Posicion2, '')
	select @cadDes = left(@cad1, LEN (@cad1)-1)--clave descripcion
	print @cadPal + ' - ' +  @cadDes
	if @mCto ='EnlIndPCve'
	begin
		if EXISTS (select * from PubV2.EnlIndPCve with(nolock)  where eipcCveInd= @cadPal and eipcCveDesPCve = @cadDes  ) 
		begin	set @Row=1	end
		--select @Row = COUNT(*)  from PreV2.EnlacePCve with(nolock)  where epcCvePCve= @cadPal and epcCveDesPCve = @cadDes 
		--set @cadSql='update pre.Enlace set enlClaveDescrip=' + @cadDes  + ' where enlClavePalabra= ' + @cadPal 
	end
	if @mCto ='EnlacePCve'
	begin
		if EXISTS (select * from PubV2.EnlacePCve with(nolock)  where epcCvePCve= @cadPal and epcCveDesPCve = @cadDes  ) 
		begin	set @Row=1	end
		--select @Row = COUNT(*)  from PreV2.EnlacePCve with(nolock)  where epcCvePCve= @cadPal and epcCveDesPCve = @cadDes 
		--set @cadSql='update pre.Enlace set enlClaveDescrip=' + @cadDes  + ' where enlClavePalabra= ' + @cadPal 
	end
	if @mCto ='EnlacePCveIng'
	begin
		if EXISTS (select * from PubV2.EnlacePCveIng with(nolock)  where epcCvePCveIng= @cadPal and epcCveDesPCveIng = @cadDes  ) 
		begin	set @Row=1	end
		--select @Row = COUNT(*)  from PreV2.EnlacePCveIng with(nolock)  where epciCvePCveIng= @cadPal and epciCvePCveIng = @cadDes 
		--set @cadSql='update pre.EnlaceIng set enlClaveDescripIng=' + @cadDes  + ' where enlClavePalabraIng= ' + @cadPal 
	end
	if @mCto ='LexicoPCve'
	begin
		if EXISTS (select *  from pubV2.LexicoPCve with(nolock)  where lpcClavePalCve = @cadDes) 
		begin	set @Row=1	end
		--select @Row = COUNT(*)  from preV2.LexicoPCve with(nolock)  where lpcClavePalCve = @cadDes --lexPalabra= @cadPal and 
		--set @cadSql='update PreV2.Lexico set lexPalabra=' + @cadPal  + ' where lexClavePalabra= ' + @cadDes 
		set @cadSql='Delete from PubV2.LexicoPCve  where lpcClavePalCve= ' + @cadDes 
		
	end
	if @mCto ='LexicoPCveIng'
	begin
		if EXISTS (select *  from pubV2.LexicoPCveIng with(nolock)  where lpcClavePalCveIng = @cadDes)	
		begin	set @Row=1	end
		--select @Row = COUNT(*)  from preV2.LexicoPCveIng with(nolock)  where lpciClavePalCveIng = @cadDes --lexPalabraIng= @cadPal and 
		--set @cadSql='update PreV2.LexicoIng set lexPalabraIng=' + @cadPal  + ' where lexClavePalabraIng= ' + @cadDes 
		set @cadSql='Delete from  PubV2.LexicoPCveIng  where lpcClavePalCveIng= ' + @cadDes 
	end
	if @Row=0
	Begin  set @banMsj='0' end
	else
	begin  
		set @banMsj='F'
		if @mCto <> 'EnlacePCve' and  @mCto <> 'EnlacePCveIng' and @mCto<>'EnlIndPCve'
		begin
			if @mCto ='LexicoPCve'
			begin
				select top 1  @campM1=lpcPalabraCve  from PreV2.LexicoPCve with(nolock) where  lpcClavePalCve = @cadDes
				select top 1  @campP1=lpcPalabraCve  from PubV2.LexicoPCve with(nolock) where  lpcClavePalCve = @cadDes
			end
			if @mCto ='LexicoPCveIng'
			begin
				select top 1  @campM1=lpcPalabraCveIng  from PreV2.LexicoPCveIng with(nolock) where  lpcClavePalCveIng = @cadDes
				select top 1  @campP1=lpcPalabraCveIng  from PubV2.LexicoPCveIng with(nolock) where  lpcClavePalCveIng = @cadDes
			end
			if @campM1= @campP1
			begin	set @banMsj='F'	end
			else
			begin
				set @banMsj='T'
			end
		end
	 end
end

if @mCto='Clasificacion'
begin
	select @Posicion =   patindex('%Values%' ,@mSql)
	set @cad1 = @mSql
	SELECT @cad1= stuff(@cad1, 1, @Posicion, '')--20,2,6)
	select @Posicion =  patindex('%(%' ,@cad1)
	SELECT @cad1= stuff(@cad1, 1, @Posicion, '')--20,2,6)
	--select @cad1 = left(@mSql, @Posicion + 6)--20,2,6)
	select @Posicion2 =   patindex('%,%' ,@cad1) --20,2,6)
	select @claCve = left(@cad1, @Posicion2 -1)--clave clasificacion 20
	SELECT @cad1= stuff(@cad1, 1, @Posicion2, '')--2,6)
	select @Posicion3 =   patindex('%,%' ,@cad1) --2,6)
	select @claGpo = left(@cad1, @Posicion3 -1)--clave grupo 2
	SELECT @cad1= stuff(@cad1, 1, @Posicion3, '')--6)
	select @Posicion4 =   patindex('%,%' ,@cad1) 
	if @Posicion4 >0
	begin
		select @claCveDes = left(@cad1, @Posicion4 -1)--clave descripcion
	end
	else
	begin
		select @claCveDes = left(@cad1, LEN (@cad1)-1)--clave descripcion
	end
	
	--select @Row = COUNT(*)  from PubV2.Clasificacion with(nolock)  where claClave =@claCve 
	if EXISTS (select *  from PubV2.Clasificacion with(nolock)  where claClave =@claCve )	
	begin	set @Row=1	end
	if @Row=0
	Begin  set @banMsj='0' end
	else
	begin  
		select top 1  @campM1=claGrupo,@campM2=claClaveDescrip,@campM3=claOrden  from PreV2.Clasificacion with(nolock) where claClave=@claCve
		select top 1  @campP1=claGrupo,@campP2=claClaveDescrip,@campP3=claOrden  from PubV2.Clasificacion with(nolock) where claClave=@claCve
		if @campM1= @campP1 and @campM2= @campP2
		begin set @banMsj='F' end
		else 
		begin 
			set @banMsj='T'
			--set @cadSql='update PreV2.Clasificacion set claGrupo=' + @campM1 + ',claClaveDescrip=' + @campM2 + ',claOrden=' + @campM3 + ' where claClave= ' + @claCve
			set @cadSql='Delete from PubV2.Clasificacion where claClave= ' + @claCve
		end
	end
end

if @mCto='EnlFTCon' or @mCto='EnlFTMFte' or @mCto='EnlFTRInst' or @mCto='EnlFTRRI' or @mCto='EnlIndGra'  or @mCto='EnlIndTipo' 
begin
	select @Posicion =   patindex('%Values%' ,@mSql)
	set @cad1 = @mSql
	SELECT @cad1= stuff(@cad1, 1, @Posicion, '')--20,2,6)
	select @Posicion =  patindex('%(%' ,@cad1)
	SELECT @cad1= stuff(@cad1, 1, @Posicion, '')--20,2,6)
	--select @cad1 = left(@mSql, @Posicion + 6)--20,2,6)
	--PRINT @cad1
	select @Posicion2 =   patindex('%,%' ,@cad1) --20,2,6)
	select @claCve = left(@cad1, @Posicion2 -1)--clave Ficha tecnica 20
	SELECT @cad1= stuff(@cad1, 1, @Posicion2, '')--2,6)
	select @Posicion3 =   patindex('%,%' ,@cad1) --2,6)
	select @claGpo = left(@cad1, @Posicion3 -1)--clave contato, fuente, institucion y referencia internacional, grafica,tipo de indicador 2
	SELECT @cad1= stuff(@cad1, 1, @Posicion3, '')--6)
	select @claCveDes = left(@cad1, LEN (@cad1)-1)--orden
	--set @MsjTemp=  @claCve  + ' - ' + @claGpo + ' - ' + @claCveDes
	--PRINT @MsjTemp + ' - '  + @mCto
	if @mCto='EnlFTCon'
	begin
		---select @Row = COUNT(*)  from PubV2.EnlFTCon with(nolock)  where efcClaveFT= @claCve and efcClaveCon = @claGpo 
		if EXISTS (Select * from PubV2.EnlFtmFte with(nolock) where effClave= @claCve and effClaveFue =  @claGpo)
		begin
			set @Row=1
		end
	end
	if @mCto='EnlFTMFte'
	begin
		--Select @Row = COUNT(*) from PubV2.EnlFtmFte with(nolock) where effClave= @claCve and effClaveFue =  @claGpo
		if EXISTS(Select * from PubV2.EnlFtmFte with(nolock) where effClave= @claCve and effClaveFue =  @claGpo)
		begin
			set @Row=1
		end
	end
	if @mCto='EnlFTRInst'
	begin
		--select @Row = COUNT(*)  from PubV2.EnlFTRInst with(nolock)  where efiClave=  @claCve  and efiClaveInst = @claGpo 
		IF EXISTS (select * from PubV2.EnlFTRInst with(nolock)  where efiClave=  @claCve  and efiClaveInst = @claGpo )
		BEGIN
			 set @Row=1
		end
	end
	if @mCto='EnlFTRRI'
	begin
		--select @Row = COUNT(*)  from PubV2.EnlFTRRI with(nolock)  where efrClave= @claCve  and efrClaveRI= @claGpo 
		IF EXISTS (select * from PubV2.EnlFTRRI with(nolock)  where efrClave= @claCve  and efrClaveRI = @claGpo )
		BEGIN
			set @Row=1 
		end
	end
	if @mCto='EnlIndGra'
	begin
		--select @Row = COUNT(*)  from PubV2.EnlIndGra with(nolock)  where eigCveInd =  @claCve  and eigSeccion = @claCveDes 
		print @claCveDes 
		select @Posicion3 =   patindex('%''%' ,@claCveDes ) --quitar la primer '
		select @claCveDes  =  stuff(@claCveDes , 1, @Posicion3, '')		
		select @Posicion3 =   patindex('%''%' ,@claCveDes ) --quitar la segunda '
		select @claCveDes  =  stuff(@claCveDes ,@Posicion3, 1, '')
		print @claCveDes 
		IF EXISTS (select  * from PubV2.EnlIndGra with(nolock) where eigCveInd = @claCve  and eigSeccion = @claCveDes) 
		BEGIN
			set @Row = 1
		end
		
	end
	if @mCto='EnlIndTipo'
	begin
		--select @Row = COUNT(*)  from PubV2.EnlIndTipo with(nolock)  where eitCveInd =  @claCve   and eitCveTipoInd= @claGpo 
		select @Posicion3 =   patindex('%''%' ,@claGpo) --quitar la primer '
		select @claGpo =  stuff(@claGpo, 1, @Posicion3, '')		
		select @Posicion3 =   patindex('%''%' ,@claGpo) --quitar la segunda '
		select @claGpo =  stuff(@claGpo,@Posicion3, 1, '')
		--print @claGpo				
		IF EXISTS (select  * from PubV2.EnlIndTipo with(nolock) where eitCveInd =  @claCve  and eitCveTipoInd = @claGpo) 
		BEGIN 
			set @Row = 1
		end
	end
	
	if  @Row = 0
	Begin  set @banMsj='0' end
	else
	begin 
		if @mCto='EnlIndGra'
		begin
			select top 1  @campM1=eigCveGra from PreV2.EnlIndGra with(nolock) where eigCveInd =@claCve and eigSeccion = @claCveDes 
			select top 1  @campP1=eigCveGra from PubV2.EnlIndGra with(nolock) where eigCveInd =@claCve and eigSeccion = @claCveDes 
			if @campM1= @campP1 
			begin set @banMsj='F' end
			else 
			begin 
				set @banMsj='T'
				--set @cadSql='update PreV2.EnlIndGra set eigCveGra=' + @campM1 + ' where eigCveInd =' + @claCve  + ' and eigSeccion =''' + @claCveDes + ''
				set @cadSql='Delete from PubV2.EnlIndGra  where eigCveInd =' + @claCve  + ' and eigSeccion =''' + @claCveDes + ''''
			end
		end
		else
		begin  set @banMsj='F' 	 end
	 end
end

if @mCto='EnlIndCal'   
begin
	--select @Row = COUNT(*) from PubV2.EnlIndCal with(nolock)  where eicCveInd =@mIn 
	if EXISTS (select * from PubV2.EnlIndCal with(nolock)  where eicCveInd =@mIn )	
	begin	set @Row=1	end
	if @Row=0
	Begin  set @banMsj='0' end
	else
	begin 
		select top 1  @campM1=eicCveInst, @campM2= eicFecAct, @campM3= eicCveNotaI, @campM4= eicCveNotaF, @campM5= eicFecActIng from PreV2.EnlIndCal with(nolock) where eicCveInd =@mIn 
		select top 1  @campP1=eicCveInst, @campP2= eicFecAct, @campP3= eicCveNotaI, @campP4= eicCveNotaF, @campP5= eicFecActIng from PubV2.EnlIndCal with(nolock) where eicCveInd =@mIn 
		if @campM1= @campP1 and @campM2= @campP2 and @campM3= @campP3 and @campM4= @campP4 and @campM5= @campP5 
		begin set @banMsj='F' end
		else 
		begin 
			set @banMsj='T' 
			--set @cadSql='update PreV2.EnlIndCal set eicCveInst=' + @campM1 + ', eicFecAct=''' + @campM2 + ''', eicCveNotaI=' + @campM3  + ',  eicCveNotaF=' + @campM4 + ', eicFecActIng=''' + @campM5 + ''' where eicCveInd =' + @mIn 
			set @cadSql='Delete from PubV2.EnlIndCal  where eicCveInd =' + @mIn 
		end
	end
end

if @mCto='EnlSerInd'
begin
	select @Posicion =   patindex('%Values%' ,@mSql)
	set @cad1 = @mSql
	SELECT @cad1= stuff(@cad1, 1, @Posicion, '')--20,2,6)
	select @Posicion =  patindex('%(%' ,@cad1)
	SELECT @cad1= stuff(@cad1, 1, @Posicion, '')--20,2,6)
	--select @cad1 = left(@mSql, @Posicion + 7)--20,2,6) puede tener 2 o 3 parámetros
	select @Posicion2 =   patindex('%,%' ,@cad1) --20,2,6)
	select @claCve = left(@cad1, @Posicion2 -1)--clave indicador 20
	SELECT @cad1= stuff(@cad1, 1, @Posicion2, '')--2,6)
	select @Posicion3 =   patindex('%,%' ,@cad1) --2,6)
	if @Posicion3 >0
	begin
		select @claCveDes = left(@cad1, @Posicion3 -1)--clave serie 2
	end
	else
	begin
		select @claCveDes = left(@cad1, LEN (@cad1)-1)--clave serie
	end
	if EXISTS (select * from PubV2.EnlSerInd with(nolock)  where esiClaveInd =@claCve and esiClaveSerie = @claCveDes)	
	begin	set @Row=1	end
	--select @Row = COUNT(*) from PubV2.EnlSerInd with(nolock)  where esiClaveInd =@claCve and esiClaveSerie = @claCveDes
	if @Row=0
	Begin  set @banMsj='0' end
	else  
	   begin set @banMsj='F' end
end


--Validar si se hizo el movimiento o hay duplicidad

if @banMsj ='0'
begin
	--print @banMsj
	select @Posicion2 =  patindex('%ManV2.%' , @mSql)--Buscamos la posicion de la primera ,
	select @cadSqlM = left(@mSql, @Posicion2 - 1)-- esquema
	select @mSql =  stuff(@mSql, 1, @Posicion2+5, '')			--Y obtenemos los caracteres hasta esa posicion
	set @cadSqlM1=  @cadSqlM + ' PubV2.' + @mSql   --SUBSTRING (@mS,@Posicion+4,len(@mS) - (@Posicion + 4))
	exec(@cadSqlM1)
	update ManV2.movimientos SET movEstatus='B' where movClave=@mClav
	set @returnMsj=''
end
if @banMsj ='F'
begin
	--print @banMsj
	update ManV2.movimientos SET movEstatus='B' where movClave=@mClav
	set @returnMsj='' 
end
if @banMsj ='T'
begin
	print @cadSql
	exec(@cadSql)
	
	select @Posicion2 =  patindex('%ManV2.%' , @mSql)--Buscamos la posicion de la primera ,
	select @cadSqlM = left(@mSql, @Posicion2 - 1)-- esquema
	select @mSql =  stuff(@mSql, 1, @Posicion2+5, '')			--Y obtenemos los caracteres hasta esa posicion
	set @cadSqlM1=  @cadSqlM + ' PubV2.' + @mSql   --SUBSTRING (@mS,@Posicion+4,len(@mS) - (@Posicion + 4))
	exec(@cadSqlM1)
	update ManV2.movimientos SET movEstatus='B' where movClave=@mClav
		
	----------
	--set @returnMsj= 'Indicador ' + @mIn + ', la clave ' + @mComen + ' del catálogo ' + @mCto + ' esta duplicada'
	--print @returnMsj
end

--return @returnMsj
END

GO
/****** Object:  StoredProcedure [PubV2].[RevisaInformacionPub]    Script Date: 10/09/2020 01:24:07 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [PubV2].[RevisaInformacionPub] 
	-- Add the parameters for the stored procedure here
	@CveIn nvarChar(MAX),
	@CveArb nvarchar(MAX),
	@TipoPro nvarchar(2),
	@CveAtsSer nvarchar(max),
	@CvePFic nvarchar (max),
	@AtrEst nvarchar(max)
AS
BEGIN
SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED
declare @RowInf int,@RowInf2 int,@cadSql1 nvarchar(Max),@cadSql2 nvarchar(Max),@cveTI nvarchar(Max), @cveSrs nvarchar(Max),@cadSqlU nvarchar(max), @Orden nvarchar(max),@cveAgrOrd nvarchar(max), @TipoAgrCl nvarchar(max), @cveOrdAgrNot int, @cveNotasDat int,@CvePalCve nvarchar(max), @CveAgruCob nvarchar(max),@cveAgrCoNot int,@apiPAA int, @apiPMM int, @apiPDD int,@apiCvNota int,@RowInfT int,@RowInf2T int
declare @campM1 nvarchar(Max),@campM2 nvarchar(Max),@campM3 nvarchar(Max),@campM4 nvarchar(Max),@campM5 nvarchar(Max),@campM6 nvarchar(Max),@campM7 nvarchar(Max),@campM8 nvarchar(Max),@campM9 nvarchar(Max),@campM10 nvarchar(Max),@campM11 nvarchar(Max),@campM12 nvarchar(Max),@campM13 nvarchar(Max),@campM14 nvarchar(Max),@campM15 nvarchar(Max),@campM16 nvarchar(Max),@campM17 nvarchar(Max),@campM18 nvarchar(Max),@campM19 nvarchar(Max),@campM20 nvarchar(Max),@campM21 nvarchar(Max),@campM22 nvarchar(Max),@campM23 nvarchar(Max),@campM24 nvarchar(Max),@campM25 nvarchar(Max),@campM26 nvarchar(Max)
declare @campP1 nvarchar(Max),@campP2 nvarchar(Max),@campP3 nvarchar(Max),@campP4 nvarchar(Max),@campP5 nvarchar(Max),@campP6 nvarchar(Max),@campP7 nvarchar(Max),@campP8 nvarchar(Max),@campP9 nvarchar(Max),@campP10 nvarchar(Max),@campP11 nvarchar(Max),@campP12 nvarchar(Max),@campP13 nvarchar(Max),@campP14 nvarchar(Max),@campP15 nvarchar(Max),@campP16 nvarchar(Max),@campP17 nvarchar(Max),@campP18 nvarchar(Max),@campP19 nvarchar(Max),@campP20 nvarchar(Max),@campP21 nvarchar(Max),@campP22 nvarchar(Max),@campP23 nvarchar(Max),@campP24 nvarchar(Max),@campP25 nvarchar(Max),@campP26 nvarchar(Max)
declare @Igual nvarchar(3), @CveFicha nvarchar(Max),@CveMetadat nvarchar(Max), @CveDescripArb nvarchar(Max), @CveNotaI nvarchar(Max), @CveNotaF nvarchar(Max),@CveInsCal nvarchar(Max)
declare @Pos2 int, @cadRes nvarchar(Max), @cveGrafM nvarchar(Max),@cveGrafT nvarchar(Max), @cveGrafC nvarchar (Max), @cveGrafD nvarchar(Max), @CadGraf nvarchar(Max), @CadResGraf nvarchar(Max)
declare @CveGraF nvarchar(max),@banEnlIndSer nvarchar(max), @banEnlIndPCve nvarchar(max),@banEnlIndTipo nvarchar (max),@CveGpo nvarchar(Max),@CveClas nvarchar(max), @cveAgr nvarchar(max),@CveCob nvarchar(max),@CveCg nvarchar(max),@CveND nvarchar(max)
declare @tablafue table (cF int)
declare @tablaIns table (cI int)
declare @tablaRI table (cR int)
declare @tablaCo table (cC int)
declare @tablaTipoInd table (TipI nvarchar(max))
declare @tablaTipoInd2 table (TipI2 nvarchar(max))
declare @tablaSerie table (CveSr nvarchar(max), SerOrden nvarchar(max))
declare @tablaSerie2 table (CveSr2 nvarchar(max), SerOrden2 nvarchar(max))
declare @tablaAtrSer table (CveSer nvarchar(max), CveDescr nvarchar(max), CveFrec nvarchar(max), CveNota nvarchar(max), CveFuente nvarchar(max), CveUni nvarchar(max), CveAgClas nvarchar (max),CveAgCob nvarchar(max))
declare @tablaGpo table (CveGpo nvarchar(max))
declare @tablaAgrupaClas table (CveAgCl nvarchar(max))
declare @tablaOrdAgrupaClas table (CveOrdAgCl nvarchar(max), cveOrdAgrClNota int,  tipoCl nvarchar(max))
declare @tablaAgrupaCobs table (CveAgCob nvarchar(max))
declare @tablaClas table (CveCl  nvarchar(max),CveGpo nvarchar(max))
declare @tablaCobGeo table (CveAgruCg nvarchar(max),CveCg  nvarchar(max),  CveDesG nvarchar(max))
declare @tablaNoDato table (CveND  nvarchar(max))
declare @tablaLexico table (CvePal  nvarchar(max))
declare @tablaLexicoIng table (CvePalIng  nvarchar(max))
declare @tablaNotasDatos table (cveNotDat  int)
declare @tablaPalCve table (cvePC int)
declare @tablaPerInd table (apiAA int, apiMM int,apiDD int, apiCveNota int)
declare @CveDescr nvarchar(max), @CveFrec nvarchar(max), @CveNota nvarchar(max), @CveFuente nvarchar(max), @CveUni nvarchar(max), @CveAgClas nvarchar (max),@CveAgCob nvarchar(max), @CvePal nvarchar(max), @CvePalIng nvarchar(max)
declare @CveDesGeo nvarchar(max),@CveDesG nvarchar(max), @CveDesGAnt nvarchar(max),@CveTipoDGAnt nvarchar(max), @CveTipoDG nvarchar (max),@CvePer nvarchar(max), @CveFtCob nvarchar (max),@CveIns nvarchar(max),@CveRI nvarchar(max),@CveCo nvarchar(max)


--revisar arbol 
--select * from PreV2.Arbol where arbClaveInd=339
--select * from PubV2.Arbol where arbClaveInd=339
if @TipoPro='C'
begin
	set @RowInf=0
		--select  @RowInf = COUNT(*) from PubV2.Arbol with(nolock) where arbClaveInd = @CveIn and arbClave= @CveArb
		if EXISTS (select  * from PubV2.Arbol with(nolock) where arbClaveInd = @CveIn and arbClave= @CveArb)
		begin set @RowInf=1 end
		if @RowInf = 0
		Begin  
			set @cadSql1 = 'INSERT INTO PubV2.Arbol ([arbClave],[arbClaveInd],[arbClaveFT],[arbClaveDescrip],[arbClaveMetadato])
							select [arbClave],[arbClaveInd],[arbClaveFT],[arbClaveDescrip],[arbClaveMetadato]
							from PreV2.Arbol with(nolock) where arbclave =''' + @CveArb + ''' and arbClaveInd= ' + @CveIn 
			print @cadSql1
			EXEC (@cadSql1) 
			select top 1  @CveDescripArb= arbclaveDescrip, @CveFicha=arbClaveFT, @CveMetadat=arbClaveMetadato  from PubV2.Arbol with(nolock) where arbclave=@CveArb
		end
		else
		begin
			select top 1  @campM1=arbClaveInd, @campM2=arbClaveFT, @campM3=arbClaveDescrip, @campM4=arbClaveMetadato  from PreV2.Arbol with(nolock) where arbclave=@CveArb
			select top 1  @campP1=arbClaveInd, @campP2=arbClaveFT, @campP3=arbClaveDescrip, @campP4=arbClaveMetadato  from PubV2.Arbol with(nolock) where arbclave=@CveArb
			set @CveDescripArb= @campM3
			set @CveFicha= @campM2
			set @CveMetadat= @campM4
			if @campM1= @campP1 and @campM2= @campP2 and @campM3= @campP3 and @campM4= @campP4  
			begin 
				set @Igual='I'
			end
			else 
			begin 
				set @cadSql1 ='delete from PubV2.Arbol where arbclaveind='+ @CveIn +' and arbClave= '''+ @CveArb + '''' 
				print @cadSql1
				EXEC (@cadSql1)
				set @cadSql2 = 'INSERT INTO PubV2.Arbol ([arbClave],[arbClaveInd],[arbClaveFT],[arbClaveDescrip],[arbClaveMetadato])
								select [arbClave],[arbClaveInd],[arbClaveFT],[arbClaveDescrip],[arbClaveMetadato]
								from PreV2.Arbol with(nolock) where arbclave =''' + @CveArb + ''' and arbClaveInd= ' + @CveIn 
				print @cadSql2
				EXEC  (@cadSql2) 
			end
		end
	--revisar metadato
		--select * from PreV2.metadato where metClave=339
		--select * from PubV2.metadato where metClave=339
		if @CveMetadat!='0'
		begin
			set @RowInf=0
			if EXISTS (select * from PubV2.Metadato with(nolock) where metClave=@CveMetadat)
			begin set @RowInf=1 end
			--select  @RowInf = COUNT(*) from PubV2.Metadato with(nolock) where metClave=@CveMetadat
			if @RowInf = 0
			Begin  
				set @cadSql1 = 'INSERT INTO PubV2.metadato ([metClave],[metDescrip],[metDescripIng])
								select [metClave],[metDescrip],[metDescripIng]
								from PreV2.metadato with(nolock) where metclave =' + @CveMetadat
				print @cadSql1
				EXEC (@cadSql1) 
			end
			else
			begin
				select top 1  @campM1=metDescrip,@campM2=metDescripIng from PreV2.Metadato with(nolock) where metClave=@CveMetadat
				select top 1  @campP1=metDescrip,@campP2=metDescripIng from PubV2.Metadato with(nolock) where metClave=@CveMetadat
				if @campM1= @campP1 and @campM2= @campP2
				begin
					set @Igual='I'
				end
				else 
				begin 
					set @cadSql1 ='delete from PubV2.metadato where metclave= ' + @CveMetadat
					print @cadSql1
					EXEC (@cadSql1)
					set @cadSql2 = 'INSERT INTO PubV2.metadato ([metClave],[metDescrip],[metDescripIng])
									select [metClave],[metDescrip],[metDescripIng]
									from PreV2.metadato with(nolock) where metClave= ' + @CveMetadat
					print @cadSql2
					EXEC  (@cadSql2) 
				end
			end
		end 
	--revisar descripción de indicador
		--select * from PreV2.descripcion where desClave=339
		--select * from PubV2.descripcion where desClave=339
		set @RowInf=0
		if EXISTS (select  * from PubV2.descripcion with(nolock) where desClave=@CveDescripArb)
		begin set @RowInf=1 end
		--select  @RowInf = COUNT(*) from PubV2.descripcion with(nolock) where desClave=@CveDescripArb
		if @RowInf = 0
		Begin  
			set @cadSql1 = 'INSERT INTO PubV2.descripcion ([desClave],[desDescrip],[desAbrevia],[desCodigo],[desDescripIng],[desAbreviaIng],[desCodigoIng])
							select [desClave],[desDescrip],[desAbrevia],[desCodigo],[desDescripIng],[desAbreviaIng],[desCodigoIng]
							from PreV2.descripcion with(nolock) where desclave =' + @CveDescripArb
			print @cadSql1
			EXEC (@cadSql1) 
		end
		else
		begin
			select top 1  @campM1=desdescrip, @campM2=desAbrevia, @campM3=desCodigo, @campM4=desDescripIng, @campM5=desAbreviaIng, @campM6=desCodigoIng  from PreV2.Descripcion with(nolock) where desclave=@CveDescripArb
			select top 1  @campP1=desdescrip, @campP2=desAbrevia, @campP3=desCodigo, @campP4=desDescripIng, @campP5=desAbreviaIng, @campP6=desCodigoIng  from PubV2.Descripcion with(nolock) where desclave=@CveDescripArb
			if @campM1= @campP1 and @campM2= @campP2 and @campM3= @campP3 and @campM4= @campP4 and @campM5= @campP5 and @campM6= @campP6
			begin
				set @Igual='I'
			end
			else 
			begin 
				set @cadSql1 ='delete from PubV2.Descripcion where desclave= ' + @CveDescripArb
				print @cadSql1
				EXEC (@cadSql1)
				set @cadSql2 = 'INSERT INTO PubV2.descripcion ([desClave],[desDescrip],[desAbrevia],[desCodigo],[desDescripIng],[desAbreviaIng],[desCodigoIng])
								select [desClave],[desDescrip],[desAbrevia],[desCodigo],[desDescripIng],[desAbreviaIng],[desCodigoIng]
								from PreV2.Descripcion with(nolock) where desClave= ' + @CveDescripArb
				print @cadSql2
				EXEC  (@cadSql2) 
			end
		end
	--revisar los atributos del indicador
		--select * from PreV2.AtrIndicador where atrClaveInd=339
		--select * from PubV2.AtrIndicador where atrClaveInd=339
		set @RowInf=0
		if EXISTS (select  * from PubV2.AtrIndicador with(nolock) where atrClaveInd=@CveIn)
		begin set @RowInf=1 end
		--select  @RowInf = COUNT(*) from PubV2.AtrIndicador with(nolock) where atrClaveInd=@CveIn
		if @RowInf = 0
		Begin  
			set @cadSql1 = 'INSERT INTO PubV2.AtrIndicador ([atrClaveInd],[atrFechaAct],[atrMeta],[atrDesMeta],[atrCalculo],[atrEstadisticos],[atrClaveEst],[atrFechaActIng],[atrDesMetaIng],[atrVisualizaMapa],[atrEtiPeriodo],[atrEtiCobTem],[atrEstado])
							select [atrClaveInd],[atrFechaAct],[atrMeta],[atrDesMeta],[atrCalculo],[atrEstadisticos],[atrClaveEst],[atrFechaActIng],[atrDesMetaIng],[atrVisualizaMapa],[atrEtiPeriodo],[atrEtiCobTem],[atrEstado]
							from PreV2.AtrIndicador with(nolock) where atrClaveInd =' + @CveIn
			print @cadSql1
			EXEC (@cadSql1) 
		end
		else
		begin
			select top 1  @campM1=atrFechaAct, @campM2=atrMeta, @campM3=atrDesMeta, @campM4=atrCalculo, @campM5=atrClaveEst, @campM6=atrFechaActIng, @campM7=atrDesMetaIng, @campM8=atrEstadisticos, @campM9=atrVisualizaMapa  from PreV2.AtrIndicador with(nolock) where atrClaveInd=@CveIn
			select top 1  @campP1=atrFechaAct, @campP2=atrMeta, @campP3=atrDesMeta, @campP4=atrCalculo, @campP5=atrClaveEst, @campP6=atrFechaActIng, @campP7=atrDesMetaIng, @campP8=atrEstadisticos, @campP9=atrVisualizaMapa  from PubV2.AtrIndicador with(nolock) where atrClaveInd=@CveIn
			if @campM1= @campP1 and @campM2= @campP2 and @campM3= @campP3 and @campM4= @campP4  and @campM5= @campP5  and @campM6= @campP6  and @campM7= @campP7  and @campM8= @campP8  and @campM9= @campP9  
			begin
				set @Igual='I'
			end
			else 
			begin 
				set @cadSql1 ='delete from PubV2.AtrIndicador where atrClaveInd= ' + @CveIn
				print @cadSql1
				EXEC (@cadSql1)
				set @cadSql2 = 'INSERT INTO PubV2.AtrIndicador ([atrClaveInd],[atrFechaAct],[atrMeta],[atrDesMeta],[atrCalculo],[atrEstadisticos],[atrClaveEst],[atrFechaActIng],[atrDesMetaIng],[atrVisualizaMapa],[atrEtiPeriodo],[atrEtiCobTem],[atrEstado])
								select [atrClaveInd],[atrFechaAct],[atrMeta],[atrDesMeta],[atrCalculo],[atrEstadisticos],[atrClaveEst],[atrFechaActIng],[atrDesMetaIng],[atrVisualizaMapa],[atrEtiPeriodo],[atrEtiCobTem],[atrEstado]
								from PreV2.AtrIndicador with(nolock) where atrClaveInd= ' + @CveIn
				print @cadSql2
				EXEC  (@cadSql2) 
			end
		end
	--revisar enlace indicador - calendario
		--select * from PreV2.EnlIndCal where eicCveInd=339
		--select * from PubV2.EnlIndCal where eicCveInd=339
		set @RowInf=0
		if EXISTS (select * from PubV2.EnlIndCal with(nolock) where eicCveInd=@CveIn)
		begin set @RowInf=1 end
		--select  @RowInf = COUNT(*) from PubV2.EnlIndCal with(nolock) where eicCveInd=@CveIn
		if @RowInf = 0
		Begin  
			set @cadSql1 = 'INSERT INTO PubV2.EnlIndCal ([eicCveInd],[eicCveInst],[eicFecAct],[eicCveNotaI],[eicCveNotaF],[eicFecActIng])
							select [eicCveInd],[eicCveInst],[eicFecAct],[eicCveNotaI],[eicCveNotaF],[eicFecActIng]
							from PreV2.EnlIndCal with(nolock) where eicCveInd=' + @CveIn
			print @cadSql1
			EXEC (@cadSql1) 
			select top 1  @CveInsCal=eicCveInst, @CveNotaI= eicCveNotaI, @CveNotaF= eicCveNotaF from PubV2.EnlIndCal with(nolock) where eicCveInd =@CveIn
		end
		else
		begin
			select top 1  @campM1=eicCveInst, @campM2= eicFecAct, @campM3= eicCveNotaI, @campM4= eicCveNotaF, @campM5= eicFecActIng from PreV2.EnlIndCal with(nolock) where eicCveInd =@CveIn 
			select top 1  @campP1=eicCveInst, @campP2= eicFecAct, @campP3= eicCveNotaI, @campP4= eicCveNotaF, @campP5= eicFecActIng from PubV2.EnlIndCal with(nolock) where eicCveInd =@CveIn
			set @CveInsCal=@campM1
			set @CveNotaI= @campM3
			set @CveNotaF= @campM4
			if @campM1= @campP1 and @campM2= @campP2 and @campM3= @campP3 and @campM4= @campP4 and @campM5= @campP5 
			begin
				set @Igual='I'
			end
			else 
			begin 
				set @cadSql1 ='delete from PubV2.EnlIndCal where eicCveInd= ' + @CveIn
				print @cadSql1
				EXEC (@cadSql1)
				set @cadSql2 = 'INSERT INTO PubV2.EnlIndCal ([eicCveInd],[eicCveInst],[eicFecAct],[eicCveNotaI],[eicCveNotaF],[eicFecActIng])
								select [eicCveInd],[eicCveInst],[eicFecAct],[eicCveNotaI],[eicCveNotaF],[eicFecActIng]
								from PreV2.EnlIndCal with(nolock) where eicCveInd= ' + @CveIn
				print @cadSql2
				EXEC  (@cadSql2) 
			end
		end
	--revisar la institucion  de enlace indicador - calendario
		--select * from PreV2.Institucion where insclave=339
		--select * from PubV2.Institucion where insclave=339
		set @RowInf=0
		if EXISTS (select * from PubV2.Institucion with(nolock) where insclave=@CveInsCal)
		begin set @RowInf=1 end
		--select  @RowInf = COUNT(*) from PubV2.Institucion with(nolock) where insclave=@CveInsCal
		if @RowInf = 0
		Begin  
			set @cadSql1 = 'INSERT INTO PubV2.Institucion ([insClave],[insDescrip],[insURL],[insAbrevia],[insDescripIng],[insAbreviaIng])
							select [insClave],[insDescrip],[insURL],[insAbrevia],[insDescripIng],[insAbreviaIng]
							from PreV2.Institucion with(nolock) where insclave=' + @CveInsCal
			print @cadSql1
			EXEC (@cadSql1) 
		end
		else
		begin
			select top 1  @campM1=insDescrip,@campM2=insDescripIng,@campM3=insAbrevia,@campM4=insAbreviaIng,@campM5=insURL from PreV2.Institucion with(nolock) where insClave=@CveInsCal
			select top 1  @campP1=insDescrip,@campP2=insDescripIng,@campP3=insAbrevia,@campP4=insAbreviaIng,@campP5=insURL from PubV2.Institucion with(nolock) where insClave=@CveInsCal
			if @campM1= @campP1 and @campM2= @campP2 and @campM3= @campP3 and @campM4= @campP4 and @campM5= @campP5
			begin
				set @Igual='I'
			end
			else 
			begin 
				set @cadSql1 ='delete from PubV2.Institucion where insclave= ' + @CveInsCal
				print @cadSql1
				EXEC (@cadSql1)
				set @cadSql2 = 'INSERT INTO PubV2.Institucion ([insClave],[insDescrip],[insURL],[insAbrevia],[insDescripIng],[insAbreviaIng])
								select [insClave],[insDescrip],[insURL],[insAbrevia],[insDescripIng],[insAbreviaIng]
								from PreV2.Institucion with(nolock) where insclave= ' + @CveInsCal
				print @cadSql2
				EXEC  (@cadSql2) 
			end
		end
	--revisar las notas  de enlace indicador - calendario
		--select * from PreV2.Notas where notclave=339
		--select * from PubV2.Notas where notclave=339
		set @CveNotaI = @CveNotaI + ',' + @CveNotaF + ','
		WHILE patindex('%,%' , @CveNotaI) <> 0
			begin
				SELECT @Pos2 =  patindex('%,%' , @CveNotaI)
				--Buscamos la posicion de la primera ,
				SELECT @cadRes= left(@CveNotaI, @Pos2 - 1)--clave de nota
				--Reemplazamos lo procesado con nada con la funcion stuff
				SELECT @CveNotaI = stuff(@CveNotaI, 1, @Pos2, '')
				if @cadRes <> '0' and @cadRes <> ''
				begin
					set @RowInf=0
					if EXISTS (select  * from PubV2.Notas with(nolock) where notclave=@cadRes)
					begin set @RowInf=1 end
					--select  @RowInf = COUNT(*) from PubV2.Notas with(nolock) where notclave=@cadRes
					if @RowInf = 0
					Begin  
						set @cadSql1 = 'INSERT INTO PubV2.Notas ([notClave],[NotNota],[NotNotaIng])
										select [notClave],[NotNota],[NotNotaIng]
										from PreV2.Notas with(nolock) where notclave=' + @cadRes
						print @cadSql1
						EXEC (@cadSql1) 
					end
					else
					begin
						select top 1  @campM1=notNota,@campM2=notNotaIng from PreV2.Notas with(nolock) where notClave=@cadRes
						select top 1  @campP1=notNota,@campP2=notNotaIng from PubV2.Notas with(nolock) where notClave=@cadRes
						if @campM1= @campP1 and @campM2= @campP2 
						begin
							set @Igual='I'
						end
						else 
						begin 
							set @cadSql1 ='delete from PubV2.Notas where notclave= ' + @CveInsCal
							print @cadSql1
							EXEC (@cadSql1)
							set @cadSql2 = 'INSERT INTO PubV2.Notas ([notClave],[NotNota],[NotNotaIng])
											select [notClave],[NotNota],[NotNotaIng]
											from PreV2.Notas with(nolock) where notclave= ' + @CveInsCal
							print @cadSql2
							EXEC  (@cadSql2) 
						end
					end
			   end
			end--end del while
	--revisar enlace indicador - gráfica
		--select * from PreV2.EnlIndGra where eigCveInd=339
		--select * from PubV2.EnlIndGra where eigCveInd=339
		set @CadGraf = 'M,T,C,E,'
		select @cveGrafM = eigCveGra  from PreV2.EnlIndGra with(nolock)  where eigCveInd  = @CveIn  and eigSeccion='M'
		--Grafica del Mapa
		select @cveGrafT = eigCveGra  from PreV2.EnlIndGra with(nolock)  where eigCveInd  = @CveIn  and eigSeccion='T'
		--Grafica del Mapa
		select @cveGrafC = eigCveGra  from PreV2.EnlIndGra with(nolock)  where eigCveInd  = @CveIn  and eigSeccion='C'
		--Grafica del Mapa
		select @cveGrafD = eigCveGra  from PreV2.EnlIndGra with(nolock)  where eigCveInd  = @CveIn  and eigSeccion='E'
		WHILE patindex('%,%' , @CadGraf) <> 0
			begin
				SELECT @Pos2 =  patindex('%,%' , @CadGraf)
				--Buscamos la posicion de la primera ,
				SELECT @cadResGraf= left(@CadGraf, @Pos2 - 1)--clave de nota
				--Reemplazamos lo procesado con nada con la funcion stuff
				SELECT @CadGraf= stuff(@CadGraf, 1, @Pos2, '')
				if @cadResGraf='M'
				begin set @CveGraF = @cveGrafM end
				if @cadResGraf='T'
				begin set @CveGraF = @cveGrafT end
				if @cadResGraf='C'
				begin set @CveGraF = @cveGrafC end
				if @cadResGraf='E'
				begin set @CveGraF = @cveGrafD end
				set @RowInf=0
				if EXISTS (select * from PubV2.EnlIndGra with(nolock) where eigCveInd=@CveIn and eigSeccion=@CadResGraf)
				begin set @RowInf=1 end
				--select  @RowInf = COUNT(*) from PubV2.EnlIndGra with(nolock) where eigCveInd=@CveIn and eigSeccion=@CadResGraf
				if @RowInf = 0
				Begin  
					set @cadSql1 = 'INSERT INTO PubV2.EnlIndGra ([eigCveInd],[eigCveGra],[eigSeccion])
									select [eigCveInd],[eigCveGra],[eigSeccion]
									from PreV2.EnlIndGra with(nolock) where eigCveInd=' + @CveIn + ' and eigSeccion =''' + @CadResGraf + ''''
					print @cadSql1
					EXEC (@cadSql1) 
				end
				else
				begin
					select top 1  @campM1=eigCveGra from PreV2.EnlIndGra with(nolock) where eigCveInd =@CveIn and eigSeccion = @CadResGraf
					select top 1  @campP1=eigCveGra from PubV2.EnlIndGra with(nolock) where eigCveInd =@CveIn and eigSeccion = @CadResGraf
					if @campM1= @campP1 
					begin
						set @Igual='I'
					end
					else 
					begin 
						set @cadSql1 ='delete from PubV2.EnlIndGra where eigCveInd=' + @CveIn + ' and eigSeccion =''' + @CadResGraf + ''''
						print @cadSql1
						EXEC (@cadSql1)
						set @cadSql2 = 'INSERT INTO PubV2.EnlIndGra ([eigCveInd],[eigCveGra],[eigSeccion])
										select [eigCveInd],[eigCveGra],[eigSeccion]
										from PreV2.EnlIndGra with(nolock) where eigCveInd=' + @CveIn + ' and eigSeccion =''' + @CadResGraf + ''''
						print @cadSql2
						EXEC  (@cadSql2) 
					end
				end
				--revisar la tabla de grafica
				set @RowInf=0
				if EXISTS (select * from PubV2.Grafica with(nolock) where graClave=@CveGraF)
				begin set @RowInf=1 end
				--select  @RowInf = COUNT(*) from PubV2.Grafica with(nolock) where graClave=@CveGraF
				if @RowInf = 0
				Begin  
					set @cadSql1 = 'INSERT INTO PubV2.Grafica ([graClave],[graDescrip],[graAbrevia] ,[graDescripIng],[graAbreviaIng])
									select [graClave],[graDescrip],[graAbrevia] ,[graDescripIng],[graAbreviaIng]
									from PreV2.Grafica with(nolock) where graClave=' + @CveGraF
					print @cadSql1
					EXEC (@cadSql1) 
				end
				else
				begin
					select top 1  @campM1=eigCveGra from PreV2.EnlIndGra with(nolock) where eigCveInd =@CveIn and eigSeccion = @CadResGraf
					select top 1  @campP1=eigCveGra from PubV2.EnlIndGra with(nolock) where eigCveInd =@CveIn and eigSeccion = @CadResGraf
					if @campM1= @campP1 
					begin
						set @Igual='I'
					end
					else 
					begin 
						set @cadSql1 ='delete from PubV2.Grafica where graClave=' + @CveGraF
						print @cadSql1
						EXEC (@cadSql1)
						set @cadSql2 = 'INSERT INTO PubV2.Grafica ([graClave],[graDescrip],[graAbrevia] ,[graDescripIng],[graAbreviaIng])
										select [graClave],[graDescrip],[graAbrevia] ,[graDescripIng],[graAbreviaIng]
										from PreV2.Grafica with(nolock) where graClave=' + @CveGraF
						print @cadSql2
						EXEC  (@cadSql2) 
					end
				end
		end
	--Revisar enlace indicador- tipo
		--select * from PreV2.EnlIndTipo where eitCveInd=339
		--select * from PubV2.EnlIndTipo where eitCveInd=339
		set @RowInf=0
		set @RowInf2=0
		insert into @tablaTipoInd select eitCveTipoInd  from PreV2.EnlIndTipo with(nolock) where eitCveInd = @CveIn
		insert into @tablaTipoInd2 select eitCveTipoInd  from PreV2.EnlIndTipo with(nolock) where eitCveInd = @CveIn
		if EXISTS (select * from PreV2.EnlIndTipo with(nolock) where eitCveInd = @CveIn)
		begin set @RowInf=1 end
		if EXISTS (select  * from PubV2.EnlIndTipo with(nolock) where  eitCveInd = @CveIn)
		begin set @RowInf2=1 end
		--select  @RowInf = COUNT(*) from PreV2.EnlIndTipo with(nolock) where eitCveInd = @CveIn
		--select  @RowInf2 = COUNT(*) from PubV2.EnlIndTipo with(nolock) where  eitCveInd = @CveIn
		set @banEnlIndTipo='False'
			if @RowInf = @RowInf2
				Begin  
					while exists(select * from @tablaTipoInd2 )
					 begin
						select top 1 @cveTI = TipI2  from @tablaTipoInd2
						select  @RowInf = COUNT(*) from PubV2.EnlIndTipo with(nolock) where eitCveInd = @CveIn and eitCveTipoInd = @cveTI
						 if @RowInf= 0
						 Begin  
								set @banEnlIndTipo='True'
						 end
					   delete from @tablaTipoInd2 where TipI2= @cveTI
					 end
					 if @banEnlIndTipo='True'
					 begin
						set @cadSql1 ='delete from PubV2.EnlIndTipo where  eitCveInd = ' + @CveIn
						print @cadSql1
						EXEC (@cadSql1)
						set @cadSql2 = 'INSERT INTO PubV2.EnlIndTipo ([eitCveInd],[eitCveTipoInd],[eitOrden])
										select [eitCveInd],[eitCveTipoInd],[eitOrden]
										from PreV2.EnlIndTipo with(nolock) where eitCveInd = ' + @CveIn
						print @cadSql2
						EXEC  (@cadSql2) 
					 end
				end 
				else
				begin
					set @cadSql1 ='delete from PubV2.EnlIndTipo where  eitCveInd = ' + @CveIn
					print @cadSql1
					EXEC (@cadSql1)
					set @cadSql2 = 'INSERT INTO PubV2.EnlIndTipo ([eitCveInd],[eitCveTipoInd],[eitOrden])
									select [eitCveInd],[eitCveTipoInd],[eitOrden]
									from PreV2.EnlIndTipo with(nolock) where eitCveInd = ' + @CveIn
					print @cadSql2
					EXEC  (@cadSql2) 
				end
	--revisar que las claves de tipo de indicador existan
			--select * from PubV2.TipoIndicador where tatrCve=''
			--select * from pubv2.TipoIndicador where tatrCve=''
		 while exists(select * from @tablaTipoInd )
		  begin
				set @RowInf=0
				select top 1 @cveTI = TipI  from @tablaTipoInd
				--select  @RowInf = COUNT(*) from PubV2.TipoIndicador with(nolock) where tatrCve = @cveTI
				if EXISTS (select  * from PubV2.TipoIndicador with(nolock) where tatrCve = @cveTI)
				begin set @RowInf=1 end
				 if @RowInf= 0
					Begin  
						set @cadSql1 = 'INSERT INTO PubV2.TipoIndicador ([tatrCve],[tatrDescripP],[tatrDescripS],[tatrInforme],[tatrDescripPIng],[tatrDescripSIng],[tatrInformeIng])
									select [tatrCve],[tatrDescripP],[tatrDescripS],[tatrInforme],[tatrDescripPIng],[tatrDescripSIng],[tatrInformeIng]
									from PreV2.TipoIndicador with(nolock) where tatrCve = ''' + @cveTI + ''''
						print @cadSql1
						EXEC (@cadSql1) 
					end
					else
					begin
						select top 1  @campM1=tatrDescripP,@campM2=tatrDescripS,@campM3=tatrInforme,@campM4=tatrDescripPIng,@campM5=tatrDescripSIng,@campM6=tatrInformeIng   from PreV2.TipoIndicador with(nolock) where tatrCve=@cveTI
						select top 1  @campP1=tatrDescripP,@campP2=tatrDescripS,@campP3=tatrInforme,@campP4=tatrDescripPIng,@campP5=tatrDescripSIng,@campP6=tatrInformeIng   from PubV2.TipoIndicador with(nolock) where tatrCve=@cveTI
						if @campM1= @campP1 and @campM2= @campP2  and @campM3= @campP3 and @campM4= @campP4 and @campM5= @campP5 and @campM6= @campP6
						begin
							set @Igual='I'
						end
						else 
						begin 
							set @cadSql1 ='delete from PubV2.TipoIndicador where tatrCve = ''' + @cveTI + ''''
							print @cadSql1
							EXEC (@cadSql1)
							set @cadSql2 = 'INSERT INTO PubV2.TipoIndicador ([tatrCve],[tatrDescripP],[tatrDescripS],[tatrInforme],[tatrDescripPIng],[tatrDescripSIng],[tatrInformeIng])
											select [tatrCve],[tatrDescripP],[tatrDescripS],[tatrInforme],[tatrDescripPIng],[tatrDescripSIng],[tatrInformeIng]
											from PreV2.TipoIndicador with(nolock) where tatrCve = ''' + @cveTI + ''''
							print @cadSql2
							EXEC  (@cadSql2) 
						end
					end
				delete from @tablaTipoInd where TipI= @cveTI
			end
			--revisar que las palabras clave existan
		insert into @tablaPalCve select eipcCveDesPCve  from PreV2.EnlIndPCve with(nolock) where eipcCveInd= @CveIn
		while exists(select * from @tablaPalCve )
		  begin
				select top 1  @CvePalCve = cvePC  from @tablaPalCve
				set @RowInf=0
				if EXISTS (select  * from PubV2.DescripcionPCve with(nolock) where dpcClave = @CvePalCve)
				begin set @RowInf=1 end
--				select  @RowInf = COUNT(*) from PreV2.DescripcionPCve with(nolock) where dpcClave = @CvePalCve
				 if @RowInf= 0
					Begin  
						set @cadSql1 = 'INSERT INTO pubV2.DescripcionPCve ([dpcClave],[dpcDescrip],[dpcAbrevia],[dpcDescripIng],[dpcAbreviaIng])
									select [dpcClave],[dpcDescrip],[dpcAbrevia],[dpcDescripIng],[dpcAbreviaIng]
									from PreV2.DescripcionPCve with(nolock) where dpcClave= ' + @CvePalCve
						print @cadSql1
						EXEC (@cadSql1) 
					end
					else
					begin
						select top 1  @campM1=dpcDescrip,@campM2=dpcAbrevia,@campM3=dpcDescripIng,@campM4=dpcAbreviaIng  from PreV2.DescripcionPCve with(nolock) where dpcClave= @CvePalCve
						select top 1  @campP1=dpcDescrip,@campP2=dpcAbrevia,@campP3=dpcDescripIng,@campP4=dpcAbreviaIng  from PubV2.DescripcionPCve with(nolock) where dpcClave= @CvePalCve
						if @campM1= @campP1 and @campM2= @campP2  and @campM3= @campP3 and @campM4= @campP4
						begin
							set @Igual='I'
						end
						else 
						begin 
							set @cadSql1 ='delete from pubV2.DescripcionPCve where dpcClave = ' + @CvePalCve
							print @cadSql1
							EXEC (@cadSql1)
							set @cadSql2 = 'INSERT INTO pubV2.DescripcionPCve ([dpcClave],[dpcDescrip],[dpcAbrevia],[dpcDescriping],[dpcAbreviaing])
											select [dpcClave],[dpcDescrip],[dpcAbrevia],[dpcDescriping],[dpcAbreviaing]
											from PreV2.DescripcionPCve with(nolock) where dpcClave = ' + @CvePalCve
							print @cadSql2
							EXEC  (@cadSql2) 
						end
					end
				--revisar enlace y lexico de palabras clave
				set @cadSql1 ='delete from pubV2.EnlacePCve where epcCveDesPCve = ' +  @CvePalCve
				print @cadSql1
				EXEC (@cadSql1)
				set @cadSql2 = 'INSERT INTO pubV2.EnlacePCve ([epcCvePCve],[epcCveDesPCve])
											select [epcCvePCve],[epcCveDesPCve]
											from preV2.EnlacePCve with(nolock) where epcCveDesPCve = ' +  @CvePalCve
				print @cadSql2
				EXEC  (@cadSql2)
				set @cadSql1 ='delete from pubV2.EnlacePCveIng where epcCveDesPCveIng = ' +  @CvePalCve
				print @cadSql1
				EXEC (@cadSql1)
				set @cadSql2 = 'INSERT INTO pubV2.EnlacePCveIng ([epcCvePCveIng],[epcCveDesPCveIng])
											select [epcCvePCveIng],[epcCveDesPCveIng]
											from PreV2.EnlacePCveIng with(nolock) where epcCveDesPCveIng = ' +  @CvePalCve
				print @cadSql2
				EXEC  (@cadSql2)
				insert into @tablaLexico select  epcCvePCve  from PreV2.EnlacePCve with(nolock) where epcCveDesPCve = @CvePalCve
				while exists(select * from @tablaLexico )
				begin
					select top 1 @CvePal = CvePal from @tablaLexico
					select top 1  @campM1=lpcPalabraCve from PreV2.LexicoPCve with(nolock) where  lpcClavePalCve = @CvePal 
					select top 1  @campP1=lpcPalabraCve  from PubV2.LexicoPCve with(nolock) where  lpcClavePalCve = @CvePal 
					if  @campM1= @campP1
					begin
						set @Igual='I'
					end
					else
					begin
						set @cadSql1 ='delete from pubV2.LexicoPCve where lpcClavePalCve = ' +  @CvePal
						print @cadSql1
						EXEC (@cadSql1)
						set @cadSql2 = 'INSERT INTO pubV2.LexicoPCve ([lpcClavePalCve],[lpcPalabraCve])
												select [lpcClavePalCve],[lpcPalabraCve]
												from PreV2.LexicoPCve with(nolock) where lpcClavePalCve = ' +  @CvePal
						print @cadSql2
						EXEC  (@cadSql2)	
					end
					delete from @tablaLexico where CvePal= @CvePal
				end
				insert into @tablaLexicoIng select  epcCvePCveIng  from PreV2.EnlacePCveIng with(nolock) where epcCveDesPCveIng =  @CvePalCve
				while exists(select * from @tablaLexicoIng )
				begin
					select top 1 @CvePalIng = CvePalIng from @tablaLexicoIng
					select top 1  @campM1=lpcPalabraCveIng  from PreV2.LexicoPCveing with(nolock) where  lpcClavePalCveIng = @CvePalIng 
					select top 1  @campP1=lpcPalabraCveIng  from PubV2.LexicoPCveing with(nolock) where  lpcClavePalCveIng = @CvePalIng 
					if  @campM1= @campP1
					begin
						set @Igual='I'
					end
					else
					begin
						set @cadSql1 ='delete from pubV2.LexicoPCveIng where lpcClavePalCveIng = ' +  @CvePalIng
						print @cadSql1
						EXEC (@cadSql1)
						set @cadSql2 = 'INSERT INTO pubV2.LexicoPCveIng ([lpcPalabraCveIng],[lpcClavePalCveIng])
												select [lpcPalabraCveIng],[lpcClavePalCveIng]
												from PreV2.LexicoPCveIng with(nolock) where lpcClavePalCveIng = ' +  @CvePalIng
						print @cadSql2
						EXEC  (@cadSql2)
					end
					delete from @tablaLexicoIng where CvePalIng= @CvePalIng
				end
			 delete from @tablaPalCve where cvePC = @CvePalCve
			end
			
		
	--revisar enlace indicador-series
		--select * from PubV2.EnlSerInd where esiClaveInd=339
		--select * from pubv2.EnlSerInd where esiClaveInd=339
		if @CveAtsSer<>''
		begin
			set @cadSql1 =' declare @tablaSerie table (CveSr nvarchar(max), SerOrden nvarchar(max)) insert into @tablaSerie  select esiClaveSerie,esiOrden  from PreV2.EnlSerInd with(nolock) where esiClaveInd =' +  @CveIn  + ' and esiclaveserie in ('+ @CveAtsSer + ')'			
			EXEC (@cadSql1)
			set @cadSql2 ='declare @tablaSerie2 table (CveSr2 nvarchar(max), SerOrden2 nvarchar(max)) insert into @tablaSerie2  select esiClaveSerie,esiOrden  from PreV2.EnlSerInd with(nolock) where esiClaveInd =' +  @CveIn  + ' and esiclaveserie in ('+ @CveAtsSer + ')'
			EXEC (@cadSql2)
			
			--insert into @tablaSerie select esiClaveSerie,esiOrden  from PreV2.EnlSerInd with(nolock) where esiClaveInd = @CveIn
			--insert into @tablaSerie2 select esiClaveSerie,esiOrden  from PreV2.EnlSerInd with(nolock) where esiClaveInd = @CveIn
			set @RowInf=0
			set @RowInf2=0
			if EXISTS (select * from PreV2.EnlSerInd with(nolock) where esiClaveInd = @CveIn)
			begin set @RowInf=1 end
			if EXISTS (select * from PubV2.EnlSerInd with(nolock) where  esiClaveInd = @CveIn)
			begin set @RowInf2=1 end
			--select  @RowInf = COUNT(*) from PreV2.EnlSerInd with(nolock) where esiClaveInd = @CveIn
			--select  @RowInf2 = COUNT(*) from PubV2.EnlSerInd with(nolock) where  esiClaveInd = @CveIn
			set @banEnlIndSer='False'
			if @RowInf=@RowInf2
			begin
				while exists(select * from @tablaSerie2 )
				 begin
					select top 1 @cveSrs = CveSr2, @Orden=SerOrden2  from @tablaSerie2
					set @RowInf=0
					if EXISTS (select * from PubV2.EnlSerInd with(nolock) where  esiClaveInd = @CveIn and esiClaveSerie= @cveSrs and esiOrden= @Orden)
					begin set @RowInf=1 end
					--select  @RowInf = COUNT(*) from PubV2.EnlSerInd with(nolock) where  esiClaveInd = @CveIn and esiClaveSerie= @cveSrs and esiOrden= @Orden
					 if @RowInf = 0
					 Begin  
							set @banEnlIndSer = 'True'
					 end
					delete from @tablaSerie2 where CveSr2= @cveSrs
				 end
				if @banEnlIndSer = 'True'
				begin
					set @cadSql1 ='delete from PubV2.EnlSerInd where  esiClaveInd = ' + @CveIn
					print @cadSql1
					EXEC (@cadSql1)
					set @cadSql2 = 'INSERT INTO PubV2.EnlSerInd ([esiClaveInd],[esiClaveSerie],[esiOrden])
									select [esiClaveInd],[esiClaveSerie],[esiOrden]
									from PreV2.EnlSerInd with(nolock) where esiClaveInd= ' + @CveIn
					print @cadSql2
					EXEC  (@cadSql2) 
				end
			end 
			else
			begin
				set @cadSql1 ='delete from PubV2.EnlSerInd where  esiClaveInd = ' + @CveIn
				print @cadSql1
				EXEC (@cadSql1)
				set @cadSql2 = 'INSERT INTO PubV2.EnlSerInd ([esiClaveInd],[esiClaveSerie],[esiOrden])
								select [esiClaveInd],[esiClaveSerie],[esiOrden]
								from PreV2.EnlSerInd with(nolock) where esiClaveInd = ' + @CveIn
				print @cadSql2
				EXEC  (@cadSql2) 
			end
		end
	--revisar la ficha tecnica
		--select * from PreV2.FichaTecnica where ftClave = 197
		--select * from PubV2.FichaTecnica where ftClave = 197
		set @RowInf=0
		if EXISTS (select * from PubV2.FichaTecnica with(nolock) where ftclave=@CveFicha)
		begin set @RowInf=1 end
		--select  @RowInf = COUNT(*) from PubV2.FichaTecnica with(nolock) where ftclave=@CveFicha
		if @RowInf = 0
		Begin  
			set @cadSql1 = 'INSERT INTO PubV2.FichaTecnica ([ftClave],[ftDefinicion],[ftAlgoritmo],[ftUnidad],[ftImportancia],[ftCobGeo],[ftPeriodo],[ftFecEsp],[ftObs],[ftDefinicionIng],[ftImportanciaIng],[ftObsIng],[ftFecEspIng],[ftDescripCal],[ftDescripCalIng],[ftOportunidad],[ftOportunidadIng],[ftCobGeoft],[ftAlgoritmoIng])
							select [ftClave],[ftDefinicion],[ftAlgoritmo],[ftUnidad],[ftImportancia],[ftCobGeo],[ftPeriodo],[ftFecEsp],[ftObs],[ftDefinicionIng],[ftImportanciaIng],[ftObsIng],[ftFecEspIng],[ftDescripCal],[ftDescripCalIng],[ftOportunidad],[ftOportunidadIng],[ftCobGeoft],[ftAlgoritmoIng]
							from PreV2.FichaTecnica with(nolock) where ftclave= ' + @CveFicha
			print @cadSql1
			EXEC (@cadSql1) 
		end
		else
		begin
			select top 1  @campM1=ftDefinicion,@campM2=ftAlgoritmo,@campM3=ftUnidad,@campM4=ftImportancia,@campM5=ftCobGeo,@campM6=ftPeriodo,@campM7=ftFecEsp,@campM8=ftObs,@campM9=ftDefinicionIng,@campM10=ftImportanciaIng,@campM11=ftObsIng,@campM12=ftFecEspIng,@campM13=ftDescripCal,@campM14=ftDescripCalIng,@campM15=ftOportunidad,@campM16=ftOportunidadIng,@campM17=ftCobGeoft  from PreV2.FichaTecnica with(nolock) where ftClave=@CveFicha
			select top 1  @campP1=ftDefinicion,@campP2=ftAlgoritmo,@campP3=ftUnidad,@campP4=ftImportancia,@campP5=ftCobGeo,@campP6=ftPeriodo,@campP7=ftFecEsp,@campP8=ftObs,@campP9=ftDefinicionIng,@campP10=ftImportanciaIng,@campP11=ftObsIng,@campP12=ftFecEspIng,@campP13=ftDescripCal,@campP14=ftDescripCalIng,@campP15=ftOportunidad,@campP16=ftOportunidadIng,@campP17=ftCobGeoft  from PubV2.FichaTecnica with(nolock) where ftClave=@CveFicha
			if @campM1= @campP1 and @campM2= @campP2 and @campM3= @campP3 and @campM4= @campP4 and @campM5= @campP5 and @campM6= @campP6 and @campM7= @campP7 and @campM8= @campP8 and @campM9= @campP9 and @campM10= @campP10 and @campM11= @campP11 and @campM12= @campP12 and @campM13= @campP13 and @campM14= @campP14 and @campM15= @campP15 and @campM16= @campP16 and @campM17= @campP17 
			begin
				set @Igual='I'
			end
			else 
			begin 
				set @cadSql1 ='delete from PubV2.FichaTecnica  where ftclave= ' + @CveFicha
				print @cadSql1
				EXEC (@cadSql1)
				set @cadSql2 = 'INSERT INTO PubV2.FichaTecnica  ([ftClave],[ftDefinicion],[ftAlgoritmo],[ftUnidad],[ftImportancia],[ftCobGeo],[ftPeriodo],[ftFecEsp],[ftObs],[ftDefinicionIng],[ftImportanciaIng],[ftObsIng],[ftFecEspIng],[ftDescripCal],[ftDescripCalIng],[ftOportunidad],[ftOportunidadIng],[ftCobGeoft],[ftAlgoritmoIng])
								select [ftClave],[ftDefinicion],[ftAlgoritmo],[ftUnidad],[ftImportancia],[ftCobGeo],[ftPeriodo],[ftFecEsp],[ftObs],[ftDefinicionIng],[ftImportanciaIng],[ftObsIng],[ftFecEspIng],[ftDescripCal],[ftDescripCalIng],[ftOportunidad],[ftOportunidadIng],[ftCobGeoft],[ftAlgoritmoIng]
								from PreV2.FichaTecnica with(nolock) where ftclave= ' + @CveFicha
				print @cadSql2
				EXEC  (@cadSql2) 
			end
		end
	--revisar  ficha tecnica y periodo
		--select * from PubV2.Periodo where perClave=197
		--select * from pubv2.Periodo where perClave=197
		set @RowInf=0
		select top 1  @CvePer= ftPeriodo,@CveFtCob=ftCobGeoft  from PreV2.FichaTecnica with(nolock) where ftClave=@CveFicha
		if EXISTS (select  * from PubV2.Periodo with(nolock) where perClave=@CvePer)
		begin set @RowInf=1 end
		--select  @RowInf = COUNT(*) from PubV2.Periodo with(nolock) where perClave=@CvePer
		if @RowInf = 0
		Begin  
			set @cadSql1 = 'INSERT INTO PubV2.Periodo ([perClave],[perDescrip],[perAbrevia],[perDescripIng],[perAbreviaIng])
							select [perClave],[perDescrip],[perAbrevia],[perDescripIng],[perAbreviaIng]
							from PreV2.Periodo with(nolock) where perClave=' + @CvePer
			print @cadSql1
			EXEC (@cadSql1) 
		end
		else
		begin
			select top 1  @campM1=perDescrip,@campM2=perDescripIng,@campM3=perAbrevia,@campM4=perAbreviaIng  from PreV2.Periodo with(nolock) where perClave=@CvePer
			select top 1  @campP1=perDescrip,@campP2=perDescripIng,@campP3=perAbrevia,@campP4=perAbreviaIng  from PubV2.Periodo with(nolock) where perClave=@CvePer
			if @campM1= @campP1 and @campM2= @campP2 and @campM3= @campP3 and @campM4= @campP4 
			begin
				set @Igual='I'
			end
			else 
			begin 
				set @cadSql1 ='delete from PubV2.Periodo  where perClave=' + @CvePer
				print @cadSql1
				EXEC (@cadSql1)
				set @cadSql2 = 'INSERT INTO PubV2.Periodo ([perClave],[perDescrip],[perAbrevia],[perDescripIng],[perAbreviaIng])
								select [perClave],[perDescrip],[perAbrevia],[perDescripIng],[perAbreviaIng]
								from PreV2.Periodo with(nolock) where perClave=' + @CvePer
				print @cadSql2
				EXEC  (@cadSql2) 
			end
		end
	--revisar  ficha tecnica y FTCob
		--select * from PreV2.FTCob where fcgClave=197
		--select * from PubV2.FTCob where fcgClave=197
		set @RowInf=0
		if EXISTS (select  * from PubV2.FTCob with(nolock) where fcgClave=@CveFtCob)
		begin set @RowInf=1 end
		--select  @RowInf = COUNT(*) from PubV2.FTCob with(nolock) where fcgClave=@CveFtCob
		if @RowInf = 0
		Begin  
			set @cadSql1 = 'INSERT INTO PubV2.FTCob ([fcgClave],[fcgDescrip],[fcgDescripIng],[fcgAbrevia],[fcgAbreviaIng])
							select [fcgClave],[fcgDescrip],[fcgDescripIng],[fcgAbrevia],[fcgAbreviaIng]
							from PreV2.FTCob with(nolock) where fcgClave=' + @CveFtCob
			print @cadSql1
			EXEC (@cadSql1) 
		end
		else
		begin
			select top 1  @campM1=fcgDescrip,@campM2=fcgDescripIng,@campM3=fcgAbrevia,@campM4=fcgAbreviaIng from PreV2.FTCob with(nolock) where fcgClave=@CveFtCob
		select top 1  @campP1=fcgDescrip,@campP2=fcgDescripIng,@campP3=fcgAbrevia,@campP4=fcgAbreviaIng from PubV2.FTCob with(nolock) where fcgClave=@CveFtCob
		if @campM1= @campP1 and @campM2= @campP2 and @campM3= @campP3 and @campM4= @campP4 
			begin
				set @Igual='I'
			end
			else 
			begin 
				set @cadSql1 ='delete from PubV2.FTCob where fcgClave=' + @CveFtCob
				print @cadSql1
				EXEC (@cadSql1)
				set @cadSql2 = 'INSERT INTO PubV2.FTCob ([fcgClave],[fcgDescrip],[fcgDescripIng],[fcgAbrevia],[fcgAbreviaIng])
								select [fcgClave],[fcgDescrip],[fcgDescripIng],[fcgAbrevia],[fcgAbreviaIng]
								from PreV2.FTCob with(nolock) where fcgClave=' + @CveFtCob
				print @cadSql2
				EXEC  (@cadSql2) 
			end
		end
	--revisar enlaces entre ficha tecnica y fuentes
		--select * from PreV2.EnlFTMFte where effClave=197
		--select * from PubV2.EnlFTMFte where effClave=197
		set @RowInf=0
		set @RowInf2=0
		insert into @tablafue select effClaveFue  from PreV2.EnlFTMFte with(nolock) where effClave = @CveFicha
		if EXISTS (select * from PreV2.EnlFTMFte with(nolock) where effClave = @CveFicha)
		begin set @RowInf=1 end
		if EXISTS (select * from PubV2.EnlFTMFte with(nolock) where effClave = @CveFicha)
		begin set @RowInf2=1 end
		--select  @RowInf = COUNT(*) from PreV2.EnlFTMFte with(nolock) where effClave = @CveFicha
		--select  @RowInf2 = COUNT(*) from PubV2.EnlFTMFte with(nolock) where  effClave = @CveFicha
		set @banEnlIndSer='False'
		--enlaces fuente fichatecnica
		if @RowInf=@RowInf2
		begin
			while exists(select * from @tablafue)
			 begin
				select top 1 @CveFuente= cF  from @tablafue
				set @RowInf=0
				if EXISTS (select * from PubV2.EnlFTMFte with(nolock) where effClave  = @CveFicha and effClaveFue = @CveFuente)
				begin set @RowInf=1 end
				--select  @RowInf = COUNT(*) from PubV2.EnlFTMFte with(nolock) where effClave  = @CveFicha and effClaveFue = @CveFuente
				 if @RowInf = 0
				 Begin  
						set @banEnlIndSer = 'True'
				 end
				delete from @tablafue where cf= @CveFuente
			 end
			if @banEnlIndSer = 'True'
			begin
				set @cadSql1 ='delete from PubV2.EnlFTMFte where  effClave = ' + @CveFicha
				print @cadSql1
				EXEC (@cadSql1)
				set @cadSql2 = 'INSERT INTO PubV2.EnlFTMFte ([effClave],[effClaveFue],[effOrden])
								select [effClave],[effClaveFue],[effOrden]
								from PreV2.EnlFTMFte with(nolock) where effClave = ' + @CveFicha
				print @cadSql2
				EXEC  (@cadSql2) 
			end
		end 
		else
		begin
			set @cadSql1 ='delete from PubV2.EnlFTMFte where  effClave = ' + @CveFicha
			print @cadSql1
			EXEC (@cadSql1)
			set @cadSql2 = 'INSERT INTO PubV2.EnlFTMFte ([effClave],[effClaveFue],[effOrden])
							select [effClave],[effClaveFue],[effOrden]
							from PreV2.EnlFTMFte with(nolock) where effClave = ' + @CveFicha
			print @cadSql2
			EXEC  (@cadSql2) 
		end
		--fuentes
		insert into @tablafue select effClaveFue  from PreV2.EnlFTMFte with(nolock) where effClave = @CveFicha
		while exists(select * from @tablafue )
				 begin
						set @RowInf=0
						select top 1 @CveFuente = cF  from @tablafue
						if EXISTS (select * from PubV2.Fuentes with(nolock) where fueClave= @CveFuente)
						begin set @RowInf=1 end
						--select  @RowInf = COUNT(*) from PubV2.Fuentes with(nolock) where fueClave= @CveFuente
						 if @RowInf = 0
						 Begin  
								set @cadSql1 = 'INSERT INTO PubV2.Fuentes ([fueClave],[fueDescrip],[fueDescripIng])
										select [fueClave],[fueDescrip],[fueDescripIng]
										from PreV2.Fuentes with(nolock) where fueClave= ' + @CveFuente
								print @cadSql1
								EXEC (@cadSql1) 
						 end
						 else
						 begin
								select top 1  @campM1=fueDescrip,@campM2=fueDescripIng from PreV2.Fuentes with(nolock) where fueClave=@CveFuente
								select top 1  @campP1=fueDescrip,@campP2=fueDescripIng from PubV2.Fuentes with(nolock) where fueClave=@CveFuente
								if @campM1= @campP1 and @campM2= @campP2	
								begin
									set @Igual='I'
								end
								else
								begin
									set @cadSql1 ='delete from PubV2.Fuentes where  fueClave= ' + @CveFuente
									print @cadSql1
									EXEC (@cadSql1)
									set @cadSql2 = 'INSERT INTO PubV2.Fuentes ([fueClave],[fueDescrip],[fueDescripIng])
											select [fueClave],[fueDescrip],[fueDescripIng]
											from PreV2.Fuentes with(nolock) where fueClave= ' + @CveFuente
									print @cadSql2
									EXEC  (@cadSql2) 
								end
						 end
						 
						delete from @tablafue where cF= @CveFuente
		end--while fuente
		--revisar enlaces entre ficha tecnica e instituciones
			--select * from PreV2.EnlFTRInst where efiClave=197
			--select * from PubV2.EnlFTRInst where efiClave=197
			
			--enlace institucion fichatecnica
			insert into @tablaIns select efiClaveInst  from PreV2.EnlFTRInst with(nolock) where efiClave = @CveFicha
			--select  @RowInf = COUNT(*) from PreV2.EnlFTRInst with(nolock) where efiClave = @CveFicha
			--select  @RowInf2 = COUNT(*) from PubV2.EnlFTRInst with(nolock) where  efiClave = @CveFicha
			set @RowInf=0
			set @RowInf2=0
			if EXISTS (select  * from PreV2.EnlFTRInst with(nolock) where efiClave = @CveFicha)
			begin set @RowInf=1 end
			if EXISTS (select * from PubV2.EnlFTRInst with(nolock) where  efiClave = @CveFicha)
			begin set @RowInf2=1 end
			set @banEnlIndSer='False'
			--enlaces fuente fichatecnica
			if @RowInf=@RowInf2
			begin
				while exists(select * from @tablaIns)
				 begin
					select top 1 @CveIns= cI from @tablaIns
					--select  @RowInf = COUNT(*) from PubV2.EnlFTRInst with(nolock) where efiClave  = @CveFicha and efiClaveInst = @CveIns
					if EXISTS (select * from PubV2.EnlFTRInst with(nolock) where efiClave  = @CveFicha and efiClaveInst = @CveIns)
					begin set @RowInf=1 end
					 if @RowInf = 0
					 Begin  
							set @banEnlIndSer = 'True'
					 end
					delete from @tablaIns where cI= @CveIns
				 end
				if @banEnlIndSer = 'True'
				begin
					set @cadSql1 ='delete from PubV2.EnlFTRInst where  efiClave = ' + @CveFicha
					print @cadSql1
					EXEC (@cadSql1)
					set @cadSql2 = 'INSERT INTO PubV2.EnlFTRInst ( [efiClave],[efiClaveInst],[efiOrden])
									select  [efiClave],[efiClaveInst],[efiOrden]
									from PreV2.EnlFTRInst with(nolock) where effClave = ' + @CveFicha
					print @cadSql2
					EXEC  (@cadSql2) 
				end
			end 
			else
			begin
				set @cadSql1 ='delete from PubV2.EnlFTRInst where  efiClave = ' + @CveFicha
				print @cadSql1
				EXEC (@cadSql1)
				set @cadSql2 = 'INSERT INTO PubV2.EnlFTRInst ( [efiClave],[efiClaveInst],[efiOrden])
								select  [efiClave],[efiClaveInst],[efiOrden]
								from PreV2.EnlFTRInst with(nolock) where efiClave = ' + @CveFicha
				print @cadSql2
				EXEC  (@cadSql2) 
			end
		
		--institucion	
			 insert into @tablaIns select efiClaveInst  from PreV2.EnlFTRInst with(nolock) where efiClave = @CveFicha
			 while exists(select * from @tablaIns )
				 begin
						select top 1 @CveIns = cI  from @tablaIns
						--select  @RowInf = COUNT(*) from PubV2.Institucion with(nolock) where insClave= @CveIns
						if EXISTS (select * from PubV2.Institucion with(nolock) where insClave= @CveIns)
						begin set @RowInf=1 end
						 if @RowInf = 0
						 Begin  
								set @cadSql1 = 'INSERT INTO PubV2.Institucion ([insClave],[insDescrip],[insURL],[insAbrevia],[insDescripIng],[insAbreviaIng])
										select [insClave],[insDescrip],[insURL],[insAbrevia],[insDescripIng],[insAbreviaIng]
										from PreV2.Institucion with(nolock) where insClave=' +  @CveIns
								print @cadSql1
								EXEC (@cadSql1) 
						 end
						 else
						 begin
								select top 1  @campM1=insDescrip,@campM2=insDescripIng,@campM3=insAbrevia,@campM4=insAbreviaIng,@campM5=insURL from PreV2.Institucion with(nolock) where insClave=@CveIns
								select top 1  @campP1=insDescrip,@campP2=insDescripIng,@campP3=insAbrevia,@campP4=insAbreviaIng,@campP5=insURL from PubV2.Institucion with(nolock) where insClave=@CveIns
								if @campM1= @campP1 and @campM2= @campP2 and @campM3= @campP3 and @campM4= @campP4 and @campM5= @campP5	
								begin
									set @Igual='I'
								end
								else
								begin
									set @cadSql1 ='delete from PubV2.Institucion where  insClave=' +  @CveIns
									print @cadSql1
									EXEC (@cadSql1)
									set @cadSql2 = 'INSERT INTO PubV2.Institucion ([insClave],[insDescrip],[insURL],[insAbrevia],[insDescripIng],[insAbreviaIng])
											select [insClave],[insDescrip],[insURL],[insAbrevia],[insDescripIng],[insAbreviaIng]
											from PreV2.Institucion with(nolock) where insClave=' +  @CveIns
									print @cadSql2
									EXEC  (@cadSql2) 
								end
						 end
						 
						delete from @tablaIns where cI= @CveIns
			end--while instituciones
		--revisar enlaces entre ficha tecnica y referencia internacional
			--select * from PreV2.EnlFTRRI where efrClave=197
			--select * from PubV2.EnlFTRRI where efrClave=197
			--enlace referencia internacional fichatecnica
			insert into @tablaRI select efrClaveRI  from PreV2.EnlFTRRI with(nolock) where efrClave = @CveFicha
			--select  @RowInf = COUNT(*) from PreV2.EnlFTRRI with(nolock) where efrClave = @CveFicha
			--select  @RowInf2 = COUNT(*) from PubV2.EnlFTRRI with(nolock) where  efrClave = @CveFicha
			set @RowInf=0
			set @RowInf2=0
			if EXISTS (select * from PreV2.EnlFTRRI with(nolock) where efrClave = @CveFicha)
			begin set @RowInf=1 end
			if EXISTS (select * from PubV2.EnlFTRRI with(nolock) where efrClave = @CveFicha)
			begin set @RowInf2=1 end
			set @banEnlIndSer='False'
			--enlaces fuente fichatecnica
			if @RowInf=@RowInf2
			begin
				while exists(select * from @tablaRI)
				 begin
					select top 1 @CveRI= cR from @tablaRI
					--select  @RowInf = COUNT(*) from PubV2.EnlFTRRI with(nolock) where efrClave  = @CveFicha and efrClaveRI = @CveRI
					if EXISTS (select  * from PubV2.EnlFTRRI with(nolock) where efrClave  = @CveFicha and efrClaveRI = @CveRI)
					begin set @RowInf=1 end
					 if @RowInf = 0
					 Begin  
							set @banEnlIndSer = 'True'
					 end
					delete from @tablaRI where cR= @CveRI
				 end
				if @banEnlIndSer = 'True'
				begin
					set @cadSql1 ='delete from PubV2.EnlFTRRI where  efrClave = ' + @CveFicha
					print @cadSql1
					EXEC (@cadSql1)
					set @cadSql2 = 'INSERT INTO PubV2.EnlFTRRI ( [efrClave],[efrClaveRI],[efrOrden])
									select [efrClave],[efrClaveRI],[efrOrden]
									from PreV2.EnlFTRRI with(nolock) where efrClave = ' + @CveFicha
					print @cadSql2
					EXEC  (@cadSql2) 
				end
			end 
			else
			begin
				set @cadSql1 ='delete from PubV2.EnlFTRRI where  efrClave = ' + @CveFicha
				print @cadSql1
				EXEC (@cadSql1)
				set @cadSql2 = 'INSERT INTO PubV2.EnlFTRRI ( [efrClave],[efrClaveRI],[efrOrden])
								select  [efrClave],[efrClaveRI],[efrOrden]
								from PreV2.EnlFTRRI with(nolock) where efrClave = ' + @CveFicha
				print @cadSql2
				EXEC  (@cadSql2) 
			end
			
			--Referencia internacional
			 insert into @tablaRI select efrClaveRI  from PreV2.EnlFTRRI with(nolock) where efrClave = @CveFicha
			 while exists(select * from @tablaRI )
				 begin
						select top 1 @CveRI = cR  from @tablaRI
						--select  @RowInf = COUNT(*) from PubV2.RefInter with(nolock) where riClave= @CveRI
						set @RowInf=0
						if EXISTS (select * from PubV2.RefInter with(nolock) where riClave= @CveRI)
						begin set @RowInf=1 end
						 if @RowInf = 0
						 Begin  
								set @cadSql1 = 'INSERT INTO PubV2.RefInter ([riClave],[riDescrip],[riDescripIng])
										select [riClave],[riDescrip],[riDescripIng]
										from PreV2.RefInter with(nolock) where riClave=' + @CveRI
								print @cadSql1
								EXEC (@cadSql1) 
						 end
						 else
						 begin
								select top 1  @campM1=riDescrip,@campM2=riDescripIng  from PreV2.RefInter with(nolock) where riClave=@CveRI
								select top 1  @campP1=riDescrip,@campP2=riDescripIng  from PubV2.RefInter with(nolock) where riClave=@CveRI
								if @campM1= @campP1 and @campM2= @campP2	
								begin
									set @Igual='I'
								end
								else
								begin
									set @cadSql1 ='delete from PubV2.RefInter where riClave=' + @CveRI
									print @cadSql1
									EXEC (@cadSql1)
									set @cadSql2 = 'INSERT INTO PubV2.RefInter ([riClave],[riDescrip],[riDescripIng])
											select [riClave],[riDescrip],[riDescripIng]
											from PreV2.RefInter with(nolock) where riClave=' + @CveRI
									print @cadSql2
									EXEC  (@cadSql2) 
								end
						 end
						 
						delete from @tablaRI where cR= @CveRI
			end--while Referencia internacional
		--revisar enlaces entre ficha tecnica y contacto
			--select * from PreV2.EnlFTCon where efcClaveFT=197
			--select * from PubV2.EnlFTCon where efcClaveFT=197	 
			--enlace contacto ficha tecnica
			--enlace referencia internacional fichatecnica
			insert into @tablaCo select efcClaveCon  from PreV2.EnlFTCon with(nolock) where efcClaveFT = @CveFicha
			--select  @RowInf = COUNT(*) from PreV2.EnlFTCon with(nolock) where efcClaveFT = @CveFicha
			--select  @RowInf2 = COUNT(*) from PubV2.EnlFTCon with(nolock) where  efcClaveFT = @CveFicha
			set @RowInf=0
			set @RowInf2=0
			if EXISTS (select * from PreV2.EnlFTCon with(nolock) where efcClaveFT = @CveFicha)
			begin set @RowInf=1 end
			if EXISTS (select * from PubV2.EnlFTCon with(nolock) where  efcClaveFT = @CveFicha)
			begin set @RowInf2=1 end
			set @banEnlIndSer='False'
			--enlaces fuente fichatecnica
			if @RowInf=@RowInf2
			begin
				while exists(select * from @tablaCo)
				 begin
					select top 1 @CveCo= cC from @tablaCo
					set @RowInf=0
					if EXISTS (select * from PubV2.EnlFTCon with(nolock) where efcClaveFT  = @CveFicha and efcClaveCon = @CveCo)
					begin set @RowInf=1 end
					--select  @RowInf = COUNT(*) from PubV2.EnlFTCon with(nolock) where efcClaveFT  = @CveFicha and efcClaveCon = @CveCo
					 if @RowInf = 0
					 Begin  
							set @banEnlIndSer = 'True'
					 end
					delete from @tablaCo where cC= @CveCo
				 end
				if @banEnlIndSer = 'True'
				begin
					set @cadSql1 ='delete from PubV2.EnlFTCon where  efcClaveFT = ' + @CveFicha
					print @cadSql1
					EXEC (@cadSql1)
					set @cadSql2 = 'INSERT INTO PubV2.EnlFTCon ([efcClaveFT],[efcClaveCon],[efcOrden])
									select [efcClaveFT],[efcClaveCon],[efcOrden]
									from PreV2.EnlFTCon with(nolock) where efcClaveFT = ' + @CveFicha
					print @cadSql2
					EXEC  (@cadSql2) 
				end
			end 
			else
			begin
				set @cadSql1 ='delete from PubV2.EnlFTCon where  efcClaveFT = ' + @CveFicha
				print @cadSql1
				EXEC (@cadSql1)
				set @cadSql2 = 'INSERT INTO PubV2.EnlFTCon ( [efcClaveFT],[efcClaveCon],[efcOrden])
								select  [efcClaveFT],[efcClaveCon],[efcOrden]
								from PreV2.EnlFTCon with(nolock) where efcClaveFT = ' + @CveFicha
				print @cadSql2
				EXEC  (@cadSql2) 
			end
			--contacto
			 insert into @tablaCo select efcClaveCon  from PreV2.EnlFTCon with(nolock) where efcClaveFT = @CveFicha
			 while exists(select * from @tablaCo )
				 begin
						select top 1 @CveCo = cC  from @tablaCo
						set @RowInf=0
						if EXISTS (select * from PubV2.Contacto with(nolock) where conClave= @CveCo)
						begin set @RowInf=1 end
						--select  @RowInf = COUNT(*) from PubV2.Contacto with(nolock) where conClave= @CveCo
						 if @RowInf = 0
						 Begin  
								set @cadSql1 = 'INSERT INTO PubV2.Contacto ([conClave],[conNombre],[conPuesto],[conTelefono],[conCorreo],[conDomicilio])
										select [conClave],[conNombre],[conPuesto],[conTelefono],[conCorreo],[conDomicilio]
										from PreV2.Contacto with(nolock) where conClave= ' + @CveCo
								print @cadSql1
								EXEC (@cadSql1) 
						 end
						 else
						 begin
								select top 1  @campM1=conNombre, @campM2=conPuesto, @campM3=conTelefono, @campM4=conCorreo, @campM5=conDomicilio  from PreV2.Contacto with(nolock) where conClave=@CveCo
								select top 1  @campP1=conNombre, @campP2=conPuesto, @campP3=conTelefono, @campP4=conCorreo, @campP5=conDomicilio  from PubV2.Contacto with(nolock) where conClave=@CveCo
								if @campM1= @campP1 and @campM2= @campP2 and @campM3= @campP3 and @campM4= @campP4 and @campM5= @campP5	
								begin
									set @Igual='I'
								end
								else
								begin
									set @cadSql1 ='delete from PubV2.Contacto where conClave= ' + @CveCo
									print @cadSql1
									EXEC (@cadSql1)
									set @cadSql2 = 'INSERT INTO PubV2.Contacto ([conClave],[conNombre],[conPuesto],[conTelefono],[conCorreo],[conDomicilio])
											select [conClave],[conNombre],[conPuesto],[conTelefono],[conCorreo],[conDomicilio]
											from PreV2.Contacto with(nolock) where conClave= ' + @CveCo
									print @cadSql2
									EXEC  (@cadSql2) 
								end
						 end
						 
						delete from @tablaCo where cC= @CveCo
			end--while contacto				 
	
	--revisar atributos de las series
		--declare @tablaSerie table (CveSr nvarchar(max), CveDescr nvarchar(max), CveFrec nvarchar(max), CveNota nvarchar(max), CveFuente nvarchar(max), CveUni nvarchar(max), CveAgClas nvarchar (max),CveAgCob nvarchar(max))
		--select * from PreV2.AtrSerie where atsClaveSerie in (822,823,824)
		--select * from PubV2.AtrSerie where atsClaveSerie in (822,823,824)
		if @CveAtsSer<>''
		begin
		 while exists(select * from @tablaSerie )
		  begin
				select top 1 @cveSrs = CveSr from @tablaSerie 
				 --revisar notas de los datos
				
				  insert into @tablaNotasDatos   select sernota  from PreV2.serie with(nolock) where serclave = @cveSrs and serNota<>0
				  while exists(select * from @tablaNotasDatos  )
					 begin
						select top 1 @cveNotasDat = cveNotDat from @tablaNotasDatos 
						if @cveNotasDat IS not NULL  and @cveNotasDat <>0
						begin
							print 'Nota en datos'
							select top 1  @campM1= notClave, @campM2=notNota, @campM3=notNotaIng  from PreV2.Notas with(nolock) where notClave = @cveNotasDat
							select top 1  @campP1= notClave, @campP2=notNota, @campP3=notNotaIng  from PubV2.Notas with(nolock) where notClave = @cveNotasDat
							if @campM1= @campP1 and @campM2= @campP2 and @campM3= @campP3 
							Begin  
								set @Igual='I'
							end
							else
							begin
								print 'Nota en datos ejec'
								print @cveNotasDat
								set @cadSql1 ='delete from pubV2.notas where notclave = ' + Convert(nvarchar(255),@cveNotasDat)
								print 'Nota en datos despues'
								print @cadSql1
								EXEC (@cadSql1)
								set @cadSql2 = 'INSERT INTO pubV2.Notas ([notclave],[notnota],[notnotaIng])
									select [notclave],[notnota],[notnotaIng]
									from PreV2.Notas with(nolock) where notclave = ' + Convert(nvarchar(255),@cveNotasDat)
								print @cadSql2
								EXEC  (@cadSql2) 
							end
						end
						delete from @tablaNotasDatos where cveNotDat= @cveNotasDat
					 end
				
				
				
				
				--insert into @tablaAtrSer select atsClaveSerie,atsClaveDescrip,atsClaveFre,atsClaveNota,atsClaveFuente,atsClaveUnidad,atsClaveAgrupaCob,atsClaveAgrupaClas  from PreV2.AtrSerie with(nolock) where atsClaveSerie = @CveSrs
				select top 1  @CveDescr=atsClaveDescrip, @CveFrec=atsClaveFre, @CveNota=atsClaveNota,  @CveFuente=atsClaveFuente,@CveUni=atsClaveUnidad,@CveAgCob=atsClaveAgrupaCob,@CveAgClas=atsClaveAgrupaClas from PreV2.AtrSerie with(nolock) where atsClaveSerie=@cveSrs
				--atrSerie
				set @RowInf=0
				if EXISTS (select * from PubV2.AtrSerie with(nolock) where atsClaveSerie = @cveSrs)
				begin set @RowInf=1 end
				--select  @RowInf = COUNT(*) from PubV2.AtrSerie with(nolock) where atsClaveSerie = @cveSrs
				 if @RowInf= 0
					Begin  
						set @cadSql1 = 'INSERT INTO PubV2.AtrSerie ([atsClaveSerie],[atsClaveDescrip] ,[atsClaveFre] ,[atsAAPrelim],[atsMMPrelim],[atsDDPrelim],[atsAAEst],[atsMMEst],[atsDDEst],[atsDecimales],[atsClaveNota],[atsClaveFT],[atsClaveFuente],[atsClaveUnidad],[atsTipo] ,[atsSalida],[atsAARev],[atsMMRev],[atsDDRev],[atsClaveAgrupaCob],[atsClaveAgrupaClas],[atsColMatriz],[atsColMatrizIng],[atsTipoGra],[atsInicio],[atsTipoCua])
									select [atsClaveSerie],[atsClaveDescrip] ,[atsClaveFre] ,[atsAAPrelim],[atsMMPrelim],[atsDDPrelim],[atsAAEst],[atsMMEst],[atsDDEst],[atsDecimales],[atsClaveNota],[atsClaveFT],[atsClaveFuente],[atsClaveUnidad],[atsTipo] ,[atsSalida],[atsAARev],[atsMMRev],[atsDDRev],[atsClaveAgrupaCob],[atsClaveAgrupaClas],[atsColMatriz],[atsColMatrizIng],[atsTipoGra],[atsInicio],[atsTipoCua]
									from PreV2.AtrSerie with(nolock) where atsClaveSerie = ' + @cveSrs
						print @cadSql1
						EXEC (@cadSql1) 
					end
					else
					begin
						select top 1  @campM1=atsClaveDescrip, @campM2=atsClaveFre, @campM3=atsAAPrelim, @campM4=atsMMPrelim, @campM5=atsDDPrelim, @campM6=atsAAEst, @campM7=atsMMEst, @campM8=atsDDEst, @campM9=atsDecimales, @campM10=atsClaveNota, @campM11=atsClaveFT, @campM12=atsClaveFuente,@campM13=atsClaveUnidad,@campM14=atsTipo,@campM15=atsSalida,@campM16=atsAARev,@campM17=atsMMRev,@campM18=atsDDRev,@campM19=atsClaveAgrupaCob,@campM20=atsClaveAgrupaClas,@campM21=atsColMatriz,@campM22=atsColMatrizIng,@campM23=atsTipoGra,@campM24=atsInicio,@campM25=atsTipoCua  from PreV2.AtrSerie with(nolock) where atsClaveSerie=@cveSrs
						select top 1  @campP1=atsClaveDescrip, @campP2=atsClaveFre, @campP3=atsAAPrelim, @campP4=atsMMPrelim, @campP5=atsDDPrelim, @campP6=atsAAEst, @campP7=atsMMEst, @campP8=atsDDEst, @campP9=atsDecimales, @campP10=atsClaveNota, @campP11=atsClaveFT, @campP12=atsClaveFuente,@campP13=atsClaveUnidad,@campP14=atsTipo,@campP15=atsSalida,@campP16=atsAARev,@campP17=atsMMRev,@campP18=atsDDRev,@campP19=atsClaveAgrupaCob,@campP20=atsClaveAgrupaClas,@campP21=atsColMatriz,@campP22=atsColMatrizIng,@campP23=atsTipoGra,@campP24=atsInicio,@campP25=atsTipoCua  from PubV2.AtrSerie with(nolock) where atsClaveSerie=@cveSrs
						if @campM1= @campP1 and @campM2= @campP2 and @campM3= @campP3 and @campM4= @campP4  and @campM5= @campP5  and @campM6= @campP6  and @campM7= @campP7  and @campM8= @campP8 and @campM9= @campP9  and @campM10= @campP10 and @campM11= @campP11 and @campM12= @campP12 and @campM13= @campP13 and @campM14= @campP14 and @campM15= @campP15 and @campM16= @campP16 and @campM17= @campP17 and @campM18= @campP18 and @campM19= @campP19 and @campM20= @campP20 and @campM21= @campP21 and @campM22= @campP22 and @campM23= @campP23 and @campM24= @campP24 and @campM25= @campP25                                
						begin
							set @Igual='I'
						end
						else 
						begin 
							set @cadSql1 ='delete from PubV2.AtrSerie where atsClaveSerie = ' + @cveSrs
							print @cadSql1
							EXEC (@cadSql1)
							set @cadSql2 = 'INSERT INTO PubV2.AtrSerie ([atsClaveSerie],[atsClaveDescrip] ,[atsClaveFre] ,[atsAAPrelim],[atsMMPrelim],[atsDDPrelim],[atsAAEst],[atsMMEst],[atsDDEst],[atsDecimales],[atsClaveNota],[atsClaveFT],[atsClaveFuente],[atsClaveUnidad],[atsTipo] ,[atsSalida],[atsAARev],[atsMMRev],[atsDDRev],[atsClaveAgrupaCob],[atsClaveAgrupaClas],[atsColMatriz],[atsColMatrizIng],[atsTipoGra],[atsInicio],[atsTipoCua])
											select [atsClaveSerie],[atsClaveDescrip] ,[atsClaveFre] ,[atsAAPrelim],[atsMMPrelim],[atsDDPrelim],[atsAAEst],[atsMMEst],[atsDDEst],[atsDecimales],[atsClaveNota],[atsClaveFT],[atsClaveFuente],[atsClaveUnidad],[atsTipo] ,[atsSalida],[atsAARev],[atsMMRev],[atsDDRev],[atsClaveAgrupaCob],[atsClaveAgrupaClas],[atsColMatriz],[atsColMatrizIng],[atsTipoGra],[atsInicio],[atsTipoCua]
											from PreV2.AtrSerie with(nolock) where atsClaveSerie = ' + @cveSrs
							print @cadSql2
							EXEC  (@cadSql2) 
						end
					end
				--Descripcion
				--revisar claves de descripcion
				--select * from PreV2.Descripcion where desClave  in (1055,1193,1195)
				--select * from PubV2.Descripcion where desClave  in (1055,1193,1195)
				set @RowInf=0
				if EXISTS (select * from PubV2.Descripcion with(nolock) where desClave = @CveDescr)
				begin set @RowInf=1 end
				--select  @RowInf = COUNT(*) from PubV2.Descripcion with(nolock) where desClave = @CveDescr
				 if @RowInf= 0
					Begin  
						set @cadSql1 = 'INSERT INTO PubV2.Descripcion ([desClave],[desDescrip],[desAbrevia],[desCodigo],[desDescripIng],[desAbreviaIng],[desCodigoIng])
									select [desClave],[desDescrip],[desAbrevia],[desCodigo],[desDescripIng],[desAbreviaIng],[desCodigoIng]
									from PreV2.Descripcion with(nolock) where desClave = ' +  @CveDescr
						print @cadSql1
						EXEC (@cadSql1) 
					end
					else
					begin
						select top 1  @campM1=desdescrip, @campM2=desAbrevia, @campM3=desCodigo, @campM4=desDescripIng, @campM5=desAbreviaIng, @campM6=desCodigoIng  from PreV2.Descripcion with(nolock) where desclave=@CveDescr
						select top 1  @campP1=desdescrip, @campP2=desAbrevia, @campP3=desCodigo, @campP4=desDescripIng, @campP5=desAbreviaIng, @campP6=desCodigoIng  from PubV2.Descripcion with(nolock) where desclave=@CveDescr
						if @campM1= @campP1 and @campM2= @campP2 and @campM3= @campP3 and @campM4= @campP4 and @campM5= @campP5 and @campM6= @campP6
						begin
							set @Igual='I'
						end
						else 
						begin 
							set @cadSql1 ='delete from PubV2.Descripcion where desClave = ' +  @CveDescr
							print @cadSql1
							EXEC (@cadSql1)
							set @cadSql2 = 'INSERT INTO PubV2.Descripcion ([desClave],[desDescrip],[desAbrevia],[desCodigo],[desDescripIng],[desAbreviaIng],[desCodigoIng])
											select [desClave],[desDescrip],[desAbrevia],[desCodigo],[desDescripIng],[desAbreviaIng],[desCodigoIng]
											from PreV2.Descripcion with(nolock) where desClave = ' +  @CveDescr
							print @cadSql2
							EXEC  (@cadSql2) 
						end
					end
				----revisar enlace y lexico de la descripcion
				--set @cadSql1 ='delete from PubV2.Enlace where enlClaveDescrip = ' +  @CveDescr
				--print @cadSql1
				--EXEC (@cadSql1)
				--set @cadSql2 = 'INSERT INTO PubV2.Enlace ([enlClavePalabra],[enlClaveDescrip])
				--							select [enlClavePalabra],[enlClaveDescrip]
				--							from PreV2.Enlace with(nolock) where enlClaveDescrip = ' +  @CveDescr
				--print @cadSql2
				--EXEC  (@cadSql2)
				--set @cadSql1 ='delete from PubV2.EnlaceIng where enlClaveDescripIng = ' +  @CveDescr
				--print @cadSql1
				--EXEC (@cadSql1)
				--set @cadSql2 = 'INSERT INTO PubV2.EnlaceIng ([enlClavePalabraIng],[enlClaveDescripIng])
				--							select [enlClavePalabraIng],[enlClaveDescripIng]
				--							from PreV2.EnlaceIng with(nolock) where enlClaveDescripIng = ' +  @CveDescr
				--print @cadSql2
				--EXEC  (@cadSql2)
				--insert into @tablaLexico select  enlClavePalabra  from PreV2.Enlace with(nolock) where enlClaveDescrip = @CveDescr
				--while exists(select * from @tablaLexico )
				--begin
				--	select top 1 @CvePal = CvePal from @tablaLexico
				--	select top 1  @campM1=lexPalabra  from PreV2.Lexico with(nolock) where  lexClavePalabra = @CvePal 
				--	select top 1  @campP1=lexPalabra  from PubV2.Lexico with(nolock) where  lexClavePalabra = @CvePal 
				--	if  @campM1= @campP1
				--	begin
				--		set @Igual='I'
				--	end
				--	else
				--	begin
				--		set @cadSql1 ='delete from PubV2.Lexico where lexclavepalabra = ' +  @CvePal
				--		print @cadSql1
				--		EXEC (@cadSql1)
				--		set @cadSql2 = 'INSERT INTO PubV2.Lexico ([lexclavepalabra],[lexPalabra])
				--								select [lexclavepalabra],[lexPalabra]
				--								from PreV2.Lexico with(nolock) where lexclavepalabra = ' +  @CvePal
				--		print @cadSql2
				--		EXEC  (@cadSql2)	
				--	end
				--	delete from @tablaLexico where CvePal= @CvePal
		  --      end
		  --      insert into @tablaLexicoIng select  enlClavePalabraIng  from PreV2.EnlaceIng with(nolock) where enlClaveDescripIng = @CveDescr
				--while exists(select * from @tablaLexicoIng )
				--begin
				--	select top 1 @CvePalIng = CvePalIng from @tablaLexicoIng
				--	select top 1  @campM1=lexPalabraing  from PreV2.Lexicoing with(nolock) where  lexClavePalabraing = @CvePalIng 
				--	select top 1  @campP1=lexPalabraing  from PubV2.Lexicoing with(nolock) where  lexClavePalabraing = @CvePalIng 
				--	if  @campM1= @campP1
				--	begin
				--		set @Igual='I'
				--	end
				--	else
				--	begin
				--		set @cadSql1 ='delete from PubV2.LexicoIng where lexclavepalabraIng = ' +  @CvePalIng
				--		print @cadSql1
				--		EXEC (@cadSql1)
				--		set @cadSql2 = 'INSERT INTO PubV2.LexicoIng ([lexclavepalabraIng],[lexPalabraIng])
				--								select [lexclavepalabraIng],[lexPalabraIng]
				--								from PreV2.LexicoIng with(nolock) where lexclavepalabraIng = ' +  @CvePalIng
				--		print @cadSql2
				--		EXEC  (@cadSql2)
				--	end
				--	delete from @tablaLexicoIng where CvePalIng= @CvePalIng
		  --      end
				 
					
				--Frecuencia
				--revisar la clave de frecuencia de las series
				--select * from PubV2.Frecuencia where freClave = 13
				--select * from pubv2.Frecuencia where freClave = 13
				set @RowInf=0
				if EXISTS (select * from PubV2.Frecuencia with(nolock) where freClave = @CveFrec)
				begin set @RowInf=1 end
				--select  @RowInf = COUNT(*) from PubV2.Frecuencia with(nolock) where freClave = @CveFrec
				 if @RowInf= 0
					Begin  
						set @cadSql1 = 'INSERT INTO PubV2.Frecuencia ([freClave],[freDescrip],[freCodigo],[freNumAA],[freNumMM],[freNumQQ],[freTipo],[freDescripIng])
									select [freClave],[freDescrip],[freCodigo],[freNumAA],[freNumMM],[freNumQQ],[freTipo],[freDescripIng]
									from PreV2.Frecuencia with(nolock) where freClave = ' + @CveFrec
						print @cadSql1
						EXEC (@cadSql1) 
					end
					else
					begin
						select top 1  @campM1=freDescrip,@campM2=freCodigo,@campM3=freNumAA,@campM4=freNumMM,@campM5=freNumQQ,@campM6=freTipo,@campM7=freDescripIng from PreV2.Frecuencia with(nolock) where freClave=@CveFrec
						select top 1  @campP1=freDescrip,@campP2=freCodigo,@campP3=freNumAA,@campP4=freNumMM,@campP5=freNumQQ,@campP6=freTipo,@campP7=freDescripIng from PubV2.Frecuencia with(nolock) where freClave=@CveFrec
						if @campM1= @campP1 and @campM2= @campP2 and @campM3= @campP3 and @campM4= @campP4 and @campM5= @campP5 and @campM6= @campP6 and @campM7= @campP7
						begin
							set @Igual='I'
						end
						else 
						begin 
							set @cadSql1 ='delete from PubV2.Frecuencia where freClave = ' + @CveFrec
							print @cadSql1
							EXEC (@cadSql1)
							set @cadSql2 = 'INSERT INTO PubV2.Frecuencia ([freClave],[freDescrip],[freCodigo],[freNumAA],[freNumMM],[freNumQQ],[freTipo],[freDescripIng])
											select [freClave],[freDescrip],[freCodigo],[freNumAA],[freNumMM],[freNumQQ],[freTipo],[freDescripIng]
											from PreV2.Frecuencia with(nolock) where freClave = ' + @CveFrec
							print @cadSql2
							EXEC  (@cadSql2) 
						end
					end
				--revisar las claves de nota de las series
					--select * from PreV2.Notas where notClave=290
					--select * from PubV2.Notas where notClave=290
				 set @RowInf=0	
				 if EXISTS (select * from PubV2.Notas with(nolock) where notClave = @CveNota)
				 begin set @RowInf=1 end
				 --select  @RowInf = COUNT(*) from PubV2.Notas with(nolock) where notClave = @CveNota
				 if @RowInf= 0
					Begin  
						set @cadSql1 = 'INSERT INTO PubV2.Notas ([notClave],[NotNota],[NotNotaIng])
									select [notClave],[NotNota],[NotNotaIng]
									from PreV2.Notas with(nolock) where notClave = ' + @CveNota
						print @cadSql1
						EXEC (@cadSql1) 
					end
					else
					begin
						select top 1  @campM1=notNota,@campM2=notNotaIng from PreV2.Notas with(nolock) where notClave=@CveNota
						select top 1  @campP1=notNota,@campP2=notNotaIng from PubV2.Notas with(nolock) where notClave=@CveNota
						if @campM1= @campP1 and @campM2= @campP2 
						begin
							set @Igual='I'
						end
						else 
						begin 
							set @cadSql1 ='delete from PubV2.Notas where notClave = ' + @CveNota
							print @cadSql1
							EXEC (@cadSql1)
							set @cadSql2 = 'INSERT INTO PubV2.Notas ([notClave],[NotNota],[NotNotaIng])
											select [notClave],[NotNota],[NotNotaIng]
											from PreV2.Notas with(nolock) where notClave = ' + @CveNota
							print @cadSql2
							EXEC  (@cadSql2) 
						end
					end
				--revisar las claves de fuente de las series
				--select * from PreV2.Fuentes where fueClave=415
				--select * from PubV2.Fuentes where fueClave=415
				set @RowInf=0
				if EXISTS (select * from PubV2.Fuentes with(nolock) where fueClave = @CveFuente)
				begin set @RowInf=1 end
				--select  @RowInf = COUNT(*) from PubV2.Fuentes with(nolock) where fueClave = @CveFuente
				 if @RowInf= 0
					Begin  
						set @cadSql1 = 'INSERT INTO PubV2.Fuentes ([fueClave],[fueDescrip],[fueDescripIng])
									select [fueClave],[fueDescrip],[fueDescripIng]
									from PreV2.Fuentes with(nolock) where fueClave = ' + @CveFuente
						print @cadSql1
						EXEC (@cadSql1) 
					end
					else
					begin
						select top 1  @campM1=fueDescrip,@campM2=fueDescripIng from PreV2.Fuentes with(nolock) where fueClave=@CveFuente
						select top 1  @campP1=fueDescrip,@campP2=fueDescripIng from PubV2.Fuentes with(nolock) where fueClave=@CveFuente
						if @campM1= @campP1 and @campM2= @campP2
						begin
							set @Igual='I'
						end
						else 
						begin 
							set @cadSql1 ='delete from PubV2.Fuentes where fueClave = ' + @CveFuente
							print @cadSql1
							EXEC (@cadSql1)
							set @cadSql2 = 'INSERT INTO PubV2.Fuentes ([fueClave],[fueDescrip],[fueDescripIng])
											select [fueClave],[fueDescrip],[fueDescripIng]
											from PreV2.Fuentes with(nolock) where fueClave = ' + @CveFuente
							print @cadSql2
							EXEC  (@cadSql2) 
						end
					end
				--revisar las claves de unidad de las series
				--select * from PreV2.Unidad where uniClave in (60,257)
				--select * from PubV2.Unidad where uniClave in (60,257)
				set @RowInf=0
				if EXISTS (select * from PubV2.Unidad with(nolock) where uniClave = @CveUni)
				begin set @RowInf=1 end
				 --select  @RowInf = COUNT(*) from PubV2.Unidad with(nolock) where uniClave = @CveUni
				 if @RowInf= 0
					Begin  
						set @cadSql1 = 'INSERT INTO PubV2.Unidad ([uniClave],[uniDescrip],[uniAbrevia],[uniDescripIng],[uniAbreviaIng])
									select [uniClave],[uniDescrip],[uniAbrevia],[uniDescripIng],[uniAbreviaIng]
									from PreV2.Unidad with(nolock) where uniClave = ' + @CveUni
						print @cadSql1
						EXEC (@cadSql1) 
					end
					else
					begin
						select top 1  @campM1=uniDescrip,@campM2=uniDescripIng,@campM3=uniAbrevia,@campM4=uniAbreviaIng   from PreV2.Unidad with(nolock) where uniClave=@CveUni
						select top 1  @campP1=uniDescrip,@campP2=uniDescripIng,@campP3=uniAbrevia,@campP4=uniAbreviaIng   from PubV2.Unidad with(nolock) where uniClave=@CveUni
						if @campM1= @campP1 and @campM2= @campP2  and @campM3= @campP3 and @campM4= @campP4
						begin
							set @Igual='I'
						end
						else 
						begin 
							set @cadSql1 ='delete from PubV2.Unidad where uniClave = ' + @CveUni
							print @cadSql1
							EXEC (@cadSql1)
							set @cadSql2 = 'INSERT INTO PubV2.Unidad ([uniClave],[uniDescrip],[uniAbrevia],[uniDescripIng],[uniAbreviaIng])
											select [uniClave],[uniDescrip],[uniAbrevia],[uniDescripIng],[uniAbreviaIng]
											from PreV2.Unidad with(nolock) where uniClave = ' + @CveUni
							print @cadSql2
							EXEC  (@cadSql2) 
						end
					end
					--revisar AtrPeriodoPorInd
					insert into @tablaPerInd   select apiPerAA, apiPerMM, apiPerDD, apiCveNota  from PreV2.AtrPeriodoPorInd with(nolock) where apiCveSer = @cveSrs
					set @RowInf=0
					set @RowInf2=0
					if EXISTS (select * from PreV2.AtrPeriodoPorInd with(nolock) where apiCveSer=  @cveSrs)
					begin set @RowInf=1 end
					if EXISTS (select * from PubV2.AtrPeriodoPorInd with(nolock) where  apiCveSer=  @cveSrs )
					begin set @RowInf2=1 end
					--select  @RowInf = COUNT(*) from ManV2.AtrPeriodoPorInd with(nolock) where apiCveSer=  @cveSrs
					--select  @RowInf2 = COUNT(*) from PreV2.AtrPeriodoPorInd with(nolock) where  apiCveSer=  @cveSrs 
					set @banEnlIndSer='False' --indicad si hay diferencias en atributos de periodos
					if @RowInf=@RowInf2
					begin
					 while exists(select * from @tablaPerInd  )
					  begin
						select top 1 @apiPAA = apiAA, @apiPMM=apiMM, @apiPDD= apiDD, @apiCvNota= apiCveNota from @tablaPerInd
						select top 1  @campM1=apiCveSer, @campM2=apiPerAA, @campM3=apiPerMM, @campM4=apiPerDD, @campM5=apiCveNota  from PreV2.AtrPeriodoPorInd with(nolock) where apiCveSer = @cveSrs and apiPerAA= @apiPAA and apiPerMM= @apiPMM and apiPerDD = @apiPDD and apiCveNota= @apiCvNota
						select top 1  @campP1=apiCveSer, @campP2=apiPerAA, @campP3=apiPerMM, @campP4=apiPerDD, @campP5=apiCveNota  from PubV2.AtrPeriodoPorInd with(nolock) where apiCveSer = @cveSrs and apiPerAA= @apiPAA and apiPerMM= @apiPMM and apiPerDD = @apiPDD and apiCveNota= @apiCvNota
						if @campM1= @campP1 and @campM2= @campP2 and @campM3= @campP3 and @campM4= @campP4 and @campM5= @campP5 
						 Begin  
								set @Igual='I'
						 end
						 else
						 begin
								set @banEnlIndSer = 'True'
						 end
						delete from @tablaPerInd  where apiAA = @apiPAA and apiMM= @apiPMM and apiDD= @apiPDD and apiCveNota= @apiCvNota
					 end
						if @banEnlIndSer = 'True'
						begin
							set @cadSql1 ='delete from pubV2.AtrPeriodoPorInd where apiCveSer=' + @cveSrs
							print @cadSql1
							EXEC (@cadSql1)
							set @cadSql2 = 'INSERT INTO pubV2.AtrPeriodoPorInd ([apiCveSer] ,[apiPerAA],[apiPerMM],[apiPerDD],[apiCveNota])
									select [apiCveSer],[apiPerAA],[apiPerMM],[apiPerDD],[apiCveNota]
										from PreV2.AtrPeriodoPorInd with(nolock) where apiCveSer = ' + @cveSrs
							print @cadSql2
							EXEC  (@cadSql2) 
						end
				  end 
				  else--es diferente @RowInf
				  begin
					set @cadSql1 ='delete from pubV2.AtrPeriodoPorInd where apiCveSer = ' + @cveSrs
					print @cadSql1
					EXEC (@cadSql1)
					set @cadSql2 = 'INSERT INTO pubV2.AtrPeriodoPorInd ([apiCveSer] ,[apiPerAA],[apiPerMM],[apiPerDD],[apiCveNota])
									select [apiCveSer] ,[apiPerAA],[apiPerMM],[apiPerDD],[apiCveNota]
									from preV2.AtrPeriodoPorInd with(nolock) where apiCveSer = ' + @cveSrs
					print @cadSql2
					EXEC  (@cadSql2) 
				  end
				  --revisar notas de periodos
				  insert into @tablaPerInd   select apiPerAA, apiPerMM, apiPerDD, apiCveNota  from PreV2.AtrPeriodoPorInd with(nolock) where apiCveSer = @cveSrs
				  while exists(select * from @tablaPerInd  )
					 begin
						select top 1 @apiPAA = apiAA, @apiPMM=apiMM, @apiPDD= apiDD, @apiCvNota= apiCveNota from @tablaPerInd
						select top 1  @campM1= notClave, @campM2=notNota, @campM3=notNotaIng  from PreV2.Notas with(nolock) where notClave = @apiCvNota
						select top 1  @campP1= notClave, @campP2=notNota, @campP3=notNotaIng  from PubV2.Notas with(nolock) where notClave = @apiCvNota
						if @campM1= @campP1 and @campM2= @campP2 and @campM3= @campP3 
						Begin  
							set @Igual='I'
						end
						else
						begin
							set @cadSql1 ='delete from pubV2.notas where notclave = ' + Convert(nvarchar(255),@apiCvNota) 
							print 'Nota en periodos'
							print @cadSql1
							EXEC (@cadSql1)
							set @cadSql2 = 'INSERT INTO pubV2.Notas ([notclave],[notnota],[notnotaIng])
								select [notclave],[notnota],[notnotaIng]
								from preV2.Notas with(nolock) where notclave = ' + Convert(nvarchar(255),@apiCvNota) 
							print @cadSql2
							EXEC  (@cadSql2) 
						end
						delete from @tablaPerInd where apiAA = @apiPAA and apiMM= @apiPMM and apiDD= @apiPDD and apiCveNota= @apiCvNota
					 end--while @tablaPerInd
				
			--revisar claves agrupamiento de clasificación***
				--select * from PubV2.AgrupaClas where acClave  like '320%'
				--select * from pubv2.AgrupaClas where acClave  like '320%'
				if @CveAgClas IS not NULL or @CveAgClas <> '0'
				begin
					--revisar si agrupaclas tiene los mismo datos
					insert into @tablaAgrupaClas   select acClave  from PreV2.AgrupaClas with(nolock) where acClave like @CveAgClas + '%'
					--select  @RowInf = COUNT(*) from PreV2.AgrupaClas with(nolock) where acClave like @CveAgClas + '%' 
					--select  @RowInf2 = COUNT(*) from PubV2.AgrupaClas with(nolock) where  acClave like @CveAgClas + '%' 
					set @RowInf=0
					set @RowInf2=0
					if EXISTS (select * from PreV2.AgrupaClas with(nolock) where acClave like @CveAgClas + '%' )
					begin set @RowInf=1 end
					if EXISTS (select * from PubV2.AgrupaClas with(nolock) where  acClave like @CveAgClas + '%'  )
					begin set @RowInf2=1 end
					set @banEnlIndSer='False' --indicad si hay diferencias en los agrupamientos de clasificaciones
				  if @RowInf=@RowInf2
				  begin
					while exists(select * from @tablaAgrupaClas  )
					 begin
						select top 1 @cveAgr = CveAgCl  from @tablaAgrupaClas 
						select top 1  @campM1=acCveGpo, @campM2=acCveClas, @campM3=acDescrip, @campM4=acDescripIng  from PreV2.AgrupaClas with(nolock) where acclave=@cveAgr
						select top 1  @campP1=acCveGpo, @campP2=acCveClas, @campP3=acDescrip, @campP4=acDescripIng  from PubV2.AgrupaClas with(nolock) where acclave=@cveAgr
						if @campM1= @campP1 and @campM2= @campP2 and @campM3= @campP3 and @campM4= @campP4 
						 Begin  
								set @Igual='I'
						 end
						 else
						 begin
								set @banEnlIndSer = 'True'
						 end
						delete from @TablaAgrupaClas where CveAgCl= @CveAgr
					 end
						if @banEnlIndSer = 'True'
						begin
							set @cadSql1 ='delete from PubV2.AgrupaClas where acclave like ''' + @CveAgClas  +  '%'''  
							print @cadSql1
							EXEC (@cadSql1)
							set @cadSql2 = 'INSERT INTO PubV2.AgrupaClas ([acClave],[acCveGpo],[acCveClas],[acDescrip],[acDescripIng])
										select [acClave],[acCveGpo],[acCveClas],[acDescrip],[acDescripIng]
										from PreV2.AgrupaClas with(nolock) where acclave like ''' + @CveAgClas  +  '%''' 
							print @cadSql2
							EXEC  (@cadSql2) 
						end
				end 
				else--es más de 0 @RowInf
				begin
					set @cadSql1 ='delete from PubV2.AgrupaClas where acclave  like ''' + @CveAgClas  +  '%'''
					print @cadSql1
					EXEC (@cadSql1)
					set @cadSql2 = 'INSERT INTO PubV2.AgrupaClas ([acClave],[acCveGpo],[acCveClas],[acDescrip],[acDescripIng])
									select [acClave],[acCveGpo],[acCveClas],[acDescrip],[acDescripIng]
									from PreV2.AgrupaClas with(nolock) where acclave like ''' + @CveAgClas  +  '%'''
					print @cadSql2
					EXEC  (@cadSql2) 
				end
				--revisar AtrAgrupaClaPorInd
					--revisar si agrupaclas tiene los mismo datos
					--@tablaOrdAgrupaClas table (CveOrdAgCl nvarchar(max))
					insert into @tablaOrdAgrupaClas   select aaclAgrCla, aaclCveNota, aaclTipCla  from PreV2.AtrAgrupaClaPorInd with(nolock) where aaclCveSer = @cveSrs
					set @RowInf=0
					set @RowInf2=0
					if EXISTS (select * from PreV2.AtrAgrupaClaPorInd with(nolock) where aaclCveSer=  @cveSrs )
					begin set @RowInf=1 end
					if EXISTS (select * from PubV2.AtrAgrupaClaPorInd with(nolock) where  aaclCveSer=  @cveSrs  )
					begin set @RowInf2=1 end
					--select  @RowInf = COUNT(*) from ManV2.AtrAgrupaClaPorInd with(nolock) where aaclCveSer=  @cveSrs
					--select  @RowInf2 = COUNT(*) from PreV2.AtrAgrupaClaPorInd with(nolock) where  aaclCveSer=  @cveSrs 
					set @banEnlIndSer='False' --indicad si hay diferencias en los agrupamientos de clasificaciones
					if @RowInf=@RowInf2
					begin
					 while exists(select * from @tablaOrdAgrupaClas  )
					  begin
						select top 1 @cveAgrOrd = CveOrdAgCl, @TipoAgrCl=tipoCl from @tablaOrdAgrupaClas 
						select top 1  @campM1=aaclCveSer, @campM2=aaclAgrCla, @campM3=aaclCveNota, @campM4=aaclOrdenTab, @campM5=aaclOrdenGra, @campM6=aaclOrdenMap   from PreV2.AtrAgrupaClaPorInd with(nolock) where aaclCveSer = @cveSrs and aaclAgrCla= @cveAgrOrd and aaclTipCla= @TipoAgrCl
						select top 1  @campP1=aaclCveSer, @campP2=aaclAgrCla, @campP3=aaclCveNota, @campP4=aaclOrdenTab, @campP5=aaclOrdenGra, @campP6=aaclOrdenMap  from PubV2.AtrAgrupaClaPorInd with(nolock) where aaclCveSer = @cveSrs and aaclAgrCla= @cveAgrOrd and aaclTipCla= @TipoAgrCl
						if @campM1= @campP1 and @campM2= @campP2 and @campM3= @campP3 and @campM4= @campP4 and @campM5= @campP5 and @campM6= @campP6 
						 Begin  
								set @Igual='I'
						 end
						 else
						 begin
								set @banEnlIndSer = 'True'
						 end
						delete from @tablaOrdAgrupaClas  where CveOrdAgCl= @cveAgrOrd and tipoCl= @TipoAgrCl
					 end
						if @banEnlIndSer = 'True'
						begin
							set @cadSql1 ='delete from pubV2.AtrAgrupaClaPorInd where aaclCveSer=' + @cveSrs
							print @cadSql1
							EXEC (@cadSql1)
							set @cadSql2 = 'INSERT INTO pubV2.AtrAgrupaClaPorInd ([aaclCveSer],[aaclAgrCla],[aaclCveNota],[aaclOrdenTab],[aaclOrdenGra],[aaclOrdenMap], [aaclTipCla])
										select [aaclCveSer],[aaclAgrCla],[aaclCveNota],[aaclOrdenTab],[aaclOrdenGra],[aaclOrdenMap],[aaclTipCla]
										from preV2.AtrAgrupaClaPorInd with(nolock) where aaclCveSer = ' + @cveSrs
							print @cadSql2
							EXEC  (@cadSql2) 
						end
				  end 
				  else--es más de 0 @RowInf
				  begin
					set @cadSql1 ='delete from pubV2.AtrAgrupaClaPorInd where aaclCveSer = ' + @cveSrs
					print @cadSql1
					EXEC (@cadSql1)
					set @cadSql2 = 'INSERT INTO pubV2.AtrAgrupaClaPorInd ([aaclCveSer],[aaclAgrCla],[aaclCveNota],[aaclOrdenTab],[aaclOrdenGra],[aaclOrdenMap],[aaclTipCla])
									select [aaclCveSer],[aaclAgrCla],[aaclCveNota],[aaclOrdenTab],[aaclOrdenGra],[aaclOrdenMap],[aaclTipCla]
									from preV2.AtrAgrupaClaPorInd with(nolock) where aaclCveSer = ' + @cveSrs
					print @cadSql2
					EXEC  (@cadSql2) 
				  end
				  --revisar notas de los atributos del agrupamiento de clasificaciones
				  insert into @tablaOrdAgrupaClas   select aaclAgrCla, aaclCveNota, aaclTipCla  from PreV2.AtrAgrupaClaPorInd with(nolock) where aaclCveSer = @cveSrs
				  while exists(select * from @tablaOrdAgrupaClas  )
					 begin
						select top 1 @cveAgrOrd = CveOrdAgCl, @cveOrdAgrNot= cveOrdAgrClNota, @TipoAgrCl=tipoCl from @tablaOrdAgrupaClas 
						if @cveOrdAgrNot IS not NULL  and @cveOrdAgrNot <>0
						begin
							select top 1  @campM1= notClave, @campM2=notNota, @campM3=notNotaIng  from PreV2.Notas with(nolock) where notClave = @cveOrdAgrNot
							select top 1  @campP1= notClave, @campP2=notNota, @campP3=notNotaIng  from PubV2.Notas with(nolock) where notClave = @cveOrdAgrNot
							if @campM1= @campP1 and @campM2= @campP2 and @campM3= @campP3 
							Begin  
								set @Igual='I'
							end
							else
							begin
								print @cveOrdAgrNot
								set @cadSql1 ='delete from pubV2.notas where notclave = ' + Convert(nvarchar(255),@cveOrdAgrNot) 
								print 'Nota en Atributos de clasificaciones'
								print @cadSql1
								EXEC (@cadSql1)
								set @cadSql2 = 'INSERT INTO pubV2.Notas ([notclave],[notnota],[notnotaIng])
									select [notclave],[notnota],[notnotaIng]
									from preV2.Notas with(nolock) where notclave = ' + Convert(nvarchar(255),@cveOrdAgrNot)
								print @cadSql2
								EXEC  (@cadSql2) 
							end
						end
						delete from @tablaOrdAgrupaClas  where CveOrdAgCl= @cveAgrOrd and tipoCl= @TipoAgrCl
					 end
		
				--revisar grupos
				insert into @tablaGpo   select distinct acCveGpo  from PreV2.AgrupaClas with(nolock) where acClave like @CveAgClas + '%' and len (acClave)>3
				while exists(select * from @tablaGpo  )
					 begin
						select top 1 @CveGpo = CveGpo  from @tablaGpo
						set @RowInf=0
						if EXISTS (select  * from PubV2.Grupo with(nolock) where gpoClave= @CveGpo)
						begin set @RowInf=1 end
						--select  @RowInf = COUNT(*) from PubV2.Grupo with(nolock) where gpoClave= @CveGpo
						if @RowInf=0
						begin
							set @cadSql1 = 'INSERT INTO PubV2.Grupo ([gpoClave],[gpoDescrip],[gpoDescripIng],[gpoAlias],[gpoAliasIng])
									select [gpoClave],[gpoDescrip],[gpoDescripIng],[gpoAlias],[gpoAliasIng]
									from PreV2.Grupo with(nolock) where  gpoClave= ' + @CveGpo
							print @cadSql1
							EXEC (@cadSql1) 
						end
						else
						begin
							select top 1  @campM1=gpoDescrip,@campM2=gpoDescripIng,@campM3=gpoAlias,@campM4=gpoAliasIng from PreV2.Grupo with(nolock) where gpoClave=@CveGpo
							select top 1  @campP1=gpoDescrip,@campP2=gpoDescripIng,@campP3=gpoAlias,@campP4=gpoAliasIng from PubV2.Grupo with(nolock) where gpoClave=@CveGpo
							if @campM1= @campP1 and @campM2= @campP2 and @campM3= @campP3 and @campM4= @campP4
							begin
								set @Igual='I'
							end
							else
							begin
								set @cadSql1 ='delete from PubV2.Grupo where gpoClave= ' + @CveGpo
								print @cadSql1
								EXEC (@cadSql1)
								set @cadSql2 = 'INSERT INTO PubV2.Grupo ([gpoClave],[gpoDescrip],[gpoDescripIng],[gpoAlias],[gpoAliasIng])
											select [gpoClave],[gpoDescrip],[gpoDescripIng],[gpoAlias],[gpoAliasIng]
											from PreV2.Grupo with(nolock) where gpoClave= ' + @CveGpo
								print @cadSql2
								EXEC  (@cadSql2) 
							end
						end
						delete from @TablaGpo where CveGpo= @CveGpo
				end--while gpo
				--revisar clasificaciones y descripciones
				insert into @tablaClas   select distinct acCveClas, acCveGpo  from PreV2.AgrupaClas with(nolock) where acClave like @CveAgClas + '%' and len (acClave)>3
				while exists(select * from @tablaClas   )
					 begin
						select top 1 @CveClas= CveCl, @CveGpo = CveGpo  from @tablaClas
						--select  @RowInf = COUNT(*) from PubV2.Clasificacion with(nolock) where claClave= @CveClas and claGrupo= @CveGpo
						set @RowInf=0
						print @CveClas
						print @CveGpo
						if EXISTS (select * from PubV2.Clasificacion with(nolock) where claClave= @CveClas and claGrupo= @CveGpo)
						begin set @RowInf=1  print @RowInf end
						if @RowInf=0
						begin
							set @cadSql1 = 'INSERT INTO PubV2.clasificacion ([claClave],[claGrupo],[claClaveDescrip],[claOrden])
									select [claClave],[claGrupo],[claClaveDescrip],[claOrden]
									from PreV2.clasificacion with(nolock) where  claClave= ' + @CveClas + ' and claGrupo=' + @CveGpo
							print @cadSql1
							EXEC (@cadSql1) 
						end
						else
						begin
							select top 1  @campM1=claGrupo,@campM2=claClaveDescrip,@campM3=claOrden  from PreV2.Clasificacion with(nolock) where claClave=@CveClas
							select top 1  @campP1=claGrupo,@campP2=claClaveDescrip,@campP3=claOrden  from PubV2.Clasificacion with(nolock) where claClave=@CveClas
							if @campM1= @campP1 and @campM2= @campP2
							begin
								set @Igual='I'
							end
							else
							begin
								set @cadSql1 ='delete from PubV2.Clasificacion where claClave= ' + @CveClas + ' and clagrupo= ' + @CveGpo
								print @cadSql1
								EXEC (@cadSql1)
								set @cadSql2 = 'INSERT INTO PubV2.Clasificacion ([claClave],[claGrupo],[claClaveDescrip],[claOrden])
											select [claClave],[claGrupo],[claClaveDescrip],[claOrden]
											from PreV2.Clasificacion with(nolock) where claClave= ' + @CveClas + ' and clagrupo= ' + @CveGpo
								print @cadSql2
								EXEC  (@cadSql2) 
							end
						end
						--revisar descripcion
						--select desClave,desDescrip,desCodigo,desDescripIng,desCodigoIng from PreV2.Descripcion, PreV2.Clasificacion where claClaveDescrip= desClave and claClave=27
						select top 1  @CveDescr=desclave  from PreV2.Descripcion, PreV2.clasificacion with(nolock) where claClaveDescrip= desClave and  claclave=@CveClas and claGrupo= @CveGpo
						--select  @RowInf = COUNT(*) from PubV2.Descripcion with(nolock) where desClave= @CveDescr
						set @RowInf=0
						if EXISTS (select * from PubV2.Descripcion with(nolock) where desClave= @CveDescr)
						begin set @RowInf=1 end
						if @RowInf=0
						begin
							set @cadSql1 = 'INSERT INTO PubV2.Descripcion ([desClave],[desDescrip],[desAbrevia],[desCodigo],[desDescripIng],[desAbreviaIng],[desCodigoIng])
									select [desClave],[desDescrip],[desAbrevia],[desCodigo],[desDescripIng],[desAbreviaIng],[desCodigoIng]
									from PreV2.Descripcion with(nolock) where desclave= ' + @CveDescr
							print @cadSql1
							EXEC (@cadSql1) 
						end
						else
						begin
							select top 1  @campM1=desdescrip, @campM2=desAbrevia, @campM3=desCodigo, @campM4=desDescripIng, @campM5=desAbreviaIng, @campM6=desCodigoIng  from PreV2.Descripcion with(nolock) where desclave=@CveDescr
							select top 1  @campP1=desdescrip, @campP2=desAbrevia, @campP3=desCodigo, @campP4=desDescripIng, @campP5=desAbreviaIng, @campP6=desCodigoIng  from PubV2.Descripcion with(nolock) where desclave=@CveDescr
							if @campM1= @campP1 and @campM2= @campP2 and @campM3= @campP3 and @campM4= @campP4 and @campM5= @campP5 and @campM6= @campP6
							begin
								set @Igual='I'
							end
							else
							begin
								set @cadSql1 ='delete from PubV2.Descripcion where desClave= ' + @CveDescr
								print @cadSql1
								EXEC (@cadSql1)
								set @cadSql2 = 'INSERT INTO PubV2.Descripcion ([desClave],[desDescrip],[desAbrevia],[desCodigo],[desDescripIng],[desAbreviaIng],[desCodigoIng])
											select [desClave],[desDescrip],[desAbrevia],[desCodigo],[desDescripIng],[desAbreviaIng],[desCodigoIng]
											from PreV2.Descripcion with(nolock) where desClave= ' + @CveDescr
								print @cadSql2
								EXEC  (@cadSql2) 
							end
						end
						
					delete from @tablaClas  where CveCl= @CveClas and CveGpo = @CveGpo
				end--while clas y desc
			end --if de clas
		--revisar las claves de agrupamiento de cobertura***
			--select * from PreV2.AgrupaCob where acoClave  like '0010%'
			--select * from PubV2.AgrupaCob where acoClave  like '0010%'
			insert into @tablaAgrupaCobs  select acoClave  from PreV2.AgrupaCob with(nolock) where acoClave like @CveAgCob + '%'
			--select  @RowInf = COUNT(*) from PreV2.AgrupaCob with(nolock) where acoClave like @CveAgCob + '%' 
			--select  @RowInf2 = COUNT(*) from PubV2.AgrupaCob with(nolock) where  acoClave like @CveAgCob + '%' 
			set @RowInf=0
			set @RowInf2=0
			if EXISTS (select * from PreV2.AgrupaCob with(nolock) where acoClave like @CveAgCob + '%')
			begin set @RowInf=1 end
			if EXISTS (select * from PubV2.AgrupaCob with(nolock) where  acoClave like @CveAgCob + '%' )
			begin set @RowInf2=1 end
			set @banEnlIndSer='False' --indicad si hay diferencias en los agrupamientos de coberturas
			if @RowInf=@RowInf2
			 begin
				 select  @RowInfT = COUNT(*) from PreV2.AgrupaCob with(nolock) where acoClave like @CveAgCob + '%' 
					select  @RowInf2T = COUNT(*) from PubV2.AgrupaCob with(nolock) where  acoClave like @CveAgCob + '%'
					print 'Total de agrupamiento cobertura'
					print @RowInfT
					print @RowInf2T
					if @RowInfT<>@RowInf2T
					begin
						set @cadSql1 ='delete from pubV2.AgrupaCob where acoclave like ''' + @CveAgCob  +  '%'''  
						print @cadSql1
						EXEC (@cadSql1)
						set @cadSql2 = 'INSERT INTO pubV2.AgrupaCob ([acoClave],[acoCveGeo],[acoCveDesGeo],[acoOrden],[acoClaveAnt])
									select [acoClave],[acoCveGeo],[acoCveDesGeo],[acoOrden],[acoClaveAnt]
									from preV2.AgrupaCob with(nolock) where acoclave like ''' + @CveAgCob  +  '%''' 
						print @cadSql2
						EXEC  (@cadSql2) 
					end
			 
			 
			 
				--while exists(select * from @tablaAgrupaCobs  )
				-- begin
				--		select top 1 @CveCob = CveAgCob  from @tablaAgrupaCobs 
				--		select top 1  @campM1=acoCveGeo, @campM2=acoCveDesGeo, @campM3=acoOrden  from PreV2.AgrupaCob with(nolock) where acoclave=@CveCob
				--		select top 1  @campP1=acoCveGeo, @campP2=acoCveDesGeo, @campP3=acoOrden  from PubV2.AgrupaCob with(nolock) where acoclave=@CveCob
				--		if @campM1= @campP1 and @campM2= @campP2 and @campM3= @campP3 
				--		 Begin  
				--				set @Igual='I'
				--		 end
				--		 else
				--		 begin
				--				set @banEnlIndSer = 'True'
				--		 end
				--		delete from @tablaAgrupaCobs where CveAgCob= @CveCob
				--end--while
				--		if @banEnlIndSer = 'True'
				--		begin
				--			set @cadSql1 ='delete from PubV2.AgrupaCob where acoclave like ''' + @CveAgCob  +  '%'''  
				--			print @cadSql1
				--			EXEC (@cadSql1)
				--			set @cadSql2 = 'INSERT INTO PubV2.AgrupaCob ([acoClave],[acoCveGeo],[acoCveDesGeo],[acoOrden],[acoClaveAnt])
				--						select [acoClave],[acoCveGeo],[acoCveDesGeo],[acoOrden],[acoClaveAnt]
				--						from PreV2.AgrupaCob with(nolock) where acoclave like ''' + @CveAgCob  +  '%''' 
				--			print @cadSql2
				--			EXEC  (@cadSql2) 
				--		end
				end 
				else--es más de 0
				begin
					set @cadSql1 ='delete from PubV2.AgrupaCob where acoclave like ''' + @CveAgCob  +  '%''' 
					print @cadSql1
					EXEC (@cadSql1)
					set @cadSql2 = 'INSERT INTO PubV2.AgrupaCob ([acoClave],[acoCveGeo],[acoCveDesGeo],[acoOrden],[acoClaveAnt])
									select [acoClave],[acoCveGeo],[acoCveDesGeo],[acoOrden],[acoClaveAnt]
									from PreV2.AgrupaCob with(nolock) where acoclave like ''' + @CveAgCob  +  '%''' 
					print @cadSql2
					EXEC  (@cadSql2) 
				end
				--revisar cobgeo
				--select * from PreV2.AgrupaCob where acoClave like '0030%' and len(acoClave )>4
				set @CveDesGAnt = ''
				set @CveTipoDGAnt = ''
				insert into @tablaCobGeo  select  acoClave, acoCveGeo, acoCveDesGeo  from PreV2.AgrupaCob with(nolock) where acoClave like @CveAgCob + '%' and LEN(acoclave)>4
				while exists(select * from @tablaCobGeo  )
				 begin
						--cobgeo
						select top 1 @CveAgruCob= CveAgruCg, @CveCg = CveCg, @CveDesG= CveDesG  from @tablaCobGeo
						select  @RowInf = COUNT(*) from PubV2.CobGeo with(nolock) where cgClave = @CveCg
						if @RowInf=0
						begin
							set @cadSql1 = 'INSERT INTO PubV2.CobGeo ([cgClave],[cgDescrip],[cgDescripIng],[cgAbrevia],[cgAbreviaIng],[cgCveTipoCobGeo])
									select [cgClave],[cgDescrip],[cgDescripIng],[cgAbrevia],[cgAbreviaIng],[cgCveTipoCobGeo]
									from PreV2.CobGeo with(nolock) where cgClave = ''' +  @CveCg + ''''
							print @cadSql1
							EXEC (@cadSql1) 
						end
						else
						begin
							select top 1  @campM1=cgDescrip, @campM2=cgDescripIng, @campM3=cgAbrevia, @campM4=cgAbreviaIng, @campM5=cgCveTipoCobGeo  from PreV2.CobGeo with(nolock) where cgClave=@CveCg
							select top 1  @campP1=cgDescrip, @campP2=cgDescripIng, @campP3=cgAbrevia, @campP4=cgAbreviaIng, @campP5=cgCveTipoCobGeo  from PubV2.CobGeo with(nolock) where cgClave=@CveCg
							if @campM1= @campP1 and @campM2= @campP2 and @campM3= @campP3 and @campM4= @campP4  and @campM5= @campP5
							 Begin  
								set @Igual='I'
							end
							else
							begin
								set @cadSql1 ='delete from PubV2.CobGeo where cgClave = ''' +  @CveCg + ''''
								print @cadSql1
								EXEC (@cadSql1)
								set @cadSql2 = 'INSERT INTO PubV2.CobGeo ([cgClave],[cgDescrip],[cgDescripIng],[cgAbrevia],[cgAbreviaIng],[cgCveTipoCobGeo])
										select [cgClave],[cgDescrip],[cgDescripIng],[cgAbrevia],[cgAbreviaIng],[cgCveTipoCobGeo]
										from PreV2.CobGeo with(nolock) where cgClave = ''' +  @CveCg + ''''
								print @cadSql2
								EXEC  (@cadSql2) 
							end
						end
						--Atributos de las coberturas
						
						select top 1  @campM1=aacoCveSer, @campM2=aacoAgrCob, @campM3=aacoCveNota from PreV2.AtrAgrupaCobPorInd with(nolock) where aacoCveSer = @cveSrs and aacoAgrCob= @CveAgCob--@cveAgrOrd
						select top 1  @campP1=aacoCveSer, @campP2=aacoAgrCob, @campP3=aacoCveNota from PubV2.AtrAgrupaCobPorInd with(nolock) where aacoCveSer = @cveSrs and aacoAgrCob= @CveAgCob--@cveAgrOrd
						if @campM1= @campP1 and @campM2= @campP2 and @campM3= @campP3 
						 Begin  
								set @Igual='I'
						 end
						 else
						 begin
							set @cadSql1 ='delete from pubV2.AtrAgrupaCobPorInd where aacoCveSer=' + @cveSrs  + ' and aacoAgrCob=''' + @CveAgruCob + ''''
							print @cadSql1
							EXEC (@cadSql1)
							set @cadSql2 = 'INSERT INTO pubV2.AtrAgrupaCobPorInd ([aacoCveSer],[aacoAgrCob],[aacoCveNota])
										select [aacoCveSer],[aacoAgrCob],[aacoCveNota]
										from preV2.AtrAgrupaCobPorInd with(nolock) where aacoCveSer = ' + @cveSrs + ' and aacoAgrCob=''' + @CveAgruCob + ''''
							print @cadSql2
							EXEC  (@cadSql2) 
						end
				  --revisar notas de los atributos del agrupamiento de coberturas
						select top 1  @cveAgrCoNot=aacoCveNota from PreV2.AtrAgrupaCobPorInd with(nolock) where aacoCveSer = @cveSrs and aacoAgrCob= @CveAgCob--@cveAgrOrd
						if @cveAgrCoNot IS not NULL  and @cveAgrCoNot <>0
							begin
								select top 1  @campM1= notClave, @campM2=notNota, @campM3=notNotaIng  from PreV2.Notas with(nolock) where notClave = @cveAgrCoNot
								select top 1  @campP1= notClave, @campP2=notNota, @campP3=notNotaIng  from PubV2.Notas with(nolock) where notClave = @cveAgrCoNot
								if @campM1= @campP1 and @campM2= @campP2 and @campM3= @campP3 
								Begin  
									set @Igual='I'
								end
								else
								begin
									set @cadSql1 ='delete from pubV2.notas where notclave = ' + Convert(nvarchar(255),@cveAgrCoNot) 
									print 'Nota en atributos de cobertura'
									print @cadSql1
									EXEC (@cadSql1)
									set @cadSql2 = 'INSERT INTO pubV2.Notas ([notclave],[notnota],[notnotaIng])
										select [notclave],[notnota],[notnotaIng]
										from preV2.Notas with(nolock) where notclave = ' + Convert(nvarchar(255),@cveAgrCoNot) 
									print @cadSql2
									EXEC  (@cadSql2) 
								end
							end
												
						--desglosegeo
						if @CveDesGAnt<> @CveDesG
						begin
							--select  @RowInf = COUNT(*) from PubV2.DesgloseGeo with(nolock) where dgClave = @CveDesG
							set @RowInf=0
							if EXISTS (select  * from PubV2.DesgloseGeo with(nolock) where dgClave = @CveDesG)
							begin set @RowInf=1 end
							if @RowInf=0
							begin
								set @cadSql1 = 'INSERT INTO PubV2.DesgloseGeo ([dgClave],[dgCodigo] ,[dgCodigoIng] ,[dgDescrip],[dgDescripIng],[dgNomImg],[dgNomImgIng])
										select [dgClave],[dgCodigo] ,[dgCodigoIng] ,[dgDescrip],[dgDescripIng],[dgNomImg],[dgNomImgIng]
										from PreV2.DesgloseGeo with(nolock) where dgClave = ' + @CveDesG
								print @cadSql1
								EXEC (@cadSql1) 
							end
							else
							begin
								select top 1  @campM1=dgCodigo, @campM2=dgCodigoing, @campM3=dgDescrip, @campM4=dgDescripIng, @campM5=dgNomImg, @campM6=dgNomImgIng   from PreV2.DesgloseGeo with(nolock) where dgClave=@CveDesG
								select top 1  @campP1=dgCodigo, @campP2=dgCodigoing, @campP3=dgDescrip, @campP4=dgDescripIng, @campP5=dgNomImg, @campP6=dgNomImgIng   from PubV2.DesgloseGeo with(nolock) where dgClave=@CveDesG
								if @campM1= @campP1 and @campM2= @campP2 and @campM3= @campP3 and @campM4= @campP4 and @campM5= @campP5
								 Begin  
									set @Igual='I'
								end
								else
								begin
									set @cadSql1 ='delete from PubV2.DesgloseGeo where dgClave = ' + @CveDesG
									print @cadSql1
									EXEC (@cadSql1)
									set @cadSql2 = 'INSERT INTO PubV2.DesgloseGeo ([dgClave],[dgCodigo] ,[dgCodigoIng] ,[dgDescrip],[dgDescripIng],[dgNomImg],[dgNomImgIng])
											select [dgClave],[dgCodigo] ,[dgCodigoIng] ,[dgDescrip],[dgDescripIng],[dgNomImg],[dgNomImgIng]
											from PreV2.DesgloseGeo with(nolock) where dgClave = ' + @CveDesG
									print @cadSql2
									EXEC  (@cadSql2) 
								end
							end
						end
						--tipo de desglosegeo
						if @CveTipoDGAnt<>@CveTipoDG
						begin
							select top 1 @CveTipoDG = cgCveTipoCobGeo  from PreV2.CobGeo where cgClave=  @CveCg
							--select  @RowInf = COUNT(*) from PubV2.TipoCobGeo with(nolock) where tcgClave = @CveTipoDG
							set @RowInf=0
							if EXISTS (select  * from PubV2.TipoCobGeo with(nolock) where tcgClave = @CveTipoDG)
							begin set @RowInf=1 end
							if @RowInf=0
							begin
								set @cadSql1 = 'INSERT INTO PubV2.TipoCobGeo ([tcgClave],[tcgDescrip],[tcgDescripIng],[tcgCveAPIMapa],[tcgCodigo],[tcgCodigoINg])
										select [tcgClave],[tcgDescrip],[tcgDescripIng],[tcgCveAPIMapa],[tcgCodigo],[tcgCodigoINg]
										from PreV2.TipoCobGeo with(nolock) where tcClave = ' + @CveTipoDG
								print @cadSql1
								EXEC (@cadSql1) 
							end
							else
							begin
								select top 1  @campM1=tcgDescrip,@campM2=tcgDescripIng,@campM3=tcgCveApiMapa,@campM4=tcgCodigo,@campM5=tcgCodigoIng   from PreV2.TipoCobGeo with(nolock) where tcgClave=@CveTipoDG
								select top 1  @campP1=tcgDescrip,@campP2=tcgDescripIng,@campP3=tcgCveApiMapa,@campP4=tcgCodigo,@campP5=tcgCodigoIng   from PubV2.TipoCobGeo with(nolock) where tcgClave=@CveTipoDG
								if @campM1= @campP1 and @campM2= @campP2  and @campM3= @campP3 and @campM4= @campP4 and @campM5= @campP5
								 Begin  
									set @Igual='I'
								end
								else
								begin
									set @cadSql1 ='delete from PubV2.TipoCobGeo where tcClave = ' + @CveTipoDG
									print @cadSql1
									EXEC (@cadSql1)
									set @cadSql2 = 'INSERT INTO PubV2.TipoCobGeo ([tcgClave],[tcgDescrip],[tcgDescripIng],[tcgCveAPIMapa],[tcgCodigo],[tcgCodigoINg])
											select [tcgClave],[tcgDescrip],[tcgDescripIng],[tcgCveAPIMapa],[tcgCodigo],[tcgCodigoINg]
											from PreV2.TipoCobGeo with(nolock) where tcClave = ' + @CveTipoDG
									print @cadSql2
									EXEC  (@cadSql2) 
								end
							end
						end
						set @CveTipoDGAnt = @CveTipoDG
						set @CveDesGAnt = @CveDesG
					delete from @tablaCobGeo where CveCg= @CveCg
				end--while de cobgeo
				--revisar datos de las series
				--select  @RowInf = COUNT(*) from PreV2.Serie with(nolock) where serClave = @cveSrs
				--select  @RowInf2 = COUNT(*) from PubV2.Serie with(nolock) where  serClave = @cveSrs
				set @RowInf=0
				set @RowInf2=0
				if EXISTS (select * from PreV2.Serie with(nolock) where serClave = @cveSrs)
				begin set @RowInf=1 end
				if EXISTS (select * from PubV2.Serie with(nolock) where  serClave = @cveSrs)
				begin set @RowInf2=1 end
				if @RowInf<>@RowInf2
				begin
						set @cadSql1 ='delete from PubV2.Serie where serClave = ' + @cveSrs
						print @cadSql1
						EXEC (@cadSql1)
						set @cadSql2 = 'INSERT INTO PubV2.Serie ([serCveCobAgrupAnt],[serCveClaAgrup],[serClave] ,[serAADato],[serMMDato],[serDDDato],[serDato],[serNoDato],[serNota],[serLeyenda],[serLeyendaIng],[serCveCobAgrup])
									select [serCveCobAgrupAnt],[serCveClaAgrup],[serClave] ,[serAADato],[serMMDato],[serDDDato],[serDato],[serNoDato],[serNota],[serLeyenda],[serLeyendaIng],[serCveCobAgrup]
									from PreV2.Serie with(nolock) where serClave = ' + @cveSrs
						print @cadSql2
						EXEC  (@cadSql2) 
				end
			--revisar no datos
				--obtener los no datos y revisar si existen***
				--select * from PubV2.NoDato where ndClave=1
				--select * from pubv2.NoDato where ndClave=1
				--select distinct serNoDato from PreV2.Serie with(nolock) where serClave = 85
				insert into @tablaNoDato select distinct sernodato  from PreV2.Serie with(nolock) where serClave = @cveSrs
				while exists(select * from @tablaNoDato )
				 begin
						select top 1 @CveND = CveND  from @tablaNoDato
						--select  @RowInf = COUNT(*) from PubV2.NoDato with(nolock) where  ndClave= @CveND
						set @RowInf=0
						if EXISTS (select * from PubV2.NoDato with(nolock) where  ndClave= @CveND)
						begin set @RowInf=1 end
						 if @RowInf = 0
						 Begin  
								set @cadSql1 = 'INSERT INTO PubV2.NoDato ([ndClave],[ndCodigo],[ndDescrip],[ndDescripIng],[ndCodigoIng],[ndCodigoMapa])
										select [ndClave],[ndCodigo],[ndDescrip],[ndDescripIng],[ndCodigoIng],[ndCodigoMapa]
										from PreV2.NoDato with(nolock) where ndClave= ' + @CveND
								print @cadSql1
								EXEC (@cadSql1) 
						 end
						 else
						 begin
								select top 1  @campM1=ndCodigo,@campM2=ndDescrip,@campM3=ndDescripIng,@campM4=ndCodigoIng,@campM5=ndCodigoMapa from PreV2.Nodato with(nolock) where ndClave=@CveND
								select top 1  @campP1=ndCodigo,@campP2=ndDescrip,@campP3=ndDescripIng,@campP4=ndCodigoIng,@campP5=ndCodigoMapa from PubV2.Nodato with(nolock) where ndClave=@CveND
								if @campM1= @campP1 and @campM2= @campP2 and @campM3= @campP3 and @campM4= @campP4 and @campM5= @campP5	
								begin
									set @Igual='I'
								end
								else
								begin
									set @cadSql1 ='delete from PubV2.NoDato where ndClave = ' + @CveND
									print @cadSql1
									EXEC (@cadSql1)
									set @cadSql2 = 'INSERT INTO PubV2.NoDato ([ndClave],[ndCodigo],[ndDescrip],[ndDescripIng],[ndCodigoIng],[ndCodigoMapa])
											select [ndClave],[ndCodigo],[ndDescrip],[ndDescripIng],[ndCodigoIng],[ndCodigoMapa]
											from PreV2.NoDato with(nolock) where ndClave = ' + @CveND
									print @cadSql2
									EXEC  (@cadSql2) 
								end
						 end
						 
						delete from @tablaNoDato where CveND= @CveND
				 end--while no dato
				
			delete from @tablaSerie where CveSr= @cveSrs
		  end--while de series
		end--if @CveAtsSer<>'' 
	end
	else--es borrado
	begin
	--arbol
		set @RowInf=0
		if EXISTS (select * from PubV2.Arbol with(nolock) where arbClaveInd = @CveIn and arbClave= @CveArb)
		begin set @RowInf=1 end
		--select  @RowInf = COUNT(*) from PubV2.Arbol with(nolock) where arbClaveInd = @CveIn and arbClave= @CveArb
		if @RowInf = 0
		Begin  
			set @Igual='I'
		end
		else
		begin
			set @cadSql1 ='delete from PubV2.Arbol where arbclaveind='+ @CveIn +' and arbClave= '''+ @CveArb + ''''
			print @cadSql1
			EXEC (@cadSql1)
		end
		--atrIndicador
		set @RowInf=0
		if EXISTS (select * from PubV2.AtrIndicador with(nolock) where atrClaveInd = @CveIn)
		begin set @RowInf=1 end
		--select  @RowInf = COUNT(*) from PubV2.AtrIndicador with(nolock) where atrClaveInd = @CveIn
		if @RowInf = 0
		Begin  
			set @Igual='I'
		end
		else
		begin
			set @cadSql1 ='delete from PubV2.AtrIndicador where atrClaveInd='+ @CveIn
			print @cadSql1
			EXEC (@cadSql1)
		end
		--enlSerInd
		--select  @RowInf = COUNT(*) from PubV2.EnlSerInd with(nolock) where esiClaveInd = @CveIn
		set @RowInf=0
		if EXISTS (select * from PubV2.EnlSerInd with(nolock) where esiClaveInd = @CveIn)
		begin set @RowInf=1 end
		if @RowInf = 0
		Begin  
			set @Igual='I'
		end
		else
		begin
			set @cadSql1 ='delete from PubV2.EnlSerInd with(nolock) where esiClaveInd='+ @CveIn
			print @cadSql1
			EXEC (@cadSql1)
		end
		--enlIndGra
		--select  @RowInf = COUNT(*) from PubV2.EnlIndGra with(nolock) where eigCveInd = @CveIn
		set @RowInf=0
		if EXISTS (select * from PubV2.EnlIndGra with(nolock) where eigCveInd = @CveIn)
		begin set @RowInf=1 end
		if @RowInf = 0
		Begin  
			set @Igual='I'
		end
		else
		begin
			set @cadSql1 ='delete from PubV2.EnlIndGra with(nolock) where eigCveInd='+ @CveIn
			print @cadSql1
			EXEC (@cadSql1)
		end
		--enlIndTipo
		set @RowInf=0
		if EXISTS (select * from PubV2.EnlIndTipo with(nolock) where eitCveInd = @CveIn)
		begin set @RowInf=1 end
		--select  @RowInf = COUNT(*) from PubV2.EnlIndTipo with(nolock) where eitCveInd = @CveIn
		if @RowInf = 0
		Begin  
			set @Igual='I'
		end
		else
		begin
			set @cadSql1 ='delete from PubV2.EnlIndTipo with(nolock) where eitCveInd='+ @CveIn
			print @cadSql1
			EXEC (@cadSql1)
		end
		--enlIndPCve
		set @RowInf=0
		if EXISTS (select * from PubV2.EnlIndPCve with(nolock) where eipcCveInd= @CveIn)
		begin set @RowInf=1 end
		--select  @RowInf = COUNT(*) from PreV2.EnlIndPCve with(nolock) where eipcCveInd= @CveIn
		if @RowInf = 0
		Begin  
			set @Igual='I'
		end
		else
		begin
			set @cadSql1 ='delete from PubV2.EnlIndPCve with(nolock) where eipcCveInd='+ @CveIn
			print @cadSql1
			EXEC (@cadSql1)
		end
	
		--enlIndCal
		set @RowInf=0
		if EXISTS (select * from PubV2.EnlIndCal with(nolock) where eicCveInd = @CveIn)
		begin set @RowInf=1 end
		--select  @RowInf = COUNT(*) from PubV2.EnlIndCal with(nolock) where eicCveInd = @CveIn
		if @RowInf = 0
		Begin  
			set @Igual='I'
		end
		else
		begin
			set @cadSql1 ='delete from PubV2.EnlIndCal with(nolock) where eicCveInd='+ @CveIn
			print @cadSql1
			EXEC (@cadSql1)
		end
		--@CveAtsSer nvarchar(max),
		--@CvePFic nvarchar (max)
		--AtrSeries
		set @RowInf=0
		if EXISTS (select * from PubV2.AtrSerie with(nolock) where atsClaveSerie in (@CveAtsSer))
		begin set @RowInf=1 end
		--select  @RowInf = COUNT(*) from PubV2.AtrSerie with(nolock) where atsClaveSerie in (@CveAtsSer)
		if @RowInf = 0
		Begin  
			set @Igual='I'
		end
		else
		begin
			set @cadSql1 ='delete from PubV2.AtrSerie with(nolock) where atsClaveSerie in (' + @CveAtsSer + ')'
			print @cadSql1
			EXEC (@cadSql1)
		end
		--AtrPeriodoPoInd
		set @RowInf=0
		if EXISTS (select * from PubV2.AtrPeriodoPorInd with(nolock) where apiCveSer in (@CveAtsSer))
		begin set @RowInf=1 end
		--select  @RowInf = COUNT(*) from PreV2.AtrPeriodoPorInd with(nolock) where apiCveSer in (@CveAtsSer)
		if @RowInf = 0
		Begin  
			set @Igual='I'
		end
		else
		begin
			set @cadSql1 ='delete from PubV2.AtrPeriodoPorInd with(nolock) where apiCveSer in (' + @CveAtsSer + ')'
			print @cadSql1
			EXEC (@cadSql1)
		end
		--AtrAgrupaCobPorInd
		set @RowInf=0
		if EXISTS (select * from PubV2.AtrAgrupaCobPorInd with(nolock) where aacoCveSer in (@CveAtsSer))
		begin set @RowInf=1 end
		--select  @RowInf = COUNT(*) from PreV2.AtrPeriodoPorInd with(nolock) where apiCveSer in (@CveAtsSer)
		if @RowInf = 0
		Begin  
			set @Igual='I'
		end
		else
		begin
			set @cadSql1 ='delete from PubV2.AtrAgrupaCobPorInd with(nolock) where aaacoCveSer in (' + @CveAtsSer + ')'
			print @cadSql1
			EXEC (@cadSql1)
		end
		--AtrAgrupaClaPoInd
		set @RowInf=0
		if EXISTS (select * from PubV2.AtrAgrupaClaPorInd with(nolock) where aaclCveSer in (@CveAtsSer))
		begin set @RowInf=1 end
		--select  @RowInf = COUNT(*) from PreV2.AtrAgrupaClaPorInd with(nolock) where aaclCveSer in (@CveAtsSer)
		if @RowInf = 0
		Begin  
			set @Igual='I'
		end
		else
		begin
			set @cadSql1 ='delete from PubV2.AtrAgrupaClaPorInd with(nolock) where aaclCveSer in (' + @CveAtsSer + ')'
			print @cadSql1
			EXEC (@cadSql1)
		end
		
		--FichaTecnica
		set @RowInf=0
		if EXISTS (select * from PubV2.FichaTecnica with(nolock) where ftClave = @CvePFic)
		begin set @RowInf=1 end
		--select  @RowInf = COUNT(*) from PubV2.FichaTecnica with(nolock) where ftClave = @CvePFic
		if @RowInf = 0
		Begin  
			set @Igual='I'
		end
		else
		begin
			set @cadSql1 ='delete from PubV2.FichaTecnica with(nolock) where ftClave=' + @CvePFic
			print @cadSql1
			EXEC (@cadSql1)
		end
		--enlFTCon
		set @RowInf=0
		if EXISTS (select  * from PubV2.EnlFTCon with(nolock) where efcClaveFT = @CvePFic)
		begin set @RowInf=1 end
		--select  @RowInf = COUNT(*) from PubV2.EnlFTCon with(nolock) where efcClaveFT = @CvePFic
		if @RowInf = 0
		Begin  
			set @Igual='I'
		end
		else
		begin
			set @cadSql1 ='delete from PubV2.EnlFTCon with(nolock) where efcClaveFT=' + @CvePFic
			print @cadSql1
			EXEC (@cadSql1)
		end
		--enlFTMFte
		set @RowInf=0
		if EXISTS (select * from PubV2.EnlFTMFte with(nolock) where effClave = @CvePFic)
		begin set @RowInf=1 end
		--select  @RowInf = COUNT(*) from PubV2.EnlFTMFte with(nolock) where effClave = @CvePFic
		if @RowInf = 0
		Begin  
			set @Igual='I'
		end
		else
		begin
			set @cadSql1 ='delete from PubV2.EnlFTMFte with(nolock) where effClave=' + @CvePFic
			print @cadSql1
			EXEC (@cadSql1)
		end
		--EnlFTRInst
		set @RowInf=0
		if EXISTS (select * from PubV2.EnlFTRInst with(nolock) where efiClave = @CvePFic)
		begin set @RowInf=1 end
		--select  @RowInf = COUNT(*) from PubV2.EnlFTRInst with(nolock) where efiClave = @CvePFic
		if @RowInf = 0
		Begin  
			set @Igual='I'
		end
		else
		begin
			set @cadSql1 ='delete from PubV2.EnlFTRInst with(nolock) where efiClave=' + @CvePFic
			print @cadSql1
			EXEC (@cadSql1)
		end
		--EnlFTRRi
		set @RowInf=0
		if EXISTS (select * from PubV2.EnlFTRRI with(nolock) where efrClave = @CvePFic)
		begin set @RowInf=1 end
		--select  @RowInf = COUNT(*) from PubV2.EnlFTRRI with(nolock) where efrClave = @CvePFic
		if @RowInf = 0
		Begin  
			set @Igual='I'
		end
		else
		begin
			set @cadSql1 ='delete from PubV2.EnlFTRRI with(nolock) where efrClave =' + @CvePFic
			print @cadSql1
			EXEC (@cadSql1)
		end
	end	--else de borrado
	
		set @cadSqlU = 'update ManV2.Movimientos set movEstatus=''B'' where movEstatus=''P'' and movindicador =' + @CveIn
		exec(@cadSqlU)
		print @cadSqlU
		set @cadSqlU = 'update ManV2.Movimientos set movEstatus=''B'' where movEstatus=''P'' and  movComentario =''' + @CveArb + ''''
		exec(@cadSqlU)
		print @cadSqlU
	
	--if @TipoPro='C'
	--begin
	--	set @cadSqlU = 'update ManV2.Movimientos set movEstatus=''P'' where movindicador =' + @CveIn
	--	exec(@cadSqlU)
	--	print @cadSqlU
	--	set @cadSqlU = 'update ManV2.Movimientos set movEstatus=''P'' where movComentario =''' + @CveArb + ''''
	--	exec(@cadSqlU)
	--	print @cadSqlU
	--end
	--else
	--begin
	--	if @AtrEst='PRE'
	--	begin
	--		set @cadSqlU = 'update ManV2.Movimientos set movEstatus=''B'' where movindicador =' + @CveIn
	--		exec(@cadSqlU)
	--		print @cadSqlU
	--		set @cadSqlU = 'update ManV2.Movimientos set movEstatus=''B'' where movComentario =''' + @CveArb + ''''
	--		exec(@cadSqlU)
	--		print @cadSqlU
	--	end
	--	else
	--	begin
	--		if @AtrEst='PUB'
	--		begin
	--			set @cadSqlU = 'update ManV2.Movimientos set movEstatus=''P'' where movindicador =' + @CveIn
	--			exec(@cadSqlU)
	--			print @cadSqlU
	--			set @cadSqlU = 'update ManV2.Movimientos set movEstatus=''P'' where movComentario =''' + @CveArb + ''''
	--			exec(@cadSqlU)
	--			print @cadSqlU
	--		end
	--	end
	--end
END


GO
--SP_SIMODS_PROCESOS
/****** StoredProcedure [ManV2].[SP_SIMODS_PROCESOS]  ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [ManV2].[SP_SIMODS_PROCESOS]
				  
	  @_ACCION      NVARCHAR(50)  = NULL,
	  @_MODULO      NVARCHAR(50)  = NULL,
	  @_OBJETO      NVARCHAR(50)  = NULL,
	  @_SENTENCIA   NVARCHAR(50)  = NULL,  
	  @_ESQUEMA     NVARCHAR(50)  = NULL,  

	  --PARAMETROS DE ENTRADA
	  @_PAR01       NVARCHAR(MAX) = NULL,  --@ARB_CLAVE
	  @_PAR02       NVARCHAR(MAX) = NULL,
	  @_PAR03       NVARCHAR(MAX) = NULL,
	  @_PAR04       NVARCHAR(MAX) = NULL,
	  @_PAR05       NVARCHAR(MAX) = NULL,	
	  @_PAR06       NVARCHAR(MAX) = NULL,
	  @_PAR07       NVARCHAR(MAX) = NULL,
	  @_PAR08       NVARCHAR(MAX) = NULL,
	  @_PAR09       NVARCHAR(MAX) = NULL,
	  @_PAR10       NVARCHAR(MAX) = NULL,
	  @_PAR11       NVARCHAR(MAX) = NULL,
	  @_PAR12       NVARCHAR(MAX) = NULL,
	  @_PAR13       NVARCHAR(MAX) = NULL,
	  @_PAR14       NVARCHAR(MAX) = NULL,
	  @_PAR15       NVARCHAR(MAX) = NULL,	 	  
	  @_PAR16       NVARCHAR(MAX) = NULL,
	  @_PAR17       NVARCHAR(MAX) = NULL,
	  @_PAR18       NVARCHAR(MAX) = NULL,
	  --@_PAR19       TEXT = NULL,
	  --@_PAR20       TEXT = NULL,	  

		--PARAMETROS DE SALIDA
	  @PAR01_       NVARCHAR(MAX) = NULL OUTPUT,
	  @PAR02_       NVARCHAR(MAX) = NULL OUTPUT,
	  @PAR03_       NVARCHAR(MAX) = NULL OUTPUT,
	  @PAR04_       NVARCHAR(MAX) = NULL OUTPUT,
	  @PAR05_       NVARCHAR(MAX) = NULL OUTPUT,
	  @PAR06_       NVARCHAR(MAX) = NULL OUTPUT,
	  @PAR07_       NVARCHAR(MAX) = NULL OUTPUT,
	  @PAR08_       NVARCHAR(MAX) = NULL OUTPUT,
	  @PAR09_       NVARCHAR(MAX) = NULL OUTPUT,
	  @PAR10_       NVARCHAR(MAX) = NULL OUTPUT,
	  @PAR11_       NVARCHAR(MAX) = NULL OUTPUT,
	  @PAR12_       NVARCHAR(MAX) = NULL OUTPUT,
	  @PAR13_       NVARCHAR(MAX) = NULL OUTPUT,
	  @PAR14_       NVARCHAR(MAX) = NULL OUTPUT,
	  @PAR15_       NVARCHAR(MAX) = NULL OUTPUT,
	  @PAR16_       NVARCHAR(MAX) = NULL OUTPUT,
	  @PAR17_       NVARCHAR(MAX) = NULL OUTPUT,
	  @PAR18_       NVARCHAR(MAX) = NULL OUTPUT,
	  @PAR19_       NVARCHAR(MAX) = NULL OUTPUT,
	  @PAR20_       NVARCHAR(MAX) = NULL OUTPUT	  
AS
BEGIN  ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- ()  ABRE 0 (CLASE)
 
	   DECLARE 
	   @SCRIPT_TEMAS_DISP                NVARCHAR(MAX)
	  ,@SCRIPT_GRID_NAC                  NVARCHAR(MAX)
	  ,@SCRIPT_GRID_COBGEO               NVARCHAR(MAX)
	  ,@SCRIPT_GRID_COBGEO_CLAVES        NVARCHAR(MAX)
	  ,@SCRIPT_ENTIDADES                 NVARCHAR(MAX)
	  ,@WHERE_1                          NVARCHAR(MAX)
	  ,@WHERE_2                          NVARCHAR(MAX)
	  ,@CONC_LECTURA_GRID_SELECT         NVARCHAR(MAX)

	  --VARIABLES PARA LA EXTRACCIÓN DE DATOS RELACIONADOS CON EL INDICADOR
	  ,@ARB_CLAVE                        NVARCHAR(50)
	  ,@QUERY_00                         NVARCHAR(MAX)
	  ,@QUERY_01                         NVARCHAR(MAX)
	  ,@QUERY_02                         NVARCHAR(MAX)
	  ,@QUERY_03                         NVARCHAR(MAX)
	  ,@QUERY_04                         NVARCHAR(MAX)
	  ,@QUERY_05                         NVARCHAR(MAX)
	  ,@QUERY_06                         NVARCHAR(MAX)
	  ,@QUERY_07                         NVARCHAR(MAX)
	  ,@QUERY_08                         NVARCHAR(MAX)
	  ,@QUERY_09                         NVARCHAR(MAX)
	  ,@QUERY_10                         NVARCHAR(MAX)
	  ,@QUERY_11                         NVARCHAR(MAX)
	  ,@QUERY_12                         NVARCHAR(MAX)
	  ,@QUERY_13                         NVARCHAR(MAX)
	  ,@QUERY_14                         NVARCHAR(MAX)
	  ,@QUERY_15                         NVARCHAR(MAX)
	  ,@QUERY_16                         NVARCHAR(MAX)
	  ,@QUERY_17                         NVARCHAR(MAX)
	  ,@QUERY_18                         NVARCHAR(MAX)
	  ,@QUERY_19                         NVARCHAR(MAX)
	  ,@QUERY_20                         NVARCHAR(MAX)

		 ------===================================================== VARIABLES QUERYS DINÁMICOS EN LIMPIEZA ESPECIFICA 02/02/2021
	  ,@QRD_DECL_VAR                     NVARCHAR(MAX)
	  ,@QRD_PRINT_VALORES                NVARCHAR(MAX)
	  ,@QRD_DETERMINA_VALORES_01         NVARCHAR(MAX)
	  ,@QRD_OBTENCION_VALORES_01         NVARCHAR(MAX)
	  ,@QRD_OBTENCION_PARAMET_01         NVARCHAR(MAX)
	  ,@QRD_CICLO_01                     NVARCHAR(MAX)
	  ,@QRD_CREA_TTEM                    NVARCHAR(MAX)
	  ,@QRD_INSERT_TTEM_DSC_ODS_ENL      NVARCHAR(MAX)
	  ,@NUM_DESC_IND_QD_RPTE             NVARCHAR(MAX)
	  ,@ENL_ATR_CLAVE_IND_QD_RPTE        NVARCHAR(MAX)
	  ,@ENL_ARB_CLAVE_FT_QD_RPTE         NVARCHAR(MAX)
	  ,@VARIABLES_LOOP_QD_RPTE           NVARCHAR(MAX)
	  -----===============================================================

	  ,@CVEINDR                          NVARCHAR(10)
	  ,@CODIGOES                         NVARCHAR(20)
	  ,@CODIGOIN                         NVARCHAR(20)
	  ,@CVEFC                            NVARCHAR(10)
	  ,@DES_DES_E                        NVARCHAR(MAX)
	  ,@DES_DES_I                        NVARCHAR(MAX)
	  ,@LISTAIND                         NVARCHAR(MAX)
	  ,@FECHAA                           NVARCHAR(100)
	  ,@CVERI                            NVARCHAR(50)
	  ,@CODOBJ                           NVARCHAR(MAX)
	  ,@TIPOCOBGEO                       NVARCHAR(2)

	  ,@DESI_E                           NVARCHAR(MAX)
	  ,@DESI_I                           NVARCHAR(MAX)
	  ,@RUTAOM_E                         NVARCHAR(MAX)
	  ,@RUTAOM_I                         NVARCHAR(MAX)
	  ,@TIPOIDR                          NVARCHAR(MAX)
	  ,@CVESINS                          NVARCHAR(MAX)
	  ,@CODMET                           NVARCHAR(50)
	  ,@DES_IND_E                        NVARCHAR(MAX)
	  ,@DES_IND_I                        NVARCHAR(MAX)
	  ,@META                             NVARCHAR(100)  
	  ,@GOAL                             NVARCHAR(MAX)    
	  ,@COD_GOAL                         NVARCHAR(50)
	  ,@COD_META                         NVARCHAR(50);   
 
		--=============================================VARIABLES PARA LA DETERMINACION DEL PARÁMETRO 
						
	   DECLARE @COUNT_EnlSerInd           INT;
	   DECLARE @ITER                      INT = 1;
	   DECLARE @ESICVESERIE_AUX           NVARCHAR(MAX) = '';
	   DECLARE @QRD_CREA_TTEM_NOD         NVARCHAR(MAX);
	   DECLARE @INSERT_TABLA_NOD_QD       NVARCHAR(MAX);
	   DECLARE @QRD_DERTERM_VALOR_NODRIZO NVARCHAR(MAX);
	   DECLARE @QUERY_COMPLETO            NVARCHAR(MAX);

	   --=============================================


  PRINT '===========================================================INICIANDO PROCEDIMIENTO ALMACENADO===========================================================';

  IF(@_ACCION = 'LECTURA_GRID')--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- ABRE 1 (ACCION:LECTURA_GRID)
  BEGIN
		--PRINT ' ENTRAR ACCION: LECTURA GRID '
		 IF(@_MODULO = 'TEMAS_DISPONIBLES')
		   BEGIN--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ABRE 1.1 (ACCION:LECTURA_GRID/MODULO:EXPORTACION:TEMAS_DISPONIBLES)
				 SET  @PAR01_ =' ESTAMOS EN EL MÓDULO '+@_MODULO+'';
				 --PRINT 'ESTAMOS EN EL MÓDULO DE TEMAS DISPONIBLES';
				 IF(@_OBJETO = 'ESTANDAR')
				  BEGIN----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ABRE 1.1.1:(ACCION:LECTURA_GRID/MODULO:EXPORTACION:TEMAS_DISPONIBLES:OBJETO: ESTANDAR)
					--PRINT 'ESTAMOS EN EL MÓDULO '+@_MODULO+', EN EL OBJETO '+@_OBJETO+'';
					 IF(@_SENTENCIA = 'SELECT')
					 BEGIN--------------------------------------------------------------------------------------------------------------------------------ABRE   1.1.1.1 (ACCION:LECTURA_GRID/MODULO:EXPORTACION:TEMAS_DISPONIBLES/SENTENCIA: SELECT)
					 --   PRINT 'ESTAMOS EN EL MÓDULO '+@_MODULO+', EN EL OBJETO '+@_OBJETO+', EN LA SENTENCIA '+@_SENTENCIA+''						 
						--PRINT @SCRIPT_TEMAS_DISP;
						SET @SCRIPT_TEMAS_DISP = 'SELECT  [temClave] AS [Clave],[temDescrip] AS [Descripción], [temDescripIng] AS [Description] FROM '+@_ESQUEMA+'[Temas];';
						EXECUTE(@SCRIPT_TEMAS_DISP );
					 END;---------------------------------------------------------------------------------------------------------------------------------CIERRA 1.1.1.1 (ACCION:LECTURA_GRID/MODULO:EXPORTACION:TEMAS_DISPONIBLES/SENTENCIA: SELECT)	           
				   END;-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------CIERRA 1.1.1(ACCION:LECTURA_GRID/MODULO:EXPORTACION:TEMAS_DISPONIBLES: OBJETO_ESTANDAR)
			 END;------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------CIERRA 1.1: (ACCION:LECTURA_GRID/MODULO:EXPORTACION:TEMAS_DISPONIBLES)
			   
		   ELSE IF(@_MODULO = 'EXPORTACION')
		   BEGIN---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ABRE 1.2 (ACCION:LECTURA_GRID/MODULO:EXPORTACION)
				 --SET  @PAR01_ =' ESTAMOS EN EL MÓDULO '+@_MODULO+'';
				 --PRINT 'ESTAMOS EN EL MÓDULO DE TEMAS EXPORTACION';
				 IF(@_OBJETO = 'DATA_GRID_VIEW')
				  BEGIN-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ABRE 1.2.1 (ACCION:LECTURA_GRID/MODULO:EXPORTACION:OBJETO_DATA_GRID_VIEW)
				   
				   SET  @SCRIPT_GRID_NAC  = 
				   ''  
					  + ' SELECT ' 
					  + ' DISTINCT A.[arbClave], ' 
					  + ' B.[desCodigo] AS Código, ' 
					  + ' B.[desDescrip] AS Indicador, ' 
					  --+ ' ''Meta ''+ SUBSTRING(B.[desCodigo],1,4) AS CodObj, ' 
					  + ' SUBSTRING(B.[desCodigo],1,2) AS CodObj, ' 
					  + ' CASE WHEN LEN(B.[desCodigo]) <= 5  THEN ''Meta ''+ SUBSTRING(B.[desCodigo],1,3) WHEN LEN(B.[desCodigo]) <= 7  THEN ''Meta ''+ SUBSTRING(B.[desCodigo],1,4) ELSE ''Meta ''+ SUBSTRING(B.[desCodigo],1,5) END AS [CodMet]  ' 
					  --+ ' '''' AS Seleccion '
					  + ' FROM              '+@_ESQUEMA+'[Arbol]           AS     A ' 
					  + ' INNER JOIN        '+@_ESQUEMA+'[Descripcion]     AS     B ' 
					  + ' ON  A.arbClaveDescrip =  B.desClave ' 
					  + ' INNER JOIN        '+@_ESQUEMA+'AtrIndicador      AS     C ' 
					  + ' ON A.arbClaveInd = C.atrClaveInd '  
					  + ' INNER JOIN      '+@_ESQUEMA+'EnlSerInd           AS     D ' 
					  + ' ON A.arbClaveInd =  D.esiClaveInd ' 
					  + ' INNER JOIN    '+@_ESQUEMA+'serie                 AS     E ' 
					  + ' ON D.esiClaveSerie = E.serClave '  
					  + ' INNER JOIN '+@_ESQUEMA+'[AgrupaCob]              AS     F ' 
					  + ' ON E.serCveCobAgrup = F.acoClave '
					  + ' INNER JOIN ManV2.[AtrSerie]                      AS     G '     
					  + ' ON G.atsClaveSerie = D.esiClaveSerie ' 
					  + ' AND G.atsTipoCua <> '''' ';   --LALA.03JUL2021. EVITAR QUE APAREZCAN INDICADORES CUN TIPO DE CUADRO NULO, QUE PROVOCA QUE SE DEENGA PROCESO DE GEN. DE ARCH.(VALIDAR CON ALEX), DESACTIVAR LAS DOS ULITIMAS LÍNEAS PARA REGRESAR AL ESTADO ANTERIOR. 



					 SET  @SCRIPT_GRID_COBGEO  =  
					  ''
					 + ' SELECT ' 
					 + ' DISTINCT A.[arbClave], ' 
					 + ' B.[desCodigo] AS Código, ' 
					 + ' B.[desDescrip] AS Indicador, ' 		 
					 + ' CASE WHEN (SELECT MAX(LEN(sercvecobAgrup)) AS MAX_LEN FROM '+@_ESQUEMA+'Serie , '
					 + ' '+@_ESQUEMA+'AgrupaCob  '
					 + ' WHERE serCveCobAgrup = acoClave AND acoCveGeo <>''00'' '
					 + ' AND serClave IN  ( '
					 + ' SELECT esiClaveSerie FROM  '+@_ESQUEMA+'[EnlSerInd]  '
					 + ' WHERE esiClaveSerie IN ( SELECT esiClaveSerie FROM  '+@_ESQUEMA+'[EnlSerInd] WHERE[esiClaveInd] = (SELECT arbClaveInd FROM '+@_ESQUEMA+'Arbol  WHERE arbClave = A.[arbClave]) ) '
					 + ' )) = 8 THEN ''E'' ELSE ''M'' END AS TipoDesG, '
					 + ' '''' AS SoloMuni,  '
					 + ' SUBSTRING(B.[desCodigo],1,2) AS CodObj, ' 		
					 + ' CASE WHEN LEN(B.[desCodigo]) <= 5  THEN ''Meta ''+ SUBSTRING(B.[desCodigo],1,3) WHEN LEN(B.[desCodigo]) <= 7  THEN ''Meta ''+ SUBSTRING(B.[desCodigo],1,4) ELSE ''Meta ''+ SUBSTRING(B.[desCodigo],1,5) END AS [CodMet], '  
					 + ' arbClaveInd '					
					 + ' FROM              '+@_ESQUEMA+'[Arbol]           AS     A ' 
					 + ' INNER JOIN        '+@_ESQUEMA+'[Descripcion]     AS     B ' 
					 + ' ON  A.arbClaveDescrip =  B.desClave ' 
					 + ' INNER JOIN        '+@_ESQUEMA+'AtrIndicador      AS     C ' 
					 + ' ON A.arbClaveInd = C.atrClaveInd '  
					 + ' INNER JOIN      '+@_ESQUEMA+'EnlSerInd           AS     D ' 
					 + ' ON A.arbClaveInd =  D.esiClaveInd ' 
					 + ' INNER JOIN    '+@_ESQUEMA+'serie                 AS     E ' 
					 + ' ON D.esiClaveSerie = E.serClave '  
					 + ' INNER JOIN '+@_ESQUEMA+'[AgrupaCob]              AS     F ' 
					 + ' ON E.serCveCobAgrup = F.acoClave AND E.serCveCobAgrup = F.acoClave AND F.acoCveGeo <>''00'' ';

					 print @SCRIPT_GRID_COBGEO ;

					  SET  @SCRIPT_GRID_COBGEO_CLAVES  =  
					  ''
					  + ' SELECT  '
					  + ' DISTINCT A.[arbClave]  '
					  + ' FROM             '+@_ESQUEMA+'[Arbol]          AS     A  '
					  + ' INNER JOIN        '+@_ESQUEMA+'[Descripcion]   AS     B  '
					  + ' ON  A.arbClaveDescrip =  B.desClave  '
					  + ' INNER JOIN        '+@_ESQUEMA+'AtrIndicador    AS     C  '
					  + ' ON A.arbClaveInd = C.atrClaveInd  ' 
					  + ' INNER JOIN      '+@_ESQUEMA+'EnlSerInd         AS     D  '
					  + ' ON A.arbClaveInd =  D.esiClaveInd  '
					  + ' INNER JOIN    '+@_ESQUEMA+'serie               AS     E  '
					  + ' ON D.esiClaveSerie = E.serClave  ' 
					  + ' INNER JOIN '+@_ESQUEMA+'[AgrupaCob]                  AS     F  '
					  + ' ON E.serCveCobAgrup = F.acoClave  AND F.acoCveGeo <> ''00''  ';
						
				   SET @WHERE_1 =  ' WHERE (arbClaveFT <> '''') AND (arbClaveFT IS NOT NULL) AND (arbClaveFT <> 0) AND (atrEstado in (''MAN'', ''PRE'', ''PUB''))';		   				   		
				   SET @WHERE_2 =  ' WHERE (arbClaveFT <> '''') AND (arbClaveFT <> 0) AND (atrEstado in (''MAN'', ''PRE'', ''PUB'')) ';
											   

				   SET @SCRIPT_ENTIDADES = 
				   ''
				   + ' SELECT cgClave,cgDescrip,cgAbrevia '
				   + ' FROM '+@_ESQUEMA+'CobGeo,'+@_ESQUEMA+'TipoCobGeo ' 
				   + ' WHERE tcgclave= cgCveTipoCobGeo and  (tcgCodigo=''E'' or tcgCodigo=''N'') '  
				   + ' ORDER BY  cgclave ';

				   --PRINT 'ESTAMOS EN EL MÓDULO '+@_MODULO+', EN EL OBJETO '+@_OBJETO+'';
					IF(@_SENTENCIA = 'SELECT_NAC')
					BEGIN--------------------------------------------------------------------------------------------------------------------------------ABRE   1.2.1.1 (ACCION:LECTURA_GRID/MODULO:EXPORTACION:OBJETO_DATA_GRID_VIEW/SENTENCIA:SELECT_NAC)
					  --PRINT 'ESTAMOS EN EL MÓDULO '+@_MODULO+', EN EL OBJETO '+@_OBJETO+', EN LA SENTENCIA '+@_SENTENCIA+'';						 
					   --PRINT  @SCRIPT_GRID_NAC + @WHERE_1  + ' AND arbClave NOT IN ( ' + @SCRIPT_GRID_COBGEO_CLAVES + @WHERE_2 + ' ) ';
					   SET @CONC_LECTURA_GRID_SELECT = @SCRIPT_GRID_NAC + @WHERE_1  + ' AND arbClave NOT IN ( ' + @SCRIPT_GRID_COBGEO_CLAVES + @WHERE_2 + ' )  ORDER BY A.[arbClave], B.[desCodigo]  ';
					  PRINT @CONC_LECTURA_GRID_SELECT;
					  EXECUTE(@CONC_LECTURA_GRID_SELECT);


					END;---------------------------------------------------------------------------------------------------------------------------------CIERRA 1.2.1.1 (ACCION:LECTURA_GRID/MODULO:EXPORTACION:OBJETO_DATA_GRID_VIEW/SENTENCIA:SELECT_NAC)
					ELSE IF(@_SENTENCIA = 'SELECT_COBGEO')
					BEGIN--------------------------------------------------------------------------------------------------------------------------------ABRE   1.2.1.2 (ACCION:LECTURA_GRID/MODULO:EXPORTACION:OBJETO_DATA_GRID_VIEW/SENTENCIA:SELECT_COBGEO)
					SET @CONC_LECTURA_GRID_SELECT = @SCRIPT_GRID_COBGEO + @WHERE_2 + ' ORDER BY A.[arbClave], B.[desCodigo] ';
					EXECUTE (@CONC_LECTURA_GRID_SELECT);
				
					END;---------------------------------------------------------------------------------------------------------------------------------CIERRA 1.2.1.2 (ACCION:LECTURA_GRID/MODULO:EXPORTACION:OBJETO_DATA_GRID_VIEW/SENTENCIA:SELECT_COBGEO)

					ELSE IF(@_SENTENCIA = 'SELECT_ENTFED')
					BEGIN--------------------------------------------------------------------------------------------------------------------------------ABRE   1.2.1.3 (ACCION:LECTURA_GRID/MODULO:EXPORTACION:OBJETO_DATA_GRID_VIEW/SENTENCIA:SELECT_COBGEO)
	 --               PRINT 'ESTAMOS EN EL MÓDULO '+@_MODULO+', EN EL OBJETO '+@_OBJETO+', EN LA SENTENCIA '+@_SENTENCIA+'';
					--PRINT  @SCRIPT_ENTIDADES;
					EXECUTE (@SCRIPT_ENTIDADES);
				
					END;---------------------------------------------------------------------------------------------------------------------------------CIERRA 1.2.1.3 (ACCION:LECTURA_GRID/MODULO:EXPORTACION:OBJETO_DATA_GRID_VIEW/SENTENCIA:SELECT_ENTFED)

					 ELSE IF(@_SENTENCIA = 'EJEMPLO_REPORTE')
					BEGIN--------------------------------------------------------------------------------------------------------------------------------ABRE   1.2.1.4 (ACCION:LECTURA_GRID/MODULO:EXPORTACION:OBJETO_DATA_GRID_VIEW/SENTENCIA:EJEMPLO_REPORTES)
					PRINT 'ESTAMOS EN EL MÓDULO '+@_MODULO+', EN EL OBJETO '+@_OBJETO+', EN LA SENTENCIA '+@_SENTENCIA+'';

					--SELECT [Objetivo]
					--      ,[Meta]
					--      ,[Indicador]
					--      ,[Definicion]
					--      ,[Tipo_de_indicador]
					--      ,[Algoritmo]
					--      ,[Descripcion_narrativa_del_caculo_indicador]
					--      ,[Unidad_Medida]
					--      ,[Cobertura_geografica]
					--      ,[Cobertura_temporal]
					--      ,[Oportunidad]
					--      ,[Perioricidad_del_indicador]
					--      ,[Fuente_generadora_de_informacion]
					--      ,[Fecha_de_actualización_del_indicador]
					--      ,[Fecha_de_proxima_actualizacion_del_indicador]
					--      ,[Unidad_del_Estado_responsable_de_calcular_el_indicador]
					--      ,[Importancia_y_utilidad_del_indicador]
					--      ,[Referencia_nacional_y_o_internacional]
					--      ,[Observaciones]
					--      ,[Contacto]
					--  FROM [ManV2].[EJEMPLO_REPORTE]

					END;---------------------------------------------------------------------------------------------------------------------------------CIERRA 1.2.1.4 (ACCION:LECTURA_GRID/MODULO:EXPORTACION:OBJETO_DATA_GRID_VIEW/SENTENCIA:EJEMPLO_REPORTES)
				
				 END;-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------CIERRA 1.2.1 (ACCION:LECTURA_GRID/MODULO:EXPORTACION:OBJETO: DATA_GRID_VIEW)

			END; -----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------CIERRA 1.2 (ACCION:LECTURA_GRID/MODULO:EXPORTACION)

		 END; -----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------CIERRA 1. (ACCION:LECTURA_GRID)

		 
  ELSE IF(@_ACCION = 'MANIPULACION')------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ ABRE 2 (ACCION:MANIPULACION)
   BEGIN
		--PRINT ' ENTRAR ACCION: MANIPULACION ';
	   IF(@_MODULO = 'EXPORTACION')
		   BEGIN---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ABRE 2.1 (ACCION:MANIPULACION/MODULO:EXPORTACION)
		   IF(@_OBJETO = 'EXTRACCION')
				  BEGIN-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ABRE 2.1.1 (ACCION:MANIPULACION/MODULO:EXPORTACION:EXTRACCION)
				   --PRINT 'ESTAMOS EN EL MÓDULO '+@_MODULO+', EN EL OBJETO '+@_OBJETO+'';
				   SET @ARB_CLAVE= @_PAR01;;
				   ---============================================== TABLA DE DATOS NECESARIOS			   
								  
				   IF(@_SENTENCIA = 'OBJETIVO_PRINCIPAL')
					BEGIN--------------------------------------------------------------------------------------------------------------------------------ABRE     2.1.1.1 (ACCION:MANIPULACION/MODULO:EXPORTACION. OBJETO:_EXTRACCION. SENTENCIA:OBJETIVO_PRINCIPAL)
					  --PRINT 'ESTAMOS EN EL MÓDULO '+@_MODULO+', EN EL OBJETO '+@_OBJETO+', EN LA SENTENCIA '+@_SENTENCIA+'';
					  SET @QUERY_15 = ''
					  + ' SELECT TOP 1 desDescrip ' 
					  + ' FROM '+@_ESQUEMA+'Arbol, '+@_ESQUEMA+'Descripcion ' 
					  + ' WHERE (arbClaveDescrip = desClave and arbClave =  substring('''+@ARB_CLAVE+''',1,7)) ';
	
					  --PRINT @QUERY_15;
					  EXECUTE (@QUERY_15);

					END;---------------------------------------------------------------------------------------------------------------------------------CIERRA   2.1.1.1 (ACCION:MANIPULACION/MODULO:EXPORTACION. OBJETO:EXTRACCION. SENTENCIA:OBJETIVO_PRINCIPAL)

					ELSE IF(@_SENTENCIA = 'TABLA_DATOS_INDICADOR')
					BEGIN--------------------------------------------------------------------------------------------------------------------------------ABRE     2.2.1.2 (ACCION:MANIPULACION/MODULO:EXPORTACION. OBJETO:_EXTRACCION. SENTENCIA:TABLA_DATOS_INDICADOR)
					  --PRINT 'ESTAMOS EN EL MÓDULO '+@_MODULO+', EN EL OBJETO '+@_OBJETO+', EN LA SENTENCIA '+@_SENTENCIA+'';
					  --FALTA CONVERTIRA LA PROCEDIMIENTO ALMACENADO.

					SET @QRD_CREA_TTEM_NOD= 
					 ''		 
					   + ' DECLARE @TABLA_NODRIZA_QDD  AS TABLE '
					   + ' ( '
						  + ' [consec.] [int], [a_arbClave] [nvarchar](43),[a_arbClaveInd] [int] NULL,[a_arbClaveFT] [int] NULL,[a_arbClaveDescrip][int] NOT NULL,[a_arbClaveMetadato] [int] NULL, [b_desClave] [int] NULL, [b_desDescrip] [nvarchar](max)  NULL,[b_desAbrevia] [nvarchar](255) NULL,[b_desCodigo] [nvarchar](MAX) NULL, '
						  + ' [b_desDescripIng] [nvarchar](max) NULL,[b_desAbreviaIng] [nvarchar](255) NULL,[b_desCodigoIng] [nvarchar](50) NULL,[c_atrClaveInd] [int]  NULL,[c_atrFechaAct] [nvarchar](50) NULL,[c_atrMeta] [float] NULL,[c_atrDesMeta] [nvarchar](255) NULL, '
						  + ' [c_atrCalculo] [nvarchar](3) NULL,[c_atrEstadisticos] [nvarchar](2) NULL, [c_atrClaveEst] [int] NULL, [c_atrFechaActIng] [nvarchar](50) NULL,[c_atrDesMetaIng] [nvarchar](255) NULL,[c_atrVisualizaMapa] [nvarchar](2) NULL,[c_atrEtiPeriodo] [nvarchar](50) NULL, '
						  + ' [c_atrEtiCobTem] [nvarchar](50) NULL, [c_atrEstado] [nvarchar](3) NULL,[d_esiClaveInd] [int] NOT NULL,[d_esiClaveSerie] [int] NOT NULL,[d_esiOrden] [smallint] NULL, [e_serCveCobAgrupAnt] [nvarchar](12) NULL, [e_serCveClaAgrup] [nvarchar](30) NOT NULL, [e_serClave] [int] NOT NULL, '
						  + ' [e_serAADato] [int] NOT NULL,[e_serMMDato] [int] NOT NULL, [e_serDDDato] [int] NOT NULL,[e_serDato] [float] NULL,[e_serNoDato] [int] NULL,[e_serNota] [int] NULL,[e_serLeyenda] [nvarchar](255) NULL, [e_serLeyendaIng] [nvarchar](255) NULL, '
						  + ' [e_serCveCobAgrup] [nvarchar](20) NOT NULL,[acoClave] [nvarchar](20) NOT NULL,[acoCveGeo] [nvarchar](9) NULL, [acoCveDesGeo] [int] NULL, [acoOrden] [int] NULL, [acoClaveAnt] [nvarchar](12) NULL '  
					  + ' ); '; 

					 SET @QRD_DECL_VAR =
					''
					  + ' DECLARE '
					  + ' @DES_E_QDD           NVARCHAR(MAX) '
					  + ' ,@DES_I_QDD          NVARCHAR(MAX) '
					  + ' ,@DESI_E_QDD         NVARCHAR(MAX) '
					  + ' ,@DES_IND_E_QDD      NVARCHAR(MAX) '
					  + ' ,@DES_IND_I_QDD      NVARCHAR(MAX) '
					  + ' ,@META_QDD           NVARCHAR(MAX) '  
					  + ' ,@GOAL_QDD           NVARCHAR(MAX) '    
					  + ' ,@COD_GOAL_QDD       NVARCHAR(MAX) '
					  + ' ,@COD_META_QDD       NVARCHAR(MAX) '					  
					  + ' ,@CVEINDR_QDD         NVARCHAR(MAX) '
					  + ' ,@CODIGOES_QDD        NVARCHAR(MAX) '
					  + ' ,@CODIGOIN_QDD        NVARCHAR(MAX) '
					  + ' ,@CVEFC_QDD           NVARCHAR(MAX) '
					  + ' ,@LISTAIND_QDD        NVARCHAR(MAX) '
					  + ' ,@FECHAA_QDD          NVARCHAR(100) '
					  + ' ,@CVERI_QDD           NVARCHAR(MAX) '
					  + ' ,@CODOBJ_QDD          NVARCHAR(MAX) '
					  + ' ,@TIPOCOBGEO_QDD      NVARCHAR(2) '
					  + ' ,@RUTAOM_E_QDD        NVARCHAR(MAX) '
					  + ' ,@RUTAOM_I_QDD        NVARCHAR(MAX) '
					  + ' ,@TIPOIDR_QDD         NVARCHAR(MAX) '
					  + ' ,@COUNT_EnlSerInd_QDD INT '
					  + ' ,@ITER_QDD            INT = 1 '
					  + ' ,@CVESINS_QDD         NVARCHAR(MAX) '
					  + ' ,@ESICVESERIE_AUX_QDD NVARCHAR(MAX) = '''' '
					  + ' ,@PAR01_QDD           NVARCHAR(MAX) ' 
					  + ' ,@PAR02_QDD           NVARCHAR(MAX) ' 
					  + ' ,@PAR03_QDD           NVARCHAR(MAX) ' 
					  + ' ,@PAR04_QDD           NVARCHAR(MAX) ' 
					  + ' ,@PAR05_QDD           NVARCHAR(MAX) ' 
					  + ' ,@PAR06_QDD           NVARCHAR(MAX) ' 
					  + ' ,@PAR07_QDD           NVARCHAR(MAX) '
					  + ' ,@PAR08_QDD           NVARCHAR(MAX) ' 
					  + ' ,@PAR09_QDD           NVARCHAR(MAX) ' 
					  + ' ,@PAR10_QDD           NVARCHAR(MAX) '
					  + ' ,@PAR11_QDD           NVARCHAR(MAX) ' 
					  + ' ,@PAR12_QDD           NVARCHAR(MAX) ' 
					  + ' ,@PAR13_QDD           NVARCHAR(MAX) ' 
					  + ' ,@PAR14_QDD           NVARCHAR(MAX) '
					  + ' ,@AUX_OBJ_RUTA_OM_QDD           NVARCHAR(MAX); ' ;
				   ---==========================================================================		
					PRINT  @QRD_DECL_VAR;

					  SET @INSERT_TABLA_NOD_QD = 
					  ''
					 + ' INSERT INTO @TABLA_NODRIZA_QDD '
					 + ' SELECT ' 
					 + ' ROW_NUMBER() OVER(ORDER BY serClave, serAADato ASC) as [Consec], '
					 + ' A.[arbClave], '
					 + ' A.[arbClaveInd] , '
					 + ' A.[arbClaveFT], '
					 + ' A.[arbClaveDescrip], '
					 + ' A.[arbClaveMetadato], ' 
					 + ' B.[desClave], '
					 + ' B.[desDescrip] AS Indicador, '
					 + ' B.[desAbrevia], '
					 + ' B.[desCodigo] AS Código, '
					 + ' B.[desDescripIng], '
					 + ' B.[desAbreviaIng], '
					 + ' B.[desCodigoIng], '
					 + ' C.[atrClaveInd], '
					 + ' C.[atrFechaAct], '
					 + ' C.[atrMeta], '
					 + ' C.[atrDesMeta], '
					 + ' C.[atrCalculo], '
					 + ' C.[atrEstadisticos], '
					 + ' C.[atrClaveEst], '
					 + ' C.[atrFechaActIng], '
					 + ' C.[atrDesMetaIng], '
					 + ' C.[atrVisualizaMapa], '
					 + ' C.[atrEtiPeriodo], '
					 + ' C.[atrEtiCobTem], '
					 + ' C.[atrEstado], '
					 + ' D.[esiClaveInd], '
					 + ' D.[esiClaveSerie], '
					 + ' D.[esiOrden], '
					 + ' E.[serCveCobAgrupAnt], '
					 + ' E.[serCveClaAgrup], '
					 + ' E.[serClave], '
					 + ' E.[serAADato], '
					 + ' E.[serMMDato], '
					 + ' E.[serDDDato], '
					 + ' E.[serDato], '
					 + ' E.[serNoDato], '
					 + ' E.[serNota], '
					 + ' E.[serLeyenda], '
					 + ' E.[serLeyendaIng], '
					 + ' E.[serCveCobAgrup], '
					 + ' F.[acoClave], '
					 + ' F.[acoCveGeo], '
					 + ' F.[acoCveDesGeo], '
					 + ' F.[acoOrden], '
					 + ' F.[acoClaveAnt] '					 
					 + ' FROM              '+@_ESQUEMA+'[Arbol]         AS     A '
					 + ' INNER JOIN        '+@_ESQUEMA+'[Descripcion]   AS     B '
					 + ' ON  A.arbClaveDescrip =  B.desClave '
					 + ' INNER JOIN        '+@_ESQUEMA+'AtrIndicador    AS     C '
					 + ' ON A.arbClaveInd = C.atrClaveInd ' 
					 + ' INNER JOIN      '+@_ESQUEMA+'EnlSerInd         AS     D '
					 + ' ON A.arbClaveInd =  D.esiClaveInd '
					 + ' INNER JOIN    '+@_ESQUEMA+'serie               AS     E '
					 + ' ON D.esiClaveSerie = E.serClave  '
					 + ' INNER JOIN '+@_ESQUEMA+'[AgrupaCob]            AS     F '
					 + ' ON E.serCveCobAgrup = F.acoClave  '					 
					 + ' WHERE arbClave = '''+@ARB_CLAVE+''' '
					 + ' ORDER BY serClave, serAADato; ';

					  SET @QRD_DETERMINA_VALORES_01 = 
					  ''
						 + ' SET @DES_E_QDD     =  (SELECT TOP 1 desDescrip        FROM '+@_ESQUEMA+'Arbol, '+@_ESQUEMA+'Descripcion WHERE (arbClaveDescrip = desClave and arbClave =  substring('''+@ARB_CLAVE+''',1,7)));  '
						 + ' SET @DES_I_QDD     =  (SELECT TOP 1 desDescripIng     FROM '+@_ESQUEMA+'Arbol, '+@_ESQUEMA+'Descripcion WHERE (arbClaveDescrip = desClave and arbClave =  substring('''+@ARB_CLAVE+''',1,7)));  '
						 + ' SET @META_QDD      =  (SELECT TOP 1 desDescrip        FROM '+@_ESQUEMA+'Arbol, '+@_ESQUEMA+'Descripcion WHERE (arbClaveDescrip = desClave and arbClave =  substring('''+@ARB_CLAVE+''',1,11))); '
						 + ' SET @GOAL_QDD      =  (SELECT TOP 1 desDescripIng     FROM '+@_ESQUEMA+'Arbol, '+@_ESQUEMA+'Descripcion WHERE (arbClaveDescrip = desClave and arbClave =  substring('''+@ARB_CLAVE+''',1,11))); '
						 + ' SET @COD_META_QDD  =  (SELECT TOP 1 desCodigo         FROM '+@_ESQUEMA+'Arbol, '+@_ESQUEMA+'Descripcion WHERE (arbClaveDescrip = desClave and arbClave =  substring('''+@ARB_CLAVE+''',1,11))); '
						 + ' SET @COD_GOAL_QDD  =  (SELECT TOP 1 desCodigoIng      FROM '+@_ESQUEMA+'Arbol, '+@_ESQUEMA+'Descripcion WHERE (arbClaveDescrip = desClave and arbClave =  substring('''+@ARB_CLAVE+''',1,11))); '
		  --               + ' SET @CVEINDR_QDD = (SELECT  (CASE WHEN LEN(SUBSTRING(desCodigo ,1,1)) = 1 THEN SUBSTRING(desCodigo ,1,1)  WHEN  LEN(SUBSTRING(desCodigo ,1,1)) = 2 THEN SUBSTRING(desCodigo ,1,2) END) AS desCodigo  FROM '+@_ESQUEMA+'Arbol, '+@_ESQUEMA+'Descripcion   WHERE (arbClaveDescrip = desClave and arbClave =  SUBSTRING('''+@ARB_CLAVE+''',1,7))); ' ---LALA. 2021/06/21. VALOR CORREGIDO. 
						 --+ ' PRINT ''===>>>>> EL VALOR REFORMATEADO ES: '' +   @CVEINDR_QDD ';

					 
					 --PRINT @QRD_DETERMINA_VALORES_01;

					   SET @QRD_DERTERM_VALOR_NODRIZO =
					   ''
					   + ' SELECT TOP (1) ' 
					   + ' @CVEINDR_QDD    = [a_arbClaveInd], '
					   + ' @CODIGOES_QDD   = [b_desCodigo], '
					   + ' @CODIGOIN_QDD   = [b_desCodigoIng], '
					   + ' @CVEFC_QDD      = [a_arbClaveFT], '
					   + ' @CODIGOIN_QDD   = [b_desCodigoIng], '
					   + ' @DES_IND_E_QDD  = [b_desDescrip], '
					   + ' @DES_IND_I_QDD  = [b_desDescripIng], '
					   + ' @LISTAIND_QDD   = CONVERT(VARCHAR(10),a_arbClaveInd) + '','', '
					   + ' @DESI_E_QDD     =  [b_desDescrip], '
					   + ' @FECHAA_QDD     =  [c_atrFechaAct] + ''¬'' + [c_atrFechaActIng], '
					   + ' @CVERI_QDD      =  [e_serClave], '
					   + ' @CODOBJ_QDD     =  @CVEINDR_QDD + ''.'', '
					   + ' @TIPOCOBGEO_QDD = [c_atrEstadisticos] '
					   + ' FROM @TABLA_NODRIZA_QDD ORDER BY [e_serClave]; '  

					  + ' SET @AUX_OBJ_RUTA_OM_QDD = (SELECT  (CASE WHEN LEN(SUBSTRING(desCodigo ,1,1)) = 1 THEN SUBSTRING(desCodigo ,1,1)  WHEN  LEN(SUBSTRING(desCodigo ,1,1)) = 2 THEN SUBSTRING(desCodigo ,1,2) END) AS desCodigo '
					  + ' FROM '+@_ESQUEMA+'Arbol, '+@_ESQUEMA+'Descripcion '
					  + ' WHERE (arbClaveDescrip = desClave and arbClave =  SUBSTRING('''+@ARB_CLAVE+''',1,7))); '

					  + ' SET     @RUTAOM_E_QDD    = @AUX_OBJ_RUTA_OM_QDD + ''. '' + @DES_E_QDD + '' > '' + @COD_META_QDD+ '' '' + @META_QDD;  '  
					  + ' SET     @RUTAOM_I_QDD    = @AUX_OBJ_RUTA_OM_QDD + ''. '' + @DES_I_QDD + '' > '' + @COD_GOAL_QDD+ '' '' + @GOAL_QDD;  '	
					  + ' SET     @TIPOIDR_QDD    = ( SELECT tatrCve + '','' + tatrInforme  + ''¬'' + tatrCve + '','' +tatrInformeIng FROM '+@_ESQUEMA+'EnlIndTipo, '+@_ESQUEMA+'TipoIndicador   WHERE eitCveTipoInd = tatrCve and  eitCveInd = @CVEINDR_QDD);';  --PENDIENTE DE VERIFICAR.
		
					   

					   SET @QRD_CICLO_01  =
					   ''
						 + ' SET @COUNT_EnlSerInd_QDD = (SELECT COUNT  (*)FROM  '+@_ESQUEMA+'[AtrSerie] WHERE atsClaveSerie  IN (SELECT esiClaveSerie FROM  '+@_ESQUEMA+'[EnlSerInd] WHERE esiClaveSerie IN ( SELECT esiClaveSerie FROM  '+@_ESQUEMA+'[EnlSerInd] WHERE[esiClaveInd] = (SELECT arbClaveInd FROM '+@_ESQUEMA+'Arbol  WHERE arbClave = '''+@ARB_CLAVE+''') )) AND atsTipo = ''I''); '
						 + ' WHILE (@ITER_QDD    <= @COUNT_EnlSerInd_QDD) '
						 + ' BEGIN '
						 + ' IF( @ITER_QDD = 2) '
						 + ' BEGIN '
						 + ' SET @ESICVESERIE_AUX_QDD =  SUBSTRING(@ESICVESERIE_AUX_QDD, 2, 10 ); '
						 + ' END; '	
						   + ' SET @ESICVESERIE_AUX_QDD =  @ESICVESERIE_AUX_QDD + '','' + CONVERT (NVARCHAR(20), (SELECT atsClaveSerie FROM '+@_ESQUEMA+'[AtrSerie] WHERE atsClaveSerie  IN (SELECT  esiClaveSerie FROM '+@_ESQUEMA+'[EnlSerInd] WHERE [esiClaveInd] = (SELECT  arbClaveInd FROM '+@_ESQUEMA+'Arbol  WHERE arbClave =  '''+@ARB_CLAVE+''') AND esiOrden = @ITER_QDD + 1)AND atsTipo = ''I'')); '	----PARTIENDO DE LA PREMISA QUE EL TIPO 'R' SIEMPRE SE ORGANIZA EN LA PRIMERA POSICION DE LOS ATRSERIE
						 + ' SET @ITER_QDD = @ITER_QDD + 1; '
						 + ' END; '
						 + ' SET @CVESINS_QDD = @ESICVESERIE_AUX_QDD; '
						  + 'IF( SUBSTRING(RTRIM(LTRIM(@CVESINS_QDD)),1,1) = '','') ' 
						  + 'BEGIN '
						  + 'SET @CVESINS_QDD =   RTRIM(LTRIM((REPLACE(@CVESINS_QDD,'','','''')))); '
						  + 'END; 
						  SET @CVERI_QDD = (SELECT atsClaveSerie FROM  '+@_ESQUEMA+'[AtrSerie] WHERE atsTipo = ''R'' AND atsClaveSerie  IN (SELECT esiClaveSerie FROM   '+@_ESQUEMA+'[EnlSerInd] WHERE[esiClaveInd] = (SELECT arbClaveInd FROM  '+@_ESQUEMA+'Arbol  WHERE arbClave = '''+@ARB_CLAVE+'''))); 
						  ';  --CALCULAR MÁS PRECISAMENTE EL ARTSERIE TIPO R.

						  --PRINT @QRD_CICLO_01;


						SET @QRD_OBTENCION_PARAMET_01 =  
						''
						+ ' SET @PAR01_QDD   =@CVEINDR_QDD; '
						+ ' SET @PAR02_QDD   =@CVEFC_QDD; '
						+ ' SET @PAR03_QDD   =@CODIGOES_QDD; '
						+ ' SET @PAR04_QDD   =@CODIGOIN_QDD; ' 
						+ ' SET @PAR05_QDD   =@DES_IND_E_QDD; '
						+ ' SET @PAR06_QDD   =@DES_IND_I_QDD; '
						+ ' SET @PAR07_QDD   =@RUTAOM_E_QDD; '
						+ ' SET @PAR08_QDD   =@RUTAOM_I_QDD; '
						+ ' SET @PAR09_QDD   =@TIPOIDR_QDD; '				
						+ ' SET @PAR10_QDD   =@CVERI_QDD; '
						+ ' SET @PAR11_QDD   =@CVESINS_QDD; '
						+ ' SET @PAR12_QDD   =@CODOBJ_QDD; '
						+ ' SET @PAR13_QDD   =@TIPOCOBGEO_QDD; '
						+ ' SET @PAR14_QDD  = @FECHAA_QDD; ';

					   SET @QRD_CREA_TTEM   = 
						''
						+ ' DECLARE @_TABLE_DESC_ODS_QD AS TABLE '                                             
						+ ' ( ' 
						+ ' [CVEINDR]                [nvarchar](10) NULL, ' 
						+ ' [CVEFC]                  [nvarchar](10) NULL, ' 
						+ ' [CODIGOES]               [nvarchar](20) NULL, ' 
						+ ' [CODIGOIN]               [nvarchar](20) NULL, ' 
						+ ' [DES_IND_E]              [nvarchar](max) NULL, ' 
						+ ' [DES_IND_I]              [nvarchar](max) NULL, ' 
						+ ' [RUTAOM_E]               [nvarchar](max) NULL, '
						+ ' [RUTAOM_I]               [nvarchar](max) NULL, ' 
						+ ' [TIPOIDR]                [nvarchar](max) NULL, '
						+ ' [CVERI]                  [nvarchar](max) NULL, ' 
						+ ' [CVESINS]                [nvarchar](max) NULL, '
						+ ' [CODOBJ]                 [nvarchar](max) NULL, '
						+ ' [TIPOCOBGEO]             [nvarchar](max) NULL, '
						+ ' [FECHAA_QDD]             [nvarchar](100) NULL '
						+ ' ); ' 
						+ ' INSERT INTO @_TABLE_DESC_ODS_QD '
						+ ' VALUES '
						+ ' ( '
						+ ' @PAR01_QDD, @PAR02_QDD, @PAR03_QDD, @PAR04_QDD,@PAR05_QDD,@PAR06_QDD,@PAR07_QDD,@PAR08_QDD,@PAR09_QDD,@PAR10_QDD,@PAR11_QDD,@PAR12_QDD,@PAR13_QDD,@PAR14_QDD '				
						+ ' ); ' 
						+  ' SELECT * FROM @_TABLE_DESC_ODS_QD ';   --SE REQUIERE QUE SE VISUALICE PARA QUE SE OBTENGAN LOS VALORES
					
					
					  PRINT 'TEST EJECUCIÓN TABLA TEMPORAL DINAMICA';
			
					  SET @QUERY_COMPLETO = 			  
					  @QRD_CREA_TTEM_NOD   +
					  @INSERT_TABLA_NOD_QD +
					  @QRD_DECL_VAR        +
					  @QRD_DETERMINA_VALORES_01 +
					  @QRD_DERTERM_VALOR_NODRIZO +
					  @QRD_CICLO_01  +
					  @QRD_OBTENCION_PARAMET_01 +
					  @QRD_CREA_TTEM 
					  ; 

					  --PRINT  @QUERY_COMPLETO;

					  DECLARE @_TABLE_DESC_ODS AS TABLE                                              
						 ( 
						 [CVEINDR]                [nvarchar](10) NULL,  
						 [CVEFC]                  [nvarchar](10) NULL, 
						 [CODIGOES]               [nvarchar](20) NULL, 
						 [CODIGOIN]               [nvarchar](20) NULL,  
						 [DES_IND_E]              [nvarchar](MAX) NULL,  
						 [DES_IND_I]              [nvarchar](MAX) NULL,  
						 [RUTAOM_E]               [nvarchar](MAX) NULL, 
						 [RUTAOM_I]               [nvarchar](MAX) NULL,  
						 [TIPOIDR]                [nvarchar](MAX) NULL, 
						 [CVERI]                  [nvarchar](MAX) NULL, 
						 [CVESINS]                [nvarchar](MAX) NULL, 
						 [CODOBJ]                 [nvarchar](MAX) NULL, 
						 [TIPOCOBGEO]             [nvarchar](MAX) NULL,
						 [FECHAA_QDD]             [nvarchar](100) NULL 
						 );  

						 INSERT INTO @_TABLE_DESC_ODS
						 EXECUTE (@QUERY_COMPLETO);

						 ---===VERIFICA VALORES DE LA TABLA
						 --SELECT * FROM @_TABLE_DESC_ODS;
						 --===================================
						 SELECT
						 @PAR01_ = [CVEINDR],               
						 @PAR02_ =[CVEFC],                  
						 @PAR03_ =[CODIGOES],              
						 @PAR04_ =[CODIGOIN],               
						 @PAR05_ =[DES_IND_E],               
						 @PAR06_ =[DES_IND_I],               
						 @PAR07_ =[RUTAOM_E],               
						 @PAR08_ =[RUTAOM_I],               
						 @PAR09_ =[TIPOIDR],                
						 @PAR10_ =[CVERI],                 
						 @PAR11_ =[CVESINS],                
						 @PAR12_ =[CODOBJ],                 
						 @PAR13_ =[TIPOCOBGEO],             
						 @PAR14_ =[FECHAA_QDD]
						 FROM  @_TABLE_DESC_ODS;
						-------------------------------------------------------

						SELECT * FROM @_TABLE_DESC_ODS;   --TABLA DE VERIFICACIÓN DE DATOS DE ATRIBUTOS ENTRANTES (MUY IMPORTANTE)
					END;---------------------------------------------------------------------------------------------------------------------------------CIERRA    2.2.1.2 (ACCION:MANIPULACION/MODULO:EXPORTACION. OBJETO:EXTRACCION. SENTENCIA:TABLA_DATOS_INDICADOR)

				 ELSE IF(@_SENTENCIA = 'FICHA_TECNICA')
					BEGIN--------------------------------------------------------------------------------------------------------------------------------ABRE     2.1.1.3 (ACCION:MANIPULACION/MODULO:EXPORTACION. OBJETO:_EXTRACCION. SENTENCIA:FICHA_TECNICA')
					  PRINT 'ESTAMOS EN EL MÓDULO '+@_MODULO+', EN EL OBJETO '+@_OBJETO+', EN LA SENTENCIA '+@_SENTENCIA+'';

					  SET @QUERY_15 = ''
					  +  ' SELECT [ftClave],[ftDefinicion],[ftAlgoritmo],[ftUnidad],[ftImportancia],[ftCobGeo],[ftPeriodo],[ftFecEsp],[ftObs],[ftDefinicionIng], '
					  +  ' [ftImportanciaIng],[ftObsIng],[ftFecEspIng],[ftDescripCal],[ftDescripCalIng] ,[ftOportunidad],[ftOportunidadIng],[ftCobGeoft],[ftAlgoritmoIng] '
					  +  ' FROM '+@_ESQUEMA+'[FichaTecnica] WHERE ftclave= '+@_PAR01+'';
	
					   
					   IF(@_ESQUEMA = 'ManV2.')
					   BEGIN
					   SET @PAR01_ = (SELECT [ftAlgoritmo] FROM ManV2.[FichaTecnica] WHERE ftclave= @_PAR01) ;
					   END
					   ELSE IF(@_ESQUEMA = 'PreV2.')
					   BEGIN
					   SET @PAR01_ = (SELECT [ftAlgoritmo] FROM PreV2.[FichaTecnica] WHERE ftclave= @_PAR01) ;
					   END
						ELSE IF(@_ESQUEMA = 'PubV2.')
					   BEGIN
					   SET @PAR01_ = (SELECT [ftAlgoritmo] FROM PubV2.[FichaTecnica] WHERE ftclave= @_PAR01) ;
					   END
					   ELSE
					   BEGIN
					   PRINT'ERROR DE ESQUEMA';
					   END;

					  -- PRINT 'EL VALOR DE @PAR01_ ES: '+@PAR01_;
					  --PRINT @QUERY_15;
					  EXECUTE (@QUERY_15);

					END;---------------------------------------------------------------------------------------------------------------------------------CIERRA   2.1.1.3 (ACCION:MANIPULACION/MODULO:EXPORTACION. OBJETO:EXTRACCION. SENTENCIA:FICHA_TECNICA')
				 
				 ELSE IF(@_SENTENCIA = 'ATR_SERIE')
					BEGIN--------------------------------------------------------------------------------------------------------------------------------ABRE     2.1.1.4 (ACCION:MANIPULACION/MODULO:EXPORTACION. OBJETO:_EXTRACCION. SENTENCIA:FICHA_TECNICA)
					  --PRINT 'ESTAMOS EN EL MÓDULO '+@_MODULO+', EN EL OBJETO '+@_OBJETO+', EN LA SENTENCIA '+@_SENTENCIA+'';
					  SET @QUERY_15 = ''
						 + ' SELECT [atsClaveSerie],[atsClaveDescrip],[atsClaveFre],[atsAAPrelim],[atsMMPrelim],[atsDDPrelim],[atsAAEst],[atsMMEst],[atsDDEst],[atsDecimales],[atsClaveNota],[atsClaveFT],[atsClaveFuente] '
						 + ' ,[atsClaveUnidad],[atsTipo],[atsSalida],[atsAARev],[atsMMRev],[atsDDRev],[atsClaveAgrupaCob],[atsClaveAgrupaClas],[atsColMatriz],[atsColMatrizIng],[atsTipoGra],[atsInicio],[atsTipoCua] '
						 + ' FROM '+@_ESQUEMA+'[AtrSerie] WHERE atsclaveserie= '+@_PAR01+' ;';
	
					  --PRINT @QUERY_15;
					  EXECUTE (@QUERY_15);

					END;---------------------------------------------------------------------------------------------------------------------------------CIERRA   2.1.1.4 (ACCION:MANIPULACION/MODULO:EXPORTACION. OBJETO:EXTRACCION. SENTENCIA:FICHA_TECNICA)

				 ELSE IF(@_SENTENCIA = 'SERCVECONAGRUP')
					BEGIN--------------------------------------------------------------------------------------------------------------------------------ABRE     2.1.1.5 (ACCION:MANIPULACION/MODULO:EXPORTACION. OBJETO:_EXTRACCION. SENTENCIA:SERCVECONAGRUP)
					  --PRINT 'ESTAMOS EN EL MÓDULO '+@_MODULO+', EN EL OBJETO '+@_OBJETO+', EN LA SENTENCIA '+@_SENTENCIA+'';
					  SET @QUERY_15 = ''
							+ ' SELECT MAX(LEN(sercvecobAgrup)) AS Mx FROM '+@_ESQUEMA+'Serie , '+@_ESQUEMA+'AgrupaCob WHERE serCveCobAgrup = acoClave AND acoCveGeo <>''00'' AND serClave in  ('+@_PAR01+');';
	
					  --PRINT @QUERY_15;
					  EXECUTE (@QUERY_15);

					END;---------------------------------------------------------------------------------------------------------------------------------CIERRA   2.1.1.5 (ACCION:MANIPULACION/MODULO:EXPORTACION. OBJETO:EXTRACCION. SENTENCIA:SERCVECONAGRUP)

				ELSE IF(@_SENTENCIA = 'SERIE')
					BEGIN--------------------------------------------------------------------------------------------------------------------------------ABRE     2.1.1.6 (ACCION:MANIPULACION/MODULO:EXPORTACION. OBJETO:_EXTRACCION. SENTENCIA:SERIE)
					  --PRINT 'ESTAMOS EN EL MÓDULO '+@_MODULO+', EN EL OBJETO '+@_OBJETO+', EN LA SENTENCIA '+@_SENTENCIA+'';
					  SET @QUERY_15 = ''
							 + ' SELECT serClave,serAADato,serMMDato,serDDDato,serDato,serNoDato,serLeyenda,serLeyendaIng,serCveCobAgrup,serCveClaAgrup  FROM '+@_ESQUEMA+'serie WHERE serClave = '+@_PAR01+' ORDER BY  serAADato desc, serMMDato desc ,serDDDato DESC';
	
					  --PRINT @QUERY_15;
					  EXECUTE (@QUERY_15);

					END;---------------------------------------------------------------------------------------------------------------------------------CIERRA   2.1.1.6 (ACCION:MANIPULACION/MODULO:EXPORTACION. OBJETO:EXTRACCION. SENTENCIA:SERIE)
					
				ELSE IF(@_SENTENCIA = 'AGRUPMAX')
					BEGIN--------------------------------------------------------------------------------------------------------------------------------ABRE     2.1.1.7 (ACCION:MANIPULACION/MODULO:EXPORTACION. OBJETO:_EXTRACCION. SENTENCIA:AGRUPMAX)
					  --PRINT 'ESTAMOS EN EL MÓDULO '+@_MODULO+', EN EL OBJETO '+@_OBJETO+', EN LA SENTENCIA '+@_SENTENCIA+'';
					  SET @QUERY_15 = ''
							 + ' SELECT MAX(LEN(acClave)) AS AgrupMax  FROM '+@_ESQUEMA+'AgrupaClas WHERE acClave LIKE '''+@_PAR01+'%'';';
	
					  --PRINT @QUERY_15;
					  EXECUTE (@QUERY_15);

					END;---------------------------------------------------------------------------------------------------------------------------------CIERRA   2.1.1.7 (ACCION:MANIPULACION/MODULO:EXPORTACION. OBJETO:EXTRACCION. SENTENCIA:AGRUPMAX)


				ELSE IF(@_SENTENCIA = 'OBTENUNIDAD')
					BEGIN--------------------------------------------------------------------------------------------------------------------------------ABRE     2.1.1.8 (ACCION:MANIPULACION/MODULO:EXPORTACION. OBJETO:_EXTRACCION. SENTENCIA:OBTENUNIDAD)
					  --PRINT 'ESTAMOS EN EL MÓDULO '+@_MODULO+', EN EL OBJETO '+@_OBJETO+', EN LA SENTENCIA '+@_SENTENCIA+'';
					  SET @QUERY_15 = ''
							 + ' SELECT atsClaveUnidad, uniDescrip, uniDescripIng FROM '+@_ESQUEMA+'atrSerie, '+@_ESQUEMA+'EnlSerInd, '+@_ESQUEMA+'unidad '
							 + ' WHERE atsClaveSerie = atsClaveSerie AND esiClaveInd= '+@_PAR01+'  AND  uniclave = atsClaveUnidad and atsClaveSerie= '+@_PAR02+'; ';
	
					  --PRINT @QUERY_15;
					  EXECUTE (@QUERY_15);

					END;---------------------------------------------------------------------------------------------------------------------------------CIERRA   2.1.1.8 (ACCION:MANIPULACION/MODULO:EXPORTACION. OBJETO:EXTRACCION. SENTENCIA:OBTENUNIDAD)


			   ELSE IF(@_SENTENCIA = 'VERIFICAHABITANTES')
					BEGIN--------------------------------------------------------------------------------------------------------------------------------ABRE     2.1.1.9 (ACCION:MANIPULACION/MODULO:EXPORTACION. OBJETO:_EXTRACCION. SENTENCIA:VERIFICAHABITANTES) MET: GeneraACl().
					  --PRINT 'ESTAMOS EN EL MÓDULO '+@_MODULO+', EN EL OBJETO '+@_OBJETO+', EN LA SENTENCIA '+@_SENTENCIA+'';
					  SET @QUERY_15 = ''				  
						 + ' SELECT  acCveGpo, gpoclave, gpodescrip, gpodescriping, gpoalias, gpoaliasing, acclave ' 
						 + ' FROM '+@_ESQUEMA+'AgrupaClas, '+@_ESQUEMA+'grupo '
						 + ' WHERE accvegpo= gpoclave and  acCveGpo<>'''' '
						 + ' AND  acCveGpo <>0 '+@_PAR01+' '
						 + ' ORDER BY  CASE acclave '+@_PAR02+' '
						 + ' END';
	
					  --PRINT @QUERY_15;
					  EXECUTE (@QUERY_15);

					END;---------------------------------------------------------------------------------------------------------------------------------CIERRA   2.1.1.9 (ACCION:MANIPULACION/MODULO:EXPORTACION. OBJETO:EXTRACCION. SENTENCIA:VERIFICAHABITANTES)

				   ELSE IF(@_SENTENCIA = 'SERIE_ENCABEZADO')
					BEGIN--------------------------------------------------------------------------------------------------------------------------------ABRE     2.1.1.10 (ACCION:MANIPULACION/MODULO:EXPORTACION. OBJETO:_EXTRACCION. SENTENCIA:SERIE_ENCABEZADO) MET: GeneraACl().
					  --PRINT 'ESTAMOS EN EL MÓDULO '+@_MODULO+', EN EL OBJETO '+@_OBJETO+', EN LA SENTENCIA '+@_SENTENCIA+'';

					  DECLARE @parAux NVARCHAR(MAX);
					  SET  @parAux =  (SELECT REPLACE(@_PAR02 , '"', '' ));

					  SET @QUERY_15 = ''				  
					  + ' SELECT serAADato,serMMDato,serDDDato,serDato,serNoDato,serLeyenda,serLeyendaIng,serCveCobAgrup,serCveClaAgrup,acCveGpo,desDescrip,desdescriping '
					  + ' FROM  '+@_ESQUEMA+'serie, '+@_ESQUEMA+'Agrupaclas, '+@_ESQUEMA+'descripcion , '+@_ESQUEMA+'Clasificacion  '
					  + ' WHERE  serCveClaAgrup = acClave   and acCveClas =claClave and claClaveDescrip = desClave and serClave = '+@_PAR01+' '
					  + ' ORDER BY  serAADato DESC,serMMDato DESC,serDDDato DESC, ' 
					  + ' CASE serCveClaAgrup '   
					  + ' '+@parAux+'  END,claorden';
	
					  --PRINT @QUERY_15;
					  EXECUTE (@QUERY_15);

					END;---------------------------------------------------------------------------------------------------------------------------------CIERRA   2.1.1.10 (ACCION:MANIPULACION/MODULO:EXPORTACION. OBJETO:EXTRACCION. SENTENCIA:SERIE_ENCABEZADO)
					
							
				 ELSE IF(@_SENTENCIA = 'AGRUPMAX')
					BEGIN--------------------------------------------------------------------------------------------------------------------------------ABRE     2.1.1.11 (ACCION:MANIPULACION/MODULO:EXPORTACION. OBJETO:_EXTRACCION. SENTENCIA:AGRUPMAX) MET: GeneraClA().
					  --PRINT 'ESTAMOS EN EL MÓDULO '+@_MODULO+', EN EL OBJETO '+@_OBJETO+', EN LA SENTENCIA '+@_SENTENCIA+'';

					   SET @QUERY_16 = ''				  
						 + ' SELECT MAX(LEN(acClave)) AS AGRUPMAX  FROM '+@_ESQUEMA+'AgrupaClas WHERE acClave LIKE '''+@_PAR01+'%''; ';

					  --PRINT @QUERY_16;
					  EXECUTE (@QUERY_16);

					END;---------------------------------------------------------------------------------------------------------------------------------CIERRA   2.1.1.11 (ACCION:MANIPULACION/MODULO:EXPORTACION. OBJETO:EXTRACCION. SENTENCIA:AGRUPMAX)

				 ELSE IF(@_SENTENCIA = 'GRUPO')
					BEGIN--------------------------------------------------------------------------------------------------------------------------------ABRE     2.1.1.12 (ACCION:MANIPULACION/MODULO:EXPORTACION. OBJETO:_EXTRACCION. SENTENCIA:GRUPO) MET: GeneraClA().
					  --PRINT 'ESTAMOS EN EL MÓDULO '+@_MODULO+', EN EL OBJETO '+@_OBJETO+', EN LA SENTENCIA '+@_SENTENCIA+'';
					 

					 SET @QUERY_17 = 
					  ''			  
					   + ' SELECT acCveGpo, gpoclave, gpodescrip, gpodescriping, gpoalias, gpoaliasing, acclave '
					   + ' FROM '+@_ESQUEMA+'AgrupaClas, '+@_ESQUEMA+'grupo '
					   + ' WHERE accvegpo= gpoclave AND  acCveGpo <> '''' AND  acCveGpo <> 0 '+@_PAR01+' '
					   + ' ORDER BY CASE acclave '+@_PAR02+' END';
					  --PRINT @QUERY_17;
					  EXECUTE (@QUERY_17);

					END;---------------------------------------------------------------------------------------------------------------------------------CIERRA   2.1.1.12 (ACCION:MANIPULACION/MODULO:EXPORTACION. OBJETO:EXTRACCION. SENTENCIA:GRUPO)

				--================================


				 ELSE IF(@_SENTENCIA = 'SERIE_GRUPO')
					BEGIN--------------------------------------------------------------------------------------------------------------------------------ABRE     2.1.1.13 (ACCION:MANIPULACION/MODULO:EXPORTACION. OBJETO:_EXTRACCION. SENTENCIA:SERIE_GRUPO) 
					  --PRINT 'ESTAMOS EN EL MÓDULO '+@_MODULO+', EN EL OBJETO '+@_OBJETO+', EN LA SENTENCIA '+@_SENTENCIA+'';
					 

					 SET @QUERY_18 = 
					  ''			  
						+ ' SELECT serAADato,serMMDato,serDDDato,serDato,serNoDato,serLeyenda,serLeyendaIng,serCveCobAgrup,acCveGpo,gpoDescrip, gpoDescripIng,gpoAlias,gpoAliasIng,desDescrip,desdescriping,serCveClaAgrup '   
						+ ' FROM  '+@_ESQUEMA+'serie, '+@_ESQUEMA+'Agrupaclas, '+@_ESQUEMA+'descripcion , '+@_ESQUEMA+'Clasificacion,'+@_ESQUEMA+'grupo ' 
						+ ' WHERE serCveClaAgrup = acClave   and acCveClas =claClave and claClaveDescrip = desClave and acCveGpo = gpoClave and acclave in ('+@_PAR02+') and serClave ='+@_PAR01+' '
						+ ' ORDER BY  serAADato DESC,serMMDato DESC,serDDDato DESC, CASE serCveClaAgrup '+@_PAR03+' END';
					  --PRINT @QUERY_18;
					  EXECUTE (@QUERY_18);

					END;---------------------------------------------------------------------------------------------------------------------------------CIERRA   2.1.1.13 (ACCION:MANIPULACION/MODULO:EXPORTACION. OBJETO:EXTRACCION. SENTENCIA:SERIE_GRUPO)
					
				 ELSE IF(@_SENTENCIA = 'CONVERSION_ARBOL')
					BEGIN--------------------------------------------------------------------------------------------------------------------------------ABRE     2.1.1.14 (ACCION:MANIPULACION/MODULO:EXPORTACION. OBJETO:_EXTRACCION. SENTENCIA:CONVERSION_ARBOL) 
					  PRINT 'ESTAMOS EN EL MÓDULO '+@_MODULO+', EN EL OBJETO '+@_OBJETO+', EN LA SENTENCIA: '+@_SENTENCIA+'';
					 
					 SET @QUERY_19 = '
						 SELECT arbClave
						 FROM '+@_ESQUEMA+'Arbol, '+@_ESQUEMA+'Descripcion 
						 WHERE (arbClaveDescrip = desClave and arbClaveInd = '+@_PAR01+')';
					  EXECUTE (@QUERY_19);

					  --SET @PAR01_ = (SELECT arbClave FROM ManV2.Arbol, ManV2.Descripcion WHERE (arbClaveDescrip = desClave and arbClaveInd = @_PAR01));
		   
					   IF(@_ESQUEMA = 'ManV2.')
					   BEGIN
					   SET @PAR01_ = (SELECT arbClave FROM ManV2.Arbol, ManV2.Descripcion WHERE (arbClaveDescrip = desClave and arbClaveInd = @_PAR01));
					   END
					   ELSE IF(@_ESQUEMA = 'PreV2.')
					   BEGIN
						SET @PAR01_ = (SELECT arbClave FROM PreV2.Arbol, PreV2.Descripcion WHERE (arbClaveDescrip = desClave and arbClaveInd = @_PAR01));
					   END
						ELSE IF(@_ESQUEMA = 'PubV2.')
					   BEGIN
					   SET @PAR01_ = (SELECT arbClave FROM PubV2.Arbol, PubV2.Descripcion WHERE (arbClaveDescrip = desClave and arbClaveInd = @_PAR01));
					   END
					   ELSE
					   BEGIN
					   PRINT'ERROR DE ESQUEMA';
					   END;


					  PRINT 'EL VALOR DE @PAR01_ ES: '+@PAR01_;
					END;---------------------------------------------------------------------------------------------------------------------------------CIERRA   2.1.1.14 (ACCION:MANIPULACION/MODULO:EXPORTACION. OBJETO:EXTRACCION. SENTENCIA:CONVERSION_ARBOL)


					--//

					ELSE IF(@_SENTENCIA = 'TIPO_CUADRO')
					BEGIN--------------------------------------------------------------------------------------------------------------------------------ABRE     2.1.1.15 (ACCION:MANIPULACION/MODULO:EXPORTACION. OBJETO:_EXTRACCION. SENTENCIA:TIPO_CUADRO) 
					  PRINT 'ESTAMOS EN EL MÓDULO '+@_MODULO+', EN EL OBJETO '+@_OBJETO+', EN LA SENTENCIA: '+@_SENTENCIA+'';
					 
					  DECLARE @TIPO_CUA NVARCHAR(10);
					  SET @TIPO_CUA  = (SELECT 
					  [atsTipoCua]
					  FROM  [ManV2].[AtrSerie]          AS AtrSerie 
					  INNER JOIN  ManV2.[EnlSerInd]     AS EnlSerInd
					  ON AtrSerie.atsClaveSerie = EnlSerInd.esiClaveSerie
					  INNER JOIN       ManV2.Arbol                   AS Arbol
					  ON  Arbol.arbClaveInd = EnlSerInd.esiClaveInd
					  WHERE Arbol.arbClaveInd =   @_PAR01  AND atsTipo ='R');

					  IF(@TIPO_CUA IN ('AS', 'ACl', 'ClA'))
					  BEGIN
						 SET @PAR01_ = 'NACIONAL';
					  END
					  ELSE IF (@TIPO_CUA IN ('CoS', 'CoCl'))
					   BEGIN
						 SET @PAR01_ = 'COBERTURA_GEOGRAFICA';
					  END
					  ELSE
					   BEGIN
						SET @PAR01_ = 'DESCONOCIDO';
					   END;
		

					  PRINT 'EL VALOR DE @PAR01_ ES: '+@PAR01_;
					END;---------------------------------------------------------------------------------------------------------------------------------CIERRA   2.1.1.15 (ACCION:MANIPULACION/MODULO:EXPORTACION. OBJETO:EXTRACCION. SENTENCIA:TIPO_CUADRO)

				   ELSE IF(@_SENTENCIA = 'CODIGOS_COBGEO')
					BEGIN--------------------------------------------------------------------------------------------------------------------------------ABRE     2.1.1.16 (ACCION:MANIPULACION/MODULO:EXPORTACION. OBJETO:_EXTRACCION. SENTENCIA:CODIGOS_COBGEO) 
					   PRINT 'ESTAMOS EN EL MÓDULO '+@_MODULO+', EN EL OBJETO '+@_OBJETO+', EN LA SENTENCIA: '+@_SENTENCIA+'';
											
					 DECLARE @_CVE_ARBOL     NVARCHAR(20);
					 DECLARE @_TipoCodGeo    NVARCHAR(10);
					 DECLARE @_CodObj        NVARCHAR(10);
					 DECLARE @_CodMet        NVARCHAR(10);

					  DECLARE @_TABLE_CODES AS TABLE                                              
						 ( 
						 [ARBCVE]      [nvarchar](20),  
						 [TIPOCODGEO]  [nvarchar](10), 
						 [CODOBJ]      [nvarchar](20), 
						 [CODMET]      [nvarchar](20) 
						 );  

					   INSERT INTO  @_TABLE_CODES 
					   SELECT  
						DISTINCT A.[arbClave],  
						CASE WHEN (SELECT MAX(LEN(sercvecobAgrup)) AS MAX_LEN FROM ManV2.Serie ,  ManV2.AgrupaCob   
						WHERE serCveCobAgrup = acoClave AND acoCveGeo <>'00' 
						AND serClave IN  ( SELECT esiClaveSerie FROM  ManV2.[EnlSerInd]   
						WHERE esiClaveSerie IN ( SELECT esiClaveSerie FROM  ManV2.[EnlSerInd] WHERE[esiClaveInd] =
						(SELECT arbClaveInd FROM ManV2.Arbol  WHERE arbClave = A.[arbClave]) )  )) = 8 THEN 'E' ELSE 'M' END AS TipoDesG,  
						SUBSTRING(B.[desCodigo],1,2) AS CodObj,  
						CASE WHEN LEN(B.[desCodigo]) <= 5  THEN 'Meta '+ SUBSTRING(B.[desCodigo],1,3) 
							 WHEN LEN(B.[desCodigo]) <= 7  THEN 'Meta '+ SUBSTRING(B.[desCodigo],1,4) 
							ELSE 'Meta '+ SUBSTRING(B.[desCodigo],1,5) END AS [CodMet]  
					   FROM             
					   ManV2.[Arbol]           AS     A     INNER JOIN        ManV2.[Descripcion]   AS     B  
					   ON  A.arbClaveDescrip =  B.desClave  INNER JOIN        ManV2.AtrIndicador    AS     C 
					   ON A.arbClaveInd = C.atrClaveInd     INNER JOIN        ManV2.EnlSerInd       AS     D  
					   ON A.arbClaveInd =  D.esiClaveInd    INNER JOIN        ManV2.serie           AS     E  
					   ON D.esiClaveSerie = E.serClave      INNER JOIN        ManV2.[AgrupaCob]     AS     F  
					   ON E.serCveCobAgrup = F.acoClave AND E.serCveCobAgrup = F.acoClave AND F.acoCveGeo <>'00' 
					   WHERE A.arbClaveInd= @_PAR01;

					   SELECT  
							@_CVE_ARBOL   =[ARBCVE]
						   ,@_TipoCodGeo  =[TIPOCODGEO] 
						   ,@_CodObj      =[CODOBJ] 
						  , @_CodMet      =[CODMET] 
					   FROM @_TABLE_CODES;

					   IF(@_CVE_ARBOL IS NULL)
					   BEGIN
						SET @PAR01_= 'NOT_COB_GEO';
						SET @PAR02_= 'NOT_COB_GEO';
						SET @PAR03_= 'NOT_COB_GEO';
						SET @PAR04_= 'NOT_COB_GEO';
					   END
					   ELSE
					   BEGIN
						SET @PAR01_= @_CVE_ARBOL;
						SET @PAR02_= @_TipoCodGeo;
						SET @PAR03_= @_CodObj;
						SET @PAR04_= @_CodMet;
					   END;

					   PRINT 'EL VALOR DE @PAR01_ ES: '+@PAR01_;
					   PRINT 'EL VALOR DE @PAR02_ ES: '+@PAR02_;
					   PRINT 'EL VALOR DE @PAR03_ ES: '+@PAR03_;
					   PRINT 'EL VALOR DE @PAR04_ ES: '+@PAR04_;
					END;---------------------------------------------------------------------------------------------------------------------------------CIERRA   2.1.1.16 (ACCION:MANIPULACION/MODULO:EXPORTACION. OBJETO:EXTRACCION. SENTENCIA:CODIGOS_COBGEO)
					--//

				 ELSE IF(@_SENTENCIA = 'CONVERSION_DESCOD')
					BEGIN--------------------------------------------------------------------------------------------------------------------------------ABRE     2.1.1.17 (ACCION:MANIPULACION/MODULO:EXPORTACION. OBJETO:_EXTRACCION. SENTENCIA:CONVERSION_DESCOD) 
					  PRINT 'ESTAMOS EN EL MÓDULO '+@_MODULO+', EN EL OBJETO '+@_OBJETO+', EN LA SENTENCIA: '+@_SENTENCIA+'';
					 
					 SET @QUERY_19 = '
						 SELECT desCodigo
						 FROM '+@_ESQUEMA+'Arbol, '+@_ESQUEMA+'Descripcion 
						 WHERE (arbClaveDescrip = desClave and arbClaveInd = '+@_PAR01+')';
					  EXECUTE (@QUERY_19);

					  --SET @PAR01_ = (SELECT arbClave FROM ManV2.Arbol, ManV2.Descripcion WHERE (arbClaveDescrip = desClave and arbClaveInd = @_PAR01));
		   
					   IF(@_ESQUEMA = 'ManV2.')
					   BEGIN
					   SET @PAR01_ = (SELECT arbClave FROM ManV2.Arbol, ManV2.Descripcion WHERE (arbClaveDescrip = desClave and arbClaveInd = @_PAR01));
					   END
					   ELSE IF(@_ESQUEMA = 'PreV2.')
					   BEGIN
						SET @PAR01_ = (SELECT arbClave FROM PreV2.Arbol, PreV2.Descripcion WHERE (arbClaveDescrip = desClave and arbClaveInd = @_PAR01));
					   END
						ELSE IF(@_ESQUEMA = 'PubV2.')
					   BEGIN
					   SET @PAR01_ = (SELECT arbClave FROM PubV2.Arbol, PubV2.Descripcion WHERE (arbClaveDescrip = desClave and arbClaveInd = @_PAR01));
					   END
					   ELSE
					   BEGIN
					   PRINT'ERROR DE ESQUEMA';
					   END;


					  PRINT 'EL VALOR DE @PAR01_ ES: '+@PAR01_;
					END;---------------------------------------------------------------------------------------------------------------------------------CIERRA   2.1.1.17 (ACCION:MANIPULACION/MODULO:EXPORTACION. OBJETO:EXTRACCION. SENTENCIA:CONVERSION_DESCOD)

					--//
					---//
				  ELSE IF(@_SENTENCIA = 'ATS_CLAVE_SERIES')
					BEGIN--------------------------------------------------------------------------------------------------------------------------------ABRE     2.1.1.18 (ACCION:MANIPULACION/MODULO:EXPORTACION. OBJETO:_EXTRACCION. SENTENCIA:ATS_CLAVE_SERIES) 
					  PRINT 'ESTAMOS EN EL MÓDULO '+@_MODULO+', EN EL OBJETO '+@_OBJETO+', EN LA SENTENCIA: '+@_SENTENCIA+'';

							  DECLARE @COUNT_EnlSerInd_QDD NVARCHAR(100);
							  DECLARE @ESICVESERIE_AUX_QDD NVARCHAR(500)='';
							  DECLARE @ITER_QDD INT = 1;
							  DECLARE @CVESINS_QDD NVARCHAR(500)= '';
							  DECLARE @CVERI_QDD NVARCHAR(500) = '';
							  DECLARE @ARBCLAVE NVARCHAR(200) = @_PAR01;

							  SET @COUNT_EnlSerInd_QDD = (SELECT COUNT  (*)FROM  ManV2.[AtrSerie] WHERE atsClaveSerie  IN
							  (SELECT esiClaveSerie FROM  ManV2.[EnlSerInd]
							  WHERE esiClaveSerie IN ( SELECT esiClaveSerie FROM  ManV2.[EnlSerInd]
							  WHERE[esiClaveInd] = (SELECT arbClaveInd FROM ManV2.Arbol  WHERE arbClave = @ARBCLAVE) ))); 

							  PRINT 'EL VALOR DE @ITER_QDD ES: ' + CONVERT(NVARCHAR(20), @ITER_QDD) ;
							  PRINT 'EL VALOR DE @COUNT_EnlSerInd_QDD  ES: ' + CONVERT(NVARCHAR(20),@COUNT_EnlSerInd_QDD) ;

							  WHILE (@ITER_QDD    <= @COUNT_EnlSerInd_QDD) 
							  BEGIN 
								 PRINT 'ITERACIÓN  ES: ' + CONVERT(NVARCHAR(20), @ITER_QDD) ;
								   IF( @ITER_QDD = 2) 
									BEGIN 
									 SET @ESICVESERIE_AUX_QDD =  SUBSTRING(@ESICVESERIE_AUX_QDD, 2, 10 ); 
								   END; 
								   SET @ESICVESERIE_AUX_QDD =  @ESICVESERIE_AUX_QDD + ',' + CONVERT (NVARCHAR(20), (SELECT atsClaveSerie FROM ManV2.[AtrSerie] WHERE atsClaveSerie  IN (SELECT  esiClaveSerie FROM ManV2.[EnlSerInd] WHERE [esiClaveInd] = (SELECT  arbClaveInd FROM ManV2.Arbol  WHERE arbClave =  @ARBCLAVE) AND esiOrden = @ITER_QDD )));
								   PRINT 'EL VALOR DETERMINADO ES: '+@ESICVESERIE_AUX_QDD;
								SET @ITER_QDD = @ITER_QDD + 1; 
							  END; 

							  PRINT 'SALIENDO DEL WHILE'
							  PRINT  'EL VALOR DETERMINADO ANTES DEL PROCESO RTRIMP ES: '+@ESICVESERIE_AUX_QDD;
							  SET @CVESINS_QDD = @ESICVESERIE_AUX_QDD; 
							  IF( SUBSTRING(RTRIM(LTRIM(@CVESINS_QDD)),1,1) = ',') 
							  BEGIN 
								   SET @CVESINS_QDD =   RTRIM(LTRIM((REPLACE(@CVESINS_QDD,'',',')))); 
							  END; 

							  SET @CVERI_QDD = (SELECT atsClaveSerie FROM  ManV2.[AtrSerie] WHERE atsTipo = 'R' AND atsClaveSerie  
							  IN (SELECT esiClaveSerie FROM   ManV2.[EnlSerInd] WHERE[esiClaveInd] = (SELECT arbClaveInd FROM  ManV2.Arbol  WHERE arbClave = @ARBCLAVE))); 
							  PRINT '---------------------------------------------------------------------';
							  PRINT 'LAS CLAVE DE RESULTADO ES: '+ @CVERI_QDD;
							  PRINT 'LAS CLAVES DE INSUMO SON:  '+@CVESINS_QDD; 
							  SET @PAR01_ = @CVESINS_QDD
					 END;--------------------------------------------------------------------------------------------------------------------------------FIN     2.1.1.18 (ACCION:MANIPULACION/MODULO:EXPORTACION. OBJETO:_EXTRACCION. SENTENCIA:ATS_CLAVE_SERIES) 
					--//

				--================================

			   END;------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- CIERRA 2.1.1 (ACCION:MANIPULACION/MODULO:EXPORTACION:OBJETO: EXTRACCION)

			END; -----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------CIERRA 2.1 (ACCION:MANIPULACION/MODULO:EXPORTACION)
		 
		 END;------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ CIERRA 2 (ACCION:MANIPULACION)
  
 END;------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- CIERRA 0 ()

--PRINT '========================================================================================================================================================';

GO
