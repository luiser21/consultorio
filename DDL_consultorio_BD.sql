/*
Navicat PGSQL Data Transfer

Source Server         : LOCAL
Source Server Version : 80104
Source Host           : localhost:5432
Source Database       : consultorio
Source Schema         : public

Target Server Type    : PGSQL
Target Server Version : 80104
File Encoding         : 65001

Date: 2012-07-11 15:59:20
*/


-- ----------------------------
-- Sequence structure for "estu_recep_temp_id_seq"
-- ----------------------------
DROP SEQUENCE "estu_recep_temp_id_seq";
CREATE SEQUENCE "estu_recep_temp_id_seq"
 INCREMENT 1
 MINVALUE 1
 MAXVALUE 9223372036854775807
 START 74
 CACHE 1;

-- ----------------------------
-- Sequence structure for "estu_siste_temp_id_seq"
-- ----------------------------
DROP SEQUENCE "estu_siste_temp_id_seq";
CREATE SEQUENCE "estu_siste_temp_id_seq"
 INCREMENT 1
 MINVALUE 1
 MAXVALUE 9223372036854775807
 START 42
 CACHE 1;

-- ----------------------------
-- Table structure for "area"
-- ----------------------------
DROP TABLE "area";
CREATE TABLE "public"."area" (
"nombrearea" text DEFAULT NULL NOT NULL,
CONSTRAINT "area_pkey" PRIMARY KEY ("nombrearea")
)
WITHOUT OIDS 
;

ALTER TABLE "public"."area" OWNER TO "postgres";;


-- ----------------------------
-- Table structure for "asignacion"
-- ----------------------------
DROP TABLE "asignacion";
CREATE TABLE "public"."asignacion" (
"codigo" int8 DEFAULT NULL NOT NULL,
"estudiante" int8 DEFAULT NULL,
"area" text DEFAULT NULL,
"periodo" int8 DEFAULT NULL,
"casos" int8 DEFAULT 0,
CONSTRAINT "asignacion_pkey" PRIMARY KEY ("codigo"),
CONSTRAINT "estudiante" FOREIGN KEY ("estudiante") REFERENCES "public"."estudiantes" ("estuid") ON DELETE NO ACTION ON UPDATE NO ACTION,
CONSTRAINT "periodo" FOREIGN KEY ("periodo") REFERENCES "public"."periodo" ("perid") ON DELETE NO ACTION ON UPDATE NO ACTION,
CONSTRAINT "asigarea" FOREIGN KEY ("area") REFERENCES "public"."area" ("nombrearea") ON DELETE NO ACTION ON UPDATE NO ACTION
)
WITHOUT OIDS 
;

ALTER TABLE "public"."asignacion" OWNER TO "postgres";



CREATE INDEX "fki_asigarea" ON "public"."asignacion" USING btree ("area");

CREATE INDEX "fki_estudiante" ON "public"."asignacion" USING btree ("estudiante");

CREATE INDEX "fki_periodo" ON "public"."asignacion" USING btree ("periodo");;

-- ----------------------------
-- Table structure for "estu_asig_temp"
-- ----------------------------
DROP TABLE "estu_asig_temp";
CREATE TABLE "public"."estu_asig_temp" (
"id" int4 DEFAULT nextval('estu_recep_temp_id_seq'::regclass) NOT NULL,
"identificacion" text DEFAULT NULL,
"nombre" text DEFAULT NULL,
"apellido" text DEFAULT NULL,
"laboral" int8 DEFAULT NULL,
"penal" int8 DEFAULT NULL,
"privada" int8 DEFAULT NULL,
"publica" int8 DEFAULT NULL,
"casos" int8 DEFAULT NULL,
"periodo" int8 DEFAULT NULL,
"estuid" int8 DEFAULT NULL,
CONSTRAINT "estu_recep_temp_copy_pkey" PRIMARY KEY ("id")
)
WITHOUT OIDS 
;

ALTER TABLE "public"."estu_asig_temp" OWNER TO "postgres";;


-- ----------------------------
-- Table structure for "estu_recep_temp"
-- ----------------------------
DROP TABLE "estu_recep_temp";
CREATE TABLE "public"."estu_recep_temp" (
"id" int4 DEFAULT nextval('estu_recep_temp_id_seq'::regclass) NOT NULL,
"perdocu" text DEFAULT NULL,
"perabogado" text DEFAULT NULL,
"perapeabog" text DEFAULT NULL,
"laboral" int8 DEFAULT NULL,
"penal" int8 DEFAULT NULL,
"privada" int8 DEFAULT NULL,
"publica" int8 DEFAULT NULL,
"casos" int8 DEFAULT NULL,
"periodo" int8 DEFAULT NULL,
CONSTRAINT "estu_recep_temp_pkey" PRIMARY KEY ("id")
)
WITHOUT OIDS 
;

