$(function (){
	$(".salesTabList").click((e) => {
		$(".salesTabList").removeClass("tabChoice");
		$(e.target).addClass("tabChoice");
		salesListAjax(target.data("name"));
		console.log(target.data("name"));
	});
	
	function salesListAjax(searchType){
		$.getJSON({
			url: `receiveSaleHistory.do`,
			data: {
				searchType,
			},
			success: result => makeSalesHistory(result, searchType)
		});
	}
	
	function makeSalesHistory(result, searchType){
		console.log("판매내역함수도착");
		console.log(result);
		let html = ``;
		if(result.length == 0){
			html = `
				<div class="emptyBox">구매한 내역이 없습니다.</div>
			`;
		} else {
			html = `
					<div class="yearSort">
						<select name="sort">
						<option>전체</option>
						<option>2019</option>
						<option>2018</option>
						</select>
					</div>
			`;
			$.each(result, (i, r) => {
				html += `
					<div class="listCon">
								<div class="listHead">
									<span class="listDate"> <span class="dateTitle">마감
											날짜 </span> <span class="dateContent">${format(r.auctionLimitDate, "ymd")}</span>
									</span> <span class="detailCon"> <a>입찰금 <strong>${r.bidPrice}</strong>원
									</a>
									</span>
								</div>
								<div class="listBody">
									<ul>
										<li>
											<div class="productImg">
												<img class="imgCon"
													src="/doublecome/resources/images/profileImg.png"/>
											</div>
										</li>
										<li>
											<div class="productInfo">
												<a href="/doublecome/auction/detailAuction.do?no=${r.auctionNo}&userEmail=${r.userEmail}" class="listTitle">${r.auctionTitle}</a>
												<div class="listRegDate">${format(r.auctionRegDate, "ymd")}</div>
											</div>
										</li>
										<li>
											<div class="writerInfo">
												<a class="auctionWriter">${r.userNickname}</a>
												<div>${r.score}점</div>
												<a class="reportBtn"><strong>신고</strong></a>
					`;
					if (r.dealNo!= 0 && r.reviewSender == null){
						html += `
							<a data-no="${r.auctionNo}" class="reviewBtn">후기등록</a>
						`;
					}
					html += `
											</div>
										</li>
									</ul>
								</div>
							</div>
						`;
			});
		}
		$("#salesAjax").html(html);
	};
	salesListAjax("");
});