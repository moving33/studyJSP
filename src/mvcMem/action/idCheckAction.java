package mvcMem.action;

import mvcMem.control.ActionForward;
import mvcMem.model.StudentDAO;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class idCheckAction implements Action {
    @Override
    public ActionForward execute(HttpServletRequest req, HttpServletResponse res) throws IOException {
        String id = req.getParameter("id");
        StudentDAO dao = StudentDAO.getInstance();
        boolean check = dao.idCheck(id);
        System.out.println(check+": servlet");

        //받은 id request에 설정
        req.setAttribute("id",id);
        req.setAttribute("check",check);
        return new ActionForward("/mvcMem/idCheck.jsp",false);
    }
}
