// 네비게이션바 클릭시 이동
let $navBar = $("#navBar");
let navTop = $navBar.offset().top;
$navBar.find("a").click((e) => {
	let topTarget = '';
	let minus = 100;
	$location = $(e.target).data("location");
    switch ($location){
    	case "purchaseHead": 
    		$topTarget = $("#"+$location); 
    		break;
    	case "salesHead": 
    		$topTarget = $("#"+$location); 
    		minus = 120;
    		break;
    	case "reviewHead": 
    		$topTarget = $("#"+$location); 
    		minus = 50; 
    		break;
    }
    jQuery('html, body').animate( { scrollTop : $topTarget.offset().top - minus }, 400 );
});

// 네비게이션바 고정 & 색깔 변화
let navFun = function(navigation) {
	$navBar.find("a").removeClass("navChoice");
	$navBar.find(navigation).addClass("navChoice");
};
$(window).scroll(function () {
    // 네비게이션 상단바 고정
    height = $(document).scrollTop();
    if (height >= navTop){
        $navBar.addClass("barFixed");
        if (height > $("#purchaseHead").offset().top-60 && height < $("#salesHead").offset().top-70){
        	navFun("a:eq(0)");
        } else if (height > $("#salesHead").offset().top-70 && height < $("#reviewHead").offset().top-100){
        	navFun("a:eq(1)");
        } 
        else if (height > $("#reviewHead").offset().top-100){
        	navFun("a:eq(2)");
        }
    } else if(height < navTop) {
        $navBar.removeClass("barFixed");
        navFun("a:eq(0)");
    };
});

//  각 구매내역, 판매내역, 후기 탭 클릭시 색상변화 모듈화하기(e.target문제 해결)
$(".purchaseTabList").click((e) => {
	$(".purchaseTabList").removeClass("tabChoice");
	$(e.target).addClass("tabChoice");
});
$(".salesTabList").click((e) => {
	$(".salesTabList").removeClass("tabChoice");
	$(e.target).addClass("tabChoice");
});
$(".reviewTabList").click((e) => {
	$(".reviewTabList").removeClass("tabChoice");
	$(e.target).addClass("tabChoice");
	let $dataName = $(e.target).data("name"); 
	if ($dataName == "receiveReview"){
		$("#sendReview").css("display", "none");
		$("#" + $dataName).css("display", "block");
	} else {
		$("#receiveReview").css("display", "none");
		$("#" + $dataName).css("display", "block");
	}
});


// 후기제목 클릭시 후기상세글 노출
$(".reviewTitle").click((e) => {
	$reDetail = $(e.target).closest("li").next();
	if ($reDetail.css("display") == "none"){
		$reDetail.css("display", "inline-block");
	} else {
		$reDetail.css("display", "none");
	}
});

// 페이지 상단으로 이동
$("#toTheTop").click((e) => {
	let htmlOffset = jQuery( 'html' ).offset();
    jQuery( 'html, body' ).animate( { scrollTop : htmlOffset.top }, 400 );
});