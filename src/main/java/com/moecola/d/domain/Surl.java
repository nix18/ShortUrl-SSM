package com.moecola.d.domain;

import java.io.Serializable;

public class Surl implements Serializable {
    public String surl;
    public String url;

    public Surl(){}

    public Surl(String surl,String url){
        this.surl=surl;
        this.url=url;
    }

    @Override
    public String toString() {
        return super.toString();
    }

    public String getSurl() {
        return surl;
    }

    public void setSurl(String surl) {
        this.surl = surl;
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }
}
