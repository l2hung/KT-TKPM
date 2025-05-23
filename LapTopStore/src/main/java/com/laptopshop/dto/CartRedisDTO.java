package com.laptopshop.dto;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

public class CartRedisDTO implements Serializable {
    private Long userId;
    private List<CartItemRedisDTO> items = new ArrayList<>();
    private long totalPrice;

    public CartRedisDTO() {
    }

    public CartRedisDTO(Long userId) {
        this.userId = userId;
    }

    public Long getUserId() {
        return userId;
    }

    public void setUserId(Long userId) {
        this.userId = userId;
    }

    public List<CartItemRedisDTO> getItems() {
        return items;
    }

    public void setItems(List<CartItemRedisDTO> items) {
        this.items = items;
    }

    public long getTotalPrice() {
        return totalPrice;
    }

    public void setTotalPrice(long totalPrice) {
        this.totalPrice = totalPrice;
    }
}