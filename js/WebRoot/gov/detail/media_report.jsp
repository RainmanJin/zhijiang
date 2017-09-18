<%@ page language="java" pageEncoding="utf-8"%>
<%@ include file="/path.jsp"%>
<%--<div class="detail-list  zsBlock_edit zsBlock_pad" style="display: none;" id="mediaReportInfo">
	<h3 class="">
		<span>正面报道</span><small id="searchbadgePositive" class="searchbadge">0</small>
	</h3>
	<div class="detail_nodata" id="positiveNone">暂未收录该企业相关信息</div>
	<div class="detail-rep zstab-block" id="positiveMediaReport">
		<div class="detail-rep-tit" model>
			<h3>
				<i></i>
				<a href="${basePath }/detail/detail_haosou.jsp?url={0}&s=${bizCompany.companyNo}&name=${bizCompany.companyName}" target="blank">{1}</a>
			</h3>
			<h4>
				<span>来源：{2}</span><span>{3}</span>
			</h4>
		</div>
	</div>
	<div class="d-page" config='{name: "positiveMedia", url:"${basePath }/company/ajax/media/list?companyId=${bizCompany.companyId}&isPositive=1", npage:1, pin:2, isAjax:true, nodata:"#positiveNone"}'></div>
	

	<h3 class="">
		<span>负面报道</span><small id="searchbadgeNegative" class="searchbadge" data-content="">0</small>
	</h3>
	<div class="detail_nodata" id="negativeNone">暂未收录该企业相关信息</div>
	<div class="detail-rep zstab-block" id="negativeMediaReport">
		<div class="detail-rep-tit" model>
			<h3>
				<i></i>
				<a href="${basePath }/detail/detail_haosou.jsp?url={0}&s=${bizCompany.companyNo}&name=${bizCompany.companyName}" target="blank">{1}</a>
			</h3>
			<h4>
				<span>来源：{2}</span><span>{3}</span>
			</h4>
		</div>
	</div>
	<div class="d-page" config='{name: "negativeMedia", url:"${basePath }/company/ajax/media/list?companyId=${bizCompany.companyId}&isPositive=2", npage:1, pin:2, isAjax:true, nodata:"#negativeNone"}'></div>
</div>--%>


<div class="zsBlock" style="display: none;" id="mediaReportInfo">
    <div class="zsBlock_edit">
        <h3>媒体报道<span id="media_report_count_num" style="display: none">0</span></h3>
        <div class="zsReport">
            <div class="zsReport_ul">
                <ul id="mediaTab">
                    <li data-mark="#positiveMediaReport,#positiveNo"  class="current">正面报道<span class="zsReport_s1">(<small id="searchbadgePositive" >0</small>)</span><span class="zsReport_s2"><em></em></span></li>
                    <li data-mark="#negativeMediaReport,#negativeNo">负面报道<span>(<small id="searchbadgeNegative" data-content="">0</small>)</span><span class="zsReport_s2"><em></em></span></li>
                </ul>
            </div>
            <div id="positiveNo">
                <div class="zsReport_list zsReport_h5" id="positiveNone" >
                    <h5>暂无报道</h5>
                </div>
            </div>
            <div id="negativeNo" style="display: none">
                <div class="zsReport_list zsReport_h5" id="negativeNone">
                    <h5>暂无报道</h5>
                </div>
            </div>
            <div id="positiveMediaReport">

                <div class="zsReport_list" model>
                    <a href="${basePath }/gov/detail/detail_haosou.jsp?url={0}&s=${bizCompany.companyNo}&name=${bizCompany.companyName}">{1}</a>
                    <p>发布时间：<span>{3}</span></p>
                    <p>来源：<span>{2} </span></p>
                </div>
                <div class="d-page" config='{name: "positiveMedia", url:"${basePath }/gov/company/ajax/media/list?companyId=${bizCompany.companyId}&isPositive=1", npage:1, pin:2, isAjax:true, nodata:"#positiveNone"}'></div>
            </div>
            <div id="negativeMediaReport" style="display: none">
                <div class="zsReport_list" model>
                    <a href="${basePath }/gov/detail/detail_haosou.jsp?url={0}&s=${bizCompany.companyNo}&name=${bizCompany.companyName}">{1}</a>
                    <p>发布时间：<span>{3}</span></p>
                    <p>来源：<span>{2} </span></p>
                </div>

                <div class="d-page" config='{name: "negativeMedia", url:"${basePath }/gov/company/ajax/media/list?companyId=${bizCompany.companyId}&isPositive=2", npage:1, pin:2, isAjax:true, nodata:"#negativeNone"}'></div>
            </div>
        </div>
    </div>

</div>