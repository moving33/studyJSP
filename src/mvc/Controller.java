package mvc;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.Properties;

public class Controller extends HttpServlet {
    private Map<String, Object> commandMap = new HashMap<>();

    public void init(ServletConfig config) throws ServletException {
        //propetyConfig의 주소값을 가져온다
        String props = config.getInitParameter("propertyConfig");
        Properties pr = new Properties();
        String path = config.getServletContext().getRealPath("/mvcMem/properties");
        FileInputStream f = null;
        System.out.println(props+"....."+path+" :init");

        try {
            f = new FileInputStream(new File(path,props));//경로,불러올파일명
            pr.load(f);
        } catch (FileNotFoundException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }finally {
            if( f != null){try{f.close();}catch (IOException ioe){}}
        }
        Iterator<Object> keyIterator = pr.keySet().iterator();
        while(keyIterator.hasNext()){
            String command = (String)keyIterator.next();
            String className = pr.getProperty(command);
            //properties에 저장된 문자열을 클래스로 만든다
            try {

                Class commandClass = Class.forName(className);
                Object commandInstance = commandClass.newInstance();// 해당 클래스의 객체를 생성
                commandMap.put(command,commandInstance); //property에 저장된 url 주소/해당클래스형태로 map에 저장

            } catch (ClassNotFoundException e) {
                e.printStackTrace();
            } catch (IllegalAccessException e) {
                e.printStackTrace();
            } catch (InstantiationException e) {
                e.printStackTrace();
            }

        }

    }

    @Override
    public void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        requestPro(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        requestPro(req, resp);
    }

    //사용자의 요청을 분석해 해당 작업을 처리
    private void requestPro(HttpServletRequest req,HttpServletResponse resp) throws ServletException, IOException {
        String view = null;
        CommandProcess com = null;
        String command = req.getRequestURI();
        System.out.println("contextPath :" +req.getContextPath());
        System.out.println("ReqiestURI :" +command);
        //indexOf method의 길이가 == 0 과 같다는건 그 uri의 전체 주소를 의미한다.
        if(command.indexOf(req.getContextPath())==0){
            //ContextPath의 길이만큼 command를 자르면 뒤쪽의 내용(요청 URI)만 남게 된다.
            command= command.substring(req.getContextPath().length());
        }
        //뒤쪽의 요청한 주소에 맞는 클래스를 꺼낸다.
        com = (CommandProcess)commandMap.get(command);
        try {
            view = com.requestPro(req, resp);
        } catch (Throwable throwable) {
            throwable.printStackTrace();
        }
        RequestDispatcher dispatcher = req.getRequestDispatcher(view);
        dispatcher.forward(req,resp);
    }
}































