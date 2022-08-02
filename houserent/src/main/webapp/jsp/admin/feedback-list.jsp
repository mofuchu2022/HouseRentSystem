<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
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
                            <h4>反馈管理</h4>
                        </div>
                        <table class="property-table-wrap responsive-table bkmark">
                            <tbody>
                            <tr>
                                <th style="width: 85%;"><i class="fa fa-file"></i>反馈列表</th>
                                <th></th>
<%--                                <th>操作</th>--%>
                            </tr>
                            <c:forEach items="${pageInfo.records}" var="c">
                                  <tr>
                                      <td class="dashboard_propert_wrapper">
                                          <div class="title">
                                              <h4>标题：${c.title} &nbsp;
                                                  <c:choose>
                                                      <c:when test="${c.status == 0}">
                                                          <span class="text-warning">待处理</span>
                                                      </c:when>
                                                      <c:when test="${c.status == 1}">
                                                          <span class="text-success">已处理</span>
                                                      </c:when>
                                                  </c:choose>
                                              </h4>
                                              <p>用户名： ${c.contactName} </p>
                                              <p>邮箱：${c.contactEmail}</p>
                                              <p>反馈时间：<fmt:formatDate value="${c.createTime}" pattern="yyyy-MM-dd HH:mm:ss" ></fmt:formatDate><p>
                                              <p>反馈内容：${c.content}</p>
                                              <P>回复内容：${c.reply}</P>
                                          </div>
                                      </td>
                                      <td class="action">
                                          <a href="javascript:void(0)" class="text-danger" onclick="deleteFeedback(${c.id})">删除反馈</a>
                                          <c:if test="${isAdmin}"> <a href="javascript:void(0)" class="text-blue" data-toggle="modal" data-target="#feedbackReply" onclick="showReplyModel(${c.id})">回复反馈 </a></c:if>
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

<!--回复反馈-->
<div class="modal" id="feedbackReply">
    <div class="modal-dialog"> <!--设定样式从右侧弹出部分登录页面-->
        <header>
            <div class="hm_nav">
                <h3 class="hm_nav_title">回复反馈</h3>
                <span class="mod-close" data-dismiss="modal"><i class="ti-close"></i></span> <!--设置一个X号，用于关闭弹出的注册页面，点击空白处也可以关闭-->
            </div>
        </header>
        <div class="modal-content" >
            <div class="modal-body">
                <form id="feedbackReplyForm">
                    <!--这个feedbackId是获取要回复的反馈id-->
                    <input type="hidden" id="feedbackId" name="id">
                    <div class="row">
                        <div class="col-lg-12 col-md-12">
                            <div class="form-group">
                                <label>回复内容</label>
                                <div class="input-with-icon">
                                    <textarea class="form-control" name="reply"></textarea>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-12 col-md-12">
                            <div class="form-group">
                                <label>状态</label>
                                <div class="input-with-icon">
                                    <select name="status" class="form-control">
                                        <option value="1">已处理</option>
                                        <option value="0">未处理</option>
                                    </select>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <button type="button" onclick="feedbackReplySubmit()" class="btn btn-md full-width pop-login bg-2">回复提交</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>