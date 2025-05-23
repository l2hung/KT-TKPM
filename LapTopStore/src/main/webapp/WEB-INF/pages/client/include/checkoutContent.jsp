<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
	<title>Thanh toán</title>
</head>
<body>

<div class="container">

	<!-- FORM GỬI ĐƠN HÀNG COD -->
	<form method="POST" action="${pageContext.request.contextPath}/thankyou">
		<div class="row">
			<!-- Thông tin khách hàng -->
			<c:if test="${pageContext.request.userPrincipal.name != null}">
				<div class="col-md-3">
					<p class="border-p"><b>Thông tin khách hàng</b></p>
					<input size="27" value="${user.hoTen}" disabled>
					<input size="27" value="${user.email}" disabled>
					<input size="27" value="${user.soDienThoai}" disabled>
					<textarea rows="5" cols="29" disabled>${user.diaChi}</textarea>
				</div>
			</c:if>

			<!-- Thông tin nhận hàng -->
			<div class="col-md-3">
				<p class="border-p"><b>Thông tin nhận hàng</b></p>
				<input size="27" name="hoTenNguoiNhan" id="hoTenNguoiNhan" required>
				<input size="27" name="sdtNhanHang" id="sdtNhanHang" required>
				<textarea rows="5" cols="29" name="diaChiNhan" id="diaChiNhan" required></textarea>
				<input type="hidden" id="tongGiaTri" name="tongGiaTri">
			</div>

			<!-- Giỏ hàng -->
			<div class="col-md-6">
				<p class="border-p"><b>Giỏ hàng</b></p>
				<table class="table-cart-checkout mytable">
					<tr>
						<th>Ảnh</th><th>Tên sản phẩm</th><th>Đơn giá</th><th>Tổng</th>
					</tr>
					<c:forEach items="${cart}" var="sanpham">
						<tr style="text-align: center;">
							<td><img src="/laptopshop/img/${sanpham.id}.png" class="fix-size-img"></td>
							<td style="color:green">${sanpham.tenSanPham}</td>
							<td class="donGia">
								<div class="check" style="display:inline-block;">${sanpham.donGia}</div>
								<div style="display:inline-block;"> x ${quanity[sanpham.id]}</div>
							</td>
							<td><div class="total">${sanpham.donGia * quanity[sanpham.id]}</div></td>
						</tr>
					</c:forEach>
				</table>

				<p>Tổng giá trị đơn hàng: <b id="ordertotal"></b></p>
				<a href="${pageContext.request.contextPath}/cart" class="btn btn-primary">Quay lại giỏ hàng</a>
				<button class="btn btn-danger" type="submit" id="submit">Gửi đơn hàng (COD)</button>
			</div>
		</div>
	</form>

	<!-- FORM RIÊNG CHO THANH TOÁN VNPAY -->
	<form id="vnpayForm" method="POST" action="${pageContext.request.contextPath}/laptopshop/submitOrder">
		<input type="hidden" name="amount" id="vnp_amount" />
		<input type="hidden" name="hoTenNguoiNhan" id="vnp_hoTenNguoiNhan" />
		<input type="hidden" name="sdtNhanHang" id="vnp_sdtNhanHang" />
		<textarea name="diaChiNhan" id="vnp_diaChiNhan" style="display:none;"></textarea>
		<select name="bankCode">
			<option value="NCB">Ngân hàng NCB</option>
			<option value="TECHCOMBANK">Ngân hàng Techcombank</option>
			<option value="VNPAYQR">VNPAY QR</option>
		</select>
		<button type="submit" class="btn btn-success" id="vnpay">Thanh toán bằng VNPAY</button>
	</form>

</div>

<!-- SCRIPT -->
<script src="/resources/js/accounting.min.js"></script>
<script>
	function calculateOrder() {
		var element = document.getElementsByClassName("total");
		var res = 0;
		for (let i = 0; i < element.length; i++) {
			res += parseInt(element[i].textContent);
		}
		console.log("Calculated total amount: ", res);
		document.getElementById("ordertotal").innerHTML = accounting.formatMoney(res) + " VND";

		// Gán giá trị cho input ẩn
		document.getElementById("tongGiaTri").value = res;
		document.getElementById("vnp_amount").value = res;

		// Gán giá trị thông tin nhận hàng cho form VNPAY
		document.getElementById("vnp_hoTenNguoiNhan").value = document.getElementById("hoTenNguoiNhan").value;
		document.getElementById("vnp_sdtNhanHang").value = document.getElementById("sdtNhanHang").value;
		document.getElementById("vnp_diaChiNhan").value = document.getElementById("diaChiNhan").value;

		// Disable nếu giỏ hàng trống
		if (res === 0) {
			document.getElementById("submit").disabled = true;
			document.getElementById("vnpay").disabled = true;
		}
	}
	window.onload = calculateOrder;

	// Cập nhật thông tin nhận hàng khi người dùng thay đổi
	document.getElementById("hoTenNguoiNhan").addEventListener("input", function() {
		document.getElementById("vnp_hoTenNguoiNhan").value = this.value;
	});
	document.getElementById("sdtNhanHang").addEventListener("input", function() {
		document.getElementById("vnp_sdtNhanHang").value = this.value;
	});
	document.getElementById("diaChiNhan").addEventListener("input", function() {
		document.getElementById("vnp_diaChiNhan").value = this.value;
	});
</script>

</body>
</html>
