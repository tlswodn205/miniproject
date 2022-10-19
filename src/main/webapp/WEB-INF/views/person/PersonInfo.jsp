<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<link rel="stylesheet" href="css/workEnter.css">
<%@ include file="../layout/header.jsp"%>

<style>
            .personDetail_container {
               margin: 50px 0 50px 300px;
                width: 700px;
                border: 2px solid lightslategray;
                padding: 50px 10px 100px 10px;
                
            }
            .personDetail_container h2 {
                padding-top: 0;
            }
            .personDetail_container .btn_like:hover {
                background-color: #0d6efd;
            }
            .personDetail_container .line {
                width: 597px;
                border-bottom: 2px solid lightslategray;
                margin: 25px 0 80px 0;
            }
            .resumeWrite_container_info {
                width: 80%;
                padding: 0;
                margin-right: -40px;
                margin-left: 80px
            }
            .personDetail_container .resumeWrite_container_info .input-group span {
                width: 100px;
                text-align: left;
                padding-left: 20px;
            }
            .resumeWrite_container_info .input-group span:last-child {
                padding: 5px 5px 5px 25px;
                width: 80%;
            }
            .resumeWrite_container_info .input-group textarea {
                width: 953px;
                height: 300px;
            }
            .blueBtn {
                background-color: #0d6efd;
                width: 80px;
                height: 30px;
                border: none;
                color: white;
                border-radius: 0.25rem;
            }
            .greyBtn {
                width: 80px;
                height: 30px;
                border: none;
                background-color: lightslategray;
                color: white;
                border-radius: 0.25rem;
            }
        </style>

        <div class="container mt-3">
            <div class="personDetail_container">
                <div class="d-flex justify-content-center">
                    <h2> ${personInfoDto[0].personName}</h2>
                    <div class="d-flex flex-column">
                    
                    <div class="d-flex justify-content-start">
                    추천수 : <span id="recommendCount">   ${recommendDetailDto.recommendCount}</span>
                    </div>
                    <c:if test="${principal.role =='company'}">
                        <div id="recommendBtnDiv">
                        <button id="recommendBtn" class="${recommendDetailDto.recommendId != null ? 'blueBtn' : 'greyBtn'}">
                                ${recommendDetailDto.recommendId != null ? '추천취소' : '추천'}
                            </button></div>
                    </c:if>
                    </div>
                </div>
                <div class="line" style="width: 100%;"></div>
                <c:forEach var="personInfo" items="${personInfoDto}">
                    <div class="d-flex justify-content-center">
                        <input id="personId" type="hidden" value="${personInfo.personId}" />
                        <input id="userId" type="hidden" value="${personInfo.userId}" />
                        <div class="resumeWrite_container_info">
                            <div class="input-group mb-3">
                                <span class=" input-group-text"> 연락처 </span>
                                <span>${personInfo.personPhone}</span>
                            </div>
                            <div class="input-group mb-3">
                                <span class=" input-group-text"> 성별 </span>
                                <span>
                                    <c:if test="${personInfo.isGender == true}">남자</c:if>
                                    <c:if test="${personInfo.isGender == false}">여자</c:if>
                                </span>
                            </div>
                            <div class="input-group mb-3">
                                <span class=" input-group-text"> 거주지 </span>
                                <span>${personInfo.address}</span>
                            </div>

                            <div class="input-group mb-3">
                                <span class=" input-group-text"> 학력 </span>
                                <span>${personInfo.degree}</span>
                            </div>
                            <div class="input-group mb-3">
                                <span class=" input-group-text"> 경력 </span>
                                <span>${personInfo.career}</span>
                            </div>
                            <div class="input-group mb-3">
                                <span class=" input-group-text"> 이메일 </span>
                                <span>${personInfo.personEmail}</span>
                            </div>

                            <div class="input-group mb-3">
                                <span class=" input-group-text"> 기술스택 </span>
                                <span>
                                    <c:forEach var="personSkillInfo" items="${personSkillInfoDto}">
                                        <input id="personSkillId" type="hidden" value="${personSkillInfo.personSkillId}" />
                                        ${personSkillInfo.skill}
                                    </c:forEach>
                                </span>
                            </div>
                        </div>
                    </div>
                </c:forEach>
            </div>
            </div>

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