create database AEUSP
go

use AEUSP
go

create table [tbUsuario]
(carnet varchar(12) not null primary key,
cedula varchar(20) not null,
nombreCompleto varchar(100) not null,
clave varchar(20) not null)
go

create table [tbOrganismo]
(codigo varchar(10) not null primary key,
nombre varchar(50) not null)
go

create table [tbOrganismoUsuario]
(codigo varchar(10) not null,
miembro varchar(12) not null,
primary key(codigo, miembro))
go

alter table [tbOrganismoUsuario] add foreign key (codigo) references [tbOrganismo] (codigo)
go
alter table [tbOrganismoUsuario] add foreign key (miembro) references [tbUsuario] (carnet)
go

create table [tbActivo]
(idActivo int not null identity(1,1) primary key,
codigoOrganismo varchar(10) not null,
cantidadTotal int not null,
cantidadInventario int not null,
estado varchar(3) not null,
observacion varchar(200) null)
go

alter table [tbActivo] add foreign key (codigoOrganismo) references [tbOrganismo] (codigo)
go

create table [tbColchon]
(numeroColchon int not null primary key,
idActivo int not null,
procedencia varchar(50) null)
go

alter table [tbColchon] add foreign key (idActivo) references [tbActivo] (idActivo)
go

create table [tbActivoGeneral]
(placa int not null primary key,
idActivo int not null,
nombre varchar(50) not null,
ubicacion varchar(200) not null)

alter table [tbActivoGeneral] add foreign key (idActivo) references [tbActivo] (idActivo)
go

create table [tbAsistente]
(cedula varchar(20) not null primary key,
nombreCompleto varchar(100),
fechaNacimiento Date not null,
telefono varchar(20) not null,
tipo varchar(20) not null, 
estado int null)
go

create table [tbEstudiante]
(cedula varchar(20) not null,
carnet varchar(12) not null,
carrera varchar(100) not null,
primary key(cedula, carnet))
go

alter table [tbEstudiante] add foreign key (cedula) references [tbAsistente] (cedula)
go

create table [tbMovimientoActivo]
(idMovimiento int not null identity(1,1) primary key,
carnetUsuario varchar(12) not null,
cedulaAsistente varchar(20) not null,
fecha datetime2 not null,
tipo char(1))
go

alter table [tbMovimientoActivo] add foreign key (carnetUsuario) references [tbUsuario] (carnet)
go
alter table [tbMovimientoActivo] add foreign key (cedulaAsistente) references [tbAsistente] (cedula)
go

create table [tbDetalleMovimientoActivos]
(idMovimiento int not null,
idActivo int not null, 
cantidad int not null,
ubicacion varchar(200) not null, primary key(idMovimiento, idActivo))
go

alter table [tbDetalleMovimientoActivos] add foreign key (idMovimiento) references [tbMovimientoActivo] (idMovimiento)
go
alter table [tbDetalleMovimientoActivos] add foreign key (idActivo) references [tbActivo] (idActivo)
go

create table [tbConsumible]
(idConsumible int not null identity(1,1) primary key,
codigoOrganismo varchar(10) not null,
nombre varchar(50) not null,
inventario int not null)
go

alter table [tbConsumible] add foreign key (codigoOrganismo) references [tbOrganismo] (codigo)
go

create table [tbConsumibleAlimentacion]
(idConsumible int not null primary key,
categoria varchar(25) not null,
unidadMedida varchar(20) not null)
go

alter table [tbConsumibleAlimentacion] add foreign key (idConsumible) references [tbConsumible] (idConsumible)
go

create table [tbConsumibleSalud]
(codigo int not null primary key,
descripcion varchar(200) null)
go

alter table [tbConsumibleSalud] add foreign key (codigo) references [tbConsumible] (idConsumible)

create table [tbMovimientoAsistencia]
(idMovimiento int not null identity(1,1) primary key,
cedulaAsistente varchar (20) not null,
fecha datetime2 not null,
accion char(1) not null)
go

