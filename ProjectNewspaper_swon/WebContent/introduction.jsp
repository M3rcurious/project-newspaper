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
				<li class="active"><a href="introduction.jsp">게임소개</a></li>
				<li><a href="team.jsp">팀원소개</a></li>

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
			<h1 class="text-center">HeadLine <br>게임 소개</h1>
		</div>
	</div>

	<div class="container">
	<div id="myCarousel" class="carousel slide" data-ride="carousel">
		<ol class="carousel-indicators">
			<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
			<li data-target="#myCarousel" data-slide-to="1"></li>
			<li data-target="#myCarousel" data-slide-to="2"></li>
		</ol>
		<div class="carousel-inner">
			<div class="item active">
				<img src="images/1.jpg" style="width:100%;">
				<div class="carousel-caption" >
					<h2>탄탄한 스토리의 게임</h2>
					<p>비주얼 노벨 게임의 진수!</p>		
				</div>
			</div>
			<div class="item">
				<img src="images/3.jpg" style="width:100%;">
				<div class="carousel-caption" >
					<h2>기자가 되어 사건을 파헤쳐라!</h2>
					<p>당신의 선택이 사건을 좌지우지한다.</p>		
				</div>
			</div>
			<div class="item">
				<img src="images/2.jpg" style="width:100%;">
				<div class="carousel-caption" >
					<h3>인물의 심리를 파악하라!</h3>
					<p>누군가는 당신을 속이고 있다.</p>		
				</div>
			</div>
		</div>
			
		<a class="left carousel-control" href="#myCarousel"	data-slide="prev">
			<span class="glyphicon glyphicon-chevron-left"></span>
		</a>	
		
		<a class="right carousel-control" href="#myCarousel" data-slide="next">
			<span class="glyphicon glyphicon-chevron-right"></span>
		</a>
		
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