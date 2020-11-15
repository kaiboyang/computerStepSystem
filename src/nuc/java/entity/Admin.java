package nuc.java.entity;

public class Admin {
    private String aId;
    private String aPwd;

    public String getaId() {
        return aId;
    }

    public void setaId(String aId) {
        this.aId = aId;
    }

    public String getaPwd() {
        return aPwd;
    }

    public void setaPwd(String aPwd) {
        this.aPwd = aPwd;
    }

    public Admin(String aId, String aPwd) {
        this.aId = aId;
        this.aPwd = aPwd;
    }
}
