<%--
  Created by IntelliJ IDEA.
  User: zhanghui
  Date: 2022/03/24
  Time: 17:11
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="../common/head.jsp"%>
<section class="p-0">
    <div class="container-fluid-p-0">
        <div class="row">
            <%@include file="../common/admin-left.jsp"%>
            <div class="col-lg-9 col-md-8 col-sm-12">
                <div class="dashboard-body">
                    <div class="dashboard-wraper">
                        <div class="frm-submit-block">
                            <h4>我的家</h4>
                        </div>
                        <table class="property-table-wrap responsive-table bkmark">
                            <tbody>
                            <tr>
                                <th><i class="fa fa-file"></i>我的家信息</th>
                                <th>类型</th>
                                <th>房东</th>
                            </tr>
                            <c:forEach items="${pageInfo.records}" var="c">
                                <tr>
                                    <td class="dashboard_propert_wrapper">
                                        <img src="${c.house.thumbnailUrl}">
                                        <div class="title">
                                            <h4><a href="/house/detail/${c.houseId}" target="_blank">${c.house.title}</a></h4>
                                            <span>${c.house.address}</span>
                                            <span class="table-property-price">
                                            开始时间：<fmt:formatDate value="${c.startDate}" pattern="yyyy-MM-dd"></fmt:formatDate><br/>
                                            到期时间：<fmt:formatDate value="${c.endDate}" pattern="yyyy-MM-dd"></fmt:formatDate><br/>
                                        </span>
                                        </div>
                                    </td>
                                    <td>
                                            <c:choose>
                                                <c:when test="${c.house.rentType == 'share' }">
                                                    <span class="text-success">合租</span></br>
                                                    <a href="/house/detail/${c.houseId}#shareHouse" target="_blank">合租情况</a>
                                                    <!--注意这里在根据房子获取id信息后还获取了房子详情页面id为shareHouse的div的位置，这样当跳转到该页面的时候会直接跳到房子详情的合租情况div位置-->
                                                </c:when>
                                                <c:otherwise>
                                                    <span class="text-success">整租</span>
                                                </c:otherwise>
                                            </c:choose>
                                    </td>
                                    <td>
                                            ${c.ownerUser.userDisplayName}<br/>${c.ownerUser.phone}
                                    </td>
                                </tr>
                            </c:forEach>
                            </tbody>
                        </table>
                    </div>

                    <div class="row">
                        <div class="col-lg-12">
                            <%@include file="../common/page.jsp"%>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>

<%@include file="../common/footer.jsp"%>