package service;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import dao.MusicInfoDao;
import dao.UserInfoDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import pojo.MusicInfo;
import pojo.User;
import pojo.UserInfo;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;

@Service
public class HomeServiceImpl implements HomeService {
    @Autowired
    private MusicInfoDao musicInfoDao;
    public String toHome(User user, HttpSession session, Model model) {
        List<MusicInfo> musicInfoList=musicInfoDao.selectTop10();
        session.setAttribute("musicInfoList",musicInfoList);
        return "homepage";
    }

    public String openMusicPanel(HttpSession session,Integer mid){
        MusicInfo musicInfo=new MusicInfo();
        musicInfo.setMid(mid);
        musicInfo=musicInfoDao.selectMusicInfoByMid(musicInfo);
        session.setAttribute("musicInfo",musicInfo);
        return "musicpanel";
    }

    public String like(HttpSession session, Integer mid,String from) {
        MusicInfo musicInfo=new MusicInfo();
        musicInfo.setMid(mid);
        musicInfoDao.updateLike(musicInfo);
        if(from.contentEquals("allsongs")){
            return "forward:/allsongs";
        }else{
            return "forward:/homepage";
        }
    }
    public String dislike(HttpSession session,Integer mid,String from) {
        MusicInfo musicInfo=new MusicInfo();
        musicInfo.setMid(mid);
        musicInfoDao.updateDislike(musicInfo);
        if(from.contentEquals("allsongs")){
            return "forward:/allsongs";
        }else{
            return "forward:/homepage";
        }
    }

//    System.out.println("总数量：" + page.getTotal());
//    System.out.println("当前页查询记录：" + page.getList().size());
//    System.out.println("当前页码：" + page.getPageNum());
//    System.out.println("每页显示数量：" + page.getPageSize());
//    System.out.println("总页：" + page.getPages());

    public String allsongs(HttpSession session,HttpServletRequest request){
        int page=1,size=10;
        if(request.getParameter("page")!=null){
            page=Integer.parseInt(request.getParameter("page"));
        }
        PageHelper.startPage(1,size);
        List<MusicInfo> musicInfoList=musicInfoDao.selectAll();
        PageInfo<MusicInfo> pageInfo=new PageInfo<MusicInfo>(musicInfoList);
        if(page==pageInfo.getPages()){
            size=(int) pageInfo.getTotal()-(page-1)*size;
        }
        PageHelper.startPage(page,size);
        musicInfoList=musicInfoDao.selectAll();
        session.setAttribute("musicInfoList",musicInfoList);
        session.setAttribute("pageInfo",pageInfo);
        return "allsongs";
    }

    public String listen(HttpSession session){
        MusicInfo musicInfo=(MusicInfo) session.getAttribute("musicInfo");
        musicInfoDao.updatePlayNum(musicInfo);
        String mlocal=musicInfo.getMloca().substring(3);
        System.out.println("mlocal:"+mlocal);
        session.setAttribute("mlocal",mlocal);
        return "listen";
    }

    public String search(String stex, String sopt, HttpSession session) {
        MusicInfo musicInfo=new MusicInfo();
        if(sopt.contentEquals("song")){
            musicInfo.setMname(stex);
            List<MusicInfo> songs=new ArrayList<MusicInfo>();
            songs=musicInfoDao.selectByMname(musicInfo);
            session.setAttribute("songs",songs);
        }else if(sopt.contentEquals("singer")){
            musicInfo.setMsinger(stex);
            List<MusicInfo> singers=new ArrayList<MusicInfo>();
            singers=musicInfoDao.selectByMsinger(musicInfo);
            session.setAttribute("singers",singers);
        }else if(sopt.contentEquals("style")){
            musicInfo.setMstyle(stex);
            List<MusicInfo> styles=new ArrayList<MusicInfo>();
            styles=musicInfoDao.selectByMstyle(musicInfo);
            session.setAttribute("styles",styles);
        }else{
            musicInfo.setMname(stex);
            List<MusicInfo> songs=new ArrayList<MusicInfo>();
            songs=musicInfoDao.selectByMname(musicInfo);
            session.setAttribute("songs",songs);
            musicInfo.setMsinger(stex);
            List<MusicInfo> singers=new ArrayList<MusicInfo>();
            singers=musicInfoDao.selectByMsinger(musicInfo);
            session.setAttribute("singers",singers);
            musicInfo.setMstyle(stex);
            List<MusicInfo> styles=new ArrayList<MusicInfo>();
            styles=musicInfoDao.selectByMstyle(musicInfo);
            session.setAttribute("styles",styles);
        }
        session.setAttribute("sopt",sopt);
        session.setAttribute("stex",stex);
        return "searchResult";
    }

    public String topnew(HttpSession session){
        List<MusicInfo> musicInfoList=musicInfoDao.selectTopnew();
        session.setAttribute("musicInfoList",musicInfoList);
        return "homepage";
    }


    public String toplike(HttpSession session){
        List<MusicInfo> musicInfoList=musicInfoDao.selectToplike();
        session.setAttribute("musicInfoList",musicInfoList);
        return "homepage";
    }
}
