/*注册提交函数*/
function submitRegister(){
     $.ajax({
         type:"POST",
         url:"/register/submit",
         async:false,
         data:$("#registerForm").serialize(),   //ajax忘记写这一句了，导致前端提交的值传不到后端中去！，这个是通过将id名为registerForm的的表单传给后台
         success:function (data) {
             alert(data.msg);
             if(data.code==1) { //如果返回了成功代码为1，则刷新当前页面
                 window.location.reload();
             }
         }
     });
}

/*登录提交函数*/
function submitLogin(){
    $.ajax({
        type:"POST",
        url:"/login/submit",
        async:false,
        data:$("#loginForm").serialize(),   //ajax忘记写这一句了，导致前端提交的值传不到后端中去！，这个是通过将id名为loginForm的的表单传给后台
        success:function (data) {
            alert(data.msg);
            if(data.code==1) { //如果返回了成功代码为1，则刷新当前页面
                window.location.reload();
            }
        }
    });
}

/*保存房子信息函数*/
function submitHouse(){
    $.ajax({
        type:"POST",
        url:"/admin/house/publish/submit",
        async:false,
        data:$("#houseForm").serialize(),   //ajax忘记写这一句了，导致前端提交的值传不到后端中去！，这个是通过将id名为loginForm的的表单传给后台
        success:function (data) {
            alert(data.msg);
            if(data.code==1) { //如果返回了成功代码为1
                window.location.href="/admin/house";//成功后返回到这个页面
            }
        }
    });
}

/*下架房子函数*/
function downHouse(id){
    $.ajax({
        type:"POST",
        url:"/admin/house/down",
        async:false,
        data:{
            "id":id
        },   //ajax忘记写这一句了，导致前端提交的值传不到后端中去！，这个是通过将id名为loginForm的的表单传给后台
        success:function (data) {
            alert(data.msg);
            if(data.code==1) { //如果返回了成功代码为1
                window.location.reload();//成功后返回到这个页面
            }
        }
    });
}

/*上架房子函数*/
function upHouse(id){
    $.ajax({
        type:"POST",
        url:"/admin/house/up",
        async:false,
        data:{
            "id":id
        },   //ajax忘记写这一句了，导致前端提交的值传不到后端中去！，这个是通过将id名为loginForm的的表单传给后台
        success:function (data) {
            alert(data.msg);
            if(data.code==1) { //如果返回了成功代码为1
                window.location.reload();//成功后返回到这个页面
            }
        }
    });
}

/*审核房子通过函数*/
function auditPass(id){
    $.ajax({
        type:"POST",
        url:"/admin/house/auditPass",
        async:false,
        data:{
            "id":id
        },   //ajax忘记写这一句了，导致前端提交的值传不到后端中去！，这个是通过将id名为loginForm的的表单传给后台
        success:function (data) {
            alert(data.msg);
            if(data.code==1) { //如果返回了成功代码为1
                window.location.reload();//成功后返回到这个页面
            }
        }
    });
}

/*审核房子不通过函数*/
function auditNotPass(id){
    $.ajax({
        type:"POST",
        url:"/admin/house/auditNotPass",
        async:false,
        data:{
            "id":id
        },   //ajax忘记写这一句了，导致前端提交的值传不到后端中去！，这个是通过将id名为loginForm的的表单传给后台
        success:function (data) {
            alert(data.msg);
            if(data.code==1) { //如果返回了成功代码为1
                window.location.reload();//成功后返回到这个页面
            }
        }
    });
}

/*删除房子函数*/
function deleteHouse(id){
    $.ajax({
        type:"POST",
        url:"/admin/house/deleteHouse",
        async:false,
        data:{
            "id":id
        },   //ajax忘记写这一句了，导致前端提交的值传不到后端中去！，这个是通过将id名为loginForm的的表单传给后台
        success:function (data) {
            alert(data.msg);
            if(data.code==1) { //如果返回了成功代码为1
                window.location.reload();//成功后返回到这个页面
            }
        }
    });
}

