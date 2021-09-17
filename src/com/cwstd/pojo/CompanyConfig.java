package com.cwstd.pojo;

import java.util.Objects;

public class CompanyConfig {
    private String cname;
    private String status;
    private String ordernumber;

    public CompanyConfig(String cname, String status, String ordernumber) {
        this.cname = cname;
        this.status = status;
        this.ordernumber = ordernumber;
    }

    public CompanyConfig() {
    }

    public String getCname() {
        return cname;
    }

    public void setCname(String cname) {
        this.cname = cname;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getOrdernumber() {
        return ordernumber;
    }

    public void setOrdernumber(String ordernumber) {
        this.ordernumber = ordernumber;
    }

    @Override
    public String toString() {
        return "CompanyConfig{" +
                "cname='" + cname + '\'' +
                ", status='" + status + '\'' +
                ", ordernumber='" + ordernumber + '\'' +
                '}';
    }

    @Override
    public boolean equals(Object o) {

        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        CompanyConfig that = (CompanyConfig) o;
        return Objects.equals(cname, that.cname) && Objects.equals(status, that.status) && Objects.equals(ordernumber, that.ordernumber);
    }

    @Override
    public int hashCode() {
        return Objects.hash(cname, status, ordernumber);
    }
}
