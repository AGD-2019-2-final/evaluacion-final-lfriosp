--
-- Pregunta
-- ===========================================================================
--
-- Para el archivo `data.tsv` compute Calcule la cantidad de registros en que
-- aparece cada letra minúscula en la columna 2.
--
-- Escriba el resultado a la carpeta `output` del directorio actual.
--
fs -rm -f -r output;
--
-- >>> Escriba su respuesta a partir de este punto <<<
--

data = LOAD 'data.tsv' AS (var1:CHARARRAY, var2:BAG{tup:TUPLE(letra:CHARARRAY)}, var3:CHARARRAY);

data2 = FOREACH data GENERATE FLATTEN(var2) AS letra;

data_agrupada = GROUP data2 BY letra;

conteo_letra = FOREACH data_agrupada GENERATE group, COUNT($1);

STORE conteo_letra INTO 'output';
