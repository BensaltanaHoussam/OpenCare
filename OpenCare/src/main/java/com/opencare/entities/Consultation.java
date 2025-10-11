// Java
package com.opencare.entities;

import jakarta.persistence.*;
import java.time.Instant;
import java.util.UUID;
import java.math.BigDecimal;

@Entity
@Table(name = "consultations")
public class Consultation {

    @Id
    @GeneratedValue(strategy = GenerationType.UUID)
    @Column(name = "id", nullable = false, updatable = false)
    private UUID id;

    @ManyToOne(fetch = FetchType.LAZY, optional = false)
    @JoinColumn(name = "patient_id")
    private Patient patient;

    @ManyToOne(fetch = FetchType.LAZY, optional = false)
    @JoinColumn(name = "created_by_user_id")
    private User creePar;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "specialite_id")
    private Specialite specialite;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "specialiste_id")
    private Specialiste specialiste;

    @Enumerated(EnumType.STRING)
    @Column(name = "statut", length = 40)
    private Statut statut = Statut.OUVERTE;

    @Enumerated(EnumType.STRING)
    @Column(name = "priorite", length = 20)
    private Priorite priorite = Priorite.NORMALE;

    @Column(name = "motif", length = 255)
    private String motif;

    @Column(name = "observations", columnDefinition = "TEXT")
    private String observations;

    @Column(name = "cout_consultation", precision = 10, scale = 2)
    private BigDecimal coutConsultation = BigDecimal.valueOf(150.00);

    @Column(name = "cout_expertise", precision = 10, scale = 2)
    private BigDecimal coutExpertise = BigDecimal.ZERO;

    @Column(name = "total_cost", precision = 12, scale = 2)
    private BigDecimal totalCost = BigDecimal.ZERO;

    @Column(name = "created_at", insertable = false, updatable = false)
    private Instant createdAt;

    public enum Statut { OUVERTE, EN_ATTENTE_AVIS_SPECIALISTE, ASSIGNEE, TERMINEE, ANNULEE }
    public enum Priorite { NON_URGENT, NORMALE, URGENTE }

    public UUID getId() { return id; }
    public Patient getPatient() { return patient; }
    public void setPatient(Patient patient) { this.patient = patient; }
    public User getCreePar() { return creePar; }
    public void setCreePar(User creePar) { this.creePar = creePar; }
    public Specialite getSpecialite() { return specialite; }
    public void setSpecialite(Specialite specialite) { this.specialite = specialite; }
    public Specialiste getSpecialiste() { return specialiste; }
    public void setSpecialiste(Specialiste specialiste) { this.specialiste = specialiste; }
    public Statut getStatut() { return statut; }
    public void setStatut(Statut statut) { this.statut = statut; }
    public Priorite getPriorite() { return priorite; }
    public void setPriorite(Priorite priorite) { this.priorite = priorite; }
    public String getMotif() { return motif; }
    public void setMotif(String motif) { this.motif = motif; }
    public String getObservations() { return observations; }
    public void setObservations(String observations) { this.observations = observations; }
    public BigDecimal getCoutConsultation() { return coutConsultation; }
    public void setCoutConsultation(BigDecimal coutConsultation) { this.coutConsultation = coutConsultation; }
    public BigDecimal getCoutExpertise() { return coutExpertise; }
    public void setCoutExpertise(BigDecimal coutExpertise) { this.coutExpertise = coutExpertise; }
    public BigDecimal getTotalCost() { return totalCost; }
    public void setTotalCost(BigDecimal totalCost) { this.totalCost = totalCost; }
    public Instant getCreatedAt() { return createdAt; }
}
