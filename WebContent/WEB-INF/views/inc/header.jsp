<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!-- 컨테스트 명을 동적으로 알기위한것 리퀘스트가 제공해주고있다. -->
<!-- ?? request 동적으로 알아내는 방법 -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- pagecontext에 있음 ctx키값 -->   
<c:set var="ctx">${pageContext.request.contextPath}</c:set>
<%-- <c:set var="ctx" value="${pageContext.request.contextPath}" /> --%>
    
<div id="header">
		<div class="content-container">


			<!-- --------------------<header>--------------------- -->
<%-- ${ctx} 절대경로를 쓰기 위한것 --%>
			<!-- 섹션의 제목을 정의하고있는곳이 헤더 -->
			<header>
				<h1 id="logo">
					<img src="${ctx}/images/logo.png" alt="뉴렉처 온라인">
				</h1>
				<section>
					<h1>헤더</h1>

					<nav id="main-menu">
						<h1>메인메뉴</h1>
						<ul>
							<li><a href="" lang="ko-a">학습가이드</a></li>
							<li><a href="" lang="ko-b">뉴렉과정</a></li>
							<li><a href="" lang="en-a">강좌선택</a></li>
						</ul>
					</nav>

					<section id="search-form">
						<h1>강좌검색 폼</h1>
						<form>
							<fieldset>
								<legend>과정검색 필드</legend>
								<label>과정검색</label> 
								<input type="text" value="" /> 
								<input type="submit" value="검색" />
							</fieldset>
						</form>
					</section>

					<nav id="member-menu">
						<h1>회원메뉴</h1>
						<ul>
							<li><a href="${ctx}/index">HOME</a></li>
							
							<c:if test="${empty sessionScope.mid}">
							<li><a href="${ctx}/joinus/login">로그인</a></li>
							</c:if>
							<c:if test="${not empty sessionScope.mid}">
							<li><a href="${ctx}/joinus/logout">로그아웃</a></li>
							</c:if>
							
							<!-- 어디로 갈지 모르니 절대 경로를 쓴다 그래서 없으면 빼고 있으면 컨테스트 넣어달라고함-->
							<li><a href="${ctx}/joinus/agree">회원가입</a></li>
						</ul>
					</nav>

					<nav id="customer-menu">
						<h1>고객메뉴</h1>
						<ul>
							<li><a href=""><img src="${ctx}/images/txt-mypage.png"
									alt="마이페이지"></a></li>
							<li><a href="${ctx}/customer/notice"><img src="${ctx}/images/txt-customer.png"
									alt="고객센터"></a></li>
						</ul>
					</nav>
				</section>
			</header>
		</div>
	</div>