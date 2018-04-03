package mvc.action.board;

import mvc.action.CommandAction;
import mvc.model.BoardDAO;
import mvc.model.BoardVO;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class UpdateFormAction implements CommandAction {
    @Override
    public String requestPro(HttpServletRequest req, HttpServletResponse resp) throws Throwable {

        int num = Integer.parseInt(req.getParameter("num"));
        String pageNum = req.getParameter("pageNum");
        BoardDAO boardDAO  = BoardDAO.getInstance();
        BoardVO boardVO = boardDAO.getArticle(num);

        //변경된내용
        boardVO.setIp(req.getRemoteAddr());
        boardVO.setSubject(req.getParameter("subject"));
        boardVO.setContent(req.getParameter("content"));

        int result = boardDAO.updateArticle(boardVO);

        req.setAttribute("result",new Integer(result));
        req.setAttribute("num",new Integer(num));
        req.setAttribute("pageNum",pageNum);
        return "/mvc/board/updatePro.jsp";
    }
}
