let bidWs = null;

$(() => {
  // 접속할 주소를 설정 : 웹소켓 핸들러 구현 클래스와 연결된 URL
  bidWs = new WebSocket("wss://192.168.0.12:8443/doublecome/bid.do");
  bidWs.onopen = () => {
    console.log("연결성공");
  };

  bidWs.onmessage = evt => {
    console.log("데이터 옴");
    let dataObj = JSON.parse(evt.data);
    $(".realTModal").hide();

    if (dataObj.msgType == "solo") {
      soloMessage(dataObj);
      return;
    }

    if (dataObj.bidType == "bidding") {
      $bidSpace = $(".bidSpace");
      $bid = $(`<div class="bid">
						<span>${dataObj.userId}님이 ${dataObj.maxPrice}원 입찰!</span>
					</div>`);
      $bidSpace.append($bid);
      setTimeout(() => {
        bidRemove($bid);
      }, 5000);

      $(".maxBidPrice").each((i, ele) => {
        $(ele).text(dataObj.maxPrice);
      });
    } else {
      $(".auctionInfo").html(
        $(`      <div style="width: 100%;">
        <h2>즉시구매로</h2>
      </div>
      <div style="width: 100%;">
        <h2>경매종료</h2>
      </div>`)
      );

      
      $(".realTModal").remove();

      $bidSpace = $(".bidSpace");
      $bid = $(`<div class="bid">
						<span>${dataObj.userId}님이 ${dataObj.maxPrice}원으로 즉시 구매!</span>
					</div>`);
      $bidSpace.append($bid);
      setTimeout(() => {
        bidRemove($bid);
      }, 5000);
    }
  };

  bidWs.onerror = evt => {
    console.log("웹소켓 에러 발생 : " + evt.data);
  };

  bidWs.onclose = () => {
    console.log("연결종료");
  };
});

function bid() {
  let $bid = $(".mSuggestBid input");
  let price = $bid.val();
  let bidType = "bidding";

  if (price != "") {
    bidWs.send(JSON.stringify({ bidType, price }));
    $bid.val("");
  }
}

function purchase() {
  let price = $(".nowBid span:eq(1)").text();
  let bidType = "purchase";

  if (price != "") {
    bidWs.send(JSON.stringify({ bidType, price }));
  }
}

//입찰이벤트
$("#sendBidBtn").click(() => {
  bid();
});

$("#sendPurchaseBtn").click(() => {
  if (confirm("즉시구매하시겠습니까?")) {
    purchase();
  }
});

//입찰알림 삭제
function bidRemove($bid) {
  $bid.remove();
}

function soloMessage(dataObj) {
  if (dataObj.access == "denied") {
    alert("로그인 후에 이용하실 수 있습니다.");
    return;
  }

  if (dataObj.bidType == "bidding") {
    alert("입찰에 성공하셨습니다.");
  } else {
    alert("즉시구매에 성공하셨습니다.");
  }
}
