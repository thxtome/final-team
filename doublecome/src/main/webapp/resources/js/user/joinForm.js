
function avtiveBtn() {
  $('#joinBtn').attr( 'disabled', false )
}

function inAvtiveBtn() {
  $('#joinBtn').attr( 'disabled', true )
}

function nullCheck(e) {
  e.target.focusout( (e) => {
    if(e.target.val() == "") return true;
    else return false;
  })
}


if($('input').val() === "")  inAvtiveBtn();
  
$('#userEmail').keyup( (e) => {
    let emailRule = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;//이메일 정규식
    
    if(!emailRule.test($("input[id='userEmail']").val()) ) {            
      //경고
            $('#userEmail').next().text('잘못된 이메일 형식입니다.');
            inAvtiveBtn();
            
    }else { $('#userEmail').next().text(""); avtiveBtn(); }

});

$('#userPhnum').keyup( (e) => {
  let phnumRule = /^\d{3}\d{3,4}\d{4}$/;// 핸드폰 번호 정규식
  
  if(!phnumRule.test($("input[id='userPhnum']").val()) ) {            
    //경고
              $('#userPhnum').next().text('잘못된 번호 형식입니다.');
              inAvtiveBtn();
              
            }else { $('#userPhnum').next().text(""); avtiveBtn(); }

});
          

$('#userPass').keyup( (e) => {
            /* function chkPwd(){ */
              
    var pw = $('#userPass').val();
    
    var num = pw.search(/[0-9]/g);
    
    var eng = pw.search(/[a-z]/ig);
    
    var spe = pw.search(/[`~!@@#$%^&*|₩₩₩'₩";:₩/?]/gi); 
  
    
    if(pw.length < 8 || pw.length > 20 ){
      $('#userPass').next().text("8자리 ~ 20자리 이내로 입력해주세요.");
      inAvtiveBtn();
      
    } else if(pw.search(/₩s/) != -1 ){
      $('#userPass').next().text("비밀번호는 공백업이 입력해주세요.");
      
      inAvtiveBtn();
      
    }else if(num < 0 || eng < 0 || spe < 0  ){
      $('#userPass').next().text("영문,숫자, 특수문자를 혼합하여 입력해주세요.");
      inAvtiveBtn();
    }else{ $('#userPass').next().text("");
           avtiveBtn();}
  });
  
  /*$('#userPassConfirm').focusin( () => {*/
    
    $('#userPassConfirm').keyup( (e) => {
      if($('#userPass').val() !== $('#userPassConfirm').val() ) {      
        $('#userPassConfirm').next().text("비밀 번호가 다릅니다");
        inAvtiveBtn();
      }else { $('#userPassConfirm').next().text(""); avtiveBtn(); }
    });
    
    /*  })*/  
  


  