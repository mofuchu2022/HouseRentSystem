<%--
  Created by IntelliJ IDEA.
  User: zhanghui
  Date: 2022/03/20
  Time: 18:10
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="ft" uri="http://java.sun.com/jsp/jstl/functions" %>
<html>
<head>
    <!--这个meta用于设计在使用微信开发者工具预览项目时字体的宽度为设备的默认宽度,粗略来讲就是将字体放大一些-->
    <meta name="viewport" content="width=device-width"/>
    <title>缘来居</title>
    <link rel="stylesheet" href="/assets/css/styles.css">
    <link rel="stylesheet" href="/assets/css/colors.css">
    <!--这里要注意js函数的引用顺序，jquery要放在前面，否则可能会出现问题-->
    <script src="/assets/js/jquery.min.js"></script>
    <script src="/assets/js/popper.min.js"></script>
    <script src="/assets/js/bootstrap.min.js"></script>
    <script src="/assets/js/custom.js"></script>
    <script src="/assets/js/moment.min.js"></script>
    <script src="/assets/js/daterangepicker.js"></script>
    <script src="/assets/js/dropzone.js"></script>
    <script src="/assets/js/imagesloaded.js"></script>
    <script src="/assets/js/ion.rangeSlider.min.js"></script>
    <script src="/assets/js/jquery.magnific-popup.min.js"></script>
    <script src="/assets/js/lightbox.js"></script>
<%--    <script src="/assets/js/map.js"></script>--%>
<%--    <script src="/assets/js/map_infobox.js"></script>--%>
    <script src="/assets/js/markerclusterer.js"></script>
    <script src="/assets/js/morris.min.js"></script>
    <script src="/assets/js/raphael.min.js"></script>
    <script src="/assets/js/select2.min.js"></script>
    <script src="/assets/js/slick.js"></script>
    <script src="/assets/js/slider-bg.js"></script>
    <script src="/assets/js/script.js"></script>
</head>
<body class="yellow-skin">
    <div class="header header-light dark-text">
        <div class="container">
            <nav class="navigation navigation-landscape">
                <div class="nav-header">
                  <a class="nav-brand" href="/">缘来居</a>
                </div>
                <div class="nav-menus-wrapper">
                    <ul class="nav-menu">
                        <li <c:if test="${tab == 'houseIndex'}">class="active" </c:if>><a href="/" style="font-size: 15px">首页</a></li>
                        <li><a href="/house?rentType=whole" style="font-size: 15px">整租</a></li>
                        <li><a href="/house?rentType=share" style="font-size: 15px">合租</a></li>
                        <li <c:if test="${tab == 'news-list'}">class="active" </c:if>><a href="/news" style="font-size: 15px">新闻资讯</a></li>
                        <li <c:if test="${tab == 'feedback'}">class="active" </c:if>><a href="/feedback" style="font-size: 15px">用户反馈</a></li>
                    </ul>
                </div>

                <!--用于根据用户登录情况，判断是要显示注册按钮还是用户名称信息-->
                <c:choose>
                    <c:when test="${sessionScope.user==null}">  <!--这里要注意写法，不然登录注册按钮始终消失，不能写成 $ {sessionScope.user}==null-->
                        <ul class="nav-menu nav-menu-social align-to-right">
                            <li>
                                <a href="#" class="text-blue" data-toggle="modal" data-target="#login"> <!--从foot.jsp中获取其数据类型和id-->
                                    <i class="fas fa-user-circle mr-1"></i>
                                    <span class="dn-lg">登录</span>
                                </a>
                            </li>
                            <li class="add-listing dark-bg">
                                <a href="#" class="theme-cl" data-toggle="modal" data-target="#signup"> <!--从foot.jsp中获取其数据类型和id-->
                                    <i class="fas fa-user-circle mr-1"></i>
                                    <span class="dn-lg">注册</span>
                                </a>
                            </li>
                        </ul>
                    </c:when>
                    <c:otherwise>
                        <ul class="nav-menu nav-menu-social align-to-right">
                           <li>
                               <div class="bth-group account-drop">
                                   <button type="button" class="btn btn-order-by-filt" data-toggle="dropdown">
                                       <img src="${sessionScope.user.userAvatare}" class="avater-img">  <!--这里出现了漏写“>”符号的低级语法错误，造成了后面用户名的值没有显示出来-->
                                           ${sessionScope.user.userDisplayName}(
                                       <!--这里又出现了一个低级错误，在判断字符值的时候要加上“‘’”这个符号-->
                                       <!--c：choose的标签内写注释也会报错，这里要注意以后减少再犯-->
                                       <c:choose>
                                           <c:when test="${sessionScope.user.role=='admin'}">管理员</c:when>
                                           <c:when test="${sessionScope.user.role=='owner'}">房东</c:when>
                                           <c:when test="${sessionScope.user.role=='customer'}">租客</c:when>
                                           <c:otherwise>未知角色用户</c:otherwise>
                                       </c:choose>
                                       )
                                   </button>
                                   <c:choose>
                                       <%--用户为管理员时，暂时不知道为何他的样式是竖的，而我的菜单样式是横的--%>
                                       <c:when test="${sessionScope.user.role=='admin'}">
                                           <div class="dropdown-menu pull-right animated flipInX">
                                               <a href="/admin/house">
                                                   <i class="ti-layers"></i>房子管理
                                               </a>
                                               <a href="/admin/order">
                                                   <i class="ti-gift"></i>订单管理
                                               </a>
                                               <a href="/admin/news">
                                                   <i class="ti-info"></i>新闻管理
                                               </a>
                                               <a href="/login/logout">
                                                   <i class="ti-power-off"></i>退出登录
                                               </a>
                                           </div>
                                       </c:when>
                                       <%--用户为房东时，暂时不知道为何他的样式是竖的，而我的菜单样式是横的--%>
                                       <c:when test="${sessionScope.user.role=='owner'}">
                                           <div class="dropdown-menu fa-pull-right animated flipInX">
                                               <a href="/admin/house">
                                                   <i class="ti-layers"></i>房子管理
                                               </a>
                                               <a href="/admin/order">
                                                   <i class="ti-gift"></i>订单管理
                                               </a>
                                               <a href="/admin/profile">
                                                   <i class="ti-user"></i>个人信息
                                               </a>
                                               <a href="/login/logout">
                                                   <i class="ti-power-off"></i>退出登录
                                               </a>
                                           </div>
                                       </c:when>
                                       <%--用户为租客时，暂时不知道为何他的样式是竖的，而我的菜单样式是横的--%>
                                       <c:when test="${sessionScope.user.role=='customer'}">
                                           <div class="dropdown-menu pull-right animated flipInX">
                                               <a href="/admin/profile">
                                                   <i class="ti-user"></i>个人信息
                                               </a>
                                               <a href="/admin/home">
                                                   <i class="ti-home"></i>我的家
                                               </a>
                                               <a href="/admin/mark">
                                                   <i class="ti-bookmark"></i>我的收藏
                                               </a>
                                               <a href="/login/logout">
                                                   <i class="ti-power-off"></i>退出登录
                                               </a>
                                           </div>
                                       </c:when>
                                   </c:choose>
                               </div>
                           </li>
                        </ul>
                    </c:otherwise>
                </c:choose>

            </nav>
        </div>
    </div>

