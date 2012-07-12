/*
Postgres SQL Data Transfer

Source Server         : LOCAL
Source Server Version : 80104
Source Host           : localhost:5432
Source Database       : consultorio
Source Schema         : public

Target Server Type    : PGSQL
Target Server Version : 80104
File Encoding         : 65001

Date: 2012-07-11 15:59:20

CREATE DATABASE consultorio
  WITH OWNER = postgres
       ENCODING = 'UTF8'
       TABLESPACE = pg_default
       LC_COLLATE = 'Spanish_Colombia.1252'
       LC_CTYPE = 'Spanish_Colombia.1252'
       CONNECTION LIMIT = -1;
*/
----------------------------------------------------------------
-- Table: persona

-- DROP TABLE persona;

CREATE TABLE persona
(
  perid int4 NOT NULL,
  pernombre varchar(20),
  perapellido varchar(20),
  pertelefono text,
  perdireccion varchar(40),
  percorreo text,
  persexo int4,
  pertiposangre varchar(3),
  perfechanacimiento date,
  perlugarnacimiento varchar(20),
  perdocumento varchar(25),
  pertipodocumento int4,
  perlugarexpedicion varchar(20),
  pernacionalidad varchar(20),
  perestadocivil varchar(30),
  CONSTRAINT persona_pkey PRIMARY KEY (perid)
) 
WITHOUT OIDS;
ALTER TABLE persona OWNER TO postgres;

----------------------------------------------------------------

-- Table: rol

-- DROP TABLE rol;

CREATE TABLE rol
(
  rolid int4 NOT NULL,
  rolnombre varchar(20),
  roldescripcion varchar(50),
  CONSTRAINT rol_pkey PRIMARY KEY (rolid)
) 
WITHOUT OIDS;
ALTER TABLE rol OWNER TO postgres;


----------------------------------------------------------------

-- Table: usuario

-- DROP TABLE usuario;

CREATE TABLE usuario
(
  perid int4 NOT NULL,
  usuestado int4,
  usulogin varchar(20) NOT NULL,
  usupassword varchar(20) NOT NULL,
  CONSTRAINT usuario_pkey PRIMARY KEY (perid),
  CONSTRAINT usuario_fk FOREIGN KEY (perid)
      REFERENCES persona (perid) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION
) 
WITHOUT OIDS;
ALTER TABLE usuario OWNER TO postgres;

----------------------------------------------------------------


-- Table: rolxusuario

-- DROP TABLE rolxusuario;

CREATE TABLE rolxusuario
(
  rolid int4 NOT NULL,
  perid int4 NOT NULL,
  CONSTRAINT rolxusuario_pkey PRIMARY KEY (rolid, perid),
  CONSTRAINT rolxusuario_perid_fkey FOREIGN KEY (perid)
      REFERENCES usuario (perid) MATCH SIMPLE
      ON UPDATE CASCADE ON DELETE CASCADE,
  CONSTRAINT rolxusuario_rolid_fkey FOREIGN KEY (rolid)
      REFERENCES rol (rolid) MATCH SIMPLE
      ON UPDATE CASCADE ON DELETE CASCADE
) 
WITHOUT OIDS;
ALTER TABLE rolxusuario OWNER TO postgres;

----------------------------------------------------------------

-- Table: area

-- DROP TABLE area;

CREATE TABLE area
(
  nombrearea text NOT NULL,
  CONSTRAINT area_pkey PRIMARY KEY (nombrearea)
) 
WITHOUT OIDS;
ALTER TABLE area OWNER TO postgres;

----------------------------------------------------------------
-- Table: periodo

-- DROP TABLE periodo;

CREATE TABLE periodo
(
  perid text NOT NULL,
  persemestre int8 NOT NULL,
  perano int8 NOT NULL,
  perfecha text,
  perfechafinal text,
  activo int8 DEFAULT 0,
  CONSTRAINT perid PRIMARY KEY (perid)
) 
WITHOUT OIDS;
ALTER TABLE periodo OWNER TO postgres;

