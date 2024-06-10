package shop;

import org.apache.ibatis.session.SqlSession;

import sqlmap.MybatisManager;

public class MemberDAO {
	public String login(MemberDTO dto) {
		SqlSession session = MybatisManager.getInstance().openSession();
		String name = session.selectOne("member.login", dto);
		return name;
	}
}
