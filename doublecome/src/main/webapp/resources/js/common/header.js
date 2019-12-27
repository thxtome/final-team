$(".topContent>div:nth-child(4)>div:first").mouseover(()=>{
    $(".categoryBar").show();
})
$(".categoryBar").parent().mouseleave(()=>{
    $(".categoryBar").hide()
});
$("#movetomain").click(() => {
	location.href= '/doublecome/main.do';
})

$(() => {
	ws = new WebSocket("wss://192.168.0.36:8443/doublecome/chatting.do");	
	ws.onopen = () => {
		console.log("채팅 접속")
	};
	
	ws.onmessage = (evt) => {
	  let email = $(".topbar .readsCount").data("id");
	  let sendData = {'email':email}
	  console.log(sendData)
	  let options = {
			url : "/doublecome/chatting/readsCount.do",
			type : "POST",
			contentType : "application/json",
			data : email
	  }
	  $.ajax(options).done(data => {
		  console.log(data)
		  let sellerCount = 0;
		  let buyerCount = 0;
		  if (data.readsSeller != 0) {
			  sellerCount = data.readsSeller;
		  }
		  if (data.readsBuyer != 0) {
			  buyerCount = data.readsBuyer;
		  }
		  let readsCount = sellerCount + buyerCount;
		  $(".topbar .readsCount").attr("readsCount", readsCount);
		  console.log($(".topbar .readsCount").attr("readsCount"))
		  if ($(".topbar .readsCount").attr("readsCount") == 0) {
			  $(".topbar .readsCount").addClass("hideCount")
		  } 
	  }).fail(() => {
			 alert("ajax 처리 에러발생");
	  });
	};
	ws.onerror = (evt) => {
		$("#result").append("<div>웹소켓 에러 발생 : " + evt.data + "</div>");
	};
	ws.onclose = () => {
		$("#result").append("<div>웹소켓 연결 종료</div>");
	};
	
});
$(document).ready(() => {
	let userEmail = $(".topbar .readsCount").data("id");
	if (userEmail != null) {
		
	  let options = {
			url : "/doublecome/chatting/readsCount.do",
			type : "POST",
			contentType : "application/json",
			data : userEmail
	  }
	  $.ajax(options).done(data => {
		  console.log(data)
		  let sellerCount = 0;
		  let buyerCount = 0;
		  if (data.readsSeller != 0) {
			  sellerCount = data.readsSeller;
		  }
		  if (data.readsBuyer != 0) {
			  buyerCount = data.readsBuyer;
		  }
		  let readsCount = sellerCount + buyerCount;
		  $(".topbar .readsCount").attr("readsCount", readsCount);
		  console.log($(".topbar .readsCount").attr("readsCount"))
		  if ($(".topbar .readsCount").attr("readsCount") == 0) {
			  $(".topbar .readsCount").addClass("hideCount")
		  } else {
			  $(".topbar .readsCount").removeClass("hideCount")
		  }
	  }).fail(() => {
			 alert("ajax 처리 에러발생");
	  });
	}
})
$(".topContent .searchField").keypress((e) =>{
	if ($(e.target).val() != null){
		if(e.keyCode == 13) {
			let value = $(e.target).val();
			console.log(value)
			location.href = `/doublecome/auction/searchAuction.do?searchKeyWord=${value}`
		}
	}
})
$(".topContent .searchField").next().click(e => {
	if ($(e.target).prev().val() != null) {		
		local.href="/doublecome/auction/searchAuction.do?searchKeyWord=${value}"
	}
})