----------------------------------------------------------------

-- Table: estudiantes

-- DROP TABLE estudiantes;

CREATE TABLE estudiantes
(
  estuid int8 NOT NULL,
  identificacion text,
  nombre text,
  apellido text,
  activo text,
  observacion text,
  reparto text,
  perid text,
  CONSTRAINT estudiantes_pkey PRIMARY KEY (estuid),
  CONSTRAINT perid FOREIGN KEY (perid)
      REFERENCES periodo (perid) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION
) 
WITHOUT OIDS;
ALTER TABLE estudiantes OWNER TO postgres;


-- Index: fki_perid

-- DROP INDEX fki_perid;

CREATE INDEX fki_perid
  ON estudiantes
  USING btree
  (perid);


----------------------------------------------------------------

-- Table: asignacion

-- DROP TABLE asignacion;

CREATE TABLE asignacion
(
  codigo int8 NOT NULL,
  estudiante int8,
  area text,
  periodo text,
  casos int8 DEFAULT 0,
  CONSTRAINT asignacion_pkey PRIMARY KEY (codigo),
  CONSTRAINT asigarea FOREIGN KEY (area)
      REFERENCES area (nombrearea) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT estudiante FOREIGN KEY (estudiante)
      REFERENCES estudiantes (estuid) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT periodo FOREIGN KEY (periodo)
      REFERENCES periodo (perid) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION
) 
WITHOUT OIDS;
ALTER TABLE asignacion OWNER TO postgres;


-- Index: fki_asigarea

-- DROP INDEX fki_asigarea;

CREATE INDEX fki_asigarea
  ON asignacion
  USING btree
  (area);

-- Index: fki_estudiante

-- DROP INDEX fki_estudiante;

CREATE INDEX fki_estudiante
  ON asignacion
  USING btree
  (estudiante);

-- Index: fki_periodo

-- DROP INDEX fki_periodo;

CREATE INDEX fki_periodo
  ON asignacion
  USING btree
  (periodo);

----------------------------------------------------------------
    
-- Table: estu_asig_temp

-- DROP TABLE estu_asig_temp;

CREATE TABLE estu_asig_temp
(
   id serial NOT NULL,
  identificacion text,
  nombre text,
  apellido text,
  laboral int8,
  penal int8,
  privada int8,
  publica int8,
  casos int8,
  periodo int8,
  estuid int8,
  CONSTRAINT estu_asig_temp_pkey PRIMARY KEY (id)
) 
WITHOUT OIDS;
ALTER TABLE estu_asig_temp OWNER TO postgres;

----------------------------------------------------------------
-- Table: estu_recep_temp

-- DROP TABLE estu_recep_temp;

CREATE TABLE estu_recep_temp
(
  id serial NOT NULL,
  perdocu text,
  perabogado text,
  perapeabog text,
  laboral int8,
  penal int8,
  privada int8,
  publica int8,
  casos int8,
  periodo int8,
  CONSTRAINT estu_recep_temp_pkey PRIMARY KEY (id)
) 
WITHOUT OIDS;
ALTER TABLE estu_recep_temp OWNER TO postgres;

----------------------------------------------------------------
-- Table: estu_siste_temp

-- DROP TABLE estu_siste_temp;

CREATE TABLE estu_siste_temp
(
  id serial NOT NULL,
  perdocuss text,
  perabogadoss text,
  perapeabogss text,
  laboral int8,
  penal int8,
  privada int8,
  publica int8,
  casos int8,
  periodo int8,
  CONSTRAINT estu_siste_temp_pkey PRIMARY KEY (id)
) 
WITHOUT OIDS;
ALTER TABLE estu_siste_temp OWNER TO postgres;

----------------------------------------------------------------

-- Table: estudianteperiodo

-- DROP TABLE estudianteperiodo;

