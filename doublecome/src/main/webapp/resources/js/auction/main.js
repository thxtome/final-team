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
  $("#insertbox1").html($("#inquiry_box"))
})
$("#btn1_1").click(() => {
  $("#insertbox1_1").html($("#inquiry_box"))
})
$("#btn1_2").click(() => {
  $("#insertbox1_2").html($("#inquiry_box"))
})
$("#btn2").click(() => {
  $("#insertbox2").html($("#inquiry_box"))
})
  
$(".Button--bid, .Button--buynow").click(() => {
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
          Swal.fire(
            '로그인페이지 이동'
          )
        } else if (
            result.dismiss === Swal.DismissReason.cancel
          ) {
            Swal.fire(
              '회원가입 페이지 이동'
            )
          }
      })
})

$(document).ready(function(){
    loopcounter('counter-class');
  });

  $('#sidebar').stick_in_parent({parent:'#contents'});
	
