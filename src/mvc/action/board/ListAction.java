package mvc.action.board;

import mvc.action.CommandAction;
import mvc.model.BoardDAO;
import mvc.model.BoardVO;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.Collections;
import java.util.List;

public class ListAction implements CommandAction {
    @Override
    public String requestPro(HttpServletRequest req, HttpServletResponse resp) throws Throwable {
        String pageNum = req.getParameter("pageNum");
        if(pageNum == null){
            pageNum ="1";
        }
        int pageSize = 5; // 한페이지의 글의 개수
        int currentPage = Integer.valueOf(pageNum);
        int startRow = (currentPage -1 )* pageSize +1;
        int endRow = currentPage * pageSize; // 한페이지의 마지막 글번호
        System.out.println(startRow+" :startRow /"+endRow+" :endRow");
        int count = 0;  //전체 글의 개수
        int number = 0; //글 목록에 표시할 글번호

        List<BoardVO> voList = null;
        BoardDAO dao = BoardDAO.getInstance();
        count = dao.getArticleCount(); //전체 글의 개수
        if(count>0){
            voList = dao.getArticle(startRow,endRow);
        }else {
            voList = Collections.emptyList();
        }
        number = count - (currentPage-1)*pageSize;

        req.setAttribute("currentPage",new Integer(currentPage));
        req.setAttribute("startRow",new Integer(startRow));
        req.setAttribute("endRow",new Integer(endRow));
        req.setAttribute("count",new Integer(count));
        req.setAttribute("pageSize",new Integer(pageSize));
        req.setAttribute("number",new Integer(number));
        req.setAttribute("voList",voList);
        return "/mvc/board/list.jsp";

    }
}
