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
            JSONObject json=new ReadUrlUtil().readJsonFromUrl("https://music.yuk0.com/api.php?id=158787441");
            JSONObject data= (JSONObject) json.get("data");
            String songname= (String) data.get("songname");
            String songAuther= (String) data.get("songAuther");
            String songurl= (String) data.get("songurl");
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