package com.cwstd.pojo;

import java.util.HashMap;
import java.util.List;
import java.util.Objects;

public class TreeResult {
    private Integer id;
    private String text;
    private String state;
    private TreeResult treeResult;
    private HashMap<String,Object> map;
    private List<TreeResult> children;
    public TreeResult() {
    }

    public TreeResult(Integer id, String text, String state, TreeResult treeResult, HashMap<String, Object> map, List<TreeResult> children) {
        this.id = id;
        this.text = text;
        this.state = state;
        this.treeResult = treeResult;
        this.map = map;
        this.children = children;
    }

    public List<TreeResult> getChildren() {
        return children;
    }

    public void setChildren(List<TreeResult> children) {
        this.children = children;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getText() {
        return text;
    }

    public void setText(String text) {
        this.text = text;
    }

    public String getState() {
        return state;
    }

    public void setState(String state) {
        this.state = state;
    }

    public TreeResult getTreeResult() {
        return treeResult;
    }

    public void setTreeResult(TreeResult treeResult) {
        this.treeResult = treeResult;
    }

    public HashMap<String, Object> getMap() {
        return map;
    }

    public void setMap(HashMap<String, Object> map) {
        this.map = map;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        TreeResult that = (TreeResult) o;
        return Objects.equals(id, that.id) && Objects.equals(text, that.text) && Objects.equals(state, that.state) && Objects.equals(treeResult, that.treeResult) && Objects.equals(map, that.map) && Objects.equals(children, that.children);
    }

    @Override
    public int hashCode() {
        return Objects.hash(id, text, state, treeResult, map, children);
    }

    @Override
    public String toString() {
        return "TreeResult{" +
                "id=" + id +
                ", text='" + text + '\'' +
                ", state='" + state + '\'' +
                ", treeResult=" + treeResult +
                ", map=" + map +
                ", children=" + children +
                '}';
    }
}
