-- Bug que gera desconex�o quando consulta � realizada contra V$SQL_PLAN. Workaround abaixo:
--alter session set "_cursor_plan_unparse_enabled"=false;

DELETE PLAN_TABLE
WHERE STATEMENT_ID = '&1.'
/

INSERT INTO sys.PLAN_TABLE$
(
  BYTES
 ,ACCESS_PREDICATES
 ,CARDINALITY
 ,COST
 ,CPU_COST
 ,DEPTH
 ,DISTRIBUTION
 ,FILTER_PREDICATES
 ,ID
 ,IO_COST
 ,OBJECT_ALIAS
 ,OBJECT_NAME
 ,OBJECT_NODE
 ,OBJECT_OWNER
 ,OBJECT_TYPE
 ,OPERATION
 ,OPTIMIZER
 ,OPTIONS
 ,OTHER
 ,OTHER_TAG
 --,OTHER_XML
 ,PARENT_ID
 ,PARTITION_ID
 ,PARTITION_START
 ,PARTITION_STOP
 ,POSITION
 ,PROJECTION
 ,QBLOCK_NAME
 ,REMARKS
 ,SEARCH_COLUMNS
 ,TEMP_SPACE
 ,TIME
 ,TIMESTAMP
 ,STATEMENT_ID
 ,PLAN_ID
)
SELECT
  BYTES
 ,ACCESS_PREDICATES
 ,CARDINALITY
 ,COST
 ,CPU_COST
 ,DEPTH
 ,DISTRIBUTION
 ,FILTER_PREDICATES
 ,ID
 ,IO_COST
 ,OBJECT_ALIAS
 ,OBJECT_NAME
 ,OBJECT_NODE
 ,OBJECT_OWNER
 ,OBJECT_TYPE
 ,OPERATION
 ,OPTIMIZER
 ,OPTIONS
 ,OTHER
 ,OTHER_TAG
 --,OTHER_XML
 ,PARENT_ID
 ,PARTITION_ID
 ,PARTITION_START
 ,PARTITION_STOP
 ,POSITION
 ,PROJECTION
 ,QBLOCK_NAME
 ,REMARKS
 ,SEARCH_COLUMNS
 ,TEMP_SPACE
 ,TIME
 ,SYSTIMESTAMP
 ,'&1.' 
 , 1
FROM GV$SQL_PLAN
WHERE HASH_VALUE = &1. 
AND ADDRESS = '&2.'
AND CHILD_NUMBER = &3.
/