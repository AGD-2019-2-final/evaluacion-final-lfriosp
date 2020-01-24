-- Pregunta
-- ===========================================================================
-- 
-- Para el archivo `data.tsv` genere una tabla que contenga la primera columna,
-- la cantidad de elementos en la columna 2 y la cantidad de elementos en la 
-- columna 3 separados por coma. La tabla debe estar ordenada por las 
-- columnas 1, 2 y 3.
-- 
-- Escriba el resultado a la carpeta `output` del directorio actual.
-- 
fs -rm -f -r output;
--
-- >>> Escriba su respuesta a partir de este punto <<<
--
--Cargar datos
data = LOAD 'data.tsv' AS (upper_case:CHARARRAY, lower_case:BAG{tup:TUPLE(letter:CHARARRAY)},obs:MAP[]);

data2 = FOREACH data GENERATE $0, COUNT($1), SIZE($2);

--data3 = ORDER data2 BY $0, $1, $2;
data3 = ORDER data2 BY $0..$2;

STORE data3 INTO 'output' USING PigStorage(',');