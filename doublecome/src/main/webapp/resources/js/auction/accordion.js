$(document).ready(function(){
  $(".accordion ul").hide();
  // $("ul > li:first-child a").next().show();
  $(".accordion > a").click(function(){
    $(this).next().toggle(300);
//     $(this).next().slideDown(300);
    $(".accordion > a").not(this).next().slideUp(300);
    return false;
  });
});