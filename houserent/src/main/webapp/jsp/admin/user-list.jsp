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
                            <h4>用户管理</h4><br/>
                        </div>
                        <table class="property-table-wrap responsive-table bkmark">
                            <tbody>
                            <tr>
                                <th>账号信息</th>
                                <th>联系方式</th>
                                <th>其他信息</th>
                                <th>状态</th>
                                <th>操作</th>
                            </tr>
                            <c:forEach items="${pageInfo.records}" var="c">
                              <tr>
                                  <td>
                                      <span>用户名：${c.userName} &nbsp;&nbsp;&nbsp;&nbsp;姓名：${c.userDisplayName}</span><br/>
                                      <span>身份证号：${c.idCard}</span>
                                  </td>
                                  <td>
                                      <span>${c.email}</span><br/>
                                      <span>${c.phone}</span>
                                  </td>
                                  <td>
                                      <span>${c.hobby}</span><br/>
                                      <span>${c.job}</span>
                                  </td>
                                  <td>
                                      <c:choose>
                                          <c:when test="${c.status == 1}">
                                              <span class="text-success">启用</span>
                                          </c:when>
                                          <c:when test="${c.status == 0}">
                                              <span class="text-danger">禁用</span>
                                          </c:when>
                                      </c:choose>
                                  </td>
                                  <td class="action">
                                          <c:choose>
                                              <c:when test="${c.status == 1}">
                                                  <a href="javascript:void(0)" onclick="disableUser(${c.id})">禁用</a>
                                              </c:when>
                                              <c:when test="${c.status == 0}">
                                                  <a href="javascript:void(0)" onclick="enableUser(${c.id})">启用</a>
                                              </c:when>
                                          </c:choose>
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