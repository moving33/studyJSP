package mvcMem.control;

import mvcMem.action.Action;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "ControlServlet")
public class ControlServlet extends HttpServlet {

    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        super.service(req, resp);
        //character Encoding , response 방식설정
        req.setCharacterEncoding("utf-8");
        resp.setContentType("text/html;charset=utf-8");

        //명령 변수 설정및 페이지 이동
        String cmd = req.getParameter("cmd");

        if(cmd != null){
            ActionFactory factory = ActionFactory.getInstance();
            //요청한 명렁어에 맞는 action class 를 생성한다.
            Action action = factory.getAction(cmd);
            //요청에 대한 처리를 하고 그 처리한 정보를 사용자에게 보여줄 페이지의 값을 가져온다.
            ActionForward af = action.execute(req,resp);

            //true면 따로 넘겨줄 정보없이 페이지를 이동시키고
            if(af.isRedirect()){
                resp.sendRedirect(af.getUrl());
            }else{
                //false면 req에 저장된 내용을들을 응답할때까지 사용할수 있게 ,
                //서버에서 한번에 처리하기위헤 redirect로 넘기지 않고 서버에서 페이지를 이동시킨다.
                RequestDispatcher rd = req.getRequestDispatcher(af.getUrl());
                rd.forward(req,resp);
            }
        }else{//cmd에 값이 없다는건 잘못된 요청이란...
            PrintWriter out = resp.getWriter();
            out.println("<html>");
            out.println("<head><title>올바른 요청이 아닌걸요</title></head>");
            out.println("<h4>올바른 요청이 아닙니다");
            out.println("<h4>http://localhost:8080/mvcMem/member.mdo?cmd=요청키워드</h4>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
