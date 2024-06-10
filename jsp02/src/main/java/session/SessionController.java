package session;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

public class SessionController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String url = request.getRequestURI();
		MemberDAO dao = new MemberDAO();
		if (url.indexOf("login.do") != -1) {
			String userid = request.getParameter("userid");
			String passwd = request.getParameter("passwd");
			MemberDTO dto = new MemberDTO();
			dto.setUserid(userid);
			dto.setPasswd(passwd);
			String result = dao.login(dto);
			String page = "/session/login.jsp";
			System.out.println("result : " + result);
			if (result != null) {
				// 세션 객체
				HttpSession session = request.getSession();
				// session.setAttribute("세션 변수", 값)
				session.setAttribute("userid", userid);
				session.setAttribute("message", result);
				page = "/session/main.jsp";
			}
			// sendRedirect : 작업이 종료되어 새로운 페이지로 이동
			response.sendRedirect(request.getContextPath() + page);
		} else if (url.indexOf("logout.do") != -1) {
			HttpSession session = request.getSession();
			session.invalidate(); // 세션 초기화
			String page = request.getContextPath() + "/session/login.jsp?message=logout";
			response.sendRedirect(page);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
