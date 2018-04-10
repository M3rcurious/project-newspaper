<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>    
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0">
<title>Insert title here</title>
</head>

<body>
바거ㅐ랴ㅕㅗ냐ㅐㅕㅗㄴㅁ댜려ㅗ녀
<div>
<table>
<% for(int j=0;j<=9;j++) {
%>
	<tr>	
	<% for(int i=0;i<=9;i++) {
	%>
		<td><%=j %> X <%=i %> = <%=j*i %></td>
	<% 
 	}
	%>	
	</tr>
<% 
}
%>
</table>
</div>
</body>
</html>
