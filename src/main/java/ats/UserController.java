package ats;

import java.time.LocalDate;
import java.time.LocalTime;
import java.util.ArrayList;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityTransaction;
import javax.persistence.Query;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class UserController {

	@Autowired
	private EntityManager em;

	@PostMapping("/login")
	public ModelAndView login(@RequestParam String username, @RequestParam String password, ModelAndView mv) {

		Query q = em.createQuery("select u from User u where u.username=:username and u.password=:password");
		q.setParameter("username", username);
		q.setParameter("password", password);
		User u = null;
		List<User> ul = q.getResultList();
		if (ul.size() > 0) {
			u = ul.getFirst();
		}
		if (u.getRole().equals(UserRole.EMPLOYEE)) {
			mv.addObject("u", u);
			mv.addObject("msg", "Login Successfull");
			mv.setViewName("employeedashboard.jsp");
			return mv;
		} else if (u.getRole().equals(UserRole.ADMIN)) {
			mv.addObject("msg", "Login Successfull");
			return openAdminDashBoard(u, mv);
		}
		mv.setViewName("index.jsp");
		mv.addObject("msg", "Invalid Credentials, Login failed");
		return mv;
	}

	@PostMapping("/create")
	public ModelAndView createUser(@RequestParam String name, @RequestParam String username,
			@RequestParam String password, @RequestParam UserRole role, ModelAndView mv) {
		EntityTransaction et = em.getTransaction();
		et.begin();
		em.persist(new User(0, name, username, password, UserStatus.ACTIVE, role));
		et.commit();
		mv.addObject("msg", "Account Created Succssfully");
		mv.setViewName("index.jsp");
		return mv;
	}

	public List<Attendance> findAllAttendencesOfToday() {
		Query q = em.createQuery("select a from Attendance a where a.date=:date");
		q.setParameter("date", LocalDate.now());
		List<Attendance> al = q.getResultList();
		return al;
	}

	public List<Attendance> findAllAttendencesOfADay(LocalDate date) {
		Query q = em.createQuery("select a from Attendance a where a.date=:date");
		q.setParameter("date", date);
		List<Attendance> al = q.getResultList();
		return al;
	}

	public ModelAndView openAdminDashBoard(User u, ModelAndView mv) {
		mv.addObject("u", u);
		mv.addObject("al", findAllAttendencesOfToday());
		mv.setViewName("admindashboard.jsp");
		return mv;
	}
	public ModelAndView openAdminDashBoardForADay(User u, ModelAndView mv, LocalDate date) {
		
		List<Attendance> allAttendencesOfADay = findAllAttendencesOfADay(date);
		if(allAttendencesOfADay.size()==0) {
			mv.addObject("u", u);
			mv.addObject("al", new ArrayList<Attendance>() {{add(new Attendance());}});
			mv.setViewName("admindashboard.jsp");
			return mv;
		}
		
		
		mv.addObject("u", u);
		mv.addObject("al", allAttendencesOfADay);
		mv.setViewName("admindashboard.jsp");
		return mv;
	}

	@GetMapping("/checkin")
	public ModelAndView checkin(ModelAndView mv, @RequestParam int id) {
		User u = em.find(User.class, id);

		Query q = em.createQuery("select a from Attendance a where a.user.id=:id and a.date=:date");
		q.setParameter("id", id);
		q.setParameter("date", LocalDate.now());
		Attendance a = null;
		try {
			Object singleResult = q.getSingleResult();
			a = (Attendance) singleResult;

			mv.setViewName("employeedashboard.jsp");
			mv.addObject("msg", "Check-In Already Done");
			mv.addObject("u", u);
			return mv;

		} catch (Exception e) {
			a = new Attendance();
		}

		a.setUser(u);
		a.setCheckIn(LocalTime.of(LocalTime.now().getHour(), LocalTime.now().getMinute(), LocalTime.now().getSecond()));
		a.setCheckOut(a.getCheckOut());
		a.setDate(LocalDate.now());

		EntityTransaction et = em.getTransaction();

		et.begin();
		a = em.merge(a);
		et.commit();

		mv.setViewName("employeedashboard.jsp");
		mv.addObject("msg", "Check-In Successfull");
		mv.addObject("u", u);
		return mv;
	}

	@GetMapping("/time")
	public ModelAndView time(ModelAndView mv) {

		System.out.println("Time");

		mv.setViewName("index.jsp");
		return mv;
	}

	@GetMapping("/checkout")
	public ModelAndView checkout(ModelAndView mv, @RequestParam int id) {
		User u = em.find(User.class, id);

		Query q = em.createQuery("select a from Attendance a where a.user.id=:id and a.date=:date");
		q.setParameter("id", id);
		q.setParameter("date", LocalDate.now());
		Attendance a = null;
		try {
			Object singleResult = q.getSingleResult();
			a = (Attendance) singleResult;
		} catch (Exception e) {

			mv.setViewName("employeedashboard.jsp");
			mv.addObject("msg", "Check-In Not Done | Can't Check-Out | Please Kindly Check-In");
			mv.addObject("u", u);
			return mv;
		}
		a.setUser(u);
		a.setCheckIn(a.getCheckIn());
		a.setCheckOut(
				LocalTime.of(LocalTime.now().getHour(), LocalTime.now().getMinute(), LocalTime.now().getSecond()));
		a.setDate(LocalDate.now());

//		int ihr = a.getCheckIn().getHour();
//		int ohr = a.getCheckOut().getHour();
//
//		int imins = a.getCheckIn().getMinute();
//		int omins = a.getCheckOut().getMinute();
//
//		int iseconds = a.getCheckIn().getSecond();
//		int oseconds = a.getCheckOut().getSecond();
//
//		int thr = Math.abs(ohr - ihr);
//		int tmins = Math.abs(omins - imins);
//		int tseconds = Math.abs(oseconds - iseconds);
//
//		a.setTotalWorkHours(LocalTime.of(thr, tmins, tseconds));
//		
		int wim = 60 - a.getCheckIn().getMinute();
		int wom = a.getCheckOut().getMinute();
		int twm = wim + wom;
		int tch = twm / 60;
		int tcm = twm % 60;

		int twh = a.getCheckOut().getHour() - a.getCheckIn().getHour() - 1;
		a.setTotalWorkHours(LocalTime.of(tch + twh, tcm, a.getCheckIn().getSecond()));

		EntityTransaction et = em.getTransaction();

		et.begin();
		a = em.merge(a);
		et.commit();

		mv.setViewName("employeedashboard.jsp");
		mv.addObject("msg", "Check-Out Successfull");
		mv.addObject("u", u);
		return mv;
	}

	@PostMapping("/search")
	public ModelAndView search(@RequestParam int id ,@RequestParam String date, ModelAndView mv) {
		
		String[] split = date.split("-");
		
		
		LocalDate ad = LocalDate.of(Integer.parseInt(split[0]), Integer.parseInt(split[1]), Integer.parseInt(split[2]));
		
		User u = em.find(User.class, id);
		return openAdminDashBoardForADay(u, mv, ad);
	}

}
