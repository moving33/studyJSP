package mvc.action.board;

import mvc.action.CommandAction;
import mvc.model.BoardDAO;
import mvc.model.BoardVO;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.List;

public class SearchProAction implements CommandAction {
    @Override
    public String requestPro(HttpServletRequest req, HttpServletResponse resp) throws Throwable {
        req.setCharacterEncoding("utf-8");

        String pageNum = req.getParameter("pageNum");
        if(pageNum == null){
            pageNum ="1";
        }
        int pageSize = 5; // 한페이지의 글의 개수
        int currentPage = Integer.valueOf(pageNum);
        int startRow = (currentPage -1 )* pageSize +1;

        String option = req.getParameter("option");
        String query = req.getParameter("query");

        List<BoardVO> voList = null;
        BoardDAO boardDAO = BoardDAO.getInstance();
        voList = boardDAO.searchArticle(option, query, startRow);

        req.setAttribute("currentPage",new Integer(currentPage));
        req.setAttribute("startRow",new Integer(startRow));
        req.setAttribute("pageSize",new Integer(pageSize));
        req.setAttribute("voList",voList);
        //search문 확인 code
        int result = 1;
        if(voList.isEmpty()){
            result = 0;
        }
        req.setAttribute("search",new Integer(result));
        System.out.println(result);

        return "/mvc/board/list.jsp";

    }


}
