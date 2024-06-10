package common;

import java.sql.Connection;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class DB {
	// static 설정을 함으로써 다른 클래스에서도 DB.dbConn() 으로 사용가능함
	public static Connection dbConn() { // Connection : return type
		DataSource ds = null;
		Connection conn = null; // DB 접속

		// DB처리는 예외처리 필수
		try {
			// Context : context.xml 분석기
			Context ctx = new InitialContext();
			// lookup() : 조회 함수
			// lookup("java:comp/env/리소스태그명")
			ds = (DataSource) ctx.lookup("java:comp/env/oraDB");
			conn = ds.getConnection();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return conn;
	}
}
