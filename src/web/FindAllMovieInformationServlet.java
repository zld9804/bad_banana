package web;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bean.Movie;
import service.impl.MovieServiceImpl;
import utils.PageBean;
@WebServlet("/FindAllMovieInformationServlet")
public class FindAllMovieInformationServlet extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		MovieServiceImpl msi = new MovieServiceImpl();
//		List<Movie> list = msi.FindAllMovieInformation();
//		HttpSession session = request.getSession();
//		session.setAttribute("allmovie", list);
//		response.sendRedirect("/BadBanana/remendianying/remendianying.jsp");
		String currentPage = request.getParameter("currentPage");
		System.out.println(currentPage);
		String pageSize = request.getParameter("pageSize");
		PageBean pb = msi.findMoviePageBean(currentPage, pageSize);
		HttpSession session = request.getSession();
		session.setAttribute("allmovie", pb);
		System.out.println(pb.getTotalPage());
		response.sendRedirect("/BadBanana/remendianying/remendianying.jsp");
		
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
}
