package nuc.java.entity;

public class GradeShow {
    private String sid;
    private String sname;
    private String sEname;
    private String grade;

    public String getSid() {
        return sid;
    }

    public void setSid(String sid) {
        this.sid = sid;
    }

    public String getSname() {
        return sname;
    }

    public void setSname(String sname) {
        this.sname = sname;
    }

    public String getsEname() {
        return sEname;
    }

    public void setsEname(String sEname) {
        this.sEname = sEname;
    }

    public String getGrade() {
        return grade;
    }

    public void setGrade(String grade) {
        this.grade = grade;
    }

    public GradeShow(String sid, String sname, String sEname, String grade) {
        this.sid = sid;
        this.sname = sname;
        this.sEname = sEname;
        this.grade = grade;
    }
}
