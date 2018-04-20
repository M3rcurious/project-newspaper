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
      String mail = "";
      String wip = "";
      String wdate = "";
      String hit = "";
      String content = "";
      
      Connection conn = null;
      PreparedStatement pstmt = null;
      ResultSet rs = null;
    
      StringBuffer html = new StringBuffer();
   
    try{
       Context initCtx = new InitialContext();
       Context envCtx = (Context)initCtx.lookup("java:comp/env");
       DataSource dataSource = (DataSource)envCtx.lookup("jdbc/newspaper");
       
       conn = dataSource.getConnection();
       
       String sql = "update free_board set hit=hit+1 where seq=?";
       pstmt = conn.prepareStatement(sql);
       pstmt.setString(1, seq);
       
       pstmt.executeUpdate();
                
       sql = "select subject, writer, mail, wip, wdate, hit, content from free_board where seq = ?";
       pstmt = conn.prepareStatement(sql);
       pstmt.setString(1, seq);

       rs = pstmt.executeQuery();

       if(rs.next()){
            subject = rs.getString("subject");
            writer = rs.getString("writer");
            mail = rs.getString("mail").equals("@") ? "" : "(" + rs.getString("mail") + ")";
            wip = rs.getString("wip");
            wdate = rs.getString("wdate");
            hit = rs.getString("hit");
            content = rs.getString("content") == null ? "" : rs.getString("content").replaceAll("\n", "<br />");
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
<link rel="stylesheet" type="text/css" href="../css/board_view.css">
</head>

<body background="../images/free_view.jpg" id="back">
<!-- 상단 디자인 -->
<br><br><br><br><br><br><br><br><br><br>
<div class="con_title">
</div>
<div class="con_txt">
   <div class="contents_sub">
      <!--게시판-->
      <div class="board_view">
         <table>
         <tr>
            <th width="10%">제목</th> 
            <td width="60%"><%=subject %></td>
            <th width="10%">등록일</th>
            <td width="20%"><%=wdate %></td>
         </tr>
         <tr>
            <th>글쓴이</th>
            <td><%=writer %></td>
            <th>조회</th>
            <td><%=hit %></td>
         </tr>
         <tr>
            <td colspan="4" height="200" valign="top" style="padding: 20px; line-height: 160%"><%=content %></td>
         </tr>
         </table>
      </div>

      <div class="btn_area">
         <div class="align_left">
            <button type="button" class="btn_list btn_txt02" style="cursor: pointer;" onclick="location.href='board_list1.jsp'">목록</button>
         </div>
         <div class="align_right">
            <button type="button" class="btn_list btn_txt02" style="cursor: pointer;" onclick="location.href='board_modify1.jsp?seq=<%=seq %>'">수정</button>
            <button type="button" class="btn_list btn_txt02" style="cursor: pointer;" onclick="location.href='board_delete1.jsp?seq=<%=seq %>'">삭제</button>
            <button type="button" class="btn_write btn_txt01" style="cursor: pointer;" onclick="location.href='board_write1.jsp'">쓰기</button>
         </div>
      </div>   
      <!--//게시판-->
   </div>
</div>
<!-- 하단 디자인 -->

</body>
</html>
