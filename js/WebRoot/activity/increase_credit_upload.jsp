<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%@ include file="/path.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <base href="${basePath }/" data-detailUrl="${companyDetailUrl }"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta http-equiv="pragma" content="no-cache"/>
    <meta name="renderer" content="webkit"/>
    <meta name="renderer" content="webkit|ie-comp|ie-stand"/>
    <meta http-equiv="cache-control" content="no-cache"/>
    <meta http-equiv="expires" content="0"/>
    <meta http-equiv="keywords" content=""/>
    <meta http-equiv="description" content=""/>
    <title>首页-之江信用</title>
    <link href="${basePath}/style/new-css/style.css" rel="stylesheet" type="text/css"/>
    <link href="${basePath}/style/new-css/bootstrap.css" rel="stylesheet" type="text/css"/>
    <link href="${basePath}/style/new-css/flow.css" rel="stylesheet" type="text/css"/>
    <link href="${basePath}/style/new-css/inCreditUpload.css" rel="stylesheet" type="text/css"/>
    <link href="${basePath}/style/new-css/inCreditUploadStyle.css" rel="stylesheet" type="text/css"/>
    <link href="${basePath}/style/new/style.css" rel="stylesheet" type="text/css" />
    <link href="${basePath}/style/webuploader.css" rel="stylesheet" type="text/css"/>

    <script data-main="${basePath }/js/uzj/increase_credit_upload.js" src="${basePath }/js/lib/require.js"></script>
    <script>
        var activityCfg = activityCfg || {page: 'increase_credit_upload'};
    </script>
</head>

<body >
<jsp:include page="/user/top.jsp"/>

<!--top_bg-->
<div class="top_bg_y"></div>

