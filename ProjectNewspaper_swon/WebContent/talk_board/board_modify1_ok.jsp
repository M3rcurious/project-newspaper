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
         request.setCharacterEncoding("utf-8");
         
         String seq = request.getParameter("seq");
         String password = request.getParameter("password");
         String content = request.getParameter("content");
         String subject = request.getParameter("subject");
         String mail = request.getParameter("mail1")+"@"+request.getParameter("mail2");
         System.out.println(seq);
         System.out.println(password);
         System.out.println(content);
         
         
         Connection conn = null;
       PreparedStatement pstmt = null; 
       
       int flag = 2; //임의로 만든 값
       
       try{
          Context initCtx = new InitialContext();
          Context envCtx = (Context)initCtx.lookup("java:comp/env");
          DataSource dataSource = (DataSource)envCtx.lookup("jdbc/newspaper");
          
          conn = dataSource.getConnection();
          
          String sql = "update free_board set subject = ?, mail = ?, content = ? where seq = ? and password = ?";
          
          pstmt = conn.prepareStatement(sql);
         
          pstmt.setString(1, subject);
          pstmt.setString(2, mail);
          pstmt.setString(3, content);
          pstmt.setString(4, seq);
          pstmt.setString(5, password);
          
          int result = pstmt.executeUpdate();
         
         if(result == 0){
            // 비밀번호 오류
            flag = 1;
         }else if(result == 1){
            //정상
            flag = 0;
         }
          
       } catch(NamingException e){
          System.out.println("네이밍 에러 : "+ e.getMessage());
       } catch(SQLException e){
          System.out.println("SQL 에러 : "+ e.getMessage());
       } finally{
         if(pstmt != null) pstmt.close();
         if(conn != null) conn.close();
       }
      
      out.println("<script type='text/javascript'>");
      if(flag == 0){
         out.println("alert('수정에 성공하셨습니다.')");
         out.println("location.href='board_list1.jsp?seq="+seq+"'");
      }else if(flag == 1){
         out.println("alert('비밀번호 잘못되었습니다.')");
         out.println("history.back();");
      }else{
         out.println("alert('글 수정 실패했습니다.')");
         out.println("history.back();");
      }
      out.println("</script>");
   %>