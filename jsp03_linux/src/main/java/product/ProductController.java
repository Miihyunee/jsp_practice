package product;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class ProductController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String url = request.getRequestURI();
		System.out.println("contains : " + url.contains(url));
		System.out.println("indexOf : " + url.indexOf(url));

		ProductDAO dao = new ProductDAO();

		if (url.contains("list.do")) {
			List<Map<String, Object>> items = dao.list();
			request.setAttribute("items", items);
			RequestDispatcher rd = request.getRequestDispatcher("/product/list.jsp");
			rd.forward(request, response);
		} else if (url.contains("insert.do")) {
			// 폼데이터 변수에 저장
			String product_name = request.getParameter("product_name");
			int price = Integer.parseInt(request.getParameter("price"));
			int amount = Integer.parseInt(request.getParameter("amount"));
			// DAO insert 함수 호출
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("product_name", product_name);
			map.put("price", price);
			map.put("amount", amount);
			dao.insert(map);
			// 목록으로 이동
			response.sendRedirect("/jsp03/product_servlet/list.do");
		} else if (url.contains("detail.do")) {
			// 상품코드 받아오기
			int product_code = Integer.parseInt(request.getParameter("product_code"));
			// dao 요청
			Map<String, Object> map = dao.detail(product_code);
			// 데이터 저장
			request.setAttribute("map", map);
			// 출력 페이지로 전달
			RequestDispatcher rd = request.getRequestDispatcher("/product/detail.jsp");
			rd.forward(request, response);
		} else if (url.contains("update.do")) {
			// 폼데이터 변수에 저장
			int product_code = Integer.parseInt(request.getParameter("product_code"));
			String product_name = request.getParameter("product_name");
			int price = Integer.parseInt(request.getParameter("price"));
			int amount = Integer.parseInt(request.getParameter("amount"));
			// DAO insert 함수 호출
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("product_code", product_code);
			map.put("product_name", product_name);
			map.put("price", price);
			map.put("amount", amount);
			dao.update(map);
			// 목록으로 이동
			response.sendRedirect("/jsp03/product_servlet/list.do");
		} else if (url.contains("delete.do")) {
			int product_code = Integer.parseInt(request.getParameter("product_code"));
			// dao delete 함수 호출
			dao.delete(product_code);
			// 출력 페이지로 이동
			response.sendRedirect("/jsp03/product_servlet/list.do");
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}
}
