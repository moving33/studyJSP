package mvcMem.model;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;
import java.sql.Connection;
import java.sql.SQLException;

public class StudentDAO {
    private static StudentDAO ourInstance = new StudentDAO();

    public static StudentDAO getInstance() {
        return ourInstance;
    }

    private StudentDAO() {
    }

    //connection 객체 끌어오기
    private Connection getConnection(){
        Connection connection = null;
        try {
            Context initCtx = new InitialContext();
            Context envCtx = (Context) initCtx.lookup("java:comp/env");
            DataSource ds = (DataSource) envCtx.lookup("jdbc/jsptest");
            connection = ds.getConnection();
        }catch (NamingException ne){
            ne.printStackTrace();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return connection;
    }
    //test
    public void test(){
        Connection connection = getConnection();
        System.out.println("TEST성공");
    }

}
