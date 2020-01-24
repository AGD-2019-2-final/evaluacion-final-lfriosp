--
-- Pregunta
-- ===========================================================================
--
-- Para resolver esta pregunta use el archivo `data.tsv`.
--
-- Compute la cantidad de registros por cada letra de la columna 1.
-- Escriba el resultado ordenado por letra.
--
-- Escriba el resultado a la carpeta `output` de directorio de trabajo.
--
-- >>> Escriba su respuesta a partir de este punto <<<
--
DROP TABLE IF EXISTS ejercicio1;
CREATE TABLE ejercicio1 (letra STRING, fecha STRING, numero INT)

ROW FORMAT DELIMITED
FIELDS TERMINATED BY '\t'
TBLPROPERTIES ("skip.header.line.count"="-1");

LOAD DATA LOCAL INPATH 'data.tsv' OVERWRITE INTO TABLE ejercicio1;

DROP TABLE IF EXISTS conteo_letra;
CREATE TABLE conteo_letra AS SELECT letra, COUNT(*) FROM ejercicio1 GROUP BY letra SORT BY letra;


INSERT OVERWRITE DIRECTORY 'output'
ROW FORMAT DELIMITED
FIELDS TERMINATED BY ','
SELECT * FROM conteo_letra;
