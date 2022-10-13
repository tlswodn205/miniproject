<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<%@ include file="../layout/header.jsp" %>

		<body class="d-flex flex-column h-100">

			<main class="flex-shrink-0">
				<!-- Navigation-->
				<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
					<div class="container px-5">
						<a class="navbar-brand" href="index.html">로고 이름</a>
						<!-- <button class="navbar-toggler" type="button" data-bs-toggle="collapse"
                    data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent"
                    aria-expanded="false" aria-label="Toggle navigation"><span
                        class="navbar-toggler-icon"></span></button> -->
						<div class="collapse navbar-collapse" id="navbarSupportedContent">
							<ul class="navbar-nav ms-auto mb-2 mb-lg-0">
								<li class="nav-item dropdown">
									<a class="nav-link dropdown-toggle" id="navbarDropdownBlog" href="#" role="button"
										data-bs-toggle="dropdown" aria-expanded="false">채용</a>
									<ul class="dropdown-menu dropdown-menu-end" aria-labelledby="navbarDropdownBlog">
										<li><a class="dropdown-item" href="blog-home.html">프론트엔드 개발</a></li>
										<li><a class="dropdown-item" href="blog-post.html">백엔드 개발</a></li>
										<li><a class="dropdown-item" href="blog-post.html">앱 개발</a></li>
									</ul>
								</li>
								<li class="nav-item"><a class="nav-link" href="index.html">이력서 등록</a></li>
								<li class="nav-item"><a class="nav-link" href="index.html">기업 등록</a></li>
								<li class="nav-item"><a class="nav-link" href="index.html">관심구직자 매칭</a></li>
								<li class="nav-item"><a class="nav-link" href="index.html">관심기업 매칭</a></li>
								<li class="nav-item"><a class="nav-link" href="index.html">구직자추천 리스트</a></li>
								<li class="nav-item"><a class="nav-link" href="index.html">기업추천 리스트</a></li>
								<li class="nav-item"><a class="nav-link" href="index.html">구독 페이지</a></li>
								<li class="nav-item" style="margin:0 30px 0 30px;"><button id="btnUpdate" type="button"
										class="btn btn-primary">로그인</button>
								</li>
								<li class="nav-item"><button id="btnUpdate" type="button"
										class="btn btn-primary">회원가입</button>
								</li>
							</ul>
						</div>
					</div>
				</nav>
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