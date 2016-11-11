<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- 페이저라이버리를 쓰기위한 명시 -->
<%@ taglib prefix="s" tagdir="/WEB-INF/tags"%>

		<main class="main">
<%-- <section id="search-from"> --%>
				<h2 class="main-title">공지사항</h2>
				
				<div class="breadcrumb margin-top-l">
					<h3 class="hidden">breadlet</h3>
					<ul>
						<li>home</li>
						<li>고객센터</li>
						<li>공지사항</li>
					</ul>
				</div>
			
				<div class="margin-top-n">
					<h3 class="hidden">공지사항 검색 폼</h3>
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
					<option value="CONTENT">내용</option>
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

				</div>

				<%-- <div class="table-container">
					<h3 class="hidden">공지사항 목록</h3>
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
				</div> --%>
				<!-- 테이블 위에 녹색 색깔 나오게하는것 -->
					<div class="main-top-border margin-top-n">
					<h3 class="hidden">공지사항 목록</h3>
					<table class="table table-list">
						<thead>
							<tr>
								<th>번호</th>
								<th>제목</th>
								<th>작성자</th>
								<th>작성일</th>
								<th>조회수</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="n" items="${list}">
								<tr class="tr">
									<td class="td">${n.code}</td>
									<td class="text-align-left text-indent"><a href="notice-detail?code=${n.code}">${n.title}</a></td>
									<td class="td">${n.writer}</td>
									<td class="td"><fmt:formatDate pattern="yyyy-MM-dd"
											value="${n.regDate}" /></td>
									<td class="td">${n.hit}</td>
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
				<div class="margin-top-n">
				
					<a href="notice-reg">글쓰기</a>
				</div>
				<div class="margin-top-n">
					<h3 class="hidden">현재 페이지</h3>
					<div>1/3 pages</div>
				</div>

				<!-- <div>
					<h3 class="hidden">페이지</h3>
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
				</div> -->
	
			</section>
			<div class="margin-top-n">
					<h3 class="hidden">페이저</h3>
					<s:pager />
				</div>
				</main>