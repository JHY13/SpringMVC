<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- 페이저라이버리를 쓰기위한 명시 -->
<%@ taglib prefix="s" tagdir="/WEB-INF/tags"%>
<!-- 타일즈를 쓰기 위한 명시 -->
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항목록 </title>
<%-- <tiles:getAsString name="css"/> --%>

<!-- css도 레이아웃으로 빼기 위해 -->
<link href="css/layout.css" type="text/css" rel="stylesheet" />
<link href="css/<tiles:getAsString name="css"/>" type="text/css" rel="stylesheet" />
<script src="../js/modernizr-custom.js">
   /* Document.createElement("main") */
</script>

<!-- -----부트스트랩 복사 붙여넣기  다른사람들도 부트스트랩을 쓰고 있으면 우리걸 다운안받아도 되니 이걸쓴다-------------->
<%-- <!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">

<!-- Optional theme -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">

<!-- Latest compiled and minified JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script> --%>
</head>
<body>
	<!-- 타일즈를 써서 만드는 부분 -->
	<!-- -----------헤더 부분 --------------------------->
	<tiles:insertAttribute name="header"/>
	<%-- <jsp:include page="../inc/header.jsp"/> --%>
	<!-- --------------------------------------------<visual>-------------------------------------------------------- -->
	<!-- 비쥬얼부분 -->
<%-- 	<tiles:insertAttribute name="visual"/> --%>
	<!-- --------------------------------------------<body>---------------------------------------------------------- -->
	<!-- aside~main까지 가로영역 -->
	<div id="body">
		<div class="content-container clearfix">

			<!-- content부분 -->
			<tiles:insertAttribute name="main"/>
			<!-- </main> -->
		</div>
	</div>
	<!-- <div id="sang">
  	두구두구두궁~
  </div> -->
	<!-- --------------------------------------------footer-------------------------------------------------------- -->
	<!-- 푸터부분 -->
	<%-- <jsp:include page="../inc/footer.jsp"/> --%>
	<tiles:insertAttribute name="footer"/>
</body>
</html>