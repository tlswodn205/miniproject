<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file="../layout/header.jsp"%>

<body class="d-flex flex-column h-100">

	<main class="flex-shrink-0">
		<!-- Body-->
		<div class="container mt-3">
				<div class="flex">
				<input type= "hidden" id = "companyId" value="${company.companyId}"> 
					<h2>${company.companyName}</h2>
					<div style="width: 400px;">
						<img class="card-img-top" src="https://dummyimage.com/400x150/adb5bd/495057" alt="..." />
					</div>
				</div>
				<div class="mb-3 mt-3">
					<label for="comment">기업소개</label>
					<textarea id="introduction" class="form-control" rows="5" placeholder="내용을 입력해주세요.">${company.introduction}</textarea>
				</div>
				<div class="mb-3 mt-3">
					<label for="comment">연혁</label>
					<textarea id="history" class="form-control" rows="5" placeholder="내용을 입력해주세요.">${company.history}</textarea>
				</div>
				<div class="mb-3 mt-3">
					<label for="comment">기업목표</label>
					<textarea id="companyGoal" class="form-control" rows="5" placeholder="내용을 입력해주세요.">${company.companyGoal}</textarea>
				</div>
				<button id="btnInsert" class="btn btn-primary">작성완료</button>
		</div>
		<script>
					$("#btnInsert").click(() => {
						insert();
					});

					function insert() {
						let data = {
							introduction: $("#introduction").val(),
							history: $("#history").val(),
							companyGoal: $("#companyGoal").val()
						}
						alert($("#companyId").val());
						$.ajax("/company/companyInsert/" +$("#companyId").val(), {
							type: "POST",
							dataType: "json",
							data: JSON.stringify(data), // http body에 들고갈 요청 데이터
							headers: { // http header에 들고갈 요청 데이터
								"Content-Type": "application/json; charset=utf-8"
							}
						}).done((res) => {
							if (res.code == 1) { // 성공
								location.href = "/company/companyInsertWrite/";
							} else { // 실패
								alert("기업이력등록에 실패하였습니다.");
							}
						});
					}
				</script> 
		<%@ include file="../layout/footer.jsp"%>