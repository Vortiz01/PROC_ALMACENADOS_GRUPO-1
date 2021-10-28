create database Equipo_1
go

use Equipo_1
go

create table Pacientes 
(
Cod_Paciente int primary key not null,
PrimerNom varchar(30) not null,
Apellido varchar(30) not null,
Peso decimal(10,2) not null,
Estatura decimal(10,2) not null,
Telefono varchar(20),
Correo varchar(30),
FechaNac date not null
)
go

create proc PA_insertarData
@codPac as int,
@nom as varchar(30),
@ape as varchar(30),
@pes as decimal(10,2),
@est as decimal(10,2),
@tel as varchar(20),
@corre as varchar(30),
@fecha as date
with encryption
as begin
insert into Pacientes
values (@codPac, @nom , @ape , @pes, @est, @tel, @corre, @fecha)
end
go

exec PA_insertarData 1,'mariuri','zunigi',70,1.50,'7766-5544','example@gmail.com','2002/05/20'
go

create proc PA_ModificarData
@codPac as int,
@nom as varchar(30),
@ape as varchar(30),
@pes as decimal(10,2),
@est as decimal(10,2),
@tel as varchar(20),
@corre as varchar(30),
@fecha as date
with encryption
as begin
Update Pacientes set PrimerNom = @nom,Apellido = @ape ,Peso = @pes,Estatura = @est,Telefono = @tel,Correo = @corre,FechaNac = @fecha
where Cod_Paciente = @codPac
end
go

exec PA_ModificarData 1,'Maryury','Zuniga',50,1.62,'6644-3311','example@yahoo.com','2002/01/01'
go

create proc PA_EliminarData
@codPac as int
with encryption
as begin
Delete from Pacientes where Cod_Paciente = @codPac
end
go

exec PA_EliminarData 1
go

create proc PA_ConsultarData
with encryption
as begin
select * from Pacientes
end
go

exec PA_ConsultarData
go