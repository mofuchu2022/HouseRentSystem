<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: zhanghui
  Date: 2022/04/17
  Time: 16:28
  To change this template use File | Settings | File Templates.
  图片的分页JSP
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<c:if test="${pageInfo.getPages()>1}">
    <ul class="pagination p-center">
        <c:choose>
            <c:when test="${pageInfo.getPages() <= 3}">
                <c:set var="begin" value="1"></c:set>
                <c:set var="end"   value="${pageInfo.getPages()}"/>
            </c:when>
            <c:otherwise>
                <c:set var="begin" value="${pageInfo.current-1}"/>
                <c:set var="end" value="${pageInfo.current+2}"/>
                <c:if test="${begin < 2}">
                    <c:set var="begin" value="1"/>
                    <c:set var="end" value="3"/>
                </c:if>
                <c:if test="${end > pageInfo.getPages()}">
                    <c:set var="begin" value="${pageInfo.getPages()-2}"/>
                    <c:set var="end" value="${pageInfo.getPages()}"/>
                </c:if>
            </c:otherwise>
        </c:choose>
        <!--上一页-->
        <c:choose>
            <c:when test="${pageInfo.current eq 1}">
                <!--当前页面为第一页时，隐藏上一页按钮-->
            </c:when>
            <c:otherwise>
                <li class="page-item">
                    <a class="page-link" href="${pagePrefix}&page=${pageInfo.current-1}" aria-label="Previous">
                        &nbsp;<span class="ti-arrow-left">&nbsp;</span>
                        <span class="sr-only">上一页</span>
                    </a>
                </li>
            </c:otherwise>
        </c:choose>
        <!--显示第一页的页码-->
            <c:if test="${begin >= 2}">
                <li class="page-item"><a class="page-link" href="${pagePrefix}&page=1">1</a></li>
            </c:if>
            <!--用于显示分页中点击页面一列中的"..."功能-->
            <c:if test="${begin > 2 }">
                <li class="page-item"><a class="page-link" href="#">...</a></li>
            </c:if>
        <!--打印 页码-->
        <c:forEach begin="${begin}" end="${end}" var="i">
            <c:choose>
                <c:when test="${i eq pageInfo.current}">
                    <li class="page-item active">
                        <a class="page-link" href="${pagePrefix}&page=${i}">${i}</a>
                    </li>
                </c:when>
                <c:otherwise>
                    <li class="page-item">
                        <a class="page-link" href="${pagePrefix}&page=${i}">${i}</a>
                    </li>
                </c:otherwise>
            </c:choose>
        </c:forEach>
        <!--显示"..."-->
        <c:if test="${end < pageInfo.getPages()-1}">
            <li class="page-item">
                <a class="page-link" href="#">...</a>
            </li>
        </c:if>
        <!--显示最后一页的数字-->
        <c:if test="${end < pageInfo.getPages()}">
            <li class="page-item">
                <a class="page-link" href="${pagePrefix}&page=${pageInfo.getPages()}">${pageInfo.getPages()}</a>
            </li>
        </c:if>
        <!--下一页-->
        <c:choose>
            <c:when test="${pageInfo.current eq pageInfo.getPages()}"><!--如果当前一页是最后一页，那么隐藏下一页的按钮--></c:when>
            <c:otherwise>
                <li class="page-item">
                    <a class="page-link" href="${pagePrefix}&page=${pageInfo.current+1}" aria-label="Next">
                        &nbsp;<span class="ti-arrow-right"></span>
                    <span class="sr-only">下一页</span>
                    </a>
                </li>
            </c:otherwise>
        </c:choose>
    </ul>
</c:if>