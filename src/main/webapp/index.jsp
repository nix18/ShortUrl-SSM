<%--
  Created by IntelliJ IDEA.
  User: kyj20
  Date: 11/11/2019
  Time: 下午 2:51
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<html>
<head>
    <title>短域名</title>
    <link rel="shortcut icon" href="/pic/favicon.ico" type="image/x-icon">
    <script type="text/javascript">
        function check(){
            if(document.form1.url.value ===""){
                window.alert("原域名不能为空！");
                document.form1.url.focus();
                return false;
            }
            if(document.form1.url.value.indexOf("http://")===0||document.form1.url.value.indexOf("https://")===0){
                return true;
            }
            window.alert("原域名需以http://或https://开头！");
            document.form1.url.focus();
            return false;
        }
    </script>
    <script>
        function loadXMLDoc(a)
        {
            if(a===false){return false;}
            var xmlhttp;
            if (window.XMLHttpRequest)
            {
                //  IE7+, Firefox, Chrome, Opera, Safari 浏览器执行代码
                xmlhttp=new XMLHttpRequest();
            }
            else
            {
                // IE6, IE5 浏览器执行代码
                xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
            }
            xmlhttp.onreadystatechange=function()
            {
                if (xmlhttp.readyState===4 && xmlhttp.status===200)
                {
                    document.getElementById("ajaxContent").innerHTML=xmlhttp.responseText;
                }
            }
            xmlhttp.open("POST","/in/do",true);
            xmlhttp.setRequestHeader("Content-type","application/x-www-form-urlencoded");
            xmlhttp.send("url="+encodeURIComponent(document.getElementById("url").value));
        }
    </script>
    <style type="text/css">
        .main{
            max-width:800px;
            width:100%;
            height:360px;
            background-color:#fff;
            margin-top: 8%;
            /*margin:auto;*/
            /*display:flex;*/
            flex-wrap:wrap;
            position:relative;
            border-radius:12px;
            align-content:flex-start;
            overflow:hidden;
            box-shadow:0 10px 20px rgba(0,0,0,0.1);
            transition:.3s;
            z-index: 999999999;
        }
    </style>
    <link href="https://cdn.bootcdn.net/ajax/libs/twitter-bootstrap/4.4.1/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<form class="form-inline" name="form1">
    <table align="center" class="table table-striped table-hover main">
        <tr class="text-center">
            <th colspan="2" style="vertical-align: middle;"><strong><h3>短域名</h3></strong></th>
        </tr>
        <tr class="text-center">
            <td  style="vertical-align: middle;">请输入原域名：&nbsp;&nbsp;</td><td style="vertical-align: middle;"><input class="form-control" style="width:45%;" type="text" name="url" id="url"></td>
        </tr>
        <tr class="text-center">
            <td colspan="2" style="vertical-align: middle;">
                <input class="btn btn-outline-success" type="button" onclick="loadXMLDoc(check())" value="提交">
            </td>
        </tr>
        <tr>
            <td colspan="2" id="ajaxContent" style="vertical-align: middle;">

            </td>
        </tr>
    </table>
</form>
<iframe class="canvas-bg" scrolling="no" sandbox="allow-scripts allow-same-origin" src="/bk" style="position: absolute;top: 0;width: 100%;height: 100%;border-width: 0;"></iframe>
<%@ include file="/WEB-INF/pages/footer.jsp"%>
</body>
</html>
