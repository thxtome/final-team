$("#sort_list a").click(e => {
	$("#sort_list span").removeClass("on")
	$(e.target).find("span").addClass("on");
})