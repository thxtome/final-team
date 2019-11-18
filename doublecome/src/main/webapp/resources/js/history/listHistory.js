// 네비게이션바 클릭시 이동
let $navBar = $("#navBar");
let $left = $(".purchaseTabList").offset().left;
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
        $navBar.css("left", $left);
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
$(".preView").click((e) => {
	$reDetail = $(e.target).closest("li").next();
	if ($reDetail.css("display") == "none"){
		$reDetail.css("display", "inline-block");
	} else {
		$reDetail.css("display", "none");
	}
});
/*
// 후기 출력
function makeReviewList(list){
	let $ul = $("<ul></ul>");
	$.each(list, (i, c) => {
		$ul.append(`
				<li class="preView">
				<div class="scoreAsrea">
				<div class="score"></div>
				<div class="scoreForm">점</div>
				</div>
				<div class="contentArea">
				<div class="auctionTitle">${c.auctionTitle}</div>
				<div class="reviewTitle">${c.reviewTitle}</div>
				<div class="reviewDate">${c.reviewRegDate}</div>
				</div>
				<div class="writerArea">
				<a class="reviewer">${c.reviewSender}</a>
				</div>
				<div class="editdel">
				<a href="editReview.do" class="editreview">수정</a> / <a class="delreview">삭제</a>
				</div>
				</li>
				<li class="reviewDetail">
				<div class="reviewContent">
				<div class="profileDiv">
				<img class="profileImg"
				src="<c:url value="/resources/images/profileImg.png"/>" />
				</div>
				<div class="nicknameDiv">${c.reivewSender}</div>
				<div class="regdateDiv">${c.reviewRegDate}</div>
				<div class="onelineDiv">${c.reviewTitle}</div>
				<div class="reviewDiv">${c.reviewContent}</div>
				</div>
				</li>
		`);
	});
	$("reviewCon").html($ul);
};
makeReviewList(receiveList);
*/
// 페이지 상단으로 이동
$("#toTheTop").click((e) => {
	let htmlOffset = jQuery( 'html' ).offset();
    jQuery( 'html, body' ).animate( { scrollTop : htmlOffset.top }, 400 );
});