/*收藏房子提交函数*/
function submitMark(id){
    $.ajax({
        type:"POST",
        url:"/mark/submit",
        async:false,
        data:{
            "houseId":id
        },   //ajax忘记写这一句了，导致前端提交的值传不到后端中去！，这个是通过将id名为loginForm的的表单传给后台
        success:function (data) {
            alert(data.msg);//提示一个收藏成功的信息
            if (data.msg == "您当前尚未登录！") {
                window.location.href = "/";   //如果传入到后台的MarkController中return了一个error信息为这个，就重新返回首页
            }
        }
    });
}

/*取消收藏房子提交函数*/
function cancelMark(id){
    $.ajax({
        type:"POST",
        url:"/admin/mark/cancel",
        async:false,
        data:{
            "id":id
        },   //ajax忘记写这一句了，导致前端提交的值传不到后端中去！，这个是通过将id名为loginForm的的表单传给后台
        success:function (data) {
            alert(data.msg);//提示一个收藏成功的信息
            window.location.reload();
            if (data.msg == "您当前尚未登录！") {
                window.location.href = "/";   //如果传入到后台的MarkController中return了一个error信息为这个，就重新返回首页
            }
        }
    });
}

/*创建订单函数*/
function createOrder(){
    <!--这里要记得获取值要加“#”号,可能因为js版本的问题不能直接在data中使用houseId：$("#houseId").val();获值-->
    var houseId = $("#houseId").val();
    var endDate = $("#endDate").val();
    $.ajax({
        type:"POST",
        url:"/order/create",
        async:false,
        data:{
            "houseId":houseId,
            "endDate":endDate
        },   //ajax忘记写这一句了，导致前端提交的值传不到后端中去！，这个是通过将id名为loginForm的的表单传给后台
        success:function (data) {
            alert(data.msg);//提示一个收藏成功的信息
            if (data.msg == "您当前尚未登录！") {
                window.location.href = "/";   //如果传入到后台的MarkController中return了一个error信息为这个，就重新返回首页
            }
            //如果创建成功，跳到到签订合同的页面
            if(data.code == 1) {
                window.location.href = "/order/agreement/view?orderId="+data.result;//这个result就是后台controller中create方法返回的orderId
            }
        }
    });
}

/*签订合同函数*/
function confirmAgreement(orderId){
    $.ajax({
        type:"POST",
        url:"/order/agreement/submit",
        async:false,
        data:{
            "orderId":orderId
        },   //ajax忘记写这一句了，导致前端提交的值传不到后端中去！，这个是通过将id名为loginForm的的表单传给后台
        success:function (data) {
            alert(data.msg);//提示一个收藏成功的信息
            if (data.msg == "您当前尚未登录！") {
                window.location.href = "/";   //如果传入到后台的MarkController中return了一个error信息为这个，就重新返回首页
            }
            //如果创建成功，跳到到支付的页面
            if(data.code == 1) {
                window.location.href = "/order/pay?orderId="+data.result;//这个result就是后台controller中create方法返回的orderId
            }
        }
    });
}

/*模拟支付*/
function submitPay(orderId){
    $.ajax({
        type:"POST",
        url:"/order/pay/submit",
        async:false,
        data:{
            "orderId":orderId
        },   //ajax忘记写这一句了，导致前端提交的值传不到后端中去！，这个是通过将id名为loginForm的的表单传给后台
        success:function (data) {
            alert(data.msg);//提示一个收藏成功的信息
            if (data.msg == "您当前尚未登录！") {
                window.location.href = "/";   //如果传入到后台的MarkController中return了一个error信息为这个，就重新返回首页
            }
            //如果创建成功，跳到到支付的页面
            if(data.code == 1) {
                window.location.href = "/admin/home";//这个result就是后台controller中create方法返回的orderId
            }
        }
    });
}

/*提交联系内容*/
function submitContact(){
    $.ajax({
        type:"POST",
        url:"/house/contact",
        async:false,
        data:$('#contactForm').serialize(),  //ajax忘记写这一句了，导致前端提交的值传不到后端中去！，这个是通过将id名为loginForm的的表单传给后台
        success:function (data) {
            alert(data.msg);//提示一个收藏成功的信息
            if (data.msg == "您当前尚未登录！") {
                window.location.href = "/";   //如果传入到后台的MarkController中return了一个error信息为这个，就重新返回首页
            }
            //如果创建成功，跳到到支付的页面
            if(data.code == 1) {
               window.location.reload();//这个result就是后台controller中create方法返回的orderId
            }
        }
    });
}

