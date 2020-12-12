package com.silverlingjm.goshare.models;

import javax.persistence.*;

@Entity
@Table(name="users")
public class User {

    @Id
    @GeneratedValue(strategy=GenerationType.IDENTITY)
    @Column(name="id")
    private Long id;

    @Column(name="fname")
    private String fname;

    @Column(name="lname")
    private String lname;

    @Column(name="email")
    private String email;

    @Column(name="password")
    private String password;

    public User() {}

    public User(String fname, String lname, String email, String password ) {
        this.fname = fname;
        this.lname = lname;
        this.email = email;
        this.password = password;
    }
}
