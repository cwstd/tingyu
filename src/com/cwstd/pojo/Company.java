package com.cwstd.pojo;

import com.baomidou.mybatisplus.annotation.TableName;
import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.extension.activerecord.Model;
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
@TableName("t_company")
public class Company extends Model<Company> {

    private static final long serialVersionUID=1L;

    @TableId(value = "cid", type = IdType.AUTO)
    private Integer cid;

    private String cpwd;

    private String cname;

    private String cphone;

    private String ceo;

    private String cmail;

    private LocalDateTime starttime;

    private String status;

    private Integer ordernumber;


    public Integer getCid() {
        return cid;
    }

    public void setCid(Integer cid) {
        this.cid = cid;
    }

    public String getCpwd() {
        return cpwd;
    }

    public void setCpwd(String cpwd) {
        this.cpwd = cpwd;
    }

    public String getCname() {
        return cname;
    }

    public void setCname(String cname) {
        this.cname = cname;
    }

    public String getCphone() {
        return cphone;
    }

    public void setCphone(String cphone) {
        this.cphone = cphone;
    }

    public String getCeo() {
        return ceo;
    }

    public void setCeo(String ceo) {
        this.ceo = ceo;
    }

    public String getCmail() {
        return cmail;
    }

    public void setCmail(String cmail) {
        this.cmail = cmail;
    }

    public LocalDateTime getStarttime() {
        return starttime;
    }

    public void setStarttime(LocalDateTime starttime) {
        this.starttime = starttime;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public Integer getOrdernumber() {
        return ordernumber;
    }

    public void setOrdernumber(Integer ordernumber) {
        this.ordernumber = ordernumber;
    }

    @Override
    protected Serializable pkVal() {
        return this.cid;
    }

    @Override
    public String toString() {
        return "Company{" +
        "cid=" + cid +
        ", cpwd=" + cpwd +
        ", cname=" + cname +
        ", cphone=" + cphone +
        ", ceo=" + ceo +
        ", cmail=" + cmail +
        ", starttime=" + starttime +
        ", status=" + status +
        ", ordernumber=" + ordernumber +
        "}";
    }
}
