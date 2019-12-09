<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/chatting/chatting.css" />">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<title>Insert title here</title>
</head>
<body>
	 <div class="wrapper" data-id="${email}" >
        <div class="main_container">
            <div class="left_container">
                <div class="left_top_field">
                    <input type="text" placeholder="Search" />
                    <a href="javascript:;" class="search"></a>
                </div>
                <div class="left_people_field">
                    <ul class="people">
                    	<c:forEach items="${chat}" var="chat" varStatus="loop">
                    		<c:choose>
	                    		<c:when test="${chat.userEmailSeller != email}">
			                        <li class="person" data-chat="person${chat.chatNo}">
			                        	<c:choose>
			                        		<c:when test="${chat.readsSeller == 0}">
				                        	    <img src="<c:url value="/resources/images/macbook.jpg"/>" >
			                        		</c:when>
			                        		<c:otherwise>
					                        	<span class="count" data-count="${chat.readsSeller}">
						                            <img src="<c:url value="/resources/images/macbook.jpg"/>" >
					                        	</span>
			                        		</c:otherwise>
			                        	</c:choose>
					                    <span class="name">${chat.buyerNickName}</span>
			                            <c:choose>
			                            	<c:when test="${chat.covstRegDate == null}">
					                            <span class="time">00:00</span>			                            				                            	
					                            <span class="preview">대화를 시작하세요!</span>
			                            	</c:when>
			                            	<c:otherwise>
					                            <span class="time">${chat.covstRegDate}</span>			                            	
					                            <span class="preview">${chat.covstContent}</span>
			                            	</c:otherwise>
			                            </c:choose>
	                       			 </li>                    		
	                    		</c:when>
	                    		<c:otherwise>
	                    			<li class="person" data-chat="person${chat.chatNo}">
			                        	<c:choose>
			                        		<c:when test="${chat.readsBuyer == 0}">
				                        	    <img src="<c:url value="/resources/images/macbook.jpg"/>" >
			                        		</c:when>
			                        		<c:otherwise>
					                        	<span class="count" data-count="${chat.readsBuyer}">
						                            <img src="<c:url value="/resources/images/macbook.jpg"/>" >
					                        	</span>
			                        		</c:otherwise>
			                        	</c:choose>
			                            <span class="name">${chat.buyerNickName}</span>
			                            <c:choose>
			                            	<c:when test="${chat.covstRegDate == null}">
					                            <span class="time">00:00</span>			                            				                            	
					                            <span class="preview">대화를 시작하세요</span>
			                            	</c:when>
			                            	<c:otherwise>
					                            <span class="time">${chat.covstRegDate}</span>			                            	
					                            <span class="preview">${chat.covstContent}</span>
			                            	</c:otherwise>
			                            </c:choose>
	                       			 </li>          
	                    		</c:otherwise>                    		
                    		</c:choose>
                    	</c:forEach>
                    	<c:if test="${empty chat}">
                    		<div>거래중인 경매가 존재하지 않습니다</div>
                    		<div>경매에 참여해보세요!</div>
                    	</c:if>
                    </ul>
                </div>
            </div>
            <div class="right_container">
                <div class="right_top_field" style="height:13px; line-height:13px"></div>
                <div class="right_message_field">
               	<c:forEach var="chat" items="${chat}">
                    <div class="chat" data-chat="person${chat.chatNo}" data-no="${chat.chatNo}">
                        <div class="conversation-start">
                            <span>Today, 6:48 AM</span>
                        </div>
                    </div>
               	</c:forEach>
                    <div class="write">
                        <input type="text" data-chatfield="chat"/>             
                        <a href="javascript:;" class="write-link send"></a>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <script src="<c:url value="/resources/js/chatting/chatting.js" />"></script>
</body>
</html>