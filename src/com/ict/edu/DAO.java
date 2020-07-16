package com.ict.edu;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class DAO {

	Connection conn;
	PreparedStatement pstmt;
	ResultSet rs;
	
	private static DAO dao = new DAO();
	
	public static DAO getInstance() {
		return dao;
	}
	
// 접속 메소드
	public Connection getConnection() {
		try {
			Class.forName("oracle.jdbc.OracleDriver");
			String url = "jdbc:oracle:thin:@203.236.220.76:1521:xe";
			String user = "c##sprite";
			String password = "7963";
			conn = DriverManager.getConnection(url, user, password);
		} catch (Exception e) {
			System.out.println(e);
		}
		return conn;
	}
	
// 조회 메소드
	
	public ArrayList<VO> getList() {
		ArrayList<VO> list = new ArrayList<VO>();
		try {
			conn = getConnection();
			String sql = "SELECT * FROM guestbook2 ORDER BY idx";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				VO vo = new VO();
				vo.setIdx(rs.getString("idx"));
				vo.setName(rs.getString("name"));
				vo.setSubject(rs.getString("subject"));
				vo.setContent(rs.getString("content"));
				vo.setFile_name(rs.getString("file_name"));
				vo.setEmail(rs.getString("email"));
				vo.setPwd(rs.getString("pwd"));
				vo.setRegdate(rs.getString("regdate"));
				
				list.add(vo);
			}
		} catch (Exception e) {
			System.out.println(e);
		} finally {
			try {
				rs.close();
				pstmt.close();
				conn.close();
			} catch (Exception e2) {
				System.out.println(e2);
			}
		}
		return list;
	}
	
// 작성 메소드
	
	public int getWrite(String name, String subject, String file_name, String email, String pwd, String content) {
		int result = 0;
		try {
			conn = getConnection();
			String sql = "INSERT INTO guestbook2 VALUES(guestbook_seq.nextval, ?, ?, ?, ?, ?, ?, sysdate)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, name);
			pstmt.setString(2, subject);
			pstmt.setString(3, content);
			pstmt.setString(4, file_name);
			pstmt.setString(5, email);
			pstmt.setString(6, pwd);
			result = pstmt.executeUpdate();
		} catch (Exception e) {
			System.out.println(e);
		} finally {
			try {
				pstmt.close();
				conn.close();
			} catch (Exception e2) {
				System.out.println(e2);
			}
		}
		return result;
	}
	
	public int getWrite(VO vo) {
		int result = 0;
		try {
			conn = getConnection();
			String sql = "INSERT INTO guestbook2 VALUES(guestbook_seq.nextval, ?, ?, ?, ?, ?, ?,sysdate)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, vo.getName());
			pstmt.setString(2, vo.getSubject());
			pstmt.setString(3, vo.getContent());
			pstmt.setString(4, vo.getFile_name());
			pstmt.setString(5, vo.getEmail());
			pstmt.setString(6, vo.getPwd());
			result = pstmt.executeUpdate();
		} catch (Exception e) {
			System.out.println(e);
		} finally {
			try {
				
			} catch (Exception e2) {
				System.out.println(e2);
			}
		}
		return result;
	}
	
// 상세 페이지 메소드
	public VO getOnelist(String idx) {
		VO vo = new VO();
		try {
			conn = getConnection();
			String sql = "SELECT * FROM guestbook2 where idx=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, idx);
			rs = pstmt.executeQuery();
			
			while (rs.next()) {
				vo.setIdx(rs.getString("idx"));
				vo.setName(rs.getString("name"));
				vo.setSubject(rs.getString("subject"));
				vo.setContent(rs.getString("content"));
				vo.setFile_name(rs.getString("file_name"));
				vo.setEmail(rs.getString("email"));
				vo.setPwd(rs.getString("pwd"));
				vo.setRegdate(rs.getString("regdate"));
			}
			
		} catch (Exception e) {
			System.out.println(e);
		} finally {
			try {
				rs.close();
				pstmt.close();
				conn.close();
			} catch (Exception e2) {
				System.out.println(e2);
			}
		}
		return vo;
	}
	
// 업데이트 메소드
	
	public int getUpdate(VO vo) {
		int result = 0;
		try {
			conn = getConnection();
			String sql = "UPDATE guestbook2 SET name=?, subject=?, content=?, file_name=?, email=? WHERE idx=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, vo.getName());
			pstmt.setString(2, vo.getSubject());
			pstmt.setString(3, vo.getContent());
			pstmt.setString(4, vo.getFile_name());
			pstmt.setString(5, vo.getEmail());
			pstmt.setString(6, vo.getIdx());
			
			result = pstmt.executeUpdate();
		} catch (Exception e) {
			System.out.println(e);
		} finally {
			try {
				pstmt.close();
				conn.close();
			} catch (Exception e2) {
				System.out.println(e2);
			}
		}
		return result;
	}

// 삭제 메소드
	public int getDelete(String idx) {
		int result = 0;
		try {
			conn = getConnection();
			String sql = "DELETE FROM guestbook2 WHERE idx = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, idx);
			result = pstmt.executeUpdate();
		} catch (Exception e) {
			System.out.println(e);
		} finally {
			try {
				pstmt.close();
				conn.close();
			} catch (Exception e2) {
				System.out.println(e2);
			}
		}
		return result;
	}
	
}
