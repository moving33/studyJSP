package mvcMem.action;

import mvcMem.control.ActionForward;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class IndexAction implements Action {

    @Override
    public ActionForward execute(HttpServletRequest req, HttpServletResponse res) throws IOException {
        return new ActionForward("/mvcMem/index.jsp",false);
    }
}
