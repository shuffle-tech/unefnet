package com.unef.model.entity;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.UniqueConstraint;

import com.unef.model.entity.generic.GenericDTOBase;

@Entity
@Table(name = "endereco", schema = "public", uniqueConstraints = { @UniqueConstraint(columnNames = { "id_endereco" }) })
public class Address extends GenericDTOBase {

    /**
     * Serialization
     */
    private static final long serialVersionUID = 8609259002263902362L;

    /*************************************************************************/

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "id_endereco")
    private Long ID;

    @Column(name = "ds_logradouro")
    private String street;

    @Column(name = "nr_numero")
    private String number;

    @Column(name = "nm_bairro")
    private String neighborhood;

    @Column(name = "nr_cep")
    private String cepNumber;

    @Column(name = "nm_cidade")
    private String city;

    @Column(name = "ds_ponto_referencia")
    private String referencePoint;

    @Column(name = "dt_criacao")
    private Date create;

    /*************************************************************************/

    @Override
    public Long getID() {
        return ID;
    }

    @Override
    public void setID(Long id) {
        this.ID = id;
    }

    public String getStreet() {
        return street;
    }

    public void setStreet(String street) {
        this.street = street;
    }

    public String getNumber() {
        return number;
    }

    public void setNumber(String number) {
        this.number = number;
    }

    public String getNeighborhood() {
        return neighborhood;
    }

    public void setNeighborhood(String neighborhood) {
        this.neighborhood = neighborhood;
    }

    public String getCepNumber() {
        return cepNumber;
    }

    public void setCepNumber(String cepNumber) {
        this.cepNumber = cepNumber;
    }

    public String getCity() {
        return city;
    }

    public void setCity(String city) {
        this.city = city;
    }

    public String getReferencePoint() {
        return referencePoint;
    }

    public void setReferencePoint(String referencePoint) {
        this.referencePoint = referencePoint;
    }

    public Date getCreate() {
        return create;
    }

    public void setCreate(Date create) {
        this.create = create;
    }

}
