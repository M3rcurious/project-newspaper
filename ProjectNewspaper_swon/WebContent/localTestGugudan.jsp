<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>    
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0">
<title>Insert title here</title>
<style type="text/css">
	table {
		border-collapse: collapse;
	}
	table, td {
		border: 2px dotted green;
		padding: 5px;
		text-align: center;
	}
	#top {
		background-color: rgb(110,110,110);
		color: rgb(255,255,255);
	}
</style>
</head>
<body>
<table>
<% for(int j=0;j<=9;j++) {
%>
	<tr>
	<% for(int i=0;i<=9;i++) {
		if(j == 0 && i == 0) {
			%><td></td><%				
		} else if(j == 0) {
			%><td id="top"> X<%=i %> </td> <% 
		} else if(i == 0) {
			%> <td><%= j %>단</td> <% 
		} else {
			%><td><%=j %> X <%=i %> = <%=j*i %></td><%	
		}	 
 	}
	%>	
	</tr>
<% 
}
%>
</table>
</body>
</html>
