
let friends = {
    list: document.querySelector('ul.people'),
    all: document.querySelectorAll('.left_people_field .person'),
    name: ''
  },
  chat = {
    container: document.querySelector('.right_container'),
    current: null,
    person: null,
    name: document.querySelector('.right_top_field')
  }
  friends.all.forEach(f => {
	  f.addEventListener('mousedown', () => {
	    f.classList.contains('active') || setAciveChat(f)
	  })
});

function setAciveChat(f) {
  console.log(f)
  let email = $(".wrapper").data("id");
  $(".write").css("display", "block")
  if(friends.list.querySelector('.active') != null) {
	  friends.list.querySelector('.active').classList.remove('active')	  
  } 
  f.classList.add('active')
  chat.current = chat.container.querySelector('.active-chat')
  chat.person = f.getAttribute('data-chat')
  if(chat.current != null) {
	  chat.current.classList.remove('active-chat');
  }
  chat.container.querySelector('[data-chat="' + chat.person + '"]').classList.add('active-chat')
  friends.name = f.querySelector('.name').innerText
  chat.name.innerHTML = `<span><span class="name">${friends.name}</span></span>`
  let countTag = $(`li[data-chat=${chat.person}] .count`);
  countTag.addClass("hideCount");
  countTag.attr("count", 0);
  let sendData =  {chatNo:$(`div[data-chat=${chat.person}]`).data("no"), userType:$(f).data("type")}
  let options = {
		url : "chatList.do",
		type : "POST",
		contentType : "application/json",
		data : JSON.stringify(sendData)
  }
  $.ajax(options).done(data => {
		makeAjaxChatList(data, email);
		
  }).fail(() => {
		 alert("ajax 처리 에러발생");
  });
}
function makeAjaxChatList(data, email) {
	let chatArea ="";
	data.forEach((ele,i)=> {
		chatArea = $(`div[data-chat="person${ele.chatNo}"`);
		if (email == ele.userEmail) {
			if (ele.covstReads == 1){
				chatArea.append(
					`
						<div class='bubble me'>${ele.covstContent}</div>
					`		
				)
			} else {
				chatArea.append(
					`
						<div class='bubble me'>${ele.covstContent}</div>
					`		
				)
			}
		} else {
			if (ele.covstReads == 1){
				chatArea.append(
					`
						<div class='bubble you'>${ele.covstContent}</div>
					`		
				)
			} else {
				chatArea.append(
					`
						<div class='bubble you'>${ele.covstContent}</div>
					`		
				)
			}
		}
	})
	$(".right_message_field").scrollTop($(".right_message_field")[0].scrollHeight)
}
let ws = null;
let email = $(".wrapper").data("id");
let person = null;
let peopleField = null;
$(document).scrollTop($(document).height());

