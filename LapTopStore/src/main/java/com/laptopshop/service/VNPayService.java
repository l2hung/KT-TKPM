package com.laptopshop.service;

public interface VNPayService {
    String createPaymentUrl(Long amount, String bankCode, String orderInfo, String ipAddress);
}