alter table [tbMovimientoAsistencia] add foreign key (cedulaAsistente) references [tbAsistente] (cedula)
go

create table [tbCuenta]
(idCuenta char(1) not null primary key,
nombreCuenta varchar(50),
monto decimal (9,2))
go

create table [tbMovimientoCuenta]
(idMovimiento int not null identity(1,1) primary key,
idCuenta char(1) not null,
carnetUsuario varchar(12) not null,
fecha datetime2 not null,
detalle varchar (200) null,
tipo char(1) not null,
monto decimal(9,2))
go

alter table [tbMovimientoCuenta] add foreign key (idCuenta) references [tbCuenta] (idCuenta)
go
alter table [tbMovimientoCuenta] add foreign key (carnetUsuario) references [tbUsuario] (carnet)
go

create table [tbMovimientoCuentaTracto]
(idMovimiento int not null primary key,
numeroFactura  varchar(20) null,
empresa varchar(50) null)
go

alter table [tbMovimientoCuentaTracto] add foreign key (idMovimiento) references [tbMovimientoCuenta] (idMovimiento)
go

create table [tbBoletaMedica]
(numeroBoleta int not null identity(1,1) primary key,
 cedulaAsistente varchar(20) not null,
 carnetUsuario varchar(12) not null,
 observacion varchar(200) null,
 tratamiento varchar(200) null,
 fecha datetime2 default getDate())
 go

 alter table [tbBoletaMedica] add foreign key (cedulaAsistente) references [tbAsistente] (cedula)
 go
 alter table [tbBoletaMedica] add foreign key (carnetUsuario) references [tbUsuario] (carnet)

 create table [tbSuministrosBoleta]
 (numeroBoleta int not null,
 codigo int not null,
 cantidad int not null
 primary key (numeroBoleta, codigo))
 go

 alter table [tbSuministrosBoleta] add foreign key (numeroBoleta) references [tbBoletaMedica] (numeroBoleta)
 go
 alter table [tbSuministrosBoleta] add foreign key (codigo) references [tbConsumibleSalud] (codigo)
 GO





/*******************************************************Procedimientos*******************************************************************/
 create PROCEDURE[dbo].[Sp_Cns_EntradasPorFecha](@movimiento char(1),@fechaInicio datetime2(7),@fechaSalida datetime2(7))
 as
 SELECT m.cedulaAsistente , a.nombreCompleto,a.tipo, m.fecha
 FROM tbMovimientoAsistencia m,tbAsistente a 
 WHERE m.accion=@movimiento 
 and
 m.cedulaAsistente=a.cedula
 and
 m.fecha between @fechaInicio AND @fechaSalida 
 order by a.nombreCompleto;
 GO
 
CREATE TRIGGER TRG_UPDATE_ESTADO
ON TBMOVIMIENTOASISTENCIA
AFTER  INSERT
AS
DECLARE @ESTADO CHAR(1),@CEDULA VARCHAR(20);
	SELECT @ESTADO=I.ACCION FROM INSERTED I;
	SELECT @CEDULA=I.CEDULAASISTENTE FROM INSERTED I;
BEGIN
	
	IF (SELECT I.ACCION FROM INSERTED I)='E'
	UPDATE TBASISTENTE 
	SET estado=1
	WHERE @CEDULA=CEDULA;
	ELSE 
	UPDATE TBASISTENTE 
	SET ESTADO=0
	WHERE @CEDULA=CEDULA;
END
GO

 create PROCEDURE[dbo].[Sp_Cns_EntradasActivas]
 as
 Select  a.nombreCompleto, a.cedula ,max(m.fecha) as ultFecha
 FROM tbAsistente a,tbMovimientoAsistencia m
 where m.accion='e' and a.estado=1 and a.cedula=m.cedulaAsistente  group by a.nombreCompleto,a.cedula
 GO

 create PROCEDURE[dbo].[Sp_Ins_Movimiento](@cedula varchar(20),@accion char(1))
 as
	insert into tbMovimientoAsistencia(cedulaAsistente,accion) values(@cedula,@accion);
 GO
