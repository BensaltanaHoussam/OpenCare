// Java
package com.opencare.utils;

import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityManagerFactory;
import jakarta.persistence.Persistence;

import java.util.logging.Level;
import java.util.logging.Logger;

public class JPAUtil {
    private static final Logger LOG = Logger.getLogger(JPAUtil.class.getName());
    private static volatile EntityManagerFactory emf;

    private static EntityManagerFactory buildEMF() {
        try {
            return Persistence.createEntityManagerFactory("opencarePU");
        } catch (Exception e) {
            LOG.log(Level.SEVERE, "Échec de l'initialisation JPA (persistence-unit 'opencarePU')", e);
            throw new ExceptionInInitializerError(e);
        }
    }

    public static EntityManager getEntityManager() {
        if (emf == null) {
            synchronized (JPAUtil.class) {
                if (emf == null) {
                    emf = buildEMF();
                }
            }
        }
        return emf.createEntityManager();
    }

    public static void close() {
        if (emf != null && emf.isOpen()) {
            emf.close();
        }
    }
}
