<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

	<%@ include file="../layout/header.jsp" %>

		<body class="d-flex flex-column h-100">

			<main class="flex-shrink-0">
				<!-- Body-->
				<div class="container mt-3">
					<div class="flex">
						<h2>기업명</h2>
						<div style="width: 400px;"><img class="card-img-top"
								src="https://dummyimage.com/400x150/adb5bd/495057" alt="..." /></div>
					</div>
					<div class="mb-3 mt-3">
						<label for="comment">기업소개</label>
						<textarea id="content" class="form-control" rows="5" placeholder="내용을 입력해주세요."></textarea>
					</div>
					<div class="mb-3 mt-3">
						<label for="comment">연혁</label>
						<textarea id="content" class="form-control" rows="5" placeholder="내용을 입력해주세요."></textarea>
					</div>
					<div class="mb-3 mt-3">
						<label for="comment">기업목표</label>
						<textarea id="content" class="form-control" rows="5" placeholder="내용을 입력해주세요."></textarea>
					</div>

					<button type="submit" class="btn btn-primary">작성완료</button>
				</div>
				<%@ include file="../layout/footer.jsp" %>