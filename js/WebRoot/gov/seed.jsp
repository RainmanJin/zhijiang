<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" pageEncoding="UTF-8" %>
<%@ include file="/path.jsp" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>之江信用-直播首页</title>
    <base href="${basePath}/"/>
    <link href="${basePath}/style/style.css" rel="stylesheet" type="text/css"/>
    <link href="${basePath}/style/new/footer.css" rel="stylesheet" type="text/css" />
    <link href="${basePath}/style/new/style.css" rel="stylesheet" type="text/css" />
    <script data-main="${basePath }/gov/js/config/seed.js" src="${basePath }/gov/js/lib/require.js"></script>
</head>

<body>
<div class="seed-banner">
    <div class="inner">
        <h1 class="new-h1"><a href="${basePath }/gov/<%=response.encodeURL("index") %>"><img src="${basePath}/images/kitchen/small-logo.png"/></a></h1>
        <div id="infoMessage" ></div>
        <div class="inner-menu">
            <a href="${basePath }/gov/index">首页</a>
            <c:if test="${sessionScope.user.userType==3 }">
              <a href="${basePath}/gov/user/ecshop/operate">电商监管</a>
            </c:if>
            <a href="${basePath}/gov/user/companysearch">外资促进</a>
            <a href="${basePath}/gov/user/foreigntrade/list">外贸服务</a>
            <c:if test="${sessionScope.user.userType==3 }">
              <a href="${basePath}/gov/user/platformbrandstat/list">品牌保护</a>
              <a href="${basePath }/gov/user/company/monitor">企业监管</a>
            </c:if>
            <a href="${basePath}/gov/news/list">信用文化</a>
            <a href="${basePath }/about/about_us.jsp">关于我们</a>
        </div>
        <c:if test="${user.userType !=3 }">
            <div class="dropdown" id="userCenterDiv" style="display:none;top:52px;">
                <s><b></b></s>
                <ul class="profile-navigation" id="userCenterLi">
                    <a class="current" href="${basePath }/user/myAccount.jsp"><li>我的主页</li></a>
                    <a href="${basePath }/user/comment/<%=response.encodeURL("list")%>"><li>我的评论</li></a>
                    <a href="${basePath }/user/myClaim.jsp"><li>认领企业</li></a>
                    <c:if test="${user.userType == 2 }">
                        <a href="${basePath }/user/owner/<%=response.encodeURL("list") %>" ><li>我的企业</li></a>
                        <a href="${basePath }/user/datum/<%=response.encodeURL("list") %>" ><li>资料管理</li></a>
                        <a href="${basePath }/user/authorization/<%=response.encodeURL("list") %>">	<li>管理授权</li></a>
                    </c:if>
                    <a href="${basePath }/user/exit"><li>退出</li></a>
                </ul>
            </div>
        </c:if>
        <c:if test="${user.userType == 3 }">
            <div class="dropdown" id="userCenterDiv" style="display:none;top:35px;">
                <ul class="profile-navigation" id="userCenterLi">
                    <a href="${basePath }/gov/exit"><li>退出</li></a>
                </ul>
            </div>
        </c:if>
        <div class="inner-login">
            <c:if test="${user.userName == null }">
                <a href="${basePath }/gov/<%=response.encodeURL("toLogin") %>">登录</a>
                <a href="${basePath }/user/<%=response.encodeURL("toRegister") %>" class="inner-rg">注册</a>
            </c:if>
            <c:if test="${user.userName != null }">
                <span id="userNameLabel" style="cursor: pointer;">欢迎：${user.userDigestedName}</span>
                <a href="javascript:void(0)"><img src="${basePath }/images/down-icon.png"></img></a>
            </c:if>


        </div>
    </div>
</div>
<div class="seed-show">
    <div class="seed-show-center">
        <img src="${basePath}/images/kitchen/new-tp1.png"/>

        <h2>您与外界的餐厅后厨，其实只隔了一个屏幕的距离</h2>

        <h3>—————诚信厨房直播ing</h3>
    </div>
</div>
<div class="inner settled">
    <h2>—— 已入驻的明星餐厅后厨 ——</h2>

    <div class="settled-main">
        <a href="#"><img class="menu-prev" src="${basePath}/images/kitchen/menu-prev.png"/></a>

        <div class="menu-groove">
            <div class="groove-block">
                <div class="groove-score">
                    <h4>301</h4>

                    <p>信用良好</p>
                </div>
                <img src="${basePath}/images/kitchen/sj01.jpg"/>
            </div>

            <div class="groove-block">
