package mvc.action.board;

import mvc.action.CommandAction;
import mvc.model.BoardDAO;
import mvc.model.BoardVO;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class ContentAction implements CommandAction {
    @Override
    public String requestPro(HttpServletRequest req, HttpServletResponse resp) throws Throwable {
        int num  = Integer.parseInt(req.getParameter("num"));
        //해당 페이지 번호
        String pageNum = req.getParameter("pageNum");
        BoardDAO boardDAO = BoardDAO.getInstance();
        //선택한 글 가져오기
        BoardVO article = boardDAO.getArticle(num);
        //속성 적용
        req.setAttribute("num",new Integer(num));
        req.setAttribute("pageNum",new Integer(pageNum));
        req.setAttribute("article",article);

        return "/mvc/board/content.jsp";
    }
}

