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
@Table(name = "ponto_embarque_desembarque", schema = "public", uniqueConstraints = { @UniqueConstraint(columnNames = { "id_ponto_embarque_desembarque" }) })
public class DepartureLandingPoint extends GenericDTOBase {

    /**
     * Serialization
     */
    private static final long serialVersionUID = 7951528681821147700L;

    /*************************************************************************/

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "id_ponto_embarque_desembarque")
    private Long ID;

    @Column(name = "nm_cidade")
    private String city;

    @Column(name = "nm_bairro")
    private String neighborhood;

    @Column(name = "ds_ponto_referencia")
    private String reference;

    @Column(name = "dt_criacao")
    private Date create;

    @Column(name = "in_ponto")
    private Boolean departure;

    /*************************************************************************/

    @Override
    public Long getID() {
        return ID;
    }

    @Override
    public void setID(Long id) {
        this.ID = id;
    }

    public String getCity() {
        return city;
    }

    public void setCity(String city) {
        this.city = city;
    }

    public String getNeighborhood() {
        return neighborhood;
    }

    public void setNeighborhood(String neighborhood) {
        this.neighborhood = neighborhood;
    }

    public String getReference() {
        return reference;
    }

    public void setReference(String reference) {
        this.reference = reference;
    }

    public Date getCreate() {
        return create;
    }

    public void setCreate(Date create) {
        this.create = create;
    }

    public Boolean getDeparture() {
        return departure;
    }

    public void setDeparture(Boolean departure) {
        this.departure = departure;
    }

}
