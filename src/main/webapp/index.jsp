<%--
  Created by IntelliJ IDEA.
  User: kyj20
  Date: 11/11/2019
  Time: 下午 2:51
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
            xmlhttp.send("url="+document.getElementById("url").value);
        }
    </script>
    <link href="https://cdn.bootcdn.net/ajax/libs/twitter-bootstrap/4.4.1/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<form class="form-inline" name="form1">
    <table align="center" class="table table-striped table-hover">
        <tr class="text-center">
            <th colspan="2"><strong><h3>短域名</h3></strong></th>
        </tr>
        <tr class="text-center">
            <td  style="vertical-align: middle;">请输入原域名：</td><td><input class="form-control" style="width:25%;" type="text" name="url" id="url"></td>
        </tr>
        <tr class="text-center">
            <td colspan="2">
                <input class="btn btn-outline-success" type="button" onclick="loadXMLDoc(check())" value="提交">
            </td>
        </tr>
        <tr>
            <td colspan="2" id="ajaxContent">

            </td>
        </tr>
    </table>
</form>
<%@ include file="/WEB-INF/pages/footer.jsp"%>
</body>
</html>
