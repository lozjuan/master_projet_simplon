package co.simplon.model;

import org.springframework.data.jpa.repository.JpaRepository;

import javax.persistence.*;
import java.io.Serializable;
import java.math.BigInteger;
import java.security.SecureRandom;
import java.util.Date;

@Entity
public class TokenPasswordRecovery implements Serializable {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    private String token;

    private Date createdAt;

    @ManyToOne(cascade = { CascadeType.MERGE }, targetEntity = User.class)
    @JoinColumn(name = "userId")
    private User user;

    @Transient
    private static SecureRandom secureRandom;

    private static SecureRandom getSecureRandom() {
        if( secureRandom == null ) secureRandom = new SecureRandom();
        return secureRandom;
    }

    public TokenPasswordRecovery() {}

    public TokenPasswordRecovery(User user) {
        this.token = new BigInteger(130, getSecureRandom()).toString(32);
        this.createdAt = new Date();
        this.user = user;
    }

    public TokenPasswordRecovery(String token, Date createdAt, User user) {
        this.token = token;
        this.createdAt = createdAt;
        this.user = user;
    }

    public Integer getId() {
        return id;
    }

    public String getToken() {
        return token;
    }

    public Date getCreatedAt() {
        return createdAt;
    }

    public User getUser() {
        return user;
    }

    public void setId(Integer id) {
        this.id = id;
    }
}
