package service;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.servlet.http.HttpSession;

@Service
@Transactional
public class IndexServiceImpl implements IndexService {
    public String toIndex(HttpSession session) {
        System.out.println("to IndexServiceImpl");
        session.setAttribute("tag",1);
        return "forward:homepage";
    }
}
