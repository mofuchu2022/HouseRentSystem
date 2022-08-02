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
                            <h4>新闻管理&nbsp;<a href="/admin/news/publish" class="btn btn-theme bg-2 btn-sm">发布新闻</a></h4>
                        </div>
                        <table class="property-table-wrap responsive-table bkmark">
                            <tbody>
                            <tr>
                                <th>标题</th>
                                <th>时间</th>
                                <th>操作</th>
                            </tr>
                            <c:forEach items="${pageInfo.records}" var="c">
                              <tr>
                                  <td>
                                      ${c.title}
                                  </td>
                                  <td>
                                      <fmt:formatDate value="${c.createTime}" pattern="yyyy-MM-dd" />
                                  </td>
                                  <td class="action">
                                      <a href="/admin/news/publish?id=${c.id}" class="text-blue">编辑</a>
                                      <!--这里在获取页面跳转时传的id时忘记将id的变量名写上了，导致后台获取不到要编辑的新闻id的值从而无法显示已有内容，最后返回给发布页面时默认为空，则重新进入新发布功能-->
                                      <a href="javascript:void(0)" onclick="deleteNews(${c.id})" class="text-danger">删除</a>
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