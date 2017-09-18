<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/path.jsp" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>    
    <title>企业公示</title>
    <base href="${basePath}/"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
   
	<link href="${basePath}/style/new-css/gov_style.css" rel="stylesheet" type="text/css" />
	<link href="${basePath}/style/new-css/style.css" rel="stylesheet" type="text/css" />
	<link href="${basePath}/style/new/footer.css" rel="stylesheet" type="text/css" />
    <link href="${basePath}/style/jquery-ui-autocomplete.css" rel="stylesheet" type="text/css"/>
    <script data-main="${basePath }/gov/js/publicity.js" src="${basePath }/gov/js/lib/require.js"></script>
    <script type="text/javascript" src="${basePath}/js/lib/laydate/laydate.js"></script>
</head>
<body>
<jsp:include page="/gov/gov_top.jsp" />
	<div class="layout" style="    min-height: 500px;margin-bottom: 20px">
		<h2 class="pub-h2"><a href="javascript:void(0)" style="display: none" id="addBtn">+添加企业</a>企业红黑名单公示</h2>
		<div class="pub-width">
			<ul class="pub-ul">
				<li tab="keep_faith" class="current" style="border-left: none;">守信红名单</li>
				<li tab="break_faith">失信黑名单</li>
			</ul>
			<div class="pub-type" id="categoryTab">
                <div class="pub-key">企业类型</div>                
                <div class="pub-value" id="keep_faith">
                    <a tab="" href="javascript:void(0)" class="current">全部</a>
                    <c:forEach items="${keepFaithCategoryMap}" var="category">
                        <a tab="${category.key}" href="javascript:void(0)">${category.value}</a>
                    </c:forEach>
                </div>
                <div class="pub-value" id="break_faith" style="display: none">
                    <a tab="" href="javascript:void(0)" class="current">全部</a>
                    <c:forEach items="${breakFaithCategoryMap}" var="category">
                        <a tab="${category.key}" href="javascript:void(0)">${category.value}</a>
                    </c:forEach>
                </div>
            </div>
		</div>
		<h3 class="pub-h3">共 <span id="total">0</span> 条公示中的信息</h3>
		<div class="pub-width" style="border-bottom: none;">
			<table cellpadding="0" cellspacing="0" border="0">
				<tr>
					<th class="pub-t1"><span>企业名称</span></th>
					<th class="pub-t2">
                        <select style="border:0;color: #666;font-size:14px" id="cityTab">
                            <option value="">所在地</option>
                            <c:forEach items="${cityMap}" var="city">
                                <option value="${city.key}">${city.value}</option>
                            </c:forEach>
                        </select>
                    </th>
					<th class="pub-t3">公示时间</th>
					<th class="pub-t4">事由</th>
				</tr>
                <tbody id="publicityTable">
                    <tr model style="display:none" row="{4}">
                        <td class="pub-t1"><span>{0}</span></td>
                        <td class="pub-t2">{1}</td>
                        <td class="pub-t3">{2}</td>
                        <td class="pub-t4">{3}</td>
                    </tr>
                </tbody>
			</table>
		</div>
        <div class="detail_nodata" style="display: none;">
            未查询到相关信息
        </div>
		<div class="pub-page" config='{name: "publicityTable", url:"${basePath}/gov/publicity/ajax/list", nodata:".detail_nodata", isAjax:true,isShowRedict:true}'>
		</div>

	</div>


<div class="pub-pop" id="detailPop" style="display: none">

