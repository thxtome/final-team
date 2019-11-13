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
    } else if(height < navtop) {
        $navbar.removeClass("barfixed");
    };
});
// Get the modal
let modal =$("#myModal");
 
// Get the button that opens the modal
let btn = $(".reviewbtn");

// Get the <span> element that closes the modal
let span = $(".close");                                          

// When the user clicks on the button, open the modal 
btn.click((e) => {
    modal.css("display", "block");
});

// When the user clicks on <span> (x), close the modal
span.click((e) => {
    modal.css("display", "none");
});

// When the user clicks anywhere outside of the modal, close it
$(window).click((e) => {
    if (e.target == modal) {
        modal.css("display", "none");
    }
}); 