function insertData () {
	let $msg = $("input[data-chatfield='chat']");
	if($msg.val() != "") {
		 
		let selectChat = $(".right_message_field .chat");
		for(let selChat of selectChat) {
			if($(selChat).hasClass('active-chat')) {
				person = $(selChat);
			}
		}
		let peopleArea = $(".people .person");
		for (let people of peopleArea) {
			if ($(people).hasClass('active')) {
				peopleField = $(people);
			}
		}
		let sendData = {userEmail : $(".wrapper").data("id"), covstContent: $msg.val(), chatNo:person.data("no"), userType:peopleField.data("type")}	
		let options = {
				url : "insertChat.do",
				type : "POST",
				contentType : "application/json",
				data : JSON.stringify(sendData)
		}
		$.ajax(options).done(data => {
			
		}).fail(() => {
			alert("ajax 처리 에러발생");
		});
		person.append("<div class='bubble me'>"+ $msg.val() + "</div></span>");
		person.parent().scrollTop(person.parent()[0].scrollHeight);
		peopleField.children(".preview").text($msg.val());
		peopleField.children(".time").text(nowDate());
		$msg.val("");
		ws.send(JSON.stringify(sendData));
	}
}
$(() => {
	ws = new WebSocket("ws://192.168.0.11/doublecome/chatting.do");	
	ws.onopen = () => {
		console.log("채팅 접속")
	};
	
	
	ws.onmessage = (evt) => {
		let data = JSON.parse(evt.data);
		let chatArea = $(`div[data-no=${data.chatNo}]`);
		if(chatArea.hasClass("active-chat")){			
			let options = {
					url : "deleteReads.do",
					type : "POST",
					contentType : "application/json",
					data : JSON.stringify(data)
			}
			$.ajax(options).done(data => {
				
			}).fail(() => {
				alert("reads업데이트 처리 에러발생");
			});
			$(`li[data-chat="person${data.chatNo}"] .time`).text(nowDate())
			$(`li[data-chat="person${data.chatNo}"] .preview`).text(data.covstContent)
			chatArea.append(
				`
				<div class='bubble you'>${data.covstContent}</div>
				`
			)
			$(".right_message_field").scrollTop($(".right_message_field")[0].scrollHeight)
		} else {
			let sendData = {
				chatNo : data.chatNo,
				userType : data.userType
			}
			let options = {
					url : "updateReads.do",
					type : "POST",
					contentType : "application/json",
					data : JSON.stringify(sendData)
	   	    }
		    $.ajax(options).done(countdata => {
		    	console.log("데이터들어옴2")
		    	let countTag = $(`li[data-chat="person${data.chatNo}"] .count`);
		    	console.log("카운터 탭"+ countTag)
		    	$(countTag).attr("count",countdata);
		    	countTag.removeClass("hideCount");
		    	$(`li[data-chat="person${data.chatNo}"] .time`).text(nowDate())
		    	$(`li[data-chat="person${data.chatNo}"] .preview`).text(data.covstContent)
			}).fail(() => {
			    alert("ajax 처리 에러발생");
			});
		}
		
		
	};
	ws.onerror = (evt) => {
		$("#result").append("<div>웹소켓 에러 발생 : " + evt.data + "</div>");
	};
	ws.onclose = () => {
		$("#result").append("<div>웹소켓 연결 종료</div>");
	};
	
});
function nowDate() {
	let d = new Date();
	let hours = d.getHours();
	let minutes = d.getMinutes();
	let time ="";
	if (d.getHours() < 12) {
		let hoursLength = hours + "";
		let minutesLength = minutes + "";
		if (hoursLength.length == 1) {
			hours = "0" + hours
		}
		if (minutesLength.length == 1) {
			minutes = "0" + minutes
		}		
		time = hours+":"+minutes;
		
	} else {
		hours = hours - 12;
		let hoursLength = hours + "";
		let minutesLength = minutes + "";
		if (hoursLength.length == 1) {
			hours = "0" + hours
		}
		if (minutesLength.length == 1) {
			minutes = "0" + minutes
		}
		time = hours+":"+minutes;
	}
	return time;
}
function makeSearchList(data) {
	console.log("데이터 값" + data)
	$peopleArea = $("<ul class='people'></ul>")
	if (data.length == 0){
		return $peopleArea.html(`
			<div class="failure">
				<div>검색하신 경매는 존재하지 않습니다</div>
				<div>검색어를 다시 입력해주세요</div>
			</div>
				
		`)  
	} 
	data.forEach((chat, i) => {
		if (chat.userEmailSeller == $("wrapper").data("id")) {
			let showCount = "count";
			if (chat.readsSeller === 0) {
				showCount = " hideCount"
			}
			if (chat.covstRegDate === undefined) {
				$peopleArea.append(`
						<li class="person" data-chat="person${chat.chatNo}" data-file-code="${chat.fileGroupCode}" data-type=1>
						<span class="${showCount}" count="${chat.readsSeller}">
						<img src="/doublecome/resources/images/macbook.jpg">
						</span>
						<span class="name" data-title="${chat.auctionTitle}" data-no="${chat.chatNo}">${chat.auctionTitle}</span>
						<span class="time"></span>			                            				                            	
						<span class="preview">대화를 시작하세요</span>
						</li>                    			
				`)
			} else {
				let regDate = dateformat(chat.covstRegDate)
				$peopleArea.append(`
						<li class="person" data-chat="person${chat.chatNo}" data-file-code="${chat.fileGroupCode}" data-type=1>
						<span class="${showCount}" count="${chat.readsSeller}">
						<img src="/doublecome/resources/images/macbook.jpg">
						</span>
						<span class="name" data-title="${chat.auctionTitle}" data-no="${chat.chatNo}">${chat.auctionTitle}</span>
						<span class="time">${regDate}</span>		                            	
						<span class="preview">${chat.covstContent}</span>
						</li>             
				`)
			}
		} else {
			let showCount = "count";
			if (chat.readsSeller === 0) {
				showCount = " hideCount"
			}
			if (chat.covstRegDate == null) {
				$peopleArea.append(`
						<li class="person" data-chat="person${chat.chatNo}" data-file-code="${chat.fileGroupCode}" data-type=1>
						<span class="${showCount}" count="${chat.readsBuyer}">
						<img src="/doublecome/resources/images/macbook.jpg">
						</span>
						<span class="name" data-title="${chat.auctionTitle}" data-no="${chat.chatNo}">${chat.auctionTitle}</span>
						<span class="time"></span>			                            				                            	
						<span class="preview">대화를 시작하세요</span>
						</li>                    			
				`)
			} else {
				let regDate = dateformat(chat.covstRegDate)
				$peopleArea.append(`
						<li class="person" data-chat="person${chat.chatNo}" data-file-code="${chat.fileGroupCode}" data-type=1>
						<span class="${showCount}" count="${chat.readsBuyer}">
						<img src="/doublecome/resources/images/macbook.jpg">
						</span>
						<span class="name" data-title="${chat.auctionTitle}" data-no="${chat.chatNo}">${chat.auctionTitle}</span>
						<span class="time">${regDate}</span>		                            	
						<span class="preview">${chat.covstContent}</span>
						</li>             
				`)
			}
		}
	})
	
	return $peopleArea;
}
function dateformat(date) {
	let target_time = date / 1000;
	target_time = target_time % 86400;
	let hours = parseInt(target_time / 3600) + "";
	target_time = target_time % 3600;
	let minutes = parseInt(target_time / 60) + "";
	if (hours < 12) {
		let hoursLength = hours + "";
		let minutesLength = minutes + "";
		if (hoursLength.length == 1) {
			hours = "0" + hours
		}
		if (minutesLength.length == 1) {
			minutes = "0" + minutes
		}		
		time = hours+":"+minutes;
		
	} else {
		hours = hours - 12;
		let hoursLength = hours + "";
		let minutesLength = minutes + "";
		if (hoursLength.length == 1) {
			hours = "0" + hours
		}
		if (minutesLength.length == 1) {
			minutes = "0" + minutes
		}
		time = hours+":"+minutes;
	}
	return time;
}

