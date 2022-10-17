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
	<h2>기업 추천 리스트</h2>
	<hr />
	<div class="my_box d-flex justify-content-between">
	</div>

	<table class=" my_box table table-hover">
		<thead>
		</thead>
		<tbody>
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

	$.ajax("/company/interestNoticeList/noticeSkill", {
		type: "Post",
		dataType: "json",
		data: JSON.stringify(ids),
		headers: {
			"Content-Type": "application/json"
		}
	}).done((res) => {
		if (res.code == 1) {
			console.log("기업 호출 완료");
			$("#personList").empty();
			renderPersonList(res.data);
		} else {
			alert("기업 호출 실패");
		}
	});
});
</script>
<%@ include file="../layout/footer.jsp"%>