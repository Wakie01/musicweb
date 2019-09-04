package controller;

import dao.UserDao;
import dao.UserInfoDao;
import error.ErrorList;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import pojo.User;
import pojo.UserInfo;
import service.UserService;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.Map;

@Controller
@RequestMapping("/user")
public class UserController {
    @Autowired
    private UserService userService;

    @RequestMapping("/toRegister")
    public String toRegister(HttpSession session){
        return "register";
    }
    @RequestMapping("/register")
    public String register(User user, HttpSession session, Model model){
        return userService.register(user,session,model);
    }
    @RequestMapping("/toLogin")
    public String toLogin(HttpSession session){
        return "login";
    }
    @RequestMapping("/login")
    public String login(User user, HttpSession session, Model model){
        return userService.login(user,session,model);
    }
    @RequestMapping("/userinfo")
    public String toUserInfo(HttpSession session){
        return userService.toUserInfo(session);
    }
    @RequestMapping("logout")
    public String logout(HttpSession session){
        session.invalidate();
        return "forward:/homepage";
    }
}
