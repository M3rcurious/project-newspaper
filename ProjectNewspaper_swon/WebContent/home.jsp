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
		background: url(images/border.jpg) no-repeat center center fixed;
		-webkit-background-size: cover;
		-moz-background-size: cover;
		-o-background-size: cover;
		background-size: cover;
	}

	.jumbotron {
		background-image: url('images/3.jpg');
		background-size: cover;
		text-shadow: black 0.2em 0.2em 0.2em;
		color: white;
		font-size: 100%;
	}
	
	/* #intro{background-color: #000000; color: white;} */
	#head{font-size: 100px;}
	
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
		<div class="container-fluid">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle collapsed" data-toggle="collapse"
				 data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
					<span class="sr-only"></span>
					<span class="icon-bar"></span> 
					<span class="icon-bar"></span> 
					<span class="icon-bar"></span>
				</button>
				<a class="navbar-brand navbar-lg" href="index.jsp"> 
				<img src="images/brand.jpg" alt="Team 피노키오" class="img-responsive">
				</a>
			</div>

			<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
				<ul class="nav navbar-nav">
					<li class="active"><a href="home.jsp">홈</a><span class="sr-only"></span></li>
					<li><a href="introduction.jsp">게임소개</a></li>
					<li><a href="team.jsp">팀원소개</a></li>
	
					<li class="dropdown"><a href="#" class="dropdown-toggle"
						data-toggle="dropdown" role="button" aria-haspopup="true"
						aria-expanded="false">게시판<span class="caret"></span></a>
						<ul class="dropdown-menu">
							<li><a href="freeboard.jsp">자유게시판</a></li>
							<li><a href="talkboard.jsp">토론게시판</a></li>
						</ul>
					</li>
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
		</div>
	</nav>
	<!-- home 디자인 -->
	<div class="container">
		<div class="jumbotron">
			<h3 class="text-right">Team 피노키오</h3>
			<h1 id="head" class="text-center">HeadLine</h1>
			<br><br>
			<h2 class="text-center">Visual Novel Game</h2>
			<br>
		</div>
		<!-- modal 디자인 -->
		<div class="row">
			<div class="col-md-4" style="color: white;">
				<h4>게임 특징</h4>
				<p>플레이어의 컨텐츠에 <br>대해서 소개해드립니다.</p>
				<p><a class="btn btn-default" data-target="#modal1" data-toggle="modal">자세히 알아보기</a></p>
			</div>
			<div class="col-md-4" style="color: white;">
				<h4>개발 의도</h4>
				<p>이 게임을 개발한 의도에 <br>대해서 소개해드립니다.</p>
				<p><a class="btn btn-default" data-target="#modal2" data-toggle="modal">자세히 알아보기</a></p>
			</div>
			<div class="col-md-4" style="color: white;">
				<h4>팀원 구조</h4>
				<p>열정이 넘치고 유쾌한 사람들로 구성된 <br>4명의 피노키오 구성원을 소개합니다.</p>
				<p><a class="btn btn-default" data-target="#modal3" data-toggle="modal">자세히 알아보기</a></p>
			</div>
		</div>
		<hr> <!-- 한줄 긋기 -->		
	</div> 

	<div class="row">
		<div class="modal" id="modal1" tabindex="-1">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						게임 특징
						<button class="close" data-dismiss="modal">&times;</button>
					</div>
					<div class="modal-body" style="text-align: center;">
						<h4>
						1. 플레이어는 기자가 되어 사건을 취재하고 기사를 작성하는 게임<br>
						2. 추리와 퍼즐 요소를 가미한 비주얼 노벨 어드벤처 게임<br>
						3. 본인의 선택지에 따라 달라지는 결말(멀티 엔딩 시스템)<br>
						</h4>
						<img src="images/modal1.png" id="modalimage1" 
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
					<div class="modal-header">
						개발 의도
						<button class="close" data-dismiss="modal">&times;</button>
					</div>
					<div class="modal-body" style="text-align: center;">
						<h4>
						1. 우리는 언론을 얼마나 신용하고 있는가?<br>
						2. 정의로운 저널리즘이 무엇인지 생각하도록<br> 
						3. 글이 얼마나 무서운 힘을 가지고 있는지 알도록<br>
						</h4>
						<img src="images/modal2.jpg" id="modalimage2" 
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
					<div class="modal-header">
						팀원 구조
						<button class="close" data-dismiss="modal">&times;</button>
					</div>
					<div class="modal-body" style="text-align: center; width: auto;">
						<h4>
						Team 피노키오<br><br>
						</h4>					
						<img src="images/modal3.jpg" id="modalimage3" 
						style="width: 300px; height: 256px;">
					</div>
				</div>
			</div>
		</div>
	</div>	
	
	<footer style="background-color: #000000; color: #ffffff"> <!-- style = css 추가 -->
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