package service;

import org.springframework.web.multipart.MultipartFile;
import pojo.MusicInfo;

import javax.servlet.http.HttpSession;


public interface UpDownService {
    public String uploadOneFile(HttpSession session, MusicInfo musicInfo,MultipartFile mfile);
    public int downloadFile(HttpSession session);
    public Boolean canDownload(HttpSession session);
}
