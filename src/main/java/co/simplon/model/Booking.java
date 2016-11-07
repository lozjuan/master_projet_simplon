package co.simplon.model;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

@Entity
public class Booking implements Serializable {

	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id;

	@ManyToOne(cascade = { CascadeType.MERGE }, targetEntity = Room.class)
	@JoinColumn(name = "roomId")
	private Room room;

	@ManyToOne(cascade = { CascadeType.MERGE }, targetEntity = Computer.class)
	@JoinColumn(name = "computerId")
	private Computer computer;

	@ManyToOne(cascade = { CascadeType.MERGE }, targetEntity = User.class)
	@JoinColumn(name = "userId")
	private User user;
	
	private Date starts;

	private Date Ends;

	private Date createdAt;

	public Booking() {
		super();
	}

	public Booking(Room roomId, Computer computerId, Date starts, Date ends, Date createdAt, User userId) {
		super();
		this.room = roomId;
		this.computer = computerId;
		this.starts = starts;
		Ends = ends;
		this.createdAt = createdAt;
		this.user = userId;
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
		return Ends;
	}

	public void setEnds(Date ends) {
		Ends = ends;
	}

	public Date getCreatedAt() {
		return createdAt;
	}

	public void setCreatedAt(Date createdAt) {
		this.createdAt = createdAt;
	}

	public Room getRoom() {
		return room;
	}

	public void setRoom(Room room) {
		this.room = room;
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
}
