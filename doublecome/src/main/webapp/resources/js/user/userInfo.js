/*
$('a').click( (e) => {
	e.preventDefault();
	let pass = $("#pass").text();
	console.log(pass);
	console.log($("#registInput").val());
	if($("#registInput").val() !== pass){
		alert("비밀번호가 다릅니다")
		return;
	}
})*/
($.ajax({
	url: "/doublecome/user/bidList.do",
	data: {email: $("#registInput").html()},
	success: (result) =>{console.log(result, "z")
						
					$('#bidList').html(result)}
}))

