<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>index</title>
<link href="./css/index.css" rel="stylesheet"/>
<link href="./css/menu.css" rel="stylesheet"/>
<script type="text/javascript" src="./js/menu.js"></script>

</head>
<body>
	<div class="container">
		<header>
			<%@ include file="menu.jsp"%>
			<!-- jsp:은 출력 결과만 화면에 나옵니다. -->
		</header>
		<div class="main">
			<div class="mainStyle">
				<article>
					<div class="wor">
						<div class="left">
							<h1>남은것</h1>
							<ul>
								<li>xml / json</li>
								<li>관리자페이지</li>
								<li>파일업로드</li>
								<li>스프링-레거시</li>
								<li>lombok</li>
								<li>mybaris</li>
								<li>스프링-부트</li>
								<li>thymeleaf</li>
								<li>jpa</li>
								<li>리눅스</li>
								<li>aws</li>
								<li>vue</li>
							</ul>
						
						</div>
					</div>
					<h1>info</h1>
					<h2>2024-01-19</h2>
					<ul>
						<li>postman</li>
						<li>database development</li>
						<li>dbeaver</li>
						<li>aquerytool</li>
						<li>댓글달기 관계도 그리기</li>
						<li>댓글 테이블 만들기</li>
						<li>댓글달기</li>
						<li>관리자모드 - 회원관리</li>
						<li>관리자모드 - 글관리</li>
					</ul>
					<h2>2024-01-18</h2>
					<ul>
						<li>세션으로 로그인 만들기</li>
						<li>board테이블 변경</li>
						<li>내 정보 보기</li>
					</ul>
				</article>
			</div>
		</div>
		<footer>
		<c:import url="footer.jsp"/>
		</footer>
	</div>
</body>
</html>