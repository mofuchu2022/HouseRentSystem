<%--
  Created by IntelliJ IDEA.
  User: zhanghui
  Date: 2022/03/24
  Time: 17:55
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="../common/head.jsp"%>
<link rel="stylesheet" href="/assets/plugins/bootstrap-fileinput/css/fileinput.min.css">
<script src="/assets/plugins/bootstrap-fileinput/js/fileinput.min.js"></script>
<script src="/assets/plugins/bootstrap-fileinput/js/locales/zh.js"></script>
<section class="p-0">
    <div class="container-fluid-p-0">
        <div class="row">
            <%@include file="../common/admin-left.jsp" %>
            <div class="col-lg-9 col-md-8 col-sm-12">
               <section style="padding-top: 10px;">
                   <div class="container">
                       <div class="row">
                           <form id="passwordForm">
                               <div class="col-lg-6 col-md-6">
                                   <div class="submit-page form-simple">
                                       <div class="frm_submit_block">
                                           <h3>修改密码</h3>
                                           <div class="form-row">
                                                <div class="form-group col-md-12" style="width:1000px;">
                                                    <label>原密码</label>
                                                    <input type="password" name="oldPassword" class="form-control">
                                                </div>
                                           </div>
                                           <div class="form-row">
                                               <div class="form-group col-md-12" style="width:1000px;">
                                                   <label>新密码</label>
                                                   <input type="password" name="newPassword" class="form-control">
                                               </div>
                                           </div>
                                           <div class="form-row">
                                               <div class="form-group col-md-12" style="width:1000px;">
                                                   <label>确认新密码</label>
                                                   <input type="password" name="confirmPassword" class="form-control">
                                               </div>
                                           </div>
                                       <div class="form-group">
                                           <div class="col-lg-12 col-md-12">
                                               <button class="btn btn-theme bg-2" type="button" onclick="editPassword()">确认修改密码</button>
                                           </div>
                                       </div>
                                       </div>
                                   </div>
                               </div>
                           </form>
                       </div>
                   </div>
               </section>
            </div>
        </div>
    </div>
</section>

<%@include file="../common/footer.jsp"%>