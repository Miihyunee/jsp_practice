package member;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/member_servlet/*")
public class MemberController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// uri : 짧은 주소, url : 긴주소(http://~)
		String url = request.getRequestURI(); // 사용자가 요청한 주소
		String context = request.getContextPath(); // 프로젝트 이름("/jsp02")
		MemberDAO dao = new MemberDAO();

		if (url.indexOf("list.do") != -1) { // indexOf : 문자열 찾기(없을 경우 -1)
			Map<String, Object> map = new HashMap<String, Object>();
			List<MemberDTO> list = dao.list();
			// 자료 담기
			map.put("list", list);
			map.put("count", list.size());
			// 저장하기
			request.setAttribute("map", map);
			// 데이터 표출할 페이지 지정
			String page = "/member/list.jsp";
			RequestDispatcher rd = request.getRequestDispatcher(page);
			// 페이지 이동
			rd.forward(request, response);
		} else if (url.indexOf("join.do") != -1) {
			String userid = request.getParameter("userid");
			String passwd = request.getParameter("passwd");
			String name = request.getParameter("name");
			String address = request.getParameter("address");
			String tel = request.getParameter("tel");
			MemberDTO dto = new MemberDTO(userid, passwd, name, address, tel);
			dao.insert(dto);
			response.sendRedirect(context + "/member_servlet/list.do");
		} else if (url.indexOf("view.do") != -1) {
			String userid = request.getParameter("userid");
			MemberDTO dto = dao.detail(userid);
			request.setAttribute("dto", dto);
			String page = "/member/view.jsp";
			RequestDispatcher rd = request.getRequestDispatcher(page);
			rd.forward(request, response);
		} else if (url.indexOf("update.do") != -1) {
			String userid = request.getParameter("userid");
			String passwd = request.getParameter("passwd");
			String name = request.getParameter("name");
			String address = request.getParameter("address");
			String tel = request.getParameter("tel");
			MemberDTO dto = new MemberDTO(userid, passwd, name, address, tel);
			dao.update(dto);
			response.sendRedirect(context + "/member_servlet/list.do");
		} else if (url.indexOf("delete.do") != -1) {
			String userid = request.getParameter("userid");
			dao.delete(userid);
			response.sendRedirect(context + "/member_servlet/list.do");
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
