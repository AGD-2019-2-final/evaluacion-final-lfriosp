-- Pregunta
-- ===========================================================================
--
-- Obtenga los cinco (5) valores más pequeños de la 3ra columna.
-- Escriba el resultado a la carpeta `output` del directorio actual.
--
fs -rm -f -r output;
--
-- >>> Escriba su respuesta a partir de este punto <<<
--
data = LOAD 'data.tsv' AS (letter:CHARARRAY,date:CHARARRAY,number:INT);

numeros = FOREACH data GENERATE number;

numeros_ordenados = ORDER numeros BY number;

primeros5 = LIMIT numeros_ordenados 5;

STORE primeros5 INTO 'output';
