package ch02;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/gugu.do")
public class GuguController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		int dan = Integer.parseInt(request.getParameter("dan"));
		String result = "";
		// 구구단 계산
		for (int i = 1; i <= 9; i++) {
			result += dan + "x" + i + "=" + dan * i + "<br>";
		}
		// 데이터 저장
		request.setAttribute("result", result);
		// 페이지 이동
		RequestDispatcher rd = request.getRequestDispatcher("/ch02/gugu_result2.jsp");
		rd.forward(request, response);
		System.out.println("단 : " + dan);

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
