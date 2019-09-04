package dao;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;
import pojo.MusicInfo;

import java.util.List;

@Repository
@Mapper
public interface MusicInfoDao {

    public int insertMusic(MusicInfo musicInfo);      //插入一条音乐信息
    public int insertMusicInfo(List<MusicInfo> musicInfoes);      //插入多条音乐信息
    public List<MusicInfo> selectAll();         //查询全部音乐信息
    public MusicInfo selectMusicInfoByUnameAndMname(MusicInfo musicInfo);
    public int updateLike(MusicInfo musicInfo);
    public int updateDislike(MusicInfo musicInfo);
    public int updatePlayNum(MusicInfo musicInfo);
    public int updateDownNum(MusicInfo musicInfo);
    public MusicInfo selectMusicInfoByMid(MusicInfo musicInfo);
    public List<MusicInfo> selectTop10();
    public List<MusicInfo> selectByMname(MusicInfo musicInfo);
    public List<MusicInfo> selectByMsinger(MusicInfo musicInfo);
    public List<MusicInfo> selectByMstyle(MusicInfo musicInfo);
    public List<MusicInfo> selectTopnew();
    public List<MusicInfo> selectToplike();
}
