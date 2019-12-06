<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/chatting/chatting.css" />">
<title>Insert title here</title>
</head>
<body>
	 <div class="wrapper">
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
			                        <li class="person" data-chat="person${loop.count}">
			                        	<c:choose>
			                        		<c:when test="${chat.readsSeller == 0}">
				                        	    <img src="https://s3-us-west-2.amazonaws.com/s.cdpn.io/382994/thomas.jpg" alt="" />
			                        		</c:when>
			                        		<c:otherwise>
					                        	<span class="count" data-count="${chat.readsSeller}">
						                            <img src="https://s3-us-west-2.amazonaws.com/s.cdpn.io/382994/thomas.jpg" alt="" />
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
	                    			<li class="person" data-chat="person${loop.count}">
			                        	<c:choose>
			                        		<c:when test="${chat.readsBuyer == 0}">
				                        	    <img src="https://s3-us-west-2.amazonaws.com/s.cdpn.io/382994/thomas.jpg" alt="" />
			                        		</c:when>
			                        		<c:otherwise>
					                        	<span class="count" data-count="${chat.readsBuyer}">
						                            <img src="https://s3-us-west-2.amazonaws.com/s.cdpn.io/382994/thomas.jpg" alt="" />
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
                    </ul>
                </div>
            </div>
            <div class="right_container">
                <div class="right_top_field"><span>To: <span class="name">Dog Woofson</span></span></div>
                <div class="right_message_field">
                    <div class="chat" data-chat="person1">
                        <div class="conversation-start">
                            <span>Today, 6:48 AM</span>
                        </div>
                        <div class="bubble you">
                            Hello,
                        </div>
                        <div class="bubble you">
                            it's me.
                        </div>
                        <div class="bubble you">
                            I was wondering...
                        </div>
                    </div>
                    <div class="chat" data-chat="person2">
                        <div class="conversation-start">
                            <span>Today, 5:38 PM</span>
                        </div>
                        <div class="bubble you">
                            Hello, can you hear me?
                        </div>
                        <div class="bubble you">
                            I'm in California dreaming
                        </div>
                        <div class="bubble me">
                            ... about who we used to be.
                        </div>
                        <div class="bubble me">
                            Are you serious?
                        </div>
                        <div class="bubble you">
                            When we were younger and free...
                        </div>
                        <div class="bubble you">
                            I've forgotten how it felt before
                        </div>
                    </div>
                    <div class="chat" data-chat="person3">
                        <div class="conversation-start">
                            <span>Today, 3:38 AM</span>
                        </div>
                        <div class="bubble you">
                            Hey human!
                        </div>
                        <div class="bubble you">
                            Umm... Someone took a shit in the hallway.
                        </div>
                        <div class="bubble me">
                            ... what.
                        </div>
                        <div class="bubble me">
                            Are you serious?
                        </div>
                        <div class="bubble you">
                            I mean...
                        </div>
                        <div class="bubble you">
                            It’s not that bad...
                        </div>
                        <div class="bubble you">
                            But we’re probably gonna need a new carpet.
                        </div>
                    </div>
                    <div class="chat" data-chat="person4">
                        <div class="conversation-start">
                            <span>Yesterday, 4:20 PM</span>
                        </div>
                        <div class="bubble me">
                            Hey human!
                        </div>
                        <div class="bubble me">
                            Umm... Someone took a shit in the hallway.
                        </div>
                        <div class="bubble you">
                            ... what.
                        </div>
                        <div class="bubble you">
                            Are you serious?
                        </div>
                        <div class="bubble me">
                            I mean...
                        </div>
                        <div class="bubble me">
                            It’s not that bad...
                        </div>
                    </div>
                    <div class="chat" data-chat="person5">
                        <div class="conversation-start">
                            <span>Today, 6:28 AM</span>
                        </div>
                        <div class="bubble you">
                            Wasup
                        </div>
                        <div class="bubble you">
                            Wasup
                        </div>
                        <div class="bubble you">
                            Wasup for the third time like is <br />you blind bitch
                        </div>
        
                    </div>
                    <div class="chat" data-chat="person6">
                        <div class="conversation-start">
                            <span>Monday, 1:27 PM</span>
                        </div>
                        <div class="bubble you">
                            So, how's your new phone?
                        </div>
                        <div class="bubble you">
                            You finally have a smartphone :D
                        </div>
                        <div class="bubble me">
                            Drake?
                        </div>
                        <div class="bubble me">
                            Why aren't you answering?
                        </div>
                        <div class="bubble you">
                            howdoyoudoaspace
                        </div>
                    </div>
                    <div class="write">
                        <input type="text" />             
                        <a href="javascript:;" class="write-link send"></a>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <script src="<c:url value="/resources/js/chatting/chatting.js" />"></script>
</body>
</html>