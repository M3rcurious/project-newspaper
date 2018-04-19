<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="css/bootstrap.css">
<link rel="stylesheet" href="css/custom.css">
<title>home</title>
<style type="text/css">
	body {
		background: url(images/bg.jpg) no-repeat center center fixed;
		-webkit-background-size: cover;
		-moz-background-size: cover;
		-o-background-size: cover;
		background-size: cover;
	}
	
	.jumbotron {
		background-image: url('images/border.jpg');
		background-size: cover;
		text-shadow: black 0.1em 0.1em 0.1em;
		color: white;
	}

</style>
</head>
<body>
	<%
		String userID = null;
		if (session.getAttribute("userID") != null) {
			userID = (String) session.getAttribute("userID");
		}
	%>

	<nav class="navbar navbar-default">
		<div class="navbar-header">
			<button type="button" class="navbar-toggle collapsed"
				data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"
				aria-expanded="false">
				<span class="icon-bar"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span>
			</button>
		 	<a class="navbar-brand navbar-lg" href="index.jsp">
		 		<img alt="Team 피노키오" src="images/brand.jpg" class="img-responsive">
		 	</a>
		</div>
		<div class="collapse navbar-collapse"
			id="bs-example-navbar-collapse-1">
			<ul class="nav navbar-nav">
				<li><a href="home.jsp">홈</a></li>
				<li><a href="introduction.jsp">게임소개</a></li>
				<li class="active"><a href="team.jsp">팀원소개</a></li>

				<li class="dropdown"><a href="#" class="dropdown-toggle"
					data-toggle="dropdown" role="button" aria-haspopup="true"
					aria-expanded="false">게시판<span class="caret"></span></a>
					<ul class="dropdown-menu">
						<li><a href="freeboard.jsp">자유게시판</a></li>
						<li><a href="talkboard.jsp">토론게시판</a></li>
					</ul></li>
			</ul>

			<%
				if (userID == null) {
			%>
			<ul class="nav navbar-nav navbar-right">
				<li class="dropdown"><a href="#" class="dropdown-toggle"
					data-toggle="dropdown" role="button" aria-haspopup="true"
					aria-expanded="false">접속하기<span class="caret"></span></a>
					<ul class="dropdown-menu">
						<li><a href="login.jsp">로그인</a></li>
						<li><a href="join.jsp">회원가입</a></li>
					</ul></li>
			</ul>
			<%
				} else {
			%>
			<ul class="nav navbar-nav navbar-right">
				<li class="dropdown"><a href="#" class="dropdown-toggle"
					data-toggle="dropdown" role="button" aria-haspopup="true"
					aria-expanded="false">접속관리<span class="caret"></span></a>
					<ul class="dropdown-menu">
						<li><a href="logout.jsp">로그아웃</a></li>
					</ul></li>
			</ul>
			<%
				}
			%>

		</div>
	</nav>
	<!-- 디자인 -->
	<div class="container">
		<div class="jumbotron">
			<h1 class="text-center">피노키오 <br>팀원 소개</h1>
		</div>
	
		<!-- modal 디자인 -->
		<div class="row">
			<div class="col-xs-6" style="border-style: solid; color: white; text-align: center; background-color: black;">
				<h3>박세준</h3>
				<h4>[Project Manager]</h4>
				<h4><a class="btn btn-default" data-target="#modal1" data-toggle="modal">상세 정보</a></h4>
			</div>
			<div class="col-xs-6" style="border-style: solid; color: white; text-align: center; background-color: black;">
				<h3 style="color: #ffffff;">강석원</h3>
				<h4>[Game Developer]</h4>
				<h4><a class="btn btn-default" data-target="#modal2" data-toggle="modal">상세 정보</a></h4>
			</div>
			<div class="col-xs-6" style="border-style: solid; color: white; text-align: center; background-color: black;">
				<h3 style="color: #ffffff;">형성철</h3>
				<h4>[Graphic Designer]</h4>
				<h4><a class="btn btn-default" data-target="#modal3" data-toggle="modal">상세 정보</a></h4>
			</div>
			<div class="col-xs-6" style="border-style: solid; color: white; text-align: center; background-color: black;">
				<h3 style="color: #ffffff;">이호길</h3>
				<h4>[Web Developer]</h4>
				<h4><a class="btn btn-default" data-target="#modal4" data-toggle="modal">상세 정보</a></h4>
			</div>
		</div>
		<hr> <!-- 한줄 긋기 -->	
	</div>	
	
	<div class="row">
		<div class="modal" id="modal1" tabindex="-1">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header" style="text-align: center;">
						<h3>Project Manager</h3>
						<button class="close" data-dismiss="modal">&times;</button>
					</div>
					<div class="modal-body" style="text-align: center;">
						<h4 style="border-style: solid;">
						박세준<br>
						나이 : 29살<br>
						사는 곳 : 부천<br>
						포지션 : PM, 게시판 개발<br>
						좌우명 : 자라나라 머리머리<br>
						</h4>
						<img src="images/team1.jpg" id="teamimage1" 
						style="width: 160px; height: 200px;">
					</div>
				</div>
			</div>
		</div>
	</div>

	<div class="row">
		<div class="modal" id="modal2" tabindex="-1">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header" style="text-align: center;">
						<h3>Game Developer</h3>
						<button class="close" data-dismiss="modal">&times;</button>
					</div>
					<div class="modal-body" style="text-align: center;">
						<h4 style="border-style: solid;">
						강석원<br>
						나이 : 28살<br>
						사는 곳 : 인천<br>
						포지션 : 게임 개발<br>
						좌우명 : 과정의 미화는 결과를 내지 못한 자들의 변명<br>
						</h4>
						<img src="images/team2.jpg" id="teamimage1" 
						style="width: 160px; height: 200px;">
					</div>
				</div>				
			</div>
		</div>
	</div>

	<div class="row">
		<div class="modal" id="modal3" tabindex="-1">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header" style="text-align: center;">
						<h3>Graphic Designer</h3>
						<button class="close" data-dismiss="modal">&times;</button>
					</div>
					<div class="modal-body" style="text-align: center;">
						<h4 style="border-style: solid;">
						형성철<br>
						나이 : 29살<br>
						사는 곳 : 광명<br>
						포지션 : 그래픽 디자인<br>
						좌우명 : 한번 더 나에게 질풍같은 용기를<br>
						</h4>
						<img src="images/team3.jpg" id="teamimage1" 
						style="width: 160px; height: 200px;">
					</div>
				</div>				
			</div>
		</div>
	</div>

	<div class="row">
		<div class="modal" id="modal4" tabindex="-1">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header" style="text-align: center;">
						<h3>Web Developer</h3>
						<button class="close" data-dismiss="modal">&times;</button>
					</div>
					<div class="modal-body" style="text-align: center;">
						<h4 style="border-style: solid;">
						이호길<br>
						나이 : 28살<br>
						사는 곳 : 안산<br>
						포지션 : 웹 개발<br>
						좌우명 : 매순간 최선을 다하자<br>
						</h4>
						<img src="images/team4.jpg" id="teamimage1" 
						style="width: 160px; height: 200px;">
					</div>
				</div>				
			</div>
		</div>
	</div>
			
	<footer style="background-color: #000000; color: #ffffff;"> <!-- style = css 추가 -->
		<div class="container">
			<br>
			<div class="row">
				<div class="col-sm-2" style="text-align: center;">
					<h4>Copyright &copy; <br>Team 피노키오</h4><h4>2018. 05</h4>
				</div>
				<div class="col-sm-4" style="text-align: center;">
					<h4>Team 소개</h4><p>팀 피노키오는 열정이 넘치는 <br>4인의 팀원으로 구성된 팀입니다.</p>
				</div>
				<div class="col-sm-2"><h4 style="text-align: center;">소개</h4>
					<div class="list-group">
						<a href="introduction.jsp" class="list-group-item">게임소개</a>
						<a href="team.jsp" class="list-group-item">팀소개</a>
					</div>
				</div>
				
				<div class="col-sm-2"><h4 style="text-align: center;">게시판</h4>
					<div class="list-group">
						<a href="team.jsp" class="list-group-item">자유게시판</a>
						<a href="team.jsp" class="list-group-item">토론게시판</a>
					</div>
				</div>
				
				<div class="col-sm-2">
					<h4 style="text-align: center;">
						<img class="img-thumbnail" src="images/19.png" alt="Team 피노키오" class="img-responsive">
					</h4>
				</div>
			</div>
		</div>
	</footer>

	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="js/bootstrap.js"></script>
</body>
</html>