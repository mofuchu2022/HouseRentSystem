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
                            <h4>收藏列表</h4>
                        </div>
                        <table class="property-table-wrap responsive-table bkmark">
                            <tbody>
                            <tr>
                                <th><i class="fa fa-file"></i>收藏列表</th>
                                <th></th>
                            </tr>
                            <c:forEach items="${pageInfo.records}" var="c">
                                <tr>
                                    <td class="dashboard_propert_wrapper">
                                        <img src="${c.house.thumbnailUrl}">
                                        <div class="title">
                                            <h4><a href="/house/detail/${c.houseId}" target="_blank">${c.house.title}</a></h4>
                                            <span>${c.house.address}</span>
                                            <span class="table-property-price">
                                                ￥${c.house.monthRent}/月
                                            </span>
                                        </div>
                                    </td>
                                    <td>
                                            <a href="javascript:void(0)" class="delete" onclick="cancelMark(${c.id})"><i class="ti-close">取消收藏</i></a>
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