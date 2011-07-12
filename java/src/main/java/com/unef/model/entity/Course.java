package com.unef.model.entity;

import java.util.Date;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.UniqueConstraint;

import com.unef.model.entity.generic.GenericDTOBase;

@Entity
@Table(name = "curso", schema = "public", uniqueConstraints = { @UniqueConstraint(columnNames = { "id_curso" }) })
public class Course extends GenericDTOBase {

    /**
     * Serialization
     */
    private static final long serialVersionUID = 7480183644868718109L;

    /*************************************************************************/

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "id_curso")
    private Long ID;

    @Column(name = "nm_curso")
    private String name;

    @Column(name = "ds_curso")
    private String description;

    @Column(name = "dt_criacao")
    private Date create;

    @ManyToOne(fetch = FetchType.LAZY, targetEntity = Institution.class)
    @JoinColumn(name = "id_instituicao", insertable = true, updatable = true)
    private Institution institution;

    @OneToMany(mappedBy = "course", cascade = CascadeType.ALL, fetch = FetchType.LAZY, targetEntity = Shift.class)
    private Set<Shift> shifts;

    @OneToMany(mappedBy = "userCourse.course", cascade = CascadeType.ALL, fetch = FetchType.LAZY, targetEntity = UserCourse.class)
    private Set<UserCourse> userCourses;

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

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public Date getCreate() {
        return create;
    }

    public void setCreate(Date create) {
        this.create = create;
    }

    public Institution getInstitution() {
        return institution;
    }

    public void setInstitution(Institution institution) {
        this.institution = institution;
    }

    public Set<Shift> getShifts() {
        return shifts;
    }

    public void setShifts(Set<Shift> shifts) {
        this.shifts = shifts;
    }

    public Set<UserCourse> getUserCourses() {
        return userCourses;
    }

    public void setUserCourses(Set<UserCourse> userCourses) {
        this.userCourses = userCourses;
    }

}
