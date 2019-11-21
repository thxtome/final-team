
$("#sort_list a").click(e => {
	$("#sort_list span").removeClass("on")
	$(e.target).find("span").addClass("on");
})
$(document).on("click",".options", e => {
	let cate = $(e.target).attr("class")
	let arr = $(".cnkfilter");
	if($(e.target).prop('tagName') == "SPAN"){
		if(cate.endsWith("category ")){
			return
		}
		$(e.target).parent().remove()
		for (let filter of arr) {
		if ($(e.target).parent().data("value") == filter.dataset.value) {
			$(filter).removeClass("selected");
			$(filter).prev().removeClass("selected")
			}
		}
		return
	}
	if(cate.endsWith("category ")){
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

$(document).ready(e => {
	
	let loadchk = $(".category");
	let optiondata = $(".options");
	for(let value of loadchk) {
		for (let optionval of optiondata) {
			if (value.dataset.value == optionval.dataset.value) {
				$(value).addClass("selected")	
			}
		}
	}
	
// 카테고리별 보기 
	$("a.category").unbind("click").click(e => {
		selectCheck(e);
	})
	$("#date li a").unbind("click").click(e=> {
		selectCheck(e);
	})
// 날짜별로 검색
	$("#price_filter li a").unbind("click").click(e => {
		selectCheck(e);
	})
// 입찰순으로 보기
	$("#bidcount li a").unbind("click").click(e => {
		selectCheck(e);
	})
	$("#price_choice").unbind("click").click(e => {
		selectCheck(e)
	})
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
		if ($event.attr("class").startsWith("category ") == false){			
			return;
		}
	}
	let chkArr = $("."+clz);
	let arr = $(".options");
	for (let filter of arr) {
		for (let val of chkArr) {
			if (filter.dataset.value == val.dataset.value){
				$(val).removeClass("selected");
				$(val).prev().removeClass("selected")
				$(filter).remove();				
			}
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
	} 
	$event.addClass("selected")		
	$event.prev().addClass("selected")
	$event.data("selected",true)
	$("#selectbar").append(
		`<a href="#" data-value="${datavalue}" class="options selected ${clz}">
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

