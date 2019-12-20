
($.ajax({
	url: "/doublecome/user/bidList.do",
	data: {email: $("#email").html()},
	success: (result) =>{
		if(result.length !== 0)
		$('#bidList').append(`<h2 id="bidTitle">입찰 내역</h2>`)
		
		console.log(`${format(result[0].auctionLimitDate, "Mdhms")}`)
		
		
		
		let Dday = new Date(`${format(result[0].auctionLimitDate, "hms")}`);
	/*	setInterval( () => {*/
		let day = new Date();
		
		let remainTime = Dday - day
		let rday = new Date(remainTime);
		console.log(rday ,'rday');
		console.log(`${format(rday, "Mdhms")}` ,'rday');
		$("#remainTime").html(`${format(rday, "Mdhms")}`)
		/*}, 1000);*/
		
		
		CountDownTimer(rday, 'remainTime'); // 2017년 1월 1일까지

		function CountDownTimer(dt, id)
		{
		var end = new Date(dt);

		var _second = 1000;
		var _minute = _second * 60;
		var _hour = _minute * 60;
		var _day = _hour * 24;
		var timer;

		function showRemaining() {
		var now = new Date();
		var distance = end - now;
		if (distance < 0) {

		clearInterval(timer);
		document.getElementById(id).innerHTML = '종료된 경매';

		return;
		}
		var days = Math.floor(distance / _day);
		var hours = Math.floor((distance % _day) / _hour);
		var minutes = Math.floor((distance % _hour) / _minute);
		var seconds = Math.floor((distance % _minute) / _second);

		document.getElementById(id).innerHTML = days + '일 ';
		document.getElementById(id).innerHTML += hours + '시간 ';
		document.getElementById(id).innerHTML += minutes + '분 ';
		document.getElementById(id).innerHTML += seconds + '초';
		}

		timer = setInterval(showRemaining, 1000);
		}
		
		
		for(i = 0; i < result.length; i++){
			console.log(result[i]);
			$('#bidList').append(
				`<div class="card_container${result[i].auctionCnt % 2}">
				<a id="aution" href="/doublecome/auction/detailAuction.do?no=${result[i].auctionNo}&userEmail=${result[i].userEmail}">
					<img src="/doublecome/file/downLoadFile.do?fileNo=${result[i].fileNo}" alt="" class="card_image" >
					<div class="aution_title"><div class="card_autionTitle">${result[i].auctionTitle}</div></div>
					<div class="card_sub_now">즉시 구매 가:<span class="card_content">${result[i].auctionBuyNow}</span></div>
					<div class="card_sub_date">경매 마감 일:<span id="remainTime" class="card_content">${format(result[i].auctionLimitDate, "Mdhms")}</span></div>
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
        	   $("#d").submit()
        } else if (result.dismiss === Swal.DismissReason.cancel) {
        	return false;
        }
      })
})