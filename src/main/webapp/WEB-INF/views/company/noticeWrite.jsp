<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

    
<%@ include file="../layout/header.jsp"%>
    <style>
        h2 {
            text-align: center;
            margin: 10px 0 40px 0;
        }

        .noticeWrite_container {
            width: 1200px;
            border: 2px solid lightslategray;
            border-radius: 1%;
            padding: 25px;
        }

        .noticeWrite_title {
            margin: 10px;
        }

        .noticeWrite_title input {
            width: 70%;
            border: 1px solid lightslategray;
        }

        .flex {
            display: flex;
        }



        .flex div {
            margin: 10px 5px 10px 10px;
        }
    </style>
        <div class="container mt-3">
			<input type="hidden" id="companyId" value="${company.companyId}">
            <div class="noticeWrite_container">
                    <h2>
                    	채용공고등록
                    </h2>
                    <div>
                        <div class="noticeWrite_title">제목 : <input id="noticeTitle" type="text" placeholder="제목을 입력해주세요."></br></div>
                        <div class="flex">
                            <div class="flex_1">
                            	급여 : <input id="salary" type="text" style="border: 1px solid lightslategray;">만원
                           </div>
                            <div class="flex_1">
                            	학력 : <select id = "degree">
                                    <option selected="selected">고졸</option>
                                    <option>대졸 전공</option>
                                    <option>대졸 비전공</option>
                                </select>
                            </div>
                            <div class="flex_1">
                            	경력 : <select id= "career">
                                    <option selected="selected">0</option>
                                    <option>1</option>
                                    <option>2</option>
                                    <option>3</option>
                                    <option>4</option>
                                    <option>5</option>
                                    <option>6</option>
                                    <option>7</option>
                                    <option>8</option>
                                    <option>9</option>
                                    <option>10</option>
                                </select>
                            </div>
                       		<div>
                       		
                       		<span>기술스택 : </span>
								<label>java</label> <input onclick="getSkill(1)" name="id" type="checkbox"
								class="form-check-input" value="java"> <label>javaScript </label> <input onclick="getSkill(2)"
								name="id" type="checkbox" class="form-check-input" value="javaScript"> <label>HTML/CSS</label> <input
								onclick="getSkill(3)" name="id" type="checkbox" class="form-check-input" value="HTML/CSS">  <label>MySQL </label> <input
								onclick="getSkill(4)" name="id" type="checkbox" class="form-check-input" value="MySQL"> <label>AWS </label> <input
								onclick="getSkill(5)" name="id" type="checkbox" class="form-check-input" value="AWS"> <label>Flutter </label>	<input
								onclick="getSkill(6)" name="id" type="checkbox" class="form-check-input" value="Flutter">
							</div>

                       </div>
                       
                       
                    </div>
                    <div class="mb-3 mt-3">
                        <label for="comment"></label>
                        <textarea id="noticeContent" class="form-control" rows="5" placeholder="내용을 입력하세요" style="width:1145px; height: 500px;"></textarea>
                    </div>
                    <div>
                        <button id="noticeInsertBtn" class="btn btn-primary" style="margin: 0 0 0 1020px; ">작성완료</button>
                    </div>
            </div>
            </br>
            </br>
        </div>


        <!-- Footer-->
        <footer class="bg-dark py-4 mt-auto">
            <div class="container px-5">
                <div class="row align-items-center justify-content-between flex-column flex-sm-row">
                    <div class="col-auto">
                        <div class="small m-0 text-white">Copyright &copy; Your Website 2022</div>
                    </div>
                    <div class="col-auto">
                        <a class="link-light small" href="#!">Privacy</a>
                        <span class="text-white mx-1">&middot;</span>
                        <a class="link-light small" href="#!">Terms</a>
                        <span class="text-white mx-1">&middot;</span>
                        <a class="link-light small" href="#!">Contact</a>
                    </div>
                </div>
            </div>
        </footer>
        <!-- Bootstrap core JS-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
        <!-- Core theme JS-->
        <script>
        
        let skillList = new Array();
        
        function getSkill(id){

        	var arr = new Array();

        	$("input:checkbox[name='id']").each(function() {
        		if ($(this).is(":checked") == true) {
        			arr.push($(this).val());
        		}
        	});
        	console.log(arr);
        	skillList = arr
        }


        $("#noticeInsertBtn").click(()=>{
        	let data={
        			companyId : $("#companyId").val(),
        			noticeTitle : $("#noticeTitle").val(),
        			career : $("#career").val(),
        			salary : $("#salary").val(),
        			degree : $("#degree").val(),
        			noticeContent : $("#noticeContent").val(),
        			needSkill : skillList
        	}
        	
        	console.log(data);
        	
        	$.ajax("/company/noticeInsert",{
        		type:"POST",
        		dataType: "json",
        		data: JSON.stringify(data),
        		headers: {
        			"Content-Type": "application/json"
        		}
        	}).done((res)=>{
        		if(res.code == 1){
        			alert("공고 등록 완료!!");
        			location.href="/company/noticeLoad";
        		}
        		else{}
        	});
        });
        
        
        
        </script>