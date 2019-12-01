//file upload
function upload() {

    var percentage = null,
        clippaper = document.querySelector('.uploader__clip'),
        clippaperLength = clippaper.getTotalLength();
        clippaper.style.strokeDasharray = clippaperLength;
        clippaper.style.strokeDashoffset = -clippaperLength;
  
    function Init() {
  
      var fileSelect    = document.querySelector('.uploader__input'),
          fileDrag      = document.querySelector('.uploader__label'),
          fileSize      = null;
  
      /*fileSelect.addEventListener('change', fileSelectHandler, false);*/
  
      // Is XHR2 available?
      var xhr = new XMLHttpRequest();
      if (xhr.upload) {
        // File Drop
        fileDrag.addEventListener('dragover', fileDragHover, false);
        fileDrag.addEventListener('dragleave', fileDragHover, false);
        fileDrag.addEventListener('drop', fileSelectHandler, false);
      }
    }
  
    function fileDragHover(e) {
      var fileDrag = document.querySelector('.uploader__label');
  
      e.stopPropagation();
      e.preventDefault();
  
      fileDrag.className = (e.type === 'dragover' ? 'uploader__label hover' : 'uploader__label');
    }
  
    function fileSelectHandler(e) {
  
      document.querySelector('.uploader').classList.add('uploading');
  
      // Fetch FileList object
      var files = e.target.files || e.dataTransfer.files;
  
      // Cancel event and hover styling
      fileDragHover(e);
  
      // Process all File objects
      for (var i = 0, f; f = files[i]; i++) {
        parseFile(f);
        uploadFile(f);
      }
    }
  
    function parseFile(file) {
  
       console.log(file.name);
  
      var imageName = file.name;
  
      var isGood = (/\.(?=gif|jpg|png|jpeg)/gi).test(imageName);
      if (isGood) {
        // Thumbnail Preview
        document.querySelector('.uploader__file').src = URL.createObjectURL(file);
      }
      else {
        document.querySelector('.uploader').reset();
      }
    }
  
    function updateFileProgress(e) {
  
      if (e.lengthComputable) {
        percentage = (e.loaded / fileSize) * 100;
        clippaper.style.strokeDashoffset = (-clippaperLength + (percentage  * clippaperLength) / 100);
  
        if (e.loaded === fileSize) {
          document.querySelector('.uploader__file').classList.add("show");
        }
      }
    }
  
    function uploadFile(file) {
  
      fileSize = file.size;
  
      var xhr = new XMLHttpRequest(),
        fileSizeLimit = 1024; // In MB
      if (xhr.upload) {
        // Check if file is less than x MB
        if (file.size <= fileSizeLimit * 1024 * 1024) {
          // Progress bar
          xhr.upload.addEventListener('progress', updateFileProgress, false);
  
          // File received / failed
          xhr.onreadystatechange = function(e) {
            if (xhr.readyState == 4) {
              // Everything is good!
  
              // progress.className = (xhr.status == 200 ? "success" : "failure");
              // document.location.reload(true);
            }
          };
  
          // Start upload
          xhr.open('POST', document.querySelector('.uploader').action, true);
          xhr.setRequestHeader('X-File-Name', file.name);
          xhr.setRequestHeader('X-File-Size', file.size);
          xhr.setRequestHeader('Content-Type', 'multipart/form-data');
          xhr.send(file);
        } else {
          console.log('Please upload a smaller file (< ' + fileSizeLimit + ' MB).');
        }
      }
    }
  
    // Check for the various File API support.
    if (window.File && window.FileList && window.FileReader) {
      Init();
    } else {
      document.querySelector('.uploader__labele').style.display = 'none';
    }
  }
  
  upload();
  
  
  
 //validation check
  
  
function avtiveBtn() {
	 /* if($('input').val() !== "")*/
  $('#updateFormBtn').attr( 'disabled', false )
}

function inAvtiveBtn() {
  $('#updateFormBtn').attr( 'disabled', true )
}
	
	
function uniqueCheck(url, val) {
	  let r = 0;
	  $.ajax({
	    url: url,
	    data: { param: val},
	    async: false,
	    cache : false,
	    type: 'POST',
    success: (result) => {
                          console.log(result, "uniqueCheck", typeof(result));
                           
                          r = result;
                        }
  })

  return r;
};



$('#userNickname').keyup( (e) => {
  let nicknameRule = /^[a-zA-Z0-9]{3,21}|[A-Za-z가-힣0-9]{2,7}$/g;// 별명 입력 체크식
  
  if(!nicknameRule.test($("input[id='userNickname']").val()) ) {            
  //경고
    $('#userNickname').next().text('사용 할 수 없는 별명입니다.');
    inAvtiveBtn();          
  }else if(uniqueCheck("/doublecome/user/checkNickname.do", $("input[id='userNickname']").val()) == 1) {
    $('#userNickname').next().text('이미 등록된 별명입니다.');
    inAvtiveBtn();
  }else { $('#userNickname').next().text(""); avtiveBtn(); }

});


$('#userPass').keyup( (e) => {
    /* function chkPwd(){ */
      
var pw = $('#userPass').val();

var num = pw.search(/[0-9]/g);

var eng = pw.search(/[a-z]/ig);

var spe = pw.search(/[`~!@@#$%^&*|₩₩₩'₩";:₩/?]/gi); 


if(pw.length < 8 || pw.length > 20 ){
$('#userPassConfirm').next().text("8자리 ~ 20자리 이내로 입력해주세요.");
inAvtiveBtn();

} else if(pw.search(/₩s/) != -1 ){
$('#userPassConfirm').next().text("비밀번호는 공백업이 입력해주세요.");

inAvtiveBtn();

}else if(num < 0 || eng < 0 || spe < 0  ){
$('#userPassConfirm').next().text("영문,숫자, 특수문자를 혼합하여 입력해주세요.");
inAvtiveBtn();
}else{ $('#userPassConfirm').next().text("");
   avtiveBtn();}
});



$('#userPassConfirm').keyup( (e) => {
if($('#userPass').val() !== $('#userPassConfirm').val() ) {      
$('#userPassConfirm').next().text("비밀 번호가 다릅니다");
inAvtiveBtn();
}else { $('#userPassConfirm').next().text(""); avtiveBtn(); }
});
 
  