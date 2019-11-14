<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta http-equiv="X-UA-Compatible" content="ie=edge">
  <title>Document</title>
</head>
<link rel="stylesheet" href="<c:url value="/resources/css/common/normalize.css"/>">
<link rel="stylesheet" href="<c:url value="/resources/css/auction/bootstrap.min.css"/>">
<link rel="stylesheet" href="<c:url value="/resources/css/auction/side button.css"/>">
<link rel="stylesheet" href="<c:url value="/resources/css/auction/swiper.min.css"/>">
<link rel="stylesheet" href="<c:url value="/resources/css/auction/detail.css"/>">

<body>
	<c:import url="/WEB-INF/jsp/include/header.jsp" />
  <div id="wrapper">
    <div id="contents">
      <h2 id="auction-title">글 제목</h2>
      <div id="top">
        <div id="slide">
          <div class="swiper-container gallery-top">
            <div class="swiper-wrapper">
              <div class="swiper-slide" style="background-image:url(./images/nature-1.jpg)"></div>
              <div class="swiper-slide" style="background-image:url(./images/nature-2.jpg)"></div>
              <div class="swiper-slide" style="background-image:url(./images/nature-3.jpg)"></div>
              <div class="swiper-slide" style="background-image:url(./images/nature-4.jpg)"></div>
              <div class="swiper-slide" style="background-image:url(./images/nature-5.jpg)"></div>
              <div class="swiper-slide" style="background-image:url(./images/nature-6.jpg)"></div>
              <div class="swiper-slide" style="background-image:url(./images/nature-7.jpg)"></div>
              <div class="swiper-slide" style="background-image:url(./images/nature-8.jpg)"></div>
            </div>
            <div class="swiper-button-next swiper-button-white" style="position: absolute; color: black; right: -51px;">
            </div>
            <div class="swiper-button-prev swiper-button-white" style="position: absolute; color: black; left: -51px;">
            </div>
            <div class="swiper-container gallery-thumbs">
              <div class="swiper-wrapper">
                <div class="swiper-slide" style="background-image:url(./images/nature-1.jpg)"></div>
                <div class="swiper-slide" style="background-image:url(./images/nature-2.jpg)"></div>
                <div class="swiper-slide" style="background-image:url(./images/nature-3.jpg)"></div>
                <div class="swiper-slide" style="background-image:url(./images/nature-4.jpg)"></div>
                <div class="swiper-slide" style="background-image:url(./images/nature-5.jpg)"></div>
                <div class="swiper-slide" style="background-image:url(./images/nature-6.jpg)"></div>
                <div class="swiper-slide" style="background-image:url(./images/nature-7.jpg)"></div>
                <div class="swiper-slide" style="background-image:url(./images/nature-8.jpg)"></div>
                <div class="swiper-slide" style="background-image:url(./images/nature-9.jpg)"></div>
                <div class="swiper-slide" style="background-image:url(./images/nature-10.jpg)"></div>
              </div>
            </div>
          </div>
        </div>
        <div class="l-sub" id="l-sub">
          <div class="sidebar" id="sidebar">
            <div class="ProductInformation">
              <ul class="ProductInformation__items">
                <li class="ProductInformation__item">
                  <div class="Count">
                    <ul class="Count__counts">
                      <li class="Count__count">
                        <dl class="Count_top">
                          <dt class="Count__title">입찰인원</dt>
                          <dd class="Count__number"><span id="now_bid">1</span> 명입찰</dd>
                        </dl>
                      </li>
                      <li class="Count__count Count__count--sideLine">
                        <dl class="Count_top2">
                          <dt class="Count__title">남은시간</dt>
                          <dd class="Count__number">
                            <div class="wrapped">
                              <div class="middle">
                                <div class="inner">
                                  <div class="counter-class" data-date="2019-11-24 23:58:58">
                                    <div class="timer-font"><span class="counter-days"></span> 일</div>
                                    <div class="timer-font"><span class="counter-hours"></span> 시간</div>
                                    <div class="timer-font"><span class="counter-minutes"></span> 분</div>
                                    <div class="timer-font"><span class="counter-seconds"></span> 초</div>
                                  </div>
                                </div>
                              </div>
                            </div>
                            <span class="Count__unit"></span>
                          </dd>
                        </dl>
                      </li>
                    </ul>
                  </div>
                </li>

                <li class="ProductInformation__item js-stickyNavigation-start">



                  <div class="Price Price--current">
                    <div class="PriceUse is-hide">
                      <div class="CouponPh2 is-hide">
                      </div>
                    </div>
                    <dl class="Price__body">
                      <dt class="Price__title">현재 최고가
                      </dt>
                      <dd class="Price__value">
                        18,000원
                      </dd>
                    </dl>
                    <div class="Price__buttonArea">
                      <a href="#" class="Button Button--bid js-modal-show rapidnofollow" rel="nofollow"
                        data-modal-name="error" data-ylk="rsec:bds;pos:1" data-rapid_p="7">입 찰 하 기</a>
                    </div>
                  </div>
                  <div class="Price Price--buynow">
                    <div class="PriceUse is-hide">
                    </div>
                    <dl class="Price__body ">
                      <dt class="Price__title">즉시 구매가
                      </dt>
                      <dd class="Price__value">
                        50,000원
                      </dd>
                    </dl>
                    <dd class="Price__buttonArea">

                      <a href="#" class="Button Button--buynow js-modal-show rapidnofollow" rel="nofollow"
                        data-modal-name="error" data-ylk="rsec:byitnw;pos:1" data-rapid_p="9">즉시 구매하기</a>

                    </dd>
                    <div id="auc_detail_ymobile_pc"></div>
                  </div>
                </li>
                </ul>
            </div>
          </div>
        </div>
      </div>

      <div id="bottom">
        <ul class="nav nav-tabs nav-justified">
          <li class="nav-item"><a role="tab" data-toggle="tab" href="#tab-1" class="nav-link active">상품 정보</a></li>
          <li class="nav-item"><a role="tab" data-toggle="tab" href="#tab-2" class="nav-link">상품 문의</a></li>
          <li class="nav-item"><a role="tab" data-toggle="tab" href="#tab-3" class="nav-link">판매자 정보</a></li>
        </ul>
        <div class="tab-content">
          <div role="tabpanel" class="tab-pane active" id="tab-1">
            <div id="auction-board">글작성내용</div>
          </div>
          <div role="tabpanel" class="tab-pane" id="tab-2">
            <div id="inquiry_insert">
              <h2>상품 문의</h2>
              <ul>
                <li>해당 상품에 대한 문의</li>
                <li>문의 안내사항</li>
              </ul>
              <div id="inquiry_submit">
                <form id="productInquiry">
                  <textarea class="form-control" id="inquiry-contents"></textarea>
                  <button class="button">등록</button>
                </form>
              </div>
            </div>

            <div class="inquiry_container">
              <div class="card">
                <div class="card-body">
                  <div class="row">
                    <div class="col-xs-2">
                      <img src="https://image.ibb.co/jw55Ex/def_face.jpg" class="img img-rounded img-fluid" />
                      <p class="text-secondary text-center">15 Minutes Ago</p>
                    </div>
                    <div class="col-xs-9">
                      <p>
                        <a class="float-left"
                          href="https://maniruzzaman-akash.blogspot.com/p/contact.html"><strong>Maniruzzaman
                            Akash</strong></a>
                        <span class="float-right"></span>


                      </p>
                      <div class="clearfix"></div>
                      <p>Lorem Ipsum is simply dummy text of the pr make but also the leap into electronic typesetting,
                        remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset
                        sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like
                        Aldus PageMaker including versions of Lorem Ipsum.</p>
                      <p>
                        <a class="float-right btn btn-outline-primary ml-2 reply" id="btn1">답변</a>
                      </p>
                      <div class="insertbox" id="insertbox1"></div>
                    </div>
                  </div>
                  <div class="card card-inner">
                    <div class="card-body">
                      <div class="row">
                        <div class="col-xs-3">
                          <img src="https://image.ibb.co/jw55Ex/def_face.jpg" class="img img-rounded img-fluid" />
                          <p class="text-secondary text-center">15 Minutes Ago</p>
                        </div>
                        <div class="col-xs-8">
                          <p><a href="https://maniruzzaman-akash.blogspot.com/p/contact.html"><strong>Maniruzzaman
                                Akash</strong></a></p>
                          <p>Lorem Ipsum is simply dummy text of the pr make but also the leap into electronic
                            typesetting, remaining essentially unchanged. It was popularised in the 1960s with the
                            release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop
                            publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>
                          <p>
                            <a class="float-right btn btn-outline-primary ml-2 reply" id="btn1_1">답변</a>
                          </p>
                          <div class="insertbox" id="insertbox1_1"></div>
                        </div>
                      </div>
                    </div>
                  </div>
                  <div class="card card-inner">
                    <div class="card-body">
                      <div class="row">
                        <div class="col-xs-3">
                          <img src="https://image.ibb.co/jw55Ex/def_face.jpg" class="img img-rounded img-fluid" />
                          <p class="text-secondary text-center">15 Minutes Ago</p>
                        </div>
                        <div class="col-xs-8">
                          <p><a href="https://maniruzzaman-akash.blogspot.com/p/contact.html"><strong>Maniruzzaman
                                Akash</strong></a></p>
                          <p>Lorem Ipsum is simply dummy text of the pr make but also the leap into electronic
                            typesetting, remaining essentially unchanged. It was popularised in the 1960s with the
                            release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop
                            publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>
                          <p>
                            <a class="float-right btn btn-outline-primary ml-2 reply" id="btn1_2">답변</a>
                          </p>
                          <div class="insertbox" id="insertbox1_2"></div>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
                <div class="card-body">
                  <div class="row">
                    <div class="col-xs-2">
                      <img src="https://image.ibb.co/jw55Ex/def_face.jpg" class="img img-rounded img-fluid" />
                      <p class="text-secondary text-center">15 Minutes Ago</p>
                    </div>
                    <div class="col-xs-9">
                      <p>
                        <a class="float-left"
                          href="https://maniruzzaman-akash.blogspot.com/p/contact.html"><strong>Maniruzzaman
                            Akash</strong></a>
                        <span class="float-right"></span>
                      </p>
                      <div class="clearfix"></div>
                      <p>Lorem Ipsum is simply dummy text of the pr make but also the leap into electronic typesetting,
                        remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset
                        sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like
                        Aldus PageMaker including versions of Lorem Ipsum.</p>
                      <p>
                        <a class="float-right btn btn-outline-primary ml-2 reply" id="btn2">답변</a>
                      </p>
                      <div class="insertbox" id="insertbox2"></div>
                    </div>
                  </div>
                </div>
              </div>
            </div>

          </div>
          <div role="tabpanel" class="tab-pane" id="tab-3">
            <div class="table-responsive">
              <table id="seller_info" class="table">
                <tbody id="seller_detail">
                  <tr>
                    <td id="table_col">판매자 닉네임</td>
                    <td>SM</td>
                  </tr>
                  <tr>
                    <td>평점</td>
                    <td>
                      <span id="grade_point">4.4</span>
                      (<span id="grade_count">12</span>)
                    </td>
                  </tr>
                  <tr>
                    <td>판매 횟수</td>
                    <td><span id="sell_count">16</span> 회</td>
                  </tr>
                </tbody>
              </table>
            </div>
          </div>
        </div>
      </div>

    </div>
  </div>
  <div id="inquiry_box">
    <form id="replyForm">
      <textarea class="form-control inquiry-contents"></textarea>
      <button class="reply_button">등록</button>
    </form>
  </div>
  <c:import url="/WEB-INF/jsp/include/footer.jsp" />
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/sweetalert2@8"></script>
  <script src="<c:url value="/resources/js/auction/bootstrap.min.js" />"></script>
  <script src="<c:url value="/resources/js/auction/loopcounter.js" />"></script>
  <script src="<c:url value="/resources/js/auction/swiper.min.js" />"></script>
  <script src="<c:url value="/resources/js/auction/detail.js" />"></script>
  <script src="<c:url value="/resources/js/auction/sticky.js" />"></script>
  <script>
    $('#sidebar').stick_in_parent({ parent: '#contents' });
  </script>
</body>

</html>