package dao;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;
import pojo.User;

@Repository("userDao")
@Mapper
public interface UserDao {
    public int selectIfExistByUacot(User user);      //查询Uacot是否存在
    public Integer selectIfExistByUname(User user);      //查询Uname是否存在
    public Integer selectIfExistByUacotAndUpass(User user);     //查询Uacot跟Upass是否存在
    public int insertUser(User user);          //添加用户
    public int updateUnameByUacot(User user);       //根据Uacot更新Uname
    public String selectUnameByUacot(User user);
    public String selectUacotByUname(User user);
}
