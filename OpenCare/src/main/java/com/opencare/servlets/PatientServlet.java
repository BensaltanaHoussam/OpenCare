package com.opencare.servlets;

import com.opencare.dao.PatientDAO;
import com.opencare.entities.Patient;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.time.LocalDate;

public class PatientServlet extends HttpServlet {

    private final PatientDAO patientDAO = new PatientDAO();

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");

        try {
            Patient patient = new Patient();
            patient.setNom(request.getParameter("nom"));
            patient.setPrenom(request.getParameter("prenom"));
            patient.setDateNaissance(LocalDate.parse(request.getParameter("date_naissance")));
            patient.setNumeroSecuriteSociale(request.getParameter("numero_securite_sociale"));
            patient.setTelephone(request.getParameter("telephone"));
            patient.setAdresse(request.getParameter("adresse"));
            patient.setMutuelle(request.getParameter("mutuelle"));
            patient.setAntecedents(request.getParameter("antecedents"));
            patient.setAllergies(request.getParameter("allergies"));
            patient.setTraitementsEnCours(request.getParameter("traitements_en_cours"));

            patientDAO.save(patient);
            response.getWriter().println("<h2>Patient enregistré avec succès !</h2>");
        } catch (Exception e) {
            response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
            response.getWriter().println("<h2>Erreur lors de l'enregistrement du patient.</h2>");
        }
    }
}