$(document).ready(function(){
	$(".left_top_field a").click(() => {
		let searchKeyWord = $(".left_top_field input").val();
		let sendData = {email : $(".wrapper").data("id"), searchValue : searchKeyWord }
		let options = {
			url : "searchChat.do",
			type : "POST",
			contentType : "application/json",
			data : JSON.stringify(sendData)
	  }
	  $.ajax(options).done(data => {
		  $(".left_people_field").html(makeSearchList(data));
		  checkCount();
	  }).fail(() => {
			 alert("ajax 처리 에러발생");
	  });
	})	
	$(".left_top_field input").keypress((e) => {
		if(e.keyCode == 13) {	
			let searchKeyWord = $(".left_top_field input").val();
				let sendData = {email : $(".wrapper").data("id"), searchValue : searchKeyWord }
				let options = {
						url : "searchChat.do",
						type : "POST",
						contentType : "application/json",
						data : JSON.stringify(sendData)
				}
				$.ajax(options).done(data => {
					$(".left_people_field").html(makeSearchList(data));
					checkCount();
				}).fail(() => {
					alert("ajax 처리 에러발생");
				});
			}
		
	})	
	$(".write a").click(() => {
		insertData();		
		$("input[data-chatfield='chat']").focus();
	});
    $("input[data-chatfield='chat']").keypress(function (e) {
     if (e.keyCode  == 13){
    	 insertData();
     }
 });
});

$(document).on('mousedown', '.left_people_field .person', function() {
	this.classList.contains('active') || setAciveChat(this)
})