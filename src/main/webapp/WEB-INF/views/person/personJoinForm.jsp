<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../layout/header.jsp"%>
<div class="container">
	<div class="view">
		<h2 style="margin-top: 10px;">개인 회원가입</h2>
		<hr />
		<form>
			<div style="width: 500px;">
				<div class="d-flex justify-content-between" style="margin-bottom: 20px;">
					아이디 <input id="username" type="text" class="form-control" placeholder="아이디를 입력하세요">
				</div>
				<div class="d-flex justify-content-between" style="margin-bottom: 20px;">
					비밀번호 <input id="password" type="password" class="form-control" placeholder="비밀번호를 입력하세요">
				</div>
				<div class="d-flex justify-content-between" style="margin-bottom: 20px;">
					비밀번호 확인 <input id="passwordCheck" type="password" class="form-control" placeholder="비밀번호를 입력하세요">
				</div>
			</div>
			<hr />
			<div style="width: 500px;">
				<div class="d-flex justify-content-between" style="margin-bottom: 20px;">
					이름 <input id="personName" type="text" class="form-control" placeholder="이름을 입력하세요">
				</div>
				<div class="d-flex justify-content-between" style="margin-bottom: 20px;">
					연락처 <input id="personPhone" type="tel" class="form-control" placeholder="연락처를 입력하세요">
				</div>
				<div class="d-flex justify-content-between" style="margin-bottom: 20px;">
					이메일 <input id="personEmail" type="tel" class="form-control" placeholder="이메일을 입력하세요">
				</div>
				<div class="d-flex" style="margin-bottom: 20px;">
					성별 
					<input type="radio" name="gender" value="1">남 
					<input type="radio" name="gender" value="0">여

				</div>
				<div class="d-flex justify-content-between" style="margin-bottom: 20px;">
					거주지 <input id="address" type="text" class="form-control" placeholder="거주지를 입력하세요">
				</div>
				<div class="d-flex justify-content-between" style="margin-bottom: 20px;">

					학력 <select id="degree">
						<option>학력 선택</option>
						<option>고졸</option>
						<option>대졸전공</option>
						<option>대졸 비전공</option>
					</select>
				</div>
				<div class="d-flex justify-space-around " style="margin-bottom: 20px;">
					<label class="">경력</label> 
					<select id="career">
						<option>경력 선택</option>
						<option value="0">신입</option>
						<option value="1">1</option>
						<option value="2">2</option>
						<option value="3">3</option>
						<option value="4">4</option>
						<option value="5">5</option>
						<option value="6">6</option>
						<option value="7">7</option>
						<option value="8">8</option>
						<option value="9">9</option>
						<option value="10">10</option>
					</select> <label class="">년차</label>
				</div>
				
				<div class="tech">
					<p>기술 스택</p>
					<div>
						<label>java</label> <input onclick="getSkill(1)" name="id" type="checkbox"
						class="form-check-input" value="java"> <label>javaScript</label> <input onclick="getSkill(2)"
						name="id" type="checkbox" class="form-check-input" value="javaScript"> <label>HTML/CSS</label> <input
						onclick="getSkill(3)" name="id" type="checkbox" class="form-check-input" value="HTML/CSS"> <label>MySQL</label> <input
						onclick="getSkill(4)" name="id" type="checkbox" class="form-check-input" value="MySQL"> <label>AWS</label> <input
						onclick="getSkill(5)" name="id" type="checkbox" class="form-check-input" value="AWS"> <label>Flutter</label> <input
						onclick="getSkill(6)" name="id" type="checkbox" class="form-check-input" value="Flutter">
					</div>

				</div>
				<button id="btnJoin" class="btn btn-primary" type="button">가입완료</button>
			</div>
		</form>
	</div>
</div>

<script>


	$("#btnJoin").click(()=>{
		let username = $("#username").val();
		let password = $("#password").val();
		let personName = $("#personName").val();
		let personPhone = $("#personPhone").val();
		let personEmail = $("#personEmail").val();
		let gender = $('input[name="gender"]:checked').val();
		let address	 = $('#address').val();
		let degree = $("#degree option:selected").val();
		let career = $("#career option:selected").val();
		let skillArr=[];
		$('input[name=skill]:checked').each(function(){
			let chk = $(this).val();
			skillArr.push(chk);
		});


		console.log(skillArr);
		
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
				personSkillList : skillArr
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