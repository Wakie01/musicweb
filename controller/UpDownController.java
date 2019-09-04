package controller;

import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import pojo.MusicInfo;
import service.UpDownService;

import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;

@Controller
public class UpDownController {
    @Autowired
    private UpDownService upDownService;

    @RequestMapping("/toUpload")
    public String toUpload(HttpSession session){
        return "upload";
    }

    @RequestMapping("/uploadRequest")
    public String uploadRequest(HttpSession session){
        String username=(String) session.getAttribute("username");
        if(username == null){
            session.setAttribute("msg","要上传音乐请先进行登录");
            return "forward:/user/toLogin";
        }else {
            return "forward:/toUpload";
        }
    }

    @RequestMapping("/uploadFile")
    public String uploadOneFile(HttpSession session, MusicInfo musicInfo, @RequestParam MultipartFile mfile){
        return upDownService.uploadOneFile(session,musicInfo,mfile);
    }

    @RequestMapping("/downloadRequest")
    public String downloadRequest(HttpSession session){
        String username=(String) session.getAttribute("username");
        if (username == null) {
            session.setAttribute("msg","要下载音乐请先进行登录");
            return "forward:/user/toLogin";
        }else{
            return "forward:/download";
        }
    }

    public String cantdownload(HttpSession session){
        session.setAttribute("msg","等级不够，不能下载");
        return "musicpanel";
    }

    @RequestMapping("/download")
    public String doDownload(HttpSession session) throws IOException{
        if(!upDownService.canDownload(session)) {
            return cantdownload(session);
        }else{
            download(session);
            session.setAttribute("msg","下载成功");
            return "musicpanel";
        }
    }

    public ResponseEntity<byte[]> download(HttpSession session) throws IOException {

        //源文件位置
            String fileloca=((MusicInfo) session.getAttribute("musicInfo")).getMloca();
            //源文件名
            String filename=fileloca.substring(fileloca.lastIndexOf("/")+1);
            //源文件
            File file=new File(fileloca);
            HttpHeaders headers=new HttpHeaders();
            //下载显示的文件名，解决中文名称乱码问题
            String downloadFielName = new String(filename.getBytes("UTF-8"),"iso-8859-1");
            //通知浏览器以attachment（下载方式）打开图片
            headers.setContentDispositionFormData("attachment", downloadFielName);
            //application/octet-stream ： 二进制流数据（最常见的文件下载）
            headers.setContentType(MediaType.APPLICATION_OCTET_STREAM);
            upDownService.downloadFile(session);
            return new ResponseEntity<byte[]>(FileUtils.readFileToByteArray(file),headers, HttpStatus.CREATED);



    }
}
