package mvcMem.action;

import mvcMem.control.ActionForward;
import mvcMem.model.StudentDAO;
import mvcMem.model.StudentVo;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class RegProcAction implements Action {
    @Override
    public ActionForward execute(HttpServletRequest req, HttpServletResponse res) throws IOException {
        req.setCharacterEncoding("utf-8");
        StudentDAO studentDAO = StudentDAO.getInstance();
        StudentVo vo = new StudentVo(
                req.getParameter("id"),
                req.getParameter("pass"),
                req.getParameter("name"),
                req.getParameter("phone"),
                req.getParameter("email"),
                req.getParameter("address1"),
                req.getParameter("address2")
        );
        boolean result = studentDAO.memberInsert(vo);
        req.setAttribute("result",result);
        return new ActionForward("mvcMem/regProc.jsp",false);
    }
}