/*提交个人信息修改内容*/
function submitProfile() {
    $.ajax({
        type:"POST",
        url:"/admin/profile/submit",
        async:false,
        data:$('#profileForm').serialize(),  //ajax忘记写这一句了，导致前端提交的值传不到后端中去！，这个是通过将id名为loginForm的的表单传给后台
        success:function (data) {
            alert(data.msg);//提示一个收藏成功的信息
            if (data.msg == "您当前尚未登录！") {
                window.location.href = "/";   //如果传入到后台的MarkController中return了一个error信息为这个，就重新返回首页
            }
            //如果创建成功，跳到到支付的页面
            if(data.code == 1) {
                window.location.reload();//这个result就是后台controller中create方法返回的orderId
            }
        }
    });
}

/*取消订单*/
function cancelOrder(orderId) {
    $.ajax({
        type:"POST",
        url:"/admin/order/cancel",
        async:false,
        data:{
            'orderId':orderId
        },  //ajax忘记写这一句了，导致前端提交的值传不到后端中去！，这个是通过将id名为loginForm的的表单传给后台
        success:function (data) {
            alert(data.msg);//提示一个收藏成功的信息
            if (data.code == 1) {
                window.location.reload();   //如果传入到后台的MarkController中return了一个error信息为这个，就重新返回首页
            }
        }
    });
}

/*申请退租*/
function endOrder(orderId) {
    $.ajax({
        type:"POST",
        url:"/admin/order/end",
        async:false,
        data:{
            'orderId':orderId
        },  //ajax忘记写这一句了，导致前端提交的值传不到后端中去！，这个是通过将id名为loginForm的的表单传给后台
        success:function (data) {
            alert(data.msg);//提示一个收藏成功的信息
            if (data.code == 1) {
                window.location.reload();   //如果传入到后台的MarkController中return了一个error信息为这个，就重新返回首页
            }
        }
    });
}

/*申请退租通过*/
function endOrderPass(orderId) {
    $.ajax({
        type:"POST",
        url:"/admin/order/endPass",
        async:false,
        data:{
            'orderId':orderId
        },  //ajax忘记写这一句了，导致前端提交的值传不到后端中去！，这个是通过将id名为loginForm的的表单传给后台
        success:function (data) {
            alert(data.msg);//提示一个收藏成功的信息
            if (data.code == 1) {
                window.location.reload();   //如果传入到后台的MarkController中return了一个error信息为这个，就重新返回首页
            }
        }
    });
}

/*申请退租不通过*/
function endOrderNotPass(orderId) {
    $.ajax({
        type:"POST",
        url:"/admin/order/endNotPass",
        async:false,
        data:{
            'orderId':orderId
        },  //ajax忘记写这一句了，导致前端提交的值传不到后端中去！，这个是通过将id名为loginForm的的表单传给后台
        success:function (data) {
            alert(data.msg);//提示一个收藏成功的信息
            if (data.code == 1) {
                window.location.reload();   //如果传入到后台的MarkController中return了一个error信息为这个，就重新返回首页
            }
        }
    });
}

/*新闻删除*/
function deleteNews(id) {
    $.ajax({
        type:"POST",
        url:"/admin/news/delete",
        async:false,
        data:{
            'id':id
        },  //ajax忘记写这一句了，导致前端提交的值传不到后端中去！，这个是通过将id名为loginForm的的表单传给后台
        success:function (data) {
            alert(data.msg);//提示一个收藏成功的信息
            if (data.code == 1) {
                window.location.reload();   //如果传入到后台的MarkController中return了一个error信息为这个，就重新返回首页
            }
        }
    });
}

/*保存新闻资讯*/
function submitNews(){
    $.ajax({
        type:"POST",
        url:"/admin/news/publish/submit",
        async:false,
        data:$("#newsForm").serialize(),   //ajax忘记写这一句了，导致前端提交的值传不到后端中去！，这个是通过将id名为loginForm的的表单传给后台
        success:function (data) {
            alert(data.msg);
            if(data.code==1) { //如果返回了成功代码为1
                window.location.href="/admin/news";//成功后返回到这个页面
            }
        }
    });
}

