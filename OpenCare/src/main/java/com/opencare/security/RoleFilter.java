package com.opencare.security;

import com.opencare.entities.RoleType;
import jakarta.servlet.*;
import jakarta.servlet.annotation.WebFilter;
import jakarta.servlet.http.*;

import java.io.IOException;
import java.net.URLEncoder;
import java.util.Map;

@WebFilter(urlPatterns = {"/admin/*", "/infirmier/*", "/generaliste/*", "/specialiste/*"})
public class RoleFilter implements Filter {

    private static final Map<String, RoleType> REQUIRED = Map.of(
            "/admin/", RoleType.ADMIN,
            "/infirmier/", RoleType.INFIRMIER,
            "/generaliste/", RoleType.GENERALISTE,
            "/specialiste/", RoleType.SPECIALISTE
    );

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
            throws IOException, ServletException {

        HttpServletRequest req = (HttpServletRequest) request;
        HttpServletResponse resp = (HttpServletResponse) response;

        String uri = req.getRequestURI().substring(req.getContextPath().length());
        RoleType required = REQUIRED.entrySet().stream()
                .filter(e -> uri.startsWith(e.getKey()))
                .map(Map.Entry::getValue)
                .findFirst()
                .orElse(null);

        if (required == null) {
            chain.doFilter(request, response);
            return;
        }

        HttpSession session = req.getSession(false);
        if (session == null || session.getAttribute("role") == null) {
            String next = req.getRequestURI() + (req.getQueryString() != null ? "?" + req.getQueryString() : "");
            resp.sendRedirect(req.getContextPath() + "/login?next=" + URLEncoder.encode(next, java.nio.charset.StandardCharsets.UTF_8));
            return;
        }

        String roleStr = session.getAttribute("role").toString();
        RoleType userRole = RoleType.valueOf(roleStr);
        if (userRole != required) {
            resp.sendError(HttpServletResponse.SC_FORBIDDEN);
            return;
        }

        chain.doFilter(request, response);
    }
}
