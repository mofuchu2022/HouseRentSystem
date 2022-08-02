<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!--引入页面头部与底部文件-->
<%@include file="../common/head.jsp"%>
<div class="image-cover hero_banner" style="background: #334aca url('/assets/img/city-1.jpg')no-repeat;" data-overlay="1">
    <div class="container">
        <h1 class="big-header-capt mb-0">用户反馈页面</h1>
        <p class="text-center mb-5">在此反馈，我们会尽快回复</p>
        </div>
    </div>
</div>
<section class="gray-simple">
    <div class="container">
        <div class="row">
            <div class="col-lg-8 col-md-8 col-sm-8">
                <div class="property_block_wrap style-2">
                    <div class="property_block_wrap_header no-collapse">
                        <h4>请在下方如实填写您需要反馈的信息</h4>
                    </div>
                    <div class="block-body">
                        <form class="form-simple" id="feedbackForm">
                            <div class="row">
                                <div class="col-lg-6 col-md-12">
                                    <div class="form-group">
                                        <label>姓名</label>
                                        <input type="text" name="contactName" class="form-control simple">
                                    </div>
                                </div>
                                <div class="col-lg-6 col-md-12">
                                    <div class="form-group">
                                        <label>电子邮箱</label>
                                        <input type="text" name="contactEmail" class="form-control simple">
                                    </div>
                                </div>
                                <div class="col-lg-12 col-md-12">
                                    <div class="form-group">
                                        <label>标题</label>
                                        <input type="text" name="title" class="form-control simple">
                                    </div>
                                </div>
                                <div class="col-lg-12 col-md-12">
                                    <div class="form-group">
                                        <label>反馈内容</label>
                                        <textarea class="form-control simple" name="content"></textarea>
                                    </div>
                                </div>
                                <div class="col-lg-12 col-md-12">
                                    <div class="form-group">
                                        <button type="button" onclick="submitFeedBack()" class="btn btn-theme bg-2">提交</button>
                                    </div>
                                </div>
                            </div>
                        </form>

                    </div>
                </div>
            </div>

            <div class="col-lg-4 col-md-4 col-sm-4">
                <div class="contact-box">
                    <i class="ti-location-pin"></i>
                    <h4>联系位置</h4>
                    <p>平顶山学院10号楼</p>
                </div>
                <div class="contact-box">
                    <i class="ti-email"></i>
                    <h4>联系电话</h4>
                    <p>2726868707@qq.com</p>
                    <p>13076367992</p>
                </div>
            </div>

        </div>
    </div>
</section>

<%@include file="../common/footer.jsp"%>