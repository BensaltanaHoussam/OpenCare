package com.opencare.servlets.infirmier;

import com.opencare.entities.RoleType;
import com.opencare.security.UserSession;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;

@WebServlet(urlPatterns = "/infirmier/acceuil")
public class InfirmierAcceuilServlet {


    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        if (!hasInfirmierRole(req)) {
            resp.sendError(HttpServletResponse.SC_FORBIDDEN);
            return;
        }
        req.getRequestDispatcher("/views/infirmier/accueil.jsp").forward(req, resp);
    }

    private boolean hasInfirmierRole(HttpServletRequest req) {
        HttpSession session = req.getSession(false);
        if (session == null) return false;

        Object user = session.getAttribute("user");
        if (user instanceof UserSession us) {
            return us.getRole() == RoleType.INFIRMIER;
        }
        Object role = session.getAttribute("role");
        return role != null && "INFIRMIER".equals(role.toString());
    }

}
