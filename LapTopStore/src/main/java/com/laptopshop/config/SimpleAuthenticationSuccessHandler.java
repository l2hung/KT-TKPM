package com.laptopshop.config;

import java.io.IOException;
import java.util.Collection;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.web.DefaultRedirectStrategy;
import org.springframework.security.web.RedirectStrategy;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;
import org.springframework.stereotype.Component;

@Component
public class SimpleAuthenticationSuccessHandler implements AuthenticationSuccessHandler {

    private RedirectStrategy redirectStrategy = new DefaultRedirectStrategy();

    @Override
    public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response,
            Authentication authentication) throws IOException, ServletException {

        // Lấy danh sách vai trò của người dùng
        Collection<? extends GrantedAuthority> authorities = authentication.getAuthorities();

        // Duyệt qua các vai trò và chuyển hướng ngay khi tìm thấy vai trò phù hợp
        for (GrantedAuthority authority : authorities) {
            String role = authority.getAuthority();
            if (role.equals("ROLE_ADMIN")) {
                redirectStrategy.sendRedirect(request, response, "/admin");
                return; // Thoát ngay sau khi chuyển hướng
            } else if (role.equals("ROLE_SHIPPER")) {
                redirectStrategy.sendRedirect(request, response, "/shipper");
                return; // Thoát ngay sau khi chuyển hướng
            } else if (role.equals("ROLE_MEMBER")) {
                redirectStrategy.sendRedirect(request, response, "/");
                return; // Thoát ngay sau khi chuyển hướng
            }
        }

        // Nếu không có vai trò nào khớp, ném ngoại lệ
        throw new IllegalStateException("Không tìm thấy vai trò phù hợp để chuyển hướng");
    }
}