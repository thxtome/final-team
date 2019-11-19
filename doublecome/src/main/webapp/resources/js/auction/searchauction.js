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
$("#date a").click(e=> {
	selectCheck(e);
})
// 날짜별로 검색
$("#price_filter a").click(e => {
	selectCheck(e);
})
// 입찰순으로 보기
$("#bidcount a").click(e => {
	selectCheck(e);
})
function selectCheck(e) {
	
	let $event = $(e.target);
	if ($event.data("selected") === true) {
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
	$event.data("selected",true) 
	$event.prev().addClass("selected")
	$event.addClass("selected")
	$("#selectbar").append(
		`<a href="#" data-value="${e.target.dataset.value}" class="options selected">
		${e.target.title}
			<span class="del"></span>
		</a>
		`
	)
}