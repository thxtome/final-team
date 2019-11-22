/*
	$.post({
		url: "addReivew.do",
		dataType: "json",
		data: {
			auctionNo: $(e.target).data("no"), 
			reviewTitle:,
			reviewContent:,
			reviewScore:,
			reviewReceiver:,
			dealNo:
			},
		contentType: "application/x-www-form-urlencoded",
		success: (result) => {makeCommentList(result)}
	});
	$("#writer", "#content").val("");
*/

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

let begin = 0;
$(".reviewTabList").click((e) => {
	reviewCnt = 0;
	begin = 0;
	$(".reviewTabList").removeClass("tabChoice");
	$(e.target).addClass("tabChoice");
	let $dataName = $(e.target).data("name"); 
	if ($dataName == "receiveReview"){
		$(".sendReview").css("display", "none");
		$("." + $dataName).css("display", "block");
	} else {
		$.get({
			url: "retrieveSendReview.do",
			type: "GET",
			data: {
				begin
			},
			dataType: "json",
			success: result => makeReviewList(result, $dataName)
		});
		
		$(".receiveReview").css("display", "none");
		$("." + $dataName).css("display", "block");
	}
});
function makeReviewList(result, type){
	console.log(result);
	let html = ``;
	if (type == "sendReview"){
		if (result == null){
			html = `
				<div class="sendReview">
					<div class="emptyBox">받은 후기가 없습니다.</div>
				</div>
			`;
			$("#reviewCon > ul").html(html);
		} else {
			$.each(result, (i, r) => {
				console.log(reviewCnt);
				reviewCnt = r.reviewCnt;
				html += `
					<li class="preView">
					<div class="scoreArea">
					<div class="score">${r.reviewScore}</div>
					<div class="scoreForm">점</div>
					</div>
					<div class="contentArea">
					<div class="auctionTitle">${r.auctionTitle}</div>
					<div class="reviewTitle">${r.reviewTitle}</div>
					<div class="reviewDate">${r.reviewRegDate}</div>
					</div>
					<div class="writerArea noBtn">
					<a class="reviewer">${r.senderNickname}</a>
					</div>
					</li>
					<li class="reviewDetail">
					<div class="reviewContent">
					<div class="profileDiv">
					<img class="profileImg" src="/doublecome/resources/images/profileImg.png" />
					</div>
					<div class="nicknameDiv">${r.senderNickname}</div>
					<div class="regdateDiv">${r.reviewRegDate}</div>
					<div class="onelineDiv">${r.reviewTitle}</div>
					<div class="reviewDiv">${r.reviewContent}</div>
					</div>
					</li>
					`;
			})
			$("#reviewCon .moreBtn").remove();
			if (reviewCnt - (5* (begin - 1)) > 5){
				html += `
					</div>
					<button class="moreBtn" type="button">더 보기</button>
					</div>
					`;
			}
			$("#reviewCon > ul").append(html);
			begin += 5;
		}
	}
}

$("body").on("click", ".moreBtn", (e) => {
	$.get({
		url: "retrieveSendReview.do",
		type: "GET",
		data: {
			begin
		},
		dataType: "json",
		success: result => makeReviewList(result, "sendReview")
	});
});

let $addReviewModal = $("#addReviewModal");
$("body").on("click", ".reviewBtn", (e) => {
	$("#auctionTitle").html($(e.target).closest("ul").find(".listTitle").html());
	console.log($(e.target).data("no"));
	$("#auctionNo").val($(e.target).data("no"));
	$(".regitbtn > button").html("등록");
	$addReviewModal.css("display","block");
});

//$("body").on("click", ".editreview", (e) => {
//	let $ul = $(e.target).closest("ul");
//	$("#auctionTitle").html($ul.find(".auctionTitle").html());
//	$("#auctionNo").val($(e.target).data("no"));
//	$(".regitbtn > button").html("수정");
//	$(".scoreCon > input").val($ul.find(".score").val());
//	$("")
//	$addReviewModal.css("display","block");
//});

$("body").on("click", ".reviewModalClose", (e) => {
	$addReviewModal.css("display","none");
});

window.onclick = function(event) {
 if (event.target == $addReviewModal) {
 	$addReviewModal.css("display","none");
 }
}
//후기등록 score바
$(".scoreBar").find("span").click((e) => {
	$(".scoreBar").find("span").removeClass("scorechoice");
	$(e.target).addClass("scorechoice");
});

// 후기작성 서머노트
$('#summernote').summernote(
		{
			height : 250,
			width : 500,
		    disableResize: true,
		    disableResizeEditor: true,
		    resize: false,
		    toolbar : ['insert', ['picture']],
		    focus: true,
		    callbacks: {
		    	onImageUpload: function(files, editor, welEditable) {
		        for (var i = files.length - 1; i >= 0; i--) {
		        	sendFile(files[i], this);
		          }
		        }
		      }

});

function sendFile(file, editor) {
    // 파일 전송을 위한 폼생성
		data = new FormData();
	    data.append("uploadFile", file);
	    $.ajax({ // ajax를 통해 파일 업로드 처리
	        data : data,
	        type : "POST",
	        url : "fileUpload.do",
	        cache : false,
	        contentType : false,
	        processData : false,
	        success : function(data) { // 처리가 성공할 경우
            // 에디터에 이미지 출력
	        	$(editor).summernote('editor.insertImage', data.url);
	        }
	    });
	}




//function sendFile(file, el) {
////	  var contextPath = "${pageContext.request.contextPath}";
//  var form_data = new FormData();
//  form_data.append('file', file);
//  $.ajax({
//    data: form_data,
//    type: "POST",
//    url: 'file.do',
//    cache: false,
//    contentType: false,
//    enctype: 'multipart/form-data',
//    processData: false,
//    success: function(url) {
//    	alert(url);	 
//    	$(el).summernote('editor.insertImage', url);
//    }
//  });
//}

// 후기제목 클릭시 후기상세글 노출
$("body").on("click" ,".preView", (e) => {
	$reDetail = $(e.target).closest("li").next();
	if ($reDetail.css("display") == "none"){
		$reDetail.css("display", "inline-block");
	} else {
		$reDetail.css("display", "none");
	}
});

//// 후기 경매글제목 클릭시 해당 경매글로 이동
//$("body").on("click" ,".auctionTitle", (e) => {
//	alert("이동");
//});
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