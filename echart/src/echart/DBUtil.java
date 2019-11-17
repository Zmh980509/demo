package echart;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class DBUtil {
	public static String db_url = "jdbc:mysql://localhost:3306/test3?useUnicode=true&characterEncoding=utf8&serverTimezone=UTC";
	public static String db_user = "root";
	public static String db_pass = "123456";
	public static Connection getConnection() {
		Connection conn = null;
		
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");//加载驱动
			conn = DriverManager.getConnection(db_url, db_user, db_pass);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return conn;
	}
	
	
	/**
	 * 关闭连接
	 * @param state
	 * @param conn
	 */
	public static void close (Statement state, Connection conn) {
		if (state != null) {
			try {
				state.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		
		if (conn != null) {
			try {
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}
	
	public static void close (ResultSet rs, Statement state, Connection conn) {
		if (rs != null) {
			try {
				rs.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		
		if (state != null) {
			try {
				state.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		
		if (conn != null) {
			try {
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}

	public static void main(String[] args)throws SQLException {  //测试数据库是否连通
    	Connection conn = getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql ="select * from abc limit 3";
		pstmt = conn.prepareStatement(sql);
		rs = pstmt.executeQuery();
		System.out.println(getConnection());
		while(rs.next()){
			System.out.println("空");
		}

    	}

}
