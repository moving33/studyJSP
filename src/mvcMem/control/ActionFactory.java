package mvcMem.control;

import mvcMem.action.Action;
import mvcMem.action.IndexAction;
import mvcMem.action.regFormAction;

public class ActionFactory {
    private static ActionFactory ourInstance = new ActionFactory();

    public static ActionFactory getInstance() {
        return ourInstance;
    }

    private ActionFactory() {
    }

    //param 으로 들어오는 정보에 따른 개별 action.class 생성

    public Action getAction(String cmd){
        Action action = null;
        switch (cmd) {
            //index 첫화면
            case "index":
                action = new IndexAction();
                break;
            case "regForm":
                action = new regFormAction();
        }
        return action;
    }
}
