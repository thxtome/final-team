$(function (){
	let data = { pageNo: 1, searchType: ""};
	$(".salesTabList").click((e) => {
		$(".salesTabList").removeClass("tabChoice");
		$(e.target).addClass("tabChoice");
		data.searchType = $(e.target).data("type");
		$("#salesAjax").html("");
		console.log(data.searchType);
		salesListAjax(data);
	});
	console.log(data.searchType);
	salesListAjax(data);
	
	function salesListAjax(data){
		$.getJSON({
			url: `receiveSaleHistory.do`,
			contentType :'application/json',
			data: data,
			success: result => makeSalesHistory(result, data)
		});
	}
	
	function makeSalesHistory(result, data){
		let salesContent = $("<div></div>");
		let salesAjax = $("#salesAjax");
		let html = ``;
		if(result.list.length == 0){
			html = `
				<div class="emptyBox">구매한 내역이 없습니다.</div>
			`;
			salesContent.html(html);
		} else {
			html = `
					<div id="salesSort" class="yearSort">
						<select name="sort">
						<option>전체</option>
						<option>2019</option>
						<option>2018</option>
						</select>
					</div>
			`;
			$.each(result.list, (i, r) => {
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
		salesContent.html(html);
		salesContent.append($("<div></div>").addClass("pagination"));
		salesAjax.html(salesContent.html());
		pg.print(salesAjax, result.pr);
	};
	
	pg.movePage($("#salesAjax"),(pageNo)=>{
		let year = $("#sales option:selected").html();
		let data = { 
				pageNo: pageNo,
				searchType: $("#sales option:selected").html()
		};
		console.log(pageNo);
		salesListAjax(data);
	});
	
    pg.movePrevTab($("#salesAjax"),(pageNo)=>{
		let year = $("#sales option:selected").html();
		let data = { 
				pageNo: pageNo,
				searchType: $("#sales option:selected").html()
		};
		salesListAjax(data);
	});

    pg.moveNextTab($("#salesAjax"),(pageNo)=>{
		let year = $("#sales option:selected").html();
		let data = { 
				pageNo: pageNo,
				searchType: $("#sales option:selected").html()
		};
		salesListAjax(data);
	});
	
});