<%--                <a href="#" class="groove-hover" style="">
                    <img src="images/kitchen/live-icon.png"/>

                    <div class="hover-wz">
                        <span class="span-wz1">评论数 256</span><span class="span-wz2">播放量 256</span>
                    </div>
                </a>--%>

                <div class="groove-score">
                    <h4>302</h4>

                    <p>信用良好</p>
                </div>
                <img src="${basePath}/images/kitchen/sj02.jpg"/>
            </div>

            <div class="groove-block">
                <div class="groove-score">
                    <h4>303</h4>

                    <p>信用良好</p>
                </div>
                <img src="${basePath}/images/kitchen/sj03.jpg"/>
            </div>
            <div class="groove-block groove-last">
                <div class="groove-score">
                    <h4>304</h4>

                    <p>信用良好</p>
                </div>
                <img src="${basePath}/images/kitchen/sj04.jpg"/>
            </div>
        </div>
        <a href="#"><img class="menu-next" src="${basePath}/images/kitchen/menu-next.png"/></a>
    </div>
</div>
<div class="seed-bg">
    <div class="inner seed-content">
        <div class="seed-tv">
            <div class="tv-show" param="<param name='flashvars' value='sn=36030137753&poster=http%3A%2F%2Fq.jia.360.cn%2Fpublic%2FviewImage%3FimgKey%3D1470575fe1a87793ec4dfaab8c47281a675ebba3-1-1-5-740-415.jpg%26sn%3D36030137753&autostart=true&ctrbarhide=true&buffertime=3&streamversion=2&channel=22280'>">
                <a target="_blank">
                    <div class="show-icon"><img src="${basePath}/images/kitchen/show-icon.png"/>永芳老香帮面</div>
                    <img style="width: 210px;height: 131px;" src="https://live2.jia.360.cn/public/viewImage?imgKey=6ee46c6c037f1f99321f381c1578435ddd612e06-2-1-5-736-414.jpg&sn=36030137753" />
                </a>
            </div>
            <div class="tv-show" param="<param name='flashvars' value='sn=36020191055&poster=http%3A%2F%2Fq.jia.360.cn%2Fpublic%2FviewImage%3FimgKey%3D6cf669f6aeb92afee9c95a8f3e8ed00fc143e3cf-1-1-5-740-415.jpg%26sn%3D36020191055&autostart=true&ctrbarhide=true&buffertime=3&streamversion=2&channel=12979'>">
                <a target="_blank" >
                    <div class="show-icon"><img src="${basePath}/images/kitchen/show-icon.png"/>景德镇火车站黄焖鸡米饭</div>
                    <img style="width: 210px;height: 131px;" src="https://live2.jia.360.cn/public/viewImage?imgKey=8b3ea12fb8afe7cae5a06f735f338f0a750ba908-2-1-5-736-414.jpg&sn=36020191055"/>
                </a>
            </div>
            <div class="tv-show" param="<param name='flashvars' value='sn=36060722278&poster=http%3A%2F%2Fq.jia.360.cn%2Fpublic%2FviewImage%3FimgKey%3Dc86b1aa9e74cd1701ee915a7567c22c2c182bf7e-1-1-5-740-415.jpg%26sn%3D36060722278&autostart=true&ctrbarhide=true&buffertime=3&streamversion=1&channel=10758'>">
                <a target="_blank" >
                    <div class="show-icon"><img src="${basePath}/images/kitchen/show-icon.png"/>大头</div>
                    <img style="width: 210px;height: 131px;" src="http://q.jia.360.cn/public/viewImage?imgKey=c86b1aa9e74cd1701ee915a7567c22c2c182bf7e-1-1-5-740-415.jpg&sn=36060722278"/>
                </a>
            </div>
