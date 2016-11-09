<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!--태그라이버리를 이렇게 쓰겠다를 명시  -->
<%-- <%@ taglib prefix="n" uri="http://www.hs.com/jsp/tags/control"%> --%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<!-- <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"> -->
<title>Insert title here</title>
<style>
.strong {
	color: red;
	text-decoration: none;
	font-size: 1.2em;
	/* 1.2배 */
}
</style>

</head>
<body>
	<h1>
		<a href="notice"> 뉴렉처 online</a>
	</h1>

	<ul>
		<li><a href="notice">home</a></li>
		<li><a href="notice">공지사항</a></li>
		
	</ul>
	
	<form action="notice" method="get">
		<fieldset>
			<select name="t">
				<option value="NONE">분류선택</option>


				<!-- 검색할때 분류대로 할 수 있게 만들려고하는 것 -->
            <c:if test="${param.t=='TITLE'}">
               <option value="TITLE" selected="selected">제목</option>
            </c:if>
            <c:if test="${param.t!='TITLE'}"> <!--ELSE가 없으므로 != 표시해준다  -->
               <option value="TITLE">제목</option>
            </c:if>
				<c:if test="${param.t=='CONTENT'}">
					<option value="CONTENT" selected="selected">내용</option>
				</c:if>
				
				<c:if test="${param.t!='CONTENT'}">
					<option value="CONTENT" selected="selected">내용</option>
				</c:if>
				 
			<c:if test="${param.t=='WRITER'}">
               <option value="WRITER" selected="selected">작성자</option>
            </c:if>
            
            <c:if test="${param.t!='WRITER'}"> <!--ELSE가 없으므로 != 표시해준다  -->
               <option value="WRITER">작성자</option>
            </c:if>

				<%-- <c:if test="{param.t=='writer'}">
					<option value="WRITER"selected="selected">작성자</option>
				</c:if>
				<c:if test="{param.t!='writer'}">
					<option value="WRITER"selected="selected">작성자</option>
				</c:if>
				 --%>

				<%-- <option value="WRITER" <c:if test="${param.t=='WRITER'}">selected="selected"</c:if>작성자</option> --%>

			</select> 
			<label>검색어</label>
			 <input name="q" value="${param.q}" />
			<%-- <% request.getParam %> --%>
			<input type="submit" value="검색" />
		</fieldset>
	</form>

	<table border="1">
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
			<%-- <n:for>
			오마이갓<br />
		</n:for> --%>
			<c:forEach var="n" items="${list}">
				<tr>
					<td>${n.code}</td>
					<td><a href="notice-detail?code=${n.code}">${n.title} </a></td>
					<td>${n.writer}</td>
					<td><fmt:formatDate pattern="yyyy-MM-dd" value="${n.regDate}" />

					</td>
					<td>${n.hit}</td>
				</tr>
			</c:forEach>
			<%-- <%
		for(NoticeModel m : list){
			pageContext.setAttribute("m", m);
		%>	
			<tr>
				<td><%=m.getCode()%></td>
				<td><a href = "notice-detail.jsp?code=<%=m.getCode() %>"><%=m.getTitle() %> </a></td>
				<td><%=m.getWriter() %></td>
				<td><%=m.getRegDate() %></td>
				<td><%=m.getHit() %></td>			
			</tr>
		<%
		}
			/* rs.close();
			st.close();
			con.close(); */
		%>
			<tr>
				<td>2</td>
				<td>리눅스 강의가 시작됩니다.</td>
				<td>newlec</td>
				<td>2016-09-30</td>
				<td>11</td>
			</tr> --%>
		</tbody>
	</table>
	
	<c:if test="${empty param.p}">
			<c:set var="page" value="1" />
		</c:if>
	<c:if test="${not empty param.p}">
			<c:set var="page" value="${page.p}" />
	</c:if>
	
	<c:set var="start" value="${page-(page-1)%5}" />
	<c:set var="end" value="${fn:substringBefore((count%10==0?count/10:count/10+1), '.')}" />
	
	<div>
	
	<!-- 1/29page 부분 -->
	<c:if test="${start+i <= end}">
		${page} / ${end} pages
	</c:if>
	</div>
	
	<div>
		<a href="notice-reg">글쓰기</a>
	</div>

	<div>
		
		<div>
			count: ${count} end : ${end}
		</div>
		<!-- page=?
		1	2	3	4	5 -> page = 1~5	:	start	=1
		6	7	8	9	10	->page	=9	:	start	=6
		11	12	13	14	15 	->page=11~15:	start	=11
		16	17	18	19	20
		... -->
		<div>
			<a href="notice?page=${(page==1)?1:start-1}&type=${param.type}&query=${param.query}">이전</a>
		</div>
		<ul>
			<c:forEach var="i" begin="0" end="4">
				<c:if test="${start+i <= end}">
				<%-- <c:if test="${param.p==n  || empty param.p}"> --%>
				<c:if test="${page==start+i}">
					<li><a href="notice?p=${start+i}&t=${param.t}&q=${param.q}" class="strong">${start+i}</a></li>
				</c:if>
				<c:if test="${page!=start+i}">
					<li><a href="notice?p=${start+i}&t=${param.t}&q=${param.q}">${start+i}</a></li>
				
				</c:if>
				</c:if>
			</c:forEach>
		</ul>
		<div>
			<a href="notice?p=${start+5}&t=${param.t}&q=${param.q}">다음</a>
		</div>
	</div>
</body>
</html>