let allImages = {};

function swalAlert(msg) {
	Swal.fire(msg)
}

function swalAlertAccept(msg) {
	Swal.fire({
        title: msg,
        type: 'warning',
        showCancelButton: true,
        confirmButtonColor: '#3085d6',
        cancelButtonColor: '#d33',
        confirmButtonText: '확인',
        cancelButtonText: '취소'
      }).then((result) => {
        if (result.value) {
        	
        } else if (result.dismiss === Swal.DismissReason.cancel) {
        }
      })
}

let li = `
					<li class="npu_image_item _npu_image_item_blank">
						<div class="npu_image_list_thumb_wrap">
						</div>
					</li>`

let filesLength = 1;
let fileCheck = 0;
let key = 0;
$(function() {
    let imagesPreview = function(input, preview) {
    	
    	fileCheck += input.files.length
    	if (fileCheck > 20) {
    		alert("등록사진은 20개를 초과할수 없습니다")
    		fileCheck -= input.files.length
    		return;
    	}
    	
        if (input.files) {
            for (i = 0; i < input.files.length; i++) {
                let reader = new FileReader();
                reader.onload = function(event) {
					$.ajax({
						url: "tempFile.do",
						type: "post",
						data: {fileUrl : event.target.result},
						success: function(UUID) {
							$(preview + " li:nth-child("+filesLength+")").attr("id",'pic' +  key)
							$(preview +" li:nth-child("+filesLength+") div").html(`							
									<div class="img_thumb_wrap">
									<div class="img_thumb">
									<div class="img_thumb_img">
									</div>
									<button type="button" class="npu_btn npu_btn_image_del">
									<i class="glyphicon glyphicon-remove"></i>
									</button>
									</div>
							</div>`)
							$(preview +" li:nth-child("+filesLength+") .img_thumb_img").css("background-image", "url(" + event.target.result + ")")
							$("#pic" + key++).attr("data-fileName", UUID)
							allImages[UUID] = {};
							filesLength++
						}
					})
                }
                reader.readAsDataURL(input.files[i]);
            }
        }
    };

    $('#upload').on('change', function() {
        imagesPreview(this, '.j-selectable');
    });
})

$(document).on("click", ".img_thumb_img", function(event) {
	if ($(".tagChoice .tagTextBox").length >= 5) {
		alert("사진 한개에 태그를 5개이상 등록할 수 없습니다.")
		return;
	}
	if ($(this).parents("li").hasClass("tagChoice")) {
		
//		alert($(this).data("filename"))
		
		let x = Math.round(event.offsetX / $(this).width() * 100)
		let y = Math.round(event.offsetY / $(this).height() * 100)
		
		$(this).parent().append(`
		<div class="tagTextBox" style="top : ${y}%; left : ${x}%">
		<textarea class="addTag" data-x=${x} data-y=${y} onkeydown="resize(this)" onkeyup="resize(this)" placeholder="태그를 입력해주세요"></textarea>
		<button type="button" class="textDelI">
				<i class="glyphicon glyphicon-remove" style="font-size: 10px;"></i>
        </button>
		<div>
		`)
		
		
	} else {
		
		let a = Math.round(event.offsetX / $(this).width() * 100)
		let b = Math.round(event.offsetY / $(this).height() * 100)
		
		$(this).parents("li").addClass("tagChoice")
		$(".tagChoice .tagTextBox").show();
		$(".modal").show();
	}
})
$(".tagCancel").click(() => {
	Swal.fire({
        title: "등록한 태그를 전부 삭제하시겠습니까",
        type: 'warning',
        showCancelButton: true,
        confirmButtonColor: '#3085d6',
        cancelButtonColor: '#d33',
        confirmButtonText: '확인',
        cancelButtonText: '취소'
      }).then((result) => {
        if (result.value) {
        	$(".modal").hide();
        	$(".tagChoice .tagTextBox").remove();
        	$("li").removeClass("tagChoice");		
        } else if (result.dismiss === Swal.DismissReason.cancel) {
        }
      })
})

$(".tagComplete").click(() => {
	$(".modal").hide();
	$(".tagChoice .tagTextBox").hide();
	
	let tags = new Array;
	
	$(".tagChoice .addTag").each((i,ele)=>{
		let data = {
				x:$(ele).data('x'),
				y:$(ele).data('y'),
				content:$(ele).val(),
		}
		tags.push(data);
	})
	
	let fileName = $(".tagChoice").attr("data-fileName");
	allImages[fileName] = tags;
	
	$("li").removeClass("tagChoice")
	
})

$(document).on("click", ".textDelI", function() {
	Swal.fire({
        title: "태그를 삭제하시겠습니까",
        type: 'warning',
        showCancelButton: true,
        confirmButtonColor: '#3085d6',
        cancelButtonColor: '#d33',
        confirmButtonText: '확인',
        cancelButtonText: '취소'
      }).then((result) => {
        if (result.value) {
        	$(this).parent().remove()
        } else if (result.dismiss === Swal.DismissReason.cancel) {
        }
      })
})

$(document).on("click", ".npu_btn_image_del", function() {
	$(this).parents("li").remove()
	fileCheck--
	filesLength--
	$("li").removeClass("tagChoice")
	$(".modal").hide();
	$("ul").append(li)
})

function resize(obj) {
  obj.style.height = "1px";
  obj.style.height = (12+obj.scrollHeight)+"px";
}
function getContextPath() {
	var hostIndex = location.href.indexOf( location.host ) + location.host.length;
	return location.href.substring( hostIndex, location.href.indexOf('/', hostIndex + 1) );
}
$("#attachBtn").click(()=>{
	let path = getContextPath()
	localStorage.setItem("allImages", JSON.stringify(allImages));
	let d = JSON.parse(localStorage.getItem("allImages"))
	for (i = 0; i < Object.keys(d).length; i++) {
		html = `
			<div class="imgtempWrapper${i}">
			<div class="imgWrapper">
				<img src="${path}/file/fileRoot.do?root=${Object.keys(d)[i]}">
			</div>
			</div>
		`
			$(".note-editable", opener.document).append(html);
	for (k = 0; k < d[Object.keys(d)[i]].length; k++) {
		html = `
		<div class="tagTextBox" style="top : ${d[Object.keys(d)[i]][k].y}%; left : ${d[Object.keys(d)[i]][k].x}%;">
		<textarea readonly class="addTag">${d[Object.keys(d)[i]][k].content}</textarea>
		<div>
		`
		console.log(d[Object.keys(d)[i]][k])
		$(`.imgtempWrapper${i} .imgWrapper`, opener.document).append(html);
		}
	}
	self.close();
})

