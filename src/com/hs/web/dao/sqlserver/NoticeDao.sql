
--그룹바이할때 SQLSTUDIO 에서 열 드래그해서 복사하면됨
select * from members
CREATE VIEW NOTICES_VIEW
AS
-- 조회문장을 만들자(
SELECT N.*, COUNT(C.CODE) AS CMTCNT 
   FROM NOTICES N LEFT OUTER JOIN  COMMENTS C ON N.CODE = C.NOTICECODE
GROUP BY N.Code,N.Writer, N.Title, N.Content,N.Regdate,N.Hit;

SELECT * from NOTICES_VIEW;

--SELECT NVL(MAX(TO_NUMBER(CODE)),0) FROM NOTICE
select max(cast(code as int)) from notices
select isnull(max(cast(code as int)),0)+1 as code from notices


--getlist query
SELECT * FROM(
select 
	ROW_NUMBER() OVER (ORDER BY REGDATE DESC) NUM,
	NOTICES_VIEW.*
	from notices_VIEW
	WHERE TITLE LIKE '%%'
	) N
	WHERE NUM BETWEEN 1 AND 10
--getCount query
SELECT Count(*) count FROM(
	select 
	ROW_NUMBER() OVER (ORDER BY REGDATE DESC) NUM,
	NOTICES_VIEW.*
	from notices_VIEW
	WHERE TITLE LIKE '%%'
	) N

INSERT INTO NOTICES(
	CODE,
	TITLE,
	CONTENT,
	WRITER)
VALUES(
	'1107',
	'힘내세요',
	'캬캬캬캬캬캬',
	'hs'
	)
--이전글(이글보다 더 최신)	: Notice getPrev(String code)
select top 1 * from notices where code > cast 1339 order by regdate asc
--다음글(이글보다 더 올드한것)  Notice getNext(String code):notice
select top 1 * from notices where code <1339 order by regdate desc
--작은놈중에 가장 큰놈
--제일 작은놈이 이전글

--조회수 1업 int hitup(String code)
update notices set hit = hit+1 where code='1339';
select * from notices;

SELECT LOW_NEMBER() OVER(ORDER BY CODE ASC) NUM,MOVIE.*FROM MOVIE;