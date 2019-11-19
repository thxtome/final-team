<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css"
    type="text/css">

  <link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/auction/searchsidebar.css" />">
  <link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/auction/searchcontent.css" />">
  <link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/auction/searchbar.css" />">
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
       		<i class="fas fa-${category.categoryIcon}"></i>
          	<a class="category cnkfilter" id="category${category.categoryCode}" 
          	href="#" data-selected="" data-value="${category.categoryCode}" title="${category.categoryName}">
				${category.categoryName}
          	</a>
          </li>	        
        </c:forEach>
        </ul>
      </div>
      <div class="checklist box-line" id="price_filter">
          <h3>가격</h3>
          <ul>
            <li><a class="cnkfilter" href="#" data-selected="" data-value="1" title="2만원 미만">2만원 미만</a></li>
            <li><a class="cnkfilter" href="#" data-selected="" data-value="2" title="2만원 ~ 5만원">2만원 ~ 5만원</a></li>
            <li><a class="cnkfilter" href="#" data-selected="" data-value="3" title="5만원 ~ 10만원">5만원 ~ 10만원</a></li>
            <li><a class="cnkfilter" href="#" data-selected="" data-value="4" title="10만원 ~ 20만원">10만원 ~ 20만원</a></li>
            <li><a class="cnkfilter" href="#" data-selected="" data-value="5" title="20만원 이상">20만원 이상</a></li>
            <li>
              <input class="price-choice" type="text" numberOnly/> ~
              <input class="price-choice" type="text" numberOnly/>
              <a href="" class="price_srh"></a>
            </li>
          </ul>
      </div>
      <div class="checklist box-line" id="date">
          <h3>시간</h3>
          <ul>
            <li><a class="cnkfilter" href="#" data-selected="" title="1일 미만">1일 미만</a></li>
            <li><a class="cnkfilter" href="#" data-selected="" title="3일~5일">3일~5일</a></li>
            <li><a class="cnkfilter" href="#" data-selected="" title="5일 이상">5일 이상</a></li>
          </ul>
      </div>
      <div class="checklist box-line" id="bidcount">
          <h3>입찰</h3>
          <ul>
            <li><a class="cnkfilter" href="#" data-selected="" title="1건 미만">1건 미만</a></li>
            <li><a class="cnkfilter" href="#" data-selected="" title="5건 ~ 10건">5건 ~ 10건</a></li>
            <li><a class="cnkfilter" href="#" data-selected="" title="10건 이상">10건 이상</a></li>
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
						<li id="_sort_rel"><a href="#" data-filter-name="sort" data-filter-value="rel" title="랭킹순"><span></span>랭킹순</a></li>
						<li id="_sort_price_asc"><a href="#" data-filter-name="sort" data-filter-value="price_asc" title="낮은 가격순"><span></span>낮은 가격순</a></li>
						<li id="_sort_price_dsc"><a href="#" data-filter-name="sort" data-filter-value="price_dsc" title="높은 가격순"><span></span>높은 가격순</a></li>
						<li id="_sort_date"><a href="#" data-filter-name="sort" data-filter-value="date" title="등록일순"><span></span>등록일순</a></li>
						<li  id="_sort_review"><a href="#" data-filter-name="sort" data-filter-value="review" title="입찰 많은순"><span></span>입찰횟수순</a></li>
					</ul>
					<span class="view_count">
						<select >
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
            <div class="col-md-4 p-2" style="">
              <a class="auction_list" href="">
                <div class="card box-shadow">
                  <img class="card-img-top w-100" src="<c:url value="/resources/images/macbook.jpg"/>"
                  style="height: 250px;">
                  <p class="mb-1 m-1">비트캠프 메인 컴퓨터</p>
                  <p class="card-text m-1">50,000원</p>
                  <div class="auction-condition">
                    <span class="text-left">입찰 1건</span>
                    <small class="text-muted m-1">3 days ago</small>
                  </div>
                </a>
              </div>
            </div>
            <div class="col-md-4 p-2" style="">
              <a class="auction_list" href="">
                <div class="card box-shadow">
                  <img class="card-img-top w-100" src="<c:url value="/resources/images/macbook.jpg"/>"
                  style="height: 250px;">
                  <p class="mb-1 m-1">비트캠프 메인 컴퓨터</p>
                  <p class="card-text m-1">50,000원</p>
                  <div class="auction-condition">
                    <span class="text-left">입찰 1건</span>
                    <small class="text-muted m-1">3 days ago</small>
                  </div>
                </a>
              </div>
            </div>
            <div class="col-md-4 p-2" style="">
              <a class="auction_list" href="">
                <div class="card box-shadow">
                  <img class="card-img-top w-100" src="<c:url value="/resources/images/macbook.jpg"/>"
                  style="height: 250px;">
                  <p class="mb-1 m-1">비트캠프 메인 컴퓨터</p>
                  <p class="card-text m-1">50,000원</p>
                  <div class="auction-condition">
                    <span class="text-left">입찰 1건</span>
                    <small class="text-muted m-1">3 days ago</small>
                  </div>
                </a>
              </div>
            </div>
            <div class="col-md-4 p-2" style="">
              <a href="">
                <div class="card box-shadow">
                  <img class="card-img-top w-100" src="<c:url value="/resources/images/macbook.jpg"/>"
                  style="height: 250px;">
                  <p class="mb-1 m-1">비트캠프 메인 컴퓨터</p>
                  <p class="card-text m-1">50,000원</p>
                  <div class="auction-condition">
                    <span class="text-left">입찰 1건</span>
                    <small class="text-muted m-1">3 days ago</small>
                  </div>
                </a>
              </div>
            </div>
            <div class="col-md-4 p-2" style="">
              <a href="">
                <div class="card box-shadow">
                  <img class="card-img-top w-100" src="<c:url value="/resources/images/macbook.jpg"/>"
                  style="height: 250px;">
                  <p class="mb-1 m-1">비트캠프 메인 컴퓨터</p>
                  <p class="card-text m-1">50,000원</p>
                  <div class="auction-condition">
                    <span class="text-left">입찰 1건</span>
                    <small class="text-muted m-1">3 days ago</small>
                  </div>
                </a>
              </div>
            </div>
            <div class="col-md-4 p-2" style="">
              <a href="">
                <div class="card box-shadow">
                  <img class="card-img-top w-100" src="<c:url value="/resources/images/macbook.jpg"/>"
                  style="height: 250px;">
                  <p class="mb-1 m-1">비트캠프 메인 컴퓨터</p>
                  <p class="card-text m-1">50,000원</p>
                  <div class="auction-condition">
                    <span class="text-left">입찰 1건</span>
                    <small class="text-muted m-1">3 days ago</small>
                  </div>
                </a>
              </div>
            </div>
            <div class="col-md-4 p-2" style="">
              <a href="">
                <div class="card box-shadow">
                  <img class="card-img-top w-100" src="<c:url value="/resources/images/macbook.jpg"/>"
                  style="height: 250px;">
                  <p class="mb-1 m-1">비트캠프 메인 컴퓨터</p>
                  <p class="card-text m-1">50,000원</p>
                  <div class="auction-condition">
                    <span class="text-left">입찰 1건</span>
                    <small class="text-muted m-1">3 days ago</small>
                  </div>
                </a>
              </div>
            </div>
            <div class="col-md-4 p-2" style="">
              <a href="">
                <div class="card box-shadow">
                  <img class="card-img-top w-100" src="<c:url value="/resources/images/macbook.jpg"/>"
                  style="height: 250px;">
                  <p class="mb-1 m-1">비트캠프 메인 컴퓨터</p>
                  <p class="card-text m-1">50,000원</p>
                  <div class="auction-condition">
                    <span class="text-left">입찰 1건</span>
                    <small class="text-muted m-1">3 days ago</small>
                  </div>
                </a>
              </div>
            </div>
            <div class="col-md-4 p-2" style="">
              <a href="">
                <div class="card box-shadow">
                  <img class="card-img-top w-100" src="<c:url value="/resources/images/macbook.jpg"/>"
                  style="height: 250px;">
                  <p class="mb-1 m-1">비트캠프 메인 컴퓨터</p>
                  <p class="card-text m-1">50,000원</p>
                  <div class="auction-condition">
                    <span class="text-left">입찰 1건</span>
                    <small class="text-muted m-1">3 days ago</small>
                  </div>
                </a>
              </div>
            </div>
      
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
 <c:import url="/WEB-INF/jsp/include/footer.jsp" />
  <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
    integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
    crossorigin="anonymous"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"
    integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49"
    crossorigin="anonymous"></script>
  <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"
    integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"
    style=""></script>
  <script src="https://use.fontawesome.com/releases/v5.2.0/js/all.js"></script>
  <script>
    $("input:text[numberOnly]").on("keyup", function() {
      $(this).val($(this).val().replace(/[^0-9]/g,""));
  });
  </script>
  <script src="<c:url value="/resources/js/auction/searchauction.js" />"></script>
</body>

</html>