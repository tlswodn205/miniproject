

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
            .custom_box .genders span {
                margin: 0 30px;
            }
            .custom_box .genders:first-child {
                border-radius: 0.25rem;
            }
            .custom_box .genders:last-child {
                border: 0;
            }
            .custom_box .custom_box_skill {
                margin: 15px 0 40px 0;
            }
            .custom_box .custom_box_skill label {
                font-size: 15px;
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
                        <p>개인</p>
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
                    <div class="input-group mb-3">
                        <span class=" input-group-text"> 이름 </span>
                        <input id="personName" type="text" class="form-control">
                    </div>
                    <div class="input-group mb-3">
                        <span class=" input-group-text"> 연락처 </span>
                        <input id="personPhone" type="tel" class="form-control">
                    </div>
                    <div class="custom_box">
                        <p class="genders">성별</p>
                        <p class="genders">
                            <span><input type="radio" class="form-check-input" id="radio1" name="optradio" value="option1" checked>
                                <label class="form-check-label" for="radio1"> 남성</label></span>
                            <span><input type="radio" class="form-check-input" id="radio2" name="optradio" value="option2">
                                <label class="form-check-label" for="radio2"> 여성</label></span>
                        </p>
                    </div>
                    <div class="input-group mb-3">
                        <span class=" input-group-text"> 거주지 </span>
                        <input id="address" type="text" class="form-control">
                    </div>
                    <div class="custom_box">
                        <p>학력</p>
                        <span><select id="degree" class="form-select">
                                <option>고졸</option>
								<option>고졸</option>
								<option>대졸전공</option>
								<option>대졸 비전공</option>
                            </select></span>
                    </div>
                    <div class="custom_box">
                        <p>경력</p>
                        <span><select id="career" class="form-select">
                                <option>경력 선택</option>
                                <option value="0">신입</option>
                                <option value="1">1년차</option>
                                <option value="2">2년차</option>
                                <option value="3">3년차</option>
                                <option value="4">4년차</option>
                                <option value="5">5년차</option>
                                <option value="6">6년차</option>
                                <option value="7">7년차</option>
                                <option value="8">8년차</option>
                                <option value="9">9년차</option>
                                <option value="10">10년차</option>
                            </select></span>
                    </div>
                    <div class="input-group">
                        <span class=" input-group-text"> 이메일 </span>
                        <input id="personEmail" type="tel" class="form-control">
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
                                <label>java</label> <input onclick="getSkill(1)" name="id" type="checkbox" class="form-check-input" value="java">
                                <label>javaScript</label> <input onclick="getSkill(2)" name="id" type="checkbox" class="form-check-input"
                                    value="javaScript"> <label>HTML/CSS</label> <input onclick="getSkill(3)" name="id" type="checkbox"
                                    class="form-check-input" value="HTML/CSS"> <label>MySQL</label> <input onclick="getSkill(4)" name="id"
                                    type="checkbox" class="form-check-input" value="MySQL"> <label>AWS</label> <input onclick="getSkill(5)" name="id"
                                    type="checkbox" class="form-check-input" value="AWS"> <label>Flutter</label> <input onclick="getSkill(6)"
                                    name="id" type="checkbox" class="form-check-input" value="Flutter">
                            </p>
                        </form>
                    </div>
                    <div class="form-check mb-3">
                    </div>
                    <div class="d-flex justify-content-center"><button class="btn_login" id="btnJoin" type="button">작성완료하기</button></div>

                </form>
            </div>
        </div>

        <script>

let skillList = new Array()

function getSkill(id) {
	var arr = new Array();

	$("input:checkbox[name='id']").each(function() {
		if ($(this).is(":checked") == true) {
			arr.push($(this).val());
		}
	});
	console.log(arr);
	skillList = arr;
	return skillList;
}

	$("#btnJoin").click(()=>{
		let username = $("#username").val();
		let password = $("#password").val();
		let personName = $("#personName").val();
		let personPhone = $("#personPhone").val();
		let personEmail = $("#personEmail").val()+ $("#emailAddress option:selected").val();
		let gender = $('input[name="gender"]:checked').val();
		let address	 = $('#address').val();
		let degree = $("#degree option:selected").val();
		let career = $("#career").val();
		alert(username);
		let data={
				username : username,
				password : password,
				personName : personName,
				personPhone : personPhone,
				personEmail : personEmail,
				gender : gender,
				address : address,
				degree : degree,
				career : career,
				personSkillList : skillList
		}
		
		$.ajax("/person/join",{
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
<%@ include file="../layout/footer.jsp"%>