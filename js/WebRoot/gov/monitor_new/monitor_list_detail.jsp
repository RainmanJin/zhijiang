<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" pageEncoding="UTF-8" %>
<%@ include file="/path.jsp" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>企业监测</title>
    <base href="${basePath}/"/>
    <link href="${basePath}/style/new/gov_monitor_style.css" type="text/css" rel="stylesheet"/>
    <link href="${basePath}/style/new/gov_style.css" rel="stylesheet" type="text/css"/>
    <link href="${basePath}/style/new/footer.css" rel="stylesheet" type="text/css"/>
    <link href="${basePath}/style/jquery-ui-autocomplete.css" rel="stylesheet" type="text/css"/>
    <script data-main="${basePath }/gov/js/monitor/monitor.js" src="${basePath }/gov/js/lib/require.js"></script>
    <script type="text/javascript">
        var monitorCfg = monitorCfg || {
                page: 'detail',
                companyId: '${company.companyId}',
                companyName: '${company.companyName}',
                lastReadTime:'${userCompanyMonitor.lastReadTime}'
            };
    </script>
<body class="gov_bg">

<jsp:include page="../gov_top.jsp"/>
	<div class="layout" style="width: 74.5%;">
	<div class="govMain">
	   	<div class="govDetail_top">
	        <div class="govDetail_left">
	            <div class="govAudit_logo">
	                <img src="${basePath}/images/gov-images/zs_img05.jpg">
	            </div>
	            <div class="govDetail_name">
	                <h3>${companyName}</h3>
	                <c:if test="${not empty prepaidCardMonitor}">
	                    <i class="govDetail_name_i">备案登记机关：</i>
	                    <i>宁波市贸易局 </i>
                        <em style="color: #a9a9a9;margin: 0 10px;">|</em>
                    </c:if>
	                <c:if test="${not empty prepaidCardMonitor}">
	                    <i class="govDetail_name_i">资金监管单位：</i>
	                    <i>中国银行股份有限公司</i>
	                </c:if>
	                <p id="dataTag">
	                    <span class="<c:if test="${userCompanyMonitor.punishCount>0}">span_have</c:if><c:if test="${userCompanyMonitor.punishCount<=0}">span_no</c:if>" data-target="#prodPenaltyPageDiv">行政处罚 <em>${userCompanyMonitor.punishCount}</em></span>
	                    <span class="<c:if test="${userCompanyMonitor.uncreditCount>0}">span_have</c:if><c:if test="${userCompanyMonitor.uncreditCount<=0}">span_no</c:if>" data-target="#uncrePageDiv">失信记录<em>${userCompanyMonitor.uncreditCount}</em></span>
	                    <span class="<c:if test="${userCompanyMonitor.owedTaxCount>0}">span_have</c:if><c:if test="${userCompanyMonitor.owedTaxCount<=0}">span_no</c:if>" data-target="#rentNoPayTaxDiv">欠税信息 <em>${userCompanyMonitor.owedTaxCount}</em></span>
	                    <span class="<c:if test="${userCompanyMonitor.judgmentCount>0}">span_have</c:if><c:if test="${userCompanyMonitor.judgmentCount<=0}">span_no</c:if>" data-target="#courtDocDiv">诉讼记录 <em>${userCompanyMonitor.judgmentCount}</em></span>
	                    <span class="<c:if test="${userCompanyMonitor.newsCount>0}">span_have</c:if><c:if test="${userCompanyMonitor.newsCount<=0}">span_no</c:if>" data-target="#newsDiv">负面报道 <em>${userCompanyMonitor.newsCount}</em></span>
	                </p>
	            </div>
	        </div>
	        <div class="govDetail_right">
	            <h5>
	                <a class="govColl">收藏</a>
	                <a class="govPrint">打印</a>
	            </h5>
	            <p>数据更新时间:<span>
	                <c:if test="${not empty userCompanyMonitor}">
	                <fmt:formatDate value="${userCompanyMonitor.statDate}"  type="date"/>
	                </c:if>
	            </p>
	        </div>
	    </div>
	    <div class="gov013">
	<%--        <div class="detail-list" id="detail" style="display:none;margin-bottom: 0px;border-top: 0;">
	            <h2></h2>
	            <div class="gov013_main"></div>
	            <br/>
	            <p>
	                <a href="javascript:returnTable();" id="back" style="background:#45a9ff;border-radius:5px;padding: 6px 7px;">
	                <font color="#ffffff">&nbsp&nbsp返回&nbsp&nbsp</font>
	                </a>
	            </p>
	        </div>--%>
	        <div class="detail-list" id='corpProdPenalty'>
	            <div class="panel-body" id="prodPenaltyPageDiv">
	                <p class="tax-list-p">行政处罚</p>
	                <c:if test="${empty corpProdPenaltyPage.content}">
	                    <div class="panel-table" id="enterPrisePenalty_off">暂未收录该企业相关信息</div>
	                </c:if>
	                <c:if test="${!(empty corpProdPenaltyPage.content)}">
	                    <div class="panel-table" id="corpProdPenalty_list">
	                        <table cellpadding="0" cellspacing="0" border="0">
	                            <tr>
	                                <th class="sh30">税务登记证号</th>
	                                <th class="sh31">行政处罚决定书文号</th>
	                                <th class="sh30">违法违章情况</th>
	                                <th class="sh31">现状</th>
	                                <th class="sh31">处罚日期</th>
	                                <th class="sh31">操作</th>
	                            </tr>
	                            <tbody id="corpProdPenaltyTable">
	                            <tr model style="display: none">
	                                <td class="sh30">{0}{6}</td>
	                                <td class="sh31">{1}</td>
	                                <td class="sh30">{2}</td>
	                                <td class="sh31">{3}</td>
	                                <td class="sh31">{4}</td>
	                                <td class="sh31">
	                                    <a detail-data="{5}" href="javascript:void(0) ;">查看详情</a>
	                                </td>
	                            </tr>
                                <c:forEach items="${corpProdPenaltyPage.content}" var="patent" varStatus="i">
                                    <tr>
                                        <td class="sh30">${patent.punishDocCode}<c:if test="${patent.lastupdatetime>userCompanyMonitor.lastReadTime}"><em>new</em></c:if> </td>
                                        <td class="sh31">${patent.illegalType}</td>
                                        <td class="sh30">${patent.illegalFacts}</td>
                                        <td class="sh31">${patent.punishContent}</td>
                                        <td class="sh31"><fmt:formatDate value="${patent.illegalDate}"
                                                                         pattern="yyyy/MM/dd"/></td>
                                        <td class="sh31">
                                            <a detail-data="${patent.id}" href="javascript:void(0);">查看详情</a>
                                        </td>
                                    </tr>
                                </c:forEach>
	                            </tbody>
	                        </table>
	                        <p>来源：质监部门监管信息</p>
	                        <div id="corpProdPenaltyPage" class="zs_page_new" config='{name: "corpProdPenaltyTable",url:"${basePath}/gov/user/company/monitor/detail/corpProdPenalty/list?companyNameDigest=${companyNameDigest}",nodata:".data-no-tip",
	    npage:${empty param.npage ? '1' : param.npage}, spage:${corpProdPenaltyPage.totalPages }, total:${corpProdPenaltyPage.total }, pin:5, isAjax:true,autoLoad:false}'>
	                        </div>
	                    </div>
	                </c:if>
	                <div class="panel-table" id="enterPrisePenalty" style="display: none">
	                    <table cellpadding="0" cellspacing="0" border="0">
	                        <tr>
	                            <th class="sh30">税务登记证号</th>
	                            <th class="sh31">行政处罚决定书文号</th>
	                            <th class="sh30">违法违章情况</th>
	                            <th class="sh31">现状</th>
	                            <th class="sh31">处罚日期</th>
	                            <th class="sh31">操作</th>
	                        </tr>
	                        <tbody id="enterPrisePenaltyTable">
	                        <tr model style="display: none">
	                            <td class="sh30">{0}{6}</td>
	                            <td class="sh31">{1}</td>
	                            <td class="sh30">{2}</td>
	                            <td class="sh31">{3}</td>
	                            <td class="sh31">{4}</td>
	                            <td class="sh31">
	                                <a detail-data="{5}" href="javascript:void(0) ;">查看详情</a>
	                            </td>
	                        </tr>
	                        </tbody>
	                    </table>
	                    <p>来源：国税部门监管信息</p>
	                    <div id="enterPrisePenaltyPage" class="zs_page_new" config='{name: "enterPrisePenaltyTable", url:"${basePath}/gov/user/company/monitor/detail/enterPrisePenalty/list?companyNameDigest=${companyNameDigest}", nodata:".detail_nodata", isAjax:true}'></div>
	                </div>
	                <c:if test="${empty dataRentTaxInfos}&& ${fn:length(dataRentTaxInfos)}">
	                    <div class="panel-table">暂未收录该企业相关信息</div>
	                </c:if>
	                <c:if test="${!empty dataRentTaxInfos&&fn:length(dataRentTaxInfos)>0}">
	                    <div class="panel-table">
	                        <table cellpadding="0" cellspacing="0" border="0">
	                            <tr>
	                                <th class="sh30">所属起始日期</th>
	                                <th class="sh31">所属终止日期</th>
	                                <th class="sh30">当事人身份证号</th>
	                                <th class="sh31">当事人姓名</th>
	                                <th class="sh32">判刑机构</th>
	                            </tr>
	                            <c:forEach var="rentTaxInfos" items="${dataRentTaxInfos}">
	                            <tr>
	                                <td class="sh30"><fmt:formatDate value="${rentTaxInfos.startDate}"/> <c:if test="${not empty rentTaxInfos.lastupdatetime && rentTaxInfos.lastupdatetime.time > userCompanyMonitor.lastReadTime.time}"><em>new</em></c:if> </td>
	                                <td class="sh31"><fmt:formatDate value="${rentTaxInfos.endDate}" pattern="yyyy/MM/dd"/></td>
	                                <td class="sh30">${rentTaxInfos.taxpayerCertno}</td>
	                                <td class="sh31">${rentTaxInfos.taxpayerName}</td>
	                                <td class="sh32">${rentTaxInfos.authority}</td>
	                            </tr>
	                            </c:forEach>
	                        </table>
	                        <p>来源：地方税务稽查信息</p>
	                    </div>
	                </c:if>
	            </div>
	            <div class="panel-body" id="uncrePageDiv">
	                <p class="tax-list-p">失信信息</p>

	                    <div style="display: none" id="uncreNoData" class="panel-table">暂未收录该企业相关信息</div>

	                    <div class="panel-table" id="uncre_list" style="display: none">
	                        <table cellpadding="0" cellspacing="0" border="0">
	                            <tr>
	                                <th class="sh33">案号</th>
	                                <th class="sh34">失信行为</th>
	                                <th class="sh30">立案时间</th>
	                            </tr>
	                            <tbody id="uncreTable">
	                            <tr model style="display: none">
	                                <td class="sh33">{0}{3}</td>
	                                <td class="sh34">{1}</td>
	                                <td class="sh30">{2}</td>
	                            </tr>
	                            </tbody>
	                        </table>
		                    <div id="uncrePage" class="zs_page_new" config='{name: "uncreTable",url:"${basePath}/gov/user/company/monitor/detail/uncre/list?companyNameDigest=${companyNameDigest}",nodata:"#uncreNoData",
		                  isAjax:true}'>
		                  	</div>
	                	</div>	

	            </div>
	            <div class="panel-body" id="rentNoPayTaxDiv">
	                <p class="tax-list-p">欠税信息</p>
	                <div class="panel-table" id="rentNoPayTax_off" style="display: none">暂未收录该企业相关信息</div>
	                <div class="panel-table" id="rentNoPayTax" style="display: none">
	                    <table cellpadding="0" cellspacing="0" border="0">
	                        <tr>
	                            <th class="sh35">纳税人识别号</th>
	                            <th class="sh35">法人代表或负责人</th>
	                            <th class="sh35">欠税余额</th>
	                            <th class="sh35">欠税税种</th>
	                            <th class="sh35">欠税所属期</th>
	                        </tr>
	                        <tbody id="rentNoPayTaxTable">
	                        <tr model style="display:none;">
	                            <td class="sh35">{0}{5}</td>
	                            <td class="sh35">{1}</td>
	                            <td class="sh35">{2}</td>
	                            <td class="sh35">{3}</td>
	                            <td class="sh35">{4}</td>
	                        </tr>
	                        </tbody>
	                    </table>
	                    <div id="rentNoPayTaxPage" class="zs_page_new" config='{name: "rentNoPayTaxTable",url:"${basePath}/gov/user/company/monitor/detail/rentNoPayTaxInfo/list?companyNameDigest=${companyNameDigest}",nodata:"#rentNoPayTax_off",
	                  isAjax:true}'>
	                    </div>
	                </div>
	            </div>
	            <div class="panel-body" id="courtDocDiv">
	                <p class="tax-list-p">诉讼记录</p>
	                <div class="panel-table" id="courtDocNoData" style="display: none">暂未收录该企业相关信息</div>
	                <div class="panel-table" id="courtDoc_list" style="display: none">
	                    <table cellpadding="0" cellspacing="0" border="0">
	                        <tr>
	                            <th class="sh37">文书名</th>
	                            <th class="sh38">案件性质</th>
	                            <th class="sh39">判决时间</th>
	                            <th class="sh40">详情</th>
	                        </tr>
	                        <tbody id="courtDocTable">
	                        <tr model style="display:none;">
	                            <td class="sh37">{0}{4}</td>
	                            <td class="sh38">{1}</td>
	                            <td class="sh39">{2}</td>
	                            <td class="sh40"><a detail-data="{3}" href="javascript:void(0);">详情</a></td>
	                        </tr>
	                        </tbody>
	                    </table>
                        <div id="courtDocPage" class="zs_page_new"
                             config='{name: "courtDocTable",url:"${basePath}/gov/user/company/monitor/detail/court/list?companyNameDigest=${companyNameDigest}",nodata:"#courtDocNoData",
                  isAjax:true}'></div>
	                </div>
	            </div>
	            <div class="panel-body" id="newsDiv" style="    margin-bottom: 20px;">
	                <p class="tax-list-p" style="margin-bottom: 0px;">负面报道</p>
	                <div class="zsReport_list zsReport_h5" id="negativeNone" style="display: none;padding: 18px 0 15px 23px;">
	                    <h5>暂无报道</h5>
	                </div>		
	                <div id="negativeMediaReport" style="" mark="negaDiv" data-attr="media">
	                    <div class="zsReport_list" model style="display: none;">
	                        <a target="_blank" href="${basePath }/detail/detail_haosou.jsp?url={0}&s=${company.companyNo}&name=${company.companyName}">{1}{4}</a>
	                        <p>发布时间：<span>{3}</span></p>
	                        <p>来源：<span>{2} </span></p>
	                    </div>
	                </div>
	                <div id='negativeMediaReport_page' class="zs_page_new" style="margin-top: 5px;" config='{name: "negativeMedia", url:"${basePath }/gov/user/company/monitor/detail/ajax/media/list?companyId=${company.companyId}&isPositive=2", npage:1, pin:2, isAjax:true, nodata:"#negativeNone",isShowRedict:true}'></div>
	            </div>
	            <a target="_blank" href="${basePath}/gov/company/professionalInfo?s=${company.companyNo}" style="color: #fff;background-color:#e35e2a;padding: 11px 70px;margin-top: 10px;margin-left: 42%;border-radius: 6px; ">查看更多信息</a>
	        
	        </div>
	    </div>	        
	</div>
	</div>

	
	
	<div class="Detail_pop" id="detail" style="display: none">
		<a href="javascript:void(0)" class="Add-close"><img src="${basePath}/images/gov-images/Add-close.png"></a>
		<h2>诉讼记录：（2012）浙嘉民终字第109号</h2>
		<div class="Detail_top">
			<p><span>案号：</span>（2012）浙嘉民终字第109号</p>
			<p><span>案件性质：</span>民事案件</p>
			<p><span>法院名称：</span>浙江省嘉兴市中级人民法院</p>
			<p><span>判决时间：</span>二〇一二年四月二十七日</p>
			<p style="width: 100%;"><span>文书名：</span>周能训与嘉兴麦宝科技信息有限公司劳动合同纠纷二审民事判决书</p>
		</div>
		<div class="Detail_main">
			<p>上诉人（原审被告）：嘉兴麦宝科技信息有限公司</p>
			<p>法定代表人：叶海峰</p>
			<p>委托代理人：毕珊珊</p>
			<p>被上诉人（原审原告）：周能训</p>
			<p>委托代理人：顾海峰</p>
			<p>上诉人嘉兴麦宝科技信息有限公司与被上诉人周能训劳动合同纠纷一案，不服南湖区人民法院（2011）嘉南民初字第3180号民事判决，向本院提起上诉。本院2012年2月13日受理后，依法组成合议庭，于2012年4月18日公开开庭进行了审理。本案现已审理终结。 原审法院审理认定，2010年9月14日，嘉兴麦宝科技信息有限公司（以下简称麦宝科技）与周能训签订《劳动合同》一份，约定周能训到麦宝科技工作，任公司采购部经理。合同期限为2010年9月15日至2013年9月14日，其中试用期为2010年9月15日至2010年12月14日。麦宝科技经嘉兴市劳动和社会保障局（现嘉兴市人力资源和社会保障局）批准，实行不定时工作制。在劳动合同履行过程中，周能训在试用期间的工资为6000元，试用期满后的工资为9250元。周能训因请假，其2011年1月、2月及5月的工资分别被扣款2490.38元、355.77元、2312.50元，
			周能训劳动合同纠纷一案，不服南湖区人民法院（2011）嘉南民初字第3180号民事判决，向本院提起上诉。本院2012年2月13日受理后，依法组成合议庭，于2012年4月18日公开开庭进行了审理。本案现已审理终结。 原审法院审理认定，2010年9月14日，嘉兴麦宝科技信息有限公司（以下简称麦宝科技）与周能训签订《劳动合同》一份，约定周能训到麦宝科技工作，任公司采购部经理。合同期限为2010年9月15日至2013年9月14日，其中试用期为2010年9月15日至2010年12月14日。麦宝科技经嘉兴市劳动和社会保障局（现嘉兴市人力资源和社会保障局）批准，实行不定时工作制。在劳动合同履行过程中，周能训在试用期间的工资为6000元，试用期满后的工资为9250元。周能训因请假，其2011年1月、2月及5月的工资分别被扣款2490.38元、355.77元、2312.50元，周能训劳动合同纠纷一案，不服南湖区人民法院（2011）嘉南民初字第3180号民事判决，向本院提起上诉。本院2012年2月13日受理后，依法组成合议庭，于2012年4月18日公开开庭进行了审理。本案现已审理终结。 原审法院审理认定，2010年9月14日，嘉兴麦宝科技信息有限公司（以下简称麦宝科技）与周能训签订《劳动合同》一份，约定周能训到麦宝科技工作，任公司采购部经理。合同期限为2010年9月15日至2013年9月14日，其中试用期为2010年9月15日至2010年12月14日。麦宝科技经嘉兴市劳动和社会保障局（现嘉兴市人力资源和社会保障局）批准，实行不定时工作制。在劳动合同履行过程中，周能训在试用期间的工资为6000元，试用期满后的工资为9250元。周能训因请假，其2011年1月、2月及5月的工资分别被扣款2490.38元、355.77元、2312.50元，周能训劳动合同纠纷一案，不服南湖区人民法院（2011）嘉南民初字第3180号民事判决，向本院提起上诉。本院2012年2月13日受理后，依法组成合议庭，于2012年4月18日公开开庭进行了审理。本案现已审理终结。 原审法院审理认定，2010年9月14日，嘉兴麦宝科技信息有限公司（以下简称麦宝科技）与周能训签订《劳动合同》一份，约定周能训到麦宝科技工作，任公司采购部经理。合同期限为2010年9月15日至2013年9月14日，其中试用期为2010年9月15日至2010年12月14日。麦宝科技经嘉兴市劳动和社会保障局（现嘉兴市人力资源和社会保障局）批准，实行不定时工作制。在劳动合同履行过程中，周能训在试用期间的工资为6000元，试用期满后的工资为9250元。周能训因请假，其2011年1月、2月及5月的工资分别被扣款2490.38元、355.77元、2312.50元，</p>
		</div>
		<h3 class="Add-back"><img src="${basePath}/images/gov-images/Add-back.png"></h3>
	</div>
<jsp:include page="../footer.jsp"/>
</body>
</html>
