$(".dataContent").on("click","td:gt(0)",()=>{
	$(".reportModal").show();
})

$(document).click((e)=>{
	if($(e.target).attr("class") == "reportModalBack"){
		$(".reportModal").hide();
	}
})