package com.cwstd.pojo;

import java.util.Objects;

public class HostResult {
    private boolean success;
    private String msg;

    public HostResult(boolean success, String msg) {
        this.success = success;
        this.msg = msg;
    }

    public HostResult() {
    }

    public boolean isSuccess() {
        return success;
    }

    public void setSuccess(boolean success) {
        this.success = success;
    }

    public String getMsg() {
        return msg;
    }

    public void setMsg(String msg) {
        this.msg = msg;
    }

    @Override
    public String toString() {
        return "HostResult{" +
                "success=" + success +
                ", msg='" + msg + '\'' +
                '}';
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        HostResult that = (HostResult) o;
        return success == that.success && Objects.equals(msg, that.msg);
    }

    @Override
    public int hashCode() {
        return Objects.hash(success, msg);
    }
}
