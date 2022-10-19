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
                <div class="main_photo"><img class="card-img-top" src="/image/mainview.png" alt="..." / style = "width:1300px; height:400px"></div>
                <div class="mainNoticeTitle">기업 공고 리스트</div>
                <div class="mainNoticeList">
                    <ul class="d-flex flex-wrap">
                        <li>
                            <div>
                                <div><img class="card-img-top" src="/image/samsung.png" alt="..." /></div>
                                <div class="companyname">안드로이드 코딩 하실분 구합니다.</div>
                                <div class="d-flex flex-column">
                                    <div>기업명 : 삼성전자 </div>
                                    <div>급여 : 1억 </div>
                                    <div>근무지 : 베트남 </div>
                                </div>
                            </div>
                        </li>
                        <li>
                            <div>
                                <div><img class="card-img-top" src="/image/lg.png" alt="..." /></div>
                                <div class="companyname">공고 제목</div>
                                <div class="d-flex flex-column">
                                    <div>기업명 : LG전자 </div>
                                    <div>급여 : 1억 </div>
                                    <div>근무지 : 미국 </div>
                                </div>
                            </div>
                        </li>
                        <li>
                            <div>
                                <div><img class="card-img-top" src="/image/sk.jpg" alt="..." /></div>
                                <div class="companyname">sk 오지근무 하실 분</div>
                                <div class="d-flex flex-column">
                                    <div>기업명 : sk </div>
                                    <div>급여 : 3천만 </div>
                                    <div>근무지 : 독도 </div>
                                </div>
                            </div>
                        </li>
                        <li>
                            <div>
                                <div><img class="card-img-top" src="/Image/softbank.jpg" alt="..." /></div>
                                <div class="companyname">소프트뱅크 비전펀드 자산관리관 구합니다.</div>
                                <div class="d-flex flex-column">
                                    <div>기업명 : 소프트뱅크 </div>
                                    <div>급여 : 1억 </div>
                                    <div>근무지 : 일본 </div>
                                </div>
                            </div>
                        </li>
                        <li>
                            <div>
                                <div><img class="card-img-top" src="/image/fanuc.jpg" alt="..." /></div>
                                <div class="companyname">화낙 후지산 공장 직원 구합니다.</div>
                                <div class="d-flex flex-column">
                                    <div>기업명 : 화낙 </div>
                                    <div>급여 : 3억 </div>
                                    <div>근무지 : 후지산 </div>
                                </div>
                            </div>
                        </li>
                        <li>
                            <div>
                                <div><img class="card-img-top" src="/image/sony.png" alt="..." /></div>
                                <div class="companyname">OS 설계 가능한 사람 구합니다.</div>
                                <div class="d-flex flex-column">
                                    <div>기업명 : 소니 </div>
                                    <div>급여 : 4천만원 </div>
                                    <div>근무지 : 도쿄 </div>
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