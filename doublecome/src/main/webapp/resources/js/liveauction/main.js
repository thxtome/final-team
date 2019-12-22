let key;
let cnt = 0;
$("#openModalBtn").click(() => {
	$(".realTModal").show();
})

$(".closeModalBtn").click(() => {
	$(".realTModal").hide();
})

$(document).ready(function(){
    loopcounter('counter-class');
});

function play(){
	cnt++;
	if(cnt == 4){
		setTimeout((cnt) => {
				video.play();
		}, 100);
	}		
}


function sleep(num){	//[1/1000초]

	 var now = new Date();

	   var stop = now.getTime() + num;

	   while(true){

		 now = new Date();

		 if(now.getTime() > stop)return;

	   }

}



