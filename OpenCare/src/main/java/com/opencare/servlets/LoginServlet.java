// Java
package com.opencare.servlets;

import com.opencare.repositories.UserRepository;
import com.opencare.security.Passwords;
import com.opencare.security.UserSession;
import com.opencare.security.SecurityUtils;
import com.opencare.entities.User;
import com.opencare.entities.RoleType;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.util.Optional;

public class LoginServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        HttpSession session = req.getSession(false);
        if (session != null && session.getAttribute("user") instanceof UserSession us) {
            // déjà connecté → rediriger vers la home du rôle
            SecurityUtils.redirectToRoleHome(us.getRole(), req, resp);
            return;
        }
        req.getRequestDispatcher("/views/login.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        String username = req.getParameter("username");
        String password = req.getParameter("password");

        Optional<User> userOpt = new UserRepository().findByUsername(username);
        if (userOpt.isPresent() && Passwords.verify(password, userOpt.get().getPasswordHash())) {
            User user = userOpt.get();
            RoleType role = user.getRole();

            HttpSession session = req.getSession(true);
            session.setAttribute("user", new UserSession(
                    user.getId(), user.getUsername(), user.getFullName(), role
            ));
            // important pour `RoleFilter`
            session.setAttribute("role", role.name());

            // rediriger vers la page d’accueil du rôle
            SecurityUtils.redirectToRoleHome(role, req, resp);
        } else {
            req.setAttribute("error", "Identifiants invalides.");
            req.getRequestDispatcher("/views/login.jsp").forward(req, resp);
        }
    }
}
