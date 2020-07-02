package com.moecola.d.utils;


import net.sf.json.JSONObject;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.net.URL;
import java.net.URLConnection;
import java.nio.charset.Charset;

public class ReadUrlUtil {
    public JSONObject readJsonFromUrl(String url) throws Exception {
        SslUtils.ignoreSsl();
        URL nurl=new URL(url);
        URLConnection urlConnection = nurl.openConnection();
        //伪造来源ip防止被api屏蔽
        urlConnection.setRequestProperty("x-forwarded-for","117.86.48."+String.valueOf((int) (Math.random() * 100+1)));
        InputStream is = urlConnection.getInputStream();
        try {
            BufferedReader rd = new BufferedReader(new InputStreamReader(is, Charset.forName("UTF-8")));
            StringBuilder sb = new StringBuilder();
            int cp;
            while ((cp = rd.read()) != -1) {
                sb.append((char) cp);
            }
            String jsonText = sb.toString();
            JSONObject json = JSONObject.fromObject(jsonText);
            return json;
        } catch (IOException e) {
            e.printStackTrace();
        } finally {
            is.close();
        }
        return null;
    }
}
