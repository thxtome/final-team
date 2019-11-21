
$("#sort_list a").click(e => {
	$("#sort_list span").removeClass("on")
	$(e.target).find("span").addClass("on");
})
$("body").on("click",".options", e => {
	let arr = $(".cnkfilter");
	if($(e.target).prop('tagName') == "SPAN"){
		$(e.target).parent().remove()
		for (let filter of arr) {
		if ($(e.target).parent().data("value") == filter.dataset.value) {
			$(filter).removeClass("selected");
			$(filter).prev().removeClass("selected")
			}
		}
		return
	}
	$(e.target).remove()
	for (let filter of arr) {
		if ($(e.target).data("value") == filter.dataset.value) {
			$(filter).removeClass("selected");
			$(filter).prev().removeClass("selected")
		}
	}
})

// 카테고리별 보기 
$("a.category").click(e => {
	selectCheck(e);
})
// 시간별로 검색
$("#date li a").click(e=> {
	selectCheck(e);
})
// 날짜별로 검색
$("#price_filter li a").click(e => {
	selectCheck(e);
})
// 입찰순으로 보기
$("#bidcount li a").click(e => {
	selectCheck(e);
})
$(".price_srh").click(e => {
	selectCheck(e)
})
function selectCheck(e) {
	let $event = $(e.target);
	let clz = $event.attr('class').replace(/cnkfilter/,"")
	if ($event.data("selected") == true) {
		$event.removeClass("selected")
		$event.prev().removeClass("selected")
		$event.data("selected",false) 
		let arr = $(".options");
		for (let filter of arr) {
			if ($event.data("value") == filter.dataset.value) {
				$(filter).remove();
				
			}
		}
		return;
	}
	
	let chkArr = $("."+clz);
	for (let filter of chkArr ) {
		$(filter).removeClass("selected");
		$(filter).prev().removeClass("selected")
	}
	let arr = $(".options");
	for (let filter of arr) {
		for (let val of chkArr) {
			if (filter.dataset.value == val.dataset.value)
				$(filter).remove();
		}
	}
	let title = e.target.title;
	let datavalue = e.target.dataset.value;
	if($event.data("value") == "price") {
		let num1 = parseInt($("#num1").val())
		let num2 = parseInt($("#num2").val())
		if (num1 >= num2 && num2 !== "") {
			Swal.fire({
				icon: 'error',
				text: '시작금액보다 종료금액이 더 적거나 같을수 없습니다',
				confirmButtonText : '확인'
			})
			return
		}
		if (num2 == "") {
			title = comma(uncomma(num1)) + "원 ~ "
		} else {			
			title = comma(uncomma(num1)) + "원 ~ " + comma(uncomma(num2)) +"원"
		}
		$("#selectbar").append(
			`<a href="#" data-value="price" class="options selected">
			${title}
				<span class="del"></span>
			</a>
				`
		)
		return
	} else {
		$event.prev().addClass("selected")
		$event.addClass("selected")		
	}
	$event.data("selected",true)
	$("#selectbar").append(
		`<a href="#" data-value="${datavalue}" class="options selected">
		${title}
			<span class="del"></span>
		</a>
		`
	)
}

function comma(str) {
    str = String(str);
    return str.replace(/(\d)(?=(?:\d{3})+(?!\d))/g, '$1,');
}

function uncomma(str) {
    str = String(str);
    return str.replace(/[^\d]+/g, '');
}

