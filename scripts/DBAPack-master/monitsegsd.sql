SET DEFINE ON

DEFINE P_TBS=&1.
DEFINE P_OWNER=&2.
DEFINE P_SEG=&3.
DEFINE P_PCTOCUP=0
DEFINE P_MEGAS=1
DEFINE P_RESUMO=N�o

@@do.monitsegs.sql

PROMPT Para obter o resumo dos objetos use @monitsegs &p_tbs. &p_owner. &p_seg.
PROMPT

UNDEFINE P_TBS
UNDEFINE P_OWNER
UNDEFINE P_SEG
UNDEFINE P_PCTOCUP
UNDEFINE P_MEGAS
UNDEFINE P_RESUMO
UNDEFINE 1
UNDEFINE 2
UNDEFINE 3

SET SERVEROUT OFF VERIFY ON FEED ON
