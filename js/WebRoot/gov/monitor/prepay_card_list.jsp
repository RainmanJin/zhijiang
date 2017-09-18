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
    <script data-main="${basePath }/gov/js/monitor/prepay_card.js" src="${basePath }/gov/js/lib/require.js"></script>
    <script type="text/javascript">
        var prepayCardCfg = prepayCardCfg || {
                    page:'list'
                };
    </script>
</head>

<body class="container container-jg" data-attr1="prepayCard" data-attr="clue">

<jsp:include page="/gov/gov_top.jsp"/>
<!--end nav-->

<jsp:include page="/gov/monitor/left.jsp"/>
<div class="right">
    <div class="right-banner">
        <p class="banner-s">
            <input name="" type="text"  placeholder="请输入企业名或企业名包含的关键词"/>
            <a href="#"></a>
        </p>
    </div>
    <div class="content">
        <div class="content-infor">
            <div class="circ">
                <div class="circ-t">
                    <h4><span>浙江省单用途商业预付卡备案企业查询：</span>
                        <select name="" id="areaUl">
                            <option value="">请选地区</option>
                            <c:forEach items="${cityMap}" var="city">
                                <option value="${city.key}" <c:if test="${cityCode==city.key}">selected</c:if>>${city.value}</option>
                            </c:forEach>
                        </select>
                        <%--                        <select name="">
                                                    <option>默认全部</option>
                                                    <option>优秀企业</option>
                                                    <option>不合格企业</option>
                                                </select>--%>
                        <%--<a name="" style="background: #e39717; color: #fff; display: inline-block; padding: 8px 25px; border-radius: 4px;"  id="searchCompanyMonitor">查询</a>--%>
                        <a name="" href="${basePath}/gov/user/company/monitor/prepay/card/user/list" style="background: #e39717; color: #fff; display: inline-block; padding: 3px 21px; border-radius: 4px;"  id="editCompanyMonitor">编辑</a>
                    </h4>
                    <p>时间：2015年</p>
                </div>
                <table cellpadding="0" cellspacing="0" border="0" id="companyMonitorTable">
                    <tr>
                        <%--<th class="c1">企业类型</th>--%>
                        <th class="c1">地区</th>
                        <th class="c2">企业名称</th>
                        <th class="c1">备案号</th>
                        <th class="c1">行政处罚</th>
                        <th class="c1">失信记录</th>
                        <th class="c1">欠税信息</th>
                        <th class="c1">法院公告</th>
                        <th class="c1">媒体公告</th>
                        <th class="c1">操作</th>

                    </tr>
                    <tbody id="prepayCardTable">
                                   <tr model style="display: none">
                                            <td class="c1">{0}</td>
                                            <td class="c1">{1}</td>
                                            <td class="c2">{2}</td>
                                            <td class="c1">{3}</td>
                                            <td class="c1">{4}</td>
                                            <td class="c1">{5}</td>
                                            <td class="c1">{6}</td>
                                            <td class="c1">{7}</td>
                                            <td class="c1"><a href="${basePath}/gov/user/company/monitor/detail/list?data_attr=prepayCard&companyNameDigest={8}">详情</a></td>
                                        </tr>
                    </tbody>
                </table>
                <div class="f-page" config='{name: "prepayCardTable", url:"${basePath}/gov/user/company/monitor/prepay/card/ajax/list?cityCode=${cityCode}", nodata:".data-no-tip", isAjax:true}'></div>
<%--
            </div>
            <%--      <div class="circ">
                    <p class="mbc_title">
                      <em class="mbc_line"></em>
                      <span class="mbc_title_warp"><em class="font_f_1">2015年度省重点流通企业信用排名<i></i></em></span>
                    </p>
                    <div class="circ-qy">
                      <div class="circ-qy-left">
                        <ul>
                          <li class="current">优秀企业</li>
                          <li>不合格企业</li>
                        </ul>
                        <p class="left-sort"><span><img src="../images/gov-images/up-icon.png" /></span><span><img src="../images/gov-images/down-icon.png" /></span></p>
                        <p class="right-sort"><img src="../images/gov-images/zx-icon.png" /></p>
                      </div>
                      <div class="circ-wz">
                        <div class="circ-wz-list">
                          <p><em class="em-yellow">1、</em>浙江省物产集团有限公司<span class="span-yellow">780分</span></p>
                          <p><em class="em-yellow">2、</em>浙江省国际贸易集团有限公司<span class="span-yellow">760分</span></p>
                          <p><em class="em-yellow">3、</em>浙江省兴合集团有限责任公司<span class="span-yellow">660分</span></p>
                          <p><em>4、</em>阿里巴巴（中国）网络技术有限公司<span>550分</span></p>
                          <p><em>5、</em>浙江陆通物流有限公司<span>550分</span></p>
                          <p><em>6、</em>浙江传化物流基地有限公司<span>550分</span></p>
                          <p><em>7、</em>颐高集团有限公司<span>550分</span></p>
                          <p><em>8、</em>浙江凯虹集团有限公司<span>550分</span></p>
                        </div>
                        <div class="circ-wz-list circ-list-border">
                          <p><em>9、</em>浙江省物产集团有限公司<span>780分</span></p>
                          <p><em>10、</em>浙江省国际贸易集团有限公司<span>760分</span></p>
                          <p><em>11、</em>浙江省兴合集团有限责任公司<span>660分</span></p>
                          <p><em>12、</em>阿里巴巴（中国）网络技术有限公司<span>550分</span></p>
                          <p><em>13、</em>浙江陆通物流有限公司<span>550分</span></p>
                          <p><em>14、</em>浙江传化物流基地有限公司<span>550分</span></p>
                          <p><em>15、</em>颐高集团有限公司<span>550分</span></p>
                          <p><em>16、</em>浙江凯虹集团有限公司<span>550分</span></p>
                        </div>
                        <div class="circ-wz-list">
                          <p><em>17、</em>浙江省物产集团有限公司<span>780分</span></p>
                          <p><em>2、</em>浙江省国际贸易集团有限公司<span>760分</span></p>
                          <p><em>3、</em>浙江省兴合集团有限责任公司<span>660分</span></p>
                          <p><em>4、</em>阿里巴巴（中国）网络技术有限公司<span>550分</span></p>
                          <p><em>5、</em>浙江陆通物流有限公司<span>550分</span></p>
                          <p><em>6、</em>浙江传化物流基地有限公司<span>550分</span></p>
                          <p><em>7、</em>颐高集团有限公司<span>550分</span></p>
                          <p><em>8、</em>浙江凯虹集团有限公司<span>550分</span></p>
                        </div>
                      </div>
                    </div>
                  </div>--%>
        </div>
</div>
    </div>
</div>
<jsp:include page="/gov/footer.jsp" />
</body>

</html>
