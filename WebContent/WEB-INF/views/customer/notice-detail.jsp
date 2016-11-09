
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


	<main>
	<table border="1">
		<tbody>
			<tr>
				<td>제목</td>
				<td colspan="3">${n.title}</td>
			</tr>
			<tr>
				<td>작성일</td>
				<td colspan="3">${n.regDate}</td>
			</tr>
			<tr>
				<td>작성자</td>
				<td>${n.writer}</td>
				<td>조회수</td>
				<td>${n.hit}</td>
			</tr>

			<tr>
				<td>첨부파일</td>
				<td colspan="3">
				<c:forEach var="f" items="${files}" varStatus="s">
						<!-- 키 값으로 상태 값을 준다 -->
						<a href="../download?f=${f.src}">${f.src}</a>
						<%-- index : ${s.index} / count: ${s.count} /${s.first} /${s.last} --%>
						<c:if test="${!s.last}">,</c:if>
					</c:forEach></td>
			</tr>
			<%-- <tr>
         <td>첨부파일</td>
         <td colspan="3"></td>
          <c:forEach var = "f" items ="${files}" varStatus="s">
          	index : ${status.index} / count : ${status.count} / ${status.first}
          <a href="../download?f=${f.src}">${f.src}</a>
          
          <!-- 	이 방식은 우클릭으로 다운받게밖에 못함 웹브라우저가할수있는건 열어버림 -->
          	<a href="upload/${f.src}">${f.src}</a>
          <c:if test="${!s.last}">,</c:if>
          </c:forEach>
          
      </tr> --%>
			<tr>
				<%-- <td colspan="4">
				<c:forEach var="f" items="${files}"varStatus="s">
						<img src="upload/${f.src}" />
					</c:forEach></td> --%>
				 <td colspan="4">
				 	<c:forEach var="f" items="${files}" varStatus="s">     
              		<img src="upload/${f.src}"/>
         			</c:forEach>	
					${n.content}
				</td>
			</tr>
		</tbody>
	</table>
<div>
   <c:if test="${empty prev.code}">이전글이없습니다.</c:if>
   <c:if test="${not empty prev.code}">이전글 :<a href="notice-detail?code=${prev.code}">${prev.title}</a></c:if>
   
   </div>
   <div>
   <c:if test="${empty next.code}">다음글이없습니다.</c:if>
   <c:if test="${not empty next.code}">다음글 :<a href="notice-detail?code=${next.code}">${next.title}</a></c:if>

	<div>
		<a href="notice">목록</a>
		 <a href="notice-edit?code=${n.code}">수정</a>

		<!-- 개념적으로는 포스트가 맞지만 쓰기 좋겠금 get -->
		<a href="notice-del?code=${n.code}">삭제</a>
	</div>
	</div>
	</main>
