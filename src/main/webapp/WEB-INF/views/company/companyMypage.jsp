<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link rel="stylesheet" href="css/main.css">
<link rel="Stylesheet" href="css/companyMypage">

<%@ include file="../layout/header.jsp"%>


<head>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>기업 마이페이지</title>
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

.personJoin_container .flex .company_mypage_topbutton {
	padding: 8px;
	width: 180px;
	margin: 10px;
	border-radius: 00.25rem;
	border: 0;
	color: white;
	background-color: lightslategray;
	;
}

.personJoin_container .flex .company_mypage_topbutton:hover {
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

.personJoin_container .input-group span:last-child {
	padding: 5px;
	width: 465px;
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
		<div class="flex justify-content-center">

			<div>
				<button class="company_mypage_topbutton" type="button"  onclick="location.href='/company/noticePerApplier'">기업
					지원자 확인</button>
			</div>
			<div>
				<button class="company_mypage_topbutton" type="button"
					onclick="location.href='/company/companyDetail'">공고글 이력 확인</button>
			</div>
			<div>
				<button class="company_mypage_topbutton" type="button" onclick="location.href='/company/conpanyInfoWrite'
				">기업
					소개 등록</button>
			</div>
		</div>


		<form>
			<div class="line"></div>
			<input id="userId" type="hidden" value="${companyMyPageDto.userId}">
			<div class="input-group mb-3">
				<span class=" input-group-text"> 아이디 </span> <input type="text"
					class="form-control" value="${companyMyPageDto.username}"
					readonly="readonly">
			</div>
			<div class="input-group mb-3">
				<span class="input-group-text">비밀번호</span> <input id="password"
					type="password" class="form-control" placeholder="비밀번호를 입력해주세요"
					value="${companyMyPageDto.password}">
			</div>
			<div class="input-group mb-3">
				<span class="input-group-text">비밀번호 확인</span> <input
					id="passwordCheck" id="password_con" type="password"
					class="form-control" placeholder="비밀번호를 확인해주세요"
					value="${companyMyPageDto.password}">
			</div>
			<div class="input-group mb-3">
				<span class=" input-group-text"> 기업명 </span> <input type="text"
					class="form-control" value="${companyMyPageDto.companyName}"
					readonly="readonly">
			</div>
			<div class="input-group mb-3">
				<span class=" input-group-text"> 대표자명 </span> <input id="ceoName"
					type="text" class="form-control" placeholder="대표자명을 입력해주세요"
					value="${companyMyPageDto.ceoName}">
			</div>
			<div class="input-group mb-3">
				<span class=" input-group-text"> 기업주소 </span> <input id="address"
					type="text" class="form-control" placeholder="기업주소를 입력해주세요"
					value="${companyMyPageDto.address}">
			</div>
			<div class="input-group mb-3">
				<span class=" input-group-text"> 기업 연락처 </span> <input
					id="companyPhone" type="number" class="form-control"
					placeholder="기업 연락처를 입력해주세요"
					value="${companyMyPageDto.companyPhone}">
			</div>
			<div class="input-group">
				<span class=" input-group-text"> 기업 이메일 </span> <input
					id="companyEmail" type="text" class="form-control"
					placeholder="기업 이메일을 입력해주세요"
					value="${companyMyPageDto.companyEmail}"> <select
					id="emailAddress" class="form-select"
					style="background-color: #e9ecef;">
					<option>@naver.com</option>
					<option>@nate.com</option>
					<option>@gmail.com</option>
				</select>
			</div>
			<div class="custom_box">
				<form>
					<p class="custom_box_skill">보유기술</p>
					<p class="custom_box_skill">
						<label>메타버스</label><input type="radio" name="tech"
							${companyMyPageDto.tech=='메타버스' ? "checked" : ""} value="메타버스">
						<label>AI</label><input type="radio" name="tech"
							${companyMyPageDto.tech=='AI' ? "checked" : ""} value="AI">
						<label>블록체인</label><input type="radio" name="tech"
							${companyMyPageDto.tech=='블록체인' ? "checked" : ""} value="블록체인">
					</p>
				</form>
			</div>
			<div class="form-check mb-3"></div>
			<div class="d-flex justify-content-center">
				<button id="btnCompanyUpdate" class="btn btn_login" type="button">수정하기</button>
			</div>

		</form>
	</div>
</div>

<script src="/js/companyMypage.js">
	
</script>

<%@ include file="../layout/footer.jsp"%>