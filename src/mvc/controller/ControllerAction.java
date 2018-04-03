package mvc.controller;

import mvc.action.CommandAction;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
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

public class ControllerAction extends HttpServlet {
    //String = url, Object= Process Class
    private Map<String,Object> commandMap  = new HashMap<>();

    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
            requestPro(request,response);
    }

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
            requestPro(request,response);
    }

    //init시 메모리로 로딩하기

    @Override
    public void init(ServletConfig config) throws ServletException {

        String props = config.getInitParameter("propertyConfig");
        String path = config.getServletContext().getRealPath("/mvc/properties");
        Properties pr = new Properties();
        FileInputStream fileInputStream = null;

        //내용 읽어오기
        try {
            fileInputStream = new FileInputStream(new File(path,props));
            pr.load(fileInputStream);
        } catch (FileNotFoundException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }finally {
            if(fileInputStream != null){try{fileInputStream.close();} catch (IOException e) {
                e.printStackTrace();
            }
            }
        }

        //읽어드린 String 값들로 class를 생성

        Iterator<Object> iterator = pr.keySet().iterator(); // key 값들로 줄을세워 배열
        while(iterator.hasNext()){
            String command = (String)iterator.next();
            String className = pr.getProperty(command);

            Class commandClass = null;
            try {
                commandClass = Class.forName(className);
                Object commandInstance = commandClass.newInstance();
                commandMap.put(command,commandInstance);
            } catch (ClassNotFoundException e) {
                e.printStackTrace();
            } catch (IllegalAccessException e) {
                e.printStackTrace();
            } catch (InstantiationException e) {
                e.printStackTrace();
            }

        }

    }

    //사용자 요청을 분석해서 작업을 처리 -> .jsp 로 보내는 녀석

    private void requestPro(HttpServletRequest req,HttpServletResponse resp) throws ServletException, IOException {
        String view = null;
        CommandAction commandAction = null;
        String command = req.getRequestURI();
        if(command.indexOf(req.getContextPath()) == 0){
            command = command.substring(req.getContextPath().length());
            commandAction = (CommandAction)commandMap.get(command);
            try {
                view = commandAction.requestPro(req,resp);
            } catch (Throwable throwable) {
                throwable.printStackTrace();
            }
        }
        RequestDispatcher dispatcher = req.getRequestDispatcher(view);
        dispatcher.forward(req,resp);
    }
}
