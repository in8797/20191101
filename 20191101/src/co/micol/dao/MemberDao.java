package co.micol.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;


import co.micol.dto.MemberDto;

public class MemberDao {
	private Connection conn;
	private PreparedStatement psmt;
	private ResultSet rs;

	private String driver = "oracle.jdbc.driver.OracleDriver";
	private String url = "jdbc:oracle:thin:@localhost:1521:xe";
	private String user = "micol";
	private String password = "1234";

	public MemberDao() {
		try {
			Class.forName(driver);
			conn = DriverManager.getConnection(url, user, password);
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		}
	}

	// 조회 구문 작성하기
	public ArrayList<MemberDto> select() { // 여러사람의 데이터를 확인
		ArrayList<MemberDto> list = new ArrayList<MemberDto>();
//		String sql="select * from member";
//		
//		try {
//			psmt=conn.prepareStatement(sql);
//		} catch (SQLException e) {
//			e.printStackTrace();
//		} finally {
//			close();
//		}
		
		return list;
	}

	public MemberDto select(String id) { // 한사람의 데이터를 확인(한건조회)
		MemberDto dto = new MemberDto();
		String sql = "select * from member where memberid= ?";
		try {
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, id);
			rs = psmt.executeQuery();
			if (rs.next()) {
				dto.setGrant(rs.getString("membergrant"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}

		return dto;
	}
	
	public String isLoginCheck(String id, String pw) {
		String grant = null;
		String sql = "select * from member where memberid=? and memberpw=?";
		try {
			psmt= conn.prepareStatement(sql);
			psmt.setString(1, id);
			psmt.setString(2, pw);
			rs = psmt.executeQuery();
			if (rs.next()) {
				grant = rs.getString("membergrant");
			}
		}catch (SQLException e) {
			
		}finally {
			close();
		}
		return grant;
	}

	public int insert(MemberDto dto) {
		int n = 0;
		// 추가구문 작성하기
		return n;
	}

	public int update(MemberDto dto) {
		int n = 0;
		// 갱신구문 작성하기
		return n;
	}

	public int delete(MemberDto dto) {
		int n = 0;
		// 삭제구문 작성하기
		return n;
	}

	private void close() {
		try {
			if (rs != null)
				rs.close();
			if (psmt != null)
				psmt.close();
			if (conn != null)
				conn.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
}