ALTER TABLE "public"."estu_recep_temp" OWNER TO "postgres";;

-- ----------------------------
-- Records of estu_recep_temp
-- ----------------------------

-- ----------------------------
-- Table structure for "estu_siste_temp"
-- ----------------------------
DROP TABLE "estu_siste_temp";
CREATE TABLE "public"."estu_siste_temp" (
"id" int4 DEFAULT nextval('estu_siste_temp_id_seq'::regclass) NOT NULL,
"perdocuss" text DEFAULT NULL,
"perabogadoss" text DEFAULT NULL,
"perapeabogss" text DEFAULT NULL,
"laboral" int8 DEFAULT NULL,
"penal" int8 DEFAULT NULL,
"privada" int8 DEFAULT NULL,
"publica" int8 DEFAULT NULL,
"casos" int8 DEFAULT NULL,
"periodo" int8 DEFAULT NULL,
CONSTRAINT "estu_siste_temp_pkey" PRIMARY KEY ("id")
)
WITHOUT OIDS 
;

ALTER TABLE "public"."estu_siste_temp" OWNER TO "postgres";;

-- ----------------------------
-- Table structure for "estudianteperiodo"
-- ----------------------------
DROP TABLE "estudianteperiodo";
CREATE TABLE "public"."estudianteperiodo" (
"codigo" int8 DEFAULT NULL NOT NULL,
"estudiante" int8 DEFAULT NULL NOT NULL,
"periodo" text DEFAULT NULL NOT NULL,
CONSTRAINT "codigo" PRIMARY KEY ("codigo"),
CONSTRAINT "estuid" FOREIGN KEY ("estudiante") REFERENCES "public"."estudiantes" ("estuid") ON DELETE CASCADE ON UPDATE CASCADE,
CONSTRAINT "periid" FOREIGN KEY ("periodo") REFERENCES "public"."periodo" ("perid") ON DELETE CASCADE ON UPDATE CASCADE
)
WITHOUT OIDS 
;

ALTER TABLE "public"."estudianteperiodo" OWNER TO "postgres";;

-- ----------------------------
-- Table structure for "estudiantes"
-- ----------------------------
DROP TABLE "estudiantes";
CREATE TABLE "public"."estudiantes" (
"estuid" int8 DEFAULT NULL NOT NULL,
"identificacion" text DEFAULT NULL,
"nombre" text DEFAULT NULL,
"apellido" text DEFAULT NULL,
"activo" text DEFAULT NULL,
"observacion" text DEFAULT NULL,
"reparto" text DEFAULT NULL,
"perid" text DEFAULT NULL,
CONSTRAINT "estudiantes_pkey" PRIMARY KEY ("estuid"),
CONSTRAINT "perid" FOREIGN KEY ("perid") REFERENCES "public"."periodo" ("perid") ON DELETE NO ACTION ON UPDATE NO ACTION
)
WITHOUT OIDS 
;

ALTER TABLE "public"."estudiantes" OWNER TO "postgres";



CREATE INDEX "fki_perid" ON "public"."estudiantes" USING btree ("perid");;

-- ----------------------------
-- Table structure for "periodo"
-- ----------------------------
DROP TABLE "periodo";
CREATE TABLE "public"."periodo" (
"perid" text DEFAULT NULL NOT NULL,
"persemestre" int8 DEFAULT NULL NOT NULL,
"perano" int8 DEFAULT NULL NOT NULL,
"perfecha" text DEFAULT NULL,
"perfechafinal" text DEFAULT NULL,
"activo" int8 DEFAULT 0,
CONSTRAINT "perid" PRIMARY KEY ("perid")
)
WITHOUT OIDS 
;

ALTER TABLE "public"."periodo" OWNER TO "postgres";;

