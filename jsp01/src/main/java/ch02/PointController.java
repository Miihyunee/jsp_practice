package ch02;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class PointController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	// get 방식으로 호출할 때 실행
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String name = request.getParameter("name");
		int kor = Integer.parseInt(request.getParameter("kor"));
		int eng = Integer.parseInt(request.getParameter("eng"));
		int mat = Integer.parseInt(request.getParameter("mat"));
		int total = kor + eng + mat;
		double average = total / 3.0;

		// Map<key 자료형, value 자료형>
		Map<String, Object> map = new HashMap<>();
		map.put("name", name);
		map.put("kor", kor);
		map.put("eng", eng);
		map.put("mat", mat);
		map.put("total", total);
		map.put("average", average);

		request.setAttribute("point", map);
		System.out.println("map :" + map);

		String page = "/ch02/point_result.jsp";
		RequestDispatcher rd = request.getRequestDispatcher(page);
		rd.forward(request, response);
	}

	// post 방식으로 호출할 때 실행
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
