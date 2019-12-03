let rPageNo = 1;
let reviewCnt = 0;
function swal() {
    Swal.fire({
        title: '로그인이 필요한 페이지입니다',
        text: "회원가입 혹은 로그인후 진행해주세요",
        type: 'warning',
        showCancelButton: true,
        confirmButtonColor: '#3085d6',
        cancelButtonColor: '#d33',
        confirmButtonText: '로그인',
        cancelButtonText: '회원가입'
      }).then((result) => {
        if (result.value) {
            location.href="/doublecome/user/loginForm.do"
        } else if (result.dismiss === Swal.DismissReason.cancel) {
            location.href="/doublecome/user/joinForm.do"
        }
      })
}

$(".remove_btn").click(() => {
    Swal.fire({
        title: '게시글을 삭제하시겠습니까',
        type: 'warning',
        showCancelButton: true,
        confirmButtonColor: '#3085d6',
        cancelButtonColor: '#d33',
        confirmButtonText: '확인',
        cancelButtonText: '취소'
      }).then((result) => {
        if (result.value) {
            location.href="/doublecome/auction/deleteAuction.do?no=" + no
        } else if (result.dismiss === Swal.DismissReason.cancel) {
        }
      })
})

$('.sidebar, .nav').stick_in_parent("#wrapper");

let galleryThumbs = new Swiper('.gallery-thumbs', {
    spaceBetween: 10,
    slidesPerView: 4,
    loop: true,
    freeMode: true,
    loopedSlides: 5, //looped slides should be the same
    watchSlidesVisibility: true,
    watchSlidesProgress: true,
  });
  let galleryTop = new Swiper('.gallery-top', {
    effect: 'cube',
    grabCursor: true,
    loop: true,
    loopedSlides: 4, //looped slides should be the same
    navigation: {
        nextEl: '.swiper-button-next',
        prevEl: '.swiper-button-prev',
    },
    cubeEffect: {
        shadow: true,
        slideShadows: true,
        shadowOffset: 20,
        shadowScale: 0.94,
    },
    thumbs: {
        swiper: galleryThumbs,
    },
  
  });
$("#btn1").click(() => {
	$("#inquiry_box").css('display', 'block')
  $("#insertbox1").html($("#inquiry_box"))
})
$("#btn1_1").click(() => {
	$("#inquiry_box").css('display', 'block')
  $("#insertbox1_1").html($("#inquiry_box"))
})
$("#btn1_2").click(() => {
	$("#inquiry_box").css('display', 'block')
  $("#insertbox1_2").html($("#inquiry_box"))
})
$("#btn2").click(() => {
	$("#inquiry_box").css('display', 'block')
  $("#insertbox2").html($("#inquiry_box"))
})


$(".reply").click((e) => {
	$div = $(e.target).attr("id")
	$("#inquiry_box").css('display', 'block')
	$("." + $div).append($("#inquiry_box"))
	$parent =  $div.replace(/[^0-9]/g,"")
	$(".inquiryParent").val($parent)
})


$(".Button--bid, .Button--buynow").click(() => {
	swal()
})

$(document).ready(function(){
    loopcounter('counter-class');
  });


$(window).scroll(function () {
  height = $(document).scrollTop();
  if ($("#nav1").offset().top-80 < height && 
      $("#nav2").offset().top-80 > height) {
        $(".nav").children().removeClass("movenav")
        $(".nav1").addClass("movenav")
      } else if ($("#nav2").offset().top-80 < height &&
      $("#nav3").offset().top-80 > height
      ) {
        $(".nav").children().removeClass("movenav")
        $(".nav2").addClass("movenav")
      } else if ($("#nav3").offset().top-80 < height
      ) {
        $(".nav").children().removeClass("movenav")
        $(".nav3").addClass("movenav")
      }
})

let acc = document.getElementsByClassName("accordion");
var i;

$('.nav-item').click(function(e){
	classes = $(e.target).data("nav");
	let movepoint = '#' + classes;
	let addcss = '.' + classes;
	let offset = $(movepoint).offset().top - 60;
    $(addcss).addClass("movenav")
    $(".nav").children().removeClass("movenav")
    $('html').animate({scrollTop : offset}, 400);
});

