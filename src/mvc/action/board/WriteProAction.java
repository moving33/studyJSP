package mvc.action.board;

import mvc.action.CommandAction;
import mvc.model.BoardDAO;
import mvc.model.BoardVO;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.Timestamp;

public class WriteProAction implements CommandAction{
    @Override
    public String requestPro(HttpServletRequest req, HttpServletResponse resp) throws Throwable {
        req.setCharacterEncoding("utf-8");
        System.out.println(req.getParameter("ref")+" :ref ,"+req.getParameter("step")+" :step ," +req.getParameter("level")+": level");
        BoardVO article = new BoardVO();
        article.setNum(Integer.parseInt(req.getParameter("num")));
        article.setWriter(req.getParameter("writer"));
        article.setContent(req.getParameter("content"));
        article.setSubject(req.getParameter("subject"));
        article.setPasswd(req.getParameter("passwd"));
        article.setReg_date(new Timestamp(System.currentTimeMillis()));
        article.setRef(Integer.parseInt(req.getParameter("ref")));
        article.setRef_step(Integer.parseInt(req.getParameter("step")));
        article.setRe_level(Integer.parseInt(req.getParameter("level")));
        article.setIp(req.getRemoteAddr());
        BoardDAO boardDAO  = BoardDAO.getInstance();
        boardDAO.insertArticle(article);
        return "/mvc/board/writePro.jsp";
    }
}
