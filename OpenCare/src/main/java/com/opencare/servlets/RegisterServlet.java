// Java
package com.opencare.servlets;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;

public class RegisterServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        req.getRequestDispatcher("/views/register.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        // Traitement à implémenter plus tard. On ré-affiche le formulaire.
        req.setAttribute("success", "Compte créé (simulation).");
        req.getRequestDispatcher("/views/register.jsp").forward(req, resp);
    }
}
