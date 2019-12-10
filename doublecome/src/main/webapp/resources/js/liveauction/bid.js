let bidWs = null;

$(() => {
	// 접속할 주소를 설정 : 웹소켓 핸들러 구현 클래스와 연결된 URL
	bidWs = new WebSocket("wss://192.168.0.12:8443/doublecome/bid.do");
	bidWs.onopen = () => {
		console.log("연결성공")
	};

	bidWs.onmessage = (evt) => {
		console.log("데이터 옴")
		let dataObj = JSON.parse(evt.data);
		$(".realTModal").hide();

		if(dataObj == 'false'){
			alert("로그인 후에 이용하실 수 있습니다.")
			return;
		} else if(dataObj == 'true') {
			alert("입찰 하셨습니다.")
			return;
		} else {
			$bidSpace = $(".bidSpace");
			$bid = $(`<div class="bid">
						<span>${dataObj.userId}님이 ${dataObj.maxPrice}원 입찰!</span>
					</div>`);
			$bidSpace.append($bid)		
			setTimeout(()=>{
				bidRemove($bid);
			},5000);

			$(".maxBidPrice").each((i,ele)=>{
				$(ele).text(dataObj.maxPrice);
			})
		}
	};	
	bidWs.onerror = (evt) => {
		console.log("웹소켓 에러 발생 : " + evt.data)
	};

	bidWs.onclose = () => {
		console.log("연결종료")
	};
});

function bid() {
	let $bid = $(".mSuggestBid input")
	let value = $bid.val();
	if (value != "") {
		bidWs.send(value);
		$bid.val("");
	}
}

$(".sendBidBtn").click(()=>{
	bid();	
})

function bidRemove($bid){
	$bid.remove();
}		