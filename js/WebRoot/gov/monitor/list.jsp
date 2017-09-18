<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" pageEncoding="UTF-8" %>
<%@ include file="/path.jsp" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>预付卡企业监测-之江信用</title>
    <base href="${basePath}/"/>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta http-equiv="pragma" content="no-cache"/>
    <meta http-equiv="cache-control" content="no-cache"/>
    <meta http-equiv="expires" content="0"/>
    <meta name="renderer" content="webkit|ie-comp|ie-stand">
    <meta http-equiv="keywords" content="企业查询,中小企业,三资企业,民营企业,私营企业,黄页大全"/>
    <meta http-equiv="description" content="之江信用提供中小企业,民营企业信息查询,私营企业信用查询服务。"/>
    <link href="${basePath}/style/new/gov_style.css" rel="stylesheet" type="text/css"/>
    <link href="${basePath }/style/new/footer.css" rel="stylesheet" type="text/css" />
    <script data-main="${basePath }/gov/js/monitor/monitor.js" src="${basePath }/gov/js/lib/require.js"></script>
    <script type="text/javascript">

        var monitorCfg = monitorCfg || {
                    page:'list'
                };

    </script>
</head>

<body class="container container-jg" data-attr1="companyMonitore" data-attr="clue">

<jsp:include page="/gov/gov_top.jsp"/>
<!--end nav-->

<jsp:include page="/gov/monitor/left.jsp"/>
<div class="right">
    <div class="right-banner">
        <p class="banner-s">
            <input id="companyNameInput" name="" type="text"  placeholder="请输入企业名"/>
            <a id="searchBtn"></a>
        </p>
  <%--      <p style="float: right;padding: 24px 20px 0 0 ">时间：2015年</p>--%>
    </div>
    <div class="content">
        <div class="content-infor">
            <div class="circ">
                <%-- <div class="circ-t">
                    <h4><span>浙江省单用途商业预付卡备案企业查询：</span>
                        <select name="" id="cityCode" onchange="typeOrCityChange()">
                            <option value="0" selected="selected">选择地区</option>
                            <c:forEach items="${cityMap}" var="city">
                                <option value="${city.key}">${city.value}</option>
                            </c:forEach>
                        </select>
                        <select name="" id="type" onchange="typeOrCityChange()">
                            <option value="0" selected="selected">选择类型</option>
                            <option value="1">流通企业类型</option>
                            <option value="2">预付卡企业类型</option>
                        </select>
                        <a name="" href="${basePath}/gov/user/company/monitor/prepare/list" style="background: #e39717; color: #fff; display: inline-block; padding: 3px 21px; border-radius: 4px;"  id="editCompanyMonitor">编辑</a>
                    </h4>
                  <!--   <p>时间：2015年</p> -->
                </div> --%>
                <table cellpadding="0" cellspacing="0" border="0">
                    <tr>
                        <th class="c1">
                           <select name="" id="cityCode" style="border: 1px solid #ccc;height: 26px;">
                             <option value="0" selected="selected">选择地区</option>
                             <c:forEach items="${cityMap}" var="city">
                                <option value="${city.key}">${city.value}</option>
                             </c:forEach>
                           </select>                                                 
                        </th>
                        <th class="c1">
                           <select name="" id="type" style="border: 1px solid #ccc;height: 26px;">
                              <option value="0" selected="selected">选择分组</option>
                               <c:forEach items="${typeList}" var="type">
                                   <option value="${type.id}">${type.groupName}</option>
                               </c:forEach>
                  <%--            <option value="1">流通企业类型</option>
                              <option value="2">预付卡企业类型</option>--%>
                           </select>                                          
                        </th>
                        <th class="c2">企业名称</th>
                        <th class="c1">行政处罚</th>
                        <th class="c1">失信记录</th>
                        <th class="c1">欠税信息</th>
                        <th class="c1">诉讼记录</th>
                        <th class="c1">媒体公告</th>
                        <th class="c1">操作</th>

                    </tr>
                    <tbody id="companyMonitorTable">
                    <tr model style="display:none"><td class='c1'>{0}</td>
                        <td class='c1'>{1}</td>
                        <td class='c2'>{2}</td>
                        <td class='c1' data_count>{3}</td>
                        <td class='c1' data_count>{4}</td>
                        <td class='c1' data_count>{5}</td>
                        <td class='c1' data_count>{6}</td>
                        <td class='c1' data_count>{7}</td>
                        <td class='c1'><a href='${basePath}/gov/user/company/monitor/detail/list?monitorId={8}'>详情</a></td></tr>
                    </tbody>
                </table>
                    <div class="f-page" config='{name: "companyMonitorTable", url:"${basePath}/gov/user/company/monitor/ajax/list?cityCode=0&type=0", nodata:".detail_nodata", isAjax:true}'></div>
                <div class="detail_nodata" style="display: none;">
               		未查询到相关信息
        		</div>
            </div>
        </div>
    </div>
</div>
<jsp:include page="/gov/footer.jsp" />
</body>
</html>
