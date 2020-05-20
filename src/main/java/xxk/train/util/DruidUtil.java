package xxk.train.util;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

import com.alibaba.druid.pool.DruidDataSource;
import com.alibaba.druid.pool.DruidDataSourceFactory;

public class DruidUtil {
	    static DruidDataSource dataSource;
	    static {
	        Properties prop = new Properties();
	        try {
	            prop.load(DruidUtil.class.getClassLoader().getResourceAsStream("druid.properties"));
	            dataSource = (DruidDataSource)DruidDataSourceFactory.createDataSource(prop);
	        } catch (IOException e) {
	            e.printStackTrace();
	        } catch (Exception e) {
	            e.printStackTrace();
	        }
	    }
	    //启动
	    public static Connection getConn() {
	        try {
	            return dataSource.getConnection();
	        } catch (SQLException e) {
	            e.printStackTrace();
	        }
	        return null;
	    }
	public static void close(ResultSet rs,Statement stmt, PreparedStatement pstmt,Connection con) {
		if (rs!=null) {
			try {
				rs.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		if (stmt!=null) {
			try {
				stmt.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		if (pstmt!=null) {
			try {
				pstmt.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		if (con!=null) {
			try {
				con.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}
}
