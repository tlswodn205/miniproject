<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
    <style>
        .noticeWrite_container h2 {
            text-align: center;
            margin: 10px 0 40px 0;
        }

        .noticeWrite_container {
            width: 1200px;
            border: 2px solid lightslategray;
            border-radius: 0.5rem;
            padding: 25px;
        }
      
      .noticeWrite_container #content{
      width:100%;
                  border: 2px solid lightslategray;
            border-radius: 0.5rem;
            padding: 25px;
      }
        .noticeWrite_title {
            margin: 10px;
        }

        .noticeWrite_title input {
            width: 70%;
            border: 1px solid lightslategray;
        }

        .flex {
            display: flex;
        }


        .flex div {
            margin: 10px 50px 10px 10px;
        }

        .info_box {
            padding: 10px;
            border: 2px solid lightslategray;
            border-radius: 0.5rem;
        }

        .btn_post {
            width: 180px;
            padding: 5px 20px;
            background-color: lightslategray;
            color: white;
            border:2px solid lightslategray;
            border-radius: 0.25rem;
        }

        .btn_post:hover {
            background-color: #0d6efd;
            border:2px solid #0d6efd;
        }
    </style>
</head>
<%@ include file="../layout/header.jsp"%>
        <!-- Body-->
        <div class="container mt-3">

            <div class="noticeWrite_container">
            <input type="hidden" id="noticeId" value="${notice.noticeId}">
                    <h2>${notice.noticeTitle}</h2>
                    <div>
                        <div class="d-flex justify-content-around info_box">
                            <div class="flex">
                                <div class="flex_1">
                                급여 : ${notice.salary}
                                </div>
                                <div class="flex_1">
                                학력 : ${notice.degree}
                                </div>
                                <div class="flex_1">
                                경력 : ${notice.career}
                                </div>
                                <div class="flex_2">
                                기술스택 :
                                	<c:forEach var="Skills" items="${needSkillList}">
                                		${Skills.skill} |
                                	</c:forEach>
                                </div>
                            </div>
                        </div>

                    </div>
                    <div class="mb-3 mt-3">
                        <label for="comment"></label>
                        <div id="content" class="form-control" rows="5" placeholder=""
                            style="height: 500px;">${notice.noticeContent}</div>
                    </div>
                    <div class="d-flex justify-content-end">
                    <c:choose>
                    	<c:when test = "${company.companyId==notice.companyId}">
                        	<button id="closed" class="btn_post" style="margin: 0 0 0 745px; ">마감하기</button>
                        </c:when>
                        <c:when test = "${principal.role=='person'}">
                        </select>
                        	<select id="resumeId"  style="margin: 0 0 0 400px;">
                        		<c:forEach var="resume" items="${resumeList}"><option value="${resume.resumeId}">${resume.resumeTitle}</option></c:forEach>
                        	</select>
                       		<button id="apply" class="btn_post" style="margin: 0 0 0 20px;">지원하기</button>
                        </c:when>
                    </c:choose>
                        <button id="goBack" class="btn_post"
                            style="margin: 0 0 0 20px; ">공고별 지원자보기</button>
                    </div>
            </div>
            </br>
            </br>

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
        <script>

        $("#goBack").click(() => {
			location.href="/person/noticePerApplier/" + $("#noticeId").val();
        });
        
        $("#closed").click(() => {
        	$.ajax("/company/noticeClose/" + $("#noticeId").val(), {
        		type: "Post",
        		dataType: "json",
        	}).done((res) => {
        		if (res.code == 1) {
        			console.log("마감 완료");
        		} else {
        			alert("마감 실패");
        		}
        	});
        });
        
        $("#apply").click(() => {
        	let data = {
        			resumeId : $("#resumeId").val(),
        			noticeId : $("#noticeId").val()
        	}
        	$.ajax("/company/submitResume/", {
        		type: "Post",
        		dataType: "json", 
        		data: JSON.stringify(data),
                headers: {
                    "Content-Type": "application/json"
                }
        	}).done((res) => {
        		if (res.code == 1) {
        			alert("지원 완료");
        		} else {
        			alert("마감 실패");
        		}
        	});
        });
        
        
        
        </script>