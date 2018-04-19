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
	
	#intro{background-color: #000000; color: white;}
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
		<div class="navbar-header">
			<button type="button" class="navbar-toggle collapsed"
				data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"
				aria-expanded="false">
				<span class="icon-bar"></span> 
				<span class="icon-bar"></span> 
				<span class="icon-bar"></span>
			</button>
			<a class="navbar-brand navbar-lg" href="index.jsp"> 
			<img src="images/brand.jpg" alt="Team 피노키오" class="img-responsive">
			</a>
		</div>
		<div class="collapse navbar-collapse"
			id="bs-example-navbar-collapse-1">
			<ul class="nav navbar-nav">
				<li class="active"><a href="home.jsp">홈</a></li>
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
	</nav>
	<!-- home 디자인 -->
	<div class="container">
		<div class="jumbotron">
			<h3 class="text-right">Team 피노키오</h3>
			<h1 id="head" class="text-center">H e a d L i n e</h1>
			<br><br>
			<h2 class="text-center">Visual Novel Game</h2>
			<br>
				
			<br><br><br><br>
			<h6 class="text-center"><a id="intro" class="btn btn-default btn-sm" href="introduction.jsp">게임 소개</a></h6>
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
					<h4>Team 소개</h4><p>팀 피노키오는 열정이 넘치는 <br>4인의 조원으로 구성된 팀입니다.</p>
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