<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="../layout/header.jsp"%>

<style>
ul {
	list-style: none;
}

.flex {
	display: flex;
}

.skillPersonMatching_container {
	width: 1200px;
	padding-left: 200px;
}

.skillPersonMatching_container h2 {
	margin: 30px;
}

.skillPersonMatching_container ul {
	margin-bottom: 40px;
}

.skillPersonMatching_container ul li {
	border-bottom: 2px solid lightslategray;
	border-right: 2px solid lightslategray;
	border-left: 2px solid lightslategray;
	height: 100px;
	padding: 11px 20px 0 40px;
}

.skillPersonMatching_container ul li:first-child {
	border: 2px solid lightslategray;
}

.skillPersonMatching_container ul .skillCompany {
	height: 60px;
}

.skillPersonMatching_container ul .skillCompany .label {
	padding-top: 6px;
}

.skillPersonMatching_container li:hover {
	background-color: lightslategray;
}

.skillPersonMatching_container ul .skillCompany .btn_companyDetail {
	border: none;
	background-color: #0d6efd;
	color: white;
}

.skillPersonMatching_container ul .skillCompany:hover {
	background-color: white;
}

.skillPersonMatching_container .companyname {
	width: 100%;
	margin-right: 60px;
	padding-top: 1rem;
	font-size: 30px;
}

.skillPersonMatching_container .info {
	width: 100%;
}

.skillPersonMatching_container .content div {
	margin-top: 8px;
	border-right: 1px solid black;
	padding: 0 30px;
}

.skillPersonMatching_container .content div:first-child {
	padding-left: 0;
}

.skillPersonMatching_container .content div:last-child {
	border: none;
}

.skillPersonMatching_container .btn_companyDetail {
	float: right;
	padding: 5px 20px;
	border: 1px solid black;
	border-radius: 5%;
	background-color: white;
	margin: 0;
}

.skillPersonMatching_container .flex:hover .btn_companyDetail {
	background-color: lightslategray;
}

.skillPersonMatching_container .info .btn_companyDetail:hover {
	background-color: #0d6efd;
}
</style>


<!-- Body-->


<div class="container mt-3">
	<div class="skillPersonMatching_container">
		<h2 class="d-flex justify-content-center">기술별 구직자 매칭</h2>
		<ul>
			<li class="skillCompany">
				<div class=" d-flex justify-content-between">
					<div class="label">
						<label>java</label> <input onclick="getSkill(1)" name="id"
							type="checkbox" class="form-check-input" value="java"> <label>javaScript</label>
						<input onclick="getSkill(2)" name="id" type="checkbox"
							class="form-check-input" value="javaScript"> <label>HTML/CSS</label>
						<input onclick="getSkill(3)" name="id" type="checkbox"
							class="form-check-input" value="HTML/CSS"> <label>MySQL</label>
						<input onclick="getSkill(4)" name="id" type="checkbox"
							class="form-check-input" value="MySQL"> <label>AWS</label>
						<input onclick="getSkill(5)" name="id" type="checkbox"
							class="form-check-input" value="AWS"> <label>Flutter</label>
						<input onclick="getSkill(6)" name="id" type="checkbox"
							class="form-check-input" value="Flutter">
					</div>
					<div>
						<button id="skillBtn" class="btn_companyDetail">구직자 검색</button>
					</div>
				</div>
			</li>
		</ul>
		<ul id="personList">
			<c:forEach var="person" items="${interestPersonDto}">
				<li class="flex">
					<div>
						<div class="companyname">${person.personName}</div>
					</div>
					<div class="info">
						<div class="content flex">
							<div>${person.career}년차</div>
							<div>${person.degree}</div>
							<div>${person.address}</div>
						</div>
						<div class="info">
							<button onclick="goInfo(${person.personId})" class="btn_companyDetail">구직자 상세보기</button>
						</div>
						<div class="content flex">
							<div>기술스택</div>

							<div class="skills">
								<c:forEach var="skills" items="${person.personSkillList}"> ${skills.skill}, </c:forEach>
							</div>

						</div>
					</div>
				</li>
			</c:forEach>
		</ul>
	</div>
</div>

<script>
        function goInfo(id){
			window.open("/PersonInfo/"+id, "", "_blank");
        }
        
        
       		function getSkill(id) {

                var arr = new Array();

                $("input:checkbox[name='id']").each(function () {
                    if ($(this).is(":checked") == true) {
                        arr.push($(this).val());
                    }
                });
                console.log(arr);
                return arr;
            }



            $("#skillBtn").click((id) => {
                let ids = getSkill(id);

                $.ajax("/person/skillPersonMatching/personSkill", {
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


            function renderPersonList(interestPersonDtos) {
                for (var interestPersonDto of interestPersonDtos) {
                    $("#personList").append(makePersonItem(interestPersonDto));
                }
            }

            function makePersonItem(person) {
                var item = `<li class="flex"><div><div class="companyname">\${person.personName}</div></div>`;
                item += `<div class="info"><div class="content flex"><div>\${person.career}년차</div>`;
                item += `<div>\${person.degree}</div>`;
                item += `<div>\${person.address}</div></div><div class="info"><button onclick="goInfo(\${person.personId})" class="btn_companyDetail">구직자 상세보기</button></div>`
                item += `<div class="content flex"><div>기술스택</div><div class="skills">`
                for (var personSkill of person.personSkillList) { item += makeSkillItem(personSkill); }
                item += `</div></div></div></li>`;
                return item;
            }

            function makeSkillItem(personSkill) {

                var item = `\${personSkill.skill}, `;
                return item;
            }

        </script>

<%@ include file="../layout/footer.jsp"%>