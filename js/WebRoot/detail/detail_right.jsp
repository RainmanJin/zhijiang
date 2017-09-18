<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/path.jsp"%>
<%--

<div class="col-md">
    <jsp:include page="/detail/right_capital_dymaincs.jsp" />
</div>
--%>

<div class="zsEwm zsRight_bottom">
    <img src="${basePath}/favicon.ico" style="display:none" id="codeLogo" alt=""/>
    <p class="zsEwm_p1"><em></em>企业信用码</p>
    <div style="width:100%" id="qrcode"></div>
    <%--<img src="images/zs_ewm.jpg">--%>
    <p class="zsEwm_p2">只需轻松扫一扫</p>
    <p class="zsEwm_p2">企业信用详情即可速递到您的手上</p>
    <p class="zsEwm_p3"><a id="qrcode_download" href="javascript:void(0);">点击下载可供企业多载体投放</a></p>
</div>
<div class="zsRight_block zsRight_a1">
    <p class="zsRight_b1" style="text-align: left;">企业图谱</p>
 <img style="margin: 19px 13px;" src="${basePath }/images/new/tupu.png" >
    <%--<input type="button" id="toFindCompanyRelationShips" value="发现企业间的隐藏关系">--%>
    <a href="${basePath}/company/schema/list?s=${bizCompany.companyNo}" class=" zs_newb" target="_blank">发现企业间的隐藏关系</a>
</div>


<div class="zsRight_block zsRight_a2" style="border-bottom: 0;" id="recentSearched">
    <p class="zsRight_b1" >最近被查询企业</p>
</div>

<%--
<div class="col-md">
	<jsp:include page="/detail/right_capital_dymaincs.jsp" />
    <!--==end 资本动态==-->
    <div class="recent" >
        <img src="${basePath}/favicon.ico" style="display:none" id="codeLogo" alt=""/>
        <h3 class="detail-list-h3"><span>企业信用码</span></h3>
        <div class="right-list" style="margin:20px 0;width: 95%">
            <div style="width:100%" id="qrcode"></div>
            <div style="margin:15px 0;border-bottom: 1px solid #e7e7e7;padding-bottom: 9px;">只需轻松扫一扫，企业信用详情即可速递到您的手上</div>
            <div>点击<a id="qrcode_download" style="font-size: 16px;color:#2f97de;text-align: center;" href="javascript:void(0);">下载</a>可供企业多载体投放</div>
        </div>
    </div>
    <!--==end 二维码==-->
    <div class="panel">
        <div class="title"><h2>企业图谱</h2></div>
        <div >
            <a href="${basePath}/company/schema/list?s=${bizCompany.companyNo}" class="pic" target="_blank"><img src="${basePath }/images/new/tupu.png"  /></a>
            <a href="${basePath}/company/schema/list?s=${bizCompany.companyNo}" class="btn" target="_blank">发现企业间的隐藏关联</a>
        </div>    
        </a>
    </div>
    <!--==end 企业图谱==-->
    <div class="recent" >
    	<h3 class="detail-list-h3"><span>最近被查询的企业</span></h3>
   		<div class="right-list">
			<ul id="recentSearched" ></ul>
		</div>
    </div>
    <!--==end 最近被查询的企业==-->
    &lt;%&ndash;<div class="recent">&ndash;%&gt;
        &lt;%&ndash;<h3 class="detail-list-h3"><span>最近搜索公司</span></h3>&ndash;%&gt;
        &lt;%&ndash;<p><a href="javascript:void(0)">浙江开化同力电子科技有限公司</a></p>&ndash;%&gt;
        &lt;%&ndash;<p><a href="javascript:void(0)">杭州贝因美母婴营养品有限公司</a></p>&ndash;%&gt;
        &lt;%&ndash;<p><a href="javascript:void(0)">杭州方星电子有限公司</a></p>&ndash;%&gt;
        &lt;%&ndash;<p><a href="javascript:void(0)">杭州新白鹿餐饮管理有限公司</a></p>&ndash;%&gt;
        &lt;%&ndash;<p class="recent-last"><a href="javascript:void(0)">浙江圣地亚大酒店有限公司</a></p>	&ndash;%&gt;
    &lt;%&ndash;</div>&ndash;%&gt;
    &lt;%&ndash;<jsp:include page="/detail/right_media_report.jsp" />&ndash;%&gt;
    <!--==媒体报道==-->
</div>
--%>
<!--==end right==-->
<%--
<script type="text/javascript">
    $(function(){
        //二维码
        (function(){
            var img_src = $('#qrcode').find('img').attr('src');
            if(browserIsIe()){//假如是ie浏览器
                $('#qrcode_download').on('click',function(){
                    DownLoadReportIMG(img_src);
                });
            }else{
                $('#qrcode_download').attr('download',img_src);
                $('#qrcode_download').attr('href',img_src);

                $('#qrcode_download').on('click',function(){
                    $('#qrcode_download').attr('download',img_src);
                    $('#qrcode_download').attr('href',img_src);
                });
            }

        })();
    });

    function DownLoadReportIMG(imgPathURL) {
        //如果隐藏IFRAME不存在，则添加
        if (!document.getElementById("IframeReportImg"))
            $('<iframe style="display:none;" id="IframeReportImg" name="IframeReportImg" onload="DoSaveAsIMG();" width="0" height="0" src="about:blank"></iframe>').appendTo("body");
        if (document.all.IframeReportImg.src != imgPathURL) {
            //加载图片
            document.all.IframeReportImg.src = imgPathURL;
        }
        else {
            //图片直接另存为
            DoSaveAsIMG();
        }
    }
    function DoSaveAsIMG() {
        if (document.all.IframeReportImg.src != "about:blank")
            window.frames["IframeReportImg"].document.execCommand("SaveAs");
    }
    //判断是否为ie浏览器
    function browserIsIe() {
        if (!!window.ActiveXObject || "ActiveXObject" in window)
            return true;
        else
            return false;
    }

--%>
<%--
</script>--%>
