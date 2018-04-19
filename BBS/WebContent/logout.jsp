<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<body>
	<%
		session.invalidate();
	%>
	<script>
		location.href = 'home.jsp';
	</script>
</body>
</html>