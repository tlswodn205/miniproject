 <%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<link rel="stylesheet" href="css/workEnter.css">
<%@ include file="../layout/header.jsp"%>
<style>
        .blueBtn{
            background-color: #0d6efd;
        }
        .greyBtn{
            background-color: lightslategray;
        }
</style>
<section class="py-5">

	<div class="container">
		<div class="view">	<div>
		추천수 : <span id="recommendCount">${recommendDetailDto.recommendCount}</span>
		<div>
			<c:if test="${principal.role =='company'}">
				<div id= "recommendBtnDiv">
					<button id = "recommendBtn" class ="${recommendDetailDto.recommendId != null ? 'blueBtn' : 'greyBtn'}">
						${recommendDetailDto.recommendId != null ? '추천취소' : '추천'}
					</button>
				</div>
			</c:if>
		</div>
	</div>
			<c:forEach var="personInfo" items="${personInfoDto}"  >
				<form>
				
					<input id="personId" type="hidden" value="${personInfo.personId}" />
					<input id="userId" type="hidden" value="${personInfo.userId}" />


					<div class="mb-3 mt-3">
						<label for="uname">이름 : ${personInfo.personName}</label>
					</div>

					<div class="mb-3">
						<label for="email">연락처 : ${personInfo.personPhone}</label>
					</div>

					성별 :
					<c:if test="${personInfo.isGender == true}">남자</c:if>
					<c:if test="${personInfo.isGender == false}">여자</c:if>

					<br>
					<div class="mb-3">
						<label for="email">거주지 : ${personInfo.address}</label>
					</div>
					<div class="mb-3">
						<label class="">학력 : ${personInfo.degree}</label>
					</div>
					<div class="mb-3">
						<label class="">경력 : ${personInfo.career}</label> <label class="">년차</label>
					</div>
					<label for="email" class=""> 이메일 :
						${personInfo.personEmail} </label>
					<p>
						기술 스택 : 
						<c:forEach var="personSkillInfo" items="${personSkillInfoDto}" >
								<input id="personSkillId" type="hidden" value="${personSkillInfo.personSkillId}" />		
								${personSkillInfo.skill}
						</c:forEach>
					</p>
				</form>
			</c:forEach>
				
			
		</div>
	</div>
</section>

<script>

$("#recommendBtn").click(() => {
    $.ajax("/person/recommend/" + $("#userId").val(), {
        type: "post",
        dataType: "json"
    }).done((res) => {
    	if(res.code==1){
	    	if(res.data.recommendId==null){
	    		$("#recommendBtn").removeClass("blueBtn");
	    		$("#recommendBtn").addClass("greyBtn");
	    		$("#recommendBtn").text("추천");
	    		$("#recommendCount").text(res.data.recommendCount);
	    	}else{
	    		$("#recommendBtn").removeClass("greyBtn");
	    		$("#recommendBtn").addClass("blueBtn");
	    		$("#recommendBtn").text("추천취소");
	    		$("#recommendCount").text(res.data.recommendCount);
	    	}
    	}
    });
});
</script>

<%@ include file="../layout/footer.jsp"%>