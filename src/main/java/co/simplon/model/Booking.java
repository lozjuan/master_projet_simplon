package co.simplon.model;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

import com.google.gson.annotations.Expose;

@Entity
public class Booking implements Serializable {

    private static final long serialVersionUID = 1L;

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    @Expose
    private Integer id;


    @ManyToOne(cascade = {CascadeType.MERGE}, targetEntity = Room.class)
    @JoinColumn(name = "roomId")
    @Expose
    private Room room;

    @ManyToOne(cascade = {CascadeType.MERGE}, targetEntity = Computer.class)
    @JoinColumn(name = "computerId")
    @Expose
    private Computer computer;


    @Column(name = "starts")
    @Expose
    private Date starts;

    @Column(name = "ends")
    @Expose
    private Date ends;

    private Date createdAt;

    @ManyToOne(cascade = {CascadeType.MERGE}, targetEntity = User.class)
    @JoinColumn(name = "userId")
    @Expose
    private User user;

    private String title;

    public Booking() {
        super();
    }

    public Booking(Room roomId, Computer computerId, Date starts, Date ends, Date createdAt, User user) {
        super();
        this.room = roomId;
        this.computer = computerId;
        this.starts = starts;
        this.ends = ends;
        this.createdAt = createdAt;
        this.user = user;
        this.title = "";
        if (room != null) {
            this.title += room.getName() + " " + this.starts + " " + this.ends;
        }
        if (computer != null) {
            this.title += " - " + computer.getBrand() + " " + computer.getModel() + " " + this.starts + " " + this.ends ;
        }
    }

    public Integer getId() {
        return id;
    }

    public Date getStarts() {
        return starts;
    }

    public void setStarts(Date starts) {
        this.starts = starts;
    }

    public Date getEnds() {
        return ends;
    }

    public void setEnds(Date ends) {
        this.ends = ends;
    }

    public Room getRoom() {
        return room;
    }

    public Computer getComputer() {
        return computer;
    }

    public void setComputer(Computer computer) {
        this.computer = computer;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public void setRoom(Room room) {
        this.room = room;
    }

    public Date getCreatedAt() {
        return createdAt;
    }

    public void setCreatedAt(Date createdAt) {
        this.createdAt = createdAt;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }
}
