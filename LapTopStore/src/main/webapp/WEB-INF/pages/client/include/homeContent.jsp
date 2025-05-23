<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script src="<c:url value='/js/client/homeAjax.js'/>" ></script>
<script src="<c:url value='/resources/js/chat.js'/>" ></script>
<style>
	/* Chat window styling */
	.chat-container {
		position: fixed;
		top: 20px;
		right: 20px;
		width: 350px;
		height: 450px;
		background: linear-gradient(145deg, #ffffff, #f0f4f8);
		border: none;
		border-radius: 15px;
		box-shadow: 0 10px 30px rgba(0, 0, 0, 0.15);
		display: none;
		flex-direction: column;
		z-index: 1000;
		font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
	}
	.chat-header {
		background: linear-gradient(to right, #4a90e2, #50b5e9);
		color: white;
		padding: 15px;
		border-radius: 15px 15px 0 0;
		text-align: center;
		font-weight: 600;
		font-size: 18px;
		box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
	}
	.chat-body {
		flex: 1;
		padding: 15px;
		overflow-y: auto;
		background: #fafafa;
		border-bottom: 1px solid #e0e0e0;
	}
	.chat-message {
		margin: 8px 0;
		padding: 10px 15px;
		border-radius: 15px;
		line-height: 1.4;
		max-width: 80%;
		word-wrap: break-word;
		font-size: 14px;
	}
	.chat-message.user {
		background: #4a90e2;
		color: white;
		margin-left: 20%;
		text-align: right;
		border-bottom-right-radius: 5px;
	}
	.chat-message.ai {
		background: #e8ecef;
		color: #333;
		margin-right: 20%;
		text-align: left;
		border-bottom-left-radius: 5px;
	}
	.chat-footer {
		padding: 10px 15px;
		background: #ffffff;
		border-radius: 0 0 15px 15px;
		display: flex;
		align-items: center;
		box-shadow: 0 -2px 10px rgba(0, 0, 0, 0.05);
	}
	.chat-footer input {
		width: calc(100% - 70px);
		padding: 10px 15px;
		border: 1px solid #d0d0d0;
		border-radius: 20px;
		outline: none;
		font-size: 14px;
		transition: border-color 0.3s ease;
	}
	.chat-footer input:focus {
		border-color: #4a90e2;
	}
	.chat-footer button {
		padding: 10px 15px;
		background: #4a90e2;
		color: white;
		border: none;
		border-radius: 20px;
		margin-left: 10px;
		cursor: pointer;
		font-size: 14px;
		font-weight: 500;
		transition: background 0.3s ease;
	}
	.chat-footer button:hover {
		background: #3b7cd1;
	}
	.chat-button {
		position: fixed;
		bottom: 20px;
		right: 20px;
		background: #4a90e2;
		color: white;
		border: none;
		border-radius: 50%;
		width: 60px;
		height: 60px;
		font-size: 28px;
		cursor: pointer;
		box-shadow: 0 5px 15px rgba(0, 0, 0, 0.2);
		z-index: 1000;
		display: flex;
		align-items: center;
		justify-content: center;
		transition: transform 0.2s ease;
	}
	.chat-button:hover {
		transform: scale(1.1);
		background: #3b7cd1;
	}
</style>
<!--start-image-slider-->
<div class="wrap">
	<div class="image-slider">
		<!-- Slideshow 1 -->
		<ul class="rslides" id="slider1">
			<li><img src="Frontend/img/logo1.jpg" alt=""></li>
			<li><img src="Frontend/img/logo2.jpg" alt=""></li>
			<li><img src="Frontend/img/logo3.jpg" alt=""></li>
		</ul>
		<!-- Slideshow 2 -->
	</div>
	<!--End-image-slider-->
</div>
<div class="clear"> </div>
<div class="wrap">
	<div class="content">
		<div class="top-3-grids">
			<div class="section group">
				<div class="grid_1_of_3 images_1_of_3">
					<a href="single.html"><img src="Frontend/img/acer.jpg"></a>
					<h3>Thương hiệu nổi bật </h3>
				</div>
				<div class="grid_1_of_3 images_1_of_3 ">
					<a href="single.html"><img src="Frontend/img/lenovo2.png" style="background-color: white"></a>
					<h3 >Thương hiệu nổi bật</h3>
				</div>
				<div class="grid_1_of_3 images_1_of_3 ">
					<a href="single.html"><img src="Frontend/img/dell.png" style="background-color: white"></a>
					<h3>Thương hiệu nổi bật</h3>
				</div>
			</div>
		</div>
		<div class="content-grids">
			<h4>DANH SÁCH LAPTOP BÁN CHẠY</h4>
			<!-- Phần danh sách laptop bán chạy sẽ được tải động qua homeAjax.js -->
			<div id="bestSellingLaptops">
				<!-- Nội dung sẽ được tải bởi homeAjax.js -->
			</div>
		</div>
	</div>
</div>
<!-- Chat Button and Container -->
<button class="chat-button" onclick="toggleChat()">💬</button>
<div class="chat-container" id="chatContainer">
	<div class="chat-header">AI Chat Assistant</div>
	<div class="chat-body" id="chatBody"></div>
	<div class="chat-footer">
		<input type="text" id="chatInput" placeholder="Nhập tin nhắn của bạn...">
		<button onclick="sendMessage()">Gửi</button>
	</div>
</div>
<div class="clear"> </div>
