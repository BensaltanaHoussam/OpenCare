package com.opencare.entities;

import jakarta.persistence.*;
import java.time.Instant;
import java.util.UUID;

@Entity
@Table(name = "file_attente")
public class FileAttente {

    @Id
    @GeneratedValue(strategy = GenerationType.UUID)
    @Column(name = "id", nullable = false, updatable = false)
    private UUID id;

    @ManyToOne(fetch = FetchType.LAZY, optional = false)
    @JoinColumn(name = "patient_id")
    private Patient patient;

    @Column(name = "arrive_at", insertable = false, updatable = false)
    private Instant arriveAt;

    @Column(name = "position")
    private Integer position;

    @Enumerated(EnumType.STRING)
    @Column(name = "statut", length = 20)
    private Statut statut = Statut.EN_ATTENTE;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "assigned_doctor_user_id")
    private User assignedDoctor;

    @Column(name = "notes", columnDefinition = "TEXT")
    private String notes;

    public enum Statut { EN_ATTENTE, APPELE, EN_CONSULTATION, PARTI }

    public UUID getId() { return id; }
    public Patient getPatient() { return patient; }
    public void setPatient(Patient patient) { this.patient = patient; }
    public Instant getArriveAt() { return arriveAt; }
    public Integer getPosition() { return position; }
    public void setPosition(Integer position) { this.position = position; }
    public Statut getStatut() { return statut; }
    public void setStatut(Statut statut) { this.statut = statut; }
    public User getAssignedDoctor() { return assignedDoctor; }
    public void setAssignedDoctor(User assignedDoctor) { this.assignedDoctor = assignedDoctor; }
    public String getNotes() { return notes; }
    public void setNotes(String notes) { this.notes = notes; }
}
