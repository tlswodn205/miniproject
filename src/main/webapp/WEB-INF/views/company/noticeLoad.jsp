<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
    <style>
        ul {
            list-style: none;
        }

        h2{
            text-align: center;
            margin: 20px 0 30px 0;
        }

        .resumeManage_container {
            width: 1200px;
            border: 2px solid lightslategray;
            padding: 25px;
            height: 200px;
            margin-bottom: 20px;
            height: auto;
        }

        .resumeManage_container ul {
            padding: 0 2rem;
        }

        .resumeManage_container ul li {
            border: 2px solid lightslategray;
            height: 200px;
            padding: 50px;
            transition: transform .1s;
            margin: 20PX;
        }

        .resumeManage_container li:hover {
            background-color: lightslategray;
            border: 1px solid lightslategray;
            transform: scale(1.05);
        }

        .resumeManage_container li:hover p {}

        .resumeManage_container .info {}

        .resumeManage_container .flex {
            display: flex;
            margin-top: 10px;
        }

        .resumeManage_container .title {
            padding-top: 10px;
            font-size: 30px;
        }

        .resumeManage_container .second div {
            font-size: 18px;
            margin: 5px 0 5px 20px;
        }

        .resumeManage_container .date {}

        .resumeManage_container ul li p {
            float: right;
            padding: 5px;
            margin: 3px;
            border: 1px solid black;
            border-radius: 5%;
        }

        .resumeManage_container ul li .update:hover {
            background-color: #0d6efd;
        }

        .resumeManage_container ul li .delete:hover {
            background-color: #dc3545;
        }
    </style>
    
<%@ include file="../layout/header.jsp"%>

        <!-- Body-->
        <div class="container mt-3">

            <div class="resumeManage_container">
                <h2>등록 공고 보기</h2>
                <ul>
                	<c:forEach var="noticeRespDto" items="${noticeRespDtoList}">
                    	<li>	
	                        <div class="info">
	                            <div class="flex">
	                                <div class="title">${noticeRespDto.noticeTitle}</div>
	                                <div class="second">
	                                    <div class="date">${noticeRespDto.createdAt}</div>
	                                    <div class="skill">
                						<c:forEach var="Skills" items="${noticeRespDto.needSkill}">
	                                    ${Skills.skill}
                    					</c:forEach>
	                                    
	                                    </div>
	                                    
	                                </div>
	                            </div>
	                            <div class="category">
	                                <p class="update">공고상세보기</p>
	                            </div>
	                        </div>
	                    </li>
                    </c:forEach>
                </ul>
            </div>
        </div>
        <br>
        <br>


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

</body>

</html>