CREATE TABLE estudianteperiodo
(
  codigo int8 NOT NULL,
  estudiante int8 NOT NULL,
  periodo text NOT NULL,
  CONSTRAINT codigo PRIMARY KEY (codigo),
  CONSTRAINT estuid FOREIGN KEY (estudiante)
      REFERENCES estudiantes (estuid) MATCH SIMPLE
      ON UPDATE CASCADE ON DELETE CASCADE,
  CONSTRAINT periid FOREIGN KEY (periodo)
      REFERENCES periodo (perid) MATCH SIMPLE
      ON UPDATE CASCADE ON DELETE CASCADE
) 
WITHOUT OIDS;
ALTER TABLE estudianteperiodo OWNER TO postgres;

----------------------------------------------------------------

-- Table: personacaso

-- DROP TABLE personacaso;

CREATE TABLE personacaso
(
  perradicado int8 NOT NULL,
  perfecha varchar(20),
  perhora varchar(10) DEFAULT to_char(now(), 'HH24:MI:SS'::text),
  pernombre varchar(100),
  perapellido varchar(100),
  persexo varchar(10),
  peredad text,
  pernacionalidad varchar(100),
  perdocumento text,
  pertipodocumento varchar(30),
  perlugarexpedicion varchar(100),
  perlibretamilitar varchar(20),
  pernumerolibreta text,
  perdistritomilitar varchar(100),
  perdireccion text,
  pertelefono text,
  peremail varchar(100),
  persisben varchar(10),
  pernumero varchar(10),
  perdiscapacidad varchar(40),
  pertipodisca text,
  pergrupoetnico varchar(40),
  percualetnico text,
  pernivelescola varchar(40),
  percualnivel text,
  pertipofamilia varchar(20),
  permodofamil text,
  pernumfamilia text,
  perestadocivil varchar(30),
  perconyuge text,
  perallegado text,
  perfijo text,
  perdireccionalle text,
  percelular text,
  perautoridad varchar(30),
  persanciona varchar(30),
  peraporte varchar(30),
  perconflictos varchar(30),
  perfactor varchar(30),
  parautor varchar(30),
  pervivienda varchar(30),
  pertenencia varchar(30),
  peragua varchar(20),
  perluz varchar(20),
  peralcantarillado varchar(30),
  paralumbrado varchar(40),
  pertelefonos varchar(30),
  peraseo varchar(40),
  perocupacion text,
  perlabora varchar(40),
  persalario text,
  pertipotra varchar(50),
  perempresa text,
  perclase varchar(40),
  persalud varchar(20),
  perpension varchar(20),
  perarp varchar(10),
  perotro varchar(10),
  perocupaconyu text,
  perdesplazado varchar(20),
  perlugardes text,
  perfechades varchar(20),
  permotivo text,
  perarmado text,
  pergrupo text,
  perrupd text,
  perrelacion text,
  perjuridica varchar(10),
  percuales text,
  permodalidad text,
  percaso text,
  perasesoria text,
  perexposicion text,
  perarea varchar(40),
  perobservaciones text,
  perdocumentos text,
  perabogado varchar(100),
  perapeabog varchar(100),
  perdocu text,
  perabogados varchar(100),
  perapeabogs varchar(100),
  perdocus text,
  perabogadoss varchar(100),
  perapeabogss varchar(100),
  perdocuss text,
  perrecibido text,
  perid text,
  estuid int8,
  municipio text,
  embarazada text,
  perrango text,
  created date,
  created_hora time(6),
  modified date,
  modified_hora time(6),
  CONSTRAINT personacaso_pkey PRIMARY KEY (perradicado),
  CONSTRAINT area FOREIGN KEY (perarea)
      REFERENCES area (nombrearea) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT estuid FOREIGN KEY (estuid)
      REFERENCES estudiantes (estuid) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT personacaso_perid_fkey FOREIGN KEY (perid)
      REFERENCES periodo (perid) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION
) 
WITHOUT OIDS;
ALTER TABLE personacaso OWNER TO postgres;


-- Index: fki_

-- DROP INDEX fki_;

CREATE INDEX fki_
  ON personacaso
  USING btree
  (perid);

