package com.unef.model.entity;

import javax.persistence.Column;
import javax.persistence.Embeddable;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

import com.unef.model.entity.generic.GenericDTOBase;

@Embeddable
public class UserCoursePK extends GenericDTOBase {

    /**
     * Serialization
     */
    private static final long serialVersionUID = 7322845883791218310L;


    /*************************************************************************/

    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "id_usuario_curso")
    private Long ID;

    @ManyToOne(fetch = FetchType.EAGER, targetEntity = Course.class)
    @JoinColumn(name = "id_curso", insertable = true, updatable = true)
    private Course course;

    @ManyToOne(fetch = FetchType.EAGER, targetEntity = User.class)
    @JoinColumn(name = "id_usuario", insertable = true, updatable = true)
    private User user;
    
    /*************************************************************************/

    @Override
    public Long getID() {
        return ID;
    }

    @Override
    public void setID(Long id) {
        this.ID = id;
    }

    public Course getCourse() {
        return course;
    }

    public void setCourse(Course course) {
        this.course = course;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }
    
}
