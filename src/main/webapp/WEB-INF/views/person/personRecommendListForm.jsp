<!-- 구직자 추천 페이지 -->
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <meta name="description" content="" />
    <meta name="author" content="" />
    <title>구직자 추천 페이지</title>
    <!-- Favicon-->
    <link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
    <!-- Bootstrap icons-->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
    <!-- Core theme CSS (includes Bootstrap)-->
    <link href="css/main_styles.css" rel="stylesheet" />
</head>

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
                        <li class="nav-item"><button id="btnUpdate" type="button" class="btn btn-primary">회원가입</button>
                        </li>
                    </ul>
                </div>
            </div>
        </nav>
        <!-- Body-->
        <div class="container mt-3">
            <h2>구직자 추천 페이지</h2>

            <table class="table table-hover">
                <thead>
                    <tr>
                        <th>추천수</th>
                        <th>이름</th>
                        <th>이력서제목</th>
                        <th>경력</th>
                        <th>거주지</th>
                        <th>기술스택</th>

                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>99</td>
                        <td>김열심(80%마크)</td>
                        <td>자바 개발자 지원</td>
                        <td>신입</td>
                        <td>부산 진구</td>
                        <td>자바, 자바스크립트 </td>
                    </tr>
                    <tr>
                        <td>공백</td>
                        <td>공백</td>
                        <td>클릭시 이력서<br>상세보기 이동</td>
                        <td>공백</td>
                        <td>공백</td>
                        <td>공백</td>
                    </tr>
                </tbody>
            </table>
        </div>

        <!-- Footer-->
        <footer class="bg-dark py-4 mt-auto">
            <div class="container px-5">
                <div class="row align-items-center justify-content-between flex-column flex-sm-row">
                    <div class="col-auto">
                        <div class="small m-0 text-white">Copyright &copy; Your Website 2022</div>
                    </div>
                    <div class="col-auto">
                        <a class="link-light small" href="#!">Privacy</a>
                        <span class="text-white mx-1">&middot;</span>
                        <a class="link-light small" href="#!">Terms</a>
                        <span class="text-white mx-1">&middot;</span>
                        <a class="link-light small" href="#!">Contact</a>
                    </div>
                </div>
            </div>
        </footer>
        <!-- Bootstrap core JS-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
        <!-- Core theme JS-->
        <script src="js/scripts.js"></script>
        <br />
        <hr />
        <div class="jumbotron text-center" style="margin-bottom: 0">
            <p>Created by Cos</p>
            <p>📞 010-2222-7777</p>
            <p>🏴 부산 부산진구 XX동</p>
        </div>
</body>

</html>