$(function (){
	$(".purchaseTabList").click((e) => {
		$(".purchaseTabList").removeClass("tabChoice");
		$(e.target).addClass("tabChoice");
		purchaseListAjax(target, pageNo);
	});
	
	function purchaseListAjax(target, pageNo){
		let $dataName = target.data("name");
		$.get({
			url: `retrieve${dataName}.do`,
			data: {
				pageNo,
				sort: `${dataName}`,
				
			}
		});
	}



});