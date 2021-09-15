package com.cwstd.pojo;

public class HostConfig {

    private String hname;
    private String status;
    private String strong;
    private String hpstar;
    private Integer hpdiscount;

    public HostConfig(String hname, String status, String strong, String hpstar, Integer hpdiscount) {
        this.hname = hname;
        this.status = status;
        this.strong = strong;
        this.hpstar = hpstar;
        this.hpdiscount = hpdiscount;
    }

    public HostConfig() {
    }

    public String getHname() {
        return hname;
    }

    public void setHname(String hname) {
        this.hname = hname;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getStrong() {
        return strong;
    }

    public void setStrong(String strong) {
        this.strong = strong;
    }

    public String getHpstar() {
        return hpstar;
    }

    public void setHpstar(String hpstar) {
        this.hpstar = hpstar;
    }

    public Integer getHpdiscount() {
        return hpdiscount;
    }

    public void setHpdiscount(Integer hpdiscount) {
        this.hpdiscount = hpdiscount;
    }

    @Override
    public String toString() {
        return "HostConfig{" +
                "hname='" + hname + '\'' +
                ", status='" + status + '\'' +
                ", strong='" + strong + '\'' +
                ", hpstar='" + hpstar + '\'' +
                ", hpdiscount=" + hpdiscount +
                '}';
    }
}
