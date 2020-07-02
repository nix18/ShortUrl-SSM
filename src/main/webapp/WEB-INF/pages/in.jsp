<%--
  Created by IntelliJ IDEA.
  User: kyj20
  Date: 11/11/2019
  Time: 下午 3:13
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<table align="center" class="table table-striped table-hover">
    <tr class="text-center">
        <td><a href="${murl}">${murl}</a></td>
    </tr>
    <tr class="text-center">
        <td>
            <c:if test="${status==1}">
                短域名添加成功！
            </c:if>
            <c:if test="${status==0}">
                短域名添加失败！
            </c:if>
        </td>
    </tr>
</table>

