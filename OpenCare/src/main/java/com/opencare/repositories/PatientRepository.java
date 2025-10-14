package com.opencare.repositories;

import com.opencare.entities.Patient;
import jakarta.persistence.EntityManager;
import jakarta.persistence.NoResultException;

import java.time.LocalDate;

public class PatientRepository {

    public Patient findByNss(EntityManager em, String nss) {
        if (nss == null || nss.isBlank()) return null;
        try {
            return em.createQuery("select p from Patient p where p.numeroSecuriteSociale = :nss", Patient.class)
                    .setParameter("nss", nss.trim())
                    .getSingleResult();
        } catch (NoResultException ex) {
            return null;
        }
    }

    public Patient findByIdentite(EntityManager em, String nom, String prenom, LocalDate dateNaissance) {
        if (nom == null || prenom == null || dateNaissance == null) return null;
        try {
            return em.createQuery(
                            "select p from Patient p " +
                                    "where p.nom = :nom and p.prenom = :prenom and p.dateNaissance = :dob",
                            Patient.class)
                    .setParameter("nom", nom.trim())
                    .setParameter("prenom", prenom.trim())
                    .setParameter("dob", dateNaissance)
                    .getSingleResult();
        } catch (NoResultException ex) {
            return null;
        }
    }

    public Patient create(EntityManager em, String nss, String nom, String prenom, LocalDate dateNaissance,
                          String telephone, String adresse) {
        Patient p = new Patient();
        p.setNumeroSecuriteSociale(nss != null && !nss.isBlank() ? nss.trim() : null);
        p.setNom(nom != null ? nom.trim() : null);
        p.setPrenom(prenom != null ? prenom.trim() : null);
        p.setDateNaissance(dateNaissance);
        p.setTelephone(telephone != null ? telephone.trim() : null);
        p.setAdresse(adresse != null ? adresse.trim() : null);
        em.persist(p);
        return p;
    }
}