<%--            <div class="tv-show" param="<param name='flashvars' value='sn=36030184672&poster=http%3A%2F%2Fq.jia.360.cn%2Fpublic%2FviewImage%3FimgKey%3D410d736f0c854267fc2cbef82b3bb25cd7d21af9-5-740-415.jpg%26sn%3D36030184672&autostart=true&ctrbarhide=true&buffertime=3&streamversion=1&channel=11076'>">
                <a target="_blank" >
                    <div class="show-icon"><img src="images/kitchen/show-icon.png"/>c m z g</div>
                    <img style="width: 210px;height: 131px;" src="http://q.jia.360.cn/public/viewImage?imgKey=f76b172e4a2b8ccbf49b5187ec5fcb587ec32ac5-5-740-415.jpg&sn=36030184672"/>
                </a>
            </div>
            <div class="tv-show" param="<param name='flashvars' value='sn=36030078044&poster=http%3A%2F%2Fq.jia.360.cn%2Fpublic%2FviewImage%3FimgKey%3Dc1d05e58b47a5ab477385f7841a00ae73c1e71e0-5-740-415.jpg%26sn%3D36030078044&autostart=true&ctrbarhide=true&buffertime=3&streamversion=1&channel=24273'>">
                <a target="_blank">
                    <div class="show-icon"><img src="images/kitchen/show-icon.png"/>成家面厨</div>
                    <img style="width: 210px;height: 131px;" src="http://q.jia.360.cn/public/viewImage?imgKey=257faef9111d87e9e4b4e161dfa610eeb9894c30-5-740-415.jpg&sn=36030078044"/>
                </a>
            </div>--%>
            <%--<div class="tv-show">
                <a href="#">
                    <div class="show-icon"><img src="images/kitchen/show-icon.png"/>知味观的后厨</div>
                </a>
                <img  src="images/kitchen/sj05.jpg"/>
            </div>
            <div class="tv-show">
                <a href="#">
                    <div class="show-icon"><img src="images/kitchen/show-icon.png"/>知味观的后厨</div>
                </a>
                <img src="images/kitchen/sj05.jpg"/>
            </div>
             <div class="tv-show">
                 <a href="#">
                     <div class="show-icon"><img src="images/kitchen/show-icon.png"/>知味观的后厨</div>
                 </a>
                 <img src="images/kitchen/sj05.jpg"/>
             </div>
             <div class="tv-show">
                 <a href="#">
                     <div class="show-icon"><img src="images/kitchen/show-icon.png"/>知味观的后厨</div>
                 </a>
                 <img src="images/kitchen/sj05.jpg"/>
             </div>
             <div class="tv-show">
                 <a href="#">
                     <div class="show-icon"><img src="images/kitchen/show-icon.png"/>知味观的后厨</div>
                 </a>
                 <img src="images/kitchen/sj05.jpg"/>
             </div>
             <div class="tv-show">
                 <a href="#">
                     <div class="show-icon"><img src="images/kitchen/show-icon.png"/>知味观的后厨</div>
                 </a>
                 <img src="images/kitchen/sj05.jpg"/>
             </div>
             <div class="tv-show">
                 <a href="#">
                     <div class="show-icon"><img src="images/kitchen/show-icon.png"/>知味观的后厨</div>
                 </a>
                 <img src="images/kitchen/sj05.jpg"/>
             </div>
             <div class="tv-show">
                 <a href="#">
                     <div class="show-icon"><img src="images/kitchen/show-icon.png"/>知味观的后厨</div>
                 </a>
                 <img src="images/kitchen/sj05.jpg"/>
             </div>
             <div class="tv-show">
                 <a href="#">
                     <div class="show-icon"><img src="images/kitchen/show-icon.png"/>知味观的后厨</div>
                 </a>
                 <img src="images/kitchen/sj05.jpg"/>
             </div>
             <div class="tv-show">
                 <a href="#">
                     <div class="show-icon"><img src="images/kitchen/show-icon.png"/>知味观的后厨</div>
                 </a>
                 <img src="images/kitchen/sj05.jpg"/>
             </div>--%>
<%--            <div class="tv-show">
                <a href="#">
                    <div class="show-icon"><img src="images/kitchen/show-icon.png"/>知味观的后厨</div>
                </a>
                <img src="images/kitchen/sj05.jpg"/>
            </div>--%>
