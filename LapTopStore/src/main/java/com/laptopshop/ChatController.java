package com.laptopshop.controller;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.client.RestTemplate;

@RestController
@RequestMapping("/api/chat")
public class ChatController {

    @Value("${gemini.api.key}")
    private String apiKey;

    @PostMapping
    public String chat(@RequestBody String messageJson) {
        RestTemplate restTemplate = new RestTemplate();
        String url = "https://generativelanguage.googleapis.com/v1beta/models/gemini-1.5-flash:generateContent?key=" + apiKey;
        HttpHeaders headers = new HttpHeaders();
        headers.setContentType(org.springframework.http.MediaType.APPLICATION_JSON);
        String requestBody = "{\"contents\":[{\"parts\":[{\"text\":\"" + messageJson.replace("\"message\":\"", "").replace("\"}", "") + "\"}]}]}";
        HttpEntity<String> entity = new HttpEntity<>(requestBody, headers);

        try {
            ResponseEntity<String> response = restTemplate.exchange(url, HttpMethod.POST, entity, String.class);
            return response.getBody();
        } catch (Exception e) {
            return "{\"error\":\"Sorry, something went wrong. Please try again.\"}";
        }
    }
}
