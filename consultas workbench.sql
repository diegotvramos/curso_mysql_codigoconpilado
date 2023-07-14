create database modificar;
use modificar;

create table producto(
clave_prod int,
nom_prod varchar(20),
precio float,
constraint pk_cp primary key (clave_prod));

create table cliente(clientes
clave_clie int,
nom_clie varchar(20),
constraint pk_cc primary key (clave_clie));


create table nota(
folio int,
clave_prod1 int,
clave_clie1 int,
cant int,
subtot float,
constraint fk_cp1 foreign key (clave_prod1) references producto (clave_prod),
constraint fk_cc1 foreign key (clave_clie1) references cliente (clave_clie));

insert into producto values (1,'papas',7);
insert into producto values (2,'refresco',9);
insert into producto values (3, 'galletas',9);

insert into cliente values (1,'ana');
insert into cliente values (2,'sergio');

insert into nota values (1,1,1,4,null);
insert into nota values (2,2,2,1,null);

select * from nota;
select* from producto;
select* from cliente;

select count(*) from producto; 
     #UPDATE NO FUNCIONA EN MYSQL.
update cliente
set nom_clie='laura'
where clave_clie=1;

update nota as n
inner join producto as p on p.clave_prod=n.clave_prod1
set subtot=cant*precio
WHERE subtot ='NULL';

UPDATE 		nota 
INNER JOIN 	producto ON producto.clave_prod = nota.clave_prod1
SET 		subtotal = cantidad * precio;



#elimino todo los registros de una tabla
delete from cliente;

#elimino un registro
delete from producto where clave_prod=2;

#eliminar registro que cumpla con where recuerda: no se puede elimiar campos si estan relacionados con otras tablas
delete from producto where precio= 9 and clave_prod =2;

#borra tabla y registro; elimina hasta la creacion de la misma tabla
drop table cliente;

#MySQL ver usuarios y permisos
select current_user();
show grants;

#ELIMINAR SOLO LOS DATOS QUE CONTIENE LA TABLA; VACIA LA TABLA; aun se puede recuperar con rollback pero debe terner copida de seguridad
truncate table nota;
ROLLBACK;
#borrar base de datos
drop database modificar;


