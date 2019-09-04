package pojo;

import java.sql.Date;
import java.text.SimpleDateFormat;


public class MusicInfo {
    private int mid;
    private String uname;
    private String mname;
    private String msinger;
    private String mstyle;
    private int mlikeNum;
    private int mdislikeNum;
    private Date mupTime;
    private int mplayNum;
    private int mdownNum;
    private int mdgrade;
    private String mloca;

    public MusicInfo() {
    }

    public int getMid() {
        return mid;
    }

    public String getUname() {
        return uname;
    }

    public void setUname(String uname) {
        this.uname = uname;
    }

    public void setMid(int mid) {
        this.mid = mid;
    }

    public String getMname() {
        return mname;
    }

    public void setMname(String mname) {
        this.mname = mname;
    }

    public String getMsinger() {
        return msinger;
    }

    public void setMsinger(String msinger) {
        this.msinger = msinger;
    }

    public String getMstyle() {
        return mstyle;
    }

    public void setMstyle(String mstyle) {
        this.mstyle = mstyle;
    }

    public int getMlikeNum() {
        return mlikeNum;
    }

    public void setMlikeNum(int mlikeNum) {
        this.mlikeNum = mlikeNum;
    }

    public int getMdislikeNum() {
        return mdislikeNum;
    }

    public void setMdislikeNum(int mdislikeNum) {
        this.mdislikeNum = mdislikeNum;
    }

    public Date getMupTime() {
        return mupTime;
    }

    public void setMupTime(Date mupTime) {
        this.mupTime = mupTime;
    }

    public int getMplayNum() {
        return mplayNum;
    }

    public void setMplayNum(int mplayNum) {
        this.mplayNum = mplayNum;
    }

    public int getMdownNum() {
        return mdownNum;
    }

    public void setMdownNum(int mdownNum) {
        this.mdownNum = mdownNum;
    }

    public int getMdgrade() {
        return mdgrade;
    }

    public void setMdgrade(int mdgrade) {
        this.mdgrade = mdgrade;
    }

    public String getMloca() {
        return mloca;
    }

    public void setMloca(String mloca) {
        this.mloca = mloca;
    }

    public String formatDate(Date date){
        SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
        return sdf.format(date);
    }

    @Override
    public String toString() {
        return "MusicInfo{" +
                "mid=" + mid +
                ", uname='" + uname + '\'' +
                ", mname='" + mname + '\'' +
                ", msinger='" + msinger + '\'' +
                ", mstyle='" + mstyle + '\'' +
                ", mlikeNum=" + mlikeNum +
                ", mdislikeNum=" + mdislikeNum +
                ", mupTime=" + mupTime +
                ", mplayNum=" + mplayNum +
                ", mdownNum=" + mdownNum +
                ", mloca='" + mloca + '\'' +
                '}';
    }
}
