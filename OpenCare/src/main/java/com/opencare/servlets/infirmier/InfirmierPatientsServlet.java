package com.opencare.servlets.infirmier;

import com.opencare.entities.FileAttente;
import com.opencare.repositories.FileAttenteRepository;
import com.opencare.utils.JPAUtil;
import jakarta.persistence.EntityManager;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;
import java.util.List;

@WebServlet(urlPatterns = "/infirmier/patients")
public class InfirmierPatientsServlet extends HttpServlet {

    private final FileAttenteRepository queueRepo = new FileAttenteRepository();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        EntityManager em = JPAUtil.getEntityManager();
        try {
            List<FileAttente> list = queueRepo.findTodayWaitingWithPatient(em);
            req.setAttribute("fileAttente", list);
        } finally {
            em.close();
        }
        req.getRequestDispatcher("/views/infirmier/patients.jsp").forward(req, resp);
    }
}
