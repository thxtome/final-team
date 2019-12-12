$(function (){
	let data = { pageNo: 1, searchType: "", sort: $("#sales option:selected").html() };
	$(".salesTabList").click((e) => {
		$(".salesTabList").removeClass("tabChoice");
		$(e.target).addClass("tabChoice");
		data.searchType = $(e.target).data("type");
		$("#salesAjax").html("");
		salesListAjax(data);
	});
	salesListAjax(data);
	
	function salesListAjax(data){
		data.searchType = $("#salesHead").siblings(".tabHead").find("span.tabChoice").data("type");
		console.log("타입:", data.searchType);
		console.log($("#sales option:selected").html());
		
		$.getJSON({
			url: `receiveSaleHistory.do`,
			contentType :'application/json',
			data: data,
			success: result => makeSalesHistory(result, data)
		});
	}
	// 신뢰도 별
	function makeStar(score){
		let starHtml = ``;
		let halfScore = Math.floor(score / 2); 
		for (let i = 1; i <= halfScore; i++){
			starHtml += `
				<i class="fas fa-star reviewStar"></i>
			`;	
		}
		if (score % 2 === 1){
			starHtml += `
				<i class="fas fa-star-half-alt reviewStar"></i>
			`;	
		}
		for (let i = halfScore; i < 5; i++){
			if ((score % 2 == 1) && i == 4){
				continue;
			}
			starHtml += `
			<i class="far fa-star reviewStar"></i>
			`;
		}
		return starHtml;
	}
	
	
	let contextPath = window.location.pathname.substr(0,window.location.pathname.indexOf("/",2));
	function makeSalesHistory(result, data){
		let salesContent = $("<div></div>");
		let salesAjax = $("#salesAjax");
		let html = ``;
		let starHtml = ``;
		if(result.list.length == 0){
			html = `
				<div class="emptyBox">판매한 내역이 없습니다.</div>
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
				console.log(Math.round(7.3));
				starHtml = makeStar(Math.round(r.userScore));
				html += `
					<div class="listCon">
								<div class="listHead">
									<span class="listDate"> 
										<span class="dateTitle">마감 날짜 </span> 
										<span class="dateContent">${format(r.auctionLimitDate, "ymd")}</span>
				`;
				if (r.dealCondition == '2'){
					html += `
						<span class="dealCondition colorBlue">정상거래</span>
					`;
				} else if (r.dealCondition == '3'){
					html += `
						<span class="dealCondition colorOrange">취소거래</span>
					`;
				} else if (r.dealCondition == '4'){
					html += `
						<span class="dealCondition colorRed">신고거래</span>
					`;
				} else if (r.auctionCondition == '3'){
					html += `
						<span class="dealCondition colorGreen">유찰경매</span>
					`;
				}
				html += `
					</span> 
					<span class="detailCon"> 
						<a>입찰금 <strong>${r.maxPrice}</strong>원</a>
					</span>
				</div>
				<div class="listBody">
					<ul>
						<li>
							<div class="productImg">
								<img class="imgCon"
									src="${contextPath}/file/downLoadFile.do?fileNo=${r.fileNo}"/>
							</div>
						</li>
						<li>
							<div class="productInfo">
								<a href="${contextPath}/auction/detailAuction.do?no=${r.auctionNo}&userEmail=${r.userEmail}" class="listTitle">${r.auctionTitle}</a>
								<div class="listRegDate">${format(r.auctionRegDate, "ymd")}</div>
							</div>
						</li>
						<li>
							<div class="writerInfo">
								<a class="auctionWriter">${r.userNickname}</a>
								<div>${r.userScore}점</div>
								<div class="starDiv">
									${starHtml}
								</div>
							</div>
							</li>
						</ul>
					</div>
				</div>
					`;
//							<div class="buttonDiv">
//								<a class="reportBtn"><strong>신고</strong></a>
//					<a class="reportBtn"><strong>신고</strong></a>
//					<a class="reportBtn"><strong>신고</strong></a>
//					if (r.dealNo!= 0 && r.reviewSender == null){
//						html += `
//							<a data-no="${r.auctionNo}" class="reviewBtn">후기등록</a>
//						`;
//					}
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