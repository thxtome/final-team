<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>

<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <!-- PAGE settings -->
  <link rel="icon" href="https://templates.pingendo.com/assets/Pingendo_favicon.ico">
  <title>Album</title>
  <meta name="description" content="Wireframe design of an album page by Pingendo">
  <meta name="keywords" content="Pingendo bootstrap example template wireframe album ">
  <meta name="author" content="Pingendo">
  <!-- CSS dependencies -->
  <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css"
    type="text/css">
  <script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>
  <link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/auction/searchsidebar.css" />">
  <link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/auction/searchcontent.css" />">
  <link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/auction/searchbar.css" />">
<link href="https://fonts.googleapis.com/css?family=Gothic+A1&display=swap" rel="stylesheet">
</head>

<body>
<c:import url="/WEB-INF/jsp/include/header.jsp" />
  <div id="wrapper">
    <div id="sidebar">
      <div class="checklist categorylist box-line">
        <h3>카데고리</h3>
        <ul>
        <c:forEach var="category" items="${category}" >
          <li>
       		<i class="fas fa-${category.categoryIcon} category-filter"></i>
          	<a class="category cnkfilter" id="category${category.categoryCode}" 
          	data-selected="" data-value="${category.categoryCode}" title="${category.categoryName}">
				${category.categoryName}
          	</a>
          </li>	        
        </c:forEach>
        </ul>
      </div>
      <div class="checklist box-line accordion" id="price_filter">
          <div><h3>가격</h3></div>
          <ul>
            <li><a class="price-filter cnkfilter" data-selected="" data-value="2만원 미만" title="2만원 미만">2만원 미만</a></li>
            <li><a class="price-filter cnkfilter" data-selected="" data-value="2만원  ~ 5만원" title="2만원 ~ 5만원">2만원 ~ 5만원</a></li>
            <li><a class="price-filter cnkfilter" data-selected="" data-value="5만원  ~ 10만원" title="5만원 ~ 10만원">5만원 ~ 10만원</a></li>
            <li><a class="price-filter cnkfilter" data-selected="" data-value="10만원  ~ 20만원" title="10만원 ~ 20만원">10만원 ~ 20만원</a></li>
            <li><a class="price-filter cnkfilter" data-selected="" data-value="20만원 이상" title="20만원 이상">20만원 이상</a></li>
            <li>
              <input class="price-filter cnkfilter" data-value="price-choice" id="num1" data-selected="" type="text" numberOnly/> ~
              <input class="price-filter cnkfilter" data-value="price-choice" id="num2" data-selected="" type="text" numberOnly/>
              <a class="price_srh" data-selected="" data-value="price-choice"></a>
            </li>
          </ul>
      </div>
      <div class="checklist box-line accordion" id="date">
          <div><h3>시간</h3></div>
          <ul>
            <li><a class="time-filter cnkfilter" data-selected="" data-value="1일 미만" title="1일 미만">1일 미만</a></li>
            <li><a class="time-filter cnkfilter" data-selected="" data-value="3일 ~ 5일" title="3일~5일">3일~5일</a></li>
            <li><a class="time-filter cnkfilter" data-selected="" data-value="5일 이상" title="5일 이상">5일 이상</a></li>
          </ul>
      </div>
      <div class="checklist box-line accordion" id="bidcount">
          <div><h3>입찰</h3></div>
          <ul>
            <li><a class="bid-filter cnkfilter" data-selected="" data-value="1건 미만" title="1건 미만">1건 미만</a></li>
            <li><a class="bid-filter cnkfilter" data-selected="" data-value="5건 ~ 10건" title="5건 ~ 10건">5건 ~ 10건</a></li>
            <li><a class="bid-filter cnkfilter" data-selected="" data-value="10건 이상" title="10건 이상">10건 이상</a></li>
          </ul>
      </div>
    </div>
    
    <div class="layout-right">
      <div class="py-4 bg-light">
      	<div class="option_selectbar" id="selectbar">
      		<a id="resetfilter" href="" class="clear">
      			<span class="option-clean"></span>
      			전체해제
      		</a>
      		<span class="bar">|</span>
      	</div>
        <div class="container w-75">
          <div class="row">
            <div class="col-md-12" style="">
              <div class="card-body" style="">
                <h5 class="card-title m-0" style="	text-shadow: 0px 0px 1px black;">Best Auction</h5>
               	<div class="sort_area">
		      		<ul class="sort_list" id="sort_list">
						<li><a class="order" href="#" data-selected="" data-value="rel" title="랭킹순"><span></span>랭킹순</a></li>
						<li><a class="order" href="#" data-selected="" data-value="price_asc" title="낮은 가격순"><span></span>낮은 가격순</a></li>
						<li><a class="order" href="#" data-selected="" data-value="price_dsc" title="높은 가격순"><span></span>높은 가격순</a></li>
						<li><a class="order" href="#" data-selected="" data-value="date" title="등록일순"><span></span>등록일순</a></li>
						<li><a class="order" href="#" data-selected="" data-value="review" title="입찰 많은순"><span></span>입찰횟수순</a></li>
					</ul>
					<span class="view_count">
						<select id="view">
							<option selected="selected" value="1">10개씩 보기</option>
							<option value="2">20개씩 보기</option>
							<option value="3">40개씩 보기</option>
						</select>
					</span>
		      	</div>
              </div>
            </div>
          </div>
        </div>
        <div class="container w-75">
          <div class="row">
       		<c:choose>
					<c:when test="${empty auctionlist}">
						<div class="col-md-12">
							<div class="card-body" >
								<h5 class="card-title m-0" style="text-shadow: 0px 0px 1px black;">
								등록되어있는 경매가 존재하지 않습니다.</h5>
							</div>
						</div>
					</c:when>
					<c:otherwise>
						<c:forEach items="${auctionlist}" var="list">
							<div class="col-md-4 p-2" >
								<a class="auction_list" href="<c:url value="/auction/detailAuction.do?no=${list.auctionNo}&userEmail=${list.userEmail}" />">
									<div class="card box-shadow">
										<img class="card-img-top w-100"
											src="<c:url value="/resources/images/macbook.jpg"/>"
											style="height: 250px;">
										<p class="mb-1 m-1">${list.auctionTitle}</p>
										<c:choose>
											<c:when test="${empty list.maxPrice}">
												<p class="card-text m-1"><fmt:formatNumber value="${list.auctionMinPrice}" pattern="#,###"/>원</p>											
											</c:when>
											<c:otherwise>
												<p class="card-text m-1"><fmt:formatNumber value="${list.maxPrice}" pattern="#,###"/>원</p>		
											</c:otherwise>
										</c:choose>
										<div class="auction-condition">
											<span class="text-left">입찰 ${list.bidCnt}건</span>
											<small class="countdown text-muted m-1"></small>
										</div>
									</div>
								</a>
							</div>
						</c:forEach>
					</c:otherwise>
				</c:choose>
            </div>
          </div>
        </div>
      </div>
    </div>
 <c:import url="/WEB-INF/jsp/include/footer.jsp" />
    integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
    crossorigin="anonymous"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"
    integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49"
    crossorigin="anonymous"></script>
  <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"
    integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"
    style=""></script>
  <script src="https://use.fontawesome.com/releases/v5.2.0/js/all.js"></script>
  <script src="<c:url value="/resources/js/common/countdown.js" />"></script>
  <script>
    $("input:text[numberOnly]").on("keyup", function() {
      $(this).val($(this).val().replace(/[^0-9]/g,""));
  });
  </script>
  <script>
	  $(document).ready(e => {
			$("#selectbar").append(
				`<a href="#" data-value="${selectCategery.categoryCode}" class="options selected">
				${selectCategery.categoryName}
					<span class="del"></span>
				</a>
				`
			)
		})
  </script>
  <script src="<c:url value="/resources/js/auction/searchauction.js" />"></script>
  <script src="<c:url value="/resources/js/auction/accordion.js" />"></script>
</body>

</html>