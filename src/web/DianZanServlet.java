package web;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bean.MovieComment;
import bean.WriteBack;
import dao.MovieCommentDao;
import dao.UserDao;
import dao.impl.MovieCommentDaoImpl;
import dao.impl.UserDaoImpl;
import service.MovieCommentService;
import service.impl.MovieCommentServiceImpl;
import service.impl.WriteBackServiceImpl;

@WebServlet("/DianZanServlet")
public class DianZanServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public DianZanServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		UserDao ud=new UserDaoImpl();
		String filmcid = request.getParameter("filmcid");
		String userid = request.getParameter("userid");
		String commentid=filmcid;
		int cid = Integer.valueOf(filmcid);
		boolean checkDianZan = ud.checkDianZan(userid, commentid);
		if(checkDianZan==false) {
			MovieCommentDao mcd=new MovieCommentDaoImpl();
			mcd.addDianZanInDianZanBiao(userid, commentid);
//		System.out.println(filmcid);
			mcd.addDianZan(cid);	
		}		
		MovieCommentService mcs = new MovieCommentServiceImpl();
		MovieComment mc = mcs.findMovieCommentbyid(cid);
		int click = mc.getClick();
		response.setContentType("text/plain;charset=utf-8");
		// {"isExists": isExists}
		response.getWriter().write("{\"dianzanshu\": "+click+"}");

	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
