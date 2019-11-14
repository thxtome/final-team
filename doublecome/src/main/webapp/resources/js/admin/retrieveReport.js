  $(".editBtn").click((e)=>{
      let $eles = $(e.target).closest("tr").find("td:lt(2)");
      let $modalEles = $(".adminMoadalBack input");
      for(let i = 0; i < $eles.length; i++){
          $($modalEles[i]).val($($eles[i]).text());
      } 
      $(".adminModal").show();
      $("#eventBtn").text("수정");
  })

  $(".addReportBtn > button").click((e)=>{
      $("#eventBtn").text("등록");
      $(".adminModal").show();
  });

  $(".adminMoadalBack").click((e)=>{
      if($(e.target).hasClass("adminMoadalBack")){
          modalClose();
      }
  })    

  $("#cancelBtn").click(()=>{
      modalClose();
  })



  function modalClose(){
      $(".adminModal").hide();
      let $modalEles = $(".adminMoadalBack input");
      $modalEles.val("");
  }