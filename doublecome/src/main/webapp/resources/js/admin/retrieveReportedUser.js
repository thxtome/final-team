//체크박스 선택 코드========================================================================
$(".dataContent").on("click","input[type=checkbox]:eq(0)",()=>{
	let $checks =  $(".dataContent input[type=checkbox]")
	if($checks.filter(":eq(0)").prop("checked") == true){
		$checks.prop("checked",true);
	} else{
		$checks.prop("checked",false);	
	}
})


$(".dataContent").on("click","input[type=checkbox]:gt(0)",(e)=>{
	let $allChecks = $(".dataContent input[type=checkbox]");
    let $checks = $allChecks.filter(":gt(0)");
	let $allCheck = $allChecks.filter(":eq(0)");
    let check = $(e.target).prop("checked");
    if(check === true && $checks.filter(":checked").length === $checks.length){
    	$allCheck.prop("checked",true)
    } 

    else if(check === false) {
    	$allCheck.prop("checked",false)
    }
})

search();

// 검색 ajax성공시==============================================================================================
function success(result){
	console.log(result)
	let $tbody = $("<tbody></tbody>")
	if(result.list.length == 0){
		$(".dataContent tbody").html($("<tr><td style=text-align:center colspan='6'>검색결과가 없습니다.</td></tr>"));
		pg.print($(".adminContent"),result.pr);
		return;
	}
	result.list.forEach((user)=>{
		$("#dataCount").text(user.userCnt)
		let $tr = $("<tr></tr>").attr("email",user.userEmail)
		$tr.append($(`<td><input type="checkbox" name="removeUser" value="${user.userEmail}"></td>`));
		$tr.append($(`<td>${user.userEmail}</td>`));
		$tr.append($(`<td>${user.userNickname}</td>`));
		$tr.append($(`<td>${user.userPhnum}</td>`));
		$tr.append($(`<td>${user.userReportedCnt}</td>`));
		$tr.append($(`<td>${user.userScore}</td>`));
		$tr.append($(`<td>${user.userReviewCnt}</td>`));
		$tbody.append($tr);
	})
		
	$(".dataContent tbody").html($tbody.html())
	
	pg.print($(".adminContent"),result.pr);
}


//신고목록 갱신==================================================================================================
function listReport(userEmail,pageNo){

	$.ajax({
		url:"detailReport.do",
		type:"POST",
		data:{userEmail:userEmail, pageNo:pageNo},
		success: (result)=>{
			console.log(result);
			let reportContent = $("<div></div>");
			
			result.list.forEach(ele => {			
				let report = ele;
				let content = $("<div></div>"); 
				content.append($(`<div><span>${report.reportSender}</span>
											<span>${format(report.reportRegDate)}</span><div>`))
								.append($(`<div><span>${report.reportTypeName}</span></div>`))	    
								.append($(`<div><span>${report.reportContent}</span></div>`))
				
				reportContent.append(content);
			})
			reportContent.append($("<div></div>").addClass("pagination"))
			
			$(".reportContent").html(reportContent.html()).attr("userEmail",userEmail);
			
			pg.print($(".reportContent"),result.pr);	
				    
		}
	})
} 

//신고목록 페이지 이동시============================================================================================
pg.movePage($(".reportContent"),(pageNo)=>{
	let userEmail = $(".reportContent").attr("userEmail")
	listReport(userEmail,pageNo)
})

//날짜변환========================================================================================================
function format(date){
    var year = date.year;		//yyyy
    var month = date.monthValue;		//MM
    month = month >= 10 ? month : '0' + month;	//month 두자리로 저장
    var day = date.dayOfMonth;			//dd
    day = day >= 10 ? day : '0' + day;		//day 두자리로 저장
    return  year + '-' + month + '-' + day;
}


//신고목록 리셋========================================================================================================
function resetReport() {
	$(".reportContent").html("");
}

//유저 삭제=============================================================================================================
$(".removeUserBtn").click(()=>{
	removeUser();
})

function removeUser(){
	let data = {};
	let userEmails = new Array;
	$(".dataContent input[type=checkbox]:gt(0):checked").each((index,ele)=>{
		userEmails.push($(ele).val());
	});
	console.log(userEmails);
	
	
	$.ajax({
		url:"removeUser.do",
		type:"POST",
		data:JSON.stringify(userEmails),
		contentType:"application/json",
		success: ()=>{
				search(searchQuery);
		}
	});
} 