<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

    <%@ include file="../layout/header.jsp" %>
        <!-- Body-->
        <style>
            ul {
                list-style: none;
            }

            .flex {
                display: flex;
            }

            .skillCompanyMatching_container {
                width: 1200px;
                padding-left: 200px;
            }

            .skillCompanyMatching_container h2 {
                margin: 30px;
            }

            .skillCompanyMatching_container ul {
                margin-bottom: 40px;
            }

            .skillCompanyMatching_container ul li {
                border-bottom: 2px solid lightslategray;
                border-right: 2px solid lightslategray;
                border-left: 2px solid lightslategray;
                height: 100px;
                padding: 11px 20px 0 40px;
            }

            .skillCompanyMatching_container ul li:first-child {
                border: 2px solid lightslategray;
            }

            .skillCompanyMatching_container ul .skillCompany {
                height: 60px;
            }

            .skillCompanyMatching_container ul .skillCompany .label {
                padding-top: 6px;
            }

            .skillCompanyMatching_container li:hover {
                background-color: lightslategray;
            }

            .skillCompanyMatching_container ul .skillCompany .btn_companyDetail {
                border: none;
                background-color: #0d6efd;
                color: white;
            }

            .skillCompanyMatching_container ul .skillCompany:hover {
                background-color: white;
            }

            .skillCompanyMatching_container .companyname {
                width: 100%;
                margin-right: 60px;
                padding-top: 1rem;
                font-size: 30px;
            }

            .skillCompanyMatching_container .info {
                width: 100%;
            }

            .skillCompanyMatching_container .title {
                font-size: 25px;
            }

            .skillCompanyMatching_container .content div {
                margin-top: 8px;
                border-right: 1px solid black;
                padding: 0 30px;
            }

            .skillCompanyMatching_container .content div:first-child {
                padding-left: 0;
            }

            .skillCompanyMatching_container .content div:last-child {
                border: none;
            }

            .skillCompanyMatching_container .btn_companyDetail {
                float: right;
                padding: 5px 20px;
                border: 1px solid black;
                border-radius: 5%;
                background-color: white;
                margin: 0;
            }

            .skillCompanyMatching_container .flex:hover .btn_companyDetail {
                background-color: lightslategray;
            }

            .skillCompanyMatching_container .info .btn_companyDetail:hover {
                background-color: #0d6efd;
            }
        </style>

        <div class="container mt-3">
            <div class="skillCompanyMatching_container">
                <h2 class="d-flex justify-content-center">기술별 기업 매칭</h2>
                <ul>
                    <li class="skillCompany">
                        <div class=" d-flex justify-content-between">
                            <div class="label">
                                <label>java</label>
                                <input onclick="getSkill(1)" name="id" type="checkbox" class="form-check-input" value="java">
                                <label>javaScript</label> <input onclick="getSkill(2)" name="id" type="checkbox" class="form-check-input"
                                    value="javaScript"> <label>HTML/CSS</label> <input onclick="getSkill(3)" name="id" type="checkbox"
                                    class="form-check-input" value="HTML/CSS"> <label>MySQL</label> <input onclick="getSkill(4)" name="id"
                                    type="checkbox" class="form-check-input" value="MySQL"> <label>AWS</label> <input onclick="getSkill(5)" name="id"
                                    type="checkbox" class="form-check-input" value="AWS"> <label>Flutter</label> <input onclick="getSkill(6)"
                                    name="id" type="checkbox" class="form-check-input" value="Flutter">
                            </div>
                            <div><button id="skillBtn" class="btn_companyDetail">공고 검색</button></div>
                        </div>
                    </li>
                </ul>

                <ul id="companyList">
                    <c:forEach var="company" items="${companyRecommendList}">
                        <li class="flex">
                            <div>
                                <div class="companyname">${company.companyName}</div>
                                <p>추천수 : ${company.recommendCount}</p>
                            </div>
                            <div class="info">
                                <div class="title">${company.noticeTitle}</div>
                                <div class="content flex">
                                    <div>${company.career==0 ? "신입": company.career}</div>
                                    <div>${company.degree}</div>
                                    <div>${company.address}</div>
                                </div>
                                <div class="info">
                                    <button class="btn_companyDetail">기업 상세보기</button>
                                </div>
                                <div class="content flex">
                                    <div>기술스택
                                    </div>
                                    <div class="skills">
                                        <c:forEach var="skills" items="${person.personSkillList}"> ${skills.skill}, </c:forEach>
                                    </div>
                                </div>
                            </div>
                        </li>
                    </c:forEach>
                </ul>
            </div>
        </div>

        <script>
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

                $.ajax("/company/skillCompanyMatchingList/needSkill", {
                    type: "Post",
                    dataType: "json",
                    data: JSON.stringify(ids),
                    headers: {
                        "Content-Type": "application/json"
                    }
                }).done((res) => {
                    if (res.code == 1) {
                        console.log("기업 호출 완료");
                        $("#companyList").empty();
                        renderCompanyList(res.data);
                    } else {
                        alert("기업 호출 실패");
                    }
                });
            });


            function renderCompanyList(CompanyRecommendDtoList) {
                for (var CompanyRecommendDto of CompanyRecommendDtoList) {
                    $("#companyList").append(makePersonItem(CompanyRecommendDto));
                }
            }


            function makePersonItem(company) {
                var item = `<tr>`;
                item += `<td>\${company.companyName} </br> 추천수 : \${company.recommendCount}</td>`;
                item += `<td>\${company.noticeTitle}</br>`;
                item += `\${company.career==0 ? "신입": company.career} | \${company.degree} | \${company.address} | \${company.salary}</br>`;
                for (var companySkill of company.needSkillList) { item += makeSkillItem(companySkill); }
                item += `</br>\${company.createdAt}</td>`;
                item += `<td><button type="button" class="btn btn-primary">기업 상세보기</button></td>`;
                item += `</tr>`;
                return item;
            }


            function makeSkillItem(companySkill) {

                var item = `\${companySkill.skill} | `;
                return item;
            }
        </script>
        <%@ include file="../layout/footer.jsp" %>