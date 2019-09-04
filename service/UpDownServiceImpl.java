package service;

import dao.MusicInfoDao;
import dao.UserInfoDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;
import pojo.MusicInfo;
import pojo.UserInfo;

import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;
import java.sql.Date;


@Service
@Transactional
public class UpDownServiceImpl implements UpDownService {
    @Autowired
    private MusicInfoDao musicInfoDao;
    @Autowired
    private UserInfoDao userInfoDao;

    public String uploadOneFile(HttpSession session, MusicInfo musicInfo, MultipartFile mfile) {
        double filesize=mfile.getSize()/1024/1024;
        String username=(String) session.getAttribute("username");
        UserInfo userInfo=new UserInfo();
        userInfo.setUname(username);
        double rmspace=userInfoDao.selectRmspace(userInfo);
        if(rmspace<filesize){
            session.setAttribute("uploadResult","上传空间不足，上传失败");
            return "forward:/toUpload";
        }else{
            String fileName=mfile.getOriginalFilename();
            String path="D:/musicExp";
            musicInfo.setUname(username);
            musicInfo.setMloca(path+"/"+fileName);
            musicInfo.setMupTime(new Date(new java.util.Date().getTime()));
            try {
                mfile.transferTo(new File(path,fileName));
                int r=musicInfoDao.insertMusic(musicInfo);
                if(r>0) {
                    userInfo.setUrmspace((rmspace-filesize));
                    userInfoDao.modifyRmspace(userInfo);
                    userInfoDao.updateTuploadByUname(userInfo);
                    int utupload=userInfoDao.selectUserUploadNum(userInfo);
                    if(utupload==30||utupload==60||utupload==90||utupload==120) {
                        double preroom=userInfoDao.selectUroom(userInfo);
                        userInfoDao.updateUgradeByUname(userInfo);
                        userInfoDao.updateUroomByUname(userInfo);
                        userInfo.setUrmspace(userInfo.getUrmspace()+preroom);
                        userInfoDao.modifyRmspace(userInfo);
                    }
                    session.setAttribute("uploadResult","上传成功");
                }else{
                    session.setAttribute("uploadResult","未上传成功");
                }
            } catch (IOException e) {
                e.printStackTrace();
                session.setAttribute("uploadResult","未上传成功");
            }finally {
                return "forward:/toUpload";
            }
        }
    }

    //更新musicinfo数据库
    public int downloadFile(HttpSession session){
        MusicInfo musicInfo=(MusicInfo) session.getAttribute("musicInfo");
        return musicInfoDao.updateDownNum(musicInfo);
    }

    public Boolean canDownload(HttpSession session) {
        MusicInfo musicInfo=(MusicInfo) session.getAttribute("musicInfo");
        String username=(String) session.getAttribute("username");
        UserInfo userInfo=new UserInfo();
        userInfo.setUname(username);
        int ugrade=userInfoDao.selectUserGrade(userInfo);
        int mdgrade=musicInfo.getMdgrade();
        return ugrade>=mdgrade;
    }
}
