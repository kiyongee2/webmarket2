<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="vo.Product"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dao.ProductRepository"%>
<%@ page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Welcome~</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-Fy6S3B9q64WdZWQUiU+q4/2Lc9npb8tCaSX9FK7E8HnRr0Jz8D6OP9dO5Vg3Q9ct" crossorigin="anonymous"></script>
</head>
<body>
	<jsp:include page="./menu.jsp" />
	<div class="jumbotron">
		<div class="container">
			<h1 class="display-3">상품 목록</h1>
		</div>
	</div>
	<div class="container">
		<div class="row" align="center">
		<%@ include file="./dbconn.jsp" %>
		<%
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			String sql = "SELECT * FROM product";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()){
		%>
			<div class="col-md-4">
				<img src="./upload/<%=rs.getString("p_productImage") %>" style="width:100%">
				<h3><%=rs.getString("p_name") %></h3>
				<p><%=rs.getString("p_description") %>
				<p><%=rs.getInt("p_unitPrice") %>
				<p><a href="./product.jsp?id=<%=rs.getString("p_id") %>" 
				   class="btn btn-secondary" role="button">상세 정보 &raquo;</a>
			</div>
		<%
			}
		%>
		</div>
	</div>
	<jsp:include page="./footer.jsp" />
</body>
</html>