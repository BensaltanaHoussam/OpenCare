// Java
package com.opencare.security;

import com.opencare.entities.RoleType;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

public final class SecurityUtils {
    private SecurityUtils() {}

    public static String getRoleHomePath(RoleType role) {
        if (role == null) return "/login";
        return switch (role) {
            case INFIRMIER -> "/infirmier/accueil";
            case GENERALISTE -> "/generaliste/accueil";
            case SPECIALISTE -> "/specialiste/accueil";
            case ADMIN -> "/admin/dashboard";
        };
    }

    public static void redirectToRoleHome(RoleType role, HttpServletRequest req, HttpServletResponse resp) throws IOException {
        resp.sendRedirect(req.getContextPath() + getRoleHomePath(role));
    }
}
