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
                           <form id="houseForm">
                               <input type="hidden" id="id" name="id" value="${house.id}">
                               <!--这一行的意思为：在管理员界面点击编辑按钮时，进入该发布界面（编辑界面）默认有一个隐形的输入框，且id类型为id，变量名为id，点击后从数据库中获取房子的id从而避免编辑后重新生成一个id即弄成了添加功能，这可以保证再添加到数据库中的编辑信息确实在原有数据上进行覆盖，而不是新增-->
                               <input type="hidden" id="key" name="key">
                               <div class="col-lg-12 col-md-12">
                                   <div class="submit-page form-simple">
                                       <div class="frm_submit_block">
                                           <h3>基本信息</h3>
                                           <div class="form-row">
                                                <div class="form-group col-md-6">
                                                    <label>出租类型</label>
                                                    <select name="rentType" class="form-group">
                                                        <option value="whole" <c:if test="${house.rentType == 'whole'}">selected</c:if>>整租</option>
                                                        <option value="share" <c:if test="${house.rentType == 'share'}">selected</c:if>>合租</option>
                                                    </select>
                                                </div>
                                               <div class="form-group col-md-6">
                                                   <label>月租金<a href="#" class="tip-topdata" data-tip="日租金 = 月租金 / 25"><i class="ti-help"></i></a></label> <!--这里用来在月租金旁生成一个日租金提醒-->
                                                   <input type="number" name="monthRent" class="form-control" value="${house.monthRent}">
                                               </div>
                                               <div class="form-group col-md-6">
                                                   <label>所属城市</label>
                                                   <select name="city" class="form-control">
                                                       <!--如果在HouseController中的publish方法中通过id获取到了房子信息，那么就根据情况将其值赋予打印显示给用户，否则默认即新增页面时其输入框中的信息为空-->
                                                       <option value="北京" <c:if test="${house.city =='北京'}">selected</c:if>>北京</option>
                                                       <option value="上海" <c:if test="${house.city =='上海'}">selected</c:if>>上海</option>
                                                       <option value="广州" <c:if test="${house.city =='广州'}">selected</c:if>>广州</option>
                                                       <option value="深圳" <c:if test="${house.city =='深圳'}">selected</c:if>>深圳</option>
                                                       <option value="郑州" <c:if test="${house.city =='郑州'}">selected</c:if>>郑州</option>
                                                       <option value="杭州" <c:if test="${house.city =='杭州'}">selected</c:if>>杭州</option>
                                                       <option value="天津" <c:if test="${house.city =='天津'}">selected</c:if>>天津</option>
                                                       <option value="重庆" <c:if test="${house.city =='重庆'}">selected</c:if>>重庆</option>
                                                       <option value="香港" <c:if test="${house.city =='香港'}">selected</c:if>>香港</option>
                                                       <option value="澳门" <c:if test="${house.city =='澳门'}">selected</c:if>>澳门</option>
                                                       <option value="拉萨" <c:if test="${house.city =='拉萨'}">selected</c:if>>拉萨</option>
                                                       <option value="贵阳" <c:if test="${house.city =='贵阳'}">selected</c:if>>贵阳</option>
                                                       <option value="南宁" <c:if test="${house.city =='南宁'}">selected</c:if>>南宁</option>
                                                       <option value="昆明" <c:if test="${house.city =='昆明'}">selected</c:if>>昆明</option>
                                                       <option value="长春" <c:if test="${house.city =='长春'}">selected</c:if>>长春</option>
                                                   </select>
                                               </div>
                                               <div class="form-group col-md-6">
                                                   <label>房子标题信息<a href="#" class="tip-topdata" data-tip="如：合租-世界花园-4居室-A卧"><i class="ti-help"></i></a></label>
                                                   <input type="text" name="title" class="form-control" value="${house.title}">
                                               </div>
                                               <div class="form-group col-md-8">
                                                   <label>房子详细地址<a href="#" class="tip-topdata" data-tip="如广东省汕头市南山区世界之窗千禧花园小区24栋789室B卧"><i class="ti-help"></i></a></label>
                                                   <input type="text" name="address" class="form-control" value="${house.address}"><!--这里多打了一个</div>标签，导致了该容器中排版布局怪异-->
                                               </div>
                                               <div class="form-group col-md-4">
                                                   <label>房子经纬度
                                                       <a href="https://api.map.baidu.com/lbsapi/getpoint/index.html" target="_blank">点此获取坐标</a>
                                                       <!--这里添加上target="_blank"语法可以在点击这个链接后新打开一个界面，而不是在原有界面窗口进行打开-->
                                                       <a href="#" class="tip-topdata" data-tip="经纬度，如113.220611,33.751755"><i class="ti-help"></i></a>
                                                   </label>
                                                   <input type="text" name="longitudeLatitude" class="form-control" value="${house.longitudeLatitude}">
                                               </div>
                                           </div>
                                       <div class="frm_submit_block">
                                           <h3>结构信息</h3>
                                           <div class="form-row">
                                               <div class="form-group col-md-6">
                                                   <label>房产证号</label>
                                                    <input type="text" name="certificateNo" class="form-control" value="${house.certificateNo}">
                                               </div>
                                               <div class="form-group col-md-6">
                                                   <label>面积<a href="#" class="tip-topdata" data-tip="整租是为整个房间的面积，合租时为单个房间的面积"><i class="ti-help"></i></a></label> <!--这里用来在月租金旁生成一个日租金提醒-->
                                                   <input type="text" name="area" class="form-control" value="${house.area}">
                                               </div>
                                               <div class="form-group col-md-6">
                                                   <label>朝向</label>
                                                   <input type="text" name="direction" class="form-control" value="${house.direction}">
                                               </div>
                                               <div class="form-group col-md-6">
                                                   <label>是否有空调</label>
                                                   <select name="hasAirConditioner" class="form-control">
                                                       <option value="1" <c:if test="${house.hasAirConditioner == 1}">selected</c:if>>有空调</option>
                                                       <option value="2" <c:if test="${house.hasAirConditioner == 0}">selected</c:if>>无空调</option>
                                                   </select>
                                               </div>
                                               <div class="form-group col-md-6">
                                                   <label>卧室数量</label>
                                                   <select name="bedroomNum" class="form-control">
                                                       <option value="1" <c:if test="${house.bedroomNum == 1}">selected</c:if>>1个</option>
                                                       <option value="2" <c:if test="${house.bedroomNum == 2}">selected</c:if>>2个</option>
                                                       <option value="3" <c:if test="${house.bedroomNum == 3}">selected</c:if>>3个</option>
                                                       <option value="4" <c:if test="${house.bedroomNum == 4}">selected</c:if>>4个</option>
                                                       <option value="5" <c:if test="${house.bedroomNum == 5}">selected</c:if>>5个及以上</option>
                                                   </select>
                                               </div>
                                               <div class="form-group col-md-6">
                                                   <label>卫生间数量</label>
                                                   <select name="toiletNum" class="form-control">
                                                       <option value="1" <c:if test="${house.toiletNum == 1}">selected</c:if>>1个</option>
                                                       <option value="2" <c:if test="${house.toiletNum == 2}">selected</c:if>>2个</option>
                                                       <option value="3" <c:if test="${house.toiletNum == 3}">selected</c:if>>3个</option>
                                                       <option value="4" <c:if test="${house.toiletNum == 4}">selected</c:if>>4个</option>
                                                       <option value="5" <c:if test="${house.toiletNum == 5}">selected</c:if>>5个及以上</option>
                                                   </select>
                                               </div>
                                               <div class="form-group col-md-6">
                                                   <label>厨房数量</label>
                                                   <select name="kitchenNum" class="form-control">
                                                       <option value="1" <c:if test="${house.kitchenNum == 1}">selected</c:if>>1个</option>
                                                       <option value="2" <c:if test="${house.kitchenNum == 2}">selected</c:if>>2个</option>
                                                       <option value="3" <c:if test="${house.kitchenNum == 3}">selected</c:if>>3个</option>
                                                       <option value="4" <c:if test="${house.kitchenNum == 4}">selected</c:if>>4个</option>
                                                       <option value="5" <c:if test="${house.kitchenNum == 5}">selected</c:if>>5个及以上</option>
                                                   </select>
                                               </div>
                                               <div class="form-group col-md-6">
                                                   <label>客厅数量</label>
                                                   <select name="livingRoomNum" class="form-control">
                                                       <option value="1" <c:if test="${house.livingRoomNum == 1}">selected</c:if>>1个</option>
                                                       <option value="2" <c:if test="${house.livingRoomNum == 2}">selected</c:if>>2个</option>
                                                       <option value="3" <c:if test="${house.livingRoomNum == 3}">selected</c:if>>3个</option>
                                                       <option value="4" <c:if test="${house.livingRoomNum == 4}">selected</c:if>>4个</option>
                                                       <option value="5" <c:if test="${house.livingRoomNum == 5}">selected</c:if>>5个及以上</option>
                                                   </select>
                                               </div>
                                           </div>
                                       </div>
                                       <div class="frm_submit_block">
                                           <h3>建筑信息</h3>
                                           <div class="form-group col-md-6">
                                               <label>建成年份</label>
                                               <input type="number" name="buildYear" class="form-control" value="${house.buildYear}">
                                           </div>
                                           <div class="form-group col-md-6">
                                               <label>所在楼层</label>
                                               <input type="number" name="floor" class="form-control" value="${house.floor}">
                                           </div>
                                           <div class="form-group col-md-6">
                                               <label>总楼层</label>
                                                <input type="number" name="maxFloor" class="form-control" value="${house.maxFloor}">
                                           </div>
                                           <div class="form-group col-md-6">
                                                <label>是否有电梯</label>
                                               <select name="hasElevator" class="form-control">
                                                   <option value="1" <c:if test="${house.hasElevator == 1}">selected</c:if>>有电梯</option>
                                                   <option value="0" <c:if test="${house.hasElevator == 0}">selected</c:if>>没有电梯</option>
                                               </select>
                                           </div>
                                       </div>
                                       <div class="frm_submit_block">
                                           <h3>联系人信息</h3>
                                           <div class="form-group col-md-6">
                                               <label>联系人姓名</label>
                                               <input type="text" name="contactName" class="form-control" value="${house.contactName}">
                                           </div>
                                           <div class="form-group col-md-6">
                                               <label>联系人电话</label>
                                               <input type="number" name="contactPhone" class="form-control" value="${house.contactPhone}">
                                           </div>
                                       </div>
                                       <div class="frm_submit_block">
                                           <h3>详情描述</h3>
                                           <div class="form-row>">
                                           <div class="form-group col-md-12">
                                           <label>房屋详情描述</label>
                                               <textarea class="form-control ht-120" name="content">${house.content}</textarea>
                                           </div>
                                            </div>
                                       </div>
                                       <div class="frm_submit_block">
                                           <h3>轮播图上传</h3>
                                           <div class="form-row">
                                               <div class="form-group col-md-12">
                                                   <input type="file" name="file" id="file" multiple class="file-loading"/>
                                               </div>
                                           </div>
                                       </div>
                                       <div class="form-group">
                                           <div class="col-lg-12 col-md-12">
                                               <button class="btn btn-theme bg-2" type="button" onclick="submitHouse()">确认发布</button>
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
<script>
    $(function () {
       var timestamp = Date.parse(new Date());
       $("#key").val(timestamp);    //根据id获取key的值
       $("#file").fileinput({
            language:'zh',  //设置语言为中文,这里设置了中文但是按钮显示的还是英文
            uploadUrl:"/file/upload?key="+timestamp,   //设置文件上传路径
            allowedFileExtensions:['png','jpg','jpeg','gif'],   //设置图片上传格式
           showUpload:true,  //显示批量上传按钮
           showCaption:false    //不显示标题
       });
    });
</script>