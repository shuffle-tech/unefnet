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
import javax.persistence.OneToOne;
import javax.persistence.Table;
import javax.persistence.UniqueConstraint;

import com.unef.model.entity.generic.GenericDTOBase;

@Entity
@Table(name = "usuario", schema = "public", uniqueConstraints = { @UniqueConstraint(columnNames = { "id_usuario" }) })
public class User extends GenericDTOBase {

    /**
     * Serialization
     */
    private static final long serialVersionUID = -2693645309255999107L;

    /*************************************************************************/

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "id_usuario")
    private Long ID;

    @Column(name = "ds_primeiro_nome")
    private String firstName;

    @Column(name = "ds_sobrenome")
    private String lastName;

    @Column(name = "ds_rg")
    private String registerNumber;

    @Column(name = "tp_sexo")
    private String sex;

    @Column(name = "dt_nascimento")
    private Date birth;

    @Column(name = "ds_email")
    private String email;

    @Column(name = "ds_cpf")
    private String cpfNumber;

    @Column(name = "in_ativo")
    private Boolean active;

    @Column(name = "dt_criacao")
    private Date create;

    @Column(name = "im_usuario")
    private byte[] image;

    @OneToOne(cascade = CascadeType.ALL, targetEntity = Address.class)
    @JoinColumn(name = "id_endereco")
    private Address address;

    @ManyToOne(fetch = FetchType.LAZY, targetEntity = User.class)
    @JoinColumn(name = "id_responsavel")
    private User responsible;

    @OneToMany(mappedBy = "responsible", fetch = FetchType.LAZY, targetEntity = User.class)
    private Set<User> users;

    @OneToMany(mappedBy = "userCourse.user", cascade = CascadeType.ALL, fetch = FetchType.LAZY, targetEntity = UserCourse.class)
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

    public String getFirstName() {
        return firstName;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    public String getLastName() {
        return lastName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    public String getRegisterNumber() {
        return registerNumber;
    }

    public void setRegisterNumber(String registerNumber) {
        this.registerNumber = registerNumber;
    }

    public String getSex() {
        return sex;
    }

    public void setSex(String sex) {
        this.sex = sex;
    }

    public Date getBirth() {
        return birth;
    }

    public void setBirth(Date birth) {
        this.birth = birth;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getCpfNumber() {
        return cpfNumber;
    }

    public void setCpfNumber(String cpfNumber) {
        this.cpfNumber = cpfNumber;
    }

    public Boolean getActive() {
        return active;
    }

    public void setActive(Boolean active) {
        this.active = active;
    }

    public Date getCreate() {
        return create;
    }

    public void setCreate(Date create) {
        this.create = create;
    }

    public Address getAddress() {
        return address;
    }

    public void setAddress(Address address) {
        this.address = address;
    }

    public User getResponsible() {
        return responsible;
    }

    public void setResponsible(User responsible) {
        this.responsible = responsible;
    }

    public Set<User> getUsers() {
        return users;
    }

    public void setUsers(Set<User> users) {
        this.users = users;
    }

    public byte[] getImage() {
        return image;
    }

    public void setImage(byte[] image) {
        this.image = image;
    }

    public Set<UserCourse> getUserCourses() {
        return userCourses;
    }

    public void setUserCourses(Set<UserCourse> userCourses) {
        this.userCourses = userCourses;
    }

}
