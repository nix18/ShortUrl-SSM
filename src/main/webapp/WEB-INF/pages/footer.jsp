<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ page import="net.sf.json.JSONObject" %>
<%@ page import="com.moecola.d.utils.ReadUrlUtil" %>
<style type="text/css">
    body{
        position : relative;
        padding-bottom: 60px;
    }

    footer{
        position : absolute;
        bottom : 0;
        width : 100%;
        height : 110px;
    }
</style>
<footer class="footer">
    <div class="container"align="center">
        <%
            String songname = "",songAuther = "",songurl = "";
            try{
                JSONObject json=new ReadUrlUtil().readJsonFromUrl("https://music.yuk0.com/topapi.php?top=8");
                JSONObject data= (JSONObject) json.get("data");
                songname= (String) data.get("songname");
                songAuther= (String) data.get("songAuther");
                songurl= (String) data.get("songurl");
            }catch (Exception e){
                System.out.println("Get Music Error");
            }
        %>
        <div style="color:white;">
            <%=songname%>&nbsp;|&nbsp;<%=songAuther%>
        </div>
        <audio id="Audio" controls="controls" autoplay loop>
            <source src="<%=songurl%>">
            Your browser does not support the audio element.
        </audio>
        <div>
            Powerd By <a href="https://moecola.com" target="_blank">MoeCola.com</a>
        </div>
    </div>
    <script>
        function setHalfVolume(){
            document.getElementById("Audio").volume= 0.2;
        }
        window.onload = setHalfVolume;
    </script>
</footer>