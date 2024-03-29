<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<head>
<meta charset="UTF-8">
<title>디테일디테일</title>

<link href="./css/index.css" rel="stylesheet">
<link href="./css/menu.css" rel="stylesheet">
<link href="./css/detail.css" rel="stylesheet">
<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/xeicon@2.3.3/xeicon.min.css">
<script type="text/javascript" src="./js/menu.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.1/jquery.min.js" integrity="sha512-v2CJ7UaYy4JwqLDIrZUI/4hqeoQieOmAZNXBeQyjo21dadnwR+8ZaIJVT8EE2iyI61OV8e6M8PP2/4hpQINQ/g==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<script type= "text/javascript">
	$(document).ready(function(){
		
		
		$(".commentEdit").click(function(){
			if (confirm('수정하시겠습니까?')) {
				//필요한 값 cno잡기 / 수정한 내용 + 로그인 === 서블릿에서 정리
				let cno = $(this).siblings("cno").val();
				let commnet = $(this).parents(".chead").next().text();
				alert(cno + " : " + comment);
			}
		});
		
		// 24.01.24 댓글 삭제버튼을 눌렀습니다. id 가 아닌 class로 지정 (id로 하면 댓글 한개 지우면 멈춰버림 class는 여러개 가능) 
		$(".commentDelete").click(function(){
			//alert("삭제버튼을 눌렀습니다.");
			// 부모(parent) 객체 찾아가기(delete 바로 위 클래스인 cname) = this 나 (.commentDelete)
			//$(this).parent(".cname").css('color', 'green'); // 내 부모중 cname의 css변경
			//$(this).parent(".cname").text("변경가능"); // 삭제버튼 누르면 이름이 변경가능으로 바뀜
			//let text = $(this).parent(".cname").text(); // val()? text() html()
			
			// 부모 요소 아래 자식 요소 찾기 children()
			//let cno = $(this).parent(".cname").children(".cno").val();
			//let cno = $(this).parent().children(".cno").val();
			// 형제요소 찾기 .siblings() .prev() 바로이전 .next() 바로 다음
			//let cno = $(this).siblings(".cno").val(); // 내 형제요소에 .cno 이름을 찾아줘
			
			if (confirm("삭제 하시겠습니까?")) {
			
			let cno = $(this).prev().val();
			
			// 24.01.24 ajax (각 항목 순서 상관X)
			let point = $(this).closest(".comment");
			// $(this).closest(".comment").hide();
			$.ajax({ 
				url : './commentDel',		// 주소
				type : 'post',				// get or post
				dataType: 'text',			// 수신타입 json
				data: {no : cno},			// 보낼 값
				success:function(result){   // 서버에서 온 값을 날려줌 0 또는 1 
					if(result == 1) {
						//정상 삭제됨 : this의 부모(.comment)를 찾아서 remove 하기
						point.remove(); // 1이었던 cdel을 0으로 바꿔줌
					} else {
						alert("삭제할 수 없습니다. 관리자에 문의바람")
					}
				},
				error:function(request, status, error){ // 통신오류
					alert("문제가 발생했슴다");
				}
			}); // end ajax
				
			}// end if 
			
			
		
		});
		
		// 댓글쓰기 버튼 누르면 댓글창 나오게 하기 24.01.24
		$(".comment-write").hide(); // ready바로 아래 두는걸 추천
		$(".xi-comment-o").click(function(){
			$(".xi-comment-o").hide();
			//$(".comment-write").show();
			$(".comment-write").slideToggle('slow');
		});
		
		// alert("준ㅂㅣ완료");
		$("#comment-btn").click(function(){
			let content = $("#commentcontent").val();
			let bno = ${detail.no };// 여기는 글번호
			// alert("content : " + content + " no : " + no);
			// 가상 form 만들기 = 동적생성 (어려워요)
			// 전송 --> content가 5글자 이상인 경우 실행하게 만들겠습니다.
			if(content.length < 5){
				 alert("5글자 이상 쓰세요.");
				$("#commentcontent").focus();
				// return false; 멈추기 위해 false를 적어야 하지만 어차피 멈추므로 안써도 무방
			} else {
				let form = $('<form></form>');
				form.attr('name', 'form'); /* attr은 속성지정  */
				form.attr('method', 'post');
				form.attr('action', './comment');
				
				form.append($('<input/>', {type: 'hidden', name: 'commentcontent', value: content})); // json형태 
				form.append($('<input/>', {type: 'hidden', name: 'bno', value: bno}));
				
				form.appendTo("body");
				form.submit();

				
				// 어려운 방식
				/* let form = document.createElement('form');
				form.name='form';
				form.method='post';
				form.action='./comment';
				
				// 붙이기
				let text = document.createElement('input');
				text.setAttribute("type", "hidden");
				text.setAttribute("name", "commentcontent");
				text.setAttribute("value", content); // $("#commentcontent").val() 써도 됨
				
				// 붙이기
				let no = document.createElement('input');
				no.setAttribute("type", "hidden");
				no.setAttribute("name", "bno");
				no.setAttribute("value", ${detail.no }); //bno로 써도 됨
				
				// form에 붙이기
				form.appendChild(text);
				form.appendChild(no);
				
				// 전송하기
				document.body.appendChild(form);
				form.submit(); */
			}
		});
	});
