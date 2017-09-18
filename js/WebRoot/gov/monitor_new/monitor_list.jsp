<%@ page import="java.util.Date" %>
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
                page: 'list'
            };
    </script>
<body>
<!--end gov_nav-->
<jsp:include page="../gov_top.jsp"/>
<div class="layout" style="width: 74.5%;">
	<div class="govMain" id="prepareListCallBack">
	    <div class="govList">
	        <div class="govList_h3">
	            <div class="gov_search">
	                <input placeholder="搜索列表中的企业" id="companyNameInput" type="text" value=""/>
	                <a id="searchBtn">
	                    <img src="${basePath}/images/gov-images/zs_Gsearch.png">
	                </a>
	            </div>
                <div id="selectText" class="gov1226_left" style="display: none;">
                    您已选择<span id="chooseNumber">15</span>家企业
                </div>
	            <div id="operateAllTip" class="gov1226_left" style="display: none;">
                    您已选择当前页中的<label>0</label>家企业，或<span style="text-decoration: underline;cursor:pointer;" id="deleteAll">删除全部<label>0</label>家企业</span>
	            </div>
	            <div class="gov1226_right">
	                <a href="javascript:void(0);" id="editAdd_a" class="gov1226_right_a1">+添加企业</a>
	                <div id="SelectBox">
	                    <div class="tag_select" id="filterBtn" data-attr="0" style="cursor: pointer;" risk="risk"><label>风险企业</label> <em></em></div>

	                </div>
	                <a href="javascript:void(0)" id="delete" style="display: none" class="gov1226_right_a2">删除企业</a>
	            </div>	
	        </div>
	    </div>
	    <!--end govList_gk -->
	   	<div class="govAudit_main govMonitor">
	        <table cellpadding="0" cellspacing="0" border="0">
	            <tr id="titleTr">
	            	<th class="govA3">
	            		<div class="piaochecked"><!-- on_check-->
		                <input id="operateAll" name="need_inv" type="checkbox" class="radioclass input" value="1">
		                </div>
		                                          企业名称
	            	</th>
	                <th class="govA1">
                        <div id="uboxstyle02" class="govUb ">
                            <div id="select_cityCode" class="select_box">
                                <div id="select_info_cityCode" class="tag_select" data-attr="0"
                                     style="cursor: pointer;"><label style="    cursor: pointer;">选择地区</label><em></em></div>
                                <ul id="options_cityCode" class="tag_options" data-attr="0"
                                    style="position: absolute; z-index: 999;display: none">
                                    <li class="open_selected" data-attr="0" id="selected_cityCode" style="cursor: pointer;">选择地区
                                    </li>
                                    <c:forEach items="${cityMap}" var="city">
                                        <li class="open_selected" data-attr="${city.key}">${city.value}</li>
                                    </c:forEach>
                                </ul>
                            </div>
                        </div>
	                </th>
	                <th class="govA2">
	                    <div id="uboxstyle03" class="govUb ">
	                        <div id="select_type" class="select_box">
	                            <div id="select_info_type" class="tag_select" show_length="12" data-attr="0" style="cursor: pointer;"><label show_length="14" style="    cursor: pointer;">选择分组</label><em></em></div>
	                            <ul id="options_type" class="tag_options" style="position: absolute; z-index: 999;display: none">
	                               <li class="open" data-attr="0" style="cursor: pointer;">全部</li>
                                    <c:forEach items="${typeList}" var="type">
                                        <li class="open" data-attr="${type.id}">${type.groupName}</li>
                                    </c:forEach>
	                            </ul>
	                        </div>
	                    </div>

	                </th>
	                <th class="govA4" sort="" sort-field="punishCount">行政处罚<em class="govA4-e1"></em><em class="govA4-e2"></em></th>
	                <th class="govA4" sort="" sort-field="uncreditCount">失信记录<em class="govA4-e1"></em><em class="govA4-e2"></em></th>
	                <th class="govA4" sort="" sort-field="owedTaxCount">欠税信息<em class="govA4-e1"></em><em class="govA4-e2"></em></th>
	                <th class="govA4" sort="" sort-field="judgmentCount">诉讼记录<em class="govA4-e1"></em><em class="govA4-e2"></em></th>
	                <th class="govA4" sort="" sort-field="newsCount">负面报道<em class="govA4-e1"></em><em class="govA4-e2"></em></th>
	                <th class="govA5">操作</th>
	                </tr>
	                <tbody id="companyMonitorTable">
	                <tr model style="display:none">
	                	<td class='govA3'>
	                		<div class="piaochecked"><!-- -->
			                	<input name="foreignCapitalId" type="checkbox" class="radioclass input" data-attr="{2}" value="{8}">
			                </div>
                                    {2}
	                	</td>
	                    <td class='govA1'>{0}</td>
	                    <td class='govA2'>{1}</td>
	                    <td class='govA4' data_count>{3}{9}</td>
	                    <td class='govA4' data_count>{4}{10}</td>
	                    <td class='govA4' data_count>{5}{11}</td>
	                    <td class='govA4' data_count>{6}{12}</td>
	                    <td class='govA4' data_count>{7}{13}</td>
	                    <td class='govA5'>
	                    	<a target="_blank" href='${basePath}/gov/user/company/monitor/detail/list?monitorId={8}'>详情</a>
	                        <a href="javascript:void(0)" class="deleteTag" data-attr="{8}">删除</a>
	                    </td>
	                </tr>
	                </tbody>
	            </table>
				
	        <div class="zs_page_new" config='{name: "companyMonitorTable", url:"${basePath}/gov/user/monitor/ajax/list?cityCode=0&type=0", nodata:".detail_nodata", isAjax:true,isShowRedict:true}'></div>
	        <div class="detail_nodata" style="display: none;">未查询到相关信息</div>	
	    </div>	        	  
	</div>
	</div>


	<div class="Add_pop" style="display: none;">
		<a href="javascript:void(0)" class="Add-close"><img src="${basePath}/images/gov-images/Add-close.png"></a>
		<ul id="addTab" class="Add_tit">
			<li class="current" data-mark="#batchAddContent">批量添加</li>
			<li data-mark="#addContent">按条添加</li>
		</ul>
		<div id="batchAddContent">
		<div class="Add_step" style="">
			<img src="${basePath}/images/gov-images/Add-step.png">
		</div>
		<div class="Add_btn">
			<a href="${basePath}/gov/user/monitor/download" style="color: #e35e2a;background-color: #fff;">下载企业模板</a>
            <a href="javascript:void(0)" id="excel_import_upload">上传企业名单</a>
		</div>
        </div>
		<div id="addContent" style="display:none;">
            <form id="addForm" action="${basePath}/gov/user/monitor/add" method="post">
		<div class="Add_input">
			<p><span>企业名称</span>
                <input id="companyNameKey" name="companyName" type="text" class="ui-autocomplete-input" minlength="2" des="企业名称" msgtip="innerLeft">
                <input id="companyNameDigest" name="companyNameDigest" type="hidden">
            </p>
			<p><span>类型</span><input id="companyType" name="groupName"  type="text" class="ui-autocomplete-input" minlength="2" des="企业分组" msgtip="innerLeft" ></p>
			<p><span>地区</span>
				<select name="cityCode">
                    <c:forEach items="${cityMap}" var="city">
                        <option value="${city.key}">${city.value}</option>
                    </c:forEach>
				</select>
			</p>
		</div>
		<div class="Add_btn">
			<a href="javascript:void(0)" id="submitAdd" name="ensure">添加</a>
		</div>
            </form>
        </div>
	</div>
	
	<div class="Add_pop1" id="deleteConfirm" style="display:none;">
        <input type="hidden" id="deleteType"/>
		<h3>是否删除<label id="deleteCount"></label>家企业？</h3>
		<p><button id="deleteNo">取消</button><button style="background-color: #e35e2a;color: #fff;" id="deleteYes">确认</button></p>
	</div>
	
	
	

<jsp:include page="../footer.jsp"/>
</body>
</html>
