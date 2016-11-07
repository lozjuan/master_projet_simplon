package co.simplon.test;

import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.mockito.Mockito;
import org.mockito.invocation.InvocationOnMock;
import org.mockito.runners.MockitoJUnitRunner;
import org.mockito.stubbing.Answer;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.web.WebAppConfiguration;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.MvcResult;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;

import co.simplon.model.Room;
import co.simplon.service.RoomService;
import co.simplon.web.RoomController;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import junit.framework.TestCase;
import static org.mockito.Mockito.*;
import static org.mockito.AdditionalAnswers.*;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.get;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.*;

@RunWith(MockitoJUnitRunner.class)
public class RoomTest extends TestCase {

	private MockMvc mockMvc;

	@Autowired
	private RoomService roomServiceMock;

	@Before
	public void setUp() {
		roomServiceMock = mock(RoomService.class);
		mockMvc = MockMvcBuilders.standaloneSetup(new RoomController(roomServiceMock)).build();
	}

	// Add WebApplicationContext field here

	// The setUp() method is omitted.

	@Test
	public void test_get_and_add_room() throws Exception {
		Room first = new Room("room1", 14, "grande salle");
		Room second = new Room("room2", 10, "petite salle");
		final ArrayList<Room> roomList = new ArrayList<Room>();
		roomList.add(first);
		roomList.add(second);

		when(roomServiceMock.getAll()).thenReturn(roomList);
		when(roomServiceMock.addOrUpdate(Mockito.any(Room.class))).thenAnswer(new Answer() {
			public Object answer(InvocationOnMock invocation) {
				Room room = (Room) invocation.getArguments()[0];
				roomList.add(room);
				return room;
			}
		});

		MvcResult fullResult = mockMvc.perform(get("/room")).andExpect(status().isOk()).andReturn();
		assertEquals(((List) fullResult.getModelAndView().getModel().get("roomList")).size(), 2);

		mockMvc.perform(get("/addRoom?name=S1&places=15&description=SalleMontreuil")).andExpect(status().isFound());
		assertEquals(roomList.size(), 3);
	}

	@Test
	public void test_delete_room() throws Exception {
		Room first = new Room("room1", 14, "grande salle");
		Room second = new Room("room2", 13, "grande Salle");
		Room third = new Room("room3", 12, "grande salle");
		final ArrayList<Room> roomList = new ArrayList<Room>();
		roomList.add(first);
		roomList.add(second);
		roomList.add(third);

		when(roomServiceMock.getAll()).thenReturn(roomList);
		when(roomServiceMock.delete(Mockito.any())).thenAnswer(new Answer() {
			public Object answer(InvocationOnMock invocation) {
				int id = (int) invocation.getArguments()[0];
				System.out.println(id);
				roomList.remove(id);
				return null;
			}
		});

		MvcResult fullResult = mockMvc.perform(get("/room")).andExpect(status().isOk()).andReturn();
		assertEquals(((List) fullResult.getModelAndView().getModel().get("roomList")).size(), 3);

		mockMvc.perform(get("/deleteRoom?id=1")).andExpect(status().isFound());
		assertEquals(2, roomList.size());
	}
	
	@Test
	public void test_is_available_room(){
		
	}
}
