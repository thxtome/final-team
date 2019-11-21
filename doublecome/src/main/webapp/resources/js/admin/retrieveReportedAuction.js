$(".dataContent input[type=checkbox]:eq(0)").click(()=>{
	let $checks =  $(".dataContent input[type=checkbox]")
	if($checks.filter(":eq(0)").prop("checked") == true){
		$checks.prop("checked",true);
	} else{
		$checks.prop("checked",false);	
	}
})


$(".dataContent input[type=checkbox]:gt(0)").click((e)=>{
	let $allChecks = $(".dataContent input[type=checkbox]");
    let $checks = $allChecks.filter(":gt(0)");
	let $allCheck = $allChecks.filter(":eq(0)");
    let check = $(e.target).prop("checked");
    if(check === true && $checks.filter(":checked").length === 6){
    	$allCheck.prop("checked",true)
    } 

    else if(check === false) {
    	$allCheck.prop("checked",false)
    }
})
