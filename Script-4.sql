-- RECURSIVE JOIN
--	MENU 임시테이블 만들기
WITH MENU AS (
	SELECT '1000' AS MENU_ID
		 , '브랜드패션' AS MENU_NAME
		 , NULL AS TOP_MENU_ID
      FROM DUAL
     UNION 
    SELECT '2000' AS MENU_ID
		 , '패션의류/잡화/뷰티' AS MENU_NAME
		 , NULL AS TOP_MENU_ID
      FROM DUAL
     UNION 
    SELECT '1100' AS MENU_ID
		 , '브랜드의류' AS MENU_NAME
		 , '1000' AS TOP_MENU_ID
      FROM DUAL
     UNION 
    SELECT '1200' AS MENU_ID
		 , '브랜드잡화' AS MENU_NAME
		 , '1000' AS TOP_MENU_ID
      FROM DUAL
     UNION 
    SELECT '1300' AS MENU_ID
		 , '스포츠브랜드' AS MENU_NAME
		 , '1000' AS TOP_MENU_ID
      FROM DUAL
     UNION 
    SELECT '2100' AS MENU_ID
		 , '패션의류' AS MENU_NAME
		 , '2000' AS TOP_MENU_ID
      FROM DUAL
     UNION 
    SELECT '2200' AS MENU_ID
		 , '잡화' AS MENU_NAME
		 , '2000' AS TOP_MENU_ID
      FROM DUAL
     UNION 
    SELECT '2300' AS MENU_ID
		 , '뷰티' AS MENU_NAME
		 , '2000' AS TOP_MENU_ID
      FROM DUAL
     UNION 
    SELECT '1101' AS MENU_ID
		 , '브랜드 여성의류' AS MENU_NAME
		 , '1100' AS TOP_MENU_ID
      FROM DUAL
     UNION 
    SELECT '1102' AS MENU_ID
		 , '브랜드 남성의류' AS MENU_NAME
		 , '1100' AS TOP_MENU_ID
      FROM DUAL
     UNION 
    SELECT '1103' AS MENU_ID
		 , '브랜드 캐쥬얼의류' AS MENU_NAME
		 , '1100' AS TOP_MENU_ID
      FROM DUAL
     UNION 
    SELECT '1201' AS MENU_ID
		 , '브랜드 잡화' AS MENU_NAME
		 , '1200' AS TOP_MENU_ID
      FROM DUAL
     UNION 
    SELECT '1202' AS MENU_ID
		 , '브랜드 쥬얼리/시계' AS MENU_NAME
		 , '1200' AS TOP_MENU_ID
      FROM DUAL
     UNION 
    SELECT '1203' AS MENU_ID
		 , '수입명품' AS MENU_NAME
		 , '1200' AS TOP_MENU_ID
      FROM DUAL
     UNION 
    SELECT '1301' AS MENU_ID
		 , '브랜드 아웃도어' AS MENU_NAME
		 , '1300' AS TOP_MENU_ID
      FROM DUAL
     UNION 
    SELECT '1302' AS MENU_ID
		 , '브랜드 스포츠패션' AS MENU_NAME
		 , '1300' AS TOP_MENU_ID
      FROM DUAL
     UNION 
    SELECT '2101' AS MENU_ID
		 , '여성의류' AS MENU_NAME
		 , '2100' AS TOP_MENU_ID
      FROM DUAL
     UNION 
    SELECT '2102' AS MENU_ID
		 , '남성의류' AS MENU_NAME
		 , '2100' AS TOP_MENU_ID
      FROM DUAL
     UNION 
    SELECT '2103' AS MENU_ID
		 , '언더웨어' AS MENU_NAME
		 , '2100' AS TOP_MENU_ID
      FROM DUAL
     UNION 
    SELECT '2104' AS MENU_ID
		 , '유아동의류' AS MENU_NAME
		 , '2100' AS TOP_MENU_ID
      FROM DUAL
     UNION 
    SELECT '2201' AS MENU_ID
		 , '신발' AS MENU_NAME
		 , '2200' AS TOP_MENU_ID
      FROM DUAL
     UNION 
    SELECT '2202' AS MENU_ID
		 , '가방/잡화' AS MENU_NAME
		 , '2200' AS TOP_MENU_ID
      FROM DUAL
     UNION 
    SELECT '2203' AS MENU_ID
		 , '유아동 신발/잡화' AS MENU_NAME
		 , '2200' AS TOP_MENU_ID
      FROM DUAL
     UNION 
    SELECT '2203' AS MENU_ID
		 , '쥬얼리/시계' AS MENU_NAME
		 , '2200' AS TOP_MENU_ID
      FROM DUAL
     UNION 
    SELECT '2204' AS MENU_ID
		 , '수입명품' AS MENU_NAME
		 , '2200' AS TOP_MENU_ID
      FROM DUAL
     UNION 
    SELECT '2301' AS MENU_ID
		 , '화장품/향수' AS MENU_NAME
		 , '2300' AS TOP_MENU_ID
      FROM DUAL
     UNION 
    SELECT '2302' AS MENU_ID
		 , '바디/헤어' AS MENU_NAME
		 , '2300' AS TOP_MENU_ID
      FROM DUAL
)
-- 재귀조인을 이용한 계층 데이터 조회
-- 수입명품(1203) 메뉴의 모든 상위 메뉴를 조회한다.
 SELECT MENU_ID
	  , MENU_NAME
	  , TOP_MENU_ID
	  , LEVEL
   FROM MENU
   START WITH MENU_ID = 1203
