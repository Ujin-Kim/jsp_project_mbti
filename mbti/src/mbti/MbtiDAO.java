package mbti;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;


public class MbtiDAO {

	private static final String DRIVER = "com.mysql.cj.jdbc.Driver";
	private static final String URL = "jdbc:mysql://localhost:3306/test?useUnicode=true&characterEncoding=utf8&serverTimezone=UTC"; //mysql jdbc driver 설정 검색해서
	private static final String USER = "root";
	private static final String PWD = "root";
	
	//연결 메서드
	public Connection getConnection() {
		Connection conn = null;
		try{
			Class.forName(DRIVER);
			conn = DriverManager.getConnection(URL, USER, PWD);
		} catch (Exception e) {
			System.out.println("getConnection 에러 : " + e);
		}
		return conn;
	}
	
	//count Mbti list
	public int countList(String id) {
		int cnt = 0;
		
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		String sql = "SELECT COUNT(*) cnt FROM history where id=?";
		try {
			conn = getConnection();
			ps = conn.prepareStatement(sql);
			ps.setString(1, id);
			rs = ps.executeQuery();
			if(rs.next()) {
				cnt = rs.getInt("cnt"); //cnt = rs.getInt(1) -첫번째 결과를 받아온다는 의미
			}
		} catch(Exception e) {
			System.out.println("countBoard 에러 : " + e);
		} finally {
			close(conn, ps, rs);
		}
		
		return cnt;
		
	}
	
	//Mbti list 읽기
	public ArrayList<MbtiDTO> listMbti(int begin, int size){
		ArrayList<MbtiDTO> list = new ArrayList<MbtiDTO>();
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		String sql = "SELECT num, mbti, regdate FROM history ORDER BY num DESC LIMIT ?,?;";
		try {
			conn = getConnection();
			ps = conn.prepareStatement(sql);
			ps.setInt(1, begin);
			ps.setInt(2, size);
			rs = ps.executeQuery();
			while(rs.next()) {
				int num = rs.getInt("num");
				String mbti = rs.getString("mbti");
				Date regdate = rs.getTimestamp("regdate");
				MbtiDTO dto = new MbtiDTO();
				dto.setNum(num);
				dto.setMbti(mbti);
				dto.setRegdate(regdate);
				list.add(dto);
			}
		} catch (Exception e) {
			System.out.println("listBoard 에러 : " + e);
		} finally {
			close(conn, ps, rs);
		}
		return list;
	}
	
	//mbti 저장
	public int insertMbti(MbtiDTO dto) {
		int ok = 0;
		Connection conn = null;
		PreparedStatement ps = null;
		String sql = "INSERT INTO history(id, mbti) VALUES(?,?);";
		try {
			conn = getConnection();
			ps = conn.prepareStatement(sql);
			ps.setString(1, dto.getId());
			ps.setString(2, dto.getMbti());
			ok = ps.executeUpdate();
		} catch(Exception e) {
			System.out.println("insertMbti 에러 : " + e);
		} finally {
			close(conn, ps);
		}
		
		return ok;
	}
	
	
	//해제 메서드
	private void close(Connection conn, PreparedStatement ps, ResultSet rs) {
		if(rs != null) {
			try {
				rs.close();
			}catch(SQLException e) {
				e.printStackTrace();
			}
		}
		if(ps != null) {
			try {
				ps.close();
			}catch(SQLException e) {
				e.printStackTrace();
			}
		}
		if(conn != null) {
			try {
				conn.close();
			}catch(SQLException e) {
				e.printStackTrace();
			}
		}
	}
	private void close(Connection conn, PreparedStatement ps) {
		if(ps != null) {
			try {
				ps.close();
			}catch(SQLException e) {
				e.printStackTrace();
			}
		}
		if(conn != null) {
			try {
				conn.close();
			}catch(SQLException e) {
				e.printStackTrace();
			}
		}
	}
}