/*保存反馈资讯*/
function submitFeedBack(){
    $.ajax({
        type:"POST",
        url:"/feedback/submit",
        async:false,
        data:$("#feedbackForm").serialize(),   //ajax忘记写这一句了，导致前端提交的值传不到后端中去！，这个是通过将id名为loginForm的的表单传给后台
        success:function (data) {
            alert(data.msg);
            if(data.code==1) { //如果返回了成功代码为1
                window.location.reload();//成功后返回到这个页面
                // window.location.href="/front/feedback";//成功后返回到这个页面
            }
        }
    });
}

/*保存反馈资讯*/
function feedbackReplySubmit(){
    $.ajax({
        type:"POST",
        url:"/feedback/submit",
        async:false,
        data:$("#feedbackForm").serialize(),   //ajax忘记写这一句了，导致前端提交的值传不到后端中去！，这个是通过将id名为loginForm的的表单传给后台
        success:function (data) {
            alert(data.msg);
            if(data.code==1) { //如果返回了成功代码为1
                window.location.reload();//成功后返回到这个页面
                // window.location.href="/front/feedback";//成功后返回到这个页面
            }
        }
    });
}

/*给回复提交的id反馈赋值*/
function showReplyModel(id){
        data:$("#feedbackId").val(id);   //ajax忘记写这一句了，导致前端提交的值传不到后端中去！，这个是通过将id名为loginForm的的表单传给后台
}

/*提交用户反馈信息*/
function feedbackReplySubmit(){
    $.ajax({
        type:"POST",
        url:"/admin/feedback/reply/submit",
        async:false,
        data:$("#feedbackReplyForm").serialize(),   //ajax忘记写这一句了，导致前端提交的值传不到后端中去！，这个是通过将id名为loginForm的的表单传给后台
        success:function (data) {
            alert(data.msg);
            if(data.code==1) { //如果返回了成功代码为1
                window.location.reload();//成功后返回到这个页面
                // window.location.href="/front/feedback";//成功后返回到这个页面
            }
        }
    });
}

/*反馈删除*/
function deleteFeedback(id) {
    $.ajax({
        type:"POST",
        url:"/admin/feedback/delete",
        async:false,
        data:{
            'id':id
        },  //ajax忘记写这一句了，导致前端提交的值传不到后端中去！，这个是通过将id名为loginForm的的表单传给后台
        success:function (data) {
            alert(data.msg);//提示一个收藏成功的信息
            if (data.code == 1) {
                window.location.reload();   //如果传入到后台的MarkController中return了一个error信息为这个，就重新返回首页
            }
        }
    });
}

/*禁用用户*/
function disableUser(id) {
    $.ajax({
        type:"POST",
        url:"/admin/user/disable",
        async:false,
        data:{
            'id':id
        },  //ajax忘记写这一句了，导致前端提交的值传不到后端中去！，这个是通过将id名为loginForm的的表单传给后台
        success:function (data) {
            alert(data.msg);//提示一个收藏成功的信息
            if (data.code == 1) {
                window.location.reload();   //如果传入到后台的MarkController中return了一个error信息为这个，就重新返回首页
            }
        }
    });
}

/*启用用户*/
function enableUser(id) {
    $.ajax({
        type:"POST",
        url:"/admin/user/enable",
        async:false,
        data:{
            'id':id
        },  //ajax忘记写这一句了，导致前端提交的值传不到后端中去！，这个是通过将id名为loginForm的的表单传给后台
        success:function (data) {
            alert(data.msg);//提示一个收藏成功的信息
            if (data.code == 1) {
                window.location.reload();   //如果传入到后台的MarkController中return了一个error信息为这个，就重新返回首页
            }
        }
    });
}

/*修改用户密码*/
function editPassword(){
    $.ajax({
        type:"POST",
        url:"/admin/password/edit",
        async:false,
        data:$("#passwordForm").serialize(),   //ajax忘记写这一句了，导致前端提交的值传不到后端中去！，这个是通过将id名为loginForm的的表单传给后台
        success:function (data) {
            alert(data.msg);
            if(data.code==1) { //如果返回了成功代码为1
                window.location.href="/admin/password";//成功后返回到这个页面
            }
        }
    });
}