<%--            <div class="seed-page">
                <a href="#"><img src="images/kitchen/menu-prev.png"/></a>
                <a href="#" class="seed-page-last"><img src="images/kitchen/menu-next.png"/></a>
            </div>--%>
        </div>
        <div class="seed-comment">
            <div class="seed-pad">
                <p class="comment-title"><span>最新评论</span></p>

                <div class="commentcon">
                    <div class="userphoto">
                        <a href="#"><img src="${basePath}/images/kitchen/new-head.png"/></a>
                    </div>
                    <div class="bar">
                        <h4><span class="bar-name">奔跑的五花肉</span>来自<span class="bar-source">“奎元馆的后厨”</span></h4>

                        <p>原来大厨们平常都这么欢乐额，哈哈哈哈哈</p>
                        <h5>2小时</h5>
                    </div>
                </div>
                <div class="commentcon">
                    <div class="userphoto">
                        <a href="#"><img src="${basePath}/images/kitchen/new-head.png"/></a>
                    </div>
                    <div class="bar">
                        <h4><span class="bar-name">奔跑的五花肉</span>来自<span class="bar-source">“奎元馆的后厨”</span></h4>

                        <p>原来大厨们平常都这么欢乐额，哈哈哈哈哈</p>
                        <h5>2小时</h5>
                    </div>
                </div>
                <div class="commentcon">
                    <div class="userphoto">
                        <a href="#"><img src="${basePath}/images/kitchen/new-head.png"/></a>
                    </div>
                    <div class="bar">
                        <h4><span class="bar-name">奔跑的五花肉</span>来自<span class="bar-source">“奎元馆的后厨”</span></h4>

                        <p>原来大厨们平常都这么欢乐额，哈哈哈哈哈</p>
                        <h5>2小时</h5>
                    </div>
                </div>
                <div class="commentcon">
                    <div class="userphoto">
                        <a href="#"><img src="${basePath}/images/kitchen/new-head.png"/></a>
                    </div>
                    <div class="bar">
                        <h4><span class="bar-name">奔跑的五花肉</span>来自<span class="bar-source">“奎元馆的后厨”</span></h4>

                        <p>原来大厨们平常都这么欢乐额，哈哈哈哈哈</p>
                        <h5>2小时</h5>
                    </div>
                </div>
                <div class="commentcon">
                    <div class="userphoto">
                        <a href="#"><img src="${basePath}/images/kitchen/new-head.png"/></a>
                    </div>
                    <div class="bar">
                        <h4><span class="bar-name">奔跑的五花肉</span>来自<span class="bar-source">“奎元馆的后厨”</span></h4>

                        <p>原来大厨们平常都这么欢乐额，哈哈哈哈哈</p>
                        <h5>2小时</h5>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<div class="inner recommend">
    <h2>—— 之江推荐 ——</h2>

    <div class="recommend-show">
        <div class="show-add">
            <div class="show-one">
                <div class="show-score">
                    <img src="${basePath}/images/kitchen/sj-tp1.png"/>
                </div>
                <img src="${basePath}/images/kitchen/sj06.jpg"/>
            </div>
            <p>团队全心打造满意100的用户体验，营造用心请客户的氛围</p>
        </div>
        <div class="show-add">
            <div class="show-one">
                <div class="show-score">
                    <img src="${basePath}/images/kitchen/sj-tp2.png"/>
                </div>
                <img src="${basePath}/images/kitchen/sj07.jpg"/>
            </div>
            <p>团队全心打造满意100的用户体验，营造用心请客户的氛围</p>
        </div>
        <div class="show-add">
            <div class="show-one">
                <div class="show-score">
                    <img src="${basePath}/images/kitchen/sj-tp3.png"/>
                </div>
                <img src="${basePath}/images/kitchen/sj08.jpg"/>
            </div>
            <p>团队全心打造满意100的用户体验，营造用心请客户的氛围</p>
        </div>
        <div class="show-add">
            <div class="show-one">
                <div class="show-score">
                    <img src="${basePath}/images/kitchen/sj-tp4.png"/>
                </div>
                <img src="${basePath}/images/kitchen/sj09.jpg"/>
            </div>
            <p>团队全心打造满意100的用户体验，营造用心请客户的氛围</p>
        </div>
    </div>
</div>
<div class="seed-pop" style="display: none;z-index: 100;">
    <a id="closeBtn" style="display: none;"></a>
    <div class="seed-pop-pad">
        <div class="" style=" background-color:#363636;background-size:cover;height:468px;width:100%">
            <object id="qihoo_player" name="qihoo_player" width="100%" height="100%" type="application/x-shockwave-flash" data="http://jia.360.cn/player/flash/QihooPlayer.swf?ver=201603301153">
                <param name="allowfullscreen" value="true">
                <param name="wmode" value="transparent">
                <param name="allowscriptaccess" value="always">
            </object>
        </div>
        <h2><span>杭州新白鹭餐饮有限公司</span><a href="javasrcipt:void(0)" class="pop-comment">我要评论</a><a href="javasrcipt:void(0)" class="pop-share">分享</a><a href="javasrcipt:void(0)" class="pop-report">举报</a></h2>
    </div>
</div>
<jsp:include page="/gov/footer.jsp" />
</body>
</html>
