// Java
package com.opencare.servlets;

import com.opencare.entities.RoleType;
import com.opencare.repositories.UserRepository;
import com.opencare.security.UserSession;
import com.opencare.services.AuthService;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.*;

import java.io.IOException;

public class RegisterServlet extends HttpServlet {
    private AuthService auth;
    private UserRepository users;

    @Override
    public void init() {
        this.users = new UserRepository();
        this.auth = new AuthService(users);
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setAttribute("noUserYet", users.countAll() == 0);
        req.getRequestDispatcher("/WEB-INF/views/register.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException {
        boolean firstUser = users.countAll() == 0;

        String username = req.getParameter("username");
        String fullName = req.getParameter("fullName");
        String email = req.getParameter("email");
        String password = req.getParameter("password");
        String roleStr = req.getParameter("role");

        RoleType role = RoleType.ADMIN;
        if (!firstUser) {
            HttpSession session = req.getSession(false);
            UserSession us = (session != null) ? (UserSession) session.getAttribute("user") : null;
            if (us == null || us.getRole() != RoleType.ADMIN) {
                resp.sendError(HttpServletResponse.SC_FORBIDDEN, "Accès réservé à l'ADMIN.");
                return;
            }
            try { role = RoleType.valueOf(roleStr); } catch (Exception e) {
                req.setAttribute("error", "Rôle invalide.");
                req.getRequestDispatcher("/WEB-INF/views/register.jsp").forward(req, resp);
                return;
            }
        }

        try {
            auth.register(username, fullName, email, password, role);
        } catch (Exception e) {
            req.setAttribute("error", "Nom d'utilisateur déjà utilisé.");
            req.getRequestDispatcher("/WEB-INF/views/register.jsp").forward(req, resp);
            return;
        }

        if (firstUser) {
            resp.sendRedirect(req.getContextPath() + "/login");
        } else {
            req.setAttribute("success", "Utilisateur créé.");
            req.getRequestDispatcher("/WEB-INF/views/register.jsp").forward(req, resp);
        }
    }
}
