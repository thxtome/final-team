$(".parentItem").click((e) => {
    let target = $(e.target).closest(".parentItem");
    target.toggleClass("selected");
    target.siblings().toggle();
    target.find("svg:last").toggleClass("fa-chevron-right");
    target.find("svg:last").toggleClass("fa-chevron-down");
})

$(".moveItem").click((e) => {
    $(".moveItem").removeClass("clicked");
    let target = $(e.target).closest(".moveItem");
    target.addClass("clicked");
})

$(".moveItem").click((e)=>{
   console.log($(e.target).data("action"));
   $("#loadContent").load($(e.target).data("action"));
})

console.log($("#outerIndex").val());
console.log($("#innerIndex").val());
