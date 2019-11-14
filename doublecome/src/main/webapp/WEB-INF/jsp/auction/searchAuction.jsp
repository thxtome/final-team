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
  <link rel="stylesheet" href="wireframe.css">
  <link rel="stylesheet" href="sidebar.css">
</head>

<body>
	<c:import url="/WEB-INF/jsp/include/header.jsp" />
  <div id="wrapper">
    <div id="sidebar">
      <div class="checklist box-line">
          <h3>가격</h3>
          <ul>
            <li><a href="">2만원 미만</a></li>
            <li><a href="">2만원 ~ 5만원</a></li>
            <li><a href="">5만원 ~ 10만원</a></li>
            <li><a href="">10만원 ~ 20만원</a></li>
            <li><a href="">20만원 이상</a></li>
            <li>
              <input class="price-choice" type="text" numberOnly/> ~
              <input class="price-choice" type="text" numberOnly/>
              <a href="" class="price_srh"></a>
            </li>
          </ul>
      </div>
      <div class="checklist categories">
        <h3>카데고리</h3>
        <ul>
        <c:forEach var="category" items="${category}">
          <li>
            <input type="checkbox" id="category${category.categoryCode}"/><label for="${category.categoryCode }">${category.categoryName}</label>
          </li>	        
        </c:forEach>
        </ul>
      </div>
      <div class="checklist box-line">
          <h3>시간</h3>
          <ul>
            <li><a href="">1일 미만</a></li>
            <li><a href="">1일 ~ 2일</a></li>
            <li><a href="">2일 이상</a></li>
          </ul>
      </div>
      <div class="checklist box-line">
          <h3>입찰</h3>
          <ul>
            <li><a href="">1건 미만</a></li>
            <li><a href="">5건 ~ 10건</a></li>
            <li><a href="">10건 이상</a></li>
          </ul>
      </div>
    </div>
    <div class="layout-right">
      <div class="py-4 bg-light">
        <div class="container w-75">
          <div class="row">
            <div class="col-md-12" style="">
              <div class="card-body" style="">
                <h5 class="card-title m-0" style="	text-shadow: 0px 0px 1px black;">Best Auction</h5>
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
  <script>
    $("input:text[numberOnly]").on("keyup", function() {
      $(this).val($(this).val().replace(/[^0-9]/g,""));
  });
  </script>
</body>

</html>