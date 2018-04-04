package mvc.model;

import java.sql.*;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

public class BoardDAO {
    private static BoardDAO ourInstance = null;

    public static BoardDAO getInstance() {
        if (ourInstance == null) {
            synchronized (BoardDAO.class) {
                ourInstance = new BoardDAO();
            }
        }
        return ourInstance;
    }

    private BoardDAO() {
    }

    //list - count of BoardArticle
    public int getArticleCount() {
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        int x = 0;

        try {
            conn = ConnUtil.getConnection();
            pstmt = conn.prepareStatement("select count(*) from board");
            rs = pstmt.executeQuery();
            if (rs.next()) {
                x = rs.getInt(1);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            if (rs != null) {
                try {
                    rs.close();
                } catch (SQLException ex) {
                }
            }
            if (pstmt != null) {
                try {
                    pstmt.close();
                } catch (SQLException ex) {
                }
            }
            if (conn != null) {
                try {
                    conn.close();
                } catch (SQLException ex) {
                }
            }
        }

        return x;
    }

    //list - getArticle Type List<Collection>
    public List<BoardVO> getArticle(int start, int end) {
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        List<BoardVO> voList = null;
        try {
            conn = ConnUtil.getConnection();
            pstmt = conn.prepareStatement("SELECT * FROM board order by ref desc ,re_step asc limit ?,5");
            pstmt.setInt(1, start-1);
            rs = pstmt.executeQuery();
            if (rs.next()) {
                voList = new ArrayList<>();
                do {
                    BoardVO boardVO = new BoardVO();
                    boardVO.setNum(rs.getInt(1));
                    boardVO.setWriter(rs.getString(2));
                    boardVO.setSubject(rs.getString(3));
                    boardVO.setContent(rs.getString(4));
                    boardVO.setPasswd(rs.getString(5));
                    boardVO.setReg_date(rs.getTimestamp(6));
                    boardVO.setIp(rs.getString(7));
                    boardVO.setReadcount(rs.getInt(8));
                    boardVO.setRef(rs.getInt(9));
                    boardVO.setRef_step(rs.getInt(10));
                    boardVO.setRe_level(rs.getInt(11));
                    voList.add(boardVO);

                } while (rs.next());
            }

        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            if (rs != null) {
                try {
                    rs.close();
                } catch (SQLException ex) {
                }
            }
            if (pstmt != null) {
                try {
                    pstmt.close();
                } catch (SQLException ex) {
                }
            }
            if (conn != null) {
                try {
                    conn.close();
                } catch (SQLException ex) {
                }
            }
        }

        return voList;
    }

    //write - insert Article db
    public void insertArticle(BoardVO article) {
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        int num = article.getNum();
        int ref = article.getRef();
        int step = article.getRef_step();
        int level = article.getRe_level();
        int number = 0;

        try {
            conn = ConnUtil.getConnection();
            pstmt = conn.prepareStatement("select max(num) from board");
            rs = pstmt.executeQuery();
            if (rs.next()) {
                number = rs.getInt(1) + 1;
            } else {
                number = 1;
            }

            if (num != 0) {//답변 글일 경우
                pstmt = conn.prepareStatement("update board set re_step=re_step+1 " +
                        "where ref=? and re_step > ?");
                pstmt.setInt(1, ref);
                pstmt.setInt(2, step);
                pstmt.executeUpdate();
                step = step + 1;
                level = level + 1;
            } else { //새글 일 경우
                ref = number;
                step = 0;
                level = 0;


            }

            pstmt = conn.prepareStatement("insert into board(writer, subject, content, passwd, reg_date, ip, readcount, ref, re_step, re_level) " +
                    "values (?,?,?,?,?,?,?,?,?,?)");
            pstmt.setString(1,article.getWriter());
            pstmt.setString(2,article.getSubject());
            pstmt.setString(3,article.getContent());
            pstmt.setString(4,article.getPasswd());
            pstmt.setTimestamp(5,article.getReg_date());
            pstmt.setString(6,article.getIp());
            pstmt.setInt(7,article.getReadcount());
            pstmt.setInt(8,ref);
            pstmt.setInt(9,step);
            pstmt.setInt(10,level);

            pstmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }finally {
            if (rs != null) {
                try {
                    rs.close();
                } catch (SQLException ex) {
                }
            }
            if (pstmt != null) {
                try {
                    pstmt.close();
                } catch (SQLException ex) {
                }
            }
            if (conn != null) {
                try {
                    conn.close();
                } catch (SQLException ex) {
                }
            }
        }
    }
    //view - selectArticle
    public BoardVO getArticle(int num){
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        BoardVO boardVO = null;

        try {
            conn = ConnUtil.getConnection();
            pstmt = conn.prepareStatement("update board set readcount=readcount+1 where num=?");
            pstmt.setInt(1,num);
            pstmt.executeUpdate();

            pstmt = conn.prepareStatement("select * from board where num=?");
            pstmt.setInt(1,num);
            rs = pstmt.executeQuery();
            if(rs.next()){
                boardVO = new BoardVO();
                boardVO.setNum(rs.getInt(1));
                boardVO.setWriter(rs.getString(2));
                boardVO.setSubject(rs.getString(3));
                boardVO.setContent(rs.getString(4));
                boardVO.setPasswd(rs.getString(5));
                boardVO.setReg_date(rs.getTimestamp(6));
                boardVO.setIp(rs.getString(7));
                boardVO.setReadcount(rs.getInt(8));
                boardVO.setRef(rs.getInt(9));
                boardVO.setRef_step(rs.getInt(10));
                boardVO.setRe_level(rs.getInt(11));
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }finally {
            if (rs != null) {
                try {
                    rs.close();
                } catch (SQLException ex) {
                }
            }
            if (pstmt != null) {
                try {
                    pstmt.close();
                } catch (SQLException ex) {
                }
            }
            if (conn != null) {
                try {
                    conn.close();
                } catch (SQLException ex) {
                }
            }
        }

        return boardVO;
    }
    //update - update Article db
    public int updateArticle(BoardVO article){
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        String dbpasswd = "";
        int result = -1;

        try {
            conn = ConnUtil.getConnection();
            pstmt = conn.prepareStatement("select passwd from board where num = ?");
            pstmt.setInt(1,article.getNum());
            rs = pstmt.executeQuery();
            if(rs.next()){
                dbpasswd = rs.getString("passwd");
                if(dbpasswd.equals(article.getPasswd())){
                    pstmt = conn.prepareStatement("update board set subject=?,content=?,reg_date=? where num=?");
                    pstmt.setString(1,article.getSubject());
                    pstmt.setString(2,article.getContent());
                    pstmt.setTimestamp(3,new Timestamp(System.currentTimeMillis()));
                    pstmt.setInt(4,article.getNum());
                    pstmt.executeUpdate();
                    result = 1;
                }else{
                    result = 0;
                }

            }
        } catch (SQLException e) {
            e.printStackTrace();
        }finally {
            if (rs != null) {
                try {
                    rs.close();
                } catch (SQLException ex) {
                }
            }
            if (pstmt != null) {
                try {
                    pstmt.close();
                } catch (SQLException ex) {
                }
            }
            if (conn != null) {
                try {
                    conn.close();
                } catch (SQLException ex) {
                }
            }
        }

        return result;


    }

    //delete - article

    public int deleteArticle(int num,String pass){
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        String dbpasswd = "";
        int result = -1;

        try {
            conn = ConnUtil.getConnection();
            pstmt = conn.prepareStatement("select passwd from board where num = ?");
            pstmt.setInt(1,num);
            rs = pstmt.executeQuery();
            if(rs.next()){
                 dbpasswd = rs.getString("passwd");
                if(dbpasswd.equals(pass)){
                    pstmt = conn.prepareStatement("delete from board where num=?");
                    pstmt.setInt(1,num);
                    pstmt.executeUpdate();
                    result = 1;
                }else {
                    result = 0;
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }finally {
            if (rs != null) {
                try {
                    rs.close();
                } catch (SQLException ex) {
                }
            }
            if (pstmt != null) {
                try {
                    pstmt.close();
                } catch (SQLException ex) {
                }
            }
            if (conn != null) {
                try {
                    conn.close();
                } catch (SQLException ex) {
                }
            }
        }
        return result;
    }

    //search
    public List<BoardVO> searchArticle(String option,String query,int start){
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        List<BoardVO> voList = null;
        String dbQuery = "%"+query+"%";
        try {
            conn = ConnUtil.getConnection();
            if(option.equals("writer")) {
                pstmt = conn.prepareStatement("select * from board where writer like ? order by ref desc ,re_step asc limit ?,5");
            }
            if(option.equals("subject")){
                pstmt = conn.prepareStatement("select * from board where subject like ? order by ref desc ,re_step asc limit ?,5");

            }
                pstmt.setString(1,dbQuery);
                pstmt.setInt(2,start-1);
                rs = pstmt.executeQuery();
                if(rs.next()){
                    voList = new ArrayList<>();
                    do{
                        BoardVO boardVO = new BoardVO();
                        boardVO.setNum(rs.getInt(1));
                        boardVO.setWriter(rs.getString(2));
                        boardVO.setSubject(rs.getString(3));
                        boardVO.setContent(rs.getString(4));
                        boardVO.setPasswd(rs.getString(5));
                        boardVO.setReg_date(rs.getTimestamp(6));
                        boardVO.setIp(rs.getString(7));
                        boardVO.setReadcount(rs.getInt(8));
                        boardVO.setRef(rs.getInt(9));
                        boardVO.setRef_step(rs.getInt(10));
                        boardVO.setRe_level(rs.getInt(11));
                        voList.add(boardVO);
                    }while(rs.next());
                }else{
                    voList = Collections.emptyList();
                }

        } catch (SQLException e) {
            e.printStackTrace();
        }finally {
            if (rs != null) {
                try {
                    rs.close();
                } catch (SQLException ex) {
                }
            }
            if (pstmt != null) {
                try {
                    pstmt.close();
                } catch (SQLException ex) {
                }
            }
            if (conn != null) {
                try {
                    conn.close();
                } catch (SQLException ex) {
                }
            }
        }
        return voList;
    }

    //- Article search count
    public int getSearchArticleCount(String option,String query) {
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        String dbQuery = "%"+query+"%";
        int x = 0;

        try {
            conn = ConnUtil.getConnection();
            if(option.equals("writer")) {
                pstmt = conn.prepareStatement("select count(*) from board where writer like ?");
            }
            if(option.equals("subject")){
                pstmt = conn.prepareStatement("select count(*) from board where subject like ?");
            }
            pstmt.setString(1,dbQuery);
            rs = pstmt.executeQuery();
            if (rs.next()) {
                x = rs.getInt(1);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            if (rs != null) {
                try {
                    rs.close();
                } catch (SQLException ex) {
                }
            }
            if (pstmt != null) {
                try {
                    pstmt.close();
                } catch (SQLException ex) {
                }
            }
            if (conn != null) {
                try {
                    conn.close();
                } catch (SQLException ex) {
                }
            }
        }

        return x;
    }


}
