<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file="../layout/header.jsp"%>
<!-- Body-->
<style>
.my_box {
	margin-bottom: 5px;
	align-items: center;
}


.person-table td {
	align-items: center;
}
</style>
<div class="container mt-3">
	<h2>기술별 기업 리스트</h2>
	<hr />
	<div class="my_box d-flex justify-content-between">
			<div>
				<label>java</label> <input onclick="getSkill(1)" name="id" type="checkbox"
				class="form-check-input" value="java"> <label>javaScript</label> <input onclick="getSkill(2)"
				name="id" type="checkbox" class="form-check-input" value="javaScript"> <label>HTML/CSS</label> <input
				onclick="getSkill(3)" name="id" type="checkbox" class="form-check-input" value="HTML/CSS"> <label>MySQL</label> <input
				onclick="getSkill(4)" name="id" type="checkbox" class="form-check-input" value="MySQL"> <label>AWS</label> <input
				onclick="getSkill(5)" name="id" type="checkbox" class="form-check-input" value="AWS"> <label>Flutter</label> <input
				onclick="getSkill(6)" name="id" type="checkbox" class="form-check-input" value="Flutter">
			</div>

		<button id="skillBtn" type="button" class="btn btn-primary">기술별 구직자 찾기</button>
	</div>

	<table class=" my_box table table-hover">
		<thead>
		</thead>
		<tbody id = "companyList">
			<c:forEach var="company" items="${companyRecommendList}">
				<tr>
					<td>${company.companyName} </br> 추천수 : ${company.recommendCount}</td>
					<td>${company.noticeTitle}</br>
					${company.career==0 ? "신입": company.career} | ${company.degree} | ${company.address} | ${company.salary}</br>

					<c:forEach var="Skills" items="${company.needSkillList}">
					${Skills.skill} 
					</c:forEach>
					</br>
					${company.createdAt}</td>
					<td>
						<button type="button" class="btn btn-primary">기업 상세보기</button>
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


function renderCompanyList(CompanyRecommendDtoList){
	for(var CompanyRecommendDto of CompanyRecommendDtoList){
		$("#companyList").append(makePersonItem(CompanyRecommendDto));
	}
}


function makePersonItem(company){
	var item = `<tr>`;
	item += `<td>\${company.companyName} </br> 추천수 : \${company.recommendCount}</td>`;
	item += `<td>\${company.noticeTitle}</br>`;
	item += `\${company.career==0 ? "신입": company.career} | \${company.degree} | \${company.address} | \${company.salary}</br>`;
	for(var companySkill of company.needSkillList){item +=  makeSkillItem(companySkill);}
	item += `</br>\${company.createdAt}</td>`;
	item +=	`<td><button type="button" class="btn btn-primary">기업 상세보기</button></td>`;
	item += `</tr>`;
	return item;
}

function makeSkillItem(companySkill){
	
	var item =`\${companySkill.skill} | `;
	return item;
}
</script>
<%@ include file="../layout/footer.jsp"%>