$("#sort_list a").click(e => {
	$("#sort_list span").removeClass("on")
	$(e.target).find("span").addClass("on");
})
// 카테고리별 보기 
$(".category").click(e => {
	selectCheck(e);
})
// 필터창에 삭제 하기 
$(".options").click(e => {
	$("a").remove(e.target)
})
// 시간별로 검색
$("#date li").click(e=> {
	selectCheck(e);
})
// 날짜별로 검색
$("#price_filter li").click(e => {
	selectCheck(e);
})
// 입찰순으로 보기
$("#bidcount li").click(e => {
	selectCheck(e);
})
function selectCheck(e) {
	if ($(e.target).data("selected") === true) {
		$(e.target).removeClass("selected")
		$(e.target).data("selected",false) 
		return;
	}
	$(e.target).data("selected",true) 
	$(e.target).addClass("selected")
	$("#selectbar").append(
		`<a href="#" class="options">
		${e.target.title}
		<span class="del"></span>
		</a>
		`
	)
}