<!--flow-->
<div class="n-layout">
    <div id="flow_y">
        <h3>申报流程</h3>
        <dl class="flow_bg2_y" >
            <span>填写基础信息</span><span>上传增信信息</span><span>确认支付</span><span>等待审核</span>
        </dl>
    </div>
    <div class="f_mian_y main" style="width: 100%; float: left">
        <div class="f_menu_y fixed" style=" float: left; display: inline-block">
            <h3>增信信息</h3>
            <%--<a href="#m1">企业经营状况信息</a>--%>
            <a href="javascript:void(0)" data-target="#wrapper1" class="current">企业经营状况信息</a>
            <a href="javascript:void(0)" data-target="#wrapper2" class="current">企业人事信息</a>
            <a href="javascript:void(0)" data-target="#wrapper3" class="current">企业资产清单</a>
            <a href="javascript:void(0)" data-target="#wrapper4" class="current">企业债权债务类合同</a>
            <a href="javascript:void(0)" data-target="#wrapper5" class="current">企业信用类资料</a>
            <a href="javascript:void(0)" data-target="#wrapper6" class="current">各类权证证明</a>
            <a href="javascript:void(0)" data-target="#wrapper7" class="current">其 他</a>



            <%--<a href="#m2">企业人事信息</a> <a href="#m3">企业资产清单</a> <a href="#m4">企业债权债务类合同</a> <a--%>
            <%--href="#m5">企业信用类资料</a> <a href="#m6">各类权证证明</a> <a href="#m7">其 他</a>--%>
        </div>


        <%--<form id="addDatumForm" action="${basePath }/<%=response.encodeURL("flowTwoUpload") %>" method="post">--%>
        <form id="addDatumForm" action="${basePath }/asso/indlight/datum/save" method="post">
            <input type="hidden" name="activityNo" value="${activityNo}"/>

            <div class="f_right_y">
                <div id="greetings_y"><b>小江有话说：</b>
                    <p>
                        您可选择性勾选您想上传的增信信息文件。上传越全面，越有助于提升企业信用分，进而提高企业信用等级。另外，虽然小江为企业上传的信息设置了隐私保护选项，不过信息的公示透明度会直接影响到企业信用等级，因此建议您慎重选择。</p>
                </div>
                <h2 class="flow_tetle_y" data-attr="0"><a name="m1"></a>企业经营状况</h2>
                <ul class="flow_ul_y">
                    <%--  <li>
                        <p>请选择您要上传的文件：</p>
                       &lt;%&ndash; <span>
                        <div class="f_list_y">
                          <input name="" type="checkbox" value="" class="f_chec_y" />
                           租赁合同
                        </div>
                        <div class="f_list_y">
                          <input class="f_chec_y" name="" type="checkbox" value="" />
                           近两年企业年报
                        </div>
                        <div class="f_list_y">
                          <input name="" type="checkbox" value=""  class="f_chec_y"/>
                          近两年税务机关出具的纳税证明
                        </div>
                        </span>
                        <dl>
                          <div class="f_list_y">
                            <select class="select_option2_y">
                              <option>概不公示</option>
                            </select>
                          </div>
                          <div class="f_list_y">
                            <select class="select_option2_y">
                              <option>对外公示</option>
                            </select>
                          </div>
                          <div class="f_list_y">
                            <select class="select_option2_y">
                              <option>对外公示</option>
                            </select>
                          </div>
                        </dl>
                        <div class="clear"></div>&ndash;%&gt;
                      </li>--%>
                    <li>
                        <%--    <div class="f_massmap_y">
                              <div class="f_upload1_pic_y"><img src="images/pic_c.jpg" /><a href="" class="btn_delete_y"></a></div>
                              <div class="f_upload1_pic_y"><img src="images/pic_c.jpg" /><a href="" class="btn_delete_y"></a></div>
                              <a class="f_upload1_y" href=""></a>
                              <a class="f_upload1_y" href=""></a>
                              <div class="clear"></div>
                            </div>
                            <div class="clear"></div>--%>

                        <div id="wrapper1" >
                            <!-- /.navbar -->
                            <div class="page-body">
                                <div class="container_upload" >
                                    <div class="page-container">
                                        <%--<h1 id="demo">webuploader</h1>--%>
                                        <%--<p>Increase credit information upload</p>--%>
                                        <div class="wu-example" id="uploader1">
                                            <div class="queueList">
                                                <div class="placeholder" >
                                                    <div id="filePicker1" class="webuploader-container">
                                                        <div class="webuploader-pick">点击选择图片</div>
                                                        <div  style="position: absolute; top: 0px; left: 448px; width: 168px;
                             height: 44px; overflow: hidden; bottom: auto; right: auto;"><input type="file" name="file"
                                                                                                class="webuploader-element-invisible"
                                                                                                multiple="multiple"
                                                                                                accept="image/*">
                                                            <label style="opacity: 0; width: 100%; height: 100%; display: block;
                                cursor: pointer; background: rgb(255, 255, 255) none repeat scroll 0% 0%;">
                                                            </label>
                                                        </div>
                                                    </div>
                                                    <%--<p style="margin-left: 330px;">或将照片拖到这里，单次最多可选10张</p>--%>
                                                </div>
                                                <ul class="filelist"></ul>
                                            </div>
                                            <div style="display:none;" class="statusBar">
                                                <div class="progress" style="display: none;">
                                                    <span class="text">0%</span>
                                                    <span class="percentage" style="width: 0%;"></span>
                                                </div>
                                                <div class="info">共0张（0B），已上传0张</div>
                                                <div class="btns">
                                                    <div id="filePicker_add_button1" class="webuploader-containe">
                                                        <div class="webuploader-pick">继续添加</div>
                                                        <div  style="position: absolute; top: 0px; left: 0px;
                            width: 1px; height: 1px; overflow: hidden;"><input type="file" name="file"
                                                                               class="webuploader-element-invisible"
                                                                               multiple="multiple" accept="image/*">
                                                            <label style="opacity: 0; width: 100%; height: 100%; display: block;
                                cursor: pointer; background: rgb(255, 255, 255) none repeat scroll 0% 0%;">
                                                            </label>
                                                        </div>
                                                    </div>
                                                    <div class="uploadBtn state-pedding">开始上传</div>
                                                </div>
                                            </div>
                                        </div>

                                    </div>


                                </div>
                            </div>

                        </div>


                    </li>
                    <li><font class="c888">格式为JPG、JPEG、PNG，小于2MB，最多可上传10张</font></li>
                    <div class="clear"></div>
                </ul>
                <h2 class="flow_tetle_y" data-attr="1"><a name="m2"></a>企业人事信息</h2>
                <ul class="flow_ul_y">
                    <%--<li>
                        <p>请选择您要上传的文件：</p>
                        &lt;%&ndash;<span>
                        <div class="f_list_y">
                          <input name="" type="checkbox" value="" class="f_chec_y" />
                           企业董事、监事、高管人员的名单、职务及个人基本简历
                        </div>
                        <div class="f_list_y">
                          <input class="f_chec_y" name="" type="checkbox" value="" />
                          近两年全体员工薪酬实际支付明细表
                        </div>
                        </span>
                        <dl>
                          <div class="f_list_y">
                            <select class="select_option2_y">
                              <option>对外公示</option>
                            </select>
                          </div>
                          <div class="f_list_y">
                            <select class="select_option2_y">
                              <option>对外公示</option>
                            </select>
                          </div>
                        </dl>
                        <div class="clear"></div>&ndash;%&gt;
                    </li>--%>
                    <li>
                        <%--<div class="f_massmap_y">
                          <div class="f_upload1_pic_y"><img src="images/pic_c.jpg" /><a href="" class="btn_delete_y"></a></div>
                          <div class="f_upload1_pic_y"><img src="images/pic_c.jpg" /><a href="" class="btn_delete_y"></a></div>
                          <a class="f_upload1_y" href=""></a><a class="f_upload1_y" href=""></a>
                          <div class="clear"></div>
                        </div>
                        <div class="clear"></div>--%>


                        <div id="wrapper2">
                            <!-- /.navbar -->
                            <div class="page-body">
                                <div class="container_upload" >
                                    <div class="page-container">
                                        <%--<h1 id="demo">webuploader</h1>--%>
                                        <%--<p>Increase credit information upload</p>--%>
                                        <div class="wu-example" id="uploader2">
                                            <div class="queueList">
                                                <div class="placeholder" >
                                                    <div id="filePicker2" class="webuploader-container">
                                                        <div class="webuploader-pick">点击选择图片</div>
                                                        <div  style="position: absolute; top: 0px; left: 448px; width: 168px;
                             height: 44px; overflow: hidden; bottom: auto; right: auto;"><input type="file" name="file"
                                                                                                class="webuploader-element-invisible"
                                                                                                multiple="multiple"
                                                                                                accept="image/*">
                                                            <label style="opacity: 0; width: 100%; height: 100%; display: block;
                                cursor: pointer; background: rgb(255, 255, 255) none repeat scroll 0% 0%;">
                                                            </label>
                                                        </div>
                                                    </div>
                                                    <%--<p style="margin-left: 330px;">或将照片拖到这里，单次最多可选10张</p>--%>
                                                </div>
                                                <ul class="filelist"></ul>
                                            </div>
                                            <div style="display:none;" class="statusBar">
                                                <div class="progress" style="display: none;">
                                                    <span class="text">0%</span>
                                                    <span class="percentage" style="width: 0%;"></span>
                                                </div>
                                                <div class="info">共0张（0B），已上传0张</div>
                                                <div class="btns">
                                                    <div id="filePicker_add_button2" class="webuploader-container">
                                                        <div class="webuploader-pick">继续添加</div>
                                                        <div style="position: absolute; top: 0px; left: 0px;
                            width: 1px; height: 1px; overflow: hidden;"><input type="file" name="file"
                                                                               class="webuploader-element-invisible"
                                                                               multiple="multiple" accept="image/*">
                                                            <label style="opacity: 0; width: 100%; height: 100%; display: block;
                                cursor: pointer; background: rgb(255, 255, 255) none repeat scroll 0% 0%;">
                                                            </label>
                                                        </div>
                                                    </div>
                                                    <div class="uploadBtn state-pedding">开始上传</div>
                                                </div>
                                            </div>
                                        </div>

                                    </div>


                                </div>
                            </div>

                        </div>


                    </li>
                    <li><font class="c888">格式为JPG、JPEG、PNG，小于2MB，最多可上传10张</font></li>
                    <div class="clear"></div>
                </ul>
                <h2 class="flow_tetle_y"><a name="m3"></a>企业资产清单</h2>
                <ul class="flow_ul_y">
                   <%-- <li>
                        <p>请选择您要上传的文件：</p>
                        &lt;%&ndash; <span>
                         <div class="f_list_y">
                           <input name="" type="checkbox" value="" class="f_chec_y" />
                            固定资产清单
                         </div>
                         <div class="f_list_y">
                           <input class="f_chec_y" name="" type="checkbox" value="" />
                           无形资产清单 （专利、专有技术、许可和批准，特许经营等）
                         </div>
                         </span>
                         <dl>
                           <div class="f_list_y">
                             <select class="select_option2_y">
                               <option>对外公示</option>
                             </select>
                           </div>
                           <div class="f_list_y">
                             <select class="select_option2_y">
                               <option>对外公示</option>
                             </select>
                           </div>
                         </dl>
                         <div class="clear"></div>&ndash;%&gt;
                    </li>--%>
                    <li>
                        <%--<div class="f_massmap_y">
                          <div class="f_upload1_pic_y"><img src="images/pic_c.jpg" /><a href="" class="btn_delete_y"></a></div>
                          <div class="f_upload1_pic_y"><img src="images/pic_c.jpg" /><a href="" class="btn_delete_y"></a></div>
                          <a class="f_upload1_y" href=""></a><a class="f_upload1_y" href=""></a>
                          <div class="clear"></div>
                        </div>
                        <div class="clear"></div>--%>


                        <div id="wrapper3">
                            <!-- /.navbar -->
                            <div class="page-body">
                                <div class="container_upload" >
                                    <div class="page-container">
                                        <%--<h1 id="demo">webuploader</h1>--%>
                                        <%--<p>Increase credit information upload</p>--%>
                                        <div class="wu-example" id="uploader3">
                                            <div class="queueList">
                                                <div class="placeholder" >
                                                    <div id="filePicker3" class="webuploader-container">
                                                        <div class="webuploader-pick">点击选择图片</div>
                                                        <div  style="position: absolute; top: 0px; left: 448px; width: 168px;
                             height: 44px; overflow: hidden; bottom: auto; right: auto;"><input type="file" name="file"
                                                                                                class="webuploader-element-invisible"
                                                                                                multiple="multiple"
                                                                                                accept="image/*">
                                                            <label style="opacity: 0; width: 100%; height: 100%; display: block;
                                cursor: pointer; background: rgb(255, 255, 255) none repeat scroll 0% 0%;">
                                                            </label>
                                                        </div>
                                                    </div>
                                                    <%--<p style="margin-left: 330px;">或将照片拖到这里，单次最多可选10张</p>--%>
                                                </div>
                                                <ul class="filelist"></ul>
                                            </div>
                                            <div style="display:none;" class="statusBar">
                                                <div class="progress" style="display: none;">
                                                    <span class="text">0%</span>
                                                    <span class="percentage" style="width: 0%;"></span>
                                                </div>
                                                <div class="info">共0张（0B），已上传0张</div>
                                                <div class="btns">
                                                    <div id="filePicker_add_button3" class="webuploader-container">
                                                        <div class="webuploader-pick">继续添加</div>
                                                        <div  style="position: absolute; top: 0px; left: 0px;
                            width: 1px; height: 1px; overflow: hidden;"><input type="file" name="file"
                                                                               class="webuploader-element-invisible"
                                                                               multiple="multiple" accept="image/*">
                                                            <label style="opacity: 0; width: 100%; height: 100%; display: block;
                                cursor: pointer; background: rgb(255, 255, 255) none repeat scroll 0% 0%;">
                                                            </label>
                                                        </div>
                                                    </div>
                                                    <div class="uploadBtn state-pedding">开始上传</div>
                                                </div>
                                            </div>
                                        </div>

                                    </div>


                                </div>
                            </div>

                        </div>

                    </li>
                    <li><font class="c888">格式为JPG、JPEG、PNG，小于2MB，最多可上传10张</font></li>
                    <div class="clear"></div>
                </ul>
                <h2 class="flow_tetle_y"><a name="m4"></a>企业债权债务类合同</h2>
                <ul class="flow_ul_y">
                  <%--  <li>
                        <p>请选择您要上传的文件：</p>
                        &lt;%&ndash; <span>
                         <div class="f_list_y">
                           <input name="" type="checkbox" value="" class="f_chec_y" />
                           资金贷款合同
                         </div>
                         <div class="f_list_y">
                           <input class="f_chec_y" name="" type="checkbox" value="" />
                            资产抵押合同
                         </div>
                         <div class="f_list_y">
                           <input name="" type="checkbox" value=""  class="f_chec_y"/>
                            对外担保合同
                         </div>
                         </span>
                         <dl>
                           <div class="f_list_y">
                             <select class="select_option2_y">
                               <option>概不公示</option>
                             </select>
                           </div>
                           <div class="f_list_y">
                             <select class="select_option2_y">
                               <option>对外公示</option>
                             </select>
                           </div>
                           <div class="f_list_y">
                             <select class="select_option2_y">
                               <option>对外公示</option>
                             </select>
                           </div>
                         </dl>
                         <div class="clear"></div>&ndash;%&gt;
                    </li>--%>
                    <li>
                        <%-- <div class="f_massmap_y">
                           <div class="f_upload1_pic_y"><img src="images/pic_c.jpg" /><a href="" class="btn_delete_y"></a></div>
                           <div class="f_upload1_pic_y"><img src="images/pic_c.jpg" /><a href="" class="btn_delete_y"></a></div>
                           <a class="f_upload1_y" href=""></a><a class="f_upload1_y" href=""></a>
                           <div class="clear"></div>
                         </div>
                         <div class="clear"></div>--%>


                        <div id="wrapper4">
                            <!-- /.navbar -->
                            <div class="page-body">
                                <div class="container_upload" >
                                    <div class="page-container">
                                        <%--<h1 id="demo">webuploader</h1>--%>
                                        <%--<p>Increase credit information upload</p>--%>
                                        <div class="wu-example" id="uploader4">
                                            <div class="queueList">
                                                <div class="placeholder" >
                                                    <div id="filePicker4" class="webuploader-container">
                                                        <div class="webuploader-pick">点击选择图片</div>
                                                        <div  style="position: absolute; top: 0px; left: 448px; width: 168px;
                             height: 44px; overflow: hidden; bottom: auto; right: auto;"><input type="file" name="file"
                                                                                                class="webuploader-element-invisible"
                                                                                                multiple="multiple"
                                                                                                accept="image/*">
                                                            <label style="opacity: 0; width: 100%; height: 100%; display: block;
                                cursor: pointer; background: rgb(255, 255, 255) none repeat scroll 0% 0%;">
                                                            </label>
                                                        </div>
                                                    </div>
                                                    <%--<p style="margin-left: 330px;">或将照片拖到这里，单次最多可选10张</p>--%>
                                                </div>
                                                <ul class="filelist"></ul>
                                            </div>
                                            <div style="display:none;" class="statusBar">
                                                <div class="progress" style="display: none;">
                                                    <span class="text">0%</span>
                                                    <span class="percentage" style="width: 0%;"></span>
                                                </div>
                                                <div class="info">共0张（0B），已上传0张</div>
                                                <div class="btns">
                                                    <div id="filePicker_add_button4" class="webuploader-container">
                                                        <div class="webuploader-pick">继续添加</div>
                                                        <div  style="position: absolute; top: 0px; left: 0px;
                            width: 1px; height: 1px; overflow: hidden;"><input type="file" name="file"
                                                                               class="webuploader-element-invisible"
                                                                               multiple="multiple" accept="image/*">
                                                            <label style="opacity: 0; width: 100%; height: 100%; display: block;
                                cursor: pointer; background: rgb(255, 255, 255) none repeat scroll 0% 0%;">
                                                            </label>
                                                        </div>
                                                    </div>
                                                    <div class="uploadBtn state-pedding">开始上传</div>
                                                </div>
                                            </div>
                                        </div>

                                    </div>


                                </div>
                            </div>

                        </div>


                    </li>
                    <li><font class="c888">格式为JPG、JPEG、PNG，小于2MB，最多可上传10张</font></li>
                    <div class="clear"></div>
                </ul>
                <h2 class="flow_tetle_y"><a name="m5"></a>企业信用类资料</h2>
                <ul class="flow_ul_y">
                 <%--   <li>
                        <p>请选择您要上传的文件：</p>
                        &lt;%&ndash;  <span>
                          <div class="f_list_y">
                            <input name="" type="checkbox" value="" class="f_chec_y" />
                            基本存款账户银行提供的近期银行信用状况证明
                          </div>
                          <div class="f_list_y">
                            <input class="f_chec_y" name="" type="checkbox" value="" />
                            法人股东《企业信用报告》
                          </div>
                          <div class="f_list_y">
                            <input class="f_chec_y" name="" type="checkbox" value="" />
                             自然人股东《个人征信报告》
                          </div>
                          </span>
                          <dl>
                            <div class="f_list_y">
                              <select class="select_option2_y">
                                <option>概不公示</option>
                              </select>
                            </div>
                            <div class="f_list_y">
                              <select class="select_option2_y">
                                <option>对外公示</option>
                              </select>
                            </div>
                            <div class="f_list_y">
                              <select class="select_option2_y">
                                <option>对外公示</option>
                              </select>
                            </div>
                          </dl>
                          <div class="clear"></div>&ndash;%&gt;
                    </li>--%>
                    <li>
                        <%-- <div class="f_massmap_y">
                           <div class="f_upload1_pic_y"><img src="images/pic_c.jpg" /><a href="" class="btn_delete_y"></a></div>
                           <div class="f_upload1_pic_y"><img src="images/pic_c.jpg" /><a href="" class="btn_delete_y"></a></div>
                           <a class="f_upload1_y" href=""></a><a class="f_upload1_y" href=""></a>
                           <div class="clear"></div>
                         </div>
                         <div class="clear"></div>--%>


                        <div id="wrapper5">
                            <!-- /.navbar -->
                            <div class="page-body">
                                <div class="container_upload" >
                                    <div class="page-container">
                                        <%--<h1 id="demo">webuploader</h1>--%>
                                        <%--<p>Increase credit information upload</p>--%>
                                        <div class="wu-example" id="uploader5">
                                            <div class="queueList">
                                                <div class="placeholder" >
                                                    <div id="filePicker5" class="webuploader-container">
                                                        <div class="webuploader-pick">点击选择图片</div>
                                                        <div  style="position: absolute; top: 0px; left: 448px; width: 168px;
                             height: 44px; overflow: hidden; bottom: auto; right: auto;"><input type="file" name="file"
                                                                                                class="webuploader-element-invisible"
                                                                                                multiple="multiple"
                                                                                                accept="image/*">
                                                            <label style="opacity: 0; width: 100%; height: 100%; display: block;
                                cursor: pointer; background: rgb(255, 255, 255) none repeat scroll 0% 0%;">
                                                            </label>
                                                        </div>
                                                    </div>
                                                    <%--<p style="margin-left: 330px;">或将照片拖到这里，单次最多可选10张</p>--%>
                                                </div>
                                                <ul class="filelist"></ul>
                                            </div>
                                            <div style="display:none;" class="statusBar">
                                                <div class="progress" style="display: none;">
                                                    <span class="text">0%</span>
                                                    <span class="percentage" style="width: 0%;"></span>
                                                </div>
                                                <div class="info">共0张（0B），已上传0张</div>
                                                <div class="btns">
                                                    <div id="filePicker_add_button5" class="webuploader-container">
                                                        <div class="webuploader-pick">继续添加</div>
                                                        <div  style="position: absolute; top: 0px; left: 0px;
                            width: 1px; height: 1px; overflow: hidden;"><input type="file" name="file"
                                                                               class="webuploader-element-invisible"
                                                                               multiple="multiple" accept="image/*">
                                                            <label style="opacity: 0; width: 100%; height: 100%; display: block;
                                cursor: pointer; background: rgb(255, 255, 255) none repeat scroll 0% 0%;">
                                                            </label>
                                                        </div>
                                                    </div>
                                                    <div class="uploadBtn state-pedding">开始上传</div>
                                                </div>
                                            </div>
                                        </div>

                                    </div>


                                </div>
                            </div>

                        </div>

                    </li>
                    <li><font class="c888">格式为JPG、JPEG、PNG，小于2MB，最多可上传10张</font></li>
                    <div class="clear"></div>
                </ul>
                <h2 class="flow_tetle_y"><a name="m6"></a>各类权证证明</h2>
                <ul class="flow_ul_y">
                   <%-- <li>
                        <p>请选择您要上传的文件：</p>
                        &lt;%&ndash; <span>
                         <div class="f_list_y">
                           <input name="" type="checkbox" value="" class="f_chec_y" />
                           股权、出资证明
                         </div>
                         <div class="f_list_y">
                           <input class="f_chec_y" name="" type="checkbox" value="" />
                            房屋、土地等所有权及使用权证明
                         </div>
                         </span>
                         <dl>
                           <div class="f_list_y">
                             <select class="select_option2_y">
                               <option>对外公示</option>
                             </select>
                           </div>
                           <div class="f_list_y">
                             <select class="select_option2_y">
                               <option>对外公示</option>
                             </select>
                           </div>
                           </select>
                         </dl>
                         <div class="clear"></div>&ndash;%&gt;
                    </li>--%>
                    <li>
                        <%--<div class="f_massmap_y">
                          <div class="f_upload1_pic_y"><img src="images/pic_c.jpg" /><a href="" class="btn_delete_y"></a></div>
                          <div class="f_upload1_pic_y"><img src="images/pic_c.jpg" /><a href="" class="btn_delete_y"></a></div>
                          <a class="f_upload1_y" href=""></a><a class="f_upload1_y" href=""></a>
                          <div class="clear"></div>
                        </div>
                        <div class="clear"></div>--%>


                        <div id="wrapper6">
                            <!-- /.navbar -->
                            <div class="page-body">
                                <div class="container_upload" >
                                    <div class="page-container">
                                        <%--<h1 id="demo">webuploader</h1>--%>
                                        <%--<p>Increase credit information upload</p>--%>
                                        <div class="wu-example" id="uploader6">
                                            <div class="queueList">
                                                <div class="placeholder" >
                                                    <div id="filePicker6" class="webuploader-container">
                                                        <div class="webuploader-pick">点击选择图片</div>
                                                        <div  style="position: absolute; top: 0px; left: 448px; width: 168px;
                             height: 44px; overflow: hidden; bottom: auto; right: auto;"><input type="file" name="file"
                                                                                                class="webuploader-element-invisible"
                                                                                                multiple="multiple"
                                                                                                accept="image/*">
                                                            <label style="opacity: 0; width: 100%; height: 100%; display: block;
                                cursor: pointer; background: rgb(255, 255, 255) none repeat scroll 0% 0%;">
                                                            </label>
                                                        </div>
                                                    </div>
                                                    <%--<p style="margin-left: 330px;">或将照片拖到这里，单次最多可选10张</p>--%>
                                                </div>
                                                <ul class="filelist"></ul>
                                            </div>
                                            <div style="display:none;" class="statusBar">
                                                <div class="progress" style="display: none;">
                                                    <span class="text">0%</span>
                                                    <span class="percentage" style="width: 0%;"></span>
                                                </div>
                                                <div class="info">共0张（0B），已上传0张</div>
                                                <div class="btns">
                                                    <div id="filePicker_add_button6" class="webuploader-container">
                                                        <div class="webuploader-pick">继续添加</div>
                                                        <div  style="position: absolute; top: 0px; left: 0px;
                            width: 1px; height: 1px; overflow: hidden;"><input type="file" name="file"
                                                                               class="webuploader-element-invisible"
                                                                               multiple="multiple" accept="image/*">
                                                            <label style="opacity: 0; width: 100%; height: 100%; display: block;
                                cursor: pointer; background: rgb(255, 255, 255) none repeat scroll 0% 0%;">
                                                            </label>
                                                        </div>
                                                    </div>
                                                    <div class="uploadBtn state-pedding">开始上传</div>
                                                </div>
                                            </div>
                                        </div>

                                    </div>


                                </div>
                            </div>

                        </div>

                    </li>
                    <li><font class="c888">格式为JPG、JPEG、PNG，小于2MB，最多可上传10张</font></li>
                    <div class="clear"></div>
                </ul>
                <h2 class="flow_tetle_y"><a name="m7"></a>其他</h2>
                <ul class="flow_ul_y">
                    <li>
                        <%--<p>请选择您要上传的文件：</p>--%>
                        <%-- <div class="clear"></div>
                       </li>
                       <li>
                         <div class="f_massmap_y">
                           <div class="f_upload1_pic_y"><img src="images/pic_c.jpg" /><a href="" class="btn_delete_y"></a></div>
                           <div class="f_upload1_pic_y"><img src="images/pic_c.jpg" /><a href="" class="btn_delete_y"></a></div>
                           <a class="f_upload1_y" href=""></a><a class="f_upload1_y" href=""></a>
                           <div class="clear"></div>
                         </div>
                         <div class="clear"></div>--%>


                        <div id="wrapper7">
                            <!-- /.navbar -->
                            <div class="page-body">
                                <div class="container_upload" >
                                    <div class="page-container">
                                        <%--<h1 id="demo">webuploader</h1>--%>
                                        <%--<p>Increase credit information upload</p>--%>
                                        <div class="wu-example" id="uploader7">
                                            <div class="queueList">
                                                <div class="placeholder" >
                                                    <div id="filePicker7" class="webuploader-container">
                                                        <div class="webuploader-pick">点击选择图片</div>
                                                        <div id="rt_rt_1as6euhflnhrrpr1f3h54p1s9l1" style="position: absolute; top: 0px; left: 448px; width: 168px;
                             height: 44px; overflow: hidden; bottom: auto; right: auto;"><input type="file" name="file"
                                                                                                class="webuploader-element-invisible"
                                                                                                multiple="multiple"
                                                                                                accept="image/*">
                                                            <label style="opacity: 0; width: 100%; height: 100%; display: block;
                                cursor: pointer; background: rgb(255, 255, 255) none repeat scroll 0% 0%;">
                                                            </label>
                                                        </div>
                                                    </div>
                                                    <%--<p style="margin-left: 330px;">或将照片拖到这里，单次最多可选10张</p>--%>
                                                </div>
                                                <ul class="filelist"></ul>
                                            </div>
                                            <div style="display:none;" class="statusBar">
                                                <div class="progress" style="display: none;">
                                                    <span class="text">0%</span>
                                                    <span class="percentage" style="width: 0%;"></span>
                                                </div>
                                                <div class="info">共0张（0B），已上传0张</div>
                                                <div class="btns">
                                                    <div id="filePicker_add_button7" class="webuploader-container">
                                                        <div class="webuploader-pick">继续添加</div>
                                                        <div id="rt_rt_1as6euhfpqb29tukv6b571fdb6" style="position: absolute; top: 0px; left: 0px;
                            width: 1px; height: 1px; overflow: hidden;"><input type="file" name="file"
                                                                               class="webuploader-element-invisible"
                                                                               multiple="multiple" accept="image/*">
                                                            <label style="opacity: 0; width: 100%; height: 100%; display: block;
                                cursor: pointer; background: rgb(255, 255, 255) none repeat scroll 0% 0%;">
                                                            </label>
                                                        </div>
                                                    </div>
                                                    <div class="uploadBtn state-pedding">开始上传</div>
                                                </div>
                                            </div>
                                        </div>

                                    </div>


                                </div>
                            </div>

                        </div>

                    </li>
                    <li><font class="c888">格式为JPG、JPEG、PNG，小于2MB，最多可上传10张</font></li>
                    <div class="clear"></div>
                </ul>
                <div class="f_button_y">
                    <input class="f_btn_submit" id="go_pay_return_flow" type="button" value="下一步"/>
                    <input class="f_btn_return" id="f_btn_return2" type="button" value="返回" style="height: 40px;width: 136px;text-align: center;font-size: 16px;font-weight: bold;"/>
                </div>
            </div>

        </form>

    </div>
</div>

<!--end n-main-->
<jsp:include page="/footer.jsp"/>

<!--end n-footer-->
</body>
</html>
