<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

    <%@ include file="../layout/header.jsp" %>
        <!-- Body-->
        <style>
            ul {
                list-style: none;
            }
            .main_container {
                padding-top: 10px;
            }
            .main_container .mainNoticeTitle {
                margin: 60px 0 40px 35%;
                width: 400px;
                font-size: 20px;
                text-align: center;
                border: 2px solid lightslategray;
                font-weight: 900;
                padding: 10px;
            }
            .main_container ul li {
                padding: 12px;
                margin: 1.5%;
                width: 380px;
                border: 2px solid lightslategray;
                border-radius: 0.25rem;
            }
            .main_container ul li div {
                margin: 5px;
            }
            .main_container .companyname {
                margin: 10px 5px;
                font-size: 25px;
            }
        </style>
        <div class="container mt-3 d-flex justify-content-center">
            <div class="main_container ">
                <div class="main_photo"><img class="card-img-top" src="https://dummyimage.com/1300x400/adb5bd/495057" alt="..." /></div>
                <div class="mainNoticeTitle">기업 공고 리스트</div>
                <div class="mainNoticeList">
                    <ul class="d-flex flex-wrap">
                        <li>
                            <div>
                                <div><img class="card-img-top" src="https://dummyimage.com/400x150/adb5bd/495057" alt="..." /></div>
                                <div class="companyname">공고 제목</div>
                                <div class="d-flex flex-column">
                                    <div>기업명 : </div>
                                    <div>급여 : </div>
                                    <div>근무지 : </div>
                                    <div>기술스택 : </div>
                                </div>
                            </div>
                        </li>
                        <li>
                            <div>
                                <div><img class="card-img-top" src="https://dummyimage.com/400x150/adb5bd/495057" alt="..." /></div>
                                <div class="companyname">공고 제목</div>
                                <div class="d-flex flex-column">
                                    <div>기업명 : </div>
                                    <div>급여 : </div>
                                    <div>근무지 : </div>
                                    <div>기술스택 : </div>
                                </div>
                            </div>
                        </li>
                        <li>
                            <div>
                                <div><img class="card-img-top" src="https://dummyimage.com/400x150/adb5bd/495057" alt="..." /></div>
                                <div class="companyname">공고 제목</div>
                                <div class="d-flex flex-column">
                                    <div>기업명 : </div>
                                    <div>급여 : </div>
                                    <div>근무지 : </div>
                                    <div>기술스택 : </div>
                                </div>
                            </div>
                        </li>
                        <li>
                            <div>
                                <div><img class="card-img-top" src="https://dummyimage.com/400x150/adb5bd/495057" alt="..." /></div>
                                <div class="companyname">공고 제목</div>
                                <div class="d-flex flex-column">
                                    <div>기업명 : </div>
                                    <div>급여 : </div>
                                    <div>근무지 : </div>
                                    <div>기술스택 : </div>
                                </div>
                            </div>
                        </li>
                        <li>
                            <div>
                                <div><img class="card-img-top" src="https://dummyimage.com/400x150/adb5bd/495057" alt="..." /></div>
                                <div class="companyname">공고 제목</div>
                                <div class="d-flex flex-column">
                                    <div>기업명 : </div>
                                    <div>급여 : </div>
                                    <div>근무지 : </div>
                                    <div>기술스택 : </div>
                                </div>
                            </div>
                        </li>
                        <li>
                            <div>
                                <div><img class="card-img-top" src="https://dummyimage.com/400x150/adb5bd/495057" alt="..." /></div>
                                <div class="companyname">공고 제목</div>
                                <div class="d-flex flex-column">
                                    <div>기업명 : </div>
                                    <div>급여 : </div>
                                    <div>근무지 : </div>
                                    <div>기술스택 : </div>
                                </div>
                            </div>
                        </li>
                    </ul>
                </div>
            </div>
        </div>

        <script>
        </script>
        <%@ include file="../layout/footer.jsp" %>