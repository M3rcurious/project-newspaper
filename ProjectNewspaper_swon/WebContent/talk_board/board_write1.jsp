<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<style>
	#back {
	background-size: 100%;
	}
</style>
<link rel="stylesheet" type="text/css" href="../css/board_write.css">
<script type="text/javascript">
   window.onload=function(){
      document.getElementById('submit1').onclick=function(){
         //alert("버튼 클릭");
         if(document.frm.info.checked== false){
            alert(" 동의 하라 ! ");
            // 밑에 코드를 읽지 않고 끝낸다.
            return false;
         }
         if(document.frm.writer.value.trim()==""){
            alert("이름을 입력해라 ");
            return false;
         }
         if(document.frm.subject.value.trim()==""){
            alert("제목을 입력해라 ");
            return false;
         }
         if(document.frm.password.value.trim()==""){
            alert("비번을 입력해라 ");
            return false;
         }
         
         // 전송
         document.frm.submit();
      };
   };

</script>   
</head>
<body background="../images/write_board.jpg" id="back">
<!-- 상단 디자인 -->
<br><br><br><br><br><br><br>
<div class="con_title">
</div>
<div class="con_txt">
   <form action="./board_write1_ok.jsp" method="post" name="frm">
      <div class="contents_sub">   
         <!--게시판-->
         <div class="board_write">
            <table>
            <tr>
               <th class="top">글쓴이</th>
               <td style="border:none"; class="top" colspan="3"><input type="text" name="writer" value="" class="board_view_input_mail" maxlength="5" /></td>
            </tr>
            <tr>
               <th>제목</th>
               <td style="border:none"; colspan="3"><input type="text" name="subject" value="" class="board_view_input" /></td>
            </tr>
            <tr>
               <th>비밀번호</th>
               <td style="border:none"; colspan="3"><input type="password" name="password" value="" class="board_view_input_mail"/></td>
            </tr>
            <tr>
               <th>내용</th>
               <td style="border:none"; colspan="3"><textarea name="content" class="board_editor_area"></textarea></td>
            </tr>
            <tr>
               <th>이메일</th>
               <td style="border:none"; colspan="3"><input type="text" name="mail1" value="" class="board_view_input_mail"/> @ <input type="text" name="mail2" value="" class="board_view_input_mail"/></td>
            </tr>
            </table>
            
            <table>
            <tr>
               <br/>
               <td style="text-align:left;border:none;background-color:f9f9f9;padding:5px">
                  <div style="color: white" style="padding-top:7px;padding-bottom:5px;font-weight:bold;padding-left:7px;font-family: Gulim,Tahoma,verdana;">※ 개인정보 수집 및 이용에 관한 안내</div>
                  <div style="padding-left:10px;">
                     <div style="width:97%;height:95px;font-size:11px;letter-spacing: -0.1em;border:1px solid #c5c5c5;background-color:#fff;padding-left:14px;padding-top:7px;">
                        1. 수집 개인정보 항목 : 회사명, 담당자명, 메일 주소, 전화번호, 홈페이지 주소, 팩스번호, 주소 <br />
                        2. 개인정보의 수집 및 이용목적 : 제휴신청에 따른 본인확인 및 원활한 의사소통 경로 확보 <br />
                        3. 개인정보의 이용기간 : 모든 검토가 완료된 후 3개월간 이용자의 조회를 위하여 보관하며, 이후 해당정보를 지체 없이 파기합니다. <br />
                        4. 그 밖의 사항은 개인정보취급방침을 준수합니다.
                     </div>
                  </div>
                  <div style="padding-top:7px;padding-left:5px;padding-bottom:7px;font-family: Gulim,Tahoma,verdana;">
                     <input type="checkbox" name="info" value="1" class="input_radio"><font color="white">개인정보 수집 및 이용에 대해 동의합니다.</font>
                  </div>
               </td>
            </tr>
            </table>
         </div>
         
         <div class="btn_area">
            <div class="align_left">
               <button type="button" class="btn_list btn_txt02" style="cursor: pointer;" onclick="location.href='board_list1.jsp'">목록</button>
            </div>
            <div class="align_right">
               <button type="button" id="submit1" class="btn_write btn_txt01" style="cursor: pointer;">등록</button>
            </div>
         </div>
         <!--//게시판-->
      </div>
   </form>
</div>
<!-- 하단 디자인 -->

</body>
</html>