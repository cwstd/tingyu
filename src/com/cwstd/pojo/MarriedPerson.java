package com.cwstd.pojo;

import com.baomidou.mybatisplus.annotation.TableName;
import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.extension.activerecord.Model;
import java.time.LocalDate;
import com.baomidou.mybatisplus.annotation.TableId;
import java.time.LocalDateTime;
import java.io.Serializable;

/**
 * <p>
 * 
 * </p>
 *
 * @author ${author}
 * @since 2021-09-11
 */
@TableName("t_married_person")
public class MarriedPerson extends Model<MarriedPerson> {

    private static final long serialVersionUID=1L;

    @TableId(value = "pid", type = IdType.AUTO)
    private Integer pid;

    private String ppwd;

    private String pname;

    private String phone;

    private String pmail;

    private LocalDate marrydate;

    private LocalDateTime regdate;

    private String status;


    public Integer getPid() {
        return pid;
    }

    public void setPid(Integer pid) {
        this.pid = pid;
    }

    public String getPpwd() {
        return ppwd;
    }

    public void setPpwd(String ppwd) {
        this.ppwd = ppwd;
    }

    public String getPname() {
        return pname;
    }

    public void setPname(String pname) {
        this.pname = pname;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getPmail() {
        return pmail;
    }

    public void setPmail(String pmail) {
        this.pmail = pmail;
    }

    public LocalDate getMarrydate() {
        return marrydate;
    }

    public void setMarrydate(LocalDate marrydate) {
        this.marrydate = marrydate;
    }

    public LocalDateTime getRegdate() {
        return regdate;
    }

    public void setRegdate(LocalDateTime regdate) {
        this.regdate = regdate;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    @Override
    protected Serializable pkVal() {
        return this.pid;
    }

    @Override
    public String toString() {
        return "MarriedPerson{" +
        "pid=" + pid +
        ", ppwd=" + ppwd +
        ", pname=" + pname +
        ", phone=" + phone +
        ", pmail=" + pmail +
        ", marrydate=" + marrydate +
        ", regdate=" + regdate +
        ", status=" + status +
        "}";
    }
}