--------a.tipoa.cedula

create or ALTER procedure [SP_ADDUSERORGANISM] (@codigo varchar(10), @miembro varchar(12)) as
	insert into dbo.tbOrganismoUsuario values(@codigo, @miembro);
go

create or alter procedure [Sp_Cns_ConsumiblesLimpiezaPorNombre](
@nombre varchar(130))
as
select c.idConsumible as IdConsumible,
c.codigoOrganismo as CodigoOrganismo,
c.nombre as Nombre,
c.inventario as CantidadInventario
from tbConsumible c with(nolock)
where c.nombre like '%' + @nombre + '%'
and c.codigoOrganismo = 'C001'
order by c.idConsumible
go

create or alter view VP_CNS_COMISIONES as
	select u.carnet, u.cedula, u.nombreCompleto, o.nombre from tbUsuario u, tbOrganismo o, tbOrganismoUsuario ou where u.carnet=ou.miembro and o.codigo = ou.codigo
go

create or alter procedure [SP_OBT_ORGANISMO] (@carnet varchar(10)) as
select o.nombre from tbOrganismo o, tbOrganismoUsuario ou where ou.miembro = @carnet and o.codigo = ou.codigo
go

create or alter procedure [SP_CNS_USUARIOS] (@carnet varchar(10)) as
	select distinct u.carnet, u.cedula, u.nombreCompleto, o.nombre from tbUsuario u, tbOrganismo o, tbOrganismoUsuario ou where u.carnet= ou.miembro 
	and o.codigo=ou.codigo and carnet like '%'+@carnet+'%';
go

GO
 Create or alter PROCEDURE[dbo].[Sp_Cns_InvaAsoPorNombre](@nombre varchar(50))
 AS
 SELECT a.idActivo,g.placa,a.codigoOrganismo,a.cantidadTotal,a.cantidadInventario,case a.estado when('B') then 'Bueno' when('m') then 'Malo'  when('P') then 'Perdido' when('I') then 'Intermedio' 
 end as estado,a.observacion,
 g.nombre,g.ubicacion
 FROM tbActivo a,tbActivoGeneral g with(nolock)
 WHERE a.idActivo=g.idActivo and g.nombre like '%' + @nombre +  '%'
 ORDER BY g.nombre
 GO
  

 
Create or alter procedure[dbo].[Sp_Cns_InvActivosAso]
as
SELECT a.idActivo,g.placa,a.codigoOrganismo,a.cantidadTotal,a.cantidadInventario,case a.estado when('B') then 'Bueno' when('m') then 'Malo'  when('P') then 'Perdido' when('I') then 'Intermedio' 
 end as estado,a.observacion,
 g.nombre,g.ubicacion
 FROM tbActivo a,tbActivoGeneral g with(nolock)
 WHERE a.idActivo=g.idActivo
Go



create or alter trigger [TR_UPD_MONTO] on
[tbMovimientoCuenta] after insert
as
set nocount on
declare @montoTransaccional decimal, @tipo char(1), @cuenta char(1), @idMov int
select @montoTransaccional = monto from inserted
select @tipo = tipo from inserted 
select @cuenta = idCuenta from inserted
select @idMov = idMovimiento from inserted
if @cuenta = 'E'
begin
	if @tipo = 'E'
	begin
		update [tbCuenta] set monto += @montoTransaccional
		where idCuenta = 'E'
	end
	else if @tipo = 'S'
	begin
		if @montoTransaccional <= (select monto from tbCuenta where idCuenta = 'E')
		begin
			update [tbCuenta] set monto = monto - @montoTransaccional
			where idCuenta = 'E'
		end
		else
		begin
			rollback transaction
		end
	end
