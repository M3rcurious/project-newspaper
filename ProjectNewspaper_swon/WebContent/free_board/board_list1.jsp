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
         //cpage 검사         
         int cpage = 1;
         if(request.getParameter("cpage") != null && !request.getParameter("cpage").equals("")){
            cpage = Integer.parseInt(request.getParameter("cpage"));
         }         
         //페이지 알고리즘 변수 선언
         //한 페이지당 데이터 수 정함
         int recordPerPage = 10;
         // 전체 데이터 갯수
         int totalRecord = 0;
         // 전체 페이지 갯수
         int totalPage = 1;
         // 페이지당 출력 페이지 갯수
         int blockPerPage = 5;
         
       Connection conn = null;
       PreparedStatement pstmt = null;
       ResultSet rs = null;
       
       StringBuffer html = new StringBuffer();
       
       try{
          Context initCtx = new InitialContext();
          Context envCtx = (Context)initCtx.lookup("java:comp/env");
          DataSource dataSource = (DataSource)envCtx.lookup("jdbc/newspaper");
          
          conn = dataSource.getConnection();
          
          String sql = "select seq, subject, writer, wdate, hit, date_add(now(),interval-1 day) as wgap from free_board order by seq desc";
          
          pstmt = conn.prepareStatement(sql, ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);                                    
          
          rs = pstmt.executeQuery();
                                
          rs.last();
          totalRecord = rs.getRow();
          rs.beforeFirst();
          
          
          totalPage = ((totalRecord -1) / recordPerPage) + 1;
          
            //skip
          int skip = (cpage-1) * recordPerPage;
        	//resultSet에서 데이터의 위치를 선택해주는 메서드
          if(skip != 0) rs.absolute(skip);
                   
                   
          for(int i = 0; i<recordPerPage && rs.next(); i++){
             String seq = rs.getString("seq");
             String subject = rs.getString("subject");
             String writer = rs.getString("writer");
             String wdate = rs.getString("wdate");
             String date = wdate.replace("-", ".").substring(0, 16);
             String hit = rs.getString("hit");
             int wgap = rs.getInt("wgap");
             
            html.append("<tr>");
            html.append("   <td>&nbsp;</td>");
            html.append("   <td>"+seq+"</td>");
            html.append("   <td class='left'>");
            html.append("<a href='board_view1.jsp?seq="+seq+"&cpage="+ cpage +"'>"+subject+"</a>&nbsp;");
            if(wgap == 0){
            html.append("   <img src='../images/icon_hot.gif' alt='HOT'>");
            }
            html.append("   </td>");
            
            html.append("   <p1><td>"+writer+"</td><p1>");
            html.append("   <td>"+date+"</td>");
            html.append("   <td>"+hit+"</td>");
            html.append("   <td>&nbsp;</td>");
            html.append("</tr>");
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
<meta name="viewport" content="width=device-width,initial-scale=1.0 ,minimum-scale=1.0 ,maximum-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<style>
	#back {
	background: url(../images/free_view.jpg); 
 	-webkit-background-size: cover;
  	-moz-background-size: cover;
  	-o-background-size: cover;
  	background-size: cover;
	}	
	
</style>
<script type="text/javascript" src="../js/jquery-3.3.1.js" ></script>
<script type="text/javascript" src="../js/jquery-ui.js" ></script>
<script type = "text/javascript">
   window.onload = function(){
  
};
</script>
<link rel="stylesheet" type="text/css" href="../css/board_list.css">
<link rel="stylesheet" href="../css/base/jquery-ui.css" />
</head>

<body background="" id="back">

<!-- 상단 디자인 -->
<div class="con_title">
</div>
<form action="board_write1.jsp" method="post" name="frm" >
   <input type ="hidden" name = "cpage" value="<%=cpage %>"/>
<div class="con_txt">
   <div class="contents_sub">
      <div class="board_top">
         <div class="bold"><span class="txt_orange"></span></div>
      </div>
      <!--게시판-->  
      <div class="board" height="50%">
         <table>
         <tr>
            <th width="3%">&nbsp;</th>
            <th width="5%">번호</th>
            <th>제목</th>
            <th width="10%">글쓴이</th>
            <th width="27%">등록일</th>
            <th width="5%">조회</th>
            <th width="3%">&nbsp;</th>
         </tr>            
         <!-- 시작 -->
         <tr>
            <td>&nbsp;</td>
            <td>1</td>
            <td class="left"><a href="board_view1.jsp">공지사항</a>&nbsp;<img src="../images/icon_hot.gif" alt="HOT"></td>
            <td>울고싶어라</td>
            <td>0000.00.00 00:00</td>
            <td>1</td>
            <td>&nbsp;</td>
         </tr>
         <!-- 끝 -->             
         <%= html %>  
         </table>            
      <!--//게시판-->
      <div class="align_right"> 
              
         <button type="button" id="submit1" class="btn_write btn_txt01" style="cursor: pointer;" onclick="location.href='board_write1.jsp?cpage=<%=cpage%>'">쓰기</button>
      </div>
            <!--페이지넘버-->     
      <div class="paginate_regular">
         <div class="board_pagetab" align="absmiddle" >   
         <%
         int startBlock = ((cpage-1)/blockPerPage)*blockPerPage + 1;
         int endBlock = ((cpage-1)/blockPerPage)*blockPerPage + blockPerPage;
         if(endBlock >= totalPage){//마지막 페이지가 blockPerPage 만큼 나오지 않기 떄문에 검사를 실시함
            endBlock = totalPage;
         }
         if(startBlock == 1){
            out.println("<span class='off'>&lt;&lt;</span>");
         } else {
            out.println("<span class='on'><a href='./board_list1.jsp?cpage="+(startBlock - blockPerPage)+"'>&lt;&lt;</a></span>");
         }
         %>
         &nbsp;
   <%
   if(cpage==1){
      out.println("<span class='on'>&lt;</span>");
   }else {
      out.println("<span class='on'><a href='./board_list1.jsp?cpage="+(cpage -1)+"'>&lt;</a></span>");
   }
   %>
   &nbsp;&nbsp;
   <% 
      for(int i = startBlock; i <= endBlock; i++){
         if(cpage==i){
            out.println("<span class='on'>[" + i + "]</span>");   
         }else{
            out.println("<span class='off'><a href='./board_list1.jsp?cpage="+i+"'>"+i+"</a></span>");
         }
      }
   %>
   &nbsp;&nbsp;
   <%
   if(cpage==totalPage){
      out.println("<span class='on'>&gt;</span>");
   }else {
      out.println("<span class='on'><a href='./board_list1.jsp?cpage="+(cpage +1)+"'>&gt;</a></span>");
   }
   %>
   <%
      if(endBlock == totalPage){
         out.println("<span class='off'>&nbsp;&gt;&gt;</span>");
      }else{
         out.println("<span class='on'><a href='./board_list1.jsp?cpage="+(startBlock + blockPerPage)+"'></a></span>");
      }
   %>
      &nbsp;   
         </div>
      </div>
      <!--//페이지넘버-->
   </div>
</div>
<!--//하단 디자인 -->

</body>
</html>