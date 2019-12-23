
($.ajax({
	url: "/doublecome/user/bidList.do",
	data: {email: $("#email").html()},
	success: (result) =>{
		if(result.length !== 0){
			$('#bidList').append(`<h2 id="bidTitle">입찰 내역</h2>`)
			
			let Dday = new Date(`${format(result[0].auctionLimitDate, "hms")}`);
			
			function CountDownTimer(dt, id){
				let end = new Date(dt);
				
				let _second = 1000;
				let _minute = _second * 60;
				let _hour = _minute * 60;
				let _day = _hour * 24;
				let timer;
				
				function showRemaining() {
					let now = new Date();
					let distance = end - now;
					if (distance < 0) {
						
						clearInterval(timer);
						document.getElementById(id).innerHTML = '종료된 경매';
						
						return;
					}
					let days = Math.floor(distance / _day);
					let hours = Math.floor((distance % _day) / _hour);
					let minutes = Math.floor((distance % _hour) / _minute);
					let seconds = Math.floor((distance % _minute) / _second);
					
					if(days != 0){
						document.getElementById(id).innerHTML = days + '일 ';
						document.getElementById(id).innerHTML += hours + '시간 ';
						document.getElementById(id).innerHTML += minutes + '분 ';
						/*document.getElementById(id).innerHTML += seconds + '초';*/
					}else if(days == 0 && hours != 0){
						document.getElementById(id).innerHTML = hours + '시간 ';
						document.getElementById(id).innerHTML += minutes + '분 ';
						/*document.getElementById(id).innerHTML += seconds + '초';*/
					}else if(days == 0 && hours == 0)
						document.getElementById(id).innerHTML = minutes + '분 ';
					/*document.getElementById(id).innerHTML += seconds + '초';*/
				}
				
				timer = setInterval(showRemaining, 1000);
			}
		}
		
		
		
		
		for(i = 0; i < result.length; i++){
			
			$('#bidList').append(
				`<div class="card_container${result[i].auctionCnt % 2}">
				<a id="aution" href="/doublecome/auction/detailAuction.do?no=${result[i].auctionNo}&userEmail=${result[i].userEmail}">
					<img src="/doublecome/file/downLoadFile.do?fileNo=${result[i].fileNo}" alt="" class="card_image" >
					<div class="aution_title"><div class="card_autionTitle">${result[i].auctionTitle}</div></div>
					<div class="card_sub_now">즉시 구매 가:<span class="card_content">${result[i].auctionBuyNow}</span></div>
					<div class="card_sub_date">경매 마감 일:<span id="remainTime${result[i].auctionCnt}" class="card_content">${format(result[i].auctionLimitDate, "Mdhms")}</span></div>
				</a>				
				</div>`
			);

			CountDownTimer(`${format(result[i].auctionLimitDate, "hms")}`, `remainTime${result[i].auctionCnt}`); 
		}	
		
	}
}));










$(document).on("click", "#deleteBtn", () => {
	Swal.fire({
        title: '탈퇴 하시겠습니까',
        text: "진행중인 판매 경매가 존재 할 경우 탈퇴 하실 수 없습니다.",
        type: 'warning',
        showCancelButton: true,
        confirmButtonColor: '#3085d6',   
        cancelButtonColor: '#d33',
        confirmButtonText: '확인',
        cancelButtonText: '취소'
      }).then((result) => {
        if (result.value) {
        	$.ajax({
        		url:"/doublecome/user/checkAuction.do",
        		data: {email: $("#email").html()},
        		success: (r) => {
        			console.log(r.length , 'r.length')
        			console.log(r.auctionCount , 'r.auctionCount')
        			if(r.length == 1 && r.auctionCount == 1){        				
        				$("#d").submit()
        			}else{
        				Swal.fire({
        					title: "진행중인 판매 경매가 존재 합니다.",
        				})
        			}
        		}
        	})
        } else if (result.dismiss === Swal.DismissReason.cancel) {
        	return false;
        }
      })
})