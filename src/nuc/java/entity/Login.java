package nuc.java.entity;

public class Login {
    private String Sid;
    private String Sstatus;
    private String Sname;
    private String Spwd;
    private String Ssex;
    private String Sphone;
    private String Ename;

    public String getEname() {
        return Ename;
    }

    public void setEname(String ename) {
        Ename = ename;
    }

    public Login(){}

    public Login(String sid, String spwd) {
        Sid = sid;
        Spwd = spwd;
    }

    public Login(String sid, String sname, String spwd) {
        Sid = sid;
        Sname = sname;
        Spwd = spwd;
    }

    public void setSid(String sid) {
        Sid = sid;
    }

    public void setSname(String sname) {
        Sname = sname;
    }

    public void setSpwd(String spwd) {
        Spwd = spwd;
    }

    public void setSsex(String ssex) {
        Ssex = ssex;
    }

    public void setSphone(String sphone) {
        Sphone = sphone;
    }

    public void setSstatus(String sstatus) {
        Sstatus = sstatus;
    }

    public String getSid() {
        return Sid;
    }

    public String getSname() {
        return Sname;
    }

    public String getSpwd() {
        return Spwd;
    }

    public String getSsex() {
        return Ssex;
    }

    public String getSphone() {
        return Sphone;
    }

    public String getSstatus() {
        return Sstatus;
    }
}
