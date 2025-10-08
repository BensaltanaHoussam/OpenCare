package com.opencare.servlets;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import com.opencare.utils.DBUtil;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import java.io.IOException;

public class PatientServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String nom = request.getParameter("nom");
        String prenom = request.getParameter("prenom");
        String dateNaissance = request.getParameter("date_naissance");
        String nss = request.getParameter("numero_securite_sociale");
        String telephone = request.getParameter("telephone");
        String adresse = request.getParameter("adresse");
        String mutuelle = request.getParameter("mutuelle");
        String antecedents = request.getParameter("antecedents");
        String allergies = request.getParameter("allergies");
        String traitements = request.getParameter("traitements_en_cours");
        response.setContentType("text/html;charset=UTF-8");

        try (Connection conn = DBUtil.getConnection()) {
            String sql = "INSERT INTO patients(nom, prenom, date_naissance, numero_securite_sociale, telephone, adresse, mutuelle, antecedents, allergies, traitements_en_cours) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setString(1, nom);
            stmt.setString(2, prenom);
            stmt.setString(3, dateNaissance);
            stmt.setString(4, nss);
            stmt.setString(5, telephone);
            stmt.setString(6, adresse);
            stmt.setString(7, mutuelle);
            stmt.setString(8, antecedents);
            stmt.setString(9, allergies);
            stmt.setString(10, traitements);

            int rowsInserted = stmt.executeUpdate();

            if (rowsInserted > 0) {
                response.getWriter().println("<h2>Patient enregistré avec succès !</h2>");
            } else {
                response.getWriter().println("<h2>Échec de l'enregistrement du patient.</h2>");
            }
        }catch (SQLException e) {
            e.printStackTrace();
            response.getWriter().println("<h2>Erreur lors de l'enregistrement du patient.</h2>");
        }

    }
}