end
else if @cuenta = 'T'
begin
	if @tipo = 'E'
	begin
		update [tbCuenta] set monto = monto + @montoTransaccional
		where idCuenta = 'T'
		insert into [tbMovimientoCuentaTracto]
		(idMovimiento)
		values(@idMov)
	end
	else if @tipo = 'S'
	begin
		if @montoTransaccional <= (select monto from tbCuenta where idCuenta = 'T')
		begin
			update [tbCuenta] set monto = monto - @montoTransaccional
			where idCuenta = 'T'
			insert into [tbMovimientoCuentaTracto]
			(idMovimiento)
			values(@idMov)
		end
		else
		begin
			rollback transaction
		end
	end
end
go

create or alter trigger [TR_UPD_INVENTARIO] on [tbDetalleMovimientoActivos]
after insert as
set nocount on
declare @cantidad int, @cantidadInventario int, @idAct int, @idMov int, @tipo char(1)
select @cantidad = cantidad from inserted
select @idAct = idActivo from inserted
select @idMov = idMovimiento from inserted
select @tipo = (select tipo 
				from tbMovimientoActivo where idMovimiento = @idMov)
select @cantidadInventario = (select cantidadInventario
							  from tbActivo where idActivo = @idAct)
if @tipo = 'E'
begin
	update [tbActivo] set cantidadInventario += @cantidad where idActivo = @idAct
end
else
begin
	if @cantidadInventario >= @cantidad
	begin 
		update [tbActivo] set cantidadInventario -= @cantidad where idActivo = @idAct
	end
end
go



create or alter procedure [SP_CNS_COLCHONES] as
select a.idActivo as ID, a.codigoOrganismo as CodigoOrganismo, a.cantidadTotal as Cantidad, 
		case a.cantidadInventario when(1) then 'Disponible' when(0) then 'Prestado' end as Disponibilidad,
		case a.estado when('B') then 'Bueno' when('M') then 'Malo' when('I') then 'Intermedio' end as Estado,
		 a.observacion as Observacion,
		c.numeroColchon as NumeroColchon, c.procedencia as Procedencia
		from tbActivo a, tbColchon c
		where a.idActivo = c.idActivo
go

create or alter procedure [SP_CNS_DISPONIBILIDADCOLCHONES]
(@disponibilidad int) as
if @disponibilidad = 1
begin
	select a.idActivo as ID, a.codigoOrganismo as CodigoOrganismo, a.cantidadTotal as Cantidad, 
		case a.cantidadInventario when(1) then 'Disponible' when(0) then 'Prestado' end as Disponibilidad,
		case a.estado when('B') then 'Bueno' when('M') then 'Malo' when('I') then 'Intermedio' end as Estado,
		 a.observacion as Observacion,
		c.numeroColchon as NumeroColchon, c.procedencia as Procedencia
		from tbActivo a, tbColchon c
		where a.idActivo = c.idActivo and
		a.cantidadInventario = 1
end
else if @disponibilidad = 0
begin
	select a.idActivo as ID, a.codigoOrganismo as CodigoOrganismo, a.cantidadTotal as Cantidad, 
		case a.cantidadInventario when(1) then 'Disponible' when(0) then 'Prestado' end as Disponibilidad,
		case a.estado when('B') then 'Bueno' when('M') then 'Malo' when('I') then 'Intermedio' end as Estado,
		 a.observacion as Observacion,
		c.numeroColchon as NumeroColchon, c.procedencia as Procedencia
		from tbActivo a, tbColchon c
		where a.idActivo = c.idActivo and
		a.cantidadInventario = 0
end
go

create or alter procedure [SP_INS_REGISTRARCOLCHON]
(@estado char(1), @observacion varchar(200), @numColchon int, @procedencia varchar(200))
as
declare @idAct int
insert into tbActivo 
(codigoOrganismo, cantidadTotal, cantidadInventario, estado, observacion)
values ('C01', 1, 1, @estado, @observacion)
select @idAct = (select max(idActivo) from tbActivo)
insert into tbColchon 
values (@numColchon, @idAct, @procedencia)
go

