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
data = LOAD 'data.tsv' USING PigStorage('\t')
        AS(letra : CHARARRAY,
           fecha : CHARARRAY,
           cantidad : INT);

variable = FOREACH data GENERATE cantidad;

orden = ORDER variable BY cantidad ASC;

orden5 = LIMIT orden 5;

STORE orden5 INTO 'output' USING PigStorage('\t');
