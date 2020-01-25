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
datos = LOAD 'data.tsv' AS (letter:CHARARRAY, date:CHARARRAY, number:INT);

letras = FOREACH datos GENERATE letter;

grupo = GROUP letras BY letter;

cuentaletras = FOREACH grupo GENERATE group, COUNT(letras);

STORE cuentaletras INTO 'output';
