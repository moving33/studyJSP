/*게시판 시스템의 DB 처리빈*/


package ch12.board;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class BoardDBBean {

    //constructor -- singleTone

    private static BoardDBBean instance = new BoardDBBean(); // 싱글톤으로 instance 객체 생성 컴파일시 메모리에 생성

    public static BoardDBBean getInstance() { // db처리빈 을 사용시 하나의 객체만 사용

        return instance;
    }

    private BoardDBBean() { //다른 곳에서 접근 X
    }

    //connection pool get Method
    private Connection getConnection() throws Exception { //안에서 사용
        Context initCtx = new InitialContext();
        Context envCtx = (Context) initCtx.lookup("java:comp/env");
        DataSource ds = (DataSource) envCtx.lookup("jdbc/jsptest");
        return ds.getConnection();
    }

    //board insert <--- writePro.jsp 에서 사용

    public int insertArticle(BoardDataBean article) {
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        int x = 0;
        int number = 0;
        String sql = "";

        int num = article.getNum();
        int ref = article.getRef();
        int re_step = article.getRef_step();
        int re_level = article.getRe_level();

        try {
            conn = getConnection();
            pstmt = conn.prepareStatement("select max(num) from board");
            rs = pstmt.executeQuery();

            if (rs.next()) {
                number = rs.getInt(1) + 1; // 0부터 시작하니까.... +1
            } else {  // 첫번째 글이라는 의미
                number = 1;
            }

            if (num != 0) { //댓글 - 글의 글 번호를 가짐
                pstmt = conn.prepareStatement("UPDATE board SET re_step=re_step+1 WHERE ref=? and re_step >?");
                pstmt.setInt(1, ref);
                pstmt.setInt(2, re_step);
                pstmt.executeUpdate();
                re_step = re_step + 1;
                re_level = re_level + 1;
            } else { // 새글
                ref = number;
                re_step = 0;
                re_level = 0;
            }

            //글 추가 하기
            pstmt = conn.prepareStatement("INSERT INTO board(writer, subject, content, passwd, reg_date, ip, ref, re_step, re_level) " +
                    "VALUES (?,?,?,?,?,?,?,?,?)");
            pstmt.setString(1, article.getWriter());
            pstmt.setString(2, article.getSubject());
            pstmt.setString(3, article.getContent());
            pstmt.setString(4, article.getPasswd());
            pstmt.setTimestamp(5, article.getReg_date());
            pstmt.setString(6, article.getIp());
            pstmt.setInt(7, ref);
            pstmt.setInt(8, re_step);
            pstmt.setInt(9, re_level);
            pstmt.executeUpdate();

            x = 1; // 레코드 추가 성공

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (rs != null) {
                try {
                    rs.close();
                } catch (SQLException sqe) {
                }
            }
            if (pstmt != null) {
                try {
                    pstmt.close();
                } catch (SQLException sqe) {
                }
            }
            if (conn != null) {
                try {
                    conn.close();
                } catch (SQLException sqe) {
                }
            }
        }
        return x;
    }


    //board Table에 저장된 전체글의 수를 얻어냄 <---- list.jsp에서 사용
    public int getArticleCount(){

        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        int x= 0;

        try{
            conn = getConnection();

            pstmt = conn.prepareStatement("SELECT COUNT(*) FROM board");
            rs = pstmt.executeQuery();

            if(rs.next()){
                x=rs.getInt(1);
            }

        }catch (Exception e){
            e.printStackTrace();
        }finally {

        }
        if (rs != null) {
            try {
                rs.close();
            } catch (SQLException sqe) {
            }
        }
        if (pstmt != null) {
            try {
                pstmt.close();
            } catch (SQLException sqe) {
            }
        }
        if (conn != null) {
            try {
                conn.close();
            } catch (SQLException sqe) {
            }
        }


        return x;
    }

    //글의 목록을 가져옴 <--- list.jsp
    public List<BoardDataBean> getArticle(int start, int end) {
        List<BoardDataBean> articleList = null;
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        try {
            conn = getConnection();
            pstmt = conn.prepareStatement("SELECT * FROM board ORDER by ref desc , re_step asc limit ?,?");
            pstmt.setInt(1, start - 1);
            pstmt.setInt(2, end);
            rs = pstmt.executeQuery();

            if (rs.next()) {
                articleList = new ArrayList<BoardDataBean>(end);
                do {
                    BoardDataBean article = new BoardDataBean();
                    article.setNum(rs.getInt("num"));
                    article.setWriter(rs.getString("writer"));
                    article.setSubject(rs.getString("content"));
                    article.setPasswd(rs.getString("passwd"));
                    article.setReg_date(rs.getTimestamp("reg_date"));
                    article.setReadcount(rs.getInt("readcount"));
                    article.setRef(rs.getInt("ref"));
                    article.setRef_step(rs.getInt("re_step"));
                    article.setRe_level(rs.getInt("re_level"));
                    article.setIp(rs.getString("ip"));
                    articleList.add(article);
                } while (rs.next());

            }
        } catch (Exception e) {

        } finally {
            if (rs != null) {
                try {
                    rs.close();
                } catch (SQLException sqe) {
                }
            }
            if (pstmt != null) {
                try {
                    pstmt.close();
                } catch (SQLException sqe) {
                }
            }
            if (conn != null) {
                try {
                    conn.close();
                } catch (SQLException sqe) {
                }
            }
        }

        return articleList;
    }

    //글 수정 폼에서 사용할 글의 내용 <-- updateForm.jsp

    public BoardDataBean updateGetArticle(int num) {
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        BoardDataBean article = null;
        try {
            conn = getConnection();

            pstmt = conn.prepareStatement("SELECT from board WHERE num=?");
            pstmt.setInt(1, num);
            rs = pstmt.executeQuery();

            if (rs.next()) {
                article.setNum(rs.getInt("num"));
                article.setWriter(rs.getString("writer"));
                article.setSubject(rs.getString("content"));
                article.setPasswd(rs.getString("passwd"));
                article.setReg_date(rs.getTimestamp("reg_date"));
                article.setReadcount(rs.getInt("readcount"));
                article.setRef(rs.getInt("ref"));
                article.setRef_step(rs.getInt("re_step"));
                article.setRe_level(rs.getInt("re_level"));
                article.setIp(rs.getString("ip"));
            }

        } catch (Exception e) {
            e.printStackTrace();
        } finally {

            if (rs != null) {
                try {
                    rs.close();
                } catch (SQLException sqe) {
                }
            }
            if (pstmt != null) {
                try {
                    pstmt.close();
                } catch (SQLException sqe) {
                }
            }
            if (conn != null) {
                try {
                    conn.close();
                } catch (SQLException sqe) {
                }
            }

        }

        return article;

    }


    //글 수정 처리에서 사용 <-- updatePro.jsp
    public int updateArticle(BoardDataBean article) {
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        int x = -1;
        try {
            conn = getConnection();

            pstmt = conn.prepareStatement("SELECT passwd FROM board WHERE num=?");
            pstmt.setInt(1, article.getNum());
            rs = pstmt.executeQuery();

            if (rs.next()) {
                String dbpasswd = rs.getString("passwd");
                if (dbpasswd.equals(article.getPasswd())) {
                    pstmt = conn.prepareStatement("UPDATE board SET subject=?,content=? WHERE num=?");
                    pstmt.setString(1, article.getSubject());
                    pstmt.setString(2, article.getContent());
                    pstmt.setInt(3, article.getNum());
                    pstmt.executeUpdate();
                    x = 1;
                } else {
                    x = 0;
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {

            if (rs != null) {
                try {
                    rs.close();
                } catch (SQLException sqe) {
                }
            }
            if (pstmt != null) {
                try {
                    pstmt.close();
                } catch (SQLException sqe) {
                }
            }
            if (conn != null) {
                try {
                    conn.close();
                } catch (SQLException sqe) {
                }
            }

        }
        return x;
    }

    //글 삭제  처리시 사용 deletePro.jsp
    public int deleteArticle(int num, String passwd) {
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        int x = -1;

        try {
            conn = getConnection();
            pstmt = conn.prepareStatement("SELECT passwd FROM board WHERE num=?");
            pstmt.setInt(1, num);
            rs = pstmt.executeQuery();

            if (rs.next()) {
                String dbpasswd = rs.getString("passwd");
                if (dbpasswd.equals(passwd)) {
                    x = deleteArticleDB(num);
                } else {
                    x = 0; //비밀번호 틀림
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (rs != null) {
                try {
                    rs.close();
                } catch (SQLException sqe) {
                }
            }
            if (pstmt != null) {
                try {
                    pstmt.close();
                } catch (SQLException sqe) {
                }
            }
            if (conn != null) {
                try {
                    conn.close();
                } catch (SQLException sqe) {
                }
            }

        }
        return x;
    }

    //db에서 내용을 지우는 ...
    public int deleteArticleDB(int num) {
        Connection conn = null;
        PreparedStatement pstmt = null;
        int x = -1;
        try {
            conn = getConnection();
            pstmt = conn.prepareStatement("DELETE FROM board WHERE num=?");
            pstmt.setInt(1, num);
            pstmt.executeUpdate();
            x = 1;
        } catch (Exception ex) {
            ex.printStackTrace();
        } finally {
            if (pstmt != null) {
                try {
                    pstmt.close();
                } catch (SQLException sqe) {
                }
            }
            if (conn != null) {
                try {
                    conn.close();
                } catch (SQLException sqe) {
                }
            }

        }
        return x;
    }


}
