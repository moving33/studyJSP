package mvcMem.action;

import mvcMem.control.ActionForward;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public interface Action {

    //인터페이스의 abstract method 정의
    public ActionForward execute(HttpServletRequest req,HttpServletResponse res)throws IOException;
}
