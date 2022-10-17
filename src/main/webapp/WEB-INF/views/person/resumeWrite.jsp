<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<link rel="stylesheet" href="css/workEnter.css">
<%@ include file="../layout/header.jsp"%>

<div class="container mt-3">
	<h2>
		이력서 제목 : <input type="text" class="form-control" id="resumeTitle" placeholder="이력서 제목" >
	</h2>
	<form>
		<input id="personId" type="hidden" value="${person.personId}" />
		<div class="mb-3 mt-3"></div>
		<div class="flex">

			<div class="form-group">
				<input type="file" id="file" accept="image/*"
					onchange="setThumbnail(event)">
				<div id="imageContainer"></div>
			</div>

			<div>
				이름 : ${person.personName}</br> 
				이메일 : ${person.personEmail}</br> 
				경력 : ${person.career}년차</br>
				학력 : ${person.degree}</br>
				거주지 : ${person.address}
				<div>
					<form>
						<c:forEach var="skills" items="${person.personSkillList}"> ${skills.skill}</c:forEach>
					</form>
				</div>
				링크 : <input type="text" class="form-control" id="myCloud" placeholder="링크" ></br> 
				간단소개 :
				<textarea id="introduction" class="form-control" rows="5" cols="75" placeholder="간단소개"></textarea>
				</br>
			</div>
		</div>
		<button id="btnsave" type="button" class="btn btn-primary" onclick="save">등록하기</button>
	</form>
</div>

<script>

$("#btnsave").click(() => {
	save();
});

function setThumbnail(event) {
    let reader = new FileReader();
    
    reader.onload = function(event) {


        if(document.getElementById("newImg")){
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
	formData.append('resumeWriteDto', new Blob([ JSON.stringify(data) ], {type : "application/json"}));
    
    $.ajax("/resume/save", {
        type: "POST",
        data : formData,
        processData: false,    
   		contentType: false, 
		enctype : 'multipart/form-data'
    }).done((res) => {
        if (res.code == 1) {
        	alert("이력서 등록 성공");
            location.href = "/";
        }else{
        	location.reload();
        }
    });
}            

</script>
<%@ include file="../layout/footer.jsp"%>