-- Index: fki_area

-- DROP INDEX fki_area;

CREATE INDEX fki_area
  ON personacaso
  USING btree
  (perarea);

-- Index: fki_estuid

-- DROP INDEX fki_estuid;

CREATE INDEX fki_estuid
  ON personacaso
  USING btree
  (estuid);

----------------------------------------------------------------
INSERT INTO "persona" VALUES ('4', 'Monica Lucia', 'Barbanti Castellanos', '3112112723', 'Autopista Internacional ', 'consultoriojuridico@unipamplona.edu.co', '2', 'a', '1987-10-12', 'sdf', '112', '1', 'asd', 'asd', 'gjg');
INSERT INTO "persona" VALUES ('3', 'Abogado en', 'Formacion', '3115127138', 'calle 4 n 5-67', 'afdjfla', '2', 'a+', '1987-10-10', 'cOLOMBIA', '87100862520', '2', 'Pamplona', 'Colombiano', 'Soltero');
INSERT INTO "persona" VALUES ('2', 'Abogado en', 'Formacion', '5685223', 'calle 2N 8-29', 'manucar87@hotmail.com', '1', 'A+', '1987-07-28', 'Venezuela', '1126418238', '3', 'Pamplona', 'Colombiano', 'Soltero');
INSERT INTO "persona" VALUES ('5', 'Abogado en', 'Formacion', '79472934', '.', '.', '2', 'a', '1987-10-12', 'l', null, null, null, null, null);
INSERT INTO "persona" VALUES ('6', 'Abogado en', 'Formacion', null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO "persona" VALUES ('7', 'Abogado en', 'Formacion', null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO "persona" VALUES ('8', 'Abogado en', 'Formacion', null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO "persona" VALUES ('9', 'Abogado en', 'Formacion', null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO "persona" VALUES ('1', 'Jenny Paola', 'Villamizar', '3156649337', 'Calle 11B #861 Urb. Romero', 'luishernando18@hotmail.com', '2', 'O+', '1987-07-28', 'Venezuela', '1126418237', '2', 'Pamplona', 'Colombiano', 'Soltero');

INSERT INTO "usuario" VALUES ('4', '1', 'admin', 'molubaca');
INSERT INTO "usuario" VALUES ('1', '1', 'asistente', '123456');
INSERT INTO "usuario" VALUES ('2', '1', 'consultorio1', 'consultorio');
INSERT INTO "usuario" VALUES ('9', '1', 'consultorio7', 'consultorio');
INSERT INTO "usuario" VALUES ('8', '1', 'consultorio6', 'consultorio');
INSERT INTO "usuario" VALUES ('7', '1', 'consultorio5', 'consultorio');
INSERT INTO "usuario" VALUES ('6', '1', 'consultorio4', 'consultorio');
INSERT INTO "usuario" VALUES ('5', '1', 'consultorio3', 'consultorio');
INSERT INTO "usuario" VALUES ('3', '1', 'consultorio2', 'consultorio');

INSERT INTO "rol" VALUES ('1', 'Admin', 'Admin');
INSERT INTO "rol" VALUES ('2', 'Estudiante', 'Estudiante');

INSERT INTO "rolxusuario" VALUES ('1', '4');
INSERT INTO "rolxusuario" VALUES ('2', '1');
INSERT INTO "rolxusuario" VALUES ('2', '2');
INSERT INTO "rolxusuario" VALUES ('2', '3');
INSERT INTO "rolxusuario" VALUES ('2', '5');
INSERT INTO "rolxusuario" VALUES ('2', '6');
INSERT INTO "rolxusuario" VALUES ('2', '7');
INSERT INTO "rolxusuario" VALUES ('2', '8');
INSERT INTO "rolxusuario" VALUES ('2', '9');

INSERT INTO "area" VALUES ('PUBLICA');
INSERT INTO "area" VALUES ('PRIVADA');
INSERT INTO "area" VALUES ('PENAL');
INSERT INTO "area" VALUES ('LABORAL');




