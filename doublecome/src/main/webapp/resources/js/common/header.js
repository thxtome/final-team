$(".topContent>div:nth-child(4)>div:first").mouseover(()=>{
    $(".categoryBar").show();
})
$(".categoryBar").parent().mouseleave(()=>{
    $(".categoryBar").hide()
});
let path = window.location.pathname;
$("#movetomain").click(() => {
	let path2 = path.split("/")
	location.href= '/' + path2[1] + '/main.do';
})