-- ----------------------------
-- Table structure for "persona"
-- ----------------------------
DROP TABLE "persona";
CREATE TABLE "public"."persona" (
"perid" int4 DEFAULT NULL NOT NULL,
"pernombre" varchar(20) DEFAULT NULL,
"perapellido" varchar(20) DEFAULT NULL,
"pertelefono" text DEFAULT NULL,
"perdireccion" varchar(40) DEFAULT NULL,
"percorreo" text DEFAULT NULL,
"persexo" int4 DEFAULT NULL,
"pertiposangre" varchar(3) DEFAULT NULL,
"perfechanacimiento" date DEFAULT NULL,
"perlugarnacimiento" varchar(20) DEFAULT NULL,
"perdocumento" varchar(25) DEFAULT NULL,
"pertipodocumento" int4 DEFAULT NULL,
"perlugarexpedicion" varchar(20) DEFAULT NULL,
"pernacionalidad" varchar(20) DEFAULT NULL,
"perestadocivil" varchar(30) DEFAULT NULL,
CONSTRAINT "persona_pkey" PRIMARY KEY ("perid")
)
WITHOUT OIDS 
;

ALTER TABLE "public"."persona" OWNER TO "postgres";;

-- ----------------------------
-- Records of persona
-- ----------------------------
INSERT INTO "persona" VALUES ('4', 'Monica Lucia', 'Barbanti Castellanos', '3112112723', 'Autopista Internacional ', 'consultoriojuridico@unipamplona.edu.co', '2', 'a', '1987-10-12', 'sdf', '112', '1', 'asd', 'asd', 'gjg');
INSERT INTO "persona" VALUES ('3', 'Abogado en', 'Formacion', '3115127138', 'calle 4 n 5-67', 'afdjfla', '2', 'a+', '1987-10-10', 'cOLOMBIA', '87100862520', '2', 'Pamplona', 'Colombiano', 'Soltero');
INSERT INTO "persona" VALUES ('2', 'Abogado en', 'Formacion', '5685223', 'calle 2N 8-29', 'manucar87@hotmail.com', '1', 'A+', '1987-07-28', 'Venezuela', '1126418238', '3', 'Pamplona', 'Colombiano', 'Soltero');
INSERT INTO "persona" VALUES ('5', 'Abogado en', 'Formacion', '79472934', '.', '.', '2', 'a', '1987-10-12', 'l', null, null, null, null, null);
INSERT INTO "persona" VALUES ('6', 'Abogado en', 'Formacion', null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO "persona" VALUES ('7', 'Abogado en', 'Formacion', null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO "persona" VALUES ('8', 'Abogado en', 'Formacion', null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO "persona" VALUES ('9', 'Abogado en', 'Formacion', null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO "persona" VALUES ('1', 'Jenny Paola', 'Villamizar', '3156649337', 'Calle 11B #861 Urb. Romero', 'luishernando18@hotmail.com', '2', 'O+', '1987-07-28', 'Venezuela', '1126418237', '2', 'Pamplona', 'Colombiano', 'Soltero');

-- ----------------------------
-- Table structure for "personacaso"
-- ----------------------------
DROP TABLE "personacaso";
CREATE TABLE "public"."personacaso" (
"perradicado" int8 DEFAULT NULL NOT NULL,
"perfecha" varchar(20) DEFAULT NULL,
"perhora" varchar(10) DEFAULT to_char(now(), 'HH24:MI:SS'::text),
"pernombre" varchar(100) DEFAULT NULL,
"perapellido" varchar(100) DEFAULT NULL,
"persexo" varchar(10) DEFAULT NULL,
"peredad" text DEFAULT NULL,
"pernacionalidad" varchar(100) DEFAULT NULL,
"perdocumento" text DEFAULT NULL,
"pertipodocumento" varchar(30) DEFAULT NULL,
"perlugarexpedicion" varchar(100) DEFAULT NULL,
"perlibretamilitar" varchar(20) DEFAULT NULL,
"pernumerolibreta" text DEFAULT NULL,
"perdistritomilitar" varchar(100) DEFAULT NULL,
"perdireccion" text DEFAULT NULL,
"pertelefono" text DEFAULT NULL,
"peremail" varchar(100) DEFAULT NULL,
"persisben" varchar(10) DEFAULT NULL,
"pernumero" varchar(10) DEFAULT NULL,
"perdiscapacidad" varchar(40) DEFAULT NULL,
"pertipodisca" text DEFAULT NULL,
"pergrupoetnico" varchar(40) DEFAULT NULL,
"percualetnico" text DEFAULT NULL,
"pernivelescola" varchar(40) DEFAULT NULL,
"percualnivel" text DEFAULT NULL,
"pertipofamilia" varchar(20) DEFAULT NULL,
"permodofamil" text DEFAULT NULL,
"pernumfamilia" text DEFAULT NULL,
"perestadocivil" varchar(30) DEFAULT NULL,
"perconyuge" text DEFAULT NULL,
"perallegado" text DEFAULT NULL,
"perfijo" text DEFAULT NULL,
"perdireccionalle" text DEFAULT NULL,
"percelular" text DEFAULT NULL,
"perautoridad" varchar(30) DEFAULT NULL,
"persanciona" varchar(30) DEFAULT NULL,
"peraporte" varchar(30) DEFAULT NULL,
"perconflictos" varchar(30) DEFAULT NULL,
"perfactor" varchar(30) DEFAULT NULL,
"parautor" varchar(30) DEFAULT NULL,
"pervivienda" varchar(30) DEFAULT NULL,
"pertenencia" varchar(30) DEFAULT NULL,
"peragua" varchar(20) DEFAULT NULL,
"perluz" varchar(20) DEFAULT NULL,
"peralcantarillado" varchar(30) DEFAULT NULL,
"paralumbrado" varchar(40) DEFAULT NULL,
"pertelefonos" varchar(30) DEFAULT NULL,
"peraseo" varchar(40) DEFAULT NULL,
"perocupacion" text DEFAULT NULL,
"perlabora" varchar(40) DEFAULT NULL,
"persalario" text DEFAULT NULL,
"pertipotra" varchar(50) DEFAULT NULL,
"perempresa" text DEFAULT NULL,
"perclase" varchar(40) DEFAULT NULL,
"persalud" varchar(20) DEFAULT NULL,
"perpension" varchar(20) DEFAULT NULL,
"perarp" varchar(10) DEFAULT NULL,
"perotro" varchar(10) DEFAULT NULL,
"perocupaconyu" text DEFAULT NULL,
"perdesplazado" varchar(20) DEFAULT NULL,
"perlugardes" text DEFAULT NULL,
"perfechades" varchar(20) DEFAULT NULL,
"permotivo" text DEFAULT NULL,
"perarmado" text DEFAULT NULL,
"pergrupo" text DEFAULT NULL,
"perrupd" text DEFAULT NULL,
"perrelacion" text DEFAULT NULL,
"perjuridica" varchar(10) DEFAULT NULL,
"percuales" text DEFAULT NULL,
"permodalidad" text DEFAULT NULL,
"percaso" text DEFAULT NULL,
"perasesoria" text DEFAULT NULL,
"perexposicion" text DEFAULT NULL,
"perarea" varchar(40) DEFAULT NULL,
"perobservaciones" text DEFAULT NULL,
"perdocumentos" text DEFAULT NULL,
"perabogado" varchar(100) DEFAULT NULL,
"perapeabog" varchar(100) DEFAULT NULL,
"perdocu" text DEFAULT NULL,
"perabogados" varchar(100) DEFAULT NULL,
"perapeabogs" varchar(100) DEFAULT NULL,
"perdocus" text DEFAULT NULL,
"perabogadoss" varchar(100) DEFAULT NULL,
"perapeabogss" varchar(100) DEFAULT NULL,
"perdocuss" text DEFAULT NULL,
"perrecibido" text DEFAULT NULL,
"perid" int8 DEFAULT NULL,
"estuid" int8 DEFAULT NULL,
"municipio" text DEFAULT NULL,
"embarazada" text DEFAULT NULL,
"perrango" text DEFAULT NULL,
"created" date DEFAULT NULL,
"created_hora" time(6) DEFAULT NULL,
"modified" date DEFAULT NULL,
"modified_hora" time(6) DEFAULT NULL,
CONSTRAINT "personacaso_pkey" PRIMARY KEY ("perradicado"),
CONSTRAINT "estuid" FOREIGN KEY ("estuid") REFERENCES "public"."estudiantes" ("estuid") ON DELETE NO ACTION ON UPDATE NO ACTION,
CONSTRAINT "area" FOREIGN KEY ("perarea") REFERENCES "public"."area" ("nombrearea") ON DELETE NO ACTION ON UPDATE NO ACTION,
CONSTRAINT "personacaso_perid_fkey" FOREIGN KEY ("perid") REFERENCES "public"."periodo" ("perid") ON DELETE NO ACTION ON UPDATE NO ACTION
)
WITHOUT OIDS 
;

ALTER TABLE "public"."personacaso" OWNER TO "postgres";



CREATE INDEX "fki_" ON "public"."personacaso" USING btree ("perid");

CREATE INDEX "fki_area" ON "public"."personacaso" USING btree ("perarea");

CREATE INDEX "fki_estuid" ON "public"."personacaso" USING btree ("estuid");;



-- ----------------------------
-- Table structure for "rol"
-- ----------------------------
DROP TABLE "rol";
CREATE TABLE "public"."rol" (
"rolid" int4 DEFAULT NULL NOT NULL,
"rolnombre" varchar(20) DEFAULT NULL,
"roldescripcion" varchar(50) DEFAULT NULL,
CONSTRAINT "rol_pkey" PRIMARY KEY ("rolid")
)
WITHOUT OIDS 
;

ALTER TABLE "public"."rol" OWNER TO "postgres";;

-- ----------------------------
-- Records of rol
-- ----------------------------
INSERT INTO "rol" VALUES ('1', 'Admin', 'Admin');
INSERT INTO "rol" VALUES ('2', 'Estudiante', 'Estudiante');

-- ----------------------------
-- Table structure for "rolxusuario"
-- ----------------------------
DROP TABLE "rolxusuario";
CREATE TABLE "public"."rolxusuario" (
"rolid" int4 DEFAULT NULL NOT NULL,
"perid" int4 DEFAULT NULL NOT NULL,
CONSTRAINT "rolxusuario_pkey" PRIMARY KEY ("rolid", "perid"),
CONSTRAINT "rolxusuario_perid_fkey" FOREIGN KEY ("perid") REFERENCES "public"."usuario" ("perid") ON DELETE CASCADE ON UPDATE CASCADE,
CONSTRAINT "rolxusuario_rolid_fkey" FOREIGN KEY ("rolid") REFERENCES "public"."rol" ("rolid") ON DELETE CASCADE ON UPDATE CASCADE
)
WITHOUT OIDS 
;

ALTER TABLE "public"."rolxusuario" OWNER TO "postgres";;

-- ----------------------------
-- Records of rolxusuario
-- ----------------------------
INSERT INTO "rolxusuario" VALUES ('1', '4');
INSERT INTO "rolxusuario" VALUES ('2', '1');
INSERT INTO "rolxusuario" VALUES ('2', '2');
INSERT INTO "rolxusuario" VALUES ('2', '3');
INSERT INTO "rolxusuario" VALUES ('2', '5');
INSERT INTO "rolxusuario" VALUES ('2', '6');
INSERT INTO "rolxusuario" VALUES ('2', '7');
INSERT INTO "rolxusuario" VALUES ('2', '8');
INSERT INTO "rolxusuario" VALUES ('2', '9');

-- ----------------------------
-- Table structure for "usuario"
-- ----------------------------
DROP TABLE "usuario";
CREATE TABLE "public"."usuario" (
"perid" int4 DEFAULT NULL NOT NULL,
"usuestado" int4 DEFAULT NULL,
"usulogin" varchar(20) DEFAULT NULL NOT NULL,
"usupassword" varchar(20) DEFAULT NULL NOT NULL,
CONSTRAINT "usuario_pkey" PRIMARY KEY ("perid"),
CONSTRAINT "usuario_fk" FOREIGN KEY ("perid") REFERENCES "public"."persona" ("perid") ON DELETE NO ACTION ON UPDATE NO ACTION
)
WITHOUT OIDS 
;

ALTER TABLE "public"."usuario" OWNER TO "postgres";;

-- ----------------------------
-- Records of usuario
-- ----------------------------
INSERT INTO "usuario" VALUES ('4', '1', 'admin', 'molubaca');
INSERT INTO "usuario" VALUES ('1', '1', 'asistente', '123456');
INSERT INTO "usuario" VALUES ('2', '1', 'consultorio1', 'consultorio');
INSERT INTO "usuario" VALUES ('9', '1', 'consultorio7', 'consultorio');
INSERT INTO "usuario" VALUES ('8', '1', 'consultorio6', 'consultorio');
INSERT INTO "usuario" VALUES ('7', '1', 'consultorio5', 'consultorio');
INSERT INTO "usuario" VALUES ('6', '1', 'consultorio4', 'consultorio');
INSERT INTO "usuario" VALUES ('5', '1', 'consultorio3', 'consultorio');
INSERT INTO "usuario" VALUES ('3', '1', 'consultorio2', 'consultorio');
