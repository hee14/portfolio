package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import model.RoomDataBean;

public class RoomDao {

	private static RoomDao instance = new RoomDao();

	public static RoomDao getInstance() {
		return instance;
	}

	private RoomDao() {
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

	public void RoomInsert(RoomDataBean Bean) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int number = 0;
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement("select nvl(max(num)+1,1) from hobbyclass");
			rs = pstmt.executeQuery();

			if (rs.next()) {
				number = rs.getInt(1);
			}

			pstmt = conn.prepareStatement("insert into hobbyclass values(?,?,?,?,?,?,?,?,?) ");
			pstmt.setInt(1, number);
			pstmt.setInt(2, Bean.getLike_ca());
			pstmt.setInt(3, Bean.getLike_sub());
			pstmt.setString(4, Bean.getMeet_title());
			pstmt.setString(5, Bean.getPhoto());
			pstmt.setString(6, Bean.getContent());
			pstmt.setString(7, Bean.getHost());
			pstmt.setInt(8, Bean.getMembercnt());
			pstmt.setString(9, Bean.getLocation());

			pstmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException e) {
					// TODO: handle exception
				}
			}
			if (conn != null) {
				try {
					conn.close();
				} catch (SQLException e) {
					// TODO: handle exception
				}
			}

		}

	}

	public List<RoomDataBean> getRoomList() {
		Connection conn = null;
		List<RoomDataBean> rList = new ArrayList<RoomDataBean>();
		ResultSet rs = null;
		PreparedStatement pstmt = null;
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement("select * from hobbyclass");
			rs = pstmt.executeQuery();

			if (rs.next()) {

				while (rs.next()) {

					RoomDataBean roomset = new RoomDataBean();
					roomset.setContent(rs.getString("content"));
					roomset.setHost(rs.getString("host"));
					roomset.setLike_ca(rs.getInt("like_ca"));
					roomset.setLike_sub(rs.getInt("like_sub"));
					roomset.setLocation(rs.getString("location"));
					roomset.setMeet_title(rs.getString("meet_title"));
					roomset.setMembercnt(rs.getInt("membercnt"));
					roomset.setNum(rs.getInt("num"));
					roomset.setPhoto(rs.getString("photo"));
					System.out.println(roomset);
					rList.add(roomset);
				}

			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException e) {
				}
			}
			if (conn != null) {
				try {
					conn.close();
				} catch (SQLException e) {
				}
			}
			if (rs != null) {
				try {
					conn.close();
				} catch (SQLException e) {
				}
			}
		}

		return rList;
	}

	public RoomDataBean getRoom(int num) {
		RoomDataBean room = new RoomDataBean();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			conn = getConnection();
			pstmt = conn.prepareStatement("select * from hobbyclass where num=?");
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				room.setPhoto(rs.getString("photo"));
				room.setMeet_title(rs.getString("meet_title"));
				room.setContent(rs.getString("content"));
				room.setLike_ca(rs.getInt("like_ca"));
				room.setNum(rs.getInt("num"));
				room.setMembercnt(rs.getInt("membercnt"));
			
			
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException e) {
				}
			}
			if (conn != null) {
				try {
					conn.close();
				} catch (SQLException e) {
				}
			}
			if (rs != null) {
				try {
					conn.close();
				} catch (SQLException e) {
				}
			}
		}
		return room;
	}

	public void RoomJoin(RoomDataBean Bean, String email, int i) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		int number = 0;
		try {
			conn = getConnection();
			
			if(Bean.getNum()==0){
			pstmt = conn.prepareStatement("select nvl(max(num)+1,1) from hobbyclass");
			rs = pstmt.executeQuery();

			if (rs.next()) {
				number = rs.getInt(1);
			}
			}
			pstmt = conn.prepareStatement("select * from member where email=?");
			pstmt.setString(1, email);
			rs = pstmt.executeQuery();

			if (rs.next()) {
					

			pstmt = conn.prepareStatement("insert into classjoin values(?,?,?,?,?,?,?,?,?,sysdate)");
			pstmt.setInt(1, Bean.getLike_ca());
			pstmt.setString(2, Bean.getMeet_title());
			pstmt.setString(3, email);
			pstmt.setString(4, rs.getString("gender"));
			pstmt.setString(5, rs.getString("name"));
			pstmt.setString(6, rs.getString("birthday"));
			pstmt.setInt(7, Bean.getNum());
			pstmt.setInt(8, Bean.getMembercnt());
			pstmt.setInt(9, i);

			pstmt.executeUpdate();
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException e) {
					// TODO: handle exception
				}
			}
			if (conn != null) {
				try {
					conn.close();
				} catch (SQLException e) {
					// TODO: handle exception
				}
			}

		}

		
	}

	public int check(int num, String email) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		int check = 0;
		
		try {
			conn = getConnection();
			pstmt =  conn.prepareStatement("select * from classjoin where email=? and classnum=?");
			pstmt.setString(1, email);
			pstmt.setInt(2, num);
			check = pstmt.executeUpdate();
			
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException e) {
					// TODO: handle exception
				}
			}
			if (conn != null) {
				try {
					conn.close();
				} catch (SQLException e) {
					// TODO: handle exception
				}
			}

		}
		
		
		return check;
	}

	public void RoomOut(String email, int num) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		try {
			conn = getConnection();
			pstmt =  conn.prepareStatement("delete classjoin where email=? and classnum=?");
			pstmt.setString(1, email);
			pstmt.setInt(2, num);
			pstmt.executeUpdate();
			
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException e) {
					// TODO: handle exception
				}
			}
			if (conn != null) {
				try {
					conn.close();
				} catch (SQLException e) {
					// TODO: handle exception
				}
			}

		}
		
		
	}

}
