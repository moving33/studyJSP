//회원 관리 처리 DATA BEAN!





package ch11.logon;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;
import java.sql.Connection;

public class LogonDBBean {

    private static LogonDBBean instance = new LogonDBBean(); // 싱글톤으로 instance 객체 생성 컴파일시 메모리에 생성

    public static LogonDBBean getInstance() { // db처리빈 을 사용시 하나의 객체만 사용

        return instance;
    }

    private LogonDBBean() { //다른 곳에서 접근 X
    }

    //connection pool get Method
    private Connection getConnection() throws Exception { //안에서 사용
        Context initCtx = new InitialContext();
        Context envCtx = (Context) initCtx.lookup("java:comp/env");
        DataSource ds = (DataSource) envCtx.lookup("jdbc/jsptest");
        return ds.getConnection();
    }
}
