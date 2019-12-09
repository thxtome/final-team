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
  chat.name.innerHTML = `<span>To: <span class="name">${friends.name}</span></span>`
//  $(".right_message_field").append(`
//	<div class="write">
//        <input type="text" data-chatfield="chat"/>             
//        <a href="javascript:;" class="write-link send"></a>
//    </div>	  
//  `)
}

let ws = null;
let email = $(".wrapper").data("id");
let chatNo = $("div[data-chat='person2']").data("no");
let person = null;
let peopleField = null;
$(() => {
	ws = new WebSocket("ws://localhost/doublecome/chatting.do");	
	ws.onopen = () => {
		$("#result").append("<div>웹소켓 핸들러 연결 성공</div>");
	};
	ws.onmessage = (evt) => {
		if (evt.data != null) {
						
		} else {
			$("div[data-chat=person2]").append("<div class='bubble you'>" + evt.data + "</div>");
		}
	};
	ws.onerror = (evt) => {
		$("#result").append("<div>웹소켓 에러 발생 : " + evt.data + "</div>");
	};
	ws.onclose = () => {
		$("#result").append("<div>웹소켓 연결 종료</div>");
	};
	
});
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
		let d = new Date();
		let data = {email : $(".wrapper").data("id"), msg: $msg.val(), chatNo:person.data("no")}
		ws.send(JSON.stringify(data));
		person.append("<div class='bubble me'>"+ $msg.val() + "</div>");
		console.log(peopleField.children(".preview"));
		peopleField.children(".preview").text($msg.val());
		let hours = d.getHours();
		let minutes = d.getMinutes();
		if (d.getHours() < 12) {
			let hoursLength = hours + "";
			let minutesLength = minutes + "";
			if (hoursLength.length == 1) {
				hours = "0" + hours
			}
			if (minutesLength == 1) {
				minutes = "0" + minutes
			}
			peopleField.children(".time").text(hours + ":" + minutes + " AM");			
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
			peopleField.children(".time").text(hours + ":" + minutes + " PM");
		}
		$msg.val("");
	}
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
