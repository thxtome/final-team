let $navbar = $("#navbar");
let navtop = $navbar.offset().top;

$navbar.find("a").click((e) => {
	let topTarget = '';
    $navbar.find("a").removeClass("navchoice");
    $(e.target).addClass("navchoice");
    switch ($(e.target).data("location")){
    case "purchasehead": topTarget = "purchasehead"; break;
    case "saleshead": topTarget = "saleshead"; break;
    case "reviewhead": topTarget = "reviewhead"; break;
    }
    jQuery('html, body').animate( { scrollTop : $(`#${topTarget}`).offset().top - 100 }, 400 );
});
$(window).scroll(function () {
    // 네비게이션 상단바 고정
    height = $(document).scrollTop();
    if (height >= navtop){
        $navbar.addClass("barfixed");
        if (height > $("#purchasehead").offset().top && height < $("#saleshead").offset().top){
        	$navbar.find("a").removeClass("navchoice");
        	$navbar.find("a:eq(0)").addClass("navchoice");
        } else if (height > $("#saleshead").offset().top && height < $("#reviewhead").offset().top){
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
	$redetail = $(e.target).closest("li").next();
	if ($redetail.css("display") == "none"){
		$redetail.css("display", "inline-block");
	} else {
		$redetail.css("display", "none");
	}
});
$("body").on("click", ".conclose", (e) => {
	$(e.target).closest("li").remove();
});
$("#tothetop").click((e) => {
	var htmloffset = jQuery( 'html' ).offset();
    jQuery( 'html, body' ).animate( { scrollTop : htmloffset.top }, 400 );
});