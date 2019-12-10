function swalAlert(msg) {
	Swal.fire(msg)
}

$(".category").click(() => {
	$(".catg").val($("select[name=catg]").val())
})

$('#summernote').summernote(
	{
		height : 400,
		width : 820,
	    disableResize: true,
	    disableResizeEditor: true,
	    resize: false,
		toolbar : 
			[
				[
						'style',
						[ 'bold', 'italic', 'underline',
								'clear' ] ],
				[
						'font',
						[ 'strikethrough', 'superscript',
								'subscript' ] ],
				[ 'fontsize', [ 'fontsize' ] ],
				[ 'color', [ 'color' ] ],
				[ 'para', [ 'ul', 'ol', 'paragraph' ] ],
				[ 'height', [ 'height' ] ] 
			]
});

let sysdate = new Date()
let maxdate = new Date()

sysdate.setHours(sysdate.getHours())
maxdate.setDate(maxdate.getDate() + 7)
maxdate.setHours(maxdate.getHours() + 6)
$(function () {
    $('#datetimepicker').datetimepicker({
    	format: 'YYYY-MM-DD HH:mm',
    	minDate:sysdate,
        maxDate:maxdate,
        defaultDate:sysdate
    });
});
function addCommas(x) {
	 let val = x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
	 if(!val.endsWith("000")) {
		 alert("입력은 천원단위 입니다.")
		 return;
	 }
	 return val;
}
 
function removeCommas(x) {
    if(!x || x.length == 0) return "";
    else return x.split(",").join("");
}

$(".start, .buy").on("focus", function() {
	    var x = $(this).val();
	    x = removeCommas(x);
	    $(this).val(x);
	}).on("focusout", function() {
	    var x = $(this).val();
	    if(x && x.length > 0) {
	        if(!$.isNumeric(x)) {
	            x = x.replace(/[^0-9]/g,"");
	        }
	        x = addCommas(x);
	        $(this).val(x);
	    }
	}).on("keyup", function() {
	    $(this).val($(this).val().replace(/[^0-9]/g,""));
	});
	
$(".start, .buy").click((e) => {
	   $($(e.target)).val("")
})

$(".fileUpIcon").hover(() => {
	$(".hoverNotification").show();
},() => {
  $(".hoverNotification").hide();
})

$(".button").click(() => {
	$div = $(".start").val().replace(/[^0-9]/g,"")
	$div2 = $(".buy").val().replace(/[^0-9]/g,"")
	if ($(".start").val() == "") {
		swalAlert("경매 시작가를 입력해주세요.")
	} else if ($(".buy").val() == "") {
		swalAlert("즉시 구매가를 입력해주세요.")
	} else if ($("#auctiontitle").val() == "") {
		swalAlert("제목을 입력해주세요.")
	} else if ($(".catg").val() == null || $(".catg").val() == 0) {
		swalAlert("카테고리를 선택해주세요.")
	} else if (parseInt($div) >= parseInt($div2)) {
		swalAlert("즉시 구매가는 경매 시작가보다 높아야 합니다.")
	} else {
		swalAlert("경매 등록이 완료되었습니다.")
		$(".swal2-confirm").click(() => {
			$("#insertForm").submit();
		})
	}
})

let up_files = [];

$(document).ready(() => {
	$("#upload").on("change", handleImgsFilesSelect)
})

function deleteImageAction(index) {
	alert("a")
	up_files.splice(index, 1)
	
	let img_id = "#img_id_"+index;
	$(img_id).remove();
}



function handleImgsFilesSelect(e) {
	
	up_files = [];
	$(".img_wrap").empty();
	
	let files = e.target.files
	let filesArr = Array.prototype.slice.call(files)
	
	let index = 0;
	
	filesArr.forEach((f) => {
		if(!f.type.match("image.*")) {
			alert("이미지 타입만 가능합니다.")
			return;
		}
		up_files.push(f)
		
		let reader = new FileReader()
		reader.onload = function(e) {
			let html = 
			"<a href=\"javascript:void(0);\" onclick=\"deleteImageAction("+index+")\" id=\"img_id_"+index+"\">" 
			+ "<img src=\""+e.target.result + "\" data-file='"+f.name+"' class='selProductFile' title='Click to remove'>"
			+ "</a>";
			$(".img_wrap").append(html);
			index++
		}
		reader.readAsDataURL(f);
	})
}


//$(".upload_btn").click(() => {
//	window.open("uploadPhoto.do", "사진 첨부", "width=1000, height=800, location=no, left=400")
//})
		
