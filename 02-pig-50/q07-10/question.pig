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
data = LOAD 'data.tsv' AS (var1:CHARARRAY, var2:BAG{tup:TUPLE(letter:CHARARRAY)},var3:MAP[]);

data = FOREACH data GENERATE var1, COUNT($1), SIZE($2);

data_ordenada = ORDER data BY var1, $1, $2;

STORE data_ordenada INTO 'output' USING PigStorage(',');
