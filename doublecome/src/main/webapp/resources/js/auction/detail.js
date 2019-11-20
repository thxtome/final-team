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

var acc = document.getElementsByClassName("accordion");
var i;

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

$('.nav-item').click(function(e){
	classes = $(e.target).data("nav");
	let movepoint = '#' + classes;
	let addcss = '.' + classes;
	let offset = $(movepoint).offset().top - 60;
    $(addcss).addClass("movenav")
    $(".nav").children().removeClass("movenav")
    $('html').animate({scrollTop : offset}, 400);
});
$('.review_pdct_title').click(() => {
	alert("aaa")
})

function numberWithCommas(x) {
    return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
}

$(".nowprice").html(numberWithCommas($(".nowprice").html()))
$(".buyprice").html(numberWithCommas($(".buyprice").html()))

$(".logout").click(() => {
	swal();
})