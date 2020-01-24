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

--Cargar datos
data = LOAD 'data.tsv' AS (upper_case:CHARARRAY, lower_case:BAG{tup:TUPLE(letter:CHARARRAY)},obs:MAP[]);

-- Extraer las claves
letras = FOREACH data GENERATE FLATTEN(KEYSET(obs));

-- Agrupar letras 
grupo_letras = GROUP letras BY $0;

-- Contar claves
conteo_claves = FOREACH grupo_letras GENERATE group, COUNT($1);

STORE conteo_claves INTO 'output' USING PigStorage(',');