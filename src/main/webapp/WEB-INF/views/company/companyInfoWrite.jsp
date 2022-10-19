<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

    <%@ include file="../layout/header.jsp" %>
        <!-- Body-->
        <style>
            h2 {
                margin: 40px 0 0 50px;
            }

            .flex {
                display: flex;
                justify-content: space-between;
            }

            .mb-3 label {
                width: 100px;
                text-align: center;
                padding: 5px;
                color: white;
                background-color: lightslategray;
                border-radius: 5%;
            }

            .companyInfoWrite_container {
                width: 1200px;
                border: 2px solid lightslategray;
                padding: 25px;
                border-radius: 1%;
            }
        </style>
        <div class="container mt-3">
            <div class="companyInfoWrite_container">
                <div class="flex">
                    <input type="hidden" id="companyId" value="${company.companyId}">
                    <h2>${company.companyName}</h2>
                    <div style="width: 400px;">
                        <!-- <img class="card-img-top" src="https://dummyimage.com/400x150/adb5bd/495057" alt="..." /> -->
                        <div id="imageContainer"></div>
                        <input type="file" id="file" accept="image/*" onchange="setThumbnail(event)">
                    </div>
                </div>
                <div class="mb-3 mt-3">
                    <label for="comment">기업소개</label>
                    <textarea id="content" class="form-control" rows="5" placeholder="내용을 입력해주세요.">${company.introduction}</textarea>
                </div>
                <div class="mb-3 mt-3">
                    <label for="comment">연혁</label>
                    <textarea id="content" class="form-control" rows="5" placeholder="내용을 입력해주세요.">${company.history}</textarea>
                </div>
                <div class="mb-3 mt-3">
                    <label for="comment">기업목표</label>
                    <textarea id="content" class="form-control" rows="5" placeholder="내용을 입력해주세요.">${company.companyGoal}</textarea>
                </div>
                <div class="button"><button id="btnsave" type="button" class="btn btn-primary" onclick="save">작성완료</button></div>
            </div>

            </br>
            </br>
            </br>
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


            function save() {

                let formData = new FormData();

                let data = {
                    introduction: $("#introduction").val(),
                    history: $("#history").val(),
                    companyGoal: $("#companyGoal").val()
                }

                formData.append('file', $("#file")[0].files[0]);
                formData.append('companyInsertDto', new Blob([JSON.stringify(data)], { type: "application/json" }));


                alert($("#companyId").val());

                $.ajax("/company/companyInsert/" + $("#companyId").val(), {
                    type: "POST",
                    data: formData,
                    processData: false,
                    contentType: false,
                    enctype: 'multipart/form-data'
                }).done((res) => {
                    if (res.code == 1) { // 성공
                        alert($("#companyId").val());
                        location.href = "/";
                    } else { // 실패
                        alert("기업 이력등록에 실패하였습니다.");
                    }
                });
            }
        </script>
        <%@ include file="../layout/footer.jsp" %>