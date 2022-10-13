<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="../layout/header.jsp"%>
<!-- Body-->
<div class="container mt-3">
	<h2>구직자 추천 리스트</h2>
	<ul style = "list-style:none; display: flex; justify-content: space-between;">
		<li id="techButton">
			기술
			</br>
		<label >Python</label>
		<input onclick="getSkill(1)" name="id" type="checkbox" class="form-check-input" value="Python" > 
		<label >Spring Framework</label>
		<input onclick="getSkill(2)" name="id" type="checkbox" class="form-check-input" value="Spring Framework" > 
		<label >AWS</label>
		<input onclick="getSkill(3)" name="id" type="checkbox" class="form-check-input" value="AWS" > 
		<label >Git</label>
		<input onclick="getSkill(4)" name="id" type="checkbox" class="form-check-input" value="Git" > 
			</br>
		<label >iOS</label>
		<input onclick="getSkill(5)" name="id" type="checkbox" class="form-check-input" value="iOS" > 
		<label >HTML</label>
		<input onclick="getSkill(6)" name="id" type="checkbox" class="form-check-input" value="HTML" > 
		<label >JavaScript</label>
		<input onclick="getSkill(7)" name="id" type="checkbox" class="form-check-input" value="JavaScript" > 
		<label >MySQL</label>
		<input onclick="getSkill(8)" name="id" type="checkbox" class="form-check-input" value="MySQL" > 
			</br>
		<label >Linux</label>
		<input onclick="getSkill(9)" name="id" type="checkbox" class="form-check-input" value="Linux" > 
		<label >Android</label>
		<input onclick="getSkill(10)" name="id" type="checkbox" class="form-check-input" value="Android" > 
		<label >Kotlin</label>
		<input onclick="getSkill(11)" name="id" type="checkbox" class="form-check-input" value="Kotlin" > 
		<label >Swift</label>
		<input onclick="getSkill(12)" name="id" type="checkbox" class="form-check-input" value="Swift" >
					</br>
	<button id ="skillBtn" type="button" class="btn btn-primary">기술별 구직자 찾기</button>
		</li>
		<li id = "degreeButton">학력</br>			
					<select id="degree">
						<option>학력 선택</option>
						<option>고졸</option>
						<option>대졸 전공</option>
						<option>대졸 비전공</option>
					</select>
					</br>
					</br>
					</br>
					</br>
	<button id ="degreeBtn" type="button" class="btn btn-primary">학력별 구직자 찾기</button>
		</li>
		<li id = "careerButton">경력	</br>
					<select id="career">
						<option >경력 선택</option>
						<option value="0">신입</option>
						<option>1</option>
						<option>2</option>
						<option>3</option>
						<option>4</option>
						<option>5</option>
						<option>6</option>
						<option>7</option>
						<option>8</option>
						<option>9</option>
						<option>10</option>
					</select> <label class="">년차</label>
					</br>
					</br>
					</br>
					</br>
	<button id ="careerBtn" type="button" class="btn btn-primary">경력별 구직자 찾기</button>
		</li>
	</ul>
	
	<table class="table table-hover">
		<thead>
			<tr>
				<th>이름</th>
				<th>이력</th>
				<th>구직자상세보기</th>
			</tr>
		</thead>
		<tbody id="personList">
			<c:forEach var="person" items="${interestPersonDto}">
				<tr>
					<td>${person.personName}</td>
					<td>(${person.career}) | ${person.degree} | ${person.address} </br>
					
						<c:forEach var="skills" items="${person.personSkillList}">
							${skills.skill} |
						</c:forEach>
					</td>
					<td>
						<button type="button" class="btn btn-primary">구직자 상세보기</button>
					</td>				
				</tr>
			</c:forEach>
		</tbody>
	</table>
</div>


<script>
	
function getSkill(id) {

	var arr = new Array();

	$("input:checkbox[name='id']").each(function() {
		if ($(this).is(":checked") == true) {
			arr.push($(this).val());
		}
	});
	console.log(arr);
	return arr;
}

$("#degreeBtn").click(() => {
	console.log($("#degree").val());

	$.ajax("/person/interestPersonList/degree?degree="+$("#degree").val(), {
		type: "Post",
		dataType: "json",
		headers: {
			"Content-Type": "application/json"
		}
	}).done((res) => {
		if (res.code == 1) {
			alert("구직자 호출 완료");
			$("#personList").empty();
			renderPersonList(res.data);
		} else {
			alert("구직자호출실패");
		}
	});
});


$("#careerBtn").click(() => {
	console.log($("#career").val());

	$.ajax("/person/interestPersonList/"+$("#career").val() + "/career", {
		type: "get",
		dataType: "json",
		headers: {
			"Content-Type": "application/json"
		}
	}).done((res) => {
		if (res.code == 1) {
			console.log("구직자 호출 완료");
			$("#personList").empty();
			alert(res.data);
			renderPersonList(res.data);
		} else {
			alert("구직자호출실패");
		}
	});
});


$("#skillBtn").click((id) => {
	let ids = getSkill(id);

	$.ajax("/person/interestPersonList/personSkill", {
		type: "Post",
		dataType: "json",
		data: JSON.stringify(ids),
		headers: {
			"Content-Type": "application/json"
		}
	}).done((res) => {
		if (res.code == 1) {
			console.log("구직자 호출 완료");
			$("#personList").empty();
			renderPersonList(res.data);
		} else {
			alert("구직자호출실패");
		}
	});
});


function renderPersonList(interestPersonDtos){
	for(var interestPersonDto of interestPersonDtos){
		$("#personList").append(makePersonItem(interestPersonDto));
	}
}

function makePersonItem(person){
	var item = `<tr>`;
	item += `<td>\${person.personName}</td>`;
	item += `<td>\${person.career} | \${person.degree} | \${person.address} </br>`;
	for(var personSkill of person.personSkillList){item +=  makeSkillItem(personSkill);}
	item += `</td>`;
	item +=	`<td><button type="button" class="btn btn-primary">구직자 상세보기</button></td>`;
	item += `</tr>`;
	return item;
}

function makeSkillItem(personSkill){
	
	var item =`\${personSkill.skill} | `;
	return item;
}

</script>

<%@ include file="../layout/footer.jsp"%>