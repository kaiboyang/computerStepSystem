package nuc.java.entity;

public class Student {
    private int Sid;
    private String Sname;
    private String Spwd;
    private String Ssex;
    private String Sphone;
    private int Sstatus;
    private int Eid;
    private int Aid;
    private int Rid;
    private String Tname;
    private int Grade;
    private String Ename;
    //管理初始显示构造方法
    public Student(int sid, String sname, String spwd, String ssex, String sphone, int sstatus, int eid, int aid,int rid,int grade,String tname, String ename) {
        Sid = sid;
        Sname = sname;
        Spwd = spwd;
        Ssex = ssex;
        Sphone = sphone;
        Sstatus = sstatus;
        Eid = eid;
        Aid = aid;
        Rid = rid;
        Grade = grade;
        Tname = tname;
        Ename = ename;
    }


    //管理员更新显示构造方法
    public Student(int sid, String sname, String spwd, String ssex, String sphone,int eid,String ename,  int aid,int rid,String tname,int grade) {
        Sid = sid;
        Sname = sname;
        Spwd = spwd;
        Ssex = ssex;
        Sphone = sphone;
        Eid = eid;
        Ename = ename;
        Aid = aid;
        Rid = rid;
        Tname = tname;
        Grade = grade;
    }
    //管理员打分构造方法
    public Student(int sid, String sname, String ssex,int grade, int eid,String ename) {
        Sid = sid;
        Sname = sname;
        Ssex = ssex;
        Grade = grade;
        Eid = eid;
        Ename = ename;
    }


    public int getSid() {
        return Sid;
    }

    public void setSid(int sid) {
        Sid = sid;
    }

    public String getSname() {
        return Sname;
    }

    public void setSname(String sname) {
        Sname = sname;
    }

    public String getSpwd() {
        return Spwd;
    }

    public void setSpwd(String spwd) {
        Spwd = spwd;
    }

    public String getSsex() {
        return Ssex;
    }

    public void setSsex(String ssex) {
        Ssex = ssex;
    }

    public String getSphone() {
        return Sphone;
    }

    public void setSphone(String sphone) {
        Sphone = sphone;
    }

    public int getSstatus() {
        return Sstatus;
    }

    public void setSstatus(int sstatus) {
        Sstatus = sstatus;
    }

    public int getEid() {
        return Eid;
    }

    public void setEid(int eid) {
        Eid = eid;
    }

    public String getEname() {
        return Ename;
    }

    public void setEname(String  ename) {
        Ename = ename;
    }

    public int getRid() {
        return Rid;
    }

    public void setRid(int rid) {
        Rid = rid;
    }

    public int getGrade() {
        return Grade;
    }

    public void setGrade(int grade) {
        Grade = grade;
    }

    public int getAid() {
        return Aid;
    }

    public void setAid(int aid) {
        Aid = aid;
    }
    public String getTname() {
        return Tname;
    }

    public void setTname(String tname) {
        Tname = tname;
    }
}