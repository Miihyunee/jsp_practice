package board;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;

@MultipartConfig(maxFileSize = 1024 * 1024 * 10, location = "c:/upload")
public class UploadController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		List<String> file_names = new ArrayList<>();
		List<Long> file_sizes = new ArrayList<>();
		try {
			for (Part part : request.getParts()) {
				String file_name = part.getSubmittedFileName();
				if(file_name != null) { // 첨부파일이 있을 때
					file_names.add(file_name);
					file_sizes.add(part.getSize());
					part.write(file_name); // 지정한 디렉토리에 저장
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		String name = request.getParameter("name");
		String subject = request.getParameter("subject");
		request.setAttribute("name", name);
		request.setAttribute("subject", subject);
		request.setAttribute("file_names", file_names);
		request.setAttribute("file_sizes", file_sizes);
		String page = "/board/upload.jsp";
		RequestDispatcher rd = request.getRequestDispatcher(page);
		rd.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
