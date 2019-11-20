search();

function success(result){
	console.log(result)
	let $tbody = $("<tbody></tbody>")
	if(result.list.length == 0){
		$(".dataContent tbody").html($("<tr><td style=text-align:center colspan='6'>검색결과가 없습니다.</td></tr>"));
		return;
	}
	result.list.forEach((user)=>{
		let $tr = $("<tr></tr>")
		$tr.append($(`<td>${user.userEmail}</td>`));
		$tr.append($(`<td>${user.userNickname}</td>`));
		$tr.append($(`<td>${user.userPhnum}</td>`));
		$tr.append($(`<td>${user.userDealCnt}</td>`));
		$tr.append($(`<td>${user.userScore}</td>`));
		$tr.append($(`<td>${user.userReviewCnt}</td>`));
		$tbody.append($tr);
	})
		
	$(".dataContent tbody").html($tbody.html())
	
	pg.print(result.pr);
}

//페이지 이동
pg.movePage((pageNo)=>{
	searchQuery.pageNo = pageNo;
	search(searchQuery);
})

//리스트사이즈 변경
$("#listSize").on("change",()=>{
	searchQuery.pageNo = 1;
	searchQuery.listSize = $("#listSize").val(); 
	search(searchQuery);
})

//정렬 이벤트
$(".dataFilters li").click((e)=>{
	searchQuery.sort = $(e.target).data("sort");
	search(searchQuery);
})



