<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%@ include file="/path.jsp" %>


<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>之江信用-商贸联活动</title>
    <base href="${basePath }/"/>
    <meta http-equiv="pragma" content="no-cache">
    <meta http-equiv="cache-control" content="no-cache">
    <meta http-equiv="expires" content="0">
    <meta http-equiv="keywords" content="企业信用,企业查询,工商信息,企业工商,工商查询,企业信用查询,企业工商信息查询">
    <meta http-equiv="description"
          content="水滴信用是在国家发改委指导下的大数据企业信用评价平台。水滴信用集合社会各界信息,对企业进行综合评价,向网民实时提供企业相关的股东,法人,企业对外投资信息,信用信息,失信记录。">
    <link href="${basePath}/style/new-css/style.css" rel="stylesheet" type="text/css"/>
    <link href="${basePath }/style/new/style.css" rel="stylesheet" type="text/css"/>
    <link href="${basePath}/style/myStar.css" rel="stylesheet" type="text/css"/>
    <link href="${basePath}/style/webuploader.css" rel="stylesheet" type="text/css"/>
    <link href="${basePath}/style/jquery-ui-autocomplete.css" rel="stylesheet" type="text/css"/>
    <link href="${basePath}/style/new/trade_style.css" rel="stylesheet" type="text/css"/>

    <script data-main="${basePath }/js/uzj/taca/base_info.js" src="${basePath }/js/lib/require.js"></script>

</head>

<body style="background-color: #f2f4f8;">
<jsp:include page="../user/top.jsp"/>
<jsp:include page="top.jsp"/>
<div class="n-layout base">
    <div class="base-write">
        <h2><span>企业基本信息</span><i>浙江省商贸诚信示范企业评选</i></h2>
        <div class="base-write-main">
            <input type="hidden" id="industry_id" value="${activity.industry}"/>
            <input type="hidden" id="city_id" value="${activity.city}"/>
            <input type="hidden" id="cityCode_id" value="${activity.cityCode}"/>
            <input type="hidden" id="district_id" value="${activity.district}"/>
            <input type="hidden" id="districtCode_id" value="${activity.districtCode}"/>
            <form id="taca_base_info" action="${basePath}/taca/apply/base/info" method="post">
                <input type="hidden" name="token" value="${token}"/>
                <input type="hidden" name="id" value="${activity.id}"/>
                <i class="error-tip-i" style="display: none;top:600px;" id="errorMsg"></i>

                <p><label><i>*</i>企业名称</label><span>${sessionScope.user.customData.userOwner.companyName}</span></p>
                <p><label><i>*</i>行业分类</label>
                    <select data-attr="industry_id" style="width: 180px;" id="s1" name="industry"  type="select" typemsg="请选择行业">
                        <option value="">请选择</option>
                        <option value="批发">批发</option>
                        <option value="零售">零售</option>
                        <option value="餐饮住宿">餐饮住宿</option>
                        <option value="商贸物流">商贸物流</option>
                        <option value="电子商务">电子商务</option>
                        <option value="药品流通">药品流通</option>
                        <option value="酒类流通">酒类流通</option>
                        <option value="肉类流通">肉类流通</option>
                        <option value="汽车流通">汽车流通</option>
                        <option value="旧货流通">旧货流通</option>
                        <option value="再生资源">再生资源</option>
                        <option value="成品油销售">成品油销售</option>
                        <option value="拍卖">拍卖</option>
                        <option value="典当">典当</option>
                        <option value="租赁">租赁</option>
                        <option value="家政服务">家政服务</option>
                        <option value="美容美发">美容美发</option>
                        <option value="其他">其他</option>
                    </select>

                </p>
                <p><label><i>*</i>企业所在地</label>
                    <select data-attr="cityCode_id" id="citySelect" name="cityCode" type="select" typemsg="请选择市">
                        <option value="">选择市</option>
                    </select>
                    <select data-attr="districtCode_id" id="districtSelect" name="districtCode" type="select" typemsg="请选择区">
                        <option value="">选择区</option>
                    </select>
                    <input type="hidden" name="city" id="city"/>
                    <input type="hidden" name="district" id="district"/>
                </p>
                <p><label><i>*</i>企业联系电话</label><input style="width: 158px;" type="text" name="phoneNumber" value="${activity.phoneNumber}" minlength="1" typemsg="*请输入企业联系电话" msgtip="right" des="企业联系电话"></p>
                <p><label>企业官方网站地址</label><input style="width: 250px;" type="text" name="officialWebsite" value="${activity.officialWebsite}" ></p>
                <p><label>&nbsp;</label><button type="submit" id="to_step_one">下一步</button></p>
            </form>
        </div>
    </div>
</div>
<jsp:include page="../footer.jsp"/>
</body>
</html>
