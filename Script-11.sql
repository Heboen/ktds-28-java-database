ROLLBACK;

SELECT *
  FROM MV
;

SELECT SEQ_MV_PK.CURRVAL
  FROM DUAL
;

--INSERT INTO GNR
-- ()
--VALUES
-- ()
;

INSERT INTO MV 
 (MV_ID
, TTL
, MV_RTNG
, RNNG_TM
, RLS_DT
, SMMR
, MAIN_PSTR_URL
, FB_URL
, X_URL
, INSTGRM_URL
, TGLN
, ORGNL_TTL
, PLYNG
, LNGG
, BDGT
, BX_OFFC_GRSS)
VALUES 
 (SEQ_MV_PK.NEXTVAL || '-insidious-out-of-the-further'
, '인시디어스: 그들이 넘어왔다'
, '15'
, 106
, TO_DATE('2026-08-20', 'YYYY/MM/DD')
, '사후세계의 악령들로부터 딸과 일상을 지키기 위해 사투를 벌이는 이야기'
, 'POSTER-URL'
, 'https://www.facebook.com/InsidiousMovie'
, 'https://x.com/InsidiousMovie'
, 'https://www.instagram.com/insidiousmovie/'
, '악의 문이 열렸다'
, 'Insidious: Out of the Further'
, '개봉됨'
, '영어'
, 18000000
, 62207464)
;


INSERT INTO GNR
 (GNR_ID
, NM)
VALUES
 (SEQ_GNR_PK.NEXTVAL || '-adventure'
, '모험'
)
;

SELECT *
  FROM MV M
 INNER JOIN MV_GNR MG
 	ON M.MV_ID = MG.MV_ID 
 INNER JOIN GNR G
 	ON MG.GNR_ID2 = G.GNR_ID 
;
INSERT INTO MV_GNR
 (MV_GNR_ID
, MV_ID
, GNR_ID2)
VALUES
 ('MG-' || TO_CHAR(SYSDATE, 'YYYYMMDD-')|| LPAD(SEQ_MV_GNR_PK.NEXTVAL,6,'0')
, '1-spider-man-brand-new-day'
, '3-adventure'
)
;
COMMIT;