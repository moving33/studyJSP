package mvc.action.board;

import mvc.action.CommandAction;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class WriteFormAction implements CommandAction {
    @Override
    public String requestPro(HttpServletRequest req, HttpServletResponse resp) throws Throwable {
        int num=0;
        int ref=1;
        int ref_step=0;
        int re_level=0;
        int re = 0;
        if(req.getParameter("num") != null){
            num = Integer.parseInt(req.getParameter("num"));
            ref = Integer.parseInt(req.getParameter("ref"));
            ref_step = Integer.parseInt(req.getParameter("ref_step"));
            re_level = Integer.parseInt(req.getParameter("re_level"));
            re = Integer.parseInt(req.getParameter("re"));
        }

        //view에서 사용할 속성

        req.setAttribute("num",new Integer(num));
        req.setAttribute("ref",new Integer(ref));
        req.setAttribute("ref_step",new Integer(ref_step));
        req.setAttribute("re_level",new Integer(re_level));
        req.setAttribute("re",new Integer(re));

        return "/mvc/board/writeForm.jsp";
    }
}
