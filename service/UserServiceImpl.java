package service;

import dao.UserDao;
import dao.UserInfoDao;
import error.ErrorList;
import org.apache.ibatis.jdbc.Null;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import pojo.User;
import pojo.UserInfo;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

@Service("userServiceImpl")
@Transactional
public class UserServiceImpl implements UserService {
    @Autowired
    private UserDao userDao;
    @Autowired
    private UserInfoDao userInfoDao;

    public String register(User user, HttpSession session, Model model) {
        if(userDao.selectIfExistByUacot(user)>0){
            model.addAttribute("msg","注册失败,此账号已被注册，请使用别的账号");
            return "register";
        }
        if(userDao.selectIfExistByUname(user)>0){
            model.addAttribute("msg","注册失败,此用户名已被用户名，请使用别的用户名");
            return "register";
        }
        int ur=userDao.insertUser(user);        //user表插入结果
        int uir=userInfoDao.insertUserInfo(user);     //userInfo表插入结果
        if(ur>0&&uir>0){
            session.setAttribute("msg","注册成功");
            return "forward:/user/toLogin";
        }else{
            model.addAttribute("msg","注册失败");
            return "register";
        }
    }

    public String login(User user, HttpSession session, Model model) {
        int ap=userDao.selectIfExistByUacotAndUpass(user);
        if(ap>0){
            String username=userDao.selectUnameByUacot(user);
            session.setAttribute("username",username);
            return "forward:/homepage";
        }else{
            model.addAttribute("msg","登录失败,账号或密码错误");
            return "login";
        }
    }

    public String toUserInfo(HttpSession session){
        String username=(String) session.getAttribute("username");
        User user=new User();
        user.setUname(username);
        UserInfo userInfo=userInfoDao.selectAllByUserName(user);
        String uacot=userDao.selectUacotByUname(user);
        session.setAttribute("userInfo",userInfo);
        session.setAttribute("uacot",uacot);
        return "userInfo";
    }
}
