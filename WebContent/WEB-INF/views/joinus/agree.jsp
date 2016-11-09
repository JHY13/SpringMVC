<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
		<c:if test="${not empty param.error}">
			<div style="color: red;">
				약관에 동의를 하지 않았습니다. 약관에 동의를 해주세요.
			</div>
		</c:if>
		<form action="agree" method="post">
			<div>
			<!-- 값을 전달하기 위한 키 name value 값이 나오게하는 값-->
			<input type="checkbox" name="agree" value = "true"/>약관에 동의합니다.
			</div>
			<div>
			<!-- 서브밋? botton으로 했을땐 안됨 -->
				<input type="submit" value="다음" />		
			</div>		
		</form>
