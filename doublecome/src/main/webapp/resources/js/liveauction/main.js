let ws = null;
		
		$(()=>{
			//접속할 주소를 설정 : 웹소켓 핸들러 구현 클래스와 연결된 URL
			ws = new WebSocket("ws://localhost/doublecome/chat.do");
			ws.onopen = () => {
				console.log("연결성공")
			};
			
			ws.onmessage = (evt) => {
				$(".chatSpace").append($(
					`<div class="chat">
						${evt.data}			
					<span></span></div>`))
				console.log("메세지 : " + evt.data)
			}
			
			ws.onerror= (evt) => {
				console.log("웹소켓 에러 발생 : " + evt.data)
			};
			
			ws.onclose = () => {
				console.log("연결종료")
			};
		});
		
		$("#sendBtn").click(()=>{
			//웹소켓을 이용해서 서버에 데이터 전송
			let $msg = $(".chatInput textarea");
			ws.send($msg.val());
			$msg.val("");
		});