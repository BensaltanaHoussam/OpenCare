package com.opencare.servlets;

import com.opencare.repositories.UserRepository;
import com.opencare.security.Passwords;
import com.opencare.security.UserSession;
import com.opencare.entities.User;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.util.Optional;

public class LoginServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
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
            HttpSession session = req.getSession(true);
            session.setAttribute("user", new UserSession(
                    user.getId(), user.getUsername(), user.getFullName(), user.getRole()
            ));
            resp.sendRedirect(req.getContextPath() + "/");
        } else {
            req.setAttribute("error", "Identifiants invalides.");
            req.getRequestDispatcher("/views/login.jsp").forward(req, resp);
        }
    }
}
