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
  console.log(chat.current)
  friends.name = f.querySelector('.name').innerText
  chat.name.innerHTML = `<span><span class="name">${friends.name}</span></span>`
  let countTag = $(`li[data-chat="person${chat.person}"] .count`);
  console.log(countTag)
  countTag.addClass("hideCount");
  countTag.attr("count", 0);
  let sendData =  {chatNo:$(`div[data-chat="person${chat.person}]`).data("no"), userType:$(f).data("type")}
  let options = {
		url : "chatList.do",
		type : "POST",
		contentType : "application/json",
		data : JSON.stringify(sendData)
  }
  $.ajax(options).done(data => {
		console.log(data)
		
  }).fail(() => {
		 alert("ajax 처리 에러발생");
  });
  $(`div[data-chat="person${chat.person}]`).append();
}
function makeAjaxChatList(data) {
	data.each((value, index) => {
		
	})
}
let ws = null;
let email = $(".wrapper").data("id");
let chatNo = $("div[data-chat='person2']").data("no");
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
		let sendData = {userEmail : $(".wrapper").data("id"), covstContent: $msg.val(), chatNo:person.data("no")}
		ws.send(JSON.stringify(sendData));
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
		person.append("<div class='bubble me'>"+ $msg.val() + "</div>");
		peopleField.children(".preview").text($msg.val());
		peopleField.children(".time").text(nowDate());
		$msg.val("");
	}
}
$(() => {
	ws = new WebSocket("ws://192.168.0.15/doublecome/chatting.do");	
	ws.onopen = () => {
		console.log("채팅 접속")
	};
	
	
	ws.onmessage = (evt) => {
		let count = 1;
		console.log(evt)
		let data = JSON.parse(evt.data);
		let chatArea = $(`div[data-no=${data.chatNo}]`);
		console.log("chatArea" + chatArea)
		if(chatArea.hasClass("active-chat")){			
			console.log("데이터들어옴1")
			$(`li[data-chat="person${data.chatNo}"] .time`).text(nowDate())
			$(`li[data-chat="person${data.chatNo}"] .preview`).text(data.covstContent)
			chatArea.append(
				`
				<div class='bubble you'>${data.msg}</div>
				`
			)
		} else {
			console.log("데이터들어옴2")
			let countTag = $(`li[data-chat="person${data.chatNo}"] .count`);
			let originCount = countTag.attr("count");
			
			console.log("원래 카운트")
			console.log(originCount);
			console.log("넣을 곳")
			console.log(countTag);
			
			countTag.attr("count",count);
			countTag.removeClass("hideCount");
			console.log("넣고 난 후" + countTag);
			$(`li[data-chat="person${data.chatNo}"] .time`).text(nowDate())
			$(`li[data-chat="person${data.chatNo}"] .preview`).text(data.covstContent)
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
		if (minutesLength == 1) {
			minutes = "0" + minutes
		}		
		time = hours+":"+minutes+" AM";
		
	} else {
		hours = hours - 12;
		let hoursLength = hours + "";
		let minutesLength = minutes + "";
		if (hoursLength.length == 1) {
			hours = "0" + hours
		}
		if (minutesLength == 1) {
			minutes = "0" + minutes
		}
		time = hours+":"+minutes+" PM";
	}
	return time;
}
$(document).ready(function(){
	$(".write a").click(() => {
		insertData();		
	});
    $("input[data-chatfield='chat']").keypress(function (e) {
     if (e.keyCode  == 13){
    	 insertData();
     }
    $(".person").click((e) => {
    	$("input[data-chatfield='chat']").focus();
    })
 });
});
