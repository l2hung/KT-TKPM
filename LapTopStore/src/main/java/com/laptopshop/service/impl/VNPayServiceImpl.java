package com.laptopshop.service.impl;

import com.laptopshop.config.VNPayConfig;
import com.laptopshop.service.VNPayService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.crypto.Mac;
import javax.crypto.spec.SecretKeySpec;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;
import java.text.SimpleDateFormat;
import java.util.*;

@Service
public class VNPayServiceImpl implements VNPayService {

    private static final Logger logger = LoggerFactory.getLogger(VNPayServiceImpl.class);

    @Autowired
    private VNPayConfig vnpConfig;

    @Override
    public String createPaymentUrl(Long amount, String bankCode, String orderInfo, String ipAddress) {
        try {
            // Fallback IP for local testing
            if (ipAddress.equals("127.0.0.1") || ipAddress.equals("0:0:0:0:0:0:0:1")) {
                ipAddress = "113.161.77.1"; // Example public IP for testing
            }

            String vnp_TxnRef = String.valueOf(System.currentTimeMillis());
            String vnp_Amount = String.valueOf(amount * 100);
            String vnp_CreateDate = new SimpleDateFormat("yyyyMMddHHmmss").format(new Date());

            logger.info("Creating VNPAY payment URL with amount: {}, bankCode: {}, orderInfo: {}, ipAddress: {}",
                    amount, bankCode, orderInfo, ipAddress);

            Map<String, String> vnp_Params = new HashMap<>();
            vnp_Params.put("vnp_Version", "2.1.0");
            vnp_Params.put("vnp_Command", "pay");
            vnp_Params.put("vnp_TmnCode", vnpConfig.vnp_TmnCode);
            vnp_Params.put("vnp_Amount", vnp_Amount);
            vnp_Params.put("vnp_CurrCode", "VND");
            vnp_Params.put("vnp_TxnRef", vnp_TxnRef);
            vnp_Params.put("vnp_OrderInfo", orderInfo);
            vnp_Params.put("vnp_OrderType", "other");
            vnp_Params.put("vnp_Locale", "vn");
            vnp_Params.put("vnp_ReturnUrl", vnpConfig.vnp_ReturnUrl);
            vnp_Params.put("vnp_IpAddr", ipAddress);
            vnp_Params.put("vnp_CreateDate", vnp_CreateDate);
            if (bankCode != null && !bankCode.isEmpty()) {
                vnp_Params.put("vnp_BankCode", bankCode);
            }

            List<String> fieldNames = new ArrayList<>(vnp_Params.keySet());
            Collections.sort(fieldNames);
            StringBuilder hashData = new StringBuilder();
            StringBuilder query = new StringBuilder();
            for (String name : fieldNames) {
                String value = vnp_Params.get(name);
                hashData.append(name).append('=').append(URLEncoder.encode(value, StandardCharsets.US_ASCII.toString()));
                query.append(name).append('=').append(URLEncoder.encode(value, StandardCharsets.US_ASCII.toString()));
                if (!name.equals(fieldNames.get(fieldNames.size() - 1))) {
                    hashData.append('&');
                    query.append('&');
                }
            }

            String vnp_SecureHash = hmacSHA512(vnpConfig.vnp_HashSecret, hashData.toString());
            query.append("&vnp_SecureHash=").append(vnp_SecureHash);

            String paymentUrl = vnpConfig.vnp_PayUrl + "?" + query.toString();
            logger.info("Generated VNPAY payment URL: {}", paymentUrl);
            return paymentUrl;
        } catch (Exception e) {
            logger.error("Error creating VNPAY payment URL", e);
            throw new RuntimeException("Lỗi khi tạo URL thanh toán VNPAY", e);
        }
    }

    public static String hmacSHA512(String key, String data) throws Exception {
        Mac hmac = Mac.getInstance("HmacSHA512");
        SecretKeySpec secretKey = new SecretKeySpec(key.getBytes(StandardCharsets.UTF_8), "HmacSHA512");
        hmac.init(secretKey);
        byte[] bytes = hmac.doFinal(data.getBytes(StandardCharsets.UTF_8));
        StringBuilder hash = new StringBuilder();
        for (byte b : bytes) {
            hash.append(String.format("%02x", b));
        }
        return hash.toString();
    }
}