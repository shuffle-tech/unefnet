package com.unef.model.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.UniqueConstraint;

import com.unef.model.entity.generic.GenericDTOBase;

@Entity
@Table(name = "telefone", schema = "public", uniqueConstraints = { @UniqueConstraint(columnNames = { "id_telefone" }) })
public class Phone extends GenericDTOBase {

    /**
     * Serialization
     */
    private static final long serialVersionUID = 6072609229348043110L;

    /*************************************************************************/

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "id_telefone")
    private Long ID;

    @Column(name = "nr_ddd")
    private String ddd;

    @Column(name = "nr_telefone")
    private String number;

    @Column(name = "tp_telefone")
    private Integer type;

    @ManyToOne(optional = false, fetch = FetchType.LAZY, targetEntity = Institution.class)
    @JoinColumn(name = "id_instituicao", insertable = true, updatable = true)
    private Institution institution;

    /*************************************************************************/

    @Override
    public Long getID() {
        return ID;
    }

    @Override
    public void setID(Long id) {
        this.ID = id;
    }

    public String getDdd() {
        return ddd;
    }

    public void setDdd(String ddd) {
        this.ddd = ddd;
    }

    public String getNumber() {
        return number;
    }

    public void setNumber(String number) {
        this.number = number;
    }

    public Integer getType() {
        return type;
    }

    public void setType(Integer type) {
        this.type = type;
    }

    public Institution getInstitution() {
        return institution;
    }

    public void setInstitution(Institution institution) {
        this.institution = institution;
    }

}
