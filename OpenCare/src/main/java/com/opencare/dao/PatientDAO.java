package com.opencare.dao;

import com.opencare.entities.Patient;
import com.opencare.utils.JPAUtil;
import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityTransaction;

public class PatientDAO {

    public void save(Patient patient) {
        EntityManager em = null;
        EntityTransaction tx = null;
        try {
            em = JPAUtil.getEntityManager();
            tx = em.getTransaction();
            tx.begin();
            em.persist(patient);
            tx.commit();
        } catch (Exception ex) {
            if (tx != null && tx.isActive()) tx.rollback();
            throw ex;
        } finally {
            if (em != null) em.close();
        }
    }
}
