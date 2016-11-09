<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- 페이저라이버리를 쓰기위한 명시 -->
<%@ taglib prefix="s" tagdir="/WEB-INF/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항목록 한번 바꿔보자</title>
<!-- <link href="../css/reset.css" type="text/css" rel="stylesheet" /> -->

<!-------------------- 브라우저의 요청 ----------------->
<link href="css/notice.css" type="text/css" rel="stylesheet" />
<!-- <script src="../js/modernizr-custom.js">
   /* Document.createElement("main") */
</script> -->
</head>
<body>
	<!-- 서버단에서 처리할때 디렉토리-------헤더 부분 --------------------------->
	<jsp:include page="../inc/header.jsp"/>
	<!-- --------------------------------------------<visual>-------------------------------------------------------- -->
	<!-- 비쥬얼부분 -->
	<jsp:include page="inc/visual.jsp"/>
	<!-- --------------------------------------------<body>---------------------------------------------------------- -->
	<div id="body">
		<div class="content-container clearfix">


			<!-- --------------------------------------------aside----------------------------------------------------------- -->
	<!-- asid부분 -->
	<jsp:include page="inc/aside.jsp"/>

			<!-- --------------------------------------------main-------------------------------------------------------- -->

			<main>
			<section id="search-from">
				<h2>공지사항</h2>
				<!-- <div id="breadlet">
					<h2>breadLet</h2>
					<ol>
						<li>home</li>
						<li>고객센터</li>
						<li>공지사항</li>
					</ol>
				</div> -->

				<div>
					<h2>공지사항 검색 폼</h2>
					<form>
						<fieldset>
							<legend>공지사항 검색 필드</legend>
							<label>검색분류</label> <select>
								<option>제목</option>
								<option>작성자</option>
							</select> <label>검색어</label> <input type="text" /> <input type="submit"
								value="검색" />
						</fieldset>
					</form>
				</div>

				<div>
					<h2>공지사항 목록</h2>
					<table>
						<thead>
							<tr>
								<td>번호</td>
								<td>제목</td>
								<td>작성자</td>
								<td>작성일</td>
								<td>조회수</td>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="n" items="${list}">
								<tr>
									<td>${n.code}</td>
									<td><a href="notice-detail?code=${n.code}">${n.title}
									</a></td>
									<td>${n.writer}</td>
									<td><fmt:formatDate pattern="yyyy-MM-dd"
											value="${n.regDate}" /></td>
									<td>${n.hit}</td>
								</tr>
							</c:forEach>




							<!-- <tr>
								<td>44</td>
								<td>서적과 사이트 개편에 대한 안내</td>
								<td>admin</td>
								<td>2016-09-21</td>
								<td>148</td>
							</tr> -->
							
						</tbody>
					</table>
				</div>

				<div>
					<h2>현재 페이지</h2>
					<div>1/3 pages</div>
				</div>

				<div>
					<h2>페이지</h2>
					<div>
						<div>
							<img src="../images/btn-prev.png" alt="이전" />
						</div>
						<ul>
							<li>1</li>
							<li>2</li>
							<li>3</li>
						</ul>
						<div>
							<img src="../images/btn-next.png" alt="다음" />
						</div>
					</div>
				</div>
	
			</section>
			<div>
					<h3>페이저</h3>
					<s:pager />
				</div>
			</main>
		</div>
	</div>
	<!-- <div id="sang">
  	두구두구두궁~
  </div> -->
	<!-- --------------------------------------------footer-------------------------------------------------------- -->
	<!-- 푸터부분 -->
	<jsp:include page="../inc/footer.jsp"/>

</body>
</html>