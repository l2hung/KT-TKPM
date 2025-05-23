package com.laptopshop.controller;

import com.laptopshop.service.VNPayService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.Arrays;
import java.util.HashMap;
import java.util.Map;

@Controller
@RequestMapping("/laptopshop")
public class VNPayController {

    private static final Logger logger = LoggerFactory.getLogger(VNPayController.class);

    @Autowired
    private VNPayService vnPayService;

    @PostMapping("/submitOrder")
    public String submitOrder(@RequestParam("amount") Long amount,
                              @RequestParam(value = "bankCode", required = false) String bankCode,
                              @RequestParam("hoTenNguoiNhan") String hoTenNguoiNhan,
                              @RequestParam("sdtNhanHang") String sdtNhanHang,
                              @RequestParam("diaChiNhan") String diaChiNhan,
                              HttpServletRequest request,
                              HttpSession session) {
        logger.info("Received submitOrder request with amount: {}, bankCode: {}", amount, bankCode);

        Map<String, String> orderInfoMap = new HashMap<>();
        orderInfoMap.put("hoTenNguoiNhan", hoTenNguoiNhan);
        orderInfoMap.put("sdtNhanHang", sdtNhanHang);
        orderInfoMap.put("diaChiNhan", diaChiNhan);
        session.setAttribute("orderInfo", orderInfoMap);

        String ipAddress = request.getRemoteAddr();
        String orderInfo = "Thanh toán đơn hàng LaptopShop";

        if (bankCode == null || bankCode.trim().isEmpty()) {
            bankCode = "NCB";
        }

        String paymentUrl = vnPayService.createPaymentUrl(amount, bankCode, orderInfo, ipAddress);
        logger.info("Redirecting to VNPAY URL: {}", paymentUrl);
        return "redirect:" + paymentUrl;
    }

    @GetMapping("/vnpay_return")
    public String vnpayReturn(HttpServletRequest request, Model model, HttpSession session) {
        logger.info("Received vnpay_return request with URI: {}", request.getRequestURI());
        Map<String, String[]> paramMap = request.getParameterMap();
        for (Map.Entry<String, String[]> entry : paramMap.entrySet()) {
            logger.info("VNPAY response param - {}: {}", entry.getKey(), Arrays.toString(entry.getValue()));
        }

        String responseCode = request.getParameter("vnp_ResponseCode");
        logger.info("vnp_ResponseCode: {}", responseCode);

        if ("00".equals(responseCode)) {
            logger.info("Payment successful, preparing data for thankyou page");

            Map<String, String> orderInfo = (Map<String, String>) session.getAttribute("orderInfo");
            if (orderInfo == null) {
                logger.error("Order info not found in session");
                return "redirect:/laptopshop/checkout?error=session_expired";
            }

            Map<String, Object> donhang = new HashMap<>();
            donhang.put("id", System.currentTimeMillis());
            donhang.put("hoTenNguoiNhan", orderInfo.get("hoTenNguoiNhan"));
            donhang.put("sdtNhanHang", orderInfo.get("sdtNhanHang"));
            donhang.put("diaChiNhan", orderInfo.get("diaChiNhan"));
            donhang.put("ghiChu", "Thanh toán qua VNPAY");
            donhang.put("ngayDatHang", new java.util.Date().toString());

            @SuppressWarnings("unchecked")
            Map<Long, Object> cart = (Map<Long, Object>) session.getAttribute("cart");
            @SuppressWarnings("unchecked")
            Map<Long, Integer> quanity = (Map<Long, Integer>) session.getAttribute("quanity");

            model.addAttribute("donhang", donhang);
            model.addAttribute("cart", cart != null ? cart.values() : new HashMap<>());
            model.addAttribute("quanity", quanity != null ? quanity : new HashMap<>());

            session.removeAttribute("orderInfo");
            logger.info("Redirecting to thankyou.jsp");
            return "thankyou";
        } else {
            logger.warn("Payment failed with response code: {}", responseCode);
            return "redirect:/laptopshop/checkout?error=payment_failed&code=" + responseCode;
        }
    }

    @GetMapping("/test")
    public String testEndpoint() {
        logger.info("Test endpoint accessed");
        return "redirect:/laptopshop/checkout";
    }
}