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
@Table(name = "tipo_pagamento", schema = "public", uniqueConstraints = { @UniqueConstraint(columnNames = { "id_tipo_pagamento" }) })
public class PaymentType extends GenericDTOBase {

    /**
     * Serialization
     */
    private static final long serialVersionUID = 8289609594286137004L;

    /*************************************************************************/

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "id_tipo_pagamento")
    private Long ID;

    @Column(name = "ds_tipo_pagamento")
    private String name;

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

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Date getCreate() {
        return create;
    }

    public void setCreate(Date create) {
        this.create = create;
    }

}
