<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ include file="../layout/header.jsp" %>
        <!-- Body-->
        <div class="container mt-3">
            <h2>이력서제목</h2>
            <form action="/action_page.php">
                <div class="mb-3 mt-3">

                </div>
                <div class="flex">
                    <div>
                        <!-- <form action="upload" method="post" enctype="multipart/form-data">
                            <input name="file" type="file">
                            <button type="submit">작성</button>
                        </form> -->
                        <form method="get" action="form-action.html">
                            <img class="card-img-top" src="https://dummyimage.com/150x200/adb5bd/495057" alt="..." />

                            <p><input type="button" value="첨부하기"></p>
                        </form>
                    </div>
                    <div>
                        이름 : <input id="" type="text"></br>
                        이메일 : <input id="" type="text"></br>
                        학력 : <input id="" type="text"></br>
                        <div>
                            <form method="get" action="form-action.html">
                                <p>스킬</p>
                                <label><input type="checkbox" name="color" value="Python "> Python </label>
                                <label><input type="checkbox" name="color" value="Spring Framework"> Spring
                                    Framework</label>
                                <label><input type="checkbox" name="color" value="AWS "> AWS </label>
                                </br>
                                <label><input type="checkbox" name="color" value="Git"> Git </label>
                                <label><input type="checkbox" name="color" value="iOS"> iOS </label>
                                <label><input type="checkbox" name="color" value="HTML"> HTML </label>
                                <label><input type="checkbox" name="color" value="MySQL"> MySQL </label>
                                <p><input type="reset" value="Reset"></p>
                            </form>
                        </div>
                        링크 : <input id="" type="text"></br>
                        간단소개 : <textarea id="content" class="form-control" rows="5"></textarea></br>
                    </div>
                </div>
                <button type="submit" class="btn btn-primary">등록하기</button>
            </form>
        </div>


        <%@ include file="../layout/footer.jsp" %>