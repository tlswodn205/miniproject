<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="../layout/header.jsp"%>

<style>
h2 {
	margin: 40px 0 0 50px;
}

.flex {
	display: flex;
	justify-content: space-between;
}

.mb-3 label {
	width: 100px;
	text-align: center;
	padding: 5px;
	color: white;
	background-color: lightslategray;
	border-radius: 5%;
}

.mb-3 .form-control {
	width: 1140px;
}

.companyInfoWrite_container {
	width: 1200px;
	border: 2px solid lightslategray;
	padding: 25px;
	border-radius: 1%;
}
ul {
	list-style: none;
}

h2 {
	text-align: center;
	margin: 20px 0 30px 0;
}


        .noticeList_container {
            width: 1100px;
            padding-left: 200px;
        }

        .noticeList_container h2 {
            margin: 30px;
        }

        .noticeList_container ul {
            margin-bottom: 40px;
        }

        .noticeList_container ul li {
            border-top: 2px solid lightslategray;
            border-left: 2px solid lightslategray;
            border-right: 2px solid lightslategray;
            border-bottom: 1px solid lightslategray;
            height: 110px;
            padding: 15px 20px 0 50px;
        }

        .noticeList_container li:hover {
            background-color: lightslategray;
            border: 1px solid lightslategray;
        }

        .noticeList_container .title {

            font-size: 25px;
        }

        .noticeList_container .content div {
            margin-top: 8px;
            border-right: 1px solid black;
            padding: 0 30px;
        }

        .noticeList_container .content div:first-child {
            padding-left: 0;
        }

        .noticeList_container .content div:last-child {
            border: none;
        }

        .noticeList_container .info .btn_companyDetail {
            float: right;
            padding: 5px 20px;
            border: 1px solid black;
            border-radius: 5%;
            background-color: white;
        }

        .noticeList_container li:hover .btn_companyDetail {
            background-color: lightslategray;
        }

        .noticeList_container .info .btn_companyDetail:hover {
            background-color: #0d6efd;
        }
        
        .blueBtn{
            background-color: #0d6efd;
        }
        .greyBtn{
            background-color: lightslategray;
        }
        
        
</style>
<!-- Body-->
<div class="container mt-3">
	<input id="userId" type="hidden" value="${company.userId}">
	<div>
		<span>${company.companyName}</span>
		추천수 : <span id="recommendCount">${recommendDetailDto.recommendCount}</span>
		<div>
			<c:if test="${principal.role =='person' }">
				<div id= "subscribeBtnDiv">
					<button id = "subscribeBtn" class ="${subscribeId !=null ?'blueBtn' : 'greyBtn'}">
						${subscribeId !=null ? '구독취소': '구독'}
					</button>
				</div>
				<div id= "recommendBtnDiv">
					<button id = "recommendBtn" class ="${recommendDetailDto.recommendId != null ? 'blueBtn' : 'greyBtn'}">
						${recommendDetailDto.recommendId != null ? '추천취소' : '추천'}
					</button>
				</div>
			</c:if>
		</div>

	</div>
	<div class="companyInfoWrite_container">
		<div class="flex">
			<div class="form-group">
				<img src="/img/${company.photo}" style="width: 400px; height: 156px;">
				<div id="imageContainer"></div>
			</div>
		</div>
		<div class="mb-3 mt-3">
			<label for="comment">기업소개</label>
			<div class="form-control">
				<span> ${company.introduction} </span>
			</div>
		</div>
		<div class="mb-3 mt-3">
			<label for="comment">연혁</label>
			<div class="form-control">
				<span> ${company.history} </span>
			</div>
		</div>
		<div class="mb-3 mt-3">
			<label for="comment">기업목표</label>
			<div class="form-control">
				<span> ${company.companyGoal} </span>
			</div>
		</div>
	</div>

	</br> </br> </br>
	
	
        <div class="container mt-3">
            <div class="noticeList_container">
                <h2 class="d-flex justify-content-center">채용 공고 목록</h2>
                <ul>
				<c:forEach var="noticeRespDto" items="${noticeRespDtoList}">
                    <li>
                        <div class="info">
                            <div class="title">${noticeRespDto.noticeTitle}</div>
                            <div>
                                <button onclick="getDetail${noticeRespDtonoticeId})" class="btn_companyDetail">상세보기</button>
                            </div>
                            <div class="content d-flex justify-content-start">
                                <div>${company.address}</div>
                                <div>${noticeRespDto.salary}</div>
                                <div>${noticeRespDto.degree}</div>
                                <div>${noticeRespDto.createdAt}</div>
                            </div>
                        </div>
                    </li>		
		</c:forEach>
		</ul>

</div>


<!-- Footer-->
<footer class=" bg-dark py-4 mt-auto">
	<div class="container px-5">
		<div
			class="row align-items-center justify-content-between flex-column flex-sm-row">
			<div class="col-auto">
				<div class="small m-0 text-white">Copyright &copy; Your
					Website 2022</div>
			</div>
			<div class="col-auto">
				<a class="link-light small" href="#!">Privacy</a> <span
					class="text-white mx-1">&middot;</span> <a class="link-light small"
					href="#!">Terms</a> <span class="text-white mx-1">&middot;</span> <a
					class="link-light small" href="#!">Contact</a>
			</div>
		</div>
	</div>
</footer>
<!-- Bootstrap core JS-->
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
<!-- Core theme JS-->
<script>
	$("#subscribeBtn").click(() => {
		$.ajax("/company/subscribe/" + $("#userId").val(), {
	        type: "post",
	        dataType: "json"
		}).done((res) => {
	    	if(res.data==null){
	    		$("#subscribeBtn").removeClass("blueBtn");
	    		$("#subscribeBtn").addClass("greyBtn");
	    		$("#subscribeBtn").text("구독");
	    	}else{
	    		$("#subscribeBtn").removeClass("greyBtn");
	    		$("#subscribeBtn").addClass("blueBtn");
	    		$("#subscribeBtn").text("구독취소");
	    	}
	    });
	});



	$("#recommendBtn").click(() => {
	    $.ajax("/company/recommend/" + $("#userId").val(), {
	        type: "post",
	        dataType: "json"
	    }).done((res) => {
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
	    });
	});
	
</script>
<br />
<hr />
<div class="jumbotron text-center" style="margin-bottom: 0">
	<p>Created by Cos</p>
	<p>📞 010-2222-7777</p>
	<p>🏴 부산 부산진구 XX동</p>
</div>
</body>

</html>