
($.ajax({
	url: "/doublecome/user/bidList.do",
	data: {email: $("#email").html()},
	success: (result) =>{
		if(result.length !== 0)
		$('#bidList').append(`<h2 id="bidTitle">입찰 내역</h2>`)
		for(i = 0; i < result.length; i++){
			console.log(result[i]);
			$('#bidList').append(
				`<div class="card_container${result[i].auctionCnt % 2}">
				<a id="aution" href="/doublecome/auction/detailAuction.do?no=${result[i].auctionNo}&userEmail=${result[i].userEmail}">
					<img src="/doublecome/file/downLoadFile.do?fileNo=${result[i].fileNo}" alt="" class="card_image" >
					<div class="aution_title"><div class="card_autionTitle">${result[i].auctionTitle}</div></div>
					<div class="card_sub_now">즉시 구매 가:<span class="card_content">${result[i].auctionBuyNow}</span></div>
					<div class="card_sub_date">경매 마감 일:<span class="card_content">${result[i].auctionLimitDate}</span></div>
				</a>				
				</div>`
			);

		}			


	}
}));

$(document).on("click", ".asd", () => {
	Swal.fire({
		title: '탈퇴 하시겠습니까',
		/*text: "회원가입 혹은 로그인후 진행해주세요",*/
		type: 'warning',
		showCancelButton: true,
		confirmButtonColor: '#3085d6',
		cancelButtonColor: '#d33',
		confirmButtonText: '확인',
		cancelButtonText: '취소'
	}).then((result) => {
		if (result.value) {
			return true;
		} else if (result.dismiss === Swal.DismissReason.cancel) {
			return false;
		}
	})
	
})

$(document).on("click", "#deleteBtn", () => {
	Swal.fire({
        title: '탈퇴 하시겠습니까',
        /*text: "회원가입 혹은 로그인후 진행해주세요",*/
        type: 'warning',
        showCancelButton: true,
        confirmButtonColor: '#3085d6',
        cancelButtonColor: '#d33',
        confirmButtonText: '확인',
        cancelButtonText: '취소'
      }).then((result) => {
        if (result.value) {
        	   $("#pa").submit()
        } else if (result.dismiss === Swal.DismissReason.cancel) {
        	return false;
        }
      })
})