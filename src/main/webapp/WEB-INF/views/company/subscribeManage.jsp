<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<style>
ul {
	list-style: none;
}

h2 {
	text-align: center;
	margin: 20px 0 30px 0;
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
	padding: 50px;
	transition: transform .1s;
	margin: 20PX;
}

.resumeManage_container li:hover {
	background-color: lightslategray;
	border: 1px solid lightslategray;
	transform: scale(1.05);
}

.resumeManage_container li:hover button {
	
}

.resumeManage_container .info {
	
}

.resumeManage_container .div {
	
}

.resumeManage_container .title {
	font-size: 30px;
	padding-top: 20px;
}

.resumeManage_container .date {
	font-size: 18px;
}

.resumeManage_container ul li button {
	background-color: #00000000;
	float: right;
	padding: 5px;
	margin: 3px;
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

<%@ include file="../layout/header.jsp"%>
<main class="flex-shrink-0">
	<!-- Body-->
	<div class="container mt-3">

		<div class="resumeManage_container">
			<h2>구독 관리</h2>
			<ul>
				<c:forEach var="subscribeDto" items="${subscribeDtoList}">
					<li>
						<div class="info">
							<div class="div">
								<div class="title">${subscribeDto.companyName}</div>
							</div>
							<div class="category">
								<button onclick = "getDelete(${subscribeDto.subscribeId})" class="delete">구독삭제하기</button>
							</div>
						</div>
					</li>
				</c:forEach>

			</ul>
		</div>
	</div>
	<br> <br>


	<!-- Footer-->
	<footer class="bg-dark py-4 mt-auto">
		<div class="container px-5">
			<div
				class="row align-items-center justify-content-between flex-column flex-sm-row">
				<div class="col-auto">
					<div class="small m-0 text-white">Copyright &copy; Your
						Website 2022</div>
				</div>
				<div class="col-auto">
					<a class="link-light small" href="#!">Privacy</a> <span
						class="text-white mx-1">&middot;</span> <a
						class="link-light small" href="#!">Terms</a> <span
						class="text-white mx-1">&middot;</span> <a
						class="link-light small" href="#!">Contact</a>
				</div>
			</div>
		</div>
	</footer>
	<!-- Bootstrap core JS-->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
	<!-- Core theme JS-->
	<script src="js/scripts.js"></script>
	
	<script>
	function getDelete(id){


			$.ajax("/company/deleteSubscribe/"+id, {
				type: "delete",
				dataType: "json"
			}).done((res) => {
				if (res.code == 1) {
					console.log("구독 취소 완료");	
				} else {
					alert("구독 취소 실패");
				}
			});
	}

	
	</script>

	</body>

	</html>