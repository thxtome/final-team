function swalAlert(msg) {
	Swal.fire(msg)
}

let filesLength = 1;
let fileCheck = 0;
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
                	console.log(preview +" li:nth-child("+filesLength+")")
                	$(preview +" li:nth-child("+filesLength+")").html(`							
                			<div class="img_thumb_wrap">
								<div class="img_thumb">
									<div class="img_thumb_img">
									</div>
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