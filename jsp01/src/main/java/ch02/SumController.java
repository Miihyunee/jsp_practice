package ch02;

import java.io.IOException;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

//web.xml 설정을 사용하지 않을 때
@WebServlet("/ch02_servlet/sum.do")
public class SumController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		int number = Integer.parseInt(request.getParameter("number"));
		int sum = 0;
		for (int i = 1; i <= number; i++) {
			sum += i;
		}
		request.setAttribute("sum", sum);
		RequestDispatcher rd = request.getRequestDispatcher("/ch02/sum_result.jsp");
		rd.forward(request, response);
		System.out.println("get 방식 호출....");
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("post 방식 호출....");
		doGet(request, response);
	}
}
