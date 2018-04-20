<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
   <%@ page import="javax.naming.Context" %>
   <%@ page import="javax.naming.InitialContext" %>
   <%@ page import="javax.naming.NamingException" %>
   <%@ page import="javax.sql.DataSource" %>
   
   <%@ page import="java.sql.Connection" %>
   <%@ page import="java.sql.PreparedStatement" %>
   <%@ page import="java.sql.ResultSet" %>
   <%@ page import="java.sql.SQLException" %>
   
   <%
       request.setCharacterEncoding("utf-8");
 
       String seq = request.getParameter("seq");
       
       String subject = "";
       String writer = "";
       
       Connection conn = null;
       PreparedStatement pstmt = null;
       ResultSet rs = null;
       
       StringBuffer html = new StringBuffer();
       
       try{
          Context initCtx = new InitialContext();
          Context envCtx = (Context)initCtx.lookup("java:comp/env");
          DataSource dataSource = (DataSource)envCtx.lookup("jdbc/oracle1");
          
          conn = dataSource.getConnection();
                           
          String sql = "select subject, writer from board1 where seq = ?";
          pstmt = conn.prepareStatement(sql);
          pstmt.setString(1, seq);

          rs = pstmt.executeQuery();

          if(rs.next()){
               subject = rs.getString("subject");
               writer = rs.getString("writer");
          }
       
       } catch(NamingException e){
          System.out.println("네이밍 에러 : "+ e.getMessage());
       } catch(SQLException e){
          System.out.println("SQL 에러 : "+ e.getMessage());
       } finally{
          if(rs != null) rs.close();
          if(pstmt != null) pstmt.close();
          if(conn != null) conn.close();
       }
   %>
   
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<style>
	#back {
	background-size: 100%
	}
	
</style>
<link rel="stylesheet" type="text/css" href="../css/board_write.css">
<script type = "text/javascript">
	window.onload = function(){
		document.getElementById('submit1').onclick = function(){
			if(document.frm.password.value.trim() == ""){
	   			alert("비밀번호를 입력하세요");
	   			return false;
			}
			document.frm.submit();
		};
	};
</script>
</head>

<body background="../images/free_view.jpg" id="back">
<!-- 상단 디자인 -->
<br><br><br><br><br><br><br><br><br>
<div class="con_title">
</div>
<div class="con_txt">
   <form action="./board_delete1_ok.jsp" method="post" name="frm">
      <!-- hidden : 디자인을 안보여주고 데이터를 넘길때 사용한다. -->
      <input type="hidden" name="seq" value="<%=seq %>" /> 
      <div class="contents_sub">   
         <!--게시판-->
         <div class="board_write">
            <table>
            <tr>
               <th class="top">글쓴이</th>
               <td style="border:none"; class="top" colspan="3"><input type="text" name="writer" value="<%= writer %>" class="board_view_input_mail" maxlength="5" readonly/></td>
            </tr>
            <tr>
               <th>제목</th>
               <td style="border:none"; colspan="3"><input type="text" name="subject" value="<%= subject %>" class="board_view_input" readonly/></td>
            </tr>
            <tr>
               <th>비밀번호</th>
               <td style="border:none"; colspan="3"><input type="password" name="password" value="" class="board_view_input_mail"/></td>
            </tr>
            </table>
         </div>
         
         <div class="btn_area">
            <div class="align_left">
               <button type="button" class="btn_list btn_txt02" style="cursor: pointer;" onclick="location.href='board_list1.jsp'">목록</button>
               <button type="button" class="btn_list btn_txt02" style="cursor: pointer;" onclick="location.href='board_view1.jsp'">보기</button>
            </div>
            <div class="align_right">
               <button type="button" id = "submit1" class="btn_write btn_txt01" style="cursor: pointer;">삭제</button>
            </div>
         </div>
         <!--//게시판-->
      </div>
   </form>
</div>
<!-- 하단 디자인 -->

</body>
</html>