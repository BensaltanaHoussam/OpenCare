// Java
package com.opencare.security;

import com.opencare.entities.RoleType;

import java.io.Serializable;
import java.util.UUID;

public class UserSession implements Serializable {
    private final UUID id;
    private final String username;
    private final String fullName;
    private final RoleType role;

    public UserSession(UUID id, String username, String fullName, RoleType role) {
        this.id = id;
        this.username = username;
        this.fullName = fullName;
        this.role = role;
    }
    public UUID getId() { return id; }
    public String getUsername() { return username; }
    public String getFullName() { return fullName; }
    public RoleType getRole() { return role; }
}
