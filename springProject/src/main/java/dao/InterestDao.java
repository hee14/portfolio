package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import model.InterestDataBean;

public class InterestDao {

	private static InterestDao instance = new InterestDao();

	public static InterestDao getInstance() {
		return instance;
	}

	private InterestDao() {
	}

	private Connection getConnection() throws Exception {
		Connection conn = null;
		try {
			String jdbcUrl = "jdbc:oracle:thin:@localhost:1521:xe";
			String dbId = "users";
			String dbPass = "1111";
			Class.forName("oracle.jdbc.driver.OracleDriver");
			conn = DriverManager.getConnection(jdbcUrl, dbId, dbPass);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return conn;
	}

	// 전체관심사 tit 가져오기
	public List<InterestDataBean> allgetTit(){
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<InterestDataBean> interestList = null;

		try {
			conn = getConnection();
			String sql = "select interestName from interest";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				interestList = new ArrayList<InterestDataBean>();
				do {
					InterestDataBean interTit = new InterestDataBean();
					interTit.setInterestName(rs.getString("interestName"));
					interestList.add(interTit);
				} while (rs.next());
			}
		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			if (rs != null)
				try {
					rs.close();
				} catch (SQLException ex) {
				}
			if (pstmt != null)
				try {
					pstmt.close();
				} catch (SQLException ex) {
				}
			if (conn != null)
				try {
					conn.close();
				} catch (SQLException ex) {
				}
		}
		return interestList;
	}

	// 전체관심사 tit 가져오기
	public List<InterestDataBean> getLikeSub(String checklist) throws Exception {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ResultSet rs2 = null;
		List<InterestDataBean> interestList = null;
		int likeNum = 0;

		try {
			conn = getConnection();
			String sql = "select interestNum from interest where interestName = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, checklist);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				likeNum = rs.getInt(1);
			}

			String sql2 = "select * from interest_sub where interNum = ?";
			pstmt = conn.prepareStatement(sql2);
			pstmt.setInt(1, likeNum);
			rs2 = pstmt.executeQuery();
			
			if (rs2.next()) {
				interestList = new ArrayList<InterestDataBean>();
				do {
					InterestDataBean interTit = new InterestDataBean();
					interTit.setInterNum(rs2.getString("interNum"));
					interTit.setIntersubNum(rs2.getString("interSubNum"));
					interTit.setInterestName(rs2.getString("interSubName"));
					interestList.add(interTit);
				} while (rs2.next());
			}
		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			if (rs != null)
				try {
					rs.close();
				} catch (SQLException ex) {
				}
			if (rs2 != null)
				try {
					rs2.close();
				} catch (SQLException ex) {
				}
			if (pstmt != null)
				try {
					pstmt.close();
				} catch (SQLException ex) {
				}
			if (conn != null)
				try {
					conn.close();
				} catch (SQLException ex) {
				}
		}
		return interestList;
	}
	
	
	// 회원 관심사 저장
	public void insertMemberLike(String memberLikeName, String name) throws Exception {

		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int total = 0;
		try {
			conn = getConnection();

			pstmt =conn.prepareStatement("select interNum, interSubNum from interest_sub where interSubName = ?");
			pstmt.setString(1, memberLikeName);
			rs = pstmt.executeQuery();
			if(rs.next()) { total = rs.getInt(1); }	
			
			String sql = "insert into memberLike values(memberLike_seq.nextval, ?, ?, ?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, name);
			pstmt.setString(2, rs.getString("internum"));
			pstmt.setString(3, rs.getString("intersubnum"));
			pstmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (rs != null) try { rs.close(); } catch (SQLException e) { }
			if (pstmt != null) try { pstmt.close(); } catch (SQLException e) { }
			if (conn != null) try { conn.close(); } catch (SQLException e) { }
		}

	}

}
