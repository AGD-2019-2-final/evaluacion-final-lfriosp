--
-- Pregunta
-- ===========================================================================
--
-- Para responder la pregunta use el archivo `data.csv`.
--
-- Cuente la cantidad de personas nacidas por año.
--
-- Escriba el resultado a la carpeta `output` del directorio actual.
--
fs -rm -f -r output;
--
u = LOAD 'data.csv' USING PigStorage(',')
    AS (id:int,
        firstname:CHARARRAY,
        surname:CHARARRAY,
        birthday:CHARARRAY,
        color:CHARARRAY,
        quantity:INT);
--
-- >>> Escriba su respuesta a partir de este punto <<<
--
annos = FOREACH u GENERATE SUBSTRING(birthday,0,4) AS anno;

agrupar_anno = GROUP annos BY anno;

conteo_anno = FOREACH agrupar_anno GENERATE group, COUNT(annos);

STORE conteo_anno INTO 'output' USING PigStorage(',');
