drop table empleados;

alter table ciudades
	drop constraint cd_idciudad_pk;

alter table ciudades
 add constraint cd_idciudad_pk PRIMARY KEY(IDCIUDAD);

create table empleados (
empleado_id number constraint emp_empleado_id_pk primary key,
nombre varchar2(25),
nacid number,
constraint emp_cd_fk FOREIGN key (nacid) 
                     references ciudades(idciudad)
);

insert into empleados values(1, 'Pepito', 1);
insert into empleados values(2, 'Mafalda', 40);
insert into empleados(empleado_id, nombre) values(3, 'Batman');
commit;
