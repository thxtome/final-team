function swalAlert(msg) {
	Swal.fire(msg)
}

let li = `
					<li class="npu_image_item _npu_image_item_blank">
						<div class="npu_image_list_thumb_wrap">
						</div>
					</li>
`

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
                	$(preview + " li:nth-child("+filesLength+")").attr("data-key", key++)
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
					$.ajax({
						url: "tempFile.do",
						type: "post",
						data: {fileUrl : event.target.result},
					})
					filesLength++
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
	if ($(this).parents("li").hasClass("tagChoice")) {
		
		let a = Math.round(event.offsetX / $(this).width() * 100)
		let b = Math.round(event.offsetY / $(this).height() * 100)
		
		$(this).append(`
		<div class="addTag" style="top : ${b}%; left : ${a}%">태그를 입력해주세요</div>
		`)
	} else {
		
		let a = Math.round(event.offsetX / $(this).width() * 100)
		let b = Math.round(event.offsetY / $(this).height() * 100)
		
		$(this).parents("li").addClass("tagChoice")
	}
})

$(".tagCancel").click(() => {
	$("li").removeClass("tagChoice")
})

$(document).on("click", ".glyphicon-remove", function() {
	$(this).parents("li").remove()
	fileCheck--
	filesLength--
	$("ul").append(li)
})
