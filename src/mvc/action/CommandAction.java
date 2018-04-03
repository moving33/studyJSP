package mvc.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public interface CommandAction {
    //요청 파라미터로 명령어를 전달하는 방식의 Super Interface
    public String requestPro(HttpServletRequest req, HttpServletResponse resp)throws Throwable;
}
