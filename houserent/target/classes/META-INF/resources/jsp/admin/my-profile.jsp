<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%--
  Created by IntelliJ IDEA.
  User: zhanghui
  Date: 2022/04/28
  Time: 21:49
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../common/head.jsp"%>
<section class="p-0">
    <div class="container-fluid p-0">
      <div class="row">
          <%@ include file="../common/admin-left.jsp" %>
          <div class="col-lg-9 col-md-8 col-sm-12">
                <div  style="margin-bottom: 70px" class="dashboard-wraper">
                    <!--这个div style用于调整与底部最下面@张某栏的距离-->
                    <h4>个人信息</h4>
                    <div class="frm_submit_block">
                        <form id="profileForm">
                            <div class="form-row">
                                <div class="form-group col-md-6">
                                    <label>账号(默认不能修改)</label>
                                    <input type="text" class="form-control" name="userName" value="${user.userName}" disabled>
                                </div>
                                <div class="form-group col-md-6">
                                    <label>姓名</label>
                                    <input type="text" class="form-control" name="userDisplayName" value="${user.userDisplayName}">
                                </div>
                                <div class="form-group col-md-6">
                                    <label>电子邮箱</label>
                                    <input type="email" class="form-control" name="email" value="${user.email}">
                                </div>
                                <div class="form-group col-md-6">
                                    <label>手机号</label>
                                    <input type="text" class="form-control" name="phone" value="${user.phone}">
                                </div>
                                <div class="form-group col-md-6">
                                    <label>身份证号码</label>
                                    <input type="text" class="form-control" name="idCard" value="${user.idCard}">
                                </div>
                                <div class="form-group col-md-6">
                                    <label>性别</label>
                                    <select name="sex" class="form-control">
                                        <option value="保密！"<c:if test="${user.sex == '保密！'}">selected</c:if>>保密</option>
                                        <option value="男" <c:if test="${user.sex == '男'}">selected</c:if>> 男</option>
                                        <option value="女" <c:if test="${user.sex == '女'}">selected</c:if>> 女</option>
                                    </select>
                                </div>
                                <div class="form-group col-md-6">
                                    <label>职业</label>
                                    <select name="job" class="form-control">
                                    <option value="互联网/计算机"<c:if test="${user.job == '互联网/计算机！'}">selected</c:if>>互联网/计算机</option>
                                    <option value="生产/制造" <c:if test="${user.job == '生产/制造'}">selected</c:if>>生产/制造</option>
                                    <option value="教育/培训" <c:if test="${user.job == '教育/培训'}">selected</c:if>>教育/培训</option>
                                    <option value="其它" <c:if test="${user.job == '其它'}">selected</c:if>>其它</option>
                                    </select>
                                </div>
                                <div class="form-group col-md-6">
                                    <label>爱好</label>
                                    <input type="text" class="form-control" name="hobby" value="${user.hobby}">
                                </div>
                                <div class="form-group col-md-12">
                                    <label>个人说明</label>
                                    <textarea class="form-control" name="userDesc">${user.userDesc}</textarea>
                                </div>
                                <div class="form-group col-md-12">
                                    <button class="btn btn-theme bg-2" type="button" onclick="submitProfile()">保存</button>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
          </div>
      </div>
    </div>
</section>
<%@ include file="../common/footer.jsp"%>