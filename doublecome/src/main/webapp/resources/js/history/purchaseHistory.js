$(function (){
	let data = { pageNo: 1, searchType: ""};
	$(".purchaseTabList").click((e) => {
		$(".purchaseTabList").removeClass("tabChoice");
		$(e.target).addClass("tabChoice");
		data.searchType = $(e.target).data("type");
		$("#purchaseAjax").html("");
		purchaseListAjax(data);
	});
	
	purchaseListAjax(data);
	
	function purchaseListAjax(data){
		data.searchType = $("#purchaseHead").siblings(".tabHead").find("span.tabChoice").data("type");
		$.getJSON({
			url: `receivePurchaseHistory.do`,
			contentType :'application/json',
			data: data,
			success: result => makePurchaseHistory(result, data) 
		});
	};
	
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
	function makePurchaseHistory(result, data){
		let purchaseContent = $("<div></div>");
		let purchaseAjax = $("#purchaseAjax");
		let html = ``;
		let starHtml = ``;
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
						<span class="dealCondition colorPink">취소거래</span>
					`;
				} else if (r.dealCondition == '4'){
					html += `
						<span class="dealCondition colorRed">신고거래</span>
					`;
				} else if (r.auctionCondition == '3'){
					html += `
						<span class="dealCondition colorYellow">유찰거래</span>
					`;
				}
				html += `
						</span>
						<span class="detailCon"> 
							<a>입찰금 <strong>${r.bidPrice}</strong>원</a>
						</span>
					</div>
				`;
				if (r.dealCondition == 1 || r.dealCondition == 2
						&& (r.dealNo!= 0 && r.reviewSender == null)){
					html += `					
					<div class="listBody marginRemove">
						<ul>
							<li>
						<div class="btnGroup"> 
						   <div class="more">
				        <button class="more-btn">
				            <span class="more-dot"></span>
				            <span class="more-dot"></span>
				            <span class="more-dot"></span>
				        </button>
				        <div class="more-menu">
				            <div class="more-menu-caret">
				                <div class="more-menu-caret-outer"></div>
				                <div class="more-menu-caret-inner"></div>
				            </div>
				            <ul class="more-menu-items" tabindex="-1" role="menu" aria-labelledby="more-btn" aria-hidden="true">
						`;
					if (r.dealNo!= 0 && r.reviewSender == null){
						html += `
							<li class="more-menu-item" role="presentation">
			                    <button type="button" class="more-menu-btn reviewBtn" role="menuitem">
			                    <a data-no="${r.auctionNo}">후기등록</a>
			                    </button>
			                </li>
						`;
					}
					if (r.dealCondition == 1){
						html +=`
							<li class="more-menu-item" role="presentation">
			                    <button type="button" class="more-menu-btn" role="menuitem">거래완료</button>
			                </li>
			                <li class="more-menu-item" role="presentation">
			                    <button type="button" class="more-menu-btn" role="menuitem">신고</button>
			                </li>
			                <li class="more-menu-item" role="presentation">
			                    <button type="button" class="more-menu-btn" role="menuitem">거래취소</button>
			                </li>
						`;
					}
					html += `
						 </ul>
				        </div>
				    </div>
				    </div>
					`;
				} else{
					html += `
					<div class="listBody">
						<ul>
							<li>
					`;
				}
				/*
				html += `
					 <div class="container"> 
						   <div class="more">
				        <button id="more-btn" class="more-btn">
				            <span class="more-dot"></span>
				            <span class="more-dot"></span>
				            <span class="more-dot"></span>
				        </button>
				        <div class="more-menu">
				            <div class="more-menu-caret">
				                <div class="more-menu-caret-outer"></div>
				                <div class="more-menu-caret-inner"></div>
				            </div>
				            <ul class="more-menu-items" tabindex="-1" role="menu" aria-labelledby="more-btn" aria-hidden="true">
				                <li class="more-menu-item" role="presentation">
				                    <button type="button" class="more-menu-btn" role="menuitem">후기등록</button>
				                </li>
				                <li class="more-menu-item" role="presentation">
				                    <button type="button" class="more-menu-btn" role="menuitem">거래완료</button>
				                </li>
				                <li class="more-menu-item" role="presentation">
				                    <button type="button" class="more-menu-btn" role="menuitem">신고</button>
				                </li>
				                <li class="more-menu-item" role="presentation">
				                    <button type="button" class="more-menu-btn" role="menuitem">거래취소</button>
				                </li>
				            </ul>
				        </div>
				    </div>
				    </div>
				   `;
				   */
				html +=`
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
						</div>
							</li>
						</ul>
					</div>
				</div>
				`;
//				<a class="reportBtn"><strong>신고</strong></a>
//					if (r.dealNo!= 0 && r.reviewSender == null){
//						html += `
//							<a data-no="${r.auctionNo}" class="reviewBtn">후기등록</a>
//						`;
//					}
			});
		}
		purchaseContent.html(html);
		purchaseContent.append($("<div></div>").addClass("pagination"));
		purchaseAjax.html(purchaseContent.html());
		pg.print(purchaseAjax, result.pr);
		
		let el = document.querySelector('.more');
		console.log("여기도착");
		console.log(el);
		let btn = el.querySelector('.more-btn');
		let menu = el.querySelector('.more-menu');
		let visible = false;
		function showMenu(e) {
			e.preventDefault();
			if (!visible) {
				visible = true;
				el.classList.add('show-more-menu');
				menu.setAttribute('aria-hidden', false);
				document.addEventListener('mousedown', hideMenu, false);
			}
		}

		function hideMenu(e) {
			if (btn.contains(e.target)) {
				return;
			}
			if (visible) {
				visible = false;
				el.classList.remove('show-more-menu');
				menu.setAttribute('aria-hidden', true);
				document.removeEventListener('mousedown', hideMenu);
			}
		}

		btn.addEventListener('click', showMenu, false);
		
	};
    $("body").on("click", ".reviewBtn", (e) => {
    	console.log("후기등록 클릭");
    	$("#reviewForm > form").attr("action","addReview.do");
    	$("#auctionTitle").html($(e.target).closest("ul").find(".listTitle").html());
    	$("#auctionNo").val($(e.target).data("no"));
    	$(".regitbtn > button").html("등록");
    	$("#addReviewModal").css("display","block");
    });
	pg.movePage($("#purchaseAjax"),(pageNo)=>{
		let year = $("#purchase option:selected").html();
		let data = { 
				pageNo: pageNo,
				searchType: $("#purchase option:selected").html()
		};
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
