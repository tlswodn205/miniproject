<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<link rel="stylesheet" href="css/workEnter.css">
<%@ include file="../layout/header.jsp"%>

    <style>
        .resumeWrite_container {
            width: 1200px;
            border: 2px solid lightslategray;
            margin: 50px;
            padding-top: 25px;
        }

        .resumeWrite_container h2 {
            padding-top: 20px;
        }

        .resumeWrite_container_title input {
            width: 90%;
            height: 60px;
            margin-left: 5%;
        }

        .line {
            width: 597px;
            border-bottom: 2px solid lightslategray;
            margin: 25px 0;
        }

        .resumeWrite_container_photo {
            width: 150px;
            padding-left: 10%;
            margin: 0 30px;
        }

        .resumeWrite_container_photo photo {
            width: 117px;
            height: 156px;
            background-color: lightslategray;
        }

        .resumeWrite_container_info {
            width: 80%;
            padding: 0;
        }

        .resumeWrite_container_info .input-group span {
            width: 100px;
            text-align: center;
        }

        .resumeWrite_container_info .input-group span:last-child {
            padding: 5px;
            width: 40%;
        }

        .resumeWrite_container_info .input-group textarea {
            width: 953px;
            height: 300px;
        }



        .btn_insert {
            margin: 10px 35px 20px 0;
            padding: 8px 3%;
            border: 1px solid lightslategray;
            background-color: lightslategray;
            color: white;
            border-radius: 0.25rem;
        }

        .btn_insert:hover {
            background-color: #0d6efd;
        }
    </style>	
<div class="container mt-3">
            <div class="resumeWrite_container">
                <div class="resumeWrite_container_title"><c:choose>
									<c:when test="${person.userId==principal.userId}"><input type="text" class="form-control" value = "${person2.resumeTitle}"></c:when>
									<c:otherwise> <h2>${person2.resumeTitle}</h2> </c:otherwise>
								</c:choose></div>
                <div class="line" style="width: 100%;"></div>
                <div class="d-flex justify-content-start">
                    <div class="d-flex flex-column">
						<input id="personId" type="hidden" value="${person.personId}" /> 
						<input id="resumeId" type="hidden" value="${person2.resumeId}" />
                        
                        <div class="resumeWrite_container_photo">
							<div id="imageContainer"></div>   
                        	<img  class = "photo" src="/img/${person2.photo}"  style="width: 200px; height: 300px;"> <!-- 사진 사이즈 조절 -->
                        </div>

                        <div class="d-flex justify-content-end"> 
                        	<c:if test="${person.userId==principal.userId}">
                        		<input id="btnsave" type="file"  accept="image/*" onchange="setThumbnail(event)">  
                        	</c:if>
                        </div>

                    </div>
                    <div class="resumeWrite_container_info">
                        <div class="input-group mb-3">
                            <span class=" input-group-text"> 이름 </span>
                            <span>${person.personName}</span>
                        </div>
                        <div class="input-group mb-3">
                            <span class=" input-group-text"> 이메일 </span>
                            <span>${person.personEmail}</span>
                        </div>
                        <div class="input-group mb-3">
                            <span class=" input-group-text"> 학력 </span>
                            <span>${person.degree}</span>
                        </div>
                        <div class="input-group mb-3">
                            <span class=" input-group-text"> 경력 </span>
                            <span>${person.career}년차</span>
                        </div>
                        <div class="input-group mb-3">
                            <span class=" input-group-text"> 거주지 </span>
                            <span>${person.address}</span>
                        </div>
                        <div class="input-group mb-3">
                            <span class=" input-group-text"> 기술스택 </span>
                            <span> <c:forEach var="skills" items="${person.personSkillList}"> ${skills.skill}</c:forEach></span>
                        </div>
                        <div class="input-group mb-3">
                            <span class=" input-group-text"> 링크 </span>
                            	<c:choose>
									<c:when test="${person.userId==principal.userId}"><input type="text" class="form-control" value = "${person2.myCloud}"></c:when>
									<c:otherwise> <span>${person2.myCloud}</span> </c:otherwise>
								</c:choose>
                        </div>
                        <div class="input-group mb-3">
                            <div class="d-flex flex-column"><span class=" input-group-text"> 자기소개 </span>
                                <textarea class="form-control" rows="5">${person2.introduction}</textarea>

                            </div>

                        </div>
                    </div>
                </div>
                <div class="d-flex justify-content-end"><c:if test="${person.userId==principal.userId}"><button class="btn_insert">수정하기</button></c:if>
                </div>
            </div>
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