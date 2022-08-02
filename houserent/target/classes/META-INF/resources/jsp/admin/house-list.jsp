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
                    <div class="frm-submit-block">
                        <h4>房子管理 &nbsp <a href="/admin/house/publish" class="btn btn-theme bg-2 btn-sm">发布新房子</a></h4>
                    </div>
                    <div class="row">
                        <c:forEach items="${pageInfo.records}" var="c">
                            <div class="col-lg-4">
                                <div class="dashboard_property_list">
                                    <!--这里出现过有显示条目但不显示图片的问题，经查看是因为数据库中之前有些数据中刚开始并没有添加图片，导致不报错但是默认还是有它的位置-->
                                    <div class="dashboard_property_list_thumb">
                                         <a href = "/house/detail/${c.id}"><img src="${c.thumbnailUrl}"  class="img-fluid"/></a>
                                        <c:choose>
                                            <c:when test="${c.status == 0}">
                                               <span class="dashboard_pr_status published">未租出</span>
                                                <!--这里用于根据发布房子的状态码在其图片左上角显示状态信息-->
                                            </c:when>
                                            <c:when test="${c.status == 1}">
                                                <span class="dashboard_pr_status">已租出</span>
                                            </c:when>
                                            <c:when test="${c.status == -1}">
                                                <span class="dashboard_pr_status">已下架</span>
                                            </c:when>
                                            <c:when test="${c.status == -2}">
                                                <span class="dashboard_pr_status expire">待审核</span>
                                            </c:when>
                                            <c:when test="${c.status == -3}">
                                                <span class="dashboard_pr_status expire">审核不通过</span>
                                            </c:when>
                                            <c:otherwise>
                                                <span class="dashboard_pr_status">没有设定的状态</span>
                                            </c:otherwise>
                                        </c:choose>
                                    </div>
                                    <div class="dashboard_property_list_content">
                                        <h4>${c.title}</h4>
                                        <span><i class="ti-location-pin"></i>${c.address}</span>
                                        <!--显示房子标题和地址信息与图标-->
                                    </div>
                                    <div class="dashboard_property_list_footer">
                                        <a href="/house/detail/${c.id}" title="点此查看详情">&nbsp;<i class="ti-eye"></i>&nbsp;</a>
                                        <!--显示查看按钮，图标为ti-eye-->
                                        <c:if test="${c.status != 1}">
                                            <!--如果房子并非为已租出，那么就可以编辑显示编辑按钮-->
                                            <a href="/admin/house/publish?id=${c.id}" title="编辑">&nbsp;<i class="ti-pencil"></i>&nbsp;</a>
                                        </c:if>
                                        <c:if test="${c.status == -1}">
                                            <!--如果已下架，那么就可以编辑显示上架按钮-->
                                            <a href="javascript:void(0)" onclick="upHouse(${c.id})" title="上架">&nbsp;<i class="ti-control-play"></i>&nbsp;</a>
                                        </c:if>
                                        <c:if test="${c.status == 0}">
                                            <a href="javascript:void(0)" onclick="downHouse(${c.id})" title="下架">&nbsp;<i class="ti-control-pause"></i>&nbsp;</a>
                                        </c:if>
                                        <c:if test="${c.status != 1}">
                                            <!--只要不是已租出，那么就可以显示删除按钮-->
                                            <a href="javascript:void(0)" onclick="deleteHouse(${c.id})" title="删除">&nbsp;<i class="ti-close"></i>&nbsp;</a>
                                        </c:if>
                                        <c:if test="${isAdmin && c.status == -2}">
                                            <!--用户为管理员且房子状态为待审核状态显示这两个按钮-->
                                            <a href="javascript:void(0)" onclick="auditPass(${c.id})" title="审核通过">&nbsp;<i class="ti-arrow-up"></i>&nbsp;</a>
                                            <a href="javascript:void(0)" onclick="auditNotPass(${c.id})" title="审核不通过">&nbsp;<i class="ti-arrow-down"></i>&nbsp;</a>
                                        </c:if>
                                    </div>
                                </div>
                            </div>
                        </c:forEach>
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