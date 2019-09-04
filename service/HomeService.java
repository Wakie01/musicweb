package service;


import org.springframework.scheduling.support.SimpleTriggerContext;
import org.springframework.ui.Model;
import pojo.User;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

public interface HomeService {
    public String toHome(User user, HttpSession session, Model model);
    public String openMusicPanel(HttpSession session,Integer mid);
    public String like(HttpSession session, Integer mid,String from);
    public String dislike(HttpSession session,Integer mid,String from);
    public String allsongs(HttpSession session,HttpServletRequest request);
    public String listen(HttpSession session);
    public String search(String stex, String sopt, HttpSession session);
    public String topnew(HttpSession session);
    public String toplike(HttpSession session);
}
