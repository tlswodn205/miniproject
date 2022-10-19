// 1. 수정하기 버튼을 클릭하면 이벤트가 실행됨
$("#btnPersonUpdate").click(() => {
	if ($("#password").val() != $("#passwordCheck").val()) {
		alert("비밀번호가 일치하지 않습니다");
		return;
	}
	updatePerson();
});



// 2. 수정 메서드가 실행됨
function updatePerson() {
	// 1. form에 있는 데이터를 다 가져오기
	let data = {
		userId: $("#userId").val(),
		password: $("#password").val(),
		personName: $("#personName").val(),
		personPhone: $("#personPhone").val(),
		isGender: $("#isGender").val(),
		address: $("#address").val(),
		degree: $("#degree").val(),
		career: $("#career").val(),
		personEmail: $("#personEmail").val() + $("#emailAddress").val()
	};
	$.ajax("/api/personMypage", {
		type: "PUT",
		dataType: "json", // 응답 데이터
		data: JSON.stringify(data), // http body에 들고갈 요청 데이터
		headers: { // http header에 들고갈 요청 데이터
			"Content-Type": "application/json; charset=utf-8"
		}
	}).done((res) => {
		if (res.code == 1) {
			alert("게시글 수정 완료");
			location.href = "/personMypage/" ;
		} else {
			alert("업데이트에 실패하였습니다");
		}
	});
}