CONNECT BY PRIOR TOP_MENU_ID = MENU_ID 
;
-- 브랜드패션(1000) 메뉴의 모든 하위 메뉴를 조회한다.
 SELECT MENU_ID
	  , MENU_NAME
	  , TOP_MENU_ID
	  , LEVEL
   FROM MENU 
  START WITH MENU_ID = 1000
CONNECT BY PRIOR MENU_ID = TOP_MENU_ID
;

-- 재귀참조를 이용한 조인
/*SELECT M_TOP.MENU_ID
	 , M_TOP.MENU_NAME
	 , M_TOP.TOP_MENU_ID 
	 , M_SUB.MENU_ID 
	 , M_SUB.MENU_NAME 
	 , M_SUB.TOP_MENU_ID 
  FROM MENU M_TOP
 INNER JOIN MENU M_SUB
 	ON M_TOP.MENU_ID  = M_SUB.TOP_MENU_ID */
-- 브랜드패션(1000) 메뉴의 하위 메뉴를 조회한다. (1100, 1200, 1300)
-- WHERE M_TOP.TOP_MENU_ID = 1000
--;
-- 패션의류/잡화/뷰티(2000) 메뉴의 하위 메뉴를 조회한다. (2100, 2200, 2300)
--WHERE M_TOP.MENU_ID = 2000
--;
 SELECT MENU_ID
	  , MENU_NAME
	  , TOP_MENU_ID
	  , LEVEL
   FROM MENU 
  START WITH MENU_ID = 2000
CONNECT BY PRIOR MENU_ID = TOP_MENU_ID
;
-- 브랜드잡화(1200) 메뉴의 하위 메뉴를 조회한다. (1201, 1202, 1203)
--WHERE M_TOP.MENU_ID = 1200
--;
 SELECT MENU_ID
	  , MENU_NAME
	  , TOP_MENU_ID
	  , LEVEL
   FROM MENU 
  START WITH MENU_ID = 1200
CONNECT BY PRIOR MENU_ID = TOP_MENU_ID
;
-- 유아동 신발/잡화(2203) 메뉴의 하위 메뉴를 조회한다.
--WHERE M_TOP.MENU_ID = 2203
--;
-- 브랜드 캐쥬얼의류(1103) 메뉴의 부모 메뉴의 이름을 조회한다. (브랜드의류(1100))
--WHERE M_SUB.MENU_ID = 1103
--;
-- 브랜드의류(1100) 메뉴의 부모 메뉴의 이름을 조회한다. (브랜드패션(1000))
--WHERE M_SUB.MENU_ID = 1100
--;
-- 브랜드패션(1000) 메뉴의 부모 메뉴의 이름을 조회한다.
--WHERE M_SUB.MENU_ID = 1000
--;