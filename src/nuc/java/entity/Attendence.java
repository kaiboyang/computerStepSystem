package nuc.java.entity;

public class Attendence {
    private String Sname;
    private String Ssex;
    private String Sid;
    private String Eid;
    private String Rid;

    public String getSname() {
        return Sname;
    }

    public void setSname(String sname) {
        Sname = sname;
    }

    public String getSsex() {
        return Ssex;
    }

    public void setSsex(String ssex) {
        Ssex = ssex;
    }

    public String getSid() {
        return Sid;
    }

    public void setSid(String sid) {
        Sid = sid;
    }

    public String getEid() {
        return Eid;
    }

    public void setEid(String eid) {
        Eid = eid;
    }

    public String getRid() {
        return Rid;
    }

    public void setRid(String rid) {
        Rid = rid;
    }

    public Attendence(String sname, String ssex, String sid, String eid, String rid) {
        Sname = sname;
        Ssex = ssex;
        Sid = sid;
        Eid = eid;
        Rid = rid;
    }
}
