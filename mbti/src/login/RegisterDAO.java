package login;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
public class RegisterDAO {
	
	private DBConnectionMgr pool = null;
	
	public RegisterDAO() {
		try {
			pool = DBConnectionMgr.getInstance(); //싱글톤패턴, new해서 만들지않는다. 단하나의 인스턴스만
		}
		catch(Exception e) {
			System.out.println("pool 얻기 에러:" + e);
		}
	}//생성자
	
	//연결 메서드
	public Connection getConnection() {
		Connection conn = null;
		try {
			conn = pool.getConnection();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return conn;
	}
	
	//로그인체크
	public boolean loginCheck(String id, String pwd) {
		boolean check = false;
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		try {
			conn = getConnection();
			String sql = "select count(*) cnt from login where id=? and pwd=?";
			ps = conn.prepareStatement(sql);
			//?를 채우는 코드
			ps.setString(1, id);
			ps.setString(2, pwd);
			rs = ps.executeQuery();
			if(rs.next()) {
				int cnt = rs.getInt(1);
				if(cnt == 1) {
					check = true;
				}
			}
		} catch(Exception e) {
			System.out.println("loginCheck 에러:" + e);
		} finally {
			close(conn, ps, rs);
		}
		return check;
	}
	
	//아이디 중복 체크
	public boolean checkId(RegisterDTO dto) {
		boolean check = true;
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		try {
			conn = getConnection();
			String sql = "select count(*) cnt from login where id=?";
			ps = conn.prepareStatement(sql);
			ps.setString(1, dto.getId());
			rs = ps.executeQuery();
			if(rs.next()) {
				int cnt = rs.getInt(1);
				if(cnt == 1) {
					check = false;
				}
			}
		} catch(Exception e) {
			System.out.println("loginCheck 에러:" + e);
		} finally {
			close(conn, ps, rs);
		}
		return check;
	}
	
	//아이디 저장
	public int insertId(RegisterDTO dto) {
		int ok = 0;
		Connection conn = null;
		PreparedStatement ps = null;
		String sql = "INSERT INTO login(id, pwd) VALUES(?,?);";
		try {
			conn = getConnection();
			ps = conn.prepareStatement(sql);
			ps.setString(1, dto.getId());
			ps.setString(2, dto.getPwd());
			ok = ps.executeUpdate();
		} catch(Exception e) {
			System.out.println("insertId 에러 : " + e);
		} finally {
			close(conn, ps);
		}
		return ok;
	}
	
	//해제 메서드
	private void close(Connection conn, PreparedStatement ps, ResultSet rs) {
		pool.freeConnection(conn,ps,rs);
	}
	//해제 메서드2
	private void close(Connection conn, PreparedStatement ps) {
		pool.freeConnection(conn,ps);
	}
}
