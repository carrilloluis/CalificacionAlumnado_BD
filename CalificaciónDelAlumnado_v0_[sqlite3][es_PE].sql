/*
@description Gesti�n del puntaje acad�mico de los estudiantes
@author Luis Carrillo Guti�rrez
@date Setiembre, 2017
@version 0.0.1
*/

DROP TABLE IF EXISTS [Alumno];
CREATE TABLE IF NOT EXISTS [Alumno]
(
	[id] CHAR(36) NOT NULL, -- nif
	[nombres] VARCHAR(64) NOT NULL,
	[apellidos] VARCHAR(64) NOT NULL, 
	[direcci�n] VARCHAR(128) NOT NULL, 
	[tel�fono] VARCHAR(16) NOT NULL,
	PRIMARY KEY (id)
) WITHOUT RowId;


DROP TABLE IF EXISTS [Docente];
CREATE TABLE IF NOT EXISTS [Docente] 
(
	[id] CHAR(36) NOT NULL, 
	[nombres] VARCHAR(64) NOT NULL,
	[apellidos] VARCHAR(64) NOT NULL,
	PRIMARY KEY (id)
) WITHOUT RowId;


DROP TABLE IF EXISTS [Asignatura];
CREATE TABLE IF NOT EXISTS [Asignatura]
(
	[id] CHAR(36) NOT NULL,
	[denominaci�n] VARCHAR(64) NOT NULL,
	PRIMARY KEY (id)
) WITHOUT RowId;


DROP TABLE IF EXISTS [Puntaje Acad�mico];
CREATE TABLE IF NOT EXISTS [Puntaje Acad�mico]
(
	[id] INTEGER UNSIGNED NOT NULL, 
	[id_asignatura] CHAR(36) NOT NULL REFERENCES [Asignatura](id),
	[id_alumno] CHAR(36) NOT NULL REFERENCES [Alumno](id),
	[id_docente] CHAR(36) NOT NULL REFERENCES [Docente](id),
	[fecha_asignaci�n] DATETIME NOT NULL,
	-- CHECK 'O con regla de validaci�n: >=0 Y <=10'
	[puntaje] CHAR(2) NOT NULL, -- nota /12/, /A+/ 
	PRIMARY KEY (id) 
) WITHOUT RowId;

-- [Alumno(nif)] -> [Nota(nif)]
-- [Asignatura(cod)] -> [Nota(cod)]
-- [Docente(id)] -> [Nota(id)]