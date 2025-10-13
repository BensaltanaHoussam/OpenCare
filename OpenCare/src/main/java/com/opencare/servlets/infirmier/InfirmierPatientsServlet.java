// java
package com.opencare.servlets.infirmier;

import com.opencare.entities.FileAttente;
import com.opencare.repositories.FileAttenteRepository;
import com.opencare.utils.JPAUtil;
import jakarta.persistence.EntityManager;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;
import java.time.*;
import java.util.Comparator;
import java.util.List;

@WebServlet(urlPatterns = "/infirmier/patients")
public class InfirmierPatientsServlet extends HttpServlet {

    private final FileAttenteRepository queueRepo = new FileAttenteRepository();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String dateStr = req.getParameter("date");
        LocalDate target = (dateStr == null || dateStr.isBlank()) ? LocalDate.now() : LocalDate.parse(dateStr);

        try (EntityManager em = JPAUtil.getEntityManager()) {
            List<FileAttente> raw = queueRepo.findTodayWithPatient(em); // charge le jour courant
            ZoneId zone = ZoneId.systemDefault();
            List<FileAttente> list = raw.stream()
                    .filter(fa -> fa.getArriveAt() != null &&
                            fa.getArriveAt().atZone(zone).toLocalDate().isEqual(target))
                    .sorted(Comparator.comparing(FileAttente::getArriveAt))
                    .toList();

            req.setAttribute("fileAttente", list);
            req.setAttribute("date", target.toString());
        }
        req.getRequestDispatcher("/views/infirmier/patients.jsp").forward(req, resp);
    }
}