</div>


	<div class="pub-pop" id="detailModel" style="display: none">
        <div model style="display: none">
		<a href="javascript:void(0)" id="detailPopClose" class="pub-pop-c"><img src="../images/gov-images/pub-close.png"></a>

		<h2 class="pub-pop-h2">{0}</h2>
		<h3 class="pub-pop-h3">{1} 被列入<span> {2}</span></h3>
		<div class="pub-pop-main">
			<div class="pub-pop-block">
				<div class="pub-pop-left">企业类型</div>
				<div class="pub-pop-right pub-pop-r1">{3}</div>
			</div>
			<div class="pub-pop-block">
				<div class="pub-pop-left">法人姓名</div>
				<div class="pub-pop-right pub-pop-r1">{4}</div>
			</div>
			<div class="pub-pop-block">
				<div class="pub-pop-left">法人身份证号</div>
				<div class="pub-pop-right pub-pop-r1">{5}</div>
			</div>
			<div class="pub-pop-block">
				<div class="pub-pop-left">公示截止日期</div>
				<div class="pub-pop-right pub-pop-r1">{6}</div>
			</div>
			<div class="pub-pop-block">
				<div class="pub-pop-left">事由</div>
				<div class="pub-pop-right pub-pop-r1"><textarea cols="20" rows="5" disabled="disabled">{7}</textarea></div>
			</div>
			<div class="pub-pop-block">
				<div class="pub-pop-left">列入依据</div>
				<div class="pub-pop-right pub-pop-r1"><textarea cols="20" rows="5" disabled="disabled">{8}</textarea></div>
			</div>
		</div>

		<div class="pub-pop-but">
			<button onclick="window.open('${basePath}/company/professionalInfo?n={9}')">查看企业详情</button>
		</div>
        </div>
	</div>

	<div class="pub-pop" id="addPop" style="display: none">
        <form id="publicityForm" action="${basePath}/gov/publicity/ajax/add">
		<a href="javascript:void(0)" id="addPopClose" class="pub-pop-c"><img src="../images/gov-images/pub-close.png"></a>
		<div class="pub-pop-main">

			<div class="pub-pop-block">
				<div class="pub-pop-left">所属名录</div>
				<div class="pub-pop-right pub-pop-r2">
					<select name="publicityType" style="width: 322px;">
					<option value="keep_faith">守信红名单</option>
					<option value="break_faith">失信黑名单</option>
					</select>
				</div>
			</div>
			<div class="pub-pop-block">
				<div class="pub-pop-left">企业名称</div>
				<div class="pub-pop-right pub-pop-r2"><input id="companyNameKey" minlength="1" name="companyName" type="text" value="" /></div>
                <input id="companyNameDigest" name="companyNameDigest" type="hidden"/>
			</div>
			<div class="pub-pop-block pub-pop-bt">
				<div class="pub-pop-left">统一社会信用代码</div>
				<div class="pub-pop-right pub-pop-r1 "><i id="creditNo"></i></div>
			</div>
			<div class="pub-pop-block">
				<div class="pub-pop-left">法人姓名</div>
				<div class="pub-pop-right pub-pop-r1"><i id="legalPerson"></i></div>
			</div>
			<div class="pub-pop-block">
				<div class="pub-pop-left">企业类型</div>
				<div class="pub-pop-right pub-pop-r2">
					<select name="companyCategory" style="width: 322px;">
					<option value="">请选择</option>
                        <c:forEach items="${keepFaithCategoryMap}" var="category">
                            <option tab="keep_faith" value="${category.key}">${category.value}</option>
                        </c:forEach>
                        <c:forEach items="${breakFaithCategoryMap}" var="category">
                            <option tab="break_faith" style="display: none" value="${category.key}">${category.value}</option>
                        </c:forEach>

					</select>
				</div>
			</div>
			<div class="pub-pop-block">
				<div class="pub-pop-left">法人身份证号</div>
				<div class="pub-pop-right pub-pop-r2"><input type="text" name="legalPersonIdcard" /></div>
			</div>
			<div class="pub-pop-block">
				<div class="pub-pop-left">公示起止时间</div>
				<div class="pub-pop-right pub-pop-r2">
                    <input style="width:127px" name="startDate" id="startDate" type="text"/>
					<b>至</b>
					<input style="width:127px" name="endDate" id="endDate" type="text"/>
				</div>
			</div>
			<div class="pub-pop-block">
				<div class="pub-pop-left">添加事由</div>
				<div class="pub-pop-right pub-pop-r2">
					<textarea name="addReason"></textarea>
				</div>
			</div>
			<div class="pub-pop-block">
				<div class="pub-pop-left">列入依据</div>
				<div class="pub-pop-right pub-pop-r2">
					<textarea name="enrolBasis"></textarea>
				</div>
			</div>

		</div>
		<div class="pub-pop-but">
			<button type="submit">添加</button>
		</div>
        </form>
	</div>


<jsp:include page="/gov/footer.jsp" />
<script type="text/javascript">

    var start = {
        elem: '#startDate',
        format: 'YYYY-MM-DD',
//        min: laydate.now(), //设定最小日期为当前日期
//        max: '2099-06-16', //最大日期
        istime: true,
        istoday: false,
        choose: function(datas){
            end.min = datas; //开始日选好后，重置结束日的最小日期
            end.start = datas //将结束日的初始值设定为开始日
        }
    };
    var end = {
        elem: '#endDate',
        format: 'YYYY-MM-DD',
//        min: laydate.now(),
//        max: '2099-06-16',
        istime: true,
        istoday: false,
        choose: function(datas){
            start.max = datas; //结束日选好后，重置开始日的最大日期
        }
    };
    laydate(start);
    laydate(end);
</script>

</body>
</html>
