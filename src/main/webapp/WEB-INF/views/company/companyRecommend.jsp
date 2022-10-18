<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

    <%@ include file="../layout/header.jsp" %>
        <!-- Body-->
        <style>
            ul {
                list-style: none;
            }

            .companyRecommand_container {
                width: 1200px;
                padding-left: 200px;
            }

            .companyRecommand_container h2 {
                margin: 30px;
            }

            .companyRecommand_container ul {
                margin-bottom: 40px;
            }

            .companyRecommand_container ul li {
                border-top: 2px solid lightslategray;
                border-left: 2px solid lightslategray;
                border-right: 2px solid lightslategray;
                border-bottom: 1px solid lightslategray;
                height: 150px;
                padding: 15px 20px 0 50px;
            }

            .companyRecommand_container li:hover {
                background-color: lightslategray;
                border: 1px solid lightslategray;
            }

            .companyRecommand_container .companyname {
                padding-right: 30px;
                font-size: 25px;
            }

            .companyRecommand_container .title {
                font-size: 25px;
            }

            .companyRecommand_container .content div {
                margin-top: 8px;
                border-right: 1px solid black;
                padding: 0 30px;
            }

            .companyRecommand_container .content div:first-child {
                padding-left: 0;
            }

            .companyRecommand_container .content div:last-child {
                border: none;
            }

            .companyRecommand_container .info .btn_companyDetail {
                float: right;
                padding: 5px 20px;
                border: 1px solid black;
                border-radius: 5%;
                background-color: white;
                margin: 80px 0 0 220px;
            }

            .companyRecommand_container li:hover .btn_companyDetail {
                background-color: lightslategray;
            }

            .companyRecommand_container .info .btn_companyDetail:hover {
                background-color: #0d6efd;
            }
        </style>
        <div class="container mt-3">
            <div class="companyRecommand_container">
                <h2 class="d-flex justify-content-center">추천 기업 목록</h2>
                <ul>
                    <c:forEach var="company" items="${companyRecommendList}">
                        <li class="d-flex justify-content-start">
                            <div class="d-flex flex-column">
                                <div class="companyname">${company.companyName} </div>
                                <div>추천수 : ${company.recommendCount}</div>
                            </div>
                            <div class="info">
                                <div class="title">${company.noticeTitle}</div>
                                <div class="content d-flex justify-content-start">
                                    <div>${company.career==0 ? "신입": company.career}</div>
                                    <div>${company.degree}</div>
                                    <div>${company.address}</div>
                                    <div> ${company.salary}</div>
                                </div>
                                <div class="content d-flex justify-content-start">
                                    <div>기술스택
                                    </div>
                                    <div>
                                        <c:forEach var="skills" items="${person.skill}">
                                            ${skills.skill}
                                        </c:forEach>
                                    </div>
                                </div>
                            </div>
                            <div class="info">
                                <button  onClick="goDetail(${company.noticeId})" type="button" class="btn_companyDetail">공고상세보기</button>
                            </div>
                    </c:forEach>
                    </li>
                </ul>
            </div>
        </div>
        <script>

        function goDetail(id){
			window.open("/company/noticeDetail/"+id, "", "_blank");
        }
        
            function getSkill(id) {

                var arr = new Array();

                $("input:checkbox[name='id']").each(function () {
                    if ($(this).is(":checked") == true) {
                        arr.push($(this).val());
                    }
                });
                console.log(arr);
                return arr;
            }


            $("#skillBtn").click((id) => {
                let ids = getSkill(id);

                $.ajax("/company/interestNoticeList/noticeSkill", {
                    type: "Post",
                    dataType: "json",
                    data: JSON.stringify(ids),
                    headers: {
                        "Content-Type": "application/json"
                    }
                }).done((res) => {
                    if (res.code == 1) {
                        console.log("기업 호출 완료");
                        $("#personList").empty();
                        renderPersonList(res.data);
                    } else {
                        alert("기업 호출 실패");
                    }
                });
            });
        </script>
        <%@ include file="../layout/footer.jsp" %>