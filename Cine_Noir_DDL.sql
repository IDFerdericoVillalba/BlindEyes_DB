-- DROP SCHEMA public;

CREATE SCHEMA public AUTHORIZATION pg_database_owner;

-- DROP SEQUENCE compras_id_seq;

CREATE SEQUENCE compras_id_seq
	INCREMENT BY 1
	MINVALUE 1
	MAXVALUE 2147483647
	START 1
	CACHE 1
	NO CYCLE;
-- DROP SEQUENCE funciones_id_seq;

CREATE SEQUENCE funciones_id_seq
	INCREMENT BY 1
	MINVALUE 1
	MAXVALUE 2147483647
	START 1
	CACHE 1
	NO CYCLE;
-- DROP SEQUENCE peliculas_id_seq;

CREATE SEQUENCE peliculas_id_seq
	INCREMENT BY 1
	MINVALUE 1
	MAXVALUE 2147483647
	START 1
	CACHE 1
	NO CYCLE;-- public.peliculas definition

-- Drop table

-- DROP TABLE peliculas;

CREATE TABLE peliculas (
	id serial4 NOT NULL,
	titulo varchar(250) NOT NULL,
	genero varchar(250) NOT NULL,
	duracion varchar(10) NOT NULL,
	clasificacion varchar(10) NOT NULL,
	CONSTRAINT peliculas_clasificacion_not_null NOT NULL clasificacion,
	CONSTRAINT peliculas_duracion_not_null NOT NULL duracion,
	CONSTRAINT peliculas_genero_not_null NOT NULL genero,
	CONSTRAINT peliculas_id_not_null NOT NULL id,
	CONSTRAINT peliculas_pkey PRIMARY KEY (id),
	CONSTRAINT peliculas_titulo_not_null NOT NULL titulo
);


-- public.funciones definition

-- Drop table

-- DROP TABLE funciones;

CREATE TABLE funciones (
	id serial4 NOT NULL,
	id_pelicula int4 NULL,
	fecha date NOT NULL,
	hora time NOT NULL,
	sala varchar(10) NOT NULL,
	precio numeric(10, 2) NOT NULL,
	cupos_disponibles int4 NOT NULL,
	CONSTRAINT funciones_cupos_disponibles_not_null NOT NULL cupos_disponibles,
	CONSTRAINT funciones_fecha_not_null NOT NULL fecha,
	CONSTRAINT funciones_hora_not_null NOT NULL hora,
	CONSTRAINT funciones_id_not_null NOT NULL id,
	CONSTRAINT funciones_pkey PRIMARY KEY (id),
	CONSTRAINT funciones_precio_not_null NOT NULL precio,
	CONSTRAINT funciones_sala_not_null NOT NULL sala,
	CONSTRAINT funciones_id_pelicula_fkey FOREIGN KEY (id_pelicula) REFERENCES peliculas(id) ON DELETE CASCADE
);


-- public.compras definition

-- Drop table

-- DROP TABLE compras;

CREATE TABLE compras (
	id serial4 NOT NULL,
	id_funcion int4 NULL,
	nombre_cliente varchar(100) NOT NULL,
	cantidad_boletos int4 NOT NULL,
	total_pago numeric(10, 2) NOT NULL,
	fecha_compra timestamp NOT NULL,
	CONSTRAINT compras_cantidad_boletos_not_null NOT NULL cantidad_boletos,
	CONSTRAINT compras_fecha_compra_not_null NOT NULL fecha_compra,
	CONSTRAINT compras_id_not_null NOT NULL id,
	CONSTRAINT compras_nombre_cliente_not_null NOT NULL nombre_cliente,
	CONSTRAINT compras_pkey PRIMARY KEY (id),
	CONSTRAINT compras_total_pago_not_null NOT NULL total_pago,
	CONSTRAINT compras_id_funcion_fkey FOREIGN KEY (id_funcion) REFERENCES funciones(id) ON DELETE CASCADE
);