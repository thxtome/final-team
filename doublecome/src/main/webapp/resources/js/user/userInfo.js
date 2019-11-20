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
	success: (result) =>{console.log(result[0])
						
							for(i = 0; i < result.length; i++){
								$('#bidList').append(
									`<div class="card_container">
									<a id="aution" href="#">
										<img src="/doublecome/src/main/resources/css/user/defaultpfimg.jpeg" alt="사진" class="card_imag">
										<div class="vertical-line" style="height: 120px;"></div>
										<p><span class="card_autionTitle">${result[i].auctionTitle}</span></p>
										<p class="card_title">즉시 구매 가 <span class="card_content">${result[i].auctionBuyNow}</span><p>
										<p class="card_title">경매 마감 일<span class="card_content">${result[i].auctionLimitDate}</span><p>
									</a>				
									</div>`
								);

							}			
				
						}
}));

