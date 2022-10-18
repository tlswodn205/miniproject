<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

    <%@ include file="../layout/header.jsp" %>
        <!-- Body-->
        <style>
            .personJoin_container {
                margin: 50px;
                width: 1200px;
                border: 2px solid lightslategray;
                padding: 60px 100px;
            }


            .personJoin_container p {
                text-align: center;
                width: 100px;
                margin-bottom: 40px;
                border: 2px solid lightslategray;
                padding: 3px;
            }

            .personJoin_container .d-flex p:last-child {
                color: lightslategray;
            }

            .personJoin_container .d-flex :first-child {
                color: white;
                background-color: lightslategray;
            }

            .personJoin_container form {
                padding: 0 200px;
            }

            .d-flex {
                margin-bottom: 30px;
            }

            .personJoin_container .input-group span {
                width: 130px;
                text-align: center;
            }

            .custom_box {
                display: flex;
                width: 600px;

            }

            .custom_box p {
                padding: 0.375rem 0.75rem;
                margin-bottom: 15px;
            }

            .custom_box span select {
                width: 150px;
                border-left: 0;
                border-radius: 0 0.25rem 0.25rem 0;
            }

            .custom_box p:first-child {
                text-align: left;
                border-radius: 0.25rem 0 0 0.25rem;
                width: 130px;
                background-color: #e9ecef;
                border: 1px solid #ced4da;
            }

            .custom_box p:last-child {
                border-radius: 0 0.25rem 0.25rem 0;
                width: 470px;
                border: 1px solid #ced4da;
                border-left: 0;
            }

            .custom_box .gender span {
                margin: 0 30px;
            }

            .custom_box .gender:first-child {
                border-radius: 0.25rem;
            }

            .custom_box .gender:last-child {
                border: 0;
            }

            .custom_box .custom_box_skill {
                margin: 15px 0 40px 0;
            }

            .custom_box .custom_box_skill label {
                padding: 0 5px 0 10px;
            }

            .line {
                width: 597px;
                border-bottom: 2px solid lightslategray;
                margin: 25px 0;
            }

            .form-check {
                display: block;
                min-height: 0.3rem;
                padding-left: 0;
                margin-bottom: 0.1rem;
            }

            .d-flex .btn_login {
                margin-top: 10px;
                padding: 8px 205px;
                border: 1px solid lightslategray;
                border-radius: 0.25rem;
            }

            .d-flex .btn_login:hover {
                background-color: #0d6efd;
                border: 1px solid #0d6efd;
                color: white;
            }
        </style>
        <div class="d-flex justify-content-center">
            <div class="personJoin_container">
                <form>
                    <div class="d-flex justify-content-center">
                        <p>기업</p>
                        <p>회원가입</p>
                    </div>
                    <div class="input-group mb-3">
                        <span class=" input-group-text"> 아이디 </span>
                        <input id="username" type="text" class="form-control">
                    </div>
                    <div class="input-group mb-3">
                        <span class="input-group-text">비밀번호</span>
                        <input id="password" type="password" class="form-control">
                    </div>
                    <div class="input-group mb-3">
                        <span class="input-group-text">비밀번호 확인</span>
                        <input id="passwordCheck" type="password" class="form-control">
                    </div>
                    <div class="line"></div>
                    <div class="input-group mb-3">
                        <span class=" input-group-text"> 기업명 </span>
                        <input id="companyName" type="text" class="form-control">
                    </div>
                    <div class="input-group mb-3">
                        <span  class=" input-group-text"> 대표자명 </span>
                        <input id="ceoName" type="text" class="form-control">
                    </div>
                    <div class="input-group mb-3">
                        <span class=" input-group-text"> 기업주소 </span>
                        <input id="address" type="text" class="form-control">
                    </div>
                    <div class="input-group mb-3">
                        <span class=" input-group-text"> 기업 연락처 </span>
                        <input id="companyPhone" type="tel" class="form-control">
                    </div>
                    <div class="input-group">
                        <span class=" input-group-text"> 기업 이메일 </span>
                        <input id="companyEmail" type="email" class="form-control">
                        <select id="emailAddress" class="form-select" style="background-color: #e9ecef;">
                            <option>@naver.com</option>
                            <option>@nate.com</option>
                            <option>@gmail.com</option>
                        </select>
                    </div>
                    <div class="custom_box">
                        <form>
                            <p class="custom_box_skill">필요기술 </p>
                            <p class="custom_box_skill">
                                <label>메타버스</label><input type="radio" name="tech" value="메타버스">
                                <label>AI</label><input type="radio" name="tech" value="AI">
                                <label>블록체인</label><input type="radio" name="tech" value="블록체인">
                            </p>
                        </form>
                    </div>
                    <div class="form-check mb-3">
                    </div>
                    <div class="d-flex justify-content-center"><button id="btnJoin" class="btn btn_login" type="button">작성완료하기</button>
                    </div>

                </form>
            </div>
        </div>

        <script>
        $("#btnJoin").click(()=>{
        	let tech = $('input[name=tech]:checked').val();
        	alert(tech);
        	
        	let username = $("#username").val();
        	let password = $("#password").val();
        	let companyName = $("#companyName").val();
        	let companyEmail = $("#companyEmail").val() + $("#emailAddress").val();
        	let companyPhone = $("#companyPhone").val();
        	let ceoName = $("#ceoName").val();
        	let address = $("#address").val();
        	
        	let data={
        			username : username,
        			password : password,
        			companyName : companyName,
        			companyEmail : companyEmail,
        			companyPhone : companyPhone,
        			ceoName : ceoName,
        			tech : tech,
        			address : address
        	}
        	alert(data.ceoName);
        	
        	$.ajax("/company/join",{
        		type:"POST",
        		dataType: "json",
        		data: JSON.stringify(data),
        		headers: {
        			"Content-Type": "application/json"
        		}
        	}).done((res)=>{
        		if(res.code == 1){
        			alert("회원가입성공!!");
        			location.href="/loginForm";
        		}
        		else
        			alert("이미 가입된 아이디가 있습니다!!");
        	});
        	
        	
        });

        </script>
        <%@ include file="../layout/footer.jsp" %>