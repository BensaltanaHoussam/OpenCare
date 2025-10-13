// java
package com.opencare.servlets.infirmier;

import com.opencare.entities.Patient;
import com.opencare.entities.SignesVitaux;
import com.opencare.repositories.FileAttenteRepository;
import com.opencare.repositories.PatientRepository;
import com.opencare.utils.JPAUtil;
import jakarta.persistence.EntityManager;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;
import java.math.BigDecimal;
import java.time.LocalDate;

@WebServlet(urlPatterns = "/infirmier/accueil")
public class InfirmierAcceuilServlet extends HttpServlet {

    private final PatientRepository patientRepo = new PatientRepository();
    private final FileAttenteRepository queueRepo = new FileAttenteRepository();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try (var em = JPAUtil.getEntityManager()) {
            var list = new com.opencare.repositories.FileAttenteRepository().findTodayWaitingWithPatient(em);
            req.setAttribute("fileAttente", list);
        }
        req.getRequestDispatcher("/views/infirmier/accueil.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String nss = trim(req.getParameter("nss"));
        String nom = trim(req.getParameter("nom"));
        String prenom = trim(req.getParameter("prenom"));
        String dateNaissanceStr = trim(req.getParameter("dateNaissance"));
        String telephone = trim(req.getParameter("telephone"));
        String adresse = trim(req.getParameter("adresse"));

        // Signes vitaux
        Integer taSys = parseInt(req.getParameter("taSys"));
        Integer taDia = parseInt(req.getParameter("taDia"));
        Integer fc = parseInt(req.getParameter("fc"));
        BigDecimal temp = parseDecimal(req.getParameter("temp"));
        Integer spo2 = parseInt(req.getParameter("spo2"));
        BigDecimal poids = parseDecimal(req.getParameter("poids"));
        Integer taille = parseInt(req.getParameter("taille"));

        boolean hasNss = nss != null && !nss.isBlank();
        boolean hasIdentity = nom != null && !nom.isBlank()
                && prenom != null && !prenom.isBlank()
                && dateNaissanceStr != null && !dateNaissanceStr.isBlank();

        if (!hasNss && !hasIdentity) {
            req.setAttribute("error", "Renseigner NSS ou bien Nom + Prénom + Date de naissance.");
            req.getRequestDispatcher("/views/infirmier/accueil.jsp").forward(req, resp);
            return;
        }

        LocalDate dob = null;
        try {
            if (hasIdentity) dob = LocalDate.parse(dateNaissanceStr);
        } catch (Exception ex) {
            req.setAttribute("error", "Date de naissance invalide (format yyyy-MM-dd).");
            req.getRequestDispatcher("/views/infirmier/accueil.jsp").forward(req, resp);
            return;
        }

        EntityManager em = JPAUtil.getEntityManager();
        try {
            em.getTransaction().begin();

            Patient patient = null;
            if (hasNss) patient = patientRepo.findByNss(em, nss);
            if (patient == null && hasIdentity) patient = patientRepo.findByIdentite(em, nom, prenom, dob);

            if (patient == null) {
                if (!hasNss) {
                    req.setAttribute("error", "Le NSS est obligatoire pour créer un nouveau patient.");
                    req.getRequestDispatcher("/views/infirmier/accueil.jsp").forward(req, resp);
                    em.getTransaction().rollback();
                    return;
                }
                patient = patientRepo.create(em, nss, nom, prenom, dob, telephone, adresse);
            } else {
                boolean updated = false;
                if (telephone != null && !telephone.isBlank()) { patient.setTelephone(telephone); updated = true; }
                if (adresse != null && !adresse.isBlank()) { patient.setAdresse(adresse); updated = true; }
                if (updated) em.merge(patient);
            }

            // Construire les signes vitaux
            SignesVitaux sv = new SignesVitaux();
            sv.setTaSys(taSys);
            sv.setTaDia(taDia);
            sv.setFrequenceCardiaque(fc);
            sv.setTemperatureC(temp);
            sv.setSpo2(spo2);
            sv.setPoidsKg(poids);
            sv.setTailleCm(taille);
            if (poids != null && taille != null && taille > 0) {
                BigDecimal m = BigDecimal.valueOf(taille).divide(BigDecimal.valueOf(100.0));
                if (m.doubleValue() > 0) {
                    BigDecimal imc = poids.divide(m.multiply(m), java.math.RoundingMode.HALF_UP);
                    sv.setImc(imc);
                }
            }

            if (!queueRepo.existsWaitingToday(em, patient.getId())) {
                queueRepo.enqueue(em, patient, sv);
            }

            em.getTransaction().commit();
            resp.sendRedirect(req.getContextPath() + "/infirmier/patients?added=1");
        } catch (Exception e) {
            if (em.getTransaction().isActive()) em.getTransaction().rollback();
            req.setAttribute("error", "Erreur serveur: " + e.getMessage());
            req.getRequestDispatcher("/views/infirmier/accueil.jsp").forward(req, resp);
        } finally {
            em.close();
        }
    }

    private static String trim(String s) { return s == null ? null : s.trim(); }
    private static Integer parseInt(String s) {
        try { return (s == null || s.isBlank()) ? null : Integer.valueOf(s.trim()); }
        catch (Exception e) { return null; }
    }
    private static java.math.BigDecimal parseDecimal(String s) {
        try { return (s == null || s.isBlank()) ? null : new java.math.BigDecimal(s.trim()); }
        catch (Exception e) { return null; }
    }
}
