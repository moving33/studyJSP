package mvc;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class MessageProcess implements CommandProcess {

    @Override
    public String requestPro(HttpServletRequest req, HttpServletResponse resp) throws Throwable {
        req.setAttribute("message","요청 피라미터로 명령어를 전달");
        return "/mvc/process.jsp";
    }
}
