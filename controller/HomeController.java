package controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import pojo.User;
import service.HomeService;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

@Controller
public class HomeController {
    @Autowired
    private HomeService homeService;
    @RequestMapping("/homepage")
    public String toHome(User user, HttpSession session, Model model){

        return homeService.toHome(user,session,model);
    }
    @RequestMapping("/musicpanel")
    public String openMusicPanel(HttpSession session,Integer mid){
        return homeService.openMusicPanel(session,mid);
    }
    @RequestMapping("/like")
    public String like(HttpSession session,Integer mid,String from){
        return homeService.like(session,mid,from);
    }
    @RequestMapping("/dislike")
    public String dislike(HttpSession session,Integer mid,String from){
        return homeService.dislike(session,mid,from);
    }
    @RequestMapping("/allsongs")
    public String allsongs(HttpSession session,HttpServletRequest request){
        return homeService.allsongs(session,request);
    }
    @RequestMapping("/listen")
    public String listen(HttpSession session){
        return homeService.listen(session);
    }
    @RequestMapping("/search")
    public String search(@RequestParam String stex, @RequestParam String sopt, HttpSession session){
        return homeService.search(stex,sopt,session);
    }
    @RequestMapping("/topnew")
    public String topnew(HttpSession session){
        return homeService.topnew(session);
    }
    @RequestMapping("/toplike")
    public String toplike(HttpSession session){
        return homeService.toplike(session);
    }
}
