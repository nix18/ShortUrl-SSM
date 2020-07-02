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
            return "redirect:"+urlout;
        }
        return "404";
    }
}
