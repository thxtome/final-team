
($.ajax({
	url: "/doublecome/user/bidList.do",
	data: {email: $("#email").html()},
	success: (result) =>{console.log(result[0]);
		if(result.length !== 0)
		$('#bidList').append(`<h2 id="bidTitle">입찰 내역</h2>`)
		for(i = 0; i < result.length; i++){
			$('#bidList').append(
				`<div class="card_container">
				<a id="aution" href="">
					<img src="/doublecome/resources/css/user/defaultpfimg.jpeg" alt="" class="card_image" >
					<div class="aution_title"><span class="card_autionTitle">${result[i].auctionTitle}</span></div>
					<div class="card_sub_now">즉시 구매 가:<span class="card_content">${result[i].auctionBuyNow}</span></div>
					<div class="card_sub_date">경매 마감 일:<span class="card_content">${result[i].auctionLimitDate}</span></div>
				</a>				
				</div>`
			);

		}			

	}
}));
/*
$('#updateFormBtn').click( ()=> {
	alert($('#email').html());
	$.ajax({
		url: "/doublecome/user/userInfoUpdate.do",
		data: {userEmail: $('#email').html(),
				userPass: $('#pass').html(),
				userPhnum: $('#phnum').html,
				userNickname: $('#nickname').html}
	})
});
*/