package com.opencare.servlets;

import com.opencare.entities.RoleType;
import com.opencare.entities.User;
import com.opencare.repositories.UserRepository;
import com.opencare.security.Passwords;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.*;
import java.io.IOException;

public class RegisterServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        long userCount = new UserRepository().countAll();
        req.setAttribute("noUserYet", userCount == 0);
        req.getRequestDispatcher("/views/register.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        String username = req.getParameter("username");
        String fullName = req.getParameter("fullName");
        String email = req.getParameter("email");
        String password = req.getParameter("password");
        String roleStr = req.getParameter("role");

        if (username == null || password == null || roleStr == null) {
            req.setAttribute("error", "Champs obligatoires manquants.");
            doGet(req, resp);
            return;
        }

        User user = new User();
        user.setUsername(username);
        user.setFullName(fullName);
        user.setEmail(email);
        user.setPasswordHash(Passwords.hash(password));
        user.setRole(RoleType.valueOf(roleStr));
        user.setActif(true);

        try {
            new UserRepository().save(user);
            req.setAttribute("success", "Compte créé avec succès.");
        } catch (Exception e) {
            req.setAttribute("error", "Erreur lors de la création du compte : " + e.getMessage());
        }
        doGet(req, resp);
    }
}
