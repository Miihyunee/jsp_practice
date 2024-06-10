package emp;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import common.DB;

public class EmpDAO {
	public void insert() {
		Connection conn = null;
		PreparedStatement pstmt = null;
		try {
			conn = DB.dbConn();
			conn.setAutoCommit(false); // 수동 커밋으로 변경
			long before = System.currentTimeMillis();
			String sql = "INSERT INTO emp2(empno, ename, deptno) VALUES (?,?,?)";
			pstmt = conn.prepareStatement(sql);
			for (int i = 1; i <= 100000; i++) {
				pstmt.setInt(1, i);
				pstmt.setString(2, "name" + i);
				pstmt.setInt(3, i);
				pstmt.executeUpdate();
			}
			long after = System.currentTimeMillis();
			conn.commit(); // 작업 확정
			conn.setAutoCommit(true);
			System.out.println("실행시간 : " + (after - before));
		} catch (Exception e) { // 에러 시 롤백처리
			e.printStackTrace();
			try {
				if (conn != null)
					conn.rollback();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		} finally { // 리소스 정리
			try {
				if (pstmt != null)
					pstmt.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
			try {
				if (conn != null)
					conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}

	public void insert_batch() {// 배치(일괄처리)
		Connection conn = null;
		PreparedStatement pstmt = null;
		try {
			conn = DB.dbConn();
			conn.setAutoCommit(false);
			String sql = "INSERT INTO emp2 (empno, ename, deptno) VALUES (?,?,?)";
			pstmt = conn.prepareStatement(sql);
			long before = System.currentTimeMillis();
			for (int i = 100001; i <= 200000; i++) {
				pstmt.setInt(1, i);
				pstmt.setString(2, "name" + i);
				pstmt.setInt(3, i);
				pstmt.addBatch(); // 배치 작업에 추가
			}
			pstmt.executeBatch(); // 배치 실행
			long after = System.currentTimeMillis();
			conn.commit();
			conn.setAutoCommit(true);
			System.out.println("배치 실행시간 : " + (after - before));
		} catch (Exception e) {
			e.printStackTrace();
			try {
				if (conn != null)
					conn.rollback();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		} finally {
			try {
				if (pstmt != null)
					pstmt.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
			try {
				if (conn != null)
					conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}
}
