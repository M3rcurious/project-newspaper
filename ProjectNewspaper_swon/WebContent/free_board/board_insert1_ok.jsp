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
      //넘겨진 데이터 처리부분
      request.setCharacterEncoding("utf-8");

      String subject = request.getParameter("subject");
      String writer = request.getParameter("writer");
      String mail = request.getParameter("mail1") + "@" + request.getParameter("mail2");
      String password = request.getParameter("password");
      String content = request.getParameter("content");
      String wip = request.getRemoteAddr();
             
    Connection conn = null;
    PreparedStatement pstmt = null;     
    
    try{
       Context initCtx = new InitialContext();
       Context envCtx = (Context)initCtx.lookup("java:comp/env");
       DataSource dataSource = (DataSource)envCtx.lookup("jdbc/newspaper");
       
       conn = dataSource.getConnection();
       
       String sql = "insert into free_board values(board_seq.nextval, ?, ?, ?, ?, ?, 0, ?, sysdate)";
       
       pstmt = conn.prepareStatement(sql);
       // 글쓰기 100개 구문
       for(int i = 1; i <=100; i++){
       pstmt.setString(1, "제목" + i);
       pstmt.setString(2, "이름");
       pstmt.setString(3, "test@test.com");
       pstmt.setString(4, "1234");
       pstmt.setString(5, "내용");
       pstmt.setString(6, "000.000.000.000");
       
       pstmt.executeUpdate();
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
      out.println("alert('글쓰기에 성공하셨습니다.')");
      out.println("location.href='board_list1.jsp';");
  	  out.println("</script>");
%>