function swalAlert(msg) {
	Swal.fire(msg)
}

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

$(document).on("click", ".glyphicon-remove", function() {
	$(this).parents(".img_thumb_wrap").remove()
	fileCheck--
	filesLength--
})
