<%@ tag language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
		
		<c:if test="${empty param.p}">
			<c:set var="page" value="1" />
		</c:if>
	<c:if test="${not empty param.p}">
			<c:set var="page" value="${page.p}" />
	</c:if>
	
	<c:set var="start" value="${page-(page-1)%5}" />
	<!-- 펑션 fn -->
	<c:set var="end" value="${fn:substringBefore((count%10==0?count/10:count/10+1), '.')}" />
		
		<%-- <div>
			count: ${count} end : ${end}
		</div> --%>
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
