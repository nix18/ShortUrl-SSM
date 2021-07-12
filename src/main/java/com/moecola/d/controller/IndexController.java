package com.moecola.d.controller;

import com.moecola.d.domain.Surl;
import com.moecola.d.service.IIndexService;
import com.moecola.d.utils.RandomString;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpServletRequest;
import java.io.UnsupportedEncodingException;
import java.sql.SQLException;
import java.util.List;

@Controller
public class IndexController {
    @Autowired
    private IIndexService indexService;
    @RequestMapping("/")
    public String index(){
        return "index";
    }
    @RequestMapping(value = "/in/do",method = {RequestMethod.POST})
    public String urlIn(Surl surl, Model model, HttpServletRequest request){
        if(surl.url.length()==0){
            return "redirect:/";
        }
        List<String> chk=indexService.urlInCheck(surl.url);
        if(chk.size()!=0){
            surl.surl=chk.get(0);
        }else {
            int length=5;
            RandomString rs=new RandomString();
            String s=rs.getRandomString(length);
            try{
                while (indexService.surlIsExist(s)>0) {
                    s = rs.getRandomString(length);
                }
                surl.setSurl(s);
                int i=indexService.urlIn(surl);
                if(i<1) throw new SQLException();
            }catch (Exception e){
                System.out.println("添加短域名失败，原域名："+surl);
                model.addAttribute("status",0);
                return "in";
            }
        }
        model.addAttribute("status",1);
        if(request.getServerPort()==80||request.getServerPort()==443)
            model.addAttribute("murl","http://"  +  request.getServerName()+
                    request.getContextPath()+"/"+surl.surl);
        else
            model.addAttribute("murl","http://"  +  request.getServerName()+":"+request.getServerPort()+
                    request.getContextPath()+"/"+surl.surl);
        return "in";
    }
    @RequestMapping(value = "/{surl}",method = {RequestMethod.GET})
    public String urlOut(@PathVariable("surl") String s){
        String urlout=null;
        try{
            if(s.length()!=0) {
                urlout = indexService.urlOut(s).get(0).url;
            }
        }catch (Exception e){
            System.out.println("获取原域名失败，短域名参数："+s);;
        }
        if(urlout!=null){
            String urlHead;
            StringBuilder urlEnd= new StringBuilder();
            String[] urlGroup = urlout.split("/");
            urlHead = urlGroup[0]+"//"+urlEncode(urlGroup[2]);
            for(int i = 3; i<urlGroup.length; i++){
                if(i==urlGroup.length-1)
                    urlEnd.append(urlEncode(urlGroup[i]));
                else
                    urlEnd.append(urlEncode(urlGroup[i])+"/");
            }
            return "redirect:"+ urlHead+"/"+urlEnd;
        }
        return "404";
    }
    @RequestMapping("bk")
    public String bk(){
        return "bk";
    }

    public static String urlEncode(String in){
        String ret = "";
        try {
            ret = java.net.URLEncoder.encode(in, "UTF-8");
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        }
        return ret;
    }

    public static String getEncoding(String str) {
        String encode = "GB2312";
        try {
            if (str.equals(new String(str.getBytes(encode), encode))) {
                String s = encode;
                return s;
            }
        } catch (Exception exception) {
        }
        encode = "ISO-8859-1";
        try {
            if (str.equals(new String(str.getBytes(encode), encode))) {
                String s1 = encode;
                return s1;
            }
        } catch (Exception exception1) {
        }
        encode = "UTF-8";
        try {
            if (str.equals(new String(str.getBytes(encode), encode))) {
                String s2 = encode;
                return s2;
            }
        } catch (Exception exception2) {
        }
        encode = "GBK";
        try {
            if (str.equals(new String(str.getBytes(encode), encode))) {
                String s3 = encode;
                return s3;
            }
        } catch (Exception exception3) {
        }
        return "";
    }

}