function numberWithCommas(x) {
    return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
}

$(".nowprice").html(numberWithCommas($(".nowprice").html()))
$(".buyprice").html(numberWithCommas($(".buyprice").html()))

$(".logout").click(() => {
	swal();
})


pg.print($("#nav2"));
pg.movePage($("#nav2"),(pageNo) =>{
	let href = location.search.substr(1)
	location.href = `?no=${no}&userEmail=${email}&pageNo=${pageNo}`
//	let offset = $("#nav3").offset()
//	$("html").animate({scrollTop : offset.top}, 400)
})

function scr() {
	window.oriScroll = $(window).scrollTop();
	return false;
}
function scro() {
	$(window).scrollTop(window.oriScroll);
	return false;
}


makeReviewListAjax()

function makeReviewListAjax() {
	$.getJSON({
		url: "retrieveReceiveReview.do",
		data: {rPageNo, email},
		success: result => {
			makeReviewList(result);
			for (i = 0; i < acc.length; i++) {
				  acc[i].addEventListener("click", function() {
				    this.classList.toggle("active");
				    var panel = this.nextElementSibling;
				    if (panel.style.maxHeight) {
				      panel.style.maxHeight = null;
				    } else {
				      panel.style.maxHeight = panel.scrollHeight + "px";
				    } 
				 });
			}
		}
	});
}

$(document).on("click", ".moreBtn", (e) => {
	makeReviewListAjax()
});

function makeReviewList (result) {
	let html = "";
	if (result.length == 0) {
		html = `
			<div class="review_box">
				<div class="empty_review">작성된 리뷰가 없습니다.</div>
			</div>
		`
		$(".reviewListContent").html(html);
	} else {
		$.each(result, (i, review) => {
			reviewCnt = review.reviewCnt;
			html += `
										<button class="accordion">
								<div class="col-xs-12">
									<div class="col-xs-2">
										<p class="grade">
											<span class="grade_point">${review.reviewScore}</span><span>점</span>
										</p>
									</div>
									<div class="col-xs-8 text-center">
										<p class="review_title review_pdct_title">${review.auctionTitle}</p>
										<p class="review_title review_title">${review.reviewTitle}</p>
										<p class="review_title review_regdate"><fmt:formatDate value="${review.reviewRegDate}" pattern="yyyy-MM-dd"/></p>
									</div>
									<div class="review_contents_writer col-xs-2">
										<p class="review_writer">${review.senderNickname}</p>
									</div>
								</div>

							</button>
							<div class="accor">
								<div class="accor_contents">
									<div class="review_contents_top row">
										<div class="review_top col-xs-10">
											<div class="col-xs-3">
												<img src="https://image.ibb.co/jw55Ex/def_face.jpg"
													class="review_img img-rounded img-fluid" />
											</div>
											<div class="col-xs-7 review_contents_title">
												<p>
													<span class="review_writer">${review.senderNickname}</span><span
														class="review_contents_regdate"><fmt:formatDate value="${review.reviewRegDate}" pattern="yyyy-MM-dd"/></span>
												</p>
												<p>${review.reviewTitle}</p>
											</div>
										</div>
									</div>
									<div class="col-xs-10 review_contents_contents">
										<div class="clearfix"></div>
										<p>${review.reviewContent}</p>
									</div>
								</div>
							</div>
			`;
		})
			html += `
					<button class="moreBtn">더 보기 <span class="glyphicon glyphicon-menu-down"></span></button>
				`;
		if (rPageNo*5 > reviewCnt) {
			$(".moreBtn").remove();
		}
		
		$(".reviewListContent").append(html);
		
		if (rPageNo*5 > reviewCnt) {
			$(".moreBtn").remove();
		}
		rPageNo += 1;
		
	}
}

$(".updateInquiryBtn").click((e) => {
	let id = $(e.target).data("no")
	$(`.inquiryContent${id} p`).remove();
	
	let html = 
	`<textarea class="InquiryUpdateText"></textarea>
					<div class="InquiryUpdateBtn">
						<button class="InquiryUpdateCancelBtn">취소</button>
						<button type="button" class="InquiryUpdateCompleteBtn">수정</button>
					</div>
	
	`;
	$(`.inquiryContent${id}`).append(html);
	
})