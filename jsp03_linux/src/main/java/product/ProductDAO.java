package product;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import sqlmap.MybatisManager;

public class ProductDAO {

	public List<Map<String, Object>> list() {
		SqlSession session = MybatisManager.getInstance().openSession();
		List<Map<String, Object>> items = session.selectList("product.list");
		session.close();
		return items;
	}

	public void insert(Map<String, Object> map) {
		SqlSession session = MybatisManager.getInstance().openSession();
		// (쿼리 아이디, 실행에 필요한 자료)
		session.insert("product.insert", map);
		session.commit();
		session.close();
	}

	public Map<String, Object> detail(int product_code) {
		SqlSession session = MybatisManager.getInstance().openSession();
		Map<String, Object> map = session.selectOne("product.detail", product_code);
		session.close();
		return map;
	}

	public void update(Map<String, Object> map) {
		SqlSession session = MybatisManager.getInstance().openSession();
		session.update("product.update", map);
		session.commit();
		session.close();
	}

	public void delete(int product_code) {
		SqlSession session = MybatisManager.getInstance().openSession();
		session.delete("product.delete", product_code);
		session.commit();
		session.close();
	}

}
