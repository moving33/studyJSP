package mvc.action.board;

import mvc.action.CommandAction;
import mvc.model.BoardDAO;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class DeleteProAction implements CommandAction {
    @Override
    public String requestPro(HttpServletRequest req, HttpServletResponse resp) throws Throwable {
        req.setCharacterEncoding("utf-8");
        int num = Integer.parseInt(req.getParameter("num"));
        String pageNum = req.getParameter("pageNum");
        String pass = req.getParameter("pass");
        BoardDAO boardDAO = BoardDAO.getInstance();
        int result = boardDAO.deleteArticle(num,pass);

        req.setAttribute("result",new Integer(result));
        return "/mvc/board/deletePro.jsp";

    }
}
