$(document).ready(e => {
	
// 카테고리별 보기 
	$("a.category").unbind("click").click(e => {
		// filterbar 필터 추가
		selectCheck(e);
		//ajax 처리
		e.preventDefault();
		let sendData = "{";
		let json;
		let filter = $(".options")
		let ele = e.target;
		let flag = true;
		for (let option of filter){
			if (flag == true) {
				sendData = sendData + '"'+ $(option).data("name") + '"' + " : " + $(option).data("value")
				flag = false;
			} else {
				sendData = sendData + "," + '"'+ $(option).data("name") + '"'+ " : " + $(option).data("value")				
			}
		}
		sendData += "}";
		let sadasd = JSON.stringify({categoryCode : 1})
		console.log(sadasd)
		console.log(sendData)
		console.log($(ele).attr("href"))
		let options = {
			url : $(ele).attr("href"),
			type : "POST",
			contentType : "application/json",
			data : sendData
		}
		$.ajax(options).done(data => {
			$("#list_view").html(makeAuctionlist(data))
			console.log(data)
		})
		.fail(() => {
			 alert("ajax 처리 에러발생");
		 });
	})
	$("#date li a").unbind("click").click(e=> {
		selectCheck(e);
	})
	// 날짜별로 검색
	$("#price_filter li a").unbind("click").click(e => {
		selectCheck(e);
	})
	// 입찰순으로 보기
	$("#bidcount li a").unbind("click").click(e => {
		selectCheck(e);
	})
	$("#price_choice").unbind("click").click(e => {
		selectCheck(e)
	})
	$("#sort_list a").click(e => {
		$("#sort_list span").removeClass("on")
		$(e.target).find("span").addClass("on");
	})
})
function makeAuctionlist(data) {
	let $auctionField = $("<div class='col-md-4 p-2' ></div>");
	if(data.length == 0) {
		$auctionField = $("<div class='col-md-12'></div>")
		return $auctionField.append(`
			<div class="col-md-12">
				<div class="card-body" >
					<h5 class="card-title m-0" style="text-shadow: 0px 0px 1px black;">
					등록되어있는 경매가 존재하지 않습니다.</h5>
				</div>
			</div>
		`)
	}
	$.each(data, (i, list) => {
		let maxPrice = list.maxPrice;
		if(list.maxPrice == null){
			maxPrice == list.minprice
		}
		$auctionField.append(`
			<a class="auction_list" href="/doublecome/WEB-INF/auction/detailAuction.do?no=${list.auctionNo}&userEmail=${list.userEmail}">
				<div class="card box-shadow">
					<img class="card-img-top w-100"
						src="/doublecome/resources/images/macbook.jpg"
						style="height: 250px;"/>
					<p class="mb-1 m-1">${list.auctionTitle}</p>
					<p class="card-text m-1">${maxPrice}원</p>		
					<div class="auction-condition">
						<span class="text-left">입찰 ${list.bidCnt}건</span>
						<small class="countdown text-muted m-1"></small>
					</div>
				</div>
			</a>
		`)
	})
	return $auctionField
}
$(document).on("click",".options", e => {
	let cate = $(e.target).attr("class")
	let arr = $(".cnkfilter");
	if($(e.target).prop('tagName') == "SPAN"){
		if($(e.target).parent().attr("class").cont("category ")){
			return
		}else if($(e.target).parent().attr("class").endsWith("category selected")){
			return
		}
		$(e.target).parent().remove()
		for (let filter of arr) {
		if ($(e.target).parent().data("value") == filter.dataset.value) {
			$(filter).removeClass("selected");
			$(filter).prev().removeClass("selected")
			}
		}
		return
	}
	if(cate.endsWith("category ")){
		return
	} else if(cate.endsWith("category selected")){
		return
	}
	$(e.target).remove()		
	for (let filter of arr) {
		if ($(e.target).data("value") == filter.dataset.value) {
			$(filter).removeClass("selected");
			$(filter).prev().removeClass("selected")
		}
	}
})


function selectCheck(e) {
	let $event = $(e.target);
	let clz = $event.attr('class').replace(/cnkfilter/,"")
	if ($event.data("selected") == true) {
		$event.removeClass("selected")
		$event.prev().removeClass("selected")
		$event.data("selected",false) 
		let arr = $(".options");
		for (let filter of arr) {
			if ($event.data("value") == filter.dataset.value) {
				$(filter).remove();
			}
		}
		if ($event.attr("class").startsWith("category ") == false){			
			return;
		}
	}
	let chkArr = $("."+clz);
	let arr = $(".options");
	for (let filter of arr) {
		for (let val of chkArr) {
			$(val).removeClass("selected");
			$(val).prev().removeClass("selected");
			if (filter.dataset.value == val.dataset.value){
				filter.remove();				
			}
		}
		$(filter).addClass("selected")
	}
	let title = e.target.title;
	let auctionName = $event.data("name");
	let datavalue = e.target.dataset.value;
	let priceChoice = 0;
	if($event.data("value") == "priceChoice") {
		let num1 = parseInt($("#num1").val())
		let num2 = parseInt($("#num2").val())
		if (num1 >= num2 && num2 !== "") {
			Swal.fire({
				icon: 'error',
				text: '시작금액보다 종료금액이 더 적거나 같을수 없습니다',
				confirmButtonText : '확인'
			})
			return
		}
		if (num2 == "") {
			title = comma(uncomma(num1)) + "원 ~ "
			priceChoice = num1
		} else {			
			title = comma(uncomma(num1)) + "원 ~ " + comma(uncomma(num2)) +"원"
			priceChoice = num1+"~"+num2
		}
		$("#selectbar").append(
			`<a href="#" name="${priceChoice}" data-name="${auctionName} data-value="price" class="options selected">
			${title}
				<span class="del"></span>
			</a>
				`
		)
		return
	} 
	$event.addClass("selected")		
	$event.prev().addClass("selected")
	$event.data("selected",true)
	console.log(auctionName)
	$("#selectbar").append(
		`<a href="#" data-value="${datavalue}" data-name="${auctionName}" class="options selected ${clz}">
		${title}
			<span class="del"></span>
		</a>
		`
	)
}

function comma(str) {
    str = String(str);
    return str.replace(/(\d)(?=(?:\d{3})+(?!\d))/g, '$1,');
}

function uncomma(str) {
    str = String(str);
    return str.replace(/[^\d]+/g, '');
}

