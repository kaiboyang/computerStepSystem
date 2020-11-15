package nuc.java.entity;

public class apply {
    private String Sid;
    private String Sname;
    private String Sphone;

    public String getSid() {
        return Sid;
    }

    public void setSid(String sid) {
        Sid = sid;
    }

    public String getSname() {
        return Sname;
    }

    public void setSname(String sname) {
        Sname = sname;
    }

    public String getSphone() {
        return Sphone;
    }

    public void setSphone(String sphone) {
        Sphone = sphone;
    }

    public apply(String sid, String sname, String sphone) {
        Sid = sid;
        Sname = sname;
        Sphone = sphone;
    }
}
