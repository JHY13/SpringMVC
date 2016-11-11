<%@page import="java.sql.Date"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String url = "jdbc:oracle:thin:@211.238.142.251:1521:orcl";
String sql = "SELECT * FROM NOTICE_VIEW WHERE TITLE LIKE ?";
// String sql = "SELECT * FROM MEMBER WHERE NAME LIKE?";// WHERE MID LIKE  '%다%' ORDER BY MID DESC";
String sql2 = "SELECT * FROM NOTICE_VIEW";
String query = "";

Class.forName("oracle.jdbc.driver.OracleDriver");
Connection con = DriverManager.getConnection(url, "c##sist", "dclass");
//Statement st = con.createStatement();
PreparedStatement st = con.prepareStatement(sql);
st.setString(1, "%"+query+"%");

ResultSet rs = st.executeQuery();

String code="";
String title="";
String writer;
Date regdate;
int hit;
/* String mid="";
String pwd="";
String name;
String phone;
 */

/*
	if(name.endsWith("륜")){
		System.out.printf("%s\n",name);
		break;
	}*/

%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<body>
	<h1><a href=""> 공지사항</a></h1>
	
	<ul>
		<li><a href="../index.jsp">home</a></li>
		<li><a href="notice.jsp">공지사항</a></li>
	</ul>
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
		<%while(rs.next()){
			/*int b;
			b = rs.getInt("AGE"); */
			code = rs.getString("code");
			title = rs.getString("title");
			writer = rs.getString("writer");
			regdate = rs.getDate("regdate");
			hit = rs.getInt("hit");
			%>
			<tr>
				<td><%=code%></td>
				<td><a href = "notice-detail.jsp?code=<%=code %>"><%=title %> </a></td>
				<td><%=writer %></td>
				<td><%=regdate %></td>
				<td><%=hit %></td>
				
			</tr>
		<%
		}
			rs.close();
			st.close();
			con.close();
		%>
			<tr>
				<td>2</td>
				<td>리눅스 강의가 시작됩니다.</td>
				<td>newlec</td>
				<td>2016-09-30</td>
				<td>11</td>
			</tr>
		</tbody>
	</table>
</body>
</html>