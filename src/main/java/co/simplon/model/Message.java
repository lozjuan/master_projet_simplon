package co.simplon.model;

import javax.persistence.*;
import java.io.Serializable;
import java.util.Date;

@Entity
public class Message implements Serializable {

    private static final long serialVersionUID = 1L;

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    private String content;

    private String userName;

    private Date createdAt;

    @Column(name = "treated", nullable = false, columnDefinition = "int default 0")
    private Integer treated;

    private Date treatedAt;

    public Message() {
    }

    public Message(String content, String userName, Date createdAt, Integer treated, Date treatedAt) {
        this.content = content;
        this.userName = userName;
        this.createdAt = createdAt;
        this.treated = treated;
        this.treatedAt = treatedAt;

    }

    public Integer getId() {
        return id;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public Date getCreatedAt() {
        return createdAt;
    }

    public void setCreatedAt(Date createdAt) {
        this.createdAt = createdAt;
    }

    public Integer getTreated() {
        return treated;
    }

    public void setTreated(Integer treated) {
        this.treated = treated;
    }

    public Date getTreatedAt() {
        return treatedAt;
    }

    public void setTreatedAt(Date treatedAt) {
        this.treatedAt = treatedAt;
    }

}
