<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

    <%@ include file="../layout/header.jsp" %>
        <!-- Body-->
        <style>
            ul {
                list-style: none;
            }

            .personRecommand_container {
                width: 1100px;
                padding-left: 200px;
            }

            .personRecommand_container h2 {
                margin: 30px;
            }

            .personRecommand_container ul {
                margin-bottom: 40px;
            }

            .personRecommand_container ul li {
                border-top: 2px solid lightslategray;
                border-left: 2px solid lightslategray;
                border-right: 2px solid lightslategray;
                border-bottom: 1px solid lightslategray;
                height: 150px;
                padding: 15px 20px 0 50px;
            }

            .personRecommand_container li:hover {
                background-color: lightslategray;
                border: 1px solid lightslategray;
            }

            .personRecommand_container .name {

                font-size: 25px;
            }

            .personRecommand_container .content div {
                margin-top: 8px;
                border-right: 1px solid black;
                padding: 0 30px;
            }

            .personRecommand_container .content div:first-child {
                padding-left: 0;
            }

            .personRecommand_container .content div:last-child {
                border: none;
            }

            .personRecommand_container .info .btn_personDetail {
                float: right;
                padding: 5px 20px;
                border: 1px solid black;
                border-radius: 5%;
                background-color: white;
            }

            .personRecommand_container li:hover .btn_personDetail {
                background-color: lightslategray;
            }

            .personRecommand_container .info .btn_personDetail:hover {
                background-color: #0d6efd;
            }
        </style>
        <div class="container mt-3">
            <div class="personRecommand_container">
                <h2 class="d-flex justify-content-center">추천 구직자 목록</h2>
                <ul>
                    <c:forEach var="person" items="${personRecommendListDto}">
                        <li>
                            <div class="info">
                                <div class="name">${person.personName} ${person.mark ? "(★)" : ""}</div>
                                <div class="content d-flex justify-content-start">
                                    <div>추천수 : ${person.recommendCount}</div>
                                    <div>${person.degree}</div>
                                    <div>${person.career} 년차</div>
                                    <div>${person.address}</div>
                                </div>
                                <div>
                                    <button onclick="goInfo(${person.personId})" type="button" class="btn_personDetail">구직자 정보 보기</button>
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
                        </li>
                    </c:forEach>
                </ul>
            </div>
        </div>

        <script>
        function goInfo(id){
			window.open("/PersonInfo/"+id, "", "_blank");
        }
        </script>
        <%@ include file="../layout/footer.jsp" %>
        