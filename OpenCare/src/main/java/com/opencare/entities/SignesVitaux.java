// java
package com.opencare.entities;

import jakarta.persistence.*;
import java.math.BigDecimal;

@Embeddable
public class SignesVitaux {
    @Column(name = "ta_sys")
    private Integer taSys;

    @Column(name = "ta_dia")
    private Integer taDia;

    @Column(name = "fc")
    private Integer frequenceCardiaque;

    @Column(name = "temperature_c", precision = 4, scale = 1)
    private BigDecimal temperatureC;

    @Column(name = "spo2")
    private Integer spo2;

    @Column(name = "poids_kg", precision = 5, scale = 2)
    private BigDecimal poidsKg;

    @Column(name = "taille_cm")
    private Integer tailleCm;

    @Column(name = "imc", precision = 5, scale = 2)
    private BigDecimal imc;

    public Integer getTaSys() { return taSys; }
    public void setTaSys(Integer taSys) { this.taSys = taSys; }
    public Integer getTaDia() { return taDia; }
    public void setTaDia(Integer taDia) { this.taDia = taDia; }
    public Integer getFrequenceCardiaque() { return frequenceCardiaque; }
    public void setFrequenceCardiaque(Integer frequenceCardiaque) { this.frequenceCardiaque = frequenceCardiaque; }
    public BigDecimal getTemperatureC() { return temperatureC; }
    public void setTemperatureC(BigDecimal temperatureC) { this.temperatureC = temperatureC; }
    public Integer getSpo2() { return spo2; }
    public void setSpo2(Integer spo2) { this.spo2 = spo2; }
    public BigDecimal getPoidsKg() { return poidsKg; }
    public void setPoidsKg(BigDecimal poidsKg) { this.poidsKg = poidsKg; }
    public Integer getTailleCm() { return tailleCm; }
    public void setTailleCm(Integer tailleCm) { this.tailleCm = tailleCm; }
    public BigDecimal getImc() { return imc; }
    public void setImc(BigDecimal imc) { this.imc = imc; }
}
