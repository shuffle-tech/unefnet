package com.unef.model.entity;

import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.EmbeddedId;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;
import javax.persistence.UniqueConstraint;

@Entity
@Table(name = "usuario_curso", schema = "public", uniqueConstraints = { @UniqueConstraint(columnNames = { "id_usuario_curso" }) })
public class UserCourse {

    /*************************************************************************/

    @EmbeddedId
    private UserCoursePK userCourse = new UserCoursePK();

    @Column(name = "ds_expiracao")
    private String descriptionExpiration;

    @Column(name = "ds_periodo")
    private String descriptionPeriod;

    @Column(name = "in_ativo")
    private String active;

    @OneToOne(cascade = CascadeType.ALL, targetEntity = PaymentType.class)
    @JoinColumn(name = "id_tipo_pagamento")
    private PaymentType paymentType;

    @OneToOne(cascade = CascadeType.ALL, targetEntity = DepartureLandingPoint.class)
    @JoinColumn(name = "id_embarque_associado")
    private DepartureLandingPoint departurePoint;

    @OneToOne(cascade = CascadeType.ALL, targetEntity = DepartureLandingPoint.class)
    @JoinColumn(name = "id_desembarque_associado")
    private DepartureLandingPoint landingPoint;

    @OneToMany(mappedBy = "userCourse", cascade = CascadeType.ALL, fetch = FetchType.LAZY, targetEntity = Billet.class)
    private Set<Billet> billets;

    /*
     * id_rota
     */

    /*************************************************************************/

    public UserCoursePK getUserCourse() {
        return userCourse;
    }

    public void setUserCourse(UserCoursePK userCourse) {
        this.userCourse = userCourse;
    }

    public String getDescriptionExpiration() {
        return descriptionExpiration;
    }

    public void setDescriptionExpiration(String descriptionExpiration) {
        this.descriptionExpiration = descriptionExpiration;
    }

    public String getDescriptionPeriod() {
        return descriptionPeriod;
    }

    public void setDescriptionPeriod(String descriptionPeriod) {
        this.descriptionPeriod = descriptionPeriod;
    }

    public String getActive() {
        return active;
    }

    public void setActive(String active) {
        this.active = active;
    }

    public PaymentType getPaymentType() {
        return paymentType;
    }

    public void setPaymentType(PaymentType paymentType) {
        this.paymentType = paymentType;
    }

    public DepartureLandingPoint getDeparturePoint() {
        return departurePoint;
    }

    public void setDeparturePoint(DepartureLandingPoint departurePoint) {
        this.departurePoint = departurePoint;
    }

    public DepartureLandingPoint getLandingPoint() {
        return landingPoint;
    }

    public void setLandingPoint(DepartureLandingPoint landingPoint) {
        this.landingPoint = landingPoint;
    }

    public Set<Billet> getBillets() {
        return billets;
    }

    public void setBillets(Set<Billet> billets) {
        this.billets = billets;
    }

}
