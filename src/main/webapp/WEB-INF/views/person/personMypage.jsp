<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link rel="stylesheet" href="css/main.css">

<%@ include file="../layout/header.jsp"%>


<head>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>구직자 마이페이지</title>
<!-- Favicon-->
<link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
<!-- Bootstrap icons-->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css"
	rel="stylesheet" />
<!-- Core theme CSS (includes Bootstrap)-->
<link href="css/main_styles.css" rel="stylesheet" />
<style>
.flex {
	display: flex;
}

.personJoin_container .flex .mypage_topbutton {
	padding: 8px;
	width: 135px;
	margin: 10px;
	border-radius: 00.25rem;
	border: 0;
	color: white;
	background-color: lightslategray;
	;
}

.personJoin_container .flex .mypage_topbutton:hover {
	background-color: #0d6efd;
}

.personJoin_container {
	margin: 50px;
	width: 1200px;
	border: 2px solid lightslategray;
	padding: 60px 100px;
}

.personJoin_container p {
	text-align: center;
	width: 100px;
	margin-bottom: 40px;
	border: 2px solid lightslategray;
	padding: 3px;
}

.personJoin_container .d-flex p:last-child {
	color: lightslategray;
}

.personJoin_container .d-flex :first-child {
	color: white;
	background-color: lightslategray;
}

.personJoin_container form {
	padding: 0 200px;
}

.d-flex {
	margin-bottom: 30px;
}

.personJoin_container .input-group span {
	width: 130px;
	text-align: center;
}

.custom_box {
	display: flex;
	width: 600px;
}

.custom_box p {
	padding: 0.375rem 0.75rem;
	margin-bottom: 15px;
}

.custom_box span select {
	width: 150px;
	border-left: 0;
	border-radius: 0 0.25rem 0.25rem 0;
}

.custom_box p:first-child {
	text-align: left;
	border-radius: 0.25rem 0 0 0.25rem;
	width: 130px;
	background-color: #e9ecef;
	border: 1px solid #ced4da;
}

.custom_box p:last-child {
	border-radius: 0 0.25rem 0.25rem 0;
	width: 470px;
	border: 1px solid #ced4da;
	border-left: 0;
}

.custom_box .gender span {
	margin: 0 30px;
}

.custom_box .gender:first-child {
	border-radius: 0.25rem;
}

.custom_box .gender:last-child {
	border: 0;
}

.custom_box .custom_box_skill {
	margin: 15px 0 40px 0;
}

.line {
	width: 597px;
	border-bottom: 2px solid lightslategray;
	margin: 25px 0;
}

.form-check {
	display: block;
	min-height: 0.3rem;
	padding-left: 0;
	margin-bottom: 0.1rem;
}

.btn_login {
	margin-top: 10px;
	padding: 8px 205px;
	border: 1px solid lightslategray;
	border-radius: 5%;
}

.personJoin_container .d-flex :first-child:hover {
	background-color: #0d6efd;
}
</style>
</head>


<div class="d-flex justify-content-center">

	<div class="personJoin_container">
		<form>
			<input id="userId" type="hidden" value="${personMyPageDto.userId}">
			<div class="input-group mb-3">
				<span class=" input-group-text"> 아이디 </span> <input type="text"
					class="form-control" value="${personMyPageDto.username}"
					readonly="readonly">
			</div>
			<div class="input-group mb-3">
				<span class="input-group-text">비밀번호</span> <input id="password"
					type="password" class="form-control" placeholder="비밀번호를 입력해주세요"
					value="${personMyPageDto.password}">
			</div>
			<div class="input-group mb-3">
				<span class="input-group-text">비밀번호 확인</span> <input
					id="passwordCheck" type="password" class="form-control"
					placeholder="비밀번호를 확인해주세요" value="${personMyPageDto.password}">
			</div>
			<div class="input-group mb-3">
				<span class=" input-group-text"> 이름 </span> <input id="personName"
					type="text" class="form-control" placeholder="이름을 입력해주세요"
					value="${personMyPageDto.personName}">
			</div>
			<div class="input-group mb-3">
				<span class=" input-group-text"> 연락처 </span> <input id="personPhone"
					type="number" class="form-control" placeholder="연락처를 입력해주세요"
					value="${personMyPageDto.personPhone}">
			</div>
			<div class="custom_box input-group mb-3">
				<span class=" input-group-text"> 성별 </span> <input id="isGender"
					type="text" class="form-control"
					value="${personMyPageDto.isGender =='0' ? '여자' : '남자' }" readonly="readonly">
			</div>
			<div class="input-group mb-3">
				<span class=" input-group-text"> 거주지 </span> <input id="address"
					type="text" class="form-control" placeholder="거주지를 입력해주세요"
					value="${personMyPageDto.address }">
			</div>
			<div class="custom_box">
				<p>학력</p>
				<span><select class="form-select" id="degree">
						<option ${personMyPageDto.degree =='고졸' ? "selected" : ""}>고졸</option>
						<option ${personMyPageDto.degree =='대졸 전공' ? "selected" : ""}>대졸
							전공</option>
						<option ${personMyPageDto.degree =='대졸 비전공' ? "selected" : ""}>대졸
							비전공</option>
				</select></span>
			</div>
			<div class="custom_box">
				<p>경력</p>
				<span><select id="career" class="form-select">
						<option value="0"
							${personMyPageDto.career =='0' ? "selected" : ""}>신입</option>
						<option value="1"
							${personMyPageDto.career =='1' ? "selected" : ""}>1년차</option>
						<option value="2"
							${personMyPageDto.career =='2' ? "selected" : ""}>2년차</option>
						<option value="3"
							${personMyPageDto.career =='3' ? "selected" : ""}>3년차</option>
						<option value="4"
							${personMyPageDto.career =='4' ? "selected" : ""}>4년차</option>
						<option value="5"
							${personMyPageDto.career =='5' ? "selected" : ""}>5년차</option>
						<option value="6"
							${personMyPageDto.career =='6' ? "selected" : ""}>6년차</option>
						<option value="7"
							${personMyPageDto.career =='7' ? "selected" : ""}>7년차</option>
						<option value="8"
							${personMyPageDto.career =='8' ? "selected" : ""}>8년차</option>
						<option value="9"
							${personMyPageDto.career =='9' ? "selected" : ""}>9년차</option>
						<option value="10"
							${personMyPageDto.career =='10' ? "selected" : ""}>10년차</option>

				</select></span>
			</div>
			<div class="input-group">
				<span class=" input-group-text"> 이메일 </span> <input input
					id="personEmail" type="text" class="form-control"
					placeholder="이메일을 입력해주세요" value="${personMyPageDto.personEmail }">
				<select class="form-select" style="background-color: #e9ecef;"
					id="emailAddress">
					<option>@naver.com</option>
					<option>@nate.com</option>
					<option>@gmail.com</option>
				</select>
			</div>
			<div class="custom_box">
				<form>
					<p class="custom_box_skill">필요기술</p>
					<p class="custom_box_skill">
						<label><input type="checkbox" name="color" value="Python ">
							Python </label> <label><input type="checkbox" name="color"
							value="AWS "> AWS </label> <label><input type="checkbox"
							name="color" value="Git"> Git </label> <label><input
							type="checkbox" name="color" value="iOS"> iOS </label>
					</p>
				</form>
			</div>
			<div class="form-check mb-3"></div>
			<div class="d-flex justify-content-center">
				<button id="btnPersonUpdate" class="btn btn_login" type="button">수정하기</button>
			</div>

		</form>
	</div>
</div>

<script src="/js/personMypage.js">
	
</script>

<%@ include file="../layout/footer.jsp"%>