</script>


</head>
<body>
	<div class="container">
		<header>
			<%@ include file="menu.jsp"%>
		</header>
		<div class="main">
			<div class="mainStyle">
				<article>
					<div class="detailDIV">
						<div class="detailTITLE">
							${detail.title }
						</div>
						<div class="detailWRITECOUNT">
							<div class="detailWRITE">
							${detail.write }
							
							<c:if test="${sessionScope.mname ne null && detail.mid eq sessionScope.mid }">
								<img alt="수정" src="./img/edit.png" onclick="commentEdit" >
								<img alt="삭제" src="./img/delete.png" onclick="commentDelete">
							</c:if>
							
							</div>
							<div class="detailCOUNT">${detail.ip} / ${detail.count }</div>
						</div>
						<div class="detailCONTENT">
							${detail.content }
						</div>
					</div>
					
					
					<c:if test="${sessionScope.mid ne null }">
					<button class="xi-comment-o">댓글쓰기</button>
					<!-- 댓글쓰는 창 만들기. 댓글내용, 누가, 어느 2024.01.22 -->
					<div class="comment-write">
						<div class="comment-form">
							<textarea id="commentcontent" name="commentcontent"></textarea>
							<button id="comment-btn">댓글쓰기</button>
						</div>
					</div>
					</c:if>
					
					<!-- 댓글 출력창-->
					<div class="comments">
						<c:forEach items="${commentList }" var="co"> 
							<div class="comment">
							<div class="chead">
								<div class="cname">${co.mname } 님 
								<c:if test="${sessionScope.mname ne null && co.mid eq sessionScope.mid }">
									<input type="hidden" class="cno" value="${co.cno }">
									<img alt="삭제" src="./img/delete.png" class="commentDelete">
									<img alt="수정" src="./img/edit.png" class="commentEdit">
								</c:if><div class="cdate">${co.ip} /${co.cdate }</div></div>
							</div>
							<div class="ccomment">${co.comment }</div>
							</div>
						</c:forEach>
			
					</div>
					<button onclick="url('./board?page=${param.page}')"> 게시판으로 돌아가기</button>
				</article>
				<article>
				푸터에 숨은 녀석 보이기
				</article>

			</div>
		</div>

	</div>
	<script type="text/javascript">
		function del(){
			//alert("진짜로 삭제합니다?");
			var ch = confirm("진짜 삭제?"); /* 예=true 아니오=false 처리 */
			if(ch){
				location.href="./delete?no=${detail.no }";
			}
		}
		
		function update() {
			if(confirm("진짜 수정?")){
				location.href="./update?no=${detail.no}";
			}
		}
		
	// 24.01.24 다른삭제 기능 만들려고 주석처리	function commentDel(cno){if(confirm("댓글 삭제?")){location.href='./commentDel?no=${detail.no}&cno='+cno;}}
		
	</script>      
	<footer> 
	<c:import url="footer.jsp"/>
	</footer>
</body>
</html>