$(".parentItem").click((e) => {
    let target = $(e.target).closest(".parentItem");
    target.toggleClass("selected");
    target.siblings().toggle();
    target.find("svg:last").toggleClass("fa-chevron-right");
    target.find("svg:last").toggleClass("fa-chevron-down");
})

$(".moveItem").click((e) => {
	location.href = $(e.target).closest(".moveItem").data("action");
})

$($(".moveItem")[$("#innerIndex").val()]).addClass("clicked");


let $parentItem = $($(".moveItem")[$("#innerIndex").val()]).siblings(".parentItem");
$parentItem.toggleClass("selected").siblings().toggle();
$parentItem.find("svg:last").toggleClass("fa-chevron-right").toggleClass("fa-chevron-down");