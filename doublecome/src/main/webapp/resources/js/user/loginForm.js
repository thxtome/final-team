/*($('.hideLogin').hide());
($('#background').hide());
$('span > a').click( (e) => {
    let ele = e.target;
    if($(ele).attr("href").endsWith("/user/loginForm.do")){
    	e.preventDefault();
        $('#background').show();
        $('#loginForm').show();
    }
});
$('#background').click( (e) => {
    if($(e.target).attr("id") == "background"){
    	$('#background').hide();
    } 
});

$('#findId').click( (e) => {
    console.log($(e.target).attr("id"))
    $(e.target).click( ()=> {
        window.open('/doublecome/user/findIdForm.do',
                    'ID Find',
                    'width = 500, height = 300, location= no');
    })
});
$('#findPass').click( (e) => {
    console.log($(e.target).attr("id"))
    $(e.target).click( ()=> {
        window.open('/doublecome/user/findPassForm.do',
                    'PassWord Find',
                    'width = 500, height = 300, location= no');
    })
});*/
/*
$('#findId').click( (e) => {
	console.log($(e.target).attr("id"))
	if($(e.target).attr("id") == "findId"){
	//	$('#loginForm').hide();
	//	$('#findPassBG').hide();
		$('#findIdBG').show();
	}
});
$('#findIdBG').click( (e) => {
    if($(e.target).attr("id") == "findIdBG"){
    	$('#findIdBG').hide();
    } 
});


$('#findPass').click( (e) => {
	console.log($(e.target).attr("id"))
	if($(e.target).attr("id") == "findPass"){
	//	$('#loginForm').hide();
		$('#findPassBG').show();
	//	$('#findIdBG').hide();
	}
});
$('#findPassBG').click( (e) => {
    if($(e.target).attr("id") == "findPassBG"){
    	$('#findPassBG').hide();
    } 
});
*/