create or alter procedure [SP_INS_REGISTRARMOVIMIENTO]
(@carnet varchar(12), @cedula varchar(20), @tipo char(1), @fecha datetime) as
begin
insert into [tbMovimientoActivo]
(carnetUsuario, cedulaAsistente, tipo, fecha)
values(@carnet, @cedula, @tipo, @fecha)
end
go

create or alter procedure [SP_INS_REGISTRARPRESTAMOSCOLCHON]
(@idActivo int, @cantidad int, @ubicacion varchar(200)) as
declare @idMov int
select @idMov = (select MAX(idMovimiento) from [tbMovimientoActivo])
insert into [tbDetalleMovimientoActivos]
values(@idMov, @idActivo, @cantidad, @ubicacion)
go

create or alter procedure [SP_CNS_IDCOLCHON]
(@numColchon int) as
select a.idActivo from tbActivo a with(nolock), tbColchon c with(nolock)
	where c.numeroColchon = @numColchon
	and a.idActivo = c.idActivo
go

create or alter procedure [SP_CNS_Asistente]
(@cedula varchar(20)) as
select nombreCompleto from tbAsistente with(nolock) where cedula = @cedula
go

create or alter procedure [SP_CNS_COLCHONPORNUMERO]
(@numero int) as
select c.numeroColchon, case a.estado when('B') then 'Bueno' when('M') then 'Malo' when('I') then 'Intermedio' end as Estado
from tbActivo a with(nolock), tbColchon c with(nolock)
where a.idActivo = c.idActivo and c.numeroColchon = @numero
go

create or alter procedure [SP_CNS_PRESTAMOSCOLCHONESXCEDULA]
(@cedula varchar(20)) as
select distinct ma.idMovimiento as ID, ma.cedulaAsistente as Cedula, ma.fecha as Fecha, dma.ubicacion as Ubicacion
from tbMovimientoActivo ma, tbDetalleMovimientoActivos dma, tbActivo a, tbColchon c
where ma.idMovimiento = dma.idMovimiento and dma.idActivo = a.idActivo and a.idActivo = c.idActivo and
 ma.cedulaAsistente like '%'+@cedula+'%' and a.cantidadInventario = 0 and ma.tipo = 'S'
go

create or alter procedure [SP_CNS_PRESTAMOCOLCHONESXNUMERO]
(@numero varchar(10)) as
select distinct ma.idMovimiento as ID, ma.cedulaAsistente as Cedula, ma.fecha as Fecha, dma.ubicacion as Ubicacion
from tbMovimientoActivo ma, tbDetalleMovimientoActivos dma, tbActivo a, tbColchon c
where ma.idMovimiento = dma.idMovimiento and dma.idActivo = a.idActivo and a.idActivo = c.idActivo and
c.numeroColchon like '%'+@numero+'%' and  a.cantidadInventario = 0 and ma.tipo = 'S'
go

create or alter procedure [SP_CNS_ASISTENTEPRESTAMO]
(@idMov int) as
select distinct ast.nombreCompleto, ast.cedula
from tbAsistente ast, tbMovimientoActivo m
where ast.cedula = m.cedulaAsistente
go

create or alter procedure [SP_CNS_COLCHONESPRESTAMO]
(@idMov int) as
select c.numeroColchon as NumeroColchon,
case a.estado when('B') then 'Bueno' when('M') then 'Malo' when('I') then 'Intermedio' end as Estado
from tbColchon c, tbActivo a, tbMovimientoActivo ma, tbDetalleMovimientoActivos dma
where ma.idMovimiento = @idMov and ma.idMovimiento = dma.idMovimiento and dma.idActivo = a.idActivo
and a.idActivo = c.idActivo and  a.cantidadInventario = 0
go

create or alter procedure [SP_INS_REGISTRARDEVOLUCIONESCOLCHON]
(@idActivo int, @cantidad int) as
declare @idMov int
select @idMov = (select MAX(idMovimiento) from [tbMovimientoActivo])
insert into [tbDetalleMovimientoActivos]
(idMovimiento, idActivo, cantidad)
values(@idMov, @idActivo, @cantidad)
go

