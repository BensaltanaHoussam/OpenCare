// Java
package com.opencare.utils;

import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityManagerFactory;
import jakarta.persistence.Persistence;

public final class JPAUtil {
    private static final EntityManagerFactory EMF = Persistence.createEntityManagerFactory("opencarePU");
    private JPAUtil() {}
    public static EntityManager getEntityManager() { return EMF.createEntityManager(); }
    public static void close() { EMF.close(); }
}
