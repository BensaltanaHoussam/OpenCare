package com.opencare.repositories;

import com.opencare.entities.FileAttente;
import com.opencare.entities.Patient;
import com.opencare.entities.SignesVitaux;
import jakarta.persistence.EntityManager;

import java.time.Instant;
import java.time.LocalDate;
import java.time.ZoneId;
import java.util.List;
import java.util.UUID;

public class FileAttenteRepository {

    public boolean existsWaitingToday(EntityManager em, UUID patientId) {
        Instant start = LocalDate.now().atStartOfDay(ZoneId.systemDefault()).toInstant();
        Instant end = LocalDate.now().plusDays(1).atStartOfDay(ZoneId.systemDefault()).toInstant();

        Long count = em.createQuery(
                        "select count(fa) from FileAttente fa " +
                                "where fa.patient.id = :pid and fa.statut = :statut " +
                                "and fa.arriveAt >= :start and fa.arriveAt < :end", Long.class)
                .setParameter("pid", patientId)
                .setParameter("statut", FileAttente.Statut.EN_ATTENTE)
                .setParameter("start", start)
                .setParameter("end", end)
                .getSingleResult();

        return count != null && count > 0;
    }

    public void enqueue(EntityManager em, Patient patient, SignesVitaux signes) {
        FileAttente fa = new FileAttente();
        fa.setPatient(patient);
        fa.setStatut(FileAttente.Statut.EN_ATTENTE);
        fa.setSignesVitaux(signes);
        em.persist(fa);
    }

    public List<FileAttente> findTodayWaitingWithPatient(EntityManager em) {
        Instant start = LocalDate.now().atStartOfDay(ZoneId.systemDefault()).toInstant();
        Instant end = LocalDate.now().plusDays(1).atStartOfDay(ZoneId.systemDefault()).toInstant();

        return em.createQuery(
                        "select fa from FileAttente fa " +
                                "join fetch fa.patient p " +
                                "where fa.statut = :statut and fa.arriveAt >= :start and fa.arriveAt < :end " +
                                "order by fa.arriveAt asc",
                        FileAttente.class)
                .setParameter("statut", FileAttente.Statut.EN_ATTENTE)
                .setParameter("start", start)
                .setParameter("end", end)
                .getResultList();
    }

    public List<FileAttente> searchByDateAndNom(EntityManager em, LocalDate date, String nom) {
        LocalDate effectiveDate = (date == null) ? LocalDate.now() : date;
        Instant start = effectiveDate.atStartOfDay(ZoneId.systemDefault()).toInstant();
        Instant end = effectiveDate.plusDays(1).atStartOfDay(ZoneId.systemDefault()).toInstant();

        StringBuilder jpql = new StringBuilder(
                "select fa from FileAttente fa " +
                        "join fetch fa.patient p " +
                        "left join fetch fa.signesVitaux sv " +
                        "where fa.arriveAt >= :start and fa.arriveAt < :end"
        );

        boolean hasNom = nom != null && !nom.isBlank();
        if (hasNom) {
            jpql.append(" and lower(p.nom) like :nom");
        }
        jpql.append(" order by fa.arriveAt asc");

        var q = em.createQuery(jpql.toString(), FileAttente.class)
                .setParameter("start", start)
                .setParameter("end", end);

        if (hasNom) {
            q.setParameter("nom", "%" + nom.toLowerCase().trim() + "%");
        }
        return q.getResultList();
    }
}
