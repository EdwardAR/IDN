
--====================CARGAS(para 3 TABLAS)====================

SELECT COUNT(*)AS 'Cantidad de datos de [BD_CLIENTE]' FROM [BD_SEGUROS].[dbo].[BD_CLIENTE]
--902284
--AHORA CON LA PRIMERA CARGA
--1198856
--AHORA CON LA SEGUNDA CARGA
--1495428


SELECT COUNT(*)AS 'Cantidad de datos de [BD_TB_SEGURO]' FROM [BD_SEGUROS].[dbo].[BD_TB_SEGURO]
--1129733
--AHORA CON LA PRIMERA CARGA
--1423305
--AHORA CON LA SEGUNDA CARGA
--1719877


SELECT COUNT(*)AS 'Cantidad de datos de [TB_PRODUCTOS_FINANCIEROS]' FROM [BD_SEGUROS].[dbo].[TB_PRODUCTOS_FINANCIEROS]
--902284
--AHORA CON LA PRIMERA CARGA
--1198856
--AHORA CON LA SEGUNDA CARGA
--1495428

-- ==================== [dbo].[BD_AGENCIAS] ====================
SELECT  * FROM [dbo].[BD_AGENCIAS]

SELECT DISTINCT COD_AGENCIA FROM [dbo].[BD_AGENCIAS]
SELECT COD_AGENCIA,COUNT(COD_AGENCIA) AS 'CNT_COD_AGENCIA' FROM [dbo].[BD_AGENCIAS] GROUP BY COD_AGENCIA

SELECT DISTINCT BANCA FROM [dbo].[BD_AGENCIAS]
SELECT BANCA,COUNT(BANCA) AS 'CNT_BANCA' FROM [dbo].[BD_AGENCIAS] GROUP BY BANCA
--==========================
--SIN ESPECIFICAR		29 |
--==========================
--NEGOCIOS				4
--EMPRESA				35
--MERCADOS				30
--INVERSIONES			16
--ADMINISTRATIVA		765
--RED AGENCIAS			418

--CAMBIO DE DATOS SIN ESPECIFICAR A DESCONOCIDO EN LA COLUMMNA "BANCA"
UPDATE [dbo].[BD_AGENCIAS] SET BANCA = 'DESCONOCIDO' WHERE BANCA = 'SIN ESPECIFICAR';
-- SELECT BANCA,COUNT(BANCA) AS 'CNT_BANCA' FROM [dbo].[BD_AGENCIAS] WHERE BANCA = 'DESCONOCIDO' GROUP BY BANCA 



SELECT DISTINCT ZONA FROM [dbo].[BD_AGENCIAS]
SELECT ZONA,COUNT(ZONA) AS 'CNT_ZONA' FROM [dbo].[BD_AGENCIAS] GROUP BY ZONA
--==============================
--SIN ESPECIFICAR			29 |
--==============================
--PROVINCIA SUR				40
--NEGOCIOS					4 → NO ES ZONA
--LIMA NORTE				33
--LIMA CENTRO				71
--EMPRESA					35 → NO ES ZONA
--MERCADOS					30 → NO ES ZONA
--LIMA SUR					26
--INVERSIONES				16 → NO ES ZONA
--ADMINISTRATIVA			765 → NO ES ZONA
--PROVINCIA CENTRO ORIENTE	32
--LIMA OESTE				34
--LIMA ESTE					32
--LIMA MODERNA				91
--PROVINCIA NORTE			43
--CENTRO NEGOCIOS			16 → NO ES ZONA

--CAMBIO DE DATOS SIN ESPECIFICAR A DESCONOCIDO EN LA COLUMMNA "ZONA"
UPDATE [dbo].[BD_AGENCIAS] SET ZONA = 'DESCONOCIDO' WHERE ZONA = 'SIN ESPECIFICAR';
--CAMBIO DE DATOS SIN ESPECIFICAR A DESCONOCIDO EN LA COLUMMNA "ZONA"
UPDATE [dbo].[BD_AGENCIAS] SET ZONA = 'DESCONOCIDO' WHERE ZONA IN ('NEGOCIOS', 'EMPRESA', 'MERCADOS', 'INVERSIONES', 'ADMINISTRATIVA', 'CENTRO NEGOCIOS');
-- SELECT * FROM [dbo].[BD_AGENCIAS]
--SELECT ZONA,COUNT(ZONA) AS 'CNT_ZONA' FROM [dbo].[BD_AGENCIAS] WHERE ZONA = 'DESCONOCIDO' GROUP BY ZONA 

SELECT DISTINCT AGENCIA FROM [dbo].[BD_AGENCIAS]
SELECT AGENCIA,COUNT(AGENCIA) AS 'CNT_BANCA' FROM [dbo].[BD_AGENCIAS] GROUP BY AGENCIA ORDER BY 'CNT_BANCA' DESC

--ADMINISTRATIVA		858 → NO ES AGENCIA
--EMPRESA				35  → NO ES AGENCIA
--MERCADOS				30  → NO ES AGENCIA
--SIN ESPECIFICAR		29  → NO ES AGENCIA
--INVERSIONES			16  → NO ES AGENCIA
--SAN ISIDRO          	11
--NEGOCIOS				4   → NO ES AGENCIA
--ENAPU               	2
--ESPEC. CLUB VILLA   	1
--ESPECIAL GAMARRA    	1
--.
--.
--.

--CAMBIO DE DATOS ('ADMINISTRATIVA', 'EMPRESA', 'SIN ESPECIFICAR', 'MERCADOS', 'INVERSIONES', 'NEGOCIOS') A DESCONOCIDO EN LA COLUMMNA "ZONA" DE LOS CAMPOS 
UPDATE [dbo].[BD_AGENCIAS] SET AGENCIA = 'DESCONOCIDO' WHERE AGENCIA IN ('ADMINISTRATIVA', 'EMPRESA', 'SIN ESPECIFICAR', 'MERCADOS', 'INVERSIONES', 'NEGOCIOS');
--SELECT * FROM [BD_SEGUROS].[dbo].[BD_AGENCIAS] ORDER BY COD_AGENCIA ASC

--ELIMINAR TODOS LOS CAMPOS DESCONOCIDOS DE LAS COLUMNA BANCA, ZONA, AGENCIA
--DELETE FROM [dbo].[BD_AGENCIAS] WHERE BANCA = 'DESCONOCIDO';
--DELETE FROM [dbo].[BD_AGENCIAS] WHERE ZONA = 'DESCONOCIDO';
--DELETE FROM [dbo].[BD_AGENCIAS] WHERE AGENCIA = 'DESCONOCIDO';

