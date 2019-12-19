$("#openReportModal").click(()=>{
    $(".addReportModal").show();
})

$(".cancleReportBtn").click(()=>{
    closeReportModal();
})

$(".addReportModalBack").click((e)=>{
    if($(e.target).attr("class") == 'addReportModalBack'){
    closeReportModal();
    }
})

function closeReportModal() {
    let $modal = $(".addReportModal")
    $modal.hide();
    $modal.find("textarea").val("");
}

$("body").on("click", ".reportBtn", (e) => {
	 $(".addReportModal").show();
	 $('input[name=auctionNo]').val($(e.target).data("no"));
	 $('#reportForm').attr("action", "/doublecome/admin/addReport.do");
});

$(".addReportBtn").click((e) => {
	console.log("클릭됨");
	$("#reportForm")[0].submit();
});