--
-- Pregunta
-- ===========================================================================
--
-- Para el archivo `data.tsv` compute la cantidad de registros por letra.
-- Escriba el resultado a la carpeta `output` del directorio actual.
--
fs -rm -f -r output;
--
-- >>> Escriba su respuesta a partir de este punto <<<
--
data = LOAD 'data.tsv' AS (letra:CHARARRAY, fecha:CHARARRAY, cantidad:INT);

letras = FOREACH data GENERATE letra;
grupo = GROUP letras BY letra;
conteo = FOREACH grupo GENERATE group, COUNT(letras);

STORE conteo INTO 'output';