-- ==================== [dbo].[BD_CLIENTE] ====================

SELECT COUNT(*) AS 'CNT_[dbo].[BD_CLIENTE]' FROM [dbo].[BD_CLIENTE]
SELECT * FROM [dbo].[BD_CLIENTE] ORDER BY MES_CORTE ASC

SELECT DISTINCT MES_CORTE FROM [dbo].[BD_CLIENTE] ORDER BY MES_CORTE ASC

-- Elimina registros de la tabla BD_CLIENTE donde el campo CODIGO está vacío o solo contiene espacios
DELETE FROM [dbo].[BD_CLIENTE] WHERE LTRIM(RTRIM(CODIGO)) = '';

SELECT COUNT(*) AS RegistrosAEliminar FROM [dbo].[BD_CLIENTE] WHERE SEXO IN ('P', 'U');
-- Elimina registros de la tabla BD_CLIENTE donde el campo SEXO tenga valores no válidos ('P' o 'U')
DELETE FROM [dbo].[BD_CLIENTE] WHERE SEXO IN ('P', 'U');
-- select from [dbo].[BD_CLIENTE]


SELECT CODIGO, COUNT(CODIGO) AS 'CNT_CODIGO' FROM [dbo].[BD_CLIENTE] GROUP BY CODIGO ORDER BY 'CNT_CODIGO' DESC

SELECT COUNT(*) AS RegistrosAEliminar FROM [dbo].[BD_CLIENTE] WHERE SEXO IN ('P', 'U');
SELECT COUNT(*) FROM [dbo].[BD_CLIENTE] WHERE SEXO IN ('P', 'U');
SELECT COUNT(*) FROM [dbo].[BD_CLIENTE] WHERE EDAD IS NULL

-- ==================== ==================== ==================== ==================== ====================


SELECT SITUACION, COUNT(*) AS Total FROM [dbo].[BD_CLIENTE] WHERE SITUACION IN ('A', 'P', 'C') GROUP BY SITUACION;

