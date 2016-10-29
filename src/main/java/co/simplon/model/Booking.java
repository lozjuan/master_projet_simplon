package co.simplon.model;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.Table;

@Entity
@Table(name="Booking")
public class Booking {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name="id")
	private Integer id;

	// TODO foreign key to room
	@Column(name="roomName")
	private String roomName;

	// TODO foreign key to computer
	@Column(name="computerId")
	private String computerId;

	@Column(name="starts")
	private Date starts;

	@Column(name="ends")
	private Date Ends;

	@Column(name="createdAt")
	private	Date createdAt;

	// foreign key to user
	@Column(name="userId")
	private Integer userId;

	@ManyToOne
	@JoinColumn(name="id")
	private Computer computer; 
	
	@ManyToOne
	@JoinColumn(name="id")
	private User user;
	
	@ManyToOne
	@JoinColumn(name="id")
	private Room rooml; 
	
	
	public Booking() {
		super();
	}

	public Booking(String roomName, String computerId, Date starts, Date ends, Date createdAt,
			Integer userId) {
		super();
		this.roomName = roomName;
		this.computerId = computerId;
		this.starts = starts;
		Ends = ends;
		this.createdAt = createdAt;
		this.userId = userId;
	}

	public Integer getId() {
		return id;
	}

	public String getRoomName() {
		return roomName;
	}

	public void setRoomName(String roomName) {
		this.roomName = roomName;
	}

	public String getComputerId() {
		return computerId;
	}

	public void setComputerId(String computerId) {
		this.computerId = computerId;
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

	public Integer getUserId() {
		return userId;
	}

	public void setUserId(Integer userId) {
		this.userId = userId;
	}

}
