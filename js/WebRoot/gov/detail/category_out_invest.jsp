<%@ page language="java" pageEncoding="utf-8" %>
<%@ include file="/path.jsp" %>
<%--   <div class="detail-list" style="display: none;" id="outInvestInfo" >



		<h3 class="detail-list-h3"><span>对外投资</span><small id="searchbadge" class="searchbadge">${empty outinvestPage ? 0 : outinvestPage.total}</small></h3>
        <c:if test="${empty outinvestPage || empty outinvestPage.content }">
		<div class="detail_nodata">暂未收录该企业相关信息</div>
		</c:if>
		<c:if test="${not empty outinvestPage && not empty outinvestPage.content }">
	    <div class="panel-body" list="5" id="outinvest_list">
            <div class="mechanism-list" model>
                <div class="mechanism-list-left">
                    <a href="${fn:replace(companyDetailUrl, 'companyNo', '{0}')}" class="mechanism-link" target="_blank">{1}<small>{2}</small></a>
                    <p><span>注册号：{3}</span><span>法人: {4}</span><span>成立日期：{5}</span><span class="mechanism-link-last">地区：{6}</span></p>
                </div>
            </div>
            <c:forEach items="${outinvestPage.content}" var="outinvest" varStatus="i">
            <div class="mechanism-list">
                <div class="mechanism-list-left" >
                    <a href="${fn:replace(companyDetailUrl, 'companyNo', outinvest.companyNo)}" class="mechanism-link" target="_blank">${outinvest.companyName}<small>${outinvest.companyStatus}</small></a>
                    <p><span>注册号：${outinvest.companyCode}</span><span>法人: ${outinvest.legalPerson}</span><span>成立日期：<c:out value="${fn:substring(outinvest.establishDate,0 ,10 )}"/></span><span class="mechanism-link-last">地区：${outinvest.province}</span></p>
                </div>
            </div>
            </c:forEach>
	    </div>
		<div class="d-page" config='{name: "outinvest", url:"${basePath }/company/outinvest/list?companyNameDigest=${bizCompany.companyNameDigest}", npage:1, spage:${outinvestPage.totalPages }, total:${outinvestPage.total }, pin:2, isAjax:true, autoLoad:false}'></div>
		</c:if>
	</div>--%>


<div class="zsBlock zs_b1215" style="display: none;padding: 0 0 0;" id="outInvestInfo">
    <div class="zsBlock_edit">
        <h3>对外投资</h3>

        <c:if test="${empty outinvestPage || empty outinvestPage.content }">
            <div class="detail_nodata">暂未收录该企业相关信息</div>
        </c:if>
        <c:if test="${not empty outinvestPage && not empty outinvestPage.content }">
            <%--        <div class="invest_left" model>
                        <img src="images/zs_img04.jpg"><span></span>
                    </div>
                    <div class="invest_right" >
                        <p class="invest_right_p1">杭州娃哈哈保健食品有限公司
                            <a href="${fn:replace(companyDetailUrl, 'companyNo', '{0}')}" class="mechanism-link" target="_blank">{1}</a>
                            <span>{2}</span></p>
                        <p class="invest_right_p2">
                            <span class="invest_span1">注册号：<em>{3}</em></span>
                            <span class="invest_span2">法人：<em>{4}</em></span>
                            <span class="invest_span3">成立日期：<em><c:out value="${fn:substring(outinvest.establishDate,0 ,10 )}"/></em></span>
                        </p>
                    </div>--%>
            <div id="outinvest_list" class="zstab-block">

                <div class="zsBlock_list zsBlock_invest" list="5" model>
                    <div class="invest_left">
                        <img src="${basePath}/images/new/zs_img04.jpg"><span></span>
                    </div>
                    <div class="invest_right" >
                        <p class="invest_right_p1">
                            <a href="{0}" class="mechanism-link" target="_blank">{1}</a>
                            <span style="display: {7};">{2}</span></p>
                        <p class="invest_right_p2">
                            <span class="invest_span1" style="display: {7};">注册号：<em>{3}</em></span>
                            <span class="invest_span2" style="display: {7};">法人：<em>{4}</em></span>
                            <span class="invest_span3" style="display: {7};">成立日期：<em>{5}</em></span>
                        </p>
                    </div>
                </div>
                <c:forEach items="${outinvestPage.content}" var="outinvest" varStatus="i">
                    <div class="zsBlock_list zsBlock_invest" list="5">
                        <div class="invest_left">
                            <img src="${basePath}/images/new/zs_img04.jpg"><span></span>
                        </div>
                        <div class="invest_right" >
                           <c:if test="${!empty outinvest.companyNo}">
	                            <p class="invest_right_p1">
	                                <a href="${fn:replace(companyDetailUrl, 'companyNo', outinvest.companyNo)}"
	                                   class="mechanism-link" target="_blank">${outinvest.companyName}</a>
	                                <span>${outinvest.companyStatus}</span></p>
	                            <p class="invest_right_p2">
	                                <span class="invest_span1">注册号：<em>${outinvest.companyCode}</em></span>
	                                <span class="invest_span2">法人：<em>${outinvest.legalPerson}</em></span>
	                                <span class="invest_span3">成立日期：<em><c:out
	                                        value="${fn:substring(outinvest.establishDate,0 ,10 )}"/></em></span>
	                            </p>
                           </c:if>
                           <c:if test="${empty outinvest.companyNo}">
                          		 <p class="invest_right_p1">
	                                <a href="javascript:void(0)"  class="mechanism-link" target="_blank">${outinvest.companyName}</a>
	                              </p>
                           </c:if>
                        </div>
                    </div>
                </c:forEach>
            </div>

            <div class="d-page" config='{name: "outinvest", url:"${basePath }/gov/company/outinvest/list?companyNameDigest=${bizCompany.companyNameDigest}", npage:1, spage:${outinvestPage.totalPages }, total:${outinvestPage.total }, pin:3, isAjax:true, autoLoad:false}'></div>
        </c:if>

        <%--  <div class="zsBlock_list zsBlock_invest">
              <div class="invest_left">
                  <img src="images/zs_img04.jpg"><span></span>
              </div>
              <div class="invest_right">
                  <p class="invest_right_p1">杭州娃哈哈保健食品有限公司<span>存续</span></p>
                  <p class="invest_right_p2">
                      <span class="invest_span1">注册号：<em>1111111111111</em></span>
                      <span class="invest_span2">法人：<em>XXXXX</em></span>
                      <span class="invest_span3">成立日期：<em>2016-11-11</em></span>
                  </p>
              </div>
          </div>--%>
      <%--  <div class="zs_page">
            &lt;%&ndash;<p><span>1</span><span>2</span><span>下一页</span>&ndash;%&gt;
                <p>跳到<input onkeyup="this.value=this.value.replace(/\D/g,'')" onafterpaste="this.value=this.value.replace(/\D/g,'')" type="text" class="zs_page_in1" value="1">页<input id="out_invest_confirm_btn" type="button" value="确定" class="zs_page_in2"></p>
        </div>--%>
    </div>

</div>