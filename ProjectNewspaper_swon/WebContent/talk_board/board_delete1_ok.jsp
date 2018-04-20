<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   
   <%@ page import="javax.naming.Context" %>
   <%@ page import="javax.naming.InitialContext" %>
   <%@ page import="javax.naming.NamingException" %>
   <%@ page import="javax.sql.DataSource" %>
   
   <%@ page import="java.sql.Connection" %>
   <%@ page import="java.sql.PreparedStatement" %>
   <%@ page import="java.sql.SQLException" %>
   
<%
      // 남겨진 데이터 처리부분 
      request.setCharacterEncoding("utf-8");
      
      String seq = request.getParameter("seq");
      String password = request.getParameter("password");
      
      System.out.println(seq);
      System.out.println(password);

       Connection conn = null;
       PreparedStatement pstmt = null;
    // 2번 flag 시스템오류
    int flag = 2;
    try{
       Context initCtx = new InitialContext();
       Context envCtx = (Context)initCtx.lookup("java:comp/env");
       DataSource dataSource = (DataSource)envCtx.lookup("jdbc/newspaper");
       
       conn = dataSource.getConnection();
       
       String sql = "delete from free_board where seq=? and password=?";
       pstmt = conn.prepareStatement(sql);
       pstmt.setString(1, seq);
       pstmt.setString(2, password);
       
       int result = pstmt.executeUpdate();
       
       if(result == 0) {
          // 비밀번호 틀림 1번 플래그
          flag = 1;
       } else if(result == 1) {
          // 정상 0번 플래그
          flag = 0;
       }
       //out.println("입력성공");
       
    } catch(NamingException e){
       System.out.println("네이밍 에러 : "+ e.getMessage());
    } catch(SQLException e){
       System.out.println("SQL 에러 : "+ e.getMessage());
    } finally{
         if(pstmt != null) pstmt.close();
         if(conn != null) conn.close();
    }
    
    out.println("<script type='text/javascript'>");
    if(flag == 0) {
    	out.println("alert('글삭제에 성공했습니다.');");     
    	out.println("location.href='board_list1.jsp';");
    } else if(flag == 1) {
    	out.println("alert('비밀번호가 틀립니다.');");
    	out.println("history.back();");
    } else if(flag == 2) {
    	out.println("alert('글삭제에 실패했습니다.');");
    	out.println("history.back();");
    }
    out.println("</script>");
%>