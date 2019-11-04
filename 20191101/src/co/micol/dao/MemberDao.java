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
		String sql = "select * from member";
		MemberDto dto;
		try {
			psmt = conn.prepareStatement(sql);
			rs = psmt.executeQuery();
			while (rs.next()) {
				dto = new MemberDto(); // dto 초기화 시킴.
				dto.setId(rs.getString("memberid"));
				dto.setName(rs.getString("membername"));
				dto.setGrant(rs.getString("membergrant"));
				dto.setDate(rs.getDate("memberenterdate"));
				dto.setAddr(rs.getString("memberaddr"));
				list.add(dto); // 리스트에 추가한다.
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}

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
				dto.setId(rs.getString("memberid"));
				dto.setName(rs.getString("membername"));
				dto.setPw(rs.getString("memberpw"));
				dto.setGrant(rs.getString("membergrant"));
				dto.setDate(rs.getDate("memberenterDate"));
				dto.setAddr(rs.getString("memberaddr"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}

		return dto;
	}

	public String isLoginCheck(String id, String pw) { // login 체크
		String grant = null;
		String sql = "select * from member where memberid=? and memberpw=?";
		try {
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, id);
			psmt.setString(2, pw);
			rs = psmt.executeQuery();
			if (rs.next()) {
				grant = rs.getString("membergrant");
			}
		} catch (SQLException e) {

		} finally {
			close();
		}
		return grant;
	}

	public int insert(MemberDto dto) { // DB 회원입력
		int n = 0;
		String sql = "insert into member(memberid,memberpw,membername,memberaddr) values(?,?,?,?)";

		try {
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, dto.getId());
			psmt.setString(2, dto.getPw());
			psmt.setString(3, dto.getName());
			psmt.setString(4, dto.getAddr());
			n = psmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return n;
	}

	public int update(MemberDto dto) {
		int n = 0;
		// 수정(변경)구문 작성하기
		String sql = "update member set membername=? , memberaddr= ? where memberid=?";
		try {
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, dto.getName());
			psmt.setString(2, dto.getAddr());
			psmt.setString(3, dto.getId());
			System.out.println(dto.getName());
			System.out.println(dto.getAddr());
			System.out.println(dto.getId());
			n = psmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return n;
	}

	public int delete(MemberDto dto) { //
		int n = 0;
		// 삭제구문 작성하기
		String sql = "delete from member where memberid = ?";
			
		try {
			psmt = conn.prepareStatement(sql);
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return n;
	}

	public boolean isIdCheck(String id) { // 아이디 중복 체크
		boolean b = true; // 존재하지 않으면 true
		String sql = "select memberid from member where memberid =?";

		try {

			psmt = conn.prepareStatement(sql);
			psmt.setString(1, id);
			rs = psmt.executeQuery();
			if (rs.next()) {
				b = false; // 존재하면 않으면 false
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return b;
	}

	private void close() { // 닫아줄 때 역순으로 닫아줌.
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
