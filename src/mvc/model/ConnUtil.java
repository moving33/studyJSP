/*DB Connection 을 얻어오는 유틸리티 클래스*/

package mvc.model;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;
import java.sql.Connection;
import java.sql.SQLException;

public class ConnUtil {
    private static DataSource ds;
    static {
        Context initCtx = null;
        try {
            initCtx = new InitialContext();
            Context envCtx = (Context) initCtx.lookup("java:comp/env");
            ds = (DataSource) envCtx.lookup("jdbc/jsptest");
        } catch (NamingException e) {
            e.printStackTrace();
        }

    }
    public static Connection getConnection()throws SQLException{
        return ds.getConnection();
    }
}
