<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

    <%@ include file="../layout/header.jsp" %>
        <!-- Body-->
        <style>
            .resumeWrite_container {
                width: 1200px;
                border: 2px solid lightslategray;
                margin: 50px;
            }

            .resumeWrite_container h2 {
                padding-top: 20px;
            }

            .resumeWrite_container_title input {
                width: 90%;
                height: 60px;
                margin-left: 5%;
            }

            .line {
                width: 597px;
                border-bottom: 2px solid lightslategray;
                margin: 25px 0;
            }

            .resumeWrite_container_photo {
                width: 150px;
                margin-left: 10%;
                margin: 0 30px;
            }

            .resumeWrite_container_photo div {
                width: 200px;
                height: 300px;
                background-color: lightslategray;
            }

            .resumeWrite_container_info {
                width: 80%;
                padding-left: 80px;
            }

            .resumeWrite_container_info .input-group span {
                width: 100px;
                text-align: center;
            }

            .resumeWrite_container_info .input-group span:last-child {
                padding: 5px;
                width: 40%;
            }

            .resumeWrite_container_info .input-group .input {
                width: 750px;
                border: 1px solid #ced4da;
                border-radius: 0.25rem;
            }

            .resumeWrite_container_info .input-group textarea {
                width: 850px;
                height: 300px;
            }



            .btn_insert {
                margin: 10px 35px 20px 0;
                padding: 8px 3%;
                border: 1px solid lightslategray;
                background-color: lightslategray;
                color: white;
                border-radius: 0.25rem;
            }

            .btn_insert:hover {
                background-color: #0d6efd;
            }
        </style>
        <div class="container mt-3">
            <div class="resumeWrite_container">
                <input id="personId" type="hidden" value="${person.personId}" />
                <h2 class="d-flex justify-content-center">이력서 등록</h2>
                <div class="line" style="width: 100%;"></div>
                <div class="resumeWrite_container_title"><input type="text" class="form-control" id="resumeTitle" placeholder=" 제목을 입력해주세요."></div>
                <div class="line" style="width: 100%;"></div>
                <div class="d-flex justify-content-start">
                    <div class="d-flex flex-column">
                        <!-- <div class="resumeWrite_container_photo">
                            <p></p>
                        </div>
                        <div class="d-flex justify-content-end"> <button class="btn_insert">첨부하기</button></div> -->
                        <div class="resumeWrite_container_photo form-group">
                            <div id="imageContainer"></div>
                            <input type="file" id="file" accept="image/*" onchange="setThumbnail(event)">
                        </div>
                    </div>
                    <div class="resumeWrite_container_info">
                        <div class="input-group mb-3">
                            <span class=" input-group-text"> 이름 </span>
                            <span>${person.personName}</span>
                        </div>
                        <div class="input-group mb-3">
                            <span class=" input-group-text"> 이메일 </span>
                            <span>${person.personEmail}</span>
                        </div>
                        <div class="input-group mb-3">
                            <span class=" input-group-text"> 학력 </span>
                            <span>${person.degree}</span>
                        </div>
                        <div class="input-group mb-3">
                            <span class=" input-group-text"> 경력 </span>
                            <span>${person.career}년차</span>
                        </div>
                        <div class="input-group mb-3">
                            <span class=" input-group-text"> 거주지 </span>
                            <span>
                                <c:forEach var="skills" items="${person.personSkillList}"> ${skills.skill}</c:forEach>
                            </span>
                        </div>
                        <div class="input-group mb-3">
                            <span class=" input-group-text"> 기술스택 </span>
                            <span> Python, AWS, Git, iOS</span>
                        </div>
                        <div class="input-group mb-3">
                            <span class=" input-group-text"> 링크 </span>
                            <input class="input" type="text" class="form-control" id="myCloud" placeholder="깃헙 또는 블로그 주소">
                        </div>
                        <div class="input-group mb-3">
                            <div class="d-flex flex-column"><span class=" input-group-text"> 자기소개 </span>
                                <textarea id="introduction" class="form-control" rows="5" cols="75" placeholder="내용을 입력해주세요."></textarea>
                            </div>

                        </div>
                    </div>
                </div>
                <div class="d-flex justify-content-end"><button id="btnsave" type="button" class="btn_insert" onclick="save">이력서 등록하기 버튼</button>
                </div>
            </div>
        </div>

        <script>

            $("#btnsave").click(() => {
                save();
            });

            function setThumbnail(event) {
                let reader = new FileReader();

                reader.onload = function (event) {


                    if (document.getElementById("newImg")) {
                        document.getElementById("newImg").remove();
                    }
                    let img = document.createElement("img");
                    img.setAttribute("src", event.target.result);
                    img.setAttribute("id", "newImg");
                    document.querySelector("#imageContainer").appendChild(img);

                };
                reader.readAsDataURL(event.target.files[0]);
            }



            let personId = $("#personId").val();


            function save() {
                let formData = new FormData();

                let data = {
                    resumeTitle: $("#resumeTitle").val(),
                    myCloud: $("#myCloud").val(),
                    introduction: $("#introduction").val(),
                    personId: $("#personId").val()
                };

                formData.append('file', $("#file")[0].files[0]);
                formData.append('resumeWriteDto', new Blob([JSON.stringify(data)], { type: "application/json" }));

                $.ajax("/resume/save", {
                    type: "POST",
                    data: formData,
                    processData: false,
                    contentType: false,
                    enctype: 'multipart/form-data'
                }).done((res) => {
                    if (res.code == 1) {
                        alert("이력서 등록 성공");
                        location.href = "/";
                    } else {
                        location.reload();
                    }
                });
            }

        </script>
        <%@ include file="../layout/footer.jsp" %>