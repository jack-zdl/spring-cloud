package com.ceying.chx.common.dto;

import java.io.Serializable;

/**
 * Created by pc on 2017/6/5.
 */
public class Parameter implements Serializable {

    private static final long serialVersionUID = -1959528436584592183L;


    private String id;
    private String value;

    public Parameter(){}

    public Parameter(String id, String value){
        this.setId(id);
        this.setValue(value);
    }

    public String getId() {
        return id;
    }
    public void setId(String id) {
        this.id = id;
    }
    public String getValue() {
        return value;
    }
    public void setValue(String value) {
        this.value = value;
    }
}