--cuenta los datos de cada sexo ,m, f, x(DESCONOCIDO
SELECT SEXO, COUNT(*) AS Total
FROM [dbo].[BD_CLIENTE]
WHERE SEXO IN ('M', 'F', 'X')
GROUP BY SEXO;
---- CREA LA VISTA DE DIMENSION SEXO 
--CREATE VIEW DIM_SEXO AS SELECT DISTINCT SEXO AS COD_SEXO,
--  CASE 
--    WHEN SEXO = 'M' THEN 'MASCULINO'
--    WHEN SEXO = 'F' THEN 'FEMENINO'
--    WHEN SEXO = 'X' THEN 'DESCONOCIDO'
--    ELSE 'NO ESPECIFICADO'
--  END AS DESC_SEXO
--FROM [dbo].[BD_CLIENTE]
--WHERE SEXO IS NOT NULL;

SELECT * FROM DIM_SEXO;

--ACTUALIZAR UBIGEO NULO O VACIO A 999999999
UPDATE [BD_CLIENTE] SET UBIGEO = '9999999' WHERE UBIGEO IS NULL OR LTRIM(RTRIM(UBIGEO)) = '';

SELECT SEXO, COUNT(*) AS Total
FROM [dbo].[BD_CLIENTE]
WHERE SEXO IN ('M', 'F', 'X')
GROUP BY SEXO;

-- Busca registros donde la edad es -1 (posibles errores en datos)
SELECT * FROM [dbo].[BD_CLIENTE] WHERE edad = -1;

-- Corrige valores de edad inválidos, estableciendo '999' en registros con '-1', NULL o vacíos
UPDATE dbo.BD_CLIENTE 
SET EDAD = '999' 
WHERE EDAD = '-1' OR EDAD IS NULL OR LTRIM(RTRIM(EDAD)) = '';

-- CREA LA VISTA DE DIMENSION SEXO 
CREATE VIEW DIM_SEXO AS
SELECT DISTINCT
  SEXO AS COD_SEXO,
  CASE 
    WHEN SEXO = 'M' THEN 'MASCULINO'
    WHEN SEXO = 'F' THEN 'FEMENINO'
    WHEN SEXO = 'X' THEN 'DESCONOCIDO'
    ELSE 'NO ESPECIFICADO'
  END AS DESC_SEXO
FROM [dbo].[BD_CLIENTE]
WHERE SEXO IS NOT NULL;

SELECT * FROM DIM_SEXO;

-- Creación de vista para clasificar edades en rangos
CREATE OR ALTER VIEW DIM_RANGO_EDAD AS
SELECT DISTINCT
  CAST(EDAD AS INT) AS EDAD,
  
  -- Asignación de código de rango de edad
  CASE 
    WHEN TRY_CAST(EDAD AS INT) BETWEEN 0 AND 17 THEN '1'
    WHEN TRY_CAST(EDAD AS INT) BETWEEN 18 AND 29 THEN '2'
    WHEN TRY_CAST(EDAD AS INT) BETWEEN 30 AND 59 THEN '3'
    WHEN TRY_CAST(EDAD AS INT) BETWEEN 60 AND 74 THEN '4'
    WHEN TRY_CAST(EDAD AS INT) BETWEEN 75 AND 998 THEN '5'  -- Excluye 999
    ELSE '6'  -- Incluye 999 y otros valores fuera de rango
  END AS COD_RANGO_EDAD,

  -- Descripción del rango de edad
  CASE 
    WHEN TRY_CAST(EDAD AS INT) BETWEEN 0 AND 17 THEN 'Niño / Adolescente'
    WHEN TRY_CAST(EDAD AS INT) BETWEEN 18 AND 29 THEN 'Joven Adulto'
    WHEN TRY_CAST(EDAD AS INT) BETWEEN 30 AND 59 THEN 'Adulto'
    WHEN TRY_CAST(EDAD AS INT) BETWEEN 60 AND 74 THEN 'Adulto Mayor'
    WHEN TRY_CAST(EDAD AS INT) BETWEEN 75 AND 998 THEN 'Longevo'
    ELSE 'Desconocido'  -- Incluye 999 y valores inesperados
  END AS RANGO_EDAD

FROM [dbo].[BD_CLIENTE]
WHERE ISNUMERIC(EDAD) = 1 AND EDAD IS NOT NULL;

-- Consulta la vista creada
SELECT * FROM DIM_RANGO_EDAD ORDER BY EDAD ASC;


/*
   Esta consulta analiza la calidad de los datos en la tabla 'BD_TB_SEGURO',
   verificando la integridad de las fechas registradas.

   - 'fh_apertura': Cuenta valores nulos y válidos en la fecha de apertura.
   - 'fh_vencimiento': Cuenta valores nulos y válidos en la fecha de vencimiento.
   - 'fechas_invertidas': Identifica registros donde la fecha de apertura es posterior a la fecha de vencimiento,
     lo cual representa un posible error lógico en los datos.

   Útil para validaciones de calidad de datos y asegurarse de la coherencia temporal en los registros.
*/
SELECT 
    -- Análisis de 'fh_apertura'
    SUM(CASE WHEN fh_apertura IS NULL THEN 1 ELSE 0 END) AS apertura_nulos,
    SUM(CASE WHEN fh_apertura IS NOT NULL THEN 1 ELSE 0 END) AS apertura_validos,

    -- Análisis de 'fh_vencimiento'
    SUM(CASE WHEN fh_vencimiento IS NULL THEN 1 ELSE 0 END) AS vencimiento_nulos,
    SUM(CASE WHEN fh_vencimiento IS NOT NULL THEN 1 ELSE 0 END) AS vencimiento_validos,

    -- Identificación de errores lógicos en fechas
    SUM(CASE WHEN fh_apertura IS NOT NULL AND fh_vencimiento IS NOT NULL AND fh_apertura > fh_vencimiento THEN 1 ELSE 0 END) AS fechas_invertidas

FROM dbo.BD_TB_SEGURO;

-- ==================== [dbo].[BD_SEGMENTO] ====================

--INSERTAR EL REGISTRO SIN ESPECIFICAR TABLA BD SEGMENTO 
INSERT INTO [dbo].[BD_SEGMENTO] (COD_SEGMENTO, DESC_SEGMENTO, GRUPO)
VALUES ('999999', 'SIN ESPECIFICAR', 'NO DEFINIDO');

SELECT*FROM [dbo].[BD_CLIENTE]


SELECT COLUMN_NAME
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'AGENCIAS';

[dbo].[BD_AGENCIAS][dbo].[BD_CLIENTE][dbo].[BD_SEGMENTO][dbo].[BD_TB_SEGURO][dbo].[BD_UBIGEO][dbo].[TB_PRODUCTOS_FINANCIEROS][dbo].[TB_TIPO_SEGURO]



SELECT 
    TABLE_NAME,
    COLUMN_NAME, 
    DATA_TYPE, 
    CHARACTER_MAXIMUM_LENGTH, 
    IS_NULLABLE
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_SCHEMA = 'dbo' 
  AND TABLE_NAME IN (
      'BD_AGENCIAS',
      'BD_CLIENTE',
      'BD_SEGMENTO',
      'BD_TB_SEGURO',
      'BD_UBIGEO',
      'TB_PRODUCTOS_FINANCIEROS',
      'TB_TIPO_SEGURO'
  )
ORDER BY TABLE_NAME, ORDINAL_POSITION;


-- ==================== [dbo].[BD_TB_SEGURO] ====================
CREATE OR ALTER VIEW FACT_SEGUROS_SIMPLE AS
SELECT 
  cli.CODIGO AS COD_CLIENTE,
  cli.AGENCIA AS COD_AGENCIA,
  cli.SEGMENTO COLLATE Modern_Spanish_CI_AS AS COD_SEGMENTO,
  cli.SEXO AS COD_SEXO,
  rango.COD_RANGO_EDAD,          -- Aquí reemplazamos la edad por el código de rango de edad
  segs.cd_subproducto COLLATE Modern_Spanish_CI_AS AS COD_TIPO_SEGURO,
  segs.cd_canal_venta COLLATE Modern_Spanish_CI_AS AS COD_CANAL,
  CAST(segs.fh_apertura AS DATE) AS FECHA_APERTURA,

  -- MEDIDAS
  COUNT(segs.CODIGO) AS CANTIDAD_SEGUROS,
  SUM(ISNULL(segs.im_prima, 0)) AS PRIMA_TOTAL

FROM BD_CLIENTE cli
INNER JOIN BD_TB_SEGURO segs
  ON cli.CODIGO COLLATE Modern_Spanish_CI_AS = segs.CODIGO COLLATE Modern_Spanish_CI_AS
INNER JOIN DIM_RANGO_EDAD rango
  ON cli.EDAD = rango.EDAD

GROUP BY 
  cli.CODIGO,
  cli.AGENCIA,
  cli.SEGMENTO,
  cli.SEXO,
  rango.COD_RANGO_EDAD,
  segs.cd_subproducto,
  segs.cd_canal_venta,
  CAST(segs.fh_apertura AS DATE);

  select* from FACT_SEGUROS_SIMPLE
	create database BDS_SEGUROS

--
SELECT 
  cli.CODIGO AS COD_CLIENTE,
  cli.AGENCIA AS COD_AGENCIA,
  cli.SEGMENTO COLLATE Modern_Spanish_CI_AS AS COD_SEGMENTO,
  cli.SEXO AS COD_SEXO,
  cli.EDAD,
  segs.cd_subproducto COLLATE Modern_Spanish_CI_AS AS COD_TIPO_SEGURO,
  segs.cd_canal_venta COLLATE Modern_Spanish_CI_AS AS COD_CANAL,
  CAST(segs.fh_apertura AS DATE) AS FECHA_APERTURA,

  -- MEDIDAS
  COUNT(segs.CODIGO) AS CANTIDAD_SEGUROS,
  SUM(ISNULL(segs.im_prima, 0)) AS PRIMA_TOTAL

INTO bds_SEGUROS.dbo.FACT_SEGUROS_SIMPLE
FROM BD_CLIENTE cli
INNER JOIN BD_TB_SEGURO segs
  ON cli.CODIGO COLLATE Modern_Spanish_CI_AS = segs.CODIGO COLLATE Modern_Spanish_CI_AS
GROUP BY 
  cli.CODIGO,
  cli.AGENCIA,
  cli.SEGMENTO,
  cli.SEXO,
  cli.EDAD,
  segs.cd_subproducto,
  segs.cd_canal_venta,
  CAST(segs.fh_apertura AS DATE);


-- ==================== [dbo].[TB_TIPO_SEGURO] ====================
SELECT * FROM [dbo].[BD_CLIENTE]

SELECT * FROM [dbo].[TB_TIPO_SEGURO]
SELECT COUNT(*)AS 'Cantidad de datos de [dbo].[TB_TIPO_SEGURO]' FROM [BD_SEGUROS].[dbo].[TB_TIPO_SEGURO]

SELECT DISTINCT CODIGO FROM [BD_SEGUROS].[dbo].[TB_TIPO_SEGURO]
SELECT DISTINCT GRUPO FROM [BD_SEGUROS].[dbo].[TB_TIPO_SEGURO]
SELECT DISTINCT TIPO FROM [BD_SEGUROS].[dbo].[TB_TIPO_SEGURO]
SELECT DISTINCT SUBTIPO FROM [BD_SEGUROS].[dbo].[TB_TIPO_SEGURO]
SELECT DISTINCT DESCRIPCION FROM [BD_SEGUROS].[dbo].[TB_TIPO_SEGURO]


SELECT 
    COUNT(*) AS total_registros,
    SUM(CASE WHEN CODIGO IS NULL THEN 1 ELSE 0 END) AS cantidad_nulos,
    SUM(CASE WHEN LTRIM(RTRIM(CODIGO)) = '' THEN 1 ELSE 0 END) AS cantidad_vacios,
    SUM(CASE WHEN CODIGO IS NOT NULL AND LTRIM(RTRIM(CODIGO)) <> '' THEN 1 ELSE 0 END) AS cantidad_validos
FROM dbo.BD_TB_SEGURO;

SELECT 
    -- Para cd_subproducto
    SUM(CASE WHEN cd_subproducto IS NULL THEN 1 ELSE 0 END) AS cd_subproducto_nulos,
    SUM(CASE WHEN LTRIM(RTRIM(cd_subproducto)) = '' THEN 1 ELSE 0 END) AS cd_subproducto_vacios,
    SUM(CASE WHEN cd_subproducto IS NOT NULL AND LTRIM(RTRIM(cd_subproducto)) <> '' THEN 1 ELSE 0 END) AS cd_subproducto_validos,

    -- Para cd_canal_venta
    SUM(CASE WHEN cd_canal_venta IS NULL THEN 1 ELSE 0 END) AS cd_canal_venta_nulos,
    SUM(CASE WHEN LTRIM(RTRIM(cd_canal_venta)) = '' THEN 1 ELSE 0 END) AS cd_canal_venta_vacios,
    SUM(CASE WHEN cd_canal_venta IS NOT NULL AND LTRIM(RTRIM(cd_canal_venta)) <> '' THEN 1 ELSE 0 END) AS cd_canal_venta_validos

FROM dbo.BD_TB_SEGURO;

/*
   Esta consulta realiza un análisis sobre la columna 'cd_divisa' en la tabla 'BD_TB_SEGURO'.
   - Cuenta cuántos registros tienen valores NULL en 'cd_divisa' (divisa_nulos).
   - Cuenta cuántos registros tienen valores vacíos ('') en 'cd_divisa' (divisa_vacios).
   - Cuenta cuántos registros tienen el valor 'USD' en 'cd_divisa' (divisa_usd).
   - Cuenta cuántos registros tienen el valor 'PEN' en 'cd_divisa' (divisa_pen).
   Para garantizar precisión, usa funciones de limpieza como LTRIM, RTRIM y UPPER 
   para eliminar espacios y estandarizar mayúsculas.
*/
SELECT 
    SUM(CASE WHEN cd_divisa IS NULL THEN 1 ELSE 0 END) AS divisa_nulos,
    SUM(CASE WHEN LTRIM(RTRIM(cd_divisa)) = '' THEN 1 ELSE 0 END) AS divisa_vacios,
    SUM(CASE WHEN UPPER(LTRIM(RTRIM(cd_divisa))) = 'USD' THEN 1 ELSE 0 END) AS divisa_usd,
    SUM(CASE WHEN UPPER(LTRIM(RTRIM(cd_divisa))) = 'PEN' THEN 1 ELSE 0 END) AS divisa_pen
FROM dbo.BD_TB_SEGURO;

/*
   Esta consulta limpia los valores de las columnas 'fh_apertura' y 'fh_vencimiento' en la tabla 'BD_TB_SEGURO'. 
   - Usa LTRIM y RTRIM para eliminar espacios en blanco al inicio y al final de los valores almacenados.
   - Mejora la calidad de los datos, evitando problemas en futuras comparaciones y cálculos de fechas.
   - Útil para garantizar la consistencia en registros antes de realizar análisis o validaciones.
*/
UPDATE dbo.BD_TB_SEGURO
SET 
    fh_apertura = LTRIM(RTRIM(fh_apertura)),
    fh_vencimiento = LTRIM(RTRIM(fh_vencimiento));


/*
   Esta consulta analiza la calidad de los datos en la tabla 'BD_TB_SEGURO', 
   verificando la integridad y coherencia de las fechas registradas.

   - 'fh_apertura': Cuenta valores nulos y válidos en la fecha de apertura.
   - 'fh_vencimiento': Cuenta valores nulos y válidos en la fecha de vencimiento.
   - 'fechas_invertidas_correctas': Identifica registros donde la fecha de apertura es posterior 
     a la fecha de vencimiento, asegurando que ambas fechas sean válidas con TRY_CAST a tipo DATE.

   TRY_CAST se usa para evitar errores al convertir valores no válidos y garantizar comparaciones seguras.
   Útil para auditorías de calidad de datos y validaciones en procesos administrativos.
*/
SELECT 
    -- Análisis de 'fh_apertura'
    SUM(CASE WHEN fh_apertura IS NULL THEN 1 ELSE 0 END) AS apertura_nulos,
    SUM(CASE WHEN fh_apertura IS NOT NULL THEN 1 ELSE 0 END) AS apertura_validos,

    -- Análisis de 'fh_vencimiento'
    SUM(CASE WHEN fh_vencimiento IS NULL THEN 1 ELSE 0 END) AS vencimiento_nulos,
    SUM(CASE WHEN fh_vencimiento IS NOT NULL THEN 1 ELSE 0 END) AS vencimiento_validos,

    -- Identificación de errores lógicos en fechas
    SUM(CASE 
            WHEN TRY_CAST(fh_apertura AS DATE) IS NOT NULL 
                 AND TRY_CAST(fh_vencimiento AS DATE) IS NOT NULL 
                 AND TRY_CAST(fh_apertura AS DATE) > TRY_CAST(fh_vencimiento AS DATE) 
            THEN 1 ELSE 0 
        END) AS fechas_invertidas_correctas

FROM dbo.BD_TB_SEGURO;

/*
   Esta consulta actualiza la columna 'fh_vencimiento' en la tabla 'BD_TB_SEGURO', 
   estableciendo la fecha '2015/03/19' en registros con valores inválidos.

   - Se reemplazan valores NULL y vacíos ('').
   - Se corrigen registros donde el tamaño del campo no es de 10 caracteres.
   - Se validan los formatos incorrectos con la condición NOT LIKE usando expresiones regulares 
     para asegurar que la fecha siga el formato 'DD/MM/YYYY'.
*/
UPDATE [dbo].[BD_TB_SEGURO]
SET fh_vencimiento = '2015/03/19'
WHERE 
    fh_vencimiento IS NULL
    OR fh_vencimiento = ''
    OR LEN(fh_vencimiento) <> 10
    OR fh_vencimiento NOT LIKE '[0-3][0-9]/[0-1][0-9]/[0-9][0-9][0-9][0-9]';



/*
   Esta consulta corrige registros en la tabla 'BD_TB_SEGURO' donde la fecha de apertura ('fh_apertura') 
   es posterior a la fecha de vencimiento ('fh_vencimiento'), lo cual representa un error lógico.

   - Se usa TRY_CAST para asegurarse de que las fechas sean válidas antes de procesarlas.
   - DATEADD(YEAR, 1, fh_apertura) ajusta la fecha de vencimiento sumando un año a la fecha de apertura.
   - CONVERT(VARCHAR(10), ..., 120) formatea la nueva fecha en formato 'YYYY-MM-DD' para mantener la coherencia.
*/
UPDATE dbo.BD_TB_SEGURO
SET fh_vencimiento = CONVERT(VARCHAR(10), DATEADD(YEAR, 1, TRY_CAST(fh_apertura AS DATE)), 120)
WHERE 
    TRY_CAST(fh_apertura AS DATE) IS NOT NULL 
    AND TRY_CAST(fh_vencimiento AS DATE) IS NOT NULL 
    AND TRY_CAST(fh_apertura AS DATE) > TRY_CAST(fh_vencimiento AS DATE);

SELECT *
FROM dbo.BD_TB_SEGURO
WHERE 
    TRY_CAST(fh_apertura AS DATE) IS NOT NULL AND
    fh_vencimiento = CONVERT(VARCHAR(10), DATEADD(YEAR, 1, TRY_CAST(fh_apertura AS DATE)), 120);

SELECT
    SUM(CASE WHEN im_prima IS NULL THEN 1 ELSE 0 END) AS prima_nulos,
    SUM(CASE WHEN im_prima IS NOT NULL THEN 1 ELSE 0 END) AS prima_validos
FROM dbo.BD_TB_SEGURO;

SELECT
    SUM(CASE WHEN im_prima IS NULL THEN 1 ELSE 0 END) AS prima_nulos,
    SUM(CASE WHEN LTRIM(RTRIM(im_prima)) = '' THEN 1 ELSE 0 END) AS prima_vacios,
    SUM(CASE WHEN im_prima IS NOT NULL AND LTRIM(RTRIM(im_prima)) <> '' THEN 1 ELSE 0 END) AS prima_validos
FROM dbo.BD_TB_SEGURO;

--- nulos tipo numerico
SELECT
    SUM(CASE WHEN im_capital_aseg IS NULL THEN 1 ELSE 0 END) AS capital_aseg_nulos,
    SUM(CASE WHEN im_capital_aseg IS NOT NULL THEN 1 ELSE 0 END) AS capital_aseg_validos
FROM dbo.BD_TB_SEGURO;
--nulos y posibles vacios
SELECT
    SUM(CASE WHEN im_capital_aseg IS NULL THEN 1 ELSE 0 END) AS capital_aseg_nulos,
    SUM(CASE WHEN LTRIM(RTRIM(im_capital_aseg)) = '' THEN 1 ELSE 0 END) AS capital_aseg_vacios,
    SUM(CASE WHEN im_capital_aseg IS NOT NULL AND LTRIM(RTRIM(im_capital_aseg)) <> '' THEN 1 ELSE 0 END) AS capital_aseg_validos
FROM dbo.BD_TB_SEGURO;

--nulos tipo numerico
SELECT
    SUM(CASE WHEN im_comision IS NULL THEN 1 ELSE 0 END) AS comision_nulos,
    SUM(CASE WHEN im_comision IS NOT NULL THEN 1 ELSE 0 END) AS comision_validos
FROM dbo.BD_TB_SEGURO;
--nulos y posibles vacios
SELECT
    SUM(CASE WHEN im_comision IS NULL THEN 1 ELSE 0 END) AS comision_nulos,
    SUM(CASE WHEN LTRIM(RTRIM(im_comision)) = '' THEN 1 ELSE 0 END) AS comision_vacios,
    SUM(CASE WHEN im_comision IS NOT NULL AND LTRIM(RTRIM(im_comision)) <> '' THEN 1 ELSE 0 END) AS comision_validos
FROM dbo.BD_TB_SEGURO;




-- ==================== [dbo].[BD_UBIGEO] ====================
SELECT * FROM [dbo].[BD_UBIGEO]

SELECT * FROM [dbo].[BD_UBIGEO] WHERE DISTRITO =''
SELECT * FROM [dbo].[BD_UBIGEO] WHERE DISTRITO ='DESCONOCIDO'

-- Reemplaza valores vacíos en la columna 'DISTRITO' por 'DESCONOCIDO' para asegurar consistencia en los datos
UPDATE [dbo].[BD_UBIGEO] SET DISTRITO = 'DESCONOCIDO' WHERE DISTRITO = '';

SELECT DISTINCT PROVINCIA FROM [dbo].[BD_UBIGEO]
SELECT DISTINCT DEPARTAMENTO FROM [dbo].[BD_UBIGEO]


-- ==================== [dbo].[TB_PRODUCTOS_FINANCIEROS] ====================

--TB PRODUCTOS FINANCIEROS -- 1495428  -- 61898 SE ELIMINARION 123798 DATOS DUPLICADOS DE OTRA TABLA 
  DELETE FROM [dbo].[TB_PRODUCTOS_FINANCIEROS] WHERE FLGTC IN ('P', 'U');


  SELECT
    SUM(CASE WHEN CODIGO IS NULL THEN 1 ELSE 0 END) AS codigo_nulos,
    SUM(CASE WHEN LTRIM(RTRIM(CODIGO)) = '' THEN 1 ELSE 0 END) AS codigo_vacios,
    SUM(CASE WHEN CODIGO IS NOT NULL AND LTRIM(RTRIM(CODIGO)) <> '' THEN 1 ELSE 0 END) AS codigo_validos
FROM dbo.TB_PRODUCTOS_FINANCIEROS;


  SELECT
    SUM(CASE WHEN MES_CORTE IS NULL THEN 1 ELSE 0 END) AS mes_corte_nulos,
    SUM(CASE WHEN LTRIM(RTRIM(MES_CORTE)) = '' THEN 1 ELSE 0 END) AS mes_corte_vacios,
    SUM(CASE WHEN MES_CORTE IS NOT NULL AND LTRIM(RTRIM(MES_CORTE)) <> '' THEN 1 ELSE 0 END) AS mes_corte_validos
FROM dbo.TB_PRODUCTOS_FINANCIEROS;
---
SELECT
    -- FLGVIP
    SUM(CASE WHEN FLGVIP IS NULL THEN 1 ELSE 0 END) AS flgvip_nulos,
    SUM(CASE WHEN LTRIM(RTRIM(FLGVIP)) = '' THEN 1 ELSE 0 END) AS flgvip_vacios,
    SUM(CASE WHEN FLGVIP IS NOT NULL AND LTRIM(RTRIM(FLGVIP)) <> '' THEN 1 ELSE 0 END) AS flgvip_validos,

    -- FLGVPH
    SUM(CASE WHEN FLGVPH IS NULL THEN 1 ELSE 0 END) AS flgvph_nulos,
    SUM(CASE WHEN LTRIM(RTRIM(FLGVPH)) = '' THEN 1 ELSE 0 END) AS flgvph_vacios,
    SUM(CASE WHEN FLGVPH IS NOT NULL AND LTRIM(RTRIM(FLGVPH)) <> '' THEN 1 ELSE 0 END) AS flgvph_validos,

    -- FLGTC
    SUM(CASE WHEN FLGTC IS NULL THEN 1 ELSE 0 END) AS flgtc_nulos,
    SUM(CASE WHEN LTRIM(RTRIM(FLGTC)) = '' THEN 1 ELSE 0 END) AS flgtc_vacios,
    SUM(CASE WHEN FLGTC IS NOT NULL AND LTRIM(RTRIM(FLGTC)) <> '' THEN 1 ELSE 0 END) AS flgtc_validos,

    -- FLGAHO
    SUM(CASE WHEN FLGAHO IS NULL THEN 1 ELSE 0 END) AS flgaho_nulos,
    SUM(CASE WHEN LTRIM(RTRIM(FLGAHO)) = '' THEN 1 ELSE 0 END) AS flgaho_vacios,
    SUM(CASE WHEN FLGAHO IS NOT NULL AND LTRIM(RTRIM(FLGAHO)) <> '' THEN 1 ELSE 0 END) AS flgaho_validos,

    -- FLGSEG
    SUM(CASE WHEN FLGSEG IS NULL THEN 1 ELSE 0 END) AS flgseg_nulos,
    SUM(CASE WHEN LTRIM(RTRIM(FLGSEG)) = '' THEN 1 ELSE 0 END) AS flgseg_vacios,
    SUM(CASE WHEN FLGSEG IS NOT NULL AND LTRIM(RTRIM(FLGSEG)) <> '' THEN 1 ELSE 0 END) AS flgseg_validos,

    -- FLGSBS
    SUM(CASE WHEN FLGSBS IS NULL THEN 1 ELSE 0 END) AS flgsbs_nulos,
    SUM(CASE WHEN LTRIM(RTRIM(FLGSBS)) = '' THEN 1 ELSE 0 END) AS flgsbs_vacios,
    SUM(CASE WHEN FLGSBS IS NOT NULL AND LTRIM(RTRIM(FLGSBS)) <> '' THEN 1 ELSE 0 END) AS flgsbs_validos

FROM dbo.TB_PRODUCTOS_FINANCIEROS;
--
SELECT
    SUM(CASE WHEN FLGVIP NOT IN ('0', '1') AND FLGVIP IS NOT NULL AND LTRIM(RTRIM(FLGVIP)) <> '' THEN 1 ELSE 0 END) AS flgvip_invalidos,
    SUM(CASE WHEN FLGVPH NOT IN ('0', '1') AND FLGVPH IS NOT NULL AND LTRIM(RTRIM(FLGVPH)) <> '' THEN 1 ELSE 0 END) AS flgvph_invalidos,
    SUM(CASE WHEN FLGTC  NOT IN ('0', '1') AND FLGTC  IS NOT NULL AND LTRIM(RTRIM(FLGTC))  <> '' THEN 1 ELSE 0 END) AS flgtc_invalidos,
    SUM(CASE WHEN FLGAHO NOT IN ('0', '1') AND FLGAHO IS NOT NULL AND LTRIM(RTRIM(FLGAHO)) <> '' THEN 1 ELSE 0 END) AS flgaho_invalidos,
    SUM(CASE WHEN FLGSEG NOT IN ('0', '1') AND FLGSEG IS NOT NULL AND LTRIM(RTRIM(FLGSEG)) <> '' THEN 1 ELSE 0 END) AS flgseg_invalidos,
    SUM(CASE WHEN FLGSBS NOT IN ('0', '1') AND FLGSBS IS NOT NULL AND LTRIM(RTRIM(FLGSBS)) <> '' THEN 1 ELSE 0 END) AS flgsbs_invalidos
FROM dbo.TB_PRODUCTOS_FINANCIEROS;


-- ==================== [dbo].[TB_TIPO_SEGURO] ====================
SELECT * FROM [dbo].[TB_TIPO_SEGURO]


SELECT DISTINCT CODIGO FROM [dbo].[TB_TIPO_SEGURO]
SELECT DISTINCT GRUPO FROM [dbo].[TB_TIPO_SEGURO]
SELECT DISTINCT TIPO FROM [dbo].[TB_TIPO_SEGURO]
SELECT DISTINCT GRUPO FROM [dbo].[TB_TIPO_SEGURO]
SELECT DISTINCT DESCRIPCION FROM [dbo].[TB_TIPO_SEGURO]

SELECT 
    SUM(CASE WHEN CODIGO IS NULL OR LTRIM(RTRIM(CODIGO)) = '' THEN 1 ELSE 0 END) AS codigo_nulos_vacios,
    SUM(CASE WHEN GRUPO IS NULL OR LTRIM(RTRIM(GRUPO)) = '' THEN 1 ELSE 0 END) AS grupo_nulos_vacios,
    SUM(CASE WHEN TIPO IS NULL OR LTRIM(RTRIM(TIPO)) = '' THEN 1 ELSE 0 END) AS tipo_nulos_vacios,
    SUM(CASE WHEN DESCRIPCION IS NULL OR LTRIM(RTRIM(DESCRIPCION)) = '' THEN 1 ELSE 0 END) AS descripcion_nulos_vacios
FROM dbo.TB_TIPO_SEGURO;

-- ==========================================================

-- Obtiene las edades únicas junto con la cantidad de clientes por edad, ordenadas ascendentemente
SELECT EDAD, COUNT(EDAD) AS CANTIDAD FROM [dbo].[BD_CLIENTE] GROUP BY EDAD ORDER BY EDAD ASC;


SELECT  COUNT(*) FROM [dbo].[BD_TB_SEGURO]


USE bds_SEGUROS;
GO

-- Elimina la tabla si existe para evitar errores
IF OBJECT_ID('dbo.FACT_SEGUROS', 'U') IS NOT NULL
    DROP TABLE dbo.FACT_SEGUROS;
GO

-- Crear la tabla con la estructura y datos de la vista
-- Elimina la tabla FACT_SEGUROS si ya existe
IF OBJECT_ID('dbo.FACT_SEGUROS', 'U') IS NOT NULL
    DROP TABLE dbo.FACT_SEGUROS;
GO
-- crear vista
USE bds_SEGUROS;
GO

CREATE OR ALTER VIEW dbo.FACT_SEGUROS_DETALLE_VW AS
SELECT
  cli.CODIGO AS COD_CLIENTE,
  cli.AGENCIA AS COD_AGENCIA,
  cli.SEGMENTO COLLATE Modern_Spanish_CI_AS AS COD_SEGMENTO,
  cli.SEXO AS COD_SEXO,
  rango.COD_RANGO_EDAD,
  segs.cd_subproducto COLLATE Modern_Spanish_CI_AS AS COD_TIPO_SEGURO,
  segs.cd_canal_venta COLLATE Modern_Spanish_CI_AS AS COD_CANAL,
  CAST(segs.fh_apertura AS DATE) AS FECHA_APERTURA,
  CAST(segs.fh_vencimiento AS DATE) AS FECHA_VENCIMIENTO,

  COUNT(segs.CODIGO) OVER (PARTITION BY cli.CODIGO, cli.AGENCIA, cli.SEGMENTO, cli.SEXO, rango.COD_RANGO_EDAD, segs.cd_subproducto, segs.cd_canal_venta, CAST(segs.fh_apertura AS DATE), CAST(segs.fh_vencimiento AS DATE)) AS CANTIDAD_SEGUROS,
  SUM(ISNULL(segs.im_prima, 0)) OVER (PARTITION BY cli.CODIGO, cli.AGENCIA, cli.SEGMENTO, cli.SEXO, rango.COD_RANGO_EDAD, segs.cd_subproducto, segs.cd_canal_venta, CAST(segs.fh_apertura AS DATE), CAST(segs.fh_vencimiento AS DATE)) AS PRIMA_TOTAL,-- define el grupo para el conteo(cantidad de polizas)  
  MAX(ISNULL(segs.im_prima, 0)) OVER (PARTITION BY cli.CODIGO, cli.AGENCIA, cli.SEGMENTO, cli.SEXO, rango.COD_RANGO_EDAD, segs.cd_subproducto, segs.cd_canal_venta, CAST(segs.fh_apertura AS DATE), CAST(segs.fh_vencimiento AS DATE)) AS PRIMA_MAXIMA, -- prima máxima pagada dentro de cada grupo
  CASE WHEN CAST(segs.fh_vencimiento AS DATE) BETWEEN GETDATE() AND DATEADD(DAY, 30, GETDATE()) THEN 1 ELSE 0 END AS POLIZA_PROXIMA_A_VENCER
FROM bd_SEGUROS.dbo.BD_CLIENTE cli
INNER JOIN bd_SEGUROS.dbo.BD_TB_SEGURO segs
  ON cli.CODIGO COLLATE Modern_Spanish_CI_AS = segs.CODIGO COLLATE Modern_Spanish_CI_AS
INNER JOIN bd_SEGUROS.dbo.DIM_RANGO_EDAD rango
  ON cli.EDAD = rango.EDAD;
GO



-- Crea la tabla FACT_SEGUROS con los datos y estructura, jalando datos de bd_SEGUROOS
--DIMENSIONES: Agencia, Cliente, Segmento, Sexo, Rango de edad, Tipo de seguro, Canal de venta, Fecha de apertura
--MEDIDAS: Cantidad de seguros contratados, prima total pagada
-- select*from FACT_SEGUROS
SELECT 
  cli.CODIGO AS COD_CLIENTE,
  cli.AGENCIA AS COD_AGENCIA,
  cli.SEGMENTO COLLATE Modern_Spanish_CI_AS AS COD_SEGMENTO,
  cli.SEXO AS COD_SEXO,
  rango.COD_RANGO_EDAD,
  segs.cd_subproducto COLLATE Modern_Spanish_CI_AS AS COD_TIPO_SEGURO,
  segs.cd_canal_venta COLLATE Modern_Spanish_CI_AS AS COD_CANAL,
  CAST(segs.fh_apertura AS DATE) AS FECHA_APERTURA,

  COUNT(segs.CODIGO) AS CANTIDAD_SEGUROS,
  SUM(ISNULL(segs.im_prima, 0)) AS PRIMA_TOTAL
INTO dbo.FACT_SEGUROS
FROM bd_SEGUROS.dbo.BD_CLIENTE cli
INNER JOIN bd_SEGUROS.dbo.BD_TB_SEGURO segs
  ON cli.CODIGO COLLATE Modern_Spanish_CI_AS = segs.CODIGO COLLATE Modern_Spanish_CI_AS
INNER JOIN bd_SEGUROS.dbo.DIM_RANGO_EDAD rango
  ON cli.EDAD = rango.EDAD
GROUP BY 
  cli.CODIGO,
  cli.AGENCIA,
  cli.SEGMENTO,
  cli.SEXO,
  rango.COD_RANGO_EDAD,
  segs.cd_subproducto,
  segs.cd_canal_venta,
  CAST(segs.fh_apertura AS DATE);
GO
-- Crear índices para mejorar rendimiento 
CREATE INDEX idx_fact_seguro_cliente ON dbo.FACT_SEGUROS(COD_CLIENTE);
CREATE INDEX idx_fact_seguro_agencia ON dbo.FACT_SEGUROS(COD_AGENCIA);
CREATE INDEX idx_fact_seguro_rangoedad ON dbo.FACT_SEGUROS(COD_RANGO_EDAD);
GO

USE bds_SEGUROS;
GO

SELECT TABLE_SCHEMA, TABLE_NAME
FROM INFORMATION_SCHEMA.TABLES
WHERE TABLE_NAME = 'BD_CLIENTE';

--
USE bds_SEGUROS;
GO

IF OBJECT_ID('dbo.FACT_SEGUROS_DETALLE', 'U') IS NOT NULL
    DROP TABLE dbo.FACT_SEGUROS_DETALLE;
GO

-- Crea la tabla FACT_SEGUROS con los datos y estructura, jalando datos de bd_SEGUROOS
--DIMENSIONES:Agencia, Cliente, Segmento, Sexo, Rango de edad (desde DIM_RANGO_EDAD), Tipo de seguro, Canal de venta, Fecha de apertura.
--MEDIDAS: Cantidad de seguros contratados, Prima total pagada.
-- select*from FACT_SEGUROS
SELECT DISTINCT
  COD_CLIENTE,
  COD_AGENCIA,
  COD_SEGMENTO,
  COD_SEXO,
  COD_RANGO_EDAD,
  COD_TIPO_SEGURO,
  COD_CANAL,
  FECHA_APERTURA,
  FECHA_VENCIMIENTO,
  CANTIDAD_SEGUROS,
  PRIMA_TOTAL,
  PRIMA_MAXIMA,
  SUM(POLIZA_PROXIMA_A_VENCER) OVER (PARTITION BY COD_CLIENTE) AS POLIZAS_PROXIMAS_A_VENCER
INTO dbo.FACT_SEGUROS_DETALLE
FROM dbo.FACT_SEGUROS_DETALLE_VW;
GO

-- Crear índices para mejorar rendimiento
CREATE INDEX idx_fact_cliente ON dbo.FACT_SEGUROS_DETALLE(COD_CLIENTE);
CREATE INDEX idx_fact_vencimiento ON dbo.FACT_SEGUROS_DETALLE(FECHA_VENCIMIENTO);
GO

-- ====CREACION DE VISTAS=======

CREATE OR ALTER VIEW DIM_TIPO_SEGURO AS
SELECT 
    CODIGO AS COD_TIPO_SEGURO,
    DESCRIPCION AS NOMBRE_TIPO,
    GRUPO AS CLASIFICACION_PRODUCTO
FROM 
    dbo.TB_TIPO_SEGURO;
---- CREAR VISTA CANAL VENTA 
CREATE OR ALTER VIEW DIM_CANAL_VENTA AS
SELECT 
    cd_canal_venta AS COD_CANAL,
    CASE 
        WHEN cd_canal_venta IS NULL THEN 'Desconocido'
        WHEN cd_canal_venta = 1 THEN 'Agencias'
        WHEN cd_canal_venta = 2 THEN 'Digital'
        WHEN cd_canal_venta = 3 THEN 'Telemarketing'
        ELSE 'Otro'
    END AS NOMBRE_CANAL
FROM 
    dbo.BD_TB_SEGURO;

    select* from DIM_CANAL_VENTA

--CREAR VISTA SEGMENTO  SELECT* FROM DIM_SEGMENTO

CREATE OR ALTER VIEW DIM_SEGMENTO AS
SELECT 
    COD_SEGMENTO AS COD_SEGMENTO,
    DESC_SEGMENTO AS NOMBRE_SEGMENTO
FROM 
    dbo.BD_SEGMENTO;

-- CREAR VISTA UBIGEO      SELECT* FROM DIM_UBIGEO 

CREATE OR ALTER VIEW DIM_UBIGEO AS
SELECT 
    COD_UBIGEO AS UBIGEO,
    DEPARTAMENTO AS NOMBRE_DEPARTAMENTO,
    PROVINCIA AS NOMBRE_PROVINCIA,
    DISTRITO AS NOMBRE_DISTRITO
FROM 
    dbo.BD_UBIGEO;

/*
Descripción:
Clientes únicos con su rango de edad, sexo, situación y cantidad de seguros adquiridos.
Dimensiones: CODIGO, SITUACION, COD_RANGO_EDAD, RANGO_EDAD, COD_SEXO, DESC_SEXO
Medidas: CANTIDAD_SEGUROS
*/
CREATE OR ALTER VIEW VISTA_CLIENTES_RESUMEN AS
WITH ClientesUnicos AS (
    SELECT
        CODIGO,
        SEXO,
        EDAD,
        SITUACION,
        ROW_NUMBER() OVER (PARTITION BY CODIGO ORDER BY FECHA_ALTA DESC) AS RN
    FROM dbo.BD_CLIENTE
)
, ClienteSeguros AS (
    SELECT
        CODIGO,
        COUNT(*) AS CANT_SEGUROS
    FROM dbo.BD_TB_SEGURO
    GROUP BY CODIGO
)
SELECT
    cu.CODIGO,
    cu.SITUACION,
    dre.COD_RANGO_EDAD,
    dre.RANGO_EDAD,
    cu.SEXO AS COD_SEXO,
    ds.DESC_SEXO,
    ISNULL(cs.CANT_SEGUROS, 0) AS CANTIDAD_SEGUROS
FROM ClientesUnicos cu
LEFT JOIN dbo.DIM_RANGO_EDAD dre ON cu.EDAD = dre.EDAD
LEFT JOIN dbo.DIM_SEXO ds ON cu.SEXO = ds.COD_SEXO
LEFT JOIN ClienteSeguros cs ON cu.CODIGO = cs.CODIGO
WHERE cu.RN = 1;
GO

SELECT * FROM [dbo].[VISTA_CLIENTES_RESUMEN] ORDER BY COD_RANGO_EDAD ASC