package board;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import jakarta.servlet.http.HttpSession;
import sqlmap.MybatisManager;

public class BoardDAO {
	public int count(String search_option, String keyword) {
		int result = 0;
		SqlSession session = MybatisManager.getInstance().openSession();
		try {
			Map<String, Object> map = new HashMap<>();
			map.put("search_option", search_option);
			map.put("keyword", keyword);
			result = session.selectOne("board.search_count", map);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (session != null)
				session.close();
		}
		return result;
	}

	public List<BoardDTO> list(int pageStart, int pageEnd) {
		List<BoardDTO> list = null;
		SqlSession session = null;
		try {
			session = MybatisManager.getInstance().openSession();
			Map<String, Object> map = new HashMap<>();
			map.put("start", pageStart);
			map.put("end", pageEnd);
			list = session.selectList("board.list", map);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (session != null)
				session.close();
		}
		return list;
	}

	public int count() {
		int result = 0;
		SqlSession session = MybatisManager.getInstance().openSession();
		try {
			result = session.selectOne("board.count");
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (session != null)
				session.close();
		}
		return result;
	}

	public void insert(BoardDTO dto) {
		SqlSession session = MybatisManager.getInstance().openSession();
		session.insert("board.insert", dto);
		session.commit();
		session.close();
	}

	public String getFilename(int num) {
		String result = null;
		SqlSession session = MybatisManager.getInstance().openSession();
		try {
			result = session.selectOne("board.filename", num);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (session != null)
				session.close();
		}
		return result;
	}

	public void plus_down(int num) {
		SqlSession session = MybatisManager.getInstance().openSession();
		try {
			session.update("board.plus_down", num);
			session.commit();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (session != null)
				session.close();
		}
	}

	public void plus_hit(int num, HttpSession count_session) {
		SqlSession session = null;
		try {
			long read_time = 0;
			if (count_session.getAttribute("read_time_" + num) != null) {
				read_time = (long) count_session.getAttribute("read_time_" + num);
			}
			// 현재 시간
			long current_time = System.currentTimeMillis();
			session = MybatisManager.getInstance().openSession();
			if (current_time - read_time > 5 * 1000) { // 5초
				session.update("board.plus_hit", num);
				session.commit();
				count_session.setAttribute("read_time_" + num, current_time);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (session != null)
				session.close();
		}
	}

	public BoardDTO view(int num) {
		BoardDTO dto = null;
		SqlSession session = MybatisManager.getInstance().openSession();
		try {
			dto = session.selectOne("board.view", num);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (session != null)
				session.close();
		}
		return dto;
	}

	public void insert_comment(BoardCommentDTO dto) {
		SqlSession session = MybatisManager.getInstance().openSession();
		try {
			session.insert("board.insert_comment", dto);
			session.commit();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (session != null)
				session.close();
		}
	}

	public List<BoardCommentDTO> list_comment(int num) {
		List<BoardCommentDTO> list = null;
		SqlSession session = MybatisManager.getInstance().openSession();
		try {
			list = session.selectList("board.list_comment", num);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (session != null)
				session.close();
		}
		return list;
	}

	public void update_order(int group_num, int re_order) {
		SqlSession session = null;
		try {
			session = MybatisManager.getInstance().openSession();
			Map<String, Object> map = new HashMap<>();
			map.put("group_num", group_num);
			map.put("re_order", re_order);
			session.update("board.update_order", map);
			session.commit();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (session != null)
				session.close();
		}
	}

	public void insert_reply(BoardDTO dto) {
		SqlSession session = null;
		try {
			session = MybatisManager.getInstance().openSession();
			session.insert("board.insert_reply", dto);
			session.commit();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (session != null)
				session.close();
		}
	}

	public List<BoardDTO> list_search(String search_option, String keyword, int start, int end) {
		List<BoardDTO> list = null;
		SqlSession session = MybatisManager.getInstance().openSession();
		try {
			Map<String, Object> map = new HashMap<>();
			map.put("search_option", search_option);
			map.put("keyword", keyword);
			map.put("start", start);
			map.put("end", end);
			list = session.selectList("board.search_list", map);
			for (BoardDTO dto : list) {
				String writer = dto.getWriter();
				String subject = dto.getSubject();
				switch (search_option) {
				case "all":
					writer = writer.replace(keyword, "<span style='color:red'>" + keyword + "</span>");
					subject = subject.replace(keyword, "<span style='color:red'>" + keyword + "</span>");
					break;
				case "writer":
					writer = writer.replace(keyword, "<span style='color:red'>" + keyword + "</span>");
					break;
				case "subject":
					subject = subject.replace(keyword, "<span style='color:red'>" + keyword + "</span>");
					break;
				}
				dto.setWriter(writer);
				dto.setSubject(subject);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (session != null)
				session.close();
		}
		return list;
	}

	public String check_pwd(int num, String passwd) {
		String result = "";
		SqlSession session = MybatisManager.getInstance().openSession();
		try {
			Map<String, Object> map = new HashMap<>();
			map.put("num", num);
			map.put("passwd", passwd);
			result = session.selectOne("board.check_pwd", map);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (session != null)
				session.close();
		}
		return result;
	}

	public void update(BoardDTO dto) {
		SqlSession session = null;
		try {
			session = MybatisManager.getInstance().openSession();
			session.update("board.updage", dto);
			session.commit();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (session != null)
				session.close();
		}
	}

	public void delete(int num) {
		SqlSession session = null;
		try {
			session = MybatisManager.getInstance().openSession();
			session.delete("board.delete", num);
			session.commit();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (session != null)
				session.close();
		}
	}
}
