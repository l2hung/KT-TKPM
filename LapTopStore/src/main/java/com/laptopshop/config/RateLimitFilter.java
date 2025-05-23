package com.laptopshop.config;

import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Component;
import org.springframework.web.filter.OncePerRequestFilter;

import java.io.IOException;
import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.atomic.AtomicInteger;

@Component
public class RateLimitFilter extends OncePerRequestFilter {

    private static final ConcurrentHashMap<String, RequestInfo> requestCounts = new ConcurrentHashMap<>();
    private static final int MAX_REQUESTS = 5;
    private static final long TIME_WINDOW = 60_000;

    private static class RequestInfo {
        AtomicInteger count = new AtomicInteger(0);
        long windowStart = System.currentTimeMillis();
    }

    @Override
    protected void doFilterInternal(HttpServletRequest request, HttpServletResponse response, FilterChain filterChain)
            throws ServletException, IOException {

        String clientIp = request.getRemoteAddr();
        String uri = request.getRequestURI();

        // ✅ Log để xác minh filter chạy
        System.out.println("📥 Filter triggered - URI: " + uri + ", IP: " + clientIp);

        if ((uri.equals("/laptopshop/api/san-pham/all") || uri.equals("/laptopshop/api/don-hang/all"))
                && request.getMethod().equalsIgnoreCase("GET")) {

            requestCounts.putIfAbsent(clientIp, new RequestInfo());
            RequestInfo info = requestCounts.get(clientIp);

            synchronized (info) {
                long now = System.currentTimeMillis();
                if (now - info.windowStart > TIME_WINDOW) {
                    info.count.set(0);
                    info.windowStart = now;
                }

                int current = info.count.incrementAndGet();
                System.out.println("➡ Count for " + clientIp + ": " + current);

                if (current > MAX_REQUESTS) {
                    System.out.println("🚫 Rate limit exceeded for " + clientIp);
                    response.setStatus(429);
                    response.getWriter().write("Rate limit exceeded. Try again later.");
                    return;
                }
            }
        }

        filterChain.doFilter(request, response);
    }
}