create or alter procedure [SP_CNS_COLCHONXNUMERO]
(@numero int) as
select idActivo from tbColchon
where numeroColchon = @numero
go

create or alter procedure [SP_DTL_ELIMINARDETALLECOLCHO]
(@idAct int) as
delete from tbDetalleMovimientoActivos where idActivo = @idAct
go

create or alter procedure [SP_ISN_CUENTA]
(@idCuent char(1), @carnetU varchar(12), @detalle varchar(200), @fecha datetime, @tipo char(1), @monto decimal(12,2)) as
insert into tbMovimientoCuenta
(idCuenta, carnetUsuario, detalle, fecha, tipo, monto)
values(@idCuent, @carnetU, @detalle, @fecha, @tipo, @monto)
go

create or alter procedure [SP_ISN_TRACTO]
(@idMov int, @factura varchar(30), @empresa varchar(50)) as
insert into tbMovimientoCuentaTracto
values(@idMov, @factura, @empresa)
go

create or alter procedure [SP_CNS_MOVTRACTO] as
select max(idMovimiento) from tbMovimientoCuenta
go

create or alter procedure [SP_CNS_MOVIMIENTOSTRACTOXFECHA]
(@fechaI datetime, @fechaF datetime) as
select mc.idMovimiento as ID, u.nombreCompleto as Usuario, mc.fecha as Fecha,
case mc.tipo when ('E') then 'Entrada' when ('S') then 'Salida' end as Tipo, 
mc.monto as Monto, mt.numeroFactura as Factura, mt.empresa as Empresa
from tbMovimientoCuenta mc, tbMovimientoCuentaTracto mt, tbUsuario u
where mc.idMovimiento = mt.idMovimiento and mc.fecha between @fechaI and @fechaF
and u.carnet = mc.carnetUsuario
go

create or alter procedure [SP_CNS_MOVIMIENTOSEFECTIVOXFECHA]
(@fechaI datetime, @fechaF datetime) as
select mc.idMovimiento as ID, u.nombreCompleto as Usuario, mc.fecha as Fecha,
case mc.tipo when ('E') then 'Entrada' when ('S') then 'Salida' end as Tipo, 
mc.monto as Monto from tbMovimientoCuenta mc, tbUsuario u
where mc.fecha between @fechaI and @fechaF
and u.carnet = mc.carnetUsuario
go


create or alter view [VP_CNS_CEDULAS] as 
select cedula from tbAsistente
go

create or alter view [VP_CNS_NUMEROCOLCHONESDISPONIBLES] as
select c.numeroColchon from [tbColchon] c, [tbActivo] a
where a.idActivo = c.idActivo and a.cantidadInventario = 1
go

create or ALTER   procedure [dbo].[SP_CNS_ORGANISMOUSUARIO]
(@usuario varchar(12)) as
select codigo
from tbOrganismoUsuario
where miembro = @usuario

create or alter procedure [Sp_Cns_FiltroCategoria](
@filtro varchar(25))
as
select n.idConsumible as id, nombre as Nombre_Consumible, n.inventario as Cantidad, c.unidadMedida as Unidad_Medida, c.categoria as Categoria from [tbConsumibleAlimentacion] c , [tbConsumible] n with(nolock)
where c.categoria like '%' + @filtro + '%'
and n.idConsumible = c.idConsumible
order by n.nombre
go

create or alter procedure [Sp_Cns_FiltroAlimentacion](
@filtro varchar(25))
as
select n.idConsumible as id, n.nombre as Nombre_Consumible, n.inventario as Cantidad, c.unidadMedida as Unidad_Medida, c.categoria as Categoria from [tbConsumibleAlimentacion] c , [tbConsumible] n with(nolock)
where n.nombre like '%' + @filtro + '%'
and n.idConsumible = c.idConsumible
order by n.nombre
go

create or alter procedure [SP_ELIMINAR_USUARIO] (@carnet varchar(12)) as
	delete from tbOrganismoUsuario where miembro=@carnet;
go