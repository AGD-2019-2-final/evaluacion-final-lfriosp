--
-- Pregunta
-- ===========================================================================
--
-- Para el archivo `data.tsv` Calcule la cantidad de registros por clave de la
-- columna 3. En otras palabras, cuántos registros hay que tengan la clave
-- `aaa`?
--
-- Escriba el resultado a la carpeta `output` del directorio actual.
--
fs -rm -f -r output;
--
-- >>> Escriba su respuesta a partir de este punto <<<
--

data = LOAD 'data.tsv' AS (var1:CHARARRAY, var2:BAG{tup:TUPLE(letter:CHARARRAY)},var3:MAP[]);

data = FOREACH data GENERATE FLATTEN(var3) AS var3;

data_agrupada = GROUP data BY var3;

conteo_letra = FOREACH data_agrupada GENERATE group, COUNT($1);

STORE conteo_letra INTO 'output' USING PigStorage(',');
