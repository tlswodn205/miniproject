
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<style>
ul {
	list-style: none;
}

h2 {
	text-align: center;
	margin: 20px 0 30px 50px;
}

.down {
	float: right;
	margin: 35px 60px 0 0;
	padding: 5px;
	border: 1px solid black;
	border-radius: 5%;
}

.down:hover {
	background-color: #0d6efd;
}

.resumeManage_container {
	width: 1200px;
	border: 2px solid lightslategray;
	padding: 25px;
	height: 200px;
	margin-bottom: 20px;
	height: auto;
}

.resumeManage_container ul {
	padding: 0 2rem;
}

.resumeManage_container ul li {
	border: 2px solid lightslategray;
	height: 200px;
	padding: 42px 50px 0px 50px;
	transition: transform .1s;
	margin: 20PX;
}

.resumeManage_container li:hover {
	background-color: lightslategray;
	border: 1px solid lightslategray;
	transform: scale(1.05);
}

.resumeManage_container li:hover p {
	
}

.resumeManage_container .info .category {
	margin-bottom: 10px;
}

.resumeManage_container .flex {
	display: flex;
}

.resumeManage_container .title {
	padding-top: 25px;
	font-size: 30px;
}

.resumeManage_container .second div {
	font-size: 18px;
	margin: 5px 0 5px 20px;
}

.resumeManage_container .date {
	
}

.resumeManage_container ul li p {
	float: right;
	padding: 5px;
	border: 1px solid black;
	border-radius: 5%;
}

.resumeManage_container ul li .update:hover {
	background-color: #0d6efd;
}

.resumeManage_container ul li .delete:hover {
	background-color: #dc3545;
}
</style>

<link rel="stylesheet" href="css/workEnter.css">
<%@ include file="../layout/header.jsp"%>
<div class="container mt-3">

	<div class="resumeManage_container">
	<input type = "hidden" id="noticeId" value=${notice.noticeId}> 
		<div class="down" id="closed">마감하기</div>
		<h2>${notice.noticeTitle}</h2>

		<ul>
			<c:forEach var="person" items="${appliersDtoList}">
				<li>
					<div class="info">
						<div class="flex">
							<div class="title">${person.personName}</div>
							<div class="second">
								<div class="career">${person.career}</div>
								<div class="skill">
									<c:forEach var="Skills" items="${person.personSkillList}">
                                    ${Skills.skill}
                                    </c:forEach>
								</div>
								<div class="date">${person.createdAt}</div>
							</div>
						</div>
						<div class="category">
							<p class="update">지원자 이력서보기</p>
						</div>
					</div>
				</li>
			</c:forEach>
		</ul>
	</div>
</div>
<br>
<br>


<!-- Footer-->
<footer class="bg-dark py-4 mt-auto">
	<div class="container px-5">
		<div class="row align-items-center justify-content-between flex-column flex-sm-row">
			<div class="col-auto">
				<div class="small m-0 text-white">Copyright &copy; Your Website 2022</div>
			</div>
			<div class="col-auto">
				<a class="link-light small" href="#!">Privacy</a> <span class="text-white mx-1">&middot;</span> <a
					class="link-light small" href="#!">Terms</a> <span class="text-white mx-1">&middot;</span> <a
					class="link-light small" href="#!">Contact</a>
			</div>
		</div>
	</div>
</footer>

<script>

$("#closed").click(() => {
	$.ajax("/company/noticeClose/" + $("#noticeId").val(), {
		type: "Post",
		dataType: "json",
	}).done((res) => {
		if (res.code == 1) {
			console.log("마감 완료");
		} else {
			alert("마감 실패");
		}
	});
});
</script>
</body>

</html>