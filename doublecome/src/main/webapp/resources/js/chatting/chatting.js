document.querySelector('.chat[data-chat=person2]').classList.add('active-chat')
document.querySelector('.person[data-chat=person2]').classList.add('active')

let friends = {
    list: document.querySelector('ul.people'),
    all: document.querySelectorAll('.left_people_field .person'),
    name: ''
  },
  chat = {
    container: document.querySelector('.right_container'),
    current: null,
    person: null,
    name: document.querySelector('.right_top_field .name')
  }
	
friends.all.forEach(f => {
  f.addEventListener('mousedown', () => {
    f.classList.contains('active') || setAciveChat(f)
  })
});

function setAciveChat(f) {
  friends.list.querySelector('.active').classList.remove('active')
  f.classList.add('active')
  chat.current = chat.container.querySelector('.active-chat')
  chat.person = f.getAttribute('data-chat')
  chat.current.classList.remove('active-chat')
  chat.container.querySelector('[data-chat="' + chat.person + '"]').classList.add('active-chat')
  friends.name = f.querySelector('.name').innerText
  chat.name.innerHTML = friends.name
}

let ws = null;

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

$(".write a").click(() => {
	let $msg = $("input[data-chatfield='chat']");
	ws.send($msg.val());
	$("div[data-chat=person2]").append("<div class='bubble me'>" + $msg.val() + "</div>");
	$msg.val("");
});