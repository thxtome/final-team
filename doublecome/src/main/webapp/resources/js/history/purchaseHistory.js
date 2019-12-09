$(function (){
	let data = { pageNo: 1, searchType: ""};
	$(".purchaseTabList").click((e) => {
		$(".purchaseTabList").removeClass("tabChoice");
		$(e.target).addClass("tabChoice");
		data.searchType = $(e.target).data("type");
		console.log(data.searchType);
		$("#purchaseAjax").html("");
		purchaseListAjax(data);
	});
	
	purchaseListAjax(data);
	
	function purchaseListAjax(data){
		$.getJSON({
			url: `receivePurchaseHistory.do`,
			contentType :'application/json',
			data: data,
			success: result => makePurchaseHistory(result, data) 
		});
	};
	
	function makePurchaseHistory(result, data){
		let purchaseContent = $("<div></div>");
		let purchaseAjax = $("#purchaseAjax");
		let html = ``;
		console.log(result.list.length);
		if(result.list.length == 0){
			html = `
				<div class="emptyBox">구매한 내역이 없습니다.</div>
			`;
			purchaseContent.html(html);
		} else {
			html += `
					<div id="purchaseSort" class="yearSort">
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
		purchaseContent.html(html);
		purchaseContent.append($("<div></div>").addClass("pagination"));
		purchaseAjax.html(purchaseContent.html());
		pg.print(purchaseAjax, result.pr);
		
	};
	
	pg.movePage($("#purchaseAjax"),(pageNo)=>{
		let year = $("#purchase option:selected").html();
		let data = { 
				pageNo: pageNo,
				searchType: $("#purchase option:selected").html()
		};
		console.log(pageNo);
		purchaseListAjax(data);
	});
	
    pg.movePrevTab($("#purchaseAjax"),(pageNo)=>{
		let year = $("#purchase option:selected").html();
		let data = { 
				pageNo: pageNo,
				searchType: $("#purchase option:selected").html()
		};
		purchaseListAjax(data);
	});

    pg.moveNextTab($("#purchaseAjax"),(pageNo)=>{
		let year = $("#purchase option:selected").html();
		let data = { 
				pageNo: pageNo,
				searchType: $("#purchase option:selected").html()
		};
		purchaseListAjax(data);
	});

});
