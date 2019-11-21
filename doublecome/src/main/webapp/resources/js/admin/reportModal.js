$(".dataContent").on("click","td:gt(1)",(e)=>{
	let userEmail = $(e.target).closest("tr").attr("email");
	let pageNo = 1;
	listReport(userEmail,pageNo);
	$(".reportModal").show();
})

$(document).click((e)=>{
	if($(e.target).attr("class") == "reportModalBack"){
		$(".reportModal").hide();
		resetReport();
	}
})