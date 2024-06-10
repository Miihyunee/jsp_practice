package memo;

import java.util.Date;
import java.util.List;

import org.hibernate.Session;

import config.HibernateManager;

public class MemoDAO {
	public List<MemoDTO> listMemo(String searchkey, String search) {
		// Hibernate 세션
		Session session = HibernateManager.getFactory().openSession();
		String sql = "SELECT idx, writer, memo, post_date FROM memo";
		if (searchkey.equals("writer_memo")) {
			// :변수 → 파라미터
			sql += " WHERE writer LIKE :search OR memo LIKE :search";
		} else {
			sql += " WHERE " + searchkey + " LIKE :search";
		}
		sql += " ORDER BY idx DESC";
		// createNativeQuery : SQL을 직접 실행
		List list = session.createNativeQuery(sql, MemoDTO.class).setParameter("search", "%" + search + "%")
				.getResultList();
		// 세션 종료
		session.close();
		return list;
	}

	public void deleteMemo(int idx) {
		Session session = HibernateManager.getFactory().openSession();
		// 트랜잭션 실행 시작
		session.beginTransaction();
		MemoDTO dto = new MemoDTO();
		dto.setIdx(idx);
		// Delete Query 생성
		session.delete(dto);
		session.getTransaction().commit();
		session.close();
	}

	public void insertMemo(MemoDTO dto) {
		// Hibernate 실행 객체
		Session session = HibernateManager.getFactory().openSession();
		// 트랜잭션 실행 시작
		session.beginTransaction();
		// Insert Query 생성
		session.save(dto);
		// 트랜잭션 완료
		session.getTransaction().commit();
		session.close();
	}

	public void updateMemo(MemoDTO dto) {
		Session session = HibernateManager.getFactory().openSession();
		session.beginTransaction();
		// 날짜 데이터는 현재 날짜로 입력
		dto.setPost_date(new Date());
		// Update Query 생성
		session.update(dto);
		session.getTransaction().commit();
		session.close();
	}

	public MemoDTO viewMemo(int idx) {
		Session session = HibernateManager.getFactory().openSession();
		// MemoDTO.class : memo 테이블
		MemoDTO dto = (MemoDTO) session.get(MemoDTO.class, idx);
		session.close();
		return dto;
	}
}
