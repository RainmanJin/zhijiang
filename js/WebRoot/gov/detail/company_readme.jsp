<%@ page language="java" pageEncoding="utf-8" %>
<%@ include file="/path.jsp" %>

<div class="zsBlock" id="companyReadme" style="display: none">
    <div class="zsBlock_warn">
        <p>小江有话说：【企业自述】的信息采集来源水滴信用，为确保您能更好的向公众展示企业形象，相关操作请点击前往<a target="_blank"
                                                                href="http://www.shuidixy.com/user/tologin">水滴信用</a>
        </p>
    </div>
    <div class="zsBlock_edit" id="readme1">


        <h3>企业自述</h3>

            <div class="zsBlock_list" id="introduceNoData">
                <h4 class="zsBlock_h4 zsBlock_icon1">一段话介绍企业</h4>
                <div class="zsBlock_none">
                    <p>企业暂未编辑该内容</p>
                </div>
            </div>

            <div class="zsBlock_list" id="introduce">
                <h5></h5>
            </div>

            <div class="zsBlock_list" id="adsNoData">
                <h4 class="zsBlock_h4 zsBlock_icon2">企业广告</h4>
                <div class="zsBlock_none">
                    <p>企业暂未编辑该内容</p>
                </div>
            </div>



            <div class="zsBlock_list" id="ads">
<%--                <div class="zsBlock_none zsBlock_adv">
                    <a target="_blank" href="${companyIntroduce.ads.adUrl}"><img
                            src="${companyIntroduce.ads.adImg}"></a>
                </div>--%>
            </div>

    </div>
    <div class="zsBlock_edit" id="readme2">
        <h3>产品服务</h3>

            <div class="zsBlock_list" id="productNoData">
                <h4 class="zsBlock_h4 zsBlock_icon3">企业产品</h4>
                <div class="zsBlock_none">
                    <p>企业暂未编辑该内容</p>
                </div>
            </div>

            <div class="zsBlock_list" id="product">
                <div class="zsBlock_service" productModel style="display: none">
                    <div class="zsBlock_s">
                        <div class="zsBlock_s_left">
                            {0}
                        </div>
                        <div class="zsBlock_s_right">
                            <p class="zsBlock_s_p1">{1}</p>
                            <p class="zsBlock_s_p2"><span>{2}</span></p>
                            <p class="zsBlock_s_p3">{3}</p>
                        </div>
                    </div>
                    <div class="zsBlock_join">

                            <a target="_blank" href="{4}">进入官网</a>


                        <p>服务价格：<span>{5}</span></p>

                        <p>服务城市：<span>{6}</span></p>
                    </div>

                </div>
            </div>

    </div>
    <div class="zsBlock_edit" id="readme3">
        <h3>发展历程</h3>

            <div class="zsBlock_list" id="developNoData">
                <h4 class="zsBlock_h4 zsBlock_icon3">企业大事件</h4>
                <div class="zsBlock_none">
                    <p>企业暂未编辑该内容</p>
                </div>
            </div>

            <div class="zsBlock_list" id="develop">

                    <div class="zsBlock_course" id="developModel" style="display: none">
                        <div class="course_left">
                            <p>{0}</p>
                        </div>
                        <div class="course_middle">
                            <em></em>
                        </div>
                        <div class="course_right">
                            <p>{1}</p>
                        </div>
                    </div>


            </div>

    </div>
    <div class="zsBlock_edit" id="readme4">
        <h3>企业荣誉</h3>

            <div class="zsBlock_list" id="honorNodata">
                <h4 class="zsBlock_h4 zsBlock_icon4">企业荣誉与资质</h4>
                <div class="zsBlock_none">
                    <p>企业暂未编辑该内容</p>
                </div>
            </div>


            <div class="zsBlock_list" id="honor">


                    <div class="zsBlock_honor" id="honorModel" style="display: none">
                        <div class="zsBlock_honor_cer">
                            <input type="hidden" name="honorImg" value="{0}">
                            <input type="hidden" name="honorName" value="{1}">
                            <input type="hidden" name="issueDate" value="{2}">
                            <input type="hidden" name="authority" value="{3}">
                            <input type="hidden" name="honorDesc" value="{4}">
                            {5}<span></span>
                        </div>
                        <p>{1}</p>
                    </div>

            </div>

    </div>
</div>

<div class="sd_qua" id="honorAlert" style="display: none;margin-top: 0">
    <div class="sd_qua_tit">
        <h4><a href="javascript:void(0)" id="honorClose"><img
                src="${basePath}/images/new/zs_close.png"></a><span>资质说明</span></h4>
    </div>
    <div id="honorDetail">


    <%--    <div class="sd_qua_img">
            <img src="${basePath}/images/new/zs_img03].jpg">
        </div>
        <div class="sd_qua_wz">
            <h3>中国电子认证服务产业联盟</h3>
            <h4><span>获得时间：2016-09-28 </span><span>颁发机构：上海凭安网络科技有限公司</span></h4>
            <p>2013年6月，支付宝推出账户余额增值服务“余额宝”，通过余额宝，用户不仅能够得到较高的收益，还能随时消费支付和转出，无任何手续费。</p>
            <p>2013年，支付宝手机支付完成超过27.8亿笔，金额超过9000亿元，成为全球最大的移动支付公司。</p>
        </div>--%>
    </div>
</div>

