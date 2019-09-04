package dao;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;
import pojo.User;
import pojo.UserInfo;

import java.util.List;
import java.util.Map;

@Repository
@Mapper
public interface UserInfoDao {

    public List<UserInfo> selectAll();         //查询所以用户信息
    public UserInfo selectAllByUserInfoName(UserInfo userInfo);    //查询Uname的所有信息
    public UserInfo selectAllByUserName(User user);    //通过User查询Uname的所有信息
 //   public int updateUnameByUser(User user);    //User表的Uname修改时，UserInfo表也要改
    public int updateTuploadByUname(UserInfo userInfo);     //更新Uname的tupload至num    list存有Uname和num值
    public int updateUgradeByUname(UserInfo userInfo);      //更新Uname的ugrade至num
    public int updateUroomByUname(UserInfo userInfo);       //更新Uname的uroom至num
    public int insertUserInfo(User user);           //插入一条用户信息
    public int selectUserGrade(UserInfo userInfo);
    public int selectUserUploadNum(UserInfo userInfo);
    public int modifyRmspace(UserInfo userInfo);
    public Double selectRmspace(UserInfo userInfo);
    public Double selectUroom(UserInfo userInfo);
}
