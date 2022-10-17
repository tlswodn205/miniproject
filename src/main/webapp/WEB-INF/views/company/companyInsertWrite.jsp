<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="../layout/header.jsp"%>

<body class="d-flex flex-column h-100">

	<main class="flex-shrink-0">
		<!-- Body-->
		<div class="container mt-3">
			<div class="flex">
				<input type="hidden" id="companyId" value="${company.companyId}">
				<h2>${company.companyName}</h2>
				<div style="width: 400px;">
					<div class="form-group">
						<input type="file" id="file" accept="image/*"
							onchange="setThumbnail(event)">
						<div id="imageContainer"></div>
					</div>
				</div>
			</div>
			<div class="mb-3 mt-3">
				<label for="comment">기업소개</label>
				<textarea id="introduction" class="form-control" rows="5"
					placeholder="내용을 입력해주세요.">${company.introduction}</textarea>
			</div>
			<div class="mb-3 mt-3">
				<label for="comment">연혁</label>
				<textarea id="history" class="form-control" rows="5"
					placeholder="내용을 입력해주세요.">${company.history}</textarea>
			</div>
			<div class="mb-3 mt-3">
				<label for="comment">기업목표</label>
				<textarea id="companyGoal" class="form-control" rows="5"
					placeholder="내용을 입력해주세요.">${company.companyGoal}</textarea>
			</div>
			<button id="btnsave" type="button" class="btn btn-primary"
				onclick="save">작성완료</button>
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
		
		
		function save() {
			
			let formData = new FormData();
			
			let data = {
				introduction: $("#introduction").val(),
				history: $("#history").val(),
				companyGoal: $("#companyGoal").val()
			}
			
			formData.append('file', $("#file")[0].files[0]);
			formData.append('companyInsertDto', new Blob([ JSON.stringify(data) ], {type : "application/json"}));
		    
			
			alert($("#companyId").val());
			
			$.ajax("/company/companyInsert/" +$("#companyId").val(), {
				type: "POST",
		        data : formData,
		        processData: false,    
		   		contentType: false, 
				enctype : 'multipart/form-data'
			}).done((res) => {
				if (res.code == 1) { // 성공
					alert($("#companyId").val());
					location.href = "/";
				} else { // 실패
					alert("기업 이력등록에 실패하였습니다.");
				}
			});
		}
	</script>

					
		<%@ include file="../layout/footer.jsp"%>