package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import model.InterestDataBean;
import model.MyPageDataBean;

public class MypageDao {

	private static MypageDao instance = new MypageDao();

	public static MypageDao getInstance() {
		return instance;
	}

	private MypageDao() {
	}

	private Connection getConnection() throws Exception {
		Connection conn = null;
		try {
			String jdbcUrl = "jdbc:oracle:thin:@localhost:1521:orcl";
			String dbId = "users";
			String dbPass = "1111";
			Class.forName("oracle.jdbc.driver.OracleDriver");
			conn = DriverManager.getConnection(jdbcUrl, dbId, dbPass);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return conn;
	}

	public List<MyPageDataBean> getMyRoomList(String email) {
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		List<MyPageDataBean> list = null;
		try {
			conn = getConnection();
			ps = conn.prepareStatement("select * from classjoin where email=?");
			ps.setString(1, email);
			rs = ps.executeQuery();
			
			
			if (rs.next()) {
				
				list = new ArrayList<>();
				do {
					MyPageDataBean my = new MyPageDataBean();

					my.setLike_ca(rs.getInt("like_ca"));
					System.out.println("!!like_ca-->"+rs.getInt("like_ca"));
					my.setMeet_title(rs.getString("meet_title"));
					System.out.println("!!meet_title-->"+rs.getString("meet_title"));
					my.setMembercnt(rs.getInt("membercnt"));
					System.out.println("!!membercnt-->"+rs.getInt("membercnt"));
					my.setStatus(rs.getInt("status"));
					System.out.println("!!status-->"+rs.getInt("status"));
					my.setClassnum(rs.getInt("classnum"));
					System.out.println("!!classnum-->"+rs.getInt("classnum"));
					
					System.out.println("mymymy::::::"+my);
					
					list.add(my);
				} while (rs.next());
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (rs != null)
				try {
					rs.close();
				} catch (SQLException ex) {
				}
			if (ps != null)
				try {
					ps.close();
				} catch (SQLException ex) {
				}
			if (conn != null)
				try {
					conn.close();
				} catch (SQLException ex) {
				}
		}
		return list;

	}

	public List<Integer> getCount(String email) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ResultSet rs2 = null;
		List<Integer> list = new ArrayList<>();
		try {
			conn = getConnection();

			String sql = "select classnum from classjoin where email=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, email);
			rs = pstmt.executeQuery();

			if (rs.next()) {

				do {
					pstmt = conn.prepareStatement("select count(*) from classjoin where classnum=?");
					pstmt.setInt(1, rs.getInt("classnum"));
					rs2 = pstmt.executeQuery();

					if (rs2.next()) {
						list.add(rs2.getInt(1));
					}

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
		return list;
	}
}
