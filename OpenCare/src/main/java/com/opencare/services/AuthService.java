// Java
package com.opencare.services;

import com.opencare.entities.RoleType;
import com.opencare.entities.User;
import com.opencare.repositories.UserRepository;
import com.opencare.security.Passwords;
import com.opencare.security.UserSession;

import java.util.Optional;

public class AuthService {
    private final UserRepository users;

    public AuthService(UserRepository users) {
        this.users = users;
    }

    public Optional<UserSession> authenticate(String username, String rawPassword) {
        return users.findByUsername(username)
                .filter(u -> Passwords.verify(rawPassword, u.getPasswordHash()))
                .map(u -> new UserSession(u.getId(), u.getUsername(), u.getFullName(), u.getRole()));
    }

    public void register(String username, String fullName, String email, String rawPassword, RoleType role) {
        User u = new User();
        u.setUsername(username.trim());
        u.setFullName(fullName);
        u.setEmail(email);
        u.setPasswordHash(Passwords.hash(rawPassword));
        u.setRole(role);
        u.setActif(true);
        users.save(u);
    }
}
