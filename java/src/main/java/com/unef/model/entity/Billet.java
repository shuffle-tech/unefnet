package com.unef.model.entity;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinColumns;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.UniqueConstraint;

import com.unef.model.entity.generic.GenericDTOBase;

@Entity
@Table(name = "boleto", schema = "public", uniqueConstraints = { @UniqueConstraint(columnNames = { "id_boleto" }) })
public class Billet extends GenericDTOBase {

    /**
     * Serialization
     */
    private static final long serialVersionUID = 5758480821631159532L;

    /*************************************************************************/

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "id_boleto")
    private Long ID;

    @Column(name = "nr_boleto")
    private String number;

    @Column(name = "vl_boleto")
    private Double amount;

    @Column(name = "vl_desconto")
    private Double discount;

    @Column(name = "dt_boleto")
    private Date date;

    @Column(name = "ds_linha_digitavel")
    private String description;

    @Column(name = "vl_pago")
    private Double amountPaid;

    @Column(name = "dt_criacao")
    private Date create;

    @Column(name = "dt_vencimento")
    private Date maturity;

    @Column(name = "in_status")
    private Boolean status;

    @Column(name = "ds_local_pagamento")
    private String paymentLocale;

    @ManyToOne(optional = false, fetch = FetchType.LAZY, targetEntity = UserCourse.class)
    @JoinColumns({
        @JoinColumn(name = "id_usuario_curso", insertable = true, updatable = true),
        @JoinColumn(name = "id_curso", insertable = true, updatable = true),
        @JoinColumn(name = "id_usuario", insertable = true, updatable = true)})
    private UserCourse userCourse;

    /*************************************************************************/

    @Override
    public Long getID() {
        return ID;
    }

    @Override
    public void setID(Long id) {
        this.ID = id;
    }

    public String getNumber() {
        return number;
    }

    public void setNumber(String number) {
        this.number = number;
    }

    public Double getAmount() {
        return amount;
    }

    public void setAmount(Double amount) {
        this.amount = amount;
    }

    public Double getDiscount() {
        return discount;
    }

    public void setDiscount(Double discount) {
        this.discount = discount;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public Double getAmountPaid() {
        return amountPaid;
    }

    public void setAmountPaid(Double amountPaid) {
        this.amountPaid = amountPaid;
    }

    public Date getCreate() {
        return create;
    }

    public void setCreate(Date create) {
        this.create = create;
    }

    public Date getMaturity() {
        return maturity;
    }

    public void setMaturity(Date maturity) {
        this.maturity = maturity;
    }

    public Boolean getStatus() {
        return status;
    }

    public void setStatus(Boolean status) {
        this.status = status;
    }

    public String getPaymentLocale() {
        return paymentLocale;
    }

    public void setPaymentLocale(String paymentLocale) {
        this.paymentLocale = paymentLocale;
    }

    public UserCourse getUserCourse() {
        return userCourse;
    }

    public void setUserCourse(UserCourse userCourse) {
        this.userCourse = userCourse;
    }

}
