package com.opencare.servlets;

import com.opencare.repositories.UserRepository;
import com.opencare.security.UserSession;
import com.opencare.services.AuthService;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.*;

import java.io.IOException;
import java.util.Optional;

public class LoginServlet extends HttpServlet {
    private AuthService auth;

    @Override
    public void init() {
        this.auth = new AuthService(new UserRepository());
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("/WEB-INF/views/login.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException {
        String username = req.getParameter("username");
        String password = req.getParameter("password");

        Optional<UserSession> us = auth.authenticate(username, password);
        if (us.isPresent()) {
            HttpSession session = req.getSession(true);
            session.setMaxInactiveInterval(30 * 60);
            session.setAttribute("user", us.get());
            resp.sendRedirect(req.getContextPath() + "/");
            return;
        }
        req.setAttribute("error", "Identifiants invalides.");
        req.getRequestDispatcher("/WEB-INF/views/login.jsp").forward(req, resp);
    }
}
