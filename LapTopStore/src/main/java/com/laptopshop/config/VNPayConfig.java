package com.laptopshop.config;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;

@Component
public class VNPayConfig {
    @Value("${vnpay.tmnCode}")
    public String vnp_TmnCode;

    @Value("${vnpay.hashSecret}")
    public String vnp_HashSecret;

    @Value("${vnpay.payUrl}")
    public String vnp_PayUrl;

    @Value("${vnpay.returnUrl}")
    public String vnp_ReturnUrl;
}