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

<!-- 고쳐야함 -->
<link href="css/layout.css" type="text/css" rel="stylesheet" />
<link href="css/<tiles:getAsString name="css"/>" type="text/css" rel="stylesheet" />
<script src="../js/modernizr-custom.js">
   /* Document.createElement("main") */
</script>
</head>
<body>
	<!-- -----------헤더 부분 --------------------------->
	<tiles:insertAttribute name="header"/>
	<%-- <jsp:include page="../inc/header.jsp"/> --%>
	<!-- --------------------------------------------<visual>-------------------------------------------------------- -->
	<!-- 비쥬얼부분 -->
	<tiles:insertAttribute name="visual"/>
	<!-- --------------------------------------------<body>---------------------------------------------------------- -->
	<div id="body">
		<div class="content-container clearfix">


			<!-- --------------------------------------------aside----------------------------------------------------------- -->
	<!-- asid부분 -->
	<tiles:insertAttribute name="aside"/>
	<%-- <jsp:include page="inc/aside.jsp"/> --%>

			<!-- --------------------------------------------main-------------------------------------------------------- -->

			<!-- <main> -->
			<!-- content 부분 -->
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