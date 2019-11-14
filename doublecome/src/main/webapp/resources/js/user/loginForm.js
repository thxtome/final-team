($('#background').hide());
$('a').click( (e) => {
    let ele = e.target;
    if($(ele).attr("href").endsWith("/user/loginForm.do")){
    	e.preventDefault();
        $('#background').show();
    }
});
$('#background').click( (e) => {
    if($(e.target).attr("id") == "background"){
    	$('#background').hide();
    } 
});