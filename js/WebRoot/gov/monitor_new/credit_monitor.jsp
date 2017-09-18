<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" pageEncoding="UTF-8" %>
<%@ include file="/path.jsp" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>企业信用概况</title>
    <base href="${basePath}/"/>
    <link href="${basePath}/style/new/gov_monitor_style.css" type="text/css" rel="stylesheet" />
    <script type="text/javascript" src="${basePath }/gov/js/lib/My97DatePicker/WdatePicker.js"></script>
    <script data-main="${basePath }/gov/js/monitor/monitor_credit.js" src="${basePath }/gov/js/lib/require.js"></script>
<body class="gov_bg">
<jsp:include page="monitor_top.jsp" />
<jsp:include page="monitor_left.jsp" />
	<div class="govMain govMain_new">
		<div class="govList">			
			<div class="govList_main_tit">
				<div class="gov_width gov_width3"></div>
				<div class="govList_h3">信用等级统计</div>
			</div>			
			<div class="govList_gk">
				<div class="gov_width gov_width3"></div>
				<div class="govList_tb1213">
					<div class="tb1213_p1">
						<p>本省企业数量分布情况<span>（备注：数据更新截至到<label id="statDateStr"></label>之前）</span></p>
						<div class="tb1213_time"><input class="Wdate" type="text"
                                                        id="statDate"
                                                        onchange="javascript:statDateChang()"
                                                        onFocus="WdatePicker({skin:'whyGreen',isShowClear:false,readOnly:true,dateFmt:'yyyy-MM'})"/></div>
					</div>
					<div class="govTable"  id="creditList">
						<table cellpadding="0" cellspacing="0" border="0">
							<tr>
								<th class="gT_t1">排名</th>
								<th class="gT_t1">城市</th>
								<th class="gT_t1">企业总数</th>
								<th class="gT_t1">AAA级</th>
								<th class="gT_t1">AA级</th>
								<th class="gT_t1">A级</th>
								<th class="gT_t1">B级</th>
								<th class="gT_t1">C级</th>
							</tr>
                            <tr id="creditModel" model style="display: none">
                                <td class="gT_t1 gT_t1_top"><span class="{0}">{1}</span></td>
                                <td class="gT_t1 gT_t1_b2">{2}</td>
                                <td class="gT_t1 gT_t1_b3"><a href="${basePath}/search?cityCode={9}&curCreditType=" target="_blank">{3}</a></td>
                                <td class="gT_t1 gT_t1_b4"><a href="${basePath}/search?cityCode={9}&curCreditType=AAA" target="_blank">{4}</a></td>
                                <td class="gT_t1 gT_t1_b4"><a href="${basePath}/search?cityCode={9}&curCreditType=AA" target="_blank">{5}</a></td>
                                <td class="gT_t1 gT_t1_b4"><a href="${basePath}/search?cityCode={9}&curCreditType=A" target="_blank">{6}</a></td>
                                <td class="gT_t1 gT_t1_b4"><a href="${basePath}/search?cityCode={9}&curCreditType=B" target="_blank">{7}</a></td>
                                <td class="gT_t1 gT_t1_b4"><a href="${basePath}/search?cityCode={9}&curCreditType=C" target="_blank">{8}</a></td>
                            </tr>
                            <tbody id="creditBody">

                            </tbody>
						</table>
                        <img name="noData" src='${basePath}/images/gov-images/nodata.jpg' style='width: 660px; height: 260px;display: none' />
					</div>
				</div>
				<div class="gov_width gov_width3"></div>
			</div>
			<div class="govList_gk">
				<div class="gov_width gov_width3"></div>
				<div class="govList_tb1213">
					<div class="tb1213_p1">
						<p>各地区信用等级趋势</p>
						<div class="tb1213_time">
                            <input class="Wdate" type="text"
                                   id="startDate"
                                   onchange="javascript:dateChang()"
                                   onFocus="WdatePicker({skin:'whyGreen',isShowClear:false,readOnly:true,dateFmt:'yyyy-MM',maxDate:'#F{$dp.$D(\'endDate\')}'})"/>
                            <input class="Wdate" type="text"
                                   id="endDate"
                                   onchange="javascript:dateChang()"
                                   onFocus="WdatePicker({skin:'whyGreen',isShowClear:false,readOnly:true,dateFmt:'yyyy-MM',minDate:'#F{$dp.$D(\'startDate\')}'})"/>

                        </div>
					</div>
					<div class="indust" style="width: 100%">
						<div class="indust_sub">
							<p class="indust_p1">地 区：</p>
							<p class="indust_p2" id="citySelect">
                                <input type="hidden" id="cityCode"/>
                                <input type="hidden" id="city"/>
                                <c:forEach items="${cityMap}" var="city">
                                    <span city-code="${city.key}">${city.value}</span>
                                </c:forEach>
                               <%-- <span class="current">杭州</span>
                                <span>宁波</span><span>温州</span><span>金华</span><span>嘉兴</span><span>台州</span><span>湖州</span><span>绍兴</span><span>衢州</span><span>丽水</span><span>舟山</span>--%>
                            </p>
						</div>
						<div class="indust_main1214">
                            <div id="creditTendency" style="width:auto;height:400px;"></div>
						</div>
					</div>
				</div>
				<div class="gov_width gov_width3"></div>
			</div>
		</div>			
	</div>
	
</body>
</html>
