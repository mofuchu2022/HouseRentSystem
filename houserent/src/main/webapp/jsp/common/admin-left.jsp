<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="col-lg-3 col-md-4 col-sm-12" style="min-height: 850px;">
    <!--这个style 850px用意为在页面没有数据时，将左侧的管理栏拉长从而将foot底部设置到页面最底下调整界面外观-->
    <div class="property_dashboard_navbar">
        <div class="dash_user_menues">
            <!--这个dashusermenues的class用于将不同的li标签内容分开在适当的距离-->
            <ul>
                <li
                    <c:if test="${tab == 'my-profile'}">class="active" </c:if>>
                    <!--这里的tab也是相同的道理-->
                    <a href="/admin/profile" style="color: white">
                        <i class="ti-user" ></i>&nbsp;个人信息
                    </a>
                </li>
                <c:if test="${sessionScope.user.role == 'customer'}">
                <li
                        <c:if test="${tab == 'home'}">class="active" </c:if>>
                    <!--这里的tab也是相同的道理-->
                    <a href="/admin/home" style="color: white">
                        <i class="ti-home" ></i>&nbsp;我的家
                    </a>
                </li>
                </c:if>
                <!--如果用户的角色为admin或者owner时才显示这一栏-->
                <c:if test="${sessionScope.user.role == 'admin'||sessionScope.user.role == 'owner'}">
                    <li
                            <c:if test="${tab == 'house-list'}">class="active" </c:if>>
                        <!--这里的tab是从后台的HouseController中获得的，用于显示当前按钮被选中时的高亮样式-->
                        <a href="/admin/house" style="color: white">
                            <i class="ti-layers" ></i>&nbsp;房子管理
                        </a>
                    </li>
                </c:if>
                <li
                        <c:if test="${tab == 'order-list'}">class="active" </c:if>>
                    <!--这里的tab是从后台的HouseController中获得的，用于显示当前按钮被选中时的高亮样式-->
                    <a href="/admin/order" style="color: white">
                        <i class="ti-gift" ></i>&nbsp;订单管理
                    </a>
                </li>
                <c:if test="${sessionScope.user.role == 'customer'}">
                <li
                        <c:if test="${tab == 'mark-list'}">class="active" </c:if>>
                    <!--这里的tab是从后台的HouseController中获得的，用于显示当前按钮被选中时的高亮样式-->
                    <a href="/admin/mark" style="color: white">
                        <i class="ti-bookmark" ></i>&nbsp;我的收藏
                    </a>
                </li>
                </c:if>
                <c:if test="${sessionScope.user.role == 'admin'}">
                    <li
                            <c:if test="${tab == 'news-list'}">class="active" </c:if>>
                        <!--这里的tab是从后台的HouseController中获得的，用于显示当前按钮被选中时的高亮样式-->
                        <a href="/admin/news" style="color: white">
                            <i class="ti-new-window" ></i>新闻资讯
                        </a>
                    </li>
                </c:if>
                <c:if test="${sessionScope.user.role == 'admin'}">
                    <li
                            <c:if test="${tab == 'feedback-list'}">class="active" </c:if>>
                        <!--这里的tab是从后台的HouseController中获得的，用于显示当前按钮被选中时的高亮样式-->
                        <a href="/admin/feedback" style="color: white">
                            <i class="ti-alert" ></i>用户反馈
                        </a>
                    </li>
                </c:if>
                <c:if test="${sessionScope.user.role != 'admin'}">
                    <li
                            <c:if test="${tab == 'feedback-list'}">class="active" </c:if>>
                        <!--这里的tab是从后台的HouseController中获得的，用于显示当前按钮被选中时的高亮样式-->
                        <a href="/admin/feedback" style="color: white">
                            <i class="ti-alert" ></i>我的反馈
                        </a>
                    </li>
                </c:if>
                <c:if test="${sessionScope.user.role == 'admin'}">
                    <li
                            <c:if test="${tab == 'user-list'}">class="active" </c:if>>
                        <!--这里的tab是从后台的HouseController中获得的，用于显示当前按钮被选中时的高亮样式-->
                        <a href="/admin/user" style="color: white">
                            <i class="ti-magnet" ></i>用户管理
                        </a>
                    </li>
                </c:if>
                <li
                        <c:if test="${tab == 'user-passwordEdit'}">class="active" </c:if>>
                    <!--这里的tab是从后台的HouseController中获得的，用于显示当前按钮被选中时的高亮样式-->
                    <a href="/admin/password" style="color: white">
                        <i class="ti-eraser" ></i>用户密码修改
                    </a>
                </li>
                <li>
                    <a href="/login/logout">
                        <i class="ti-power-off"></i>退出登录
                    </a>
                </li>
            </ul>
        </div>
    </div>
</div>