package book;

import java.io.IOException;
import java.util.List;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class BookController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// 요청한 주소 확인
		String url = request.getRequestURI();
		System.out.println("요청한 주소 : " + url);
		BookDAO dao = new BookDAO();
		if (url.indexOf("list.do") != -1) {
			// dao 생성
			// 도서목록 가져오기
			List<BookDTO> items = dao.list_book();
			// 저장
			request.setAttribute("items", items);
			// 페이지 이동
			RequestDispatcher rd = request.getRequestDispatcher("/book/book_list.jsp");
			rd.forward(request, response);
		} else if (url.indexOf("insert.do") != -1) { // 도서 등록
			// 폼에 입력한 값 저장
			String title = request.getParameter("title");
			String author = request.getParameter("author");
			int price = Integer.parseInt(request.getParameter("price"));
			int amount = Integer.parseInt(request.getParameter("amount"));
			BookDTO dto = new BookDTO(title, author, price, amount);
			System.out.println("폼에 입력된 값 : " + dto);

			// dao에 저장 요청
			dao.insert_book(dto);
			// 페이지 이동(목록으로)
			response.sendRedirect("/jsp02/book_servlet/list.do");
		} else if (url.indexOf("view.do") != -1) {
			// idx 읽어오기
			int idx = Integer.parseInt(request.getParameter("idx"));
			// dao.detal함수 호출
			BookDTO dto = dao.detail(idx);
			// 저장
			request.setAttribute("dto", dto);
			// 출력 페이지로 이동
			RequestDispatcher rd = request.getRequestDispatcher("/book/detail.jsp");
			rd.forward(request, response);
		} else if (url.indexOf("update.do") != -1) {
			// 폼에 입력한 값 저장
			int idx = Integer.parseInt(request.getParameter("idx"));
			String title = request.getParameter("title");
			String author = request.getParameter("author");
			int price = Integer.parseInt(request.getParameter("price"));
			int amount = Integer.parseInt(request.getParameter("amount"));
			BookDTO dto = new BookDTO(idx, title, author, price, amount);
			System.out.println("폼에 입력된 값 : " + dto);
			// dao에 저장 요청
			dao.update(dto);
			// 페이지 이동(목록으로)
			response.sendRedirect("/jsp02/book_servlet/list.do");
		} else if (url.indexOf("delete.do") != -1) {
			// 레코드 번호
			int idx = Integer.parseInt(request.getParameter("idx"));
			// 삭제 함수 호출
			dao.delete(idx);
			// 목록으로 이동
			response.sendRedirect("/jsp02/book_servlet/list.do");
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
