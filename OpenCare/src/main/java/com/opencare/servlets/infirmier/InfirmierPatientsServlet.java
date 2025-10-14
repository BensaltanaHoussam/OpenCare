package com.opencare.servlets.infirmier;

import com.opencare.entities.FileAttente;
import com.opencare.repositories.FileAttenteRepository;
import com.opencare.utils.JPAUtil;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.time.LocalDate;
import java.util.List;

@WebServlet("/infirmier/patients")
public class InfirmierPatientsServlet extends HttpServlet {

    private FileAttenteRepository repository;

    @Override
    public void init() {
        this.repository = new FileAttenteRepository();
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String dateParam = req.getParameter("date");
        String nom = req.getParameter("nom");

        LocalDate date;
        try {
            date = (dateParam == null || dateParam.isBlank()) ? LocalDate.now() : LocalDate.parse(dateParam);
        } catch (Exception ex) {
            date = LocalDate.now();
        }

        var em = JPAUtil.getEntityManager();
        try {
            List<FileAttente> fileAttente = repository.searchByDateAndNom(em, date, nom);

            req.setAttribute("fileAttente", fileAttente);
            req.setAttribute("date", date.toString());
            req.setAttribute("nom", nom == null ? "" : nom);

            req.getRequestDispatcher("/views/infirmier/patients.jsp").forward(req, resp);
        } finally {
            em.close();
        }
    }
}
