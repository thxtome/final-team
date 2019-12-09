<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>Document</title>
<link rel="stylesheet" href="<c:url value="/resources/css/common/normalize.css"/>">
<link rel="stylesheet" href="<c:url value="/resources/css/liveauction/main.css"/>">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
</head>
<body>
    <div class="content">
        <div class="video"></div>
        <div class="innerLive">
            <div class="auctionInfo">
                <div class="limitTime">
                    <span>경매 시간 - </span>
                    <span>49시간</span>
                    <span>40분</span>
                    <span>40초</span>
                </div>
                <div class=maxBid>
                    <div>
                        <span>최고입찰가</span>
                        <span>1000원</span>
                    </div>
                    <button id="openModalBtn">입찰하기</button>
                </div>
                <div class=nowBid>
                    <div>
                        <span>즉시구매가</span>
                        <span>10000원</span>
                    </div>
                    <button>구매하기</button>
                </div>
            </div>
            <div class="chatSpace">
            </div>
            <div class="chatInput">
                    <textarea name="" id="" cols="30" rows="10"></textarea>
                    <button id="sendBtn">채팅</button>
            </div>
        </div>
        <div class="bidSpace">
            <div class="bid"><span>c@c님이 12000원 입찰!</span></div>
            <div class="bid"><span>c@c님이 12000원 입찰!</span></div>
            <div class="bid"><span>c@c님이 12000원 입찰!</span></div>
        </div>
    </div>
    <div class="realTModal">
        <div class="realTModalBack">
            <div>
                <div class="mTitle">
                    <span>경매 입찰하기</span>
                </div>
                <hr>
                <div class="mContent">
                    <div class="mMaxBid">
                        <span>최고 입찰가</span>
                        <span>10000원</span>
                    </div>
                    <div class="mSuggestBid">
                        <span>희망 입찰가</span>
                        <span><input type="text"></span><p class="won">원</p>
                    </div>
                </div>
                <hr>
                <div class="mBtns">
                    <button class="closeModalBtn">취소</button>
                    <button>입찰</button>
                </div>
            </div>
        </div>
    </div>
    <script src="<c:url value="/resources/js/liveauction/main.js"/>"></script>
    <script>
        $("#openModalBtn").click(()=>{
            $(".realTModal").show();
        })

        $(".closeModalBtn").click(()=>{
            $(".realTModal").hide();
        })
    </script>
</body>
</html>