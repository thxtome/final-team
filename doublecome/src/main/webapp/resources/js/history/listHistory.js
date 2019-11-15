let $navbar = $("#navbar");
let navtop = $navbar.offset().top;

$navbar.find("a").click((e) => {
    $navbar.find("a").removeClass("navchoice");
    $(e.target).addClass("navchoice");
});
$(window).scroll(function () {
    // 네비게이션 상단바 고정
    height = $(document).scrollTop();
    if (height >= navtop){
        $navbar.addClass("barfixed");
        if (height > $("#purchasehaed").offset().top && height < $("#saleshaed").offset().top){
        	$navbar.find("a").removeClass("navchoice");
        	$navbar.find("a:eq(0)").addClass("navchoice");
        } else if (height > $("#saleshaed").offset().top && height < $("#reviewhead").offset().top){
        	$navbar.find("a").removeClass("navchoice");
        	$navbar.find("a:eq(1)").addClass("navchoice");
        } 
        else if (height > $("#reviewhead").offset().top){
        	$navbar.find("a").removeClass("navchoice");
        	$navbar.find("a:eq(2)").addClass("navchoice");
        }
    } else if(height < navtop) {
        $navbar.removeClass("barfixed");
        $navbar.find("a").removeClass("navchoice");
        $navbar.find("a:eq(0)").addClass("navchoice");
    };
});

$("#scorebar").find("span").click((e) => {
	$("#scorebar").find("span").removeClass("scorechoice");
	$(e.target).addClass("scorechoice");
});

let modal =$("#myModal");
let btn = $(".reviewbtn");
let span = $(".close");                                          
$(".reviewbtn").click((e) => {
    modal.css("display", "block");
});
span.click((e) => {
    modal.css("display", "none");
});
$(window).click((e) => {
    if (e.target == modal) {
        modal.css("display", "none");
    }
}); 

$(".purchasetablist").click((e) => {
	$(".purchasetablist").removeClass("tabchoice");
	$(e.target).addClass("tabchoice");
});
$(".salestablist").click((e) => {
	$(".salestablist").removeClass("tabchoice");
	$(e.target).addClass("tabchoice");
});
$(".reviewtablist").click((e) => {
	$(".reviewtablist").removeClass("tabchoice");
	$(e.target).addClass("tabchoice");
});
let eModal = $("#editModal");
let editA = $(".editreview");
let eclose = $(".eclose"); 
$(".editreview").click((e) => {
	console.log("클릭됨");
    eModal.css("display", "block");
});
eclose.click((e) => {
    eModal.css("display", "none");
});
$(window).click((e) => {
    if (e.target == eModal) {
        eModal.css("display", "none");
    }
});

$(".reviewtitle").click((e) => {
	let html = `
	<li class="reviewdetail">
							<div class="reviewcontent">
								<div class="profilediv">
									<img class="profileimg"
										src="/doublecome/resources/images/profileimg.png" />
								</div>
								<div class="scorezone">8점</div>
								<div class="conclose">&times;</div>
								<div class="nicknamediv">채채채채미니</div>
								<div class="regdatediv">2019.11.15</div>
								<div class="onelinediv">거래 매너 좋으신데, 연락이 늦어서 불편했어요.</div>
								<div class="reviewdiv">궁금한것 잘 대답해주시고, 물건도 잘 받았는데 연락이 너무 안
									돼서 좀 짜증났어요. 결과가 좋으면 되긴하지만... 기다리는건 좋지 않더라구요. 다음에 다른 사람과 거래하게
									되시면 연락은 바로바로 받으셨으면 합니다.</div>
								<div class="reviewimg">
									<img style="width: 300px; height: 300px;"
										src="/doublecome/resources/images/profileimg.png" />
								</div>
							</div>
						</li>`;
	$(e.target).closest("li").after(html);
});
$("body").on("click", ".conclose", (e) => {
	$(e.target).closest("li").remove();
});