<%--
  Created by IntelliJ IDEA.
  User: zhanghui
  Date: 2022/03/20
  Time: 18:10
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<footer class="dark-footer skin-dark-footer style-2" style="padding-top: 0">
    <div class="footer-bottom">
        <div class="container">
        <p class="mb-0" style="color: white">@2022 zhangmou</p>
        </div>
    </div>
</footer>
</body>
</html>
<!--注册-->
<div class="modal" id="signup">
    <div class="modal-dialog"> <!--设定样式从右侧弹出部分注册页面-->
        <header>
            <div class="hm_nav">
                <h3 class="hm_nav_title">注册</h3>
                <span class="mod-close" data-dismiss="modal"><i class="ti-close"></i></span> <!--设置一个X号，用于关闭弹出的注册页面，点击空白处也可以关闭-->
            </div>
        </header>
        <div class="modal-content" id="sign-up">
            <div class="modal-body">
                <!--这里犯了一个很菜的错误，因为没有将表单内容放到form中去，一直以为是后台的问题导致控制台警告
                required string parameter 'contactName'is not present
                前台没反应，报了400错误，但给的提示是js函数错误-->
                <form id="registerForm">
                    <div class="row">
                        <div class="col-lg-12 col-md-12">
                            <div class="form-group">
                                <label>姓名</label>
                                <div class="input-with-icon">
                                    <input type="text" name="userDisplayName" class="form-control" placeholder="姓名">
                                    <i class="ti-user"></i> <!--用于显示一个图标-->
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-12 col-md-12">
                            <div class="form-group">
                                <label>电子邮箱</label>
                                <div class="input-with-icon">
                                    <input type="email" name="email" class="form-control" placeholder="电子邮箱，用于重置密码">
                                    <i class="ti-email"></i> <!--用于显示一个图标-->
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-12 col-md-12">
                            <div class="form-group">
                                <label>手机号</label>
                                <div class="input-with-icon">
                                    <input type="text" name="phone" class="form-control" placeholder="手机号">
                                    <i class="ti-mobile"></i> <!--用于显示一个图标-->
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-12 col-md-12">
                            <div class="form-group">
                                <label>账号</label>
                                <div class="input-with-icon">
                                    <input type="text" name="userName" class="form-control" placeholder="登录账号">
                                    <i class="ti-user"></i> <!--用于显示一个图标-->
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-12 col-md-12">
                            <div class="form-group">
                                <label>密码</label>
                                <div class="input-with-icon">
                                    <input type="password" name="userPass" class="form-control" placeholder="用户密码">
                                    <i class="ti-unlock"></i> <!--用于显示一个图标-->
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-12 col-md-12">
                            <div class="form-group">
                                <label>角色</label>
                                <div class="simple">
                                    <select name="role" class="form-control">
                                        <option value="customer">租客</option>
                                        <option value="owner">房东</option>
                                    </select>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <button type="button" onclick="submitRegister()" class="btn btn-md full-width pop-login bg-2">创建账号</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>

<!--登录-->
<div class="modal" id="login">
    <div class="modal-dialog"> <!--设定样式从右侧弹出部分登录页面-->
        <header>
            <div class="hm_nav">
                <h3 class="hm_nav_title">登录</h3>
                <span class="mod-close" data-dismiss="modal"><i class="ti-close"></i></span> <!--设置一个X号，用于关闭弹出的注册页面，点击空白处也可以关闭-->
            </div>
        </header>
        <div class="modal-content" >
            <div class="modal-body">
                <form id="loginForm">
                    <div class="row">
                        <div class="col-lg-12 col-md-12">
                            <div class="form-group">
                                <label>账号</label>
                                <div class="input-with-icon">
                                    <input type="text" name="userName" class="form-control" placeholder="请输入登录账户">
                                    <i class="ti-user"></i> <!--用于显示一个图标-->
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-12 col-md-12">
                            <div class="form-group">
                                <label>密码</label>
                                <div class="input-with-icon">
                                    <input type="text" name="userPass" class="form-control" placeholder="请输入登录密码">
                                    <i class="ti-unlock"></i> <!--用于显示一个图标-->
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <button type="button" onclick="submitLogin()" class="btn btn-md full-width pop-login bg-2">登录</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>