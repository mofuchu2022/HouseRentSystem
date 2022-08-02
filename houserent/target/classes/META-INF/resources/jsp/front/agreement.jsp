<%--
  Created by IntelliJ IDEA.
  User: zhanghui
  Date: 2022/04/26
  Time: 20:29
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="../common/head.jsp"%>
<section class="gray-simple">
  <div class="container">
    <div class="row">
      <div class="col-lg-12 col-md-12">
        <div class="property_block_wrap style-2">
          <div id="content" style="padding: 10px">
              <h2 style="padding: 5px">房屋租赁合同</h2>
              <p>出租方 :<strong>${order.ownerUser.userDisplayName}</strong>以下简称甲方</p>
              <p>身份证 :<strong>${order.ownerUser.idCard}</strong></p>
              <p>承租方 :<strong>${order.customerUser.userDisplayName}</strong>以下简称乙方</p>
              <p>出租方 :<strong>${order.customerUser.idCard}</strong></p>
              <p>根据甲、乙双方在自愿、平等、互利的基础上，经协商一致，为明确双方之间的关系。甲方将其合法拥有的房屋出租给乙方，订立以下合同</p>
            <p>一、房屋地址：<strong>${order.house.address}</strong>,房屋名称<strong>${order.house.title}</strong>。</p>
            <p>二、租赁期限以及约定</p>
            <p>1、该房屋租赁期共<strong>${order.dayNum}</strong>天。自<strong><fmt:formatDate pattern="yyyy-MM-dd" value="${order.startDate}"/></strong>到
            <strong>
              <fmt:formatDate pattern="yyyy-MM-dd" value="${order.endDate}"/>
            </strong>
            </p>
            <p>2、房屋租金：每日<strong>
              <fmt:formatNumber value="${order.monthRent/30}" pattern="#" type="number" />元，时长
              <strong>${order.dayNum}</strong>天，押金<strong>0</strong>元，共计
              <strong>${order.totalAmount}</strong>元。
            </strong>
            </p>
            <p>房屋终止，甲方验收无误后，将押金退还乙方，不计利息。</p>
              <p>篇幅有限，只做这几条为示例。</p>
          </div>
            <div style="text-align: center;margin-top: 50px">
                <!--订单的状态:-2 待签合同 -1 待付款 0 生效中 1 已到期 -3 已取消 2申请退租 3 申请退租不通过-->
                <c:choose>
                    <c:when test="${order.status == -2}" ><a href="javascript:void(0)" onclick="confirmAgreement(${order.id})"
                    class="btn btn-primary">我已经阅读并同意上述合同</a>
                    </c:when>
                    <c:when test="${order.status == -1}"><a href="/order/pay?orderId=${order.id}">去付款</a></c:when>
                    <c:when test="${order.status == 0}">合同已经生效</c:when>
                    <c:when test="${order.status == 1}">合同已经到期</c:when>
                    <c:when test="${order.status == 2}">申请退租</c:when>
                    <c:when test="${order.status == 3}">申请退租不通过</c:when>
                    <c:when test="${order.status == -3}">订单已经取消</c:when>
                </c:choose>
            </div>
            <div style="text-align: center;margin-top: 50px">
                <a href="javascript:void(0)" onclick="printHtml('content')">打印</a>
            </div>
        </div>

      </div>

    </div>

  </div>

</section>

<%@ include file="../common/footer.jsp"%>
<script>
    function printHtml(div) {
        var before = "<html><head><meta http-equiv='Content-Type' content='text/html; charset=utf-8'></head><body>";
        var print = document.getElementById(div).innerHTML;
        var result = before + print +"</body></html>"

        console.log(result);
        var wind = window.open("",'newwindow','height=300,width=700,top=100,left=100,toolbar=no,menubar=no,scrollbars=no,resizable=no,location=no,status=no');

        wind.document.body.innerHTML = result;
        wind.print();
        return  false;
    }
</script>
</body>
</html>