<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../layout/header.jsp"%>
<div class="d-flex justify-content-center">
	<div style="width: 400px;">
		<form>
			<div class="mb-3 mt-3">
				<input id="username" type="text" class="form-control" placeholder="Enter username">
			</div>
			<div class="mb-3">
				<input id="password" type="password" class="form-control" placeholder="Enter password">
			</div>
			<div class="d-flex justify-content-center">
				<button id="btnPersonJoin" type="button" class="btn btn-primary" style="margin-right: 30px">개인
					회원가입</button>
				<button id="btnCompanyJoin" type="button" class="btn btn-primary">기업 회원가입</button>
			</div>
			<div class="d-flex justify-content-center">
				<button id="btnLogin" type="button" class="btn btn-primary" style="margin-top: 20px">로그인</button>
			</div>

		</form>
	</div>
</div>

<script>


	$("#btnLogin").click(()=>{
		let username = $("#username").val();
		let password = $("#password").val();
		
		let data={
				username : username,
				password : password
		};
		
		$.ajax("/login", {
			type: "POST",
			dataType: "json",
			data: JSON.stringify(data),
			headers: {
				"Content-Type": "application/json"
			}
		}).done((res) => {
			if (res.code == 1) {
				alert("성공!");
				location.href = "/loginForm";
			}
			else
				alert("아이디 혹은 비밀번호를 다시 입력하세요!");
		});
	});

</script>
<%@ include file="../layout/footer.jsp"%>