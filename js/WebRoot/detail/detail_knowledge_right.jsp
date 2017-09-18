<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/path.jsp" %>
		<div class="detail-list zsBlock_pad zs_b1215" id="knowledgeInfo" style="display: none">

            <div class="tab-block zsBlock_edit" style="margin-top: 0;">            
           		<h3 class="" id="tminfo_div">商标<small id="searchbadge" class="searchbadge" data-content="">${empty tmInfoPage ? 0 : tmInfoPage.total}</small></h3>
               	<c:if test="${empty tmInfoPage.content }">
               		<div class="detail_nodata">暂未收录该企业相关信息</div>
               	</c:if>
               	<c:if test="${not empty tmInfoPage.content }">
               	   <div class="ipr zstab-block">
	                   <div class="ipr-link" id="tmInfoTypeBtns">
	                       <a class="current" href="javascript:;" data-status="">全部</a>
	                       <a href="javascript:;" data-status="1">有效<span>(${empty tmInfoBean.tmInfoEffectiveCount ? 0 : tmInfoBean.tmInfoEffectiveCount})</span></a>
	                       <a href="javascript:;" data-status="3">待审<span>(${empty tmInfoBean.tmInfoWaiteCount ? 0 : tmInfoBean.tmInfoWaiteCount})</span></a>
	                       <a href="javascript:;" data-status="2">无效<span>(${empty tmInfoBean.tmInfoInvalidCount ? 0 : tmInfoBean.tmInfoInvalidCount})</span></a>
	                       <a href="javascript:;" data-status="6">其他<span>(${empty tmInfoBean.tmInfoOtherCount ? 0 : tmInfoBean.tmInfoOtherCount })</span></a>
	                   </div>
	                   <div class="ipr-list">
	                       <ul id="tmInfoList">
	                       	   <c:forEach var="tmInfo" items="${tmInfoPage.content }" varStatus="i">
		                       	   <li class="${i.count % 2 == 0 ? '' : 'ipr-list-left' }">
		                       	   	   <div class="ipr-left">
			                       	   	   <span></span>
			                       	   	   <img mark="tm_img" src="${tmInfo.imgUrl }" onerror="javascript:this.style.display='none'" />
		                       	   	   </div>
		                               <div class="ipr-right">
		                                   <p show_length="12">${tmInfo.tmName}</p>
		                                   <h4><span class="ipr-fl">分类：</span><span >${tmInfo.intCls } - ${tmInfo.type }</span></h4>
		                                   <h4><span class="ipr-fl" >状态：</span><span class="ipr-f0"  show_length="12">${tmInfo.catName }</span></h4>
		                               </div>
	                           	   </li>
	                       	   </c:forEach>
	                       	   <li class="{0}" model>
	                       	   	   <div class="ipr-left">
		                       	   	   <span></span>
		                       	   	   {1}
	                       	   	   </div>
	                               <div class="ipr-right">
	                                   <p show_length="12">{2}</p>
	                                   <h4><span class="ipr-fl">分类：</span><span>{3} - {4}</span></h4>
	                                   <h4><span class="ipr-fl" >状态：</span><span show_length="12">{5}</span></h4>
	                               </div>
                           	   </li>
	                       </ul>
	                   </div>
               	   </div>
               	   <div class="d-page" config='{name: "tminfo", url:"${basePath }/company/tminfo/list?companyNameDigest=${bizCompany.companyNameDigest}", npage:1, spage:${tmInfoPage.totalPages }, total:${tmInfoPage.total }, pin:2,nodata:tminfoNodata, isAjax:true, autoLoad:false}'></div>
               	 	<div class="detail_nodata" id="tminfoNodata" style="display:none">暂未收录该企业相关信息</div>
               	</c:if>
    		</div>
    		
			<div class="tab-block zsBlock_edit" style="display: none" id="patentpage_div">
            	<h3 class="">
            		专利<small id="searchbadge" class="searchbadge" data-content="">${empty patentpage ? 0 : patentpage.total}</small>
            	</h3>
           		<c:if test="${empty patentpage.content}">
					<div class="detail_nodata">暂未收录该企业相关信息</div>
				</c:if>
				<c:if test="${!(empty patentpage.content)}">
					<div class="panel-body zstab-block" list="10">
						<table cellpadding="0" cellspacing="0" border="0">
							<tr>
								<th class="sd08" style="width:120px;">序号</th>
								<th class="sd05">专利名称</th>
								<th class="sd09">类型</th>
								<th class="sd10" style="width: 145px">申请日</th>
								<th class="sd07">详情</th>
							</tr>
							<tbody id="patent_list">
								<tr model>
									<td class="sd08" style="width:120px;">{0}</td>
									<td class="sd05">{1}</td>
									<td class="sd09">{2}</td>
									<td class="sd10" style="width: 145px">{3}</td>
									<td class="sd07"><a href="javascript:patentDetail({4});">详情</a></td>
								</tr>
								<c:forEach items="${patentpage.content}" var="patent" varStatus="i">
									<tr tag_attr="now_data">
										<td class="sd08" style="width:120px;">${patent.patentNo}</td>
										<td class="sd05">${patent.patentName}</td>
										<td class="sd09">${patent.patentType}</td>
										<td class="sd10" style="width: 145px"><fmt:formatDate value="${ patent.patentDate }" pattern="yyyy-MM-dd" /></td>
										<td class="sd07"><a href="javascript:patentDetail(${patent.id});">详情</a></td>
									</tr>
							</c:forEach>
							</tbody>
						</table>
					</div>
					<div class="d-page" config='{name: "patent", url:"${basePath }/company/patent/list?companyNameDigest=${bizCompany.companyNameDigest}", npage:1, spage:${patentpage.totalPages }, total:${patentpage.total }, pin:2, isAjax:true, autoLoad:false}'></div>
				</c:if>
			</div>
		
			<div class="tab-block zsBlock_edit" id="honorInfo" style="display: none; pading-bottom:10px;">
	           	<h3 class="">
	           		行政许可资质<small id="searchbadge" class="searchbadge" data-content="">${empty honorpage ? 0 : honorpage.total}</small>
	           	</h3>
				<c:if test="${empty honorpage.content}">
					<div class="detail_nodata">暂未收录该企业相关信息</div>
				</c:if>
                <c:if test="${!(empty honorpage.content)}">
	           	<div class="change zstab-block" style="margin-top: 20px;">


		                <div class="change-table" style="border-right:none;">
		                    <ul class="license-detail" id="honor_list">
		                    	<li model>
		                        	<div class="license">{0}</div>
		                            <ul class="license-right">
		                                <p class="license-t">{1}</p>
		                                <li>{2}</li>
		                                <li><label>生效日期：</label><span>{3}</span></li>
		                                <li><label>截止日期：</label><span>{4}</span></li>
		                            </ul>
	                         	</li>
			                    <c:forEach items="${honorpage.content}" var="honor" varStatus="i">
									<li>
			                        	<div class="license"><img src="${honor.thumbnail}" /></div>
			                            <ul class="license-right">
			                                <p class="license-t">${honor.honorName}</p>
			                                <li>${honor.authority}</li>
			                                <li><label>生效日期：</label><span><fmt:formatDate value="${honor.notBefore}" pattern="yyyy-MM-dd"/></span></li>
			                                <li><label>截止日期：</label><span><fmt:formatDate value="${honor.notAfter}" pattern="yyyy-MM-dd"/></span></li>
			                            </ul>
		                         	</li>
		                        </c:forEach>
	                 		</ul>
		                </div>


				</div>
                <div class="d-page" config='{name: "honor", url:"${basePath }/company/honor/list?companyId=${bizCompany.companyId}", npage:1, spage:${honorpage.totalPages }, total:${honorpage.total }, pin:2, isAjax:true, autoLoad:false}'></div>
                </c:if>
			</div>
		<!--end detail-list-->
		<div class="tab-block zsBlock_edit" style="display: none; pading-bottom:10px;" id="company_honor">
           	<h3 class="">
           		企业荣誉<small id="searchbadge" class="searchbadge" data-content="">0</small>
           	</h3>
           	<div class="zsBlock_list zsIn"> <p>暂未收录该企业无相关信息</p></div>	
		</div>
		<!--end detail-list-->
        <div class="tab-block zsBlock_edit" style="display: none" id="software_div">
           	<h3 class="">
           		软件著作权<small id="searchbadge" class="searchbadge" data-content="">${empty softwarepage ? 0 : softwarepage.total}</small>
           	</h3>
          		<c:if test="${empty softwarepage.content}">
				<div class="detail_nodata">暂未收录该企业相关信息</div>
			</c:if>
			<c:if test="${!(empty softwarepage.content)}">
				<div class="panel-body zstab-block">
					<table cellpadding="0" cellspacing="0" border="0">
						<tr>
							<th class="sd16">软件名称</th>
							<th class="sd17">登记日期</th>
						</tr>
						<tbody id="software_list">
							<tr model>
								<td class="sd16">{0}</td>
								<td class="sd17">{1}</td>
							</tr>
							<c:forEach items="${softwarepage.content}" var="software">
								<tr>
									<td class="sd16">${software.softwareName}</td>
									<td class="sd17"><fmt:formatDate value="${software.regDate }" pattern="yyyy-MM-dd" />
									</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
				<div class="d-page" config='{name: "copyrightsoftware", url:"${basePath }/company/copyrightsoftware/list?companyNameDigest=${bizCompany.companyNameDigest}", npage:1, spage:${softwarepage.totalPages }, total:${softwarepage.total }, pin:2, isAjax:true, autoLoad:false}'></div>
			</c:if>
		</div>
		<!--end tab-block-->
		<div class="tab-block zsBlock_edit" style="display: none" id="bookpage_div">
        	<h3 class="">
           		作品著作权<small id="searchbadge" class="searchbadge" data-content="">${empty bookpage ? 0 : bookpage.total}</small>
           	</h3>
          	<c:if test="${empty bookpage.content}">
				<div class="detail_nodata">暂未收录该企业相关信息</div>
			</c:if>
            <c:if test="${!(empty bookpage.content)}">
	        <div class="panel-body zstab-block">
                <table cellpadding="0" cellspacing="0" border="0">
                    <tr>
                        <th class="sd18" style="width: 55.1%;">作品名称</th>
                        <th class="sd19" style="width: 21.6%;">作品类别</th>
                        <th class="sd17" style="width: 23.3%;">登记日期</th>
                    </tr>
                    <tbody id="book_list">
                    	<tr model>
	                        <td class="sd18">{0}</td>
	                        <td class="sd19">{1}</td>
	                        <td class="sd17">{2}</td>
	                    </tr>
	                    <c:forEach items="${bookpage.content}" var="book">
	                    <tr tag_attr="now_data">
	                        <td class="sd18">${book.bookName}</td>
	                        <td class="sd19">${book.bookType}</td>
	                        <td class="sd17"><fmt:formatDate value="${book.regDate}" pattern="yyyy-MM-dd"/></td>
	                    </tr>	
			    		</c:forEach>
                    </tbody>
	        	</table>
	        </div>
	        <div class="d-page" config='{name: "copyrightbook", url:"${basePath }/company/copyrightbook/list?companyNameDigest=${bizCompany.companyNameDigest}", npage:1, spage:${bookpage.totalPages }, total:${bookpage.total }, pin:2, isAjax:true, autoLoad:false}'></div>
			</c:if>
		</div>
        <!--end tab-block-->
		<div class="tab-block zsBlock_edit" style="display: none" id="websites_div">
			<h3 class="">
				域名
				<small id="searchbadge" class="searchbadge" data-content="">
					${empty uwcWebsites ? 0 : fn:length(uwcWebsites)}
				</small>
			</h3>
			<c:if test="${empty uwcWebsites}">
				<div class="detail_nodata">暂未收录该企业相关信息</div>
			</c:if>


			<c:if test="${!(empty uwcWebsites)}">
				<div class="panel-body zstab-block">

					<c:forEach var="website" items="${uwcWebsites}" varStatus="i">
						<div class="domain ${i.count%2!=0 ? 'domain-margin' : ''}">
							<h4>${website.websiteName}</h4>
							<p><span>网址：</span>${website.domain}</p>
							<p><span>网站备案/许可证号：</span>${website.icp}</p>
						</div>
					</c:forEach>
				</div>
			</c:if>

		</div>
	</div>
