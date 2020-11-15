package nuc.java.entity;

public class Register {
    private String Sname;
    private String Spwd;
    private String Ssex;
    private String Sphone;

    public Register(String sname, String spwd, String ssex, String sphone) {
        Sname = sname;
        Spwd = spwd;
        Ssex = ssex;
        Sphone = sphone;
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
}
