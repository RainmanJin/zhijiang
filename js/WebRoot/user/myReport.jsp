<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/path.jsp" %>

<html xmlns="http://www.w3.org/1999/xhtml">
  <head>
    <title>之江信用-举报管理</title>
    <base href="${basePath }/" />
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="企业信用,企业查询,工商信息,企业工商,工商查询,企业信用查询,企业工商信息查询">
	<meta http-equiv="description" content="水滴信用是在国家发改委指导下的大数据企业信用评价平台。水滴信用集合社会各界信息,对企业进行综合评价,向网民实时提供企业相关的股东,法人,企业对外投资信息,信用信息,失信记录。">
	<link href="${basePath}/style/new-css/style.css" rel="stylesheet" type="text/css" />
	<link href="${basePath}/style/new-css/bootstrap.css" rel="stylesheet" type="text/css" />
	<link href="${basePath }/style/style.css" rel="stylesheet" type="text/css" />
	<link href="${basePath }/style/new/style.css" rel="stylesheet" type="text/css" />
	<script data-main="${basePath }/js/uzj/user.js" src="${basePath }/js/lib/require.js"></script>
	<script type="text/javascript">
		var userCfg = userCfg || {};
	</script>
	
  </head>
  
 <body>
	<jsp:include page="../user/top.jsp" />
    <!--end banner-->
    <div class="container-group">
        <div class="content">
        	<jsp:include page="/user/left.jsp"/>
            <div class="drop-right">
            	<h2>举报管理</h2>
                <div class="drop-date">
                	<p>当前企业</p>
                    <input id="borrowerdebtAmount" type="hidden" readonly="" value="-1" name="borrower.debtAmount">
                        <div class="nice-select nice-left" style="z-index:9999;" value="true" name="nice-select">
                        <input type="text" readonly="" value="上海凭安网络科技有限公司" name="address">
                        <ul style="display:none">
                            <li>vbdsffffff</li>
                            <li>vbdsffffff</li>
                            <li>vbdsffffff</li>
                        </ul>
                        </div>
                </div>
                <div class="message-title1">
                	<ul>
                        <li class="message-title2"><a href="javascript:void(0)" class="current">未处理举报</a></li>
                        <li><a href="javascript:void(0)">已处理举报</a></li>
                    </ul>
                </div>
                <div class="drop-name">
                <table cellpadding="0" cellspacing="0" border="0" style="position:relative;">
                	<tr>
                        <th class="name23">举报人</th>
                        <th class="name24">举报内容</th>
                        <th class="name25">状态</th>
                        <th class="name26">举报时间</th>
                        <th class="name16">操作</th>
                    </tr>
                    <tr>
                        <td class="name23"><a href="javascript:void(0)">一刁木子</a></td>
                        <td class="name24">这辣鸡企业劳资被骗了500万。</td>
                        <td class="name25">隐藏</td>
                        <td class="name26">2015年7月7日</td>
                        <td class="name16"><a href="javascript:void(0)">查看</a></td>
                    </tr>
                    <tr>
                        <td class="name23"><a href="javascript:void(0)">一刁木子一刁木子一刁木子一刁木子一刁木子一刁木子一刁木子</a></td>
                        <td class="name24">这辣鸡企业劳资被骗了500万。这辣鸡企业劳资被骗了500万。</td>
                        <td class="name25">隐藏</td>
                        <td class="name26">2015年7月7日</td>
                        <td class="name16"><a href="javascript:void(0)">查看</a></td>
                    </tr>
                    <tr>
                        <td class="name23"><a href="javascript:void(0)">一刁木子</a></td>
                        <td class="name24">这辣鸡企业劳资被骗了500万。</td>
                        <td class="name25">隐藏</td>
                        <td class="name26">2015年7月7日</td>
                        <td class="name16"><a href="javascript:void(0)">查看</a></td>
                    </tr>
                </table>
                </div>
                <div class="drop-name">
                <table cellpadding="0" cellspacing="0" border="0">
                	<tr>
                        <th class="name27">举报人</th>
                        <th class="name28">举报内容</th>
                        <th class="name25">状态</th>
                        <th class="name29">驳回原因</th>
                        <th class="name26">举报时间</th>
                        <th class="name26">处理时间</th>
                        <th class="name16">操作</th>
                    </tr>
                    <tr>
                        <td class="name23"><a href="javascript:void(0)">一刁木子</a></td>
                        <td class="name24" title="这辣鸡企业劳资被骗了500万。">这辣鸡企业劳资被骗了500万。</td>
                        <td class="name25">隐藏</td>
                        <td class="name29">展开</td>
                        <td class="name26">2015年7月7日</td>
                        <td class="name26">2015年7月7日</td>
                        <td class="name16"><a href="javascript:void(0)">继续反馈</a></td>
                    </tr>
                    <tr>
                        <td class="name23"><a href="javascript:void(0)">一刁木子</a></td>
                        <td class="name24" title="这辣鸡企业劳资被骗了500万。">这辣鸡企业劳资被骗了500万。</td>
                        <td class="name25">隐藏</td>
                        <td class="name29">展开</td>
                        <td class="name26">2015年7月7日</td>
                        <td class="name26">2015年7月7日</td>
                        <td class="name16"><a href="javascript:void(0)"></a></td>
                    </tr>
                    <tr>
                        <td class="name23"><a href="javascript:void(0)">一刁木子</a></td>
                        <td class="name24" title="这辣鸡企业劳资被骗了500万。">这辣鸡企业劳资被骗了500万。</td>
                        <td class="name25">隐藏</td>
                        <td class="name29">无</td>
                        <td class="name26">2015年7月7日</td>
                        <td class="name26">2015年7月7日</td>
                        <td class="name16"><a href="javascript:void(0)">继续反馈</a></td>
                    </tr>
                </table>
                </div>
                
            </div>
        </div>
    </div>

</body>
</html>
