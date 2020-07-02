<%@ page import="java.sql.*" %>
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
            if(document.form1.url.value ==""){
                window.alert("原域名不能为空！");
                document.form1.url.focus();
                return false;
            }
            if(document.form1.url.value.indexOf("http://")==0||document.form1.url.value.indexOf("https://")==0){
                return true;
            }
            window.alert("原域名需以http://或https://开头！");
            document.form1.url.focus();
            return false;
        }
    </script>
    <link href="https://cdn.bootcdn.net/ajax/libs/twitter-bootstrap/4.4.1/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<form action="/in/do" class="form-inline" name="form1" method="post" onsubmit="return check()">
    <table align="center" class="table table-striped table-hover">
        <tr class="text-center">
            <th colspan="2"><strong><h3>短域名</h3></strong></th>
        </tr>
        <tr class="text-center">
            <td  style="vertical-align: middle;">请输入原域名：</td><td><input class="form-control" style="width:25%;" type="text" name="url"></td>
        </tr>
        <tr class="text-center">
            <td colspan="2">
                <input class="btn btn-outline-success" type="submit" value="提交">
            </td>
        </tr>
    </table>
</form>
<%@ include file="footer.jsp"%>
</body>
</html>
