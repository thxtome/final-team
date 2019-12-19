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

function getContextPath() {
	let hostIndex = location.href.indexOf( location.host ) + location.host.length;
	return location.href.substring( hostIndex, location.href.indexOf('/', hostIndex + 1) );
}

$(document).on("click", ".reportBtn", () => {
	let path = getContextPath()
	$(".auctionNo").val(no)
	$(".reportReceiver").val(email)
	$('#reportForm').attr("action", `${path}/admin/addAuctionReport.do`);
})

$("body").on("click", ".reportBtn", (e) => {
	 let path = getContextPath()
	 $(".addReportModal").show();
	 $('input[name=auctionNo]').val($(e.target).data("no"));
	 $('#reportForm').attr("action", `${path}/admin/addReport.do`);
});

$(".addReportBtn").click((e) => {
	$("#reportForm")[0].submit();
});