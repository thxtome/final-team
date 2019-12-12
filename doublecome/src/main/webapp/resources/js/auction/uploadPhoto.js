let allImages = {};

function swalAlert(msg) {
	Swal.fire(msg)
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
		<textarea class="addTag" data-x=${x} data-y=${y} onkeydown="resize(this)" onkeyup="resize(this)">태그를 입력해주세요</textarea>
		<button type="button" class="textDelI">
				<i class="glyphicon glyphicon-remove" style="font-size: 10px;"></i>
        </button>
		<div>
		`)
		
		
	} else {
		
		let a = Math.round(event.offsetX / $(this).width() * 100)
		let b = Math.round(event.offsetY / $(this).height() * 100)
		
		$(this).parents("li").addClass("tagChoice")
		$(".modal").show();
	}
})


$(".tagCancel").click(() => {
	$(".modal").hide();
	
	let tags = new Array;
	
	$(".tagChoice .addTag").each((i,ele)=>{
		let data = {
				x:$(ele).data('x'),
				y:$(ele).data('y'),
				content:$(ele).val(),
		}
		tags.push(data);
	})
	console.dir(tags);
	
	
	
	let fileName = $(".tagChoice").attr("data-fileName");
	allImages[fileName] = tags;
	
	$("li").removeClass("tagChoice")
	
})

$(document).on("click", ".textDelI", function() {
	let det = JSON.parse(sessionStorage.getItem("detail"))
	console.dir(det)
	alert(det.pic3[0].name)
	$(this).parent().remove()
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

$("#attachBtn").click(()=>{
	localStorage.setItem("allImages", JSON.stringify(allImages));
})

