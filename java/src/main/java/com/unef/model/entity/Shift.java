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
@Table(name = "turno", schema = "public", uniqueConstraints = { @UniqueConstraint(columnNames = { "id_turno" }) })
public class Shift extends GenericDTOBase {

    /**
     * Serialization
     */
    private static final long serialVersionUID = 7022928730734916967L;

    /*************************************************************************/

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "id_turno")
    private Long ID;

    @Column(name = "ds_turno")
    private String description;

    @ManyToOne(fetch = FetchType.LAZY, targetEntity = Course.class)
    @JoinColumn(name = "id_curso", insertable = true, updatable = true)
    private Course course;

    /*************************************************************************/

    @Override
    public Long getID() {
        return ID;
    }

    @Override
    public void setID(Long id) {
        this.ID = id;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public Course getCourse() {
        return course;
    }

    public void setCourse(Course course) {
        this.course = course;
    }

}
