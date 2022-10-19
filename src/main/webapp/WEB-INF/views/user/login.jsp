<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

    <%@ include file="../layout/header.jsp" %>
        <style>
            .login_container {
                margin: 50px;
                width: 600px;
                border: 2px solid lightslategray;
                padding: 80px 60px 30px 60px;
            }
            .login_container h2 {
                margin-bottom: 60px;
            }
            .d-flex {
                margin-bottom: 30px;
            }
            .form-check {
                display: block;
                min-height: 0.3rem;
                padding-left: 0;
                margin-bottom: 0.1rem;
            }
            .btn_login {
                margin-top: 10px;
                padding: 8px 205px;
                border: 1px solid lightslategray;
                color: lightslategray;
                border-radius: 0.25rem;
                background-color: white;
            }
            .btn_join {
                margin-top: 100px;
                padding: 8px 50px;
                border: 1px solid lightslategray;
                color: white;
                border-radius: 0.25rem;
                background-color: lightslategray;
            }
            .btn_join:hover,
            .btn_login:hover {
                background-color: #0d6efd;
                border: 1px solid white;
                color: white;
            }
        </style>
        <div class="d-flex justify-content-center">
            <div class="login_container">
                <form>
                    <h2 class="d-flex justify-content-center">로그인</h2>
                    <div class="input-group mb-3">
                        <span class=" input-group-text" style="padding: 0 20px;"> 아이디 </span>
                        <input id="username" type="text" class="form-control" placeholder="아이디를 입력해주세요">
                    </div>
                    <div class="input-group mb-3">
                        <span class="input-group-text">비밀번호</span>
                        <input id="password" type="text" class="form-control" placeholder="비밀번호를 입력해주세요">
                    </div>
                    <div class="form-check mb-3">
                    </div>
                    <div class="d-flex justify-content-center"><button id="btnLogin" class="btn_login" id="btnLogin" type="button"
                            class="btn btn-primary">로그인</button></div>
                    <div class="d-flex justify-content-center" style="margin-bottom: 30px;">
                    	<div onclick="btnPersonJoin()" class="btn_join" style="margin-right: 50px;">개인 회원가입</div>
						<div onclick="btnCompanyJoin()" class="btn_join">기업 회원가입</div>
                    </div>
                </form>
            </div>
        </div>

<script>
        function btnCompanyJoin(){
        	location.href = "/companyJoinForm";
        }
        
    	function btnPersonJoin(){
    		location.href = "/personJoinForm";
    	}
            $("#btnLogin").click(() => {
                let username = $("#username").val();
                let password = $("#password").val();
                let data = {
                    username: username,
                    password: password
                };
                $.ajax("/login", {
                    type: "POST",
                    dataType: "json",
                    data: JSON.stringify(data),
                    headers: {
                        "Content-Type": "application/json"
                    }
                }).done((res) => {
                    if (res.code == 1) {
                        alert("성공!");
                        location.href = "/";
                    }
                    else
                        alert("아이디 혹은 비밀번호를 다시 입력하세요!");
                });
            });

</script>
<%@ include file="../layout/footer.jsp"%>