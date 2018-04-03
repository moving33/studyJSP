package mvcMem.model;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
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
    //idCheck
    public boolean idCheck(String id){
        boolean result =true;
        Connection conn =null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        try{
            conn = getConnection();
            pstmt = conn.prepareStatement("SELECT * FROM student WHERE id=?");
            pstmt.setString(1,id);
            rs = pstmt.executeQuery();
            if(!rs.next()){result = false;}

        } catch (SQLException e) {
            e.printStackTrace();
        }finally {
            if(rs != null){try{rs.close();}catch (SQLException e2){}}
            if(pstmt != null){try{pstmt.close();}catch (SQLException e2){}}
            if(conn != null){try{conn.close();}catch (SQLException e2){}}
        }
        return result;
    }
    //insert student
    public boolean memberInsert(StudentVo vo){
        Connection conn = null;
        PreparedStatement psmt = null;
        boolean result = false;
        try{
            conn = getConnection();
            psmt = conn.prepareStatement("INSERT INTO student VALUES (?,?,?,?,?,?,?)");
            psmt.setString(1,vo.getId());
            psmt.setString(2,vo.getPass());
            psmt.setString(3,vo.getName());
            psmt.setString(4,vo.getPhone());
            psmt.setString(5,vo.getEmail());
            psmt.setString(6,vo.getAddress1());
            psmt.setString(7,vo.getAddress2());
            int x = psmt.executeUpdate();
            if(x == 1){
                result = true;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }finally {
            if(psmt != null){try{psmt.close();}catch (SQLException e2){}}
            if(conn != null){try{conn.close();}catch (SQLException e2){}}
        }
        return result;
    }

}
