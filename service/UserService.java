package service;

import org.springframework.ui.Model;
import pojo.User;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

public interface UserService {
    public String register(User user, HttpSession session, Model model);
    public String login(User user, HttpSession session, Model model);
    public String toUserInfo(HttpSession session);
}
