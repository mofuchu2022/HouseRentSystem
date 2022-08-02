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
                           <form id="newsForm">
                               <input type="hidden" id="id" name="id" value="${news.id}">
                               <!--这一行的意思为：在管理员界面点击编辑按钮时，进入该发布界面（编辑界面）默认有一个隐形的输入框，且id类型为id，变量名为id，点击后从数据库中获取房子的id从而避免编辑后重新生成一个id即弄成了添加功能，这可以保证再添加到数据库中的编辑信息确实在原有数据上进行覆盖，而不是新增-->
                               <input type="hidden" id="key" name="key">
                               <div class="col-lg-12 col-md-12">
                                   <div class="submit-page form-simple">
                                       <div class="frm_submit_block">
                                           <h3>发布新闻</h3>
                                           <div class="form-row">
                                                <div class="form-group col-md-6" style="width:1000px;">
                                                    <label>新闻标题</label>
                                                    <input type="text" name="title" class="form-control" value="${news.title}">
                                                </div>
                                           </div>
                                           <div class="form-row">
                                           <div class="form-group col-md-6">
                                               <label>新闻内容</label>
                                               <textarea  class="form-control h-240" name="content" style="min-height:300px;width: 1000px;">${news.content}</textarea>
                                           </div>
                                           </div>
                                       <div class="form-group">
                                           <div class="col-lg-12 col-md-12">
                                               <button class="btn btn-theme bg-2" type="button" onclick="submitNews()">确认发布</button>
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