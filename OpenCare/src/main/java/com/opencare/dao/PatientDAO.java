package com.opencare.dao;
import com.opencare.entities.Patient;
import com.opencare.utils.DBUtil;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class PatientDAO {
    public void save(Patient patient)throws SQLException{
        Connection conn = DBUtil.getConnection();
        String sql = "INSERT INTO patients (nom, prenom, date_naissance, numero_securite_sociale, telephone, adresse, mutuelle, antecedents, allergies, traitements_en_cours) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
        PreparedStatement stmt = conn.prepareStatement(sql);

        stmt.setString(1, patient.getNom());
        stmt.setString(2, patient.getPrenom());
        stmt.setDate(3, java.sql.Date.valueOf(patient.getDateNaissance()));
        stmt.setString(4, patient.getNumeroSecuriteSociale());
        stmt.setString(5, patient.getTelephone());
        stmt.setString(6, patient.getAdresse());
        stmt.setString(7, patient.getMutuelle());
        stmt.setString(8, patient.getAntecedents());
        stmt.setString(9, patient.getAllergies());
        stmt.setString(10, patient.getTraitementsEnCours());
        stmt.executeUpdate();
        conn.close();

    }
}
