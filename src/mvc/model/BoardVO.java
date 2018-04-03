/*게시판 저장 빈 객체 */



package mvc.model;

import java.sql.Timestamp;

public class BoardVO {

    private int num; //글 번호
    private String writer ; // 작성자
    private String subject; // 제목
    private String content;
    private String passwd;
    private Timestamp reg_date;
    private int readcount;  //조회수
    private String ip; // ip주소
    private int ref; // 글의 그룹 번호
    private int ref_step ; // 제목글과 답변글의 순서
    private int re_level; // 글 제목의 들여쓰기 순서

    public int getNum() {
        return num;
    }

    public void setNum(int num) {
        this.num = num;
    }

    public String getWriter() {
        return writer;
    }

    public void setWriter(String writer) {
        this.writer = writer;
    }

    public String getSubject() {
        return subject;
    }

    public void setSubject(String subject) {
        this.subject = subject;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getPasswd() {
        return passwd;
    }

    public void setPasswd(String passwd) {
        this.passwd = passwd;
    }

    public Timestamp getReg_date() {
        return reg_date;
    }

    public void setReg_date(Timestamp reg_date) {
        this.reg_date = reg_date;
    }

    public int getReadcount() {
        return readcount;
    }

    public void setReadcount(int readcount) {
        this.readcount = readcount;
    }

    public String getIp() {
        return ip;
    }

    public void setIp(String ip) {
        this.ip = ip;
    }

    public int getRef() {
        return ref;
    }

    public void setRef(int ref) {
        this.ref = ref;
    }

    public int getRef_step() {
        return ref_step;
    }

    public void setRef_step(int ref_step) {
        this.ref_step = ref_step;
    }

    public int getRe_level() {
        return re_level;
    }

    public void setRe_level(int re_level) {
        this.re_level = re_level;
    }
}
