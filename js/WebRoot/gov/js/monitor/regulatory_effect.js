require.config({
    waitSeconds: 0,
    baseUrl: basePath,
    paths: {
        Pingan: 'gov/js/common/common',
        echarts: 'gov/js/lib/echarts.min',
        gov_top: 'gov/js/monitor/monitor_top',
        left: 'gov/js/monitor/monitor_left',
        // select_2_css:'gov/js/monitor_new/select2css',
        regulatory_effect: "gov/js/monitor_new/regulatory_effect"
    },
    shim: {
        gov_top: {
            deps: ['Pingan']
        },
        echarts: {
            deps: ['Pingan']
        },
        left: {
            deps: ['Pingan']
        },
        clue_list: {
            deps: ['Pingan']
        }
    },
    deps: ['gov_top', 'left', 'regulatory_effect']
});
require(['Pingan','echarts'], function (Pingan,echarts) {
    var dealed_clue_stat_Table = {},undeal_clue_stat_Table = {},second_dealed_clue_stat_Table = {},second_undeal_clue_stat_Table = {};
    //标志：是否从库中搜索过一次
    var searched_or_not_undeal=false,searched_or_not_dealed=false,searched_or_not_sec_undeal=false,searched_or_not_sec_dealed=false;
    //各种类型线索总数目
    var total_undeal=new Array(2),total_dealed=new Array(2),total_sec_undeal=new Array(2),total_sec_dealed=new Array(2);
    //标志：是否点击查询按钮查询过
    var find_undeal=false,find_dealed=false,find_sec_undeal=false,find_sec_dealed=false;
    var tab_pagesize_undeal=false,tab_pagesize_dealed=false,tab_pagesize_sec_undeal=false,tab_pagesize_sec_dealed=false;
    Pingan.Init = function () {
        if (clueCfg.page == 'detail' || clueCfg.page == 'auth') {
            initClueContent(clueCfg.clueContent);
        } else if (clueCfg.page == 'index') {

            $.post(basePath+"/gov/user/company/monitor/stat/clue/ajax/list",{},function (result){
                siteClueStatHalfYearTrend('siteClueStatHalfYear',result);
            });

            dealed_and_undeal('undeal',searched_or_not_undeal);
            $('[data-attr="clue_div"]').hide();
            $('#undeal_div').show();


        }
        else if(caseCfg.page == 'detail' || caseCfg.page == 'audit')
        {
            initClueContent($.parseJSON(caseCfg.clueContent));
        }

    };
    Pingan.Event = function () {

        if (clueCfg.page == 'detail' || clueCfg.page == 'auth') {


            $("[name='clueProcessType']").change(function () {
                if ($(this).val() == 2) {
                    $("[name='transprotDepMail']").parent().show();
                } else {
                    $("[name='transprotDepMail']").parent().hide();
                }
            });

            var caseAuditForm = new Pingan.MForm($("#clueAuthForm"));
            caseAuditForm.isAjax = true;
            caseAuditForm.beforeSubmit = function () {
                var processType = $("[name='clueProcessType']").val();
                var clueVerifyHistory = $("[name='clueVerifyHistory']").val();
                var email = $("[name='transprotDepMail']").val();
                if ((!processType) || ("" == processType )) {
                    Pingan.malertInfo("请选择处理方式", 'infoMessage', {});
                    return false;
                }
                if ((!clueVerifyHistory) || ("" == clueVerifyHistory )) {
                    Pingan.malertInfo("请填写处理记录", 'infoMessage', {});
                    return false;
                }
                if (processType == 2) {
                    if (email == "") {
                        Pingan.malertInfo("请填写部门邮箱", 'infoMessage', {});
                        return false;
                    }
                }
                return true;
            };
            caseAuditForm.afterSubmit = function (data) {
                if ((!data) || data.statusCode != 1) {
                    Pingan.malertInfo("修改失败");
                } else {
                    Pingan.malertInfo("线索管理审核成功！",'infoMessage', {});
                    window.location.href = basePath + "/gov/user/corporate/list";
                }
            };
            //绑定按钮到提交事件
            $("#clueAuthFormBtn").click(function () {
                $("#clueAuthForm").submit();
            });
        } else if (clueCfg.page == 'index') {
            $("#stat_new").on('click',function () {
                var stat_url = basePath+"/gov/user/company/monitor/stat";
                window.location.href=stat_url;
            });

            $("#search").unbind('click').click(function () {
                var companyName = $("[name='companyName']").val();
                var processType = $("[name='clueProcessType']").val();
                var clueState = $("[name='clueState']").val();
                var pageSize = $("[name='pageSize']").val();
                $('[data-attr="clue_div"]').hide();
                search_by_conditions(companyName,processType,clueState,pageSize);
            });


            $(".Man1213_ul1 li").unbind('click').click(function () {
                var flag=$(".Man1213_ul2 li").eq(0).attr('class')=='current'?0:1;
                $(this).siblings().removeClass('current');
                $(this).addClass('current');
                $("[name='pageSize']").val(5);
                $("[name='clueProcessType']").val('');
                $("input[name='companyName']").val("");
                $('[data-attr="clue_div"]').hide();
                $(".detail_nodata").hide();
                $("#select_info_pageSizeChoose").html(5);
                $("#select_info_clueProcessType").html("请选择");
                clue_tab_trigger(flag);
            });

            $(".Man1213_ul2 li").unbind('click').click(function () {
                var flag=$(this).attr("data_attr");
                $("[name='clueState']").val(flag);
                $("[name='pageSize']").val(5);
                $("[name='clueProcessType']").val('');
                $("input[name='companyName']").val("");
                $(this).siblings().removeClass('current');
                $(this).addClass('current');
                $('[data-attr="clue_div"]').hide();
                $(".detail_nodata").hide();
                $("#select_info_clueProcessType").html("请选择");
                $("#select_info_pageSizeChoose").html(5);
                clue_tab_trigger(flag);
            });

            $("#options_pageSizeChoose li").unbind('click').click(function () {
                $("[name='pageSize']").val($(this).attr('data-attr'));
                var companyName = $("[name='companyName']").val();
                var processType = $("[name='clueProcessType']").val();
                var clueState = $("[name='clueState']").val();
                var pageSize = $("[name='pageSize']").val();
                page_size_choose(companyName,processType,clueState,pageSize);
            });
            $("#options_clueProcessType li").click(function () {
                $("[name='clueProcessType']").val($(this).attr('data-attr'));
                // initHrefChange();
            });


        }else if(caseCfg.page == 'detail'||caseCfg.page=='audit')
        {

            $("[name='clueProcessType']").change(function () {
                if ($(this).val() == 2) {
                    $("[name='transprotDepMail']").parent().show();
                } else {
                    $("[name='transprotDepMail']").parent().hide();
                }
            });

            var caseAuditForm = new Pingan.MForm($("#caseAuditForm"));
            caseAuditForm.isAjax = true;
            caseAuditForm.beforeSubmit = function () {
                var id = $("[name='id']").val();
                var caseProcessType = $("[name='caseProcessType']").val();
                var casePunish = $("[name='casePunish']").val();
                var caseVerifyHistory = $("[name='caseVerifyHistory']").val();
                if ((!caseProcessType) || ("请选择" == caseProcessType )) {
                    Pingan.malertInfo("请选择线索状态", 'infoMessage', {});
                    return false;
                }
                if ((!casePunish) || ("请选择" == casePunish )) {
                    Pingan.malertInfo("请选择处理方式", 'infoMessage', {});
                    return false;
                }
                if ((!caseVerifyHistory) || ("" == caseVerifyHistory )) {
                    Pingan.malertInfo("请填写处理记录", 'infoMessage', {});
                    return false;
                }
                return true;
            };
            caseAuditForm.afterSubmit = function (result) {
                if (result.statusCode == 1) {
                    Pingan.malertInfo("线索处理成功", 'infoMessage', {});
                    // window.location.href = basePath + "/gov/user/case/list";
                    window.location.href = basePath + "/gov/user/corporate/list";
                } else {
                    Pingan.malertInfo(result.statusMessage, 'infoMessage', {});

                }
            };
            //绑定按钮到提交事件
            $("#caseAuditFormBtn").click(function () {
                $("#caseAuditForm").submit();
            });
        }
    };
    Pingan.Init();
    Pingan.Event();

    function search_by_conditions(companyName,processType,clueState,pageSize) {
        if($(".Man1213_ul1 li").eq(0).attr("class")=='current')
        {
            if($(".Man1213_ul2 li").eq(0).attr("class")=='current')
            {
                undeal_clue_stat_Table.urlHandler.params.put("companyName", companyName);
                // undeal_clue_stat_Table.urlHandler.params.put("processType", processType);
                undeal_clue_stat_Table.urlHandler.params.put("clueProcessType", processType);

                undeal_clue_stat_Table.urlHandler.params.put("clueState", clueState);
                undeal_clue_stat_Table.urlHandler.params.put("pageSize", pageSize);
                undeal_clue_stat_Table.total=0;
                undeal_clue_stat_Table.go(1);
                $('#undeal_div').show();
                find_undeal=true;
            }else {
                dealed_clue_stat_Table.urlHandler.params.put("companyName", companyName);
                // dealed_clue_stat_Table.urlHandler.params.put("processType", processType);
                dealed_clue_stat_Table.urlHandler.params.put("clueProcessType", processType);

                dealed_clue_stat_Table.urlHandler.params.put("clueState", clueState);
                dealed_clue_stat_Table.urlHandler.params.put("pageSize", pageSize);
                dealed_clue_stat_Table.total=0;
                dealed_clue_stat_Table.go(1);
                $('#dealed_div').show();
                find_dealed=true;
            }
        }else
        {
            if($(".Man1213_ul2 li").eq(0).attr("class")=='current')
            {
                second_undeal_clue_stat_Table.urlHandler.params.put("companyName", companyName);
                // second_undeal_clue_stat_Table.urlHandler.params.put("processType", processType);
                second_undeal_clue_stat_Table.urlHandler.params.put("clueProcessType", processType);
                second_undeal_clue_stat_Table.urlHandler.params.put("clueState", clueState);

                // second_undeal_clue_stat_Table.urlHandler.params.put("caseStatus", 0);
                second_undeal_clue_stat_Table.urlHandler.params.put("pageSize", pageSize);
                second_undeal_clue_stat_Table.total=0;
                second_undeal_clue_stat_Table.go(1);
                $('#second_undeal_div').show();
                find_sec_undeal=true;
            }else {
                second_dealed_clue_stat_Table.urlHandler.params.put("companyName", companyName);
                // second_dealed_clue_stat_Table.urlHandler.params.put("processType", processType);
                second_dealed_clue_stat_Table.urlHandler.params.put("clueState", clueState);

                second_dealed_clue_stat_Table.urlHandler.params.put("clueProcessType", processType);
                // second_dealed_clue_stat_Table.urlHandler.params.put("caseStatus", 1);
                second_dealed_clue_stat_Table.urlHandler.params.put("pageSize", pageSize);
                second_dealed_clue_stat_Table.total=0;
                second_dealed_clue_stat_Table.go(1);
                $('#second_dealed_div').show();
                find_sec_dealed=true;
            }
        }
    }
    
    function clue_tab_trigger(flag) {
        if($(".Man1213_ul1 li").eq(0).attr('class')=='current'){

            if(flag==0){
                if(!searched_or_not_undeal || find_undeal || tab_pagesize_undeal)
                {
                    dealed_and_undeal('undeal',searched_or_not_undeal);
                }
                if(total_undeal[0]==0){$(".detail_nodata").show();}
                $("#record_total").html(total_undeal[0]);
                $("#page_record").html("1/"+total_undeal[1]);
                $('#undeal_div').show();
            }else {
                if(!searched_or_not_dealed || find_dealed||tab_pagesize_dealed)
                {
                    dealed_and_undeal('dealed',searched_or_not_dealed);
                }
                if(total_dealed[0]==0){$(".detail_nodata").show();}
                $("#record_total").html(total_dealed[0]);
                $("#page_record").html("1/"+total_dealed[1]);
                $("#dealed_div").show();
            }

        }else
        {

            if(flag==0){
                if(!searched_or_not_sec_undeal || find_sec_undeal||tab_pagesize_sec_undeal)
                {
                    dealed_and_undeal('second_undeal');
                }
                if(total_sec_undeal[0]==0){$(".detail_nodata").show();}

                $("#record_total").html(total_sec_undeal[0]);
                $("#page_record").html("1/"+total_sec_undeal[1]);
                $('#second_undeal_div').show();
            }else {
                if(!searched_or_not_sec_dealed || find_sec_dealed || tab_pagesize_sec_dealed)
                {
                    dealed_and_undeal('second_dealed');
                }
                if(total_sec_dealed[0]==0){$(".detail_nodata").show();}
                $("#record_total").html(total_sec_dealed[0]);
                $("#page_record").html("1/"+total_sec_dealed[1]);
                $("#second_dealed_div").show();
            }


        }
    }

    function page_size_choose(companyName,processType,clueState,pageSize) {
        if($(".Man1213_ul1 li").eq(0).attr('class')=='current')
        {

            if($(".Man1213_ul2 li").eq(0).attr('class')=='current')
            {
                undeal_clue_stat_Table.urlHandler.params.put("companyName", companyName);
                undeal_clue_stat_Table.urlHandler.params.put("processType", processType);
                undeal_clue_stat_Table.urlHandler.params.put("clueProcessType", processType);

                undeal_clue_stat_Table.urlHandler.params.put("clueState", clueState);
                undeal_clue_stat_Table.urlHandler.params.put("pageSize", pageSize);
                undeal_clue_stat_Table.total=0;
                // $(".Man1213_ul2 li").eq(1).click();
                // $(".Man1213_ul2 li").eq(0).click();
                undeal_clue_stat_Table.go(1);
                tab_pagesize_undeal=true;
            }else
            {
                dealed_clue_stat_Table.urlHandler.params.put("companyName", companyName);
                dealed_clue_stat_Table.urlHandler.params.put("processType", processType);
                dealed_clue_stat_Table.urlHandler.params.put("clueProcessType", processType);

                dealed_clue_stat_Table.urlHandler.params.put("clueState", clueState);
                dealed_clue_stat_Table.urlHandler.params.put("pageSize", pageSize);
                dealed_clue_stat_Table.total=0;
                // $(".Man1213_ul2 li").eq(1).click();
                dealed_clue_stat_Table.go(1);
                tab_pagesize_dealed=true;

            }
        }else
        {
            if($(".Man1213_ul2 li").eq(0).attr('class')=='current')
            {
                second_undeal_clue_stat_Table.urlHandler.params.put("companyName", companyName);
                second_undeal_clue_stat_Table.urlHandler.params.put("processType", processType);
                second_undeal_clue_stat_Table.urlHandler.params.put("clueProcessType", processType);

                second_undeal_clue_stat_Table.urlHandler.params.put("clueState", clueState);
                second_undeal_clue_stat_Table.urlHandler.params.put("pageSize", pageSize);
                second_undeal_clue_stat_Table.total=0;
                second_undeal_clue_stat_Table.go(1);
                tab_pagesize_sec_undeal=true;
            }else
            {
                second_dealed_clue_stat_Table.urlHandler.params.put("companyName", companyName);
                second_dealed_clue_stat_Table.urlHandler.params.put("processType", processType);
                second_dealed_clue_stat_Table.urlHandler.params.put("clueProcessType", processType);

                second_dealed_clue_stat_Table.urlHandler.params.put("clueState", clueState);
                second_dealed_clue_stat_Table.urlHandler.params.put("pageSize", pageSize);
                second_dealed_clue_stat_Table.total=0;
                second_dealed_clue_stat_Table.go(1);
                tab_pagesize_sec_dealed=true;
            }

        }
    }
    
    function dealed_and_undeal(is_first_or_second_deal,is_searched) {
        // var companyName = $("[name='companyName']").val();
        // var processType = $("[name='clueProcessType']").val();
        // var clueState = $("[name='clueState']").val();
        // var pageSize = $("[name='pageSize']").val();
        if (is_first_or_second_deal=='dealed') {
            dealed_clue_stat_Table = new Pingan.PageHandler($("#clue_stat_dealed_model"), $("#clue_stat_dealed_model").parents('table').next(".zs_page"));
            dealed_clue_stat_Table.formateItem = function (index, model, row) {
                var createTime = new Date(row['createTime']).format("yyyy-MM-dd");
                var clueVerifyTime = new Date(row['clueVerifyTime']).format("yyyy-MM-dd");
                return model.format(row["companyName"]?row["companyName"]:'', row["clueTypeShow"]?row["clueTypeShow"]:'', '主管机构', createTime?createTime:'', row["clueProcessTypeShow"] == null ? "" : row["clueProcessTypeShow"], clueVerifyTime, '<a href="'+basePath+'/gov/user/clue/detail?id=' + row['clueId'] + '">详情</a>');
            };
            dealed_clue_stat_Table.onLoaded=function (result) {
                searched_or_not_dealed = true;
                var data=result.data;
                if(data.total==0)
                {
                    $("#record_total").html(0);
                    $("#page_record").html("1/1");
                    $(".detail_nodata").show();
                }else {
                    $(".detail_nodata").hide();
                    var curpage=parseInt(data.curPage)+1;
                    $("#record_total").html(data.total);
                    $("#page_record").html(curpage+"/"+data.totalPages);
                }
                total_dealed[0]=data.total;
                total_dealed[1]=data.totalPages;
            };

        } else if(is_first_or_second_deal=='undeal'){
            undeal_clue_stat_Table = new Pingan.PageHandler($("#clue_stat_undeal_model"), $("#clue_stat_undeal_model").parents('table').next(".zs_page"));
            undeal_clue_stat_Table.formateItem = function (index, model, row) {
                var createTime = new Date(row['createTime']).format("yyyy-MM-dd");
                return model.format(row["companyName"]?row["companyName"]:'', row['clueTypeShow']?row['clueTypeShow']:'', '主管机构', createTime?createTime:'', '<a href="'+basePath+'/gov/user/clue/auth?id=' + row['clueId'] + '">审核</a>');
            };
            undeal_clue_stat_Table.onLoaded=function (result) {
                searched_or_not_undeal = true;
                var data=result.data;
                if(data.total==0)
                {
                    $("#record_total").html(0);
                    $("#page_record").html("1/1");
                    $(".detail_nodata").show();
                }else {
                    $(".detail_nodata").hide();
                    var curpage=parseInt(data.curPage)+1;
                    $("#record_total").html(data.total);
                    $("#page_record").html(curpage+"/"+data.totalPages);
                }
                total_undeal[0]=data.total;
                total_undeal[1]=data.totalPages;
            };
        }else if(is_first_or_second_deal=='second_dealed')
        {
            second_dealed_clue_stat_Table = new Pingan.PageHandler($("#second_clue_stat_dealed_model"), $("#second_clue_stat_dealed_model").parents('table').next(".zs_page"));
            second_dealed_clue_stat_Table.formateItem = function (index, model, row) {
                var createTime = new Date(row['createTime']).format("yyyy-MM-dd");
                var clueVerifyTime = new Date(row['clueVerifyTime']).format("yyyy-MM-dd");
                return model.format(row["companyName"]?row["companyName"]:'', row["clueTypeShow"]?row["clueTypeShow"]:'', '杭州下城区商务局',  row["clueProcessTypeShow"] == null ? "" : row["clueProcessTypeShow"],createTime?createTime:'',row['caseProcessTypeShow']?row['caseProcessTypeShow']:'',row['lastupdatetime']?row['lastupdatetime']:'','<a href="'+basePath+'/gov/user/case/detail?id=' + row['id'] + '">详情</a>');
            };
            second_dealed_clue_stat_Table.onLoaded=function (result) {
                searched_or_not_sec_dealed = true;
                var data=result.data;
                if(data.total==0)
                {
                    $("#record_total").html(0);
                    $("#page_record").html("1/1");
                    $(".detail_nodata").show();
                }else {
                    $(".detail_nodata").hide();
                    var curpage=parseInt(data.curPage)+1;
                    $("#record_total").html(data.total);
                    $("#page_record").html(curpage+"/"+data.totalPages);
                }
                total_sec_dealed[0]=data.total;
                total_sec_dealed[1]=data.totalPages;
            };
        }else
            {
                second_undeal_clue_stat_Table = new Pingan.PageHandler($("#second_clue_stat_undeal_model"), $("#second_clue_stat_undeal_model").parents('table').next(".zs_page"));
                second_undeal_clue_stat_Table.formateItem = function (index, model, row) {
                    var createTime = new Date(row['createTime']).format("yyyy-MM-dd");
                    return model.format(row["companyName"]?row["companyName"]:'', row["clueTypeShow"]?row["clueTypeShow"]:'', '杭州下城区商务局',  row["clueProcessTypeShow"] == null ? "" : row["clueProcessTypeShow"],createTime?createTime:'','<a href="'+basePath+'/gov/user/case/audit?id=' + row['id'] + '">审核</a>');
                };
                second_undeal_clue_stat_Table.onLoaded=function (result) {
                    searched_or_not_sec_undeal=true;
                    var data=result.data;
                    if(data.total==0)
                    {
                        $("#record_total").html(0);
                        $("#page_record").html("1/1");
                        $(".detail_nodata").show();
                    }else {
                        $(".detail_nodata").hide();
                        var curpage=parseInt(data.curPage)+1;
                        $("#record_total").html(data.total);
                        $("#page_record").html(curpage+"/"+data.totalPages);
                    }
                    total_sec_undeal[0]=data.total;
                    total_sec_undeal[1]=data.totalPages;
                };
            }
    }


    function siteClueStatHalfYearTrend(container,data) {
        var list = data["data"];

        if (data && list.length!=0) {
            var startDate = new Array();
            var totalNum = new Array();
            var dealNum = new Array();
            var caseNum = new Array();
            var caseDealNum = new Array();

            for(var i=0;i<list.length;i++){
                startDate.push(new Date(parseInt(list[i].startDate)).format("yyyy年MM月"));
                totalNum.push(list[i].clueTotalNum);
                dealNum.push(list[i].clueDealNum);
                caseNum.push(list[i].caseNum);
                caseDealNum.push(list[i].caseDealNum);
                if( i == list.length - 1 ){
                    $(".top-wz label").text(new Date(parseInt(list[i].startDate)).format("MM月份"));
                    $("#clueTotalNum").html($.format(list[i].clueTotalNum,3,','));
                    $("#clueDealNum").html($.format(list[i].clueDealNum,3,','));
                    $("#caseNum").html($.format(list[i].caseNum,3,','));
                    $("#caseDealNum").html($.format(list[i].caseDealNum,3,','));

                    var clueDealProbability = list[i].clueDealNum * 100 / list[i].clueTotalNum;
                    var caseDealProbability = list[i].caseDealNum * 100 / list[i].caseNum;
                    $("#clueDealProbability").html( parseInt(clueDealProbability) + "%" );
                    $("#caseDealProbability").html( parseInt(caseDealProbability) + "%" );

                }
            }


            var siteShopStatHalfYearTre=echarts.init(document.getElementById(container));
            siteShopStatHalfYearTre.setOption(option = {
                    title: {
                        show:false,
                        text: '监管成效近半年趋势',
                        // padding:['50%','50%']
                        top:'2%',
                        right:'center',
                        textStyle:{
                            fontWeight:'normal'
                        }
                    },
                    tooltip: {
                        trigger: 'axis',
                        // backgroundColor:'#F7F9FB',
                        // borderColor:'#92DAFF',
                        // borderWidth:'1px',
                        textStyle:{
                            fontSize:14,
                        },
                        position:function (point, params, dom) {
                            return [point[0]-185,point[1]-63];
                        },
                        // formatter: function(param) {
                        // 	var name;
                        // 	var tip='';
                        // 	var seriesName=new Array;
                        // 	var value=new Array;
                        // 	for(var i=0;i<4;i++){
                        // 		name=param[0]['name'];
                        // 		seriesName.push(param[i]['seriesName']);
                        // 		value.push($.format(param[i]['value'], 3, ','));
                        // 	}
                        // 	for(var i=0;i<4;i++){
                        // 		tip+=(seriesName[i]+':'+value[i]+'个<br/>')
                        // 	}
                        // 	return name+'<br/>'+tip;
                        // }
                        // formatter:'{b0}<br>{a0}: {c0}家<br />{b1}: {c1}家<br />{b2}: {c2}家<br />{b3}: {c3}家'
                    },
                    label:{
                        normal:{
                            show:true,
                            formatter:function (param) {
                                return $.format(param['value'],3,',')
                            },
                            textStyle:{
                                fontSize:14,
                            },
                        },
                        emphasis:{
                            show:true,
                            formatter:function (param) {
                                return $.format(param['value'],3,',')
                            },
                            textStyle:{
                                fontSize:17,
                            },
                        }
                    },
                    legend: {
                        padding: [380,100],
                        textStyle:{
                            fontSize:14,
                        },
                        data:['发现线索数','已初审线索数','需复审线索数','已复审线索数']
                    },
                    xAxis: {
                        type: 'category',
                        boundaryGap: true,
                        axisLabel:{margin:14,
                            textStyle:{
                            fontSize:14,
                            },},
                        data:startDate,
                        // axisTick:{interval:0}
                    },
                    yAxis: [{
                        type: 'value',
                        name:'数量 (个)',
                        axisTick:{show:false},
                        axisLabel: {
                            formatter: function (param) {
                                return param/1000+'k'
                            },
                            textStyle:{
                                fontSize:14,
                            },
                        },
                        nameLocation:'middle',
                        nameGap:50,
                        nameTextStyle:{
                            fontSize:14,
                        },
                        axisLine:{show:false},
                        min:0,
                        // interval:20000
                    }],
                    series: [
                        {
                            symbol:'circle',
                            symbolSize:12,
                            itemStyle:{
                                normal:{
                                    color:' #F6D24A'
                                }
                            },
                            name:'发现线索数',
                            type:'line',
                            data:totalNum
                        },
                        {
                            symbol:'diamond',
                            symbolSize:12,
                            itemStyle:{
                                normal:{
                                    color:'#A9D96C'
                                }
                            },
                            name:'已初审线索数',
                            type:'line',
                            data:dealNum
                        },
                        {
                            symbol:'triangle',
                            symbolSize:12,
                            itemStyle:{
                                normal:{
                                    color:'#58C9F5'
                                }
                            },
                            name:'需复审线索数',
                            type:'line',
                            data:caseNum
                        },
                        {
                            symbol:'rect',
                            symbolSize:12,
                            itemStyle:{
                                normal:{
                                    color:'#71C68C'
                                }
                            },
                            name:'已复审线索数',
                            type:'line',
                            data:caseDealNum
                        }
                    ]
                }
            )


        }else{//显示无数据的提示图
            $("#"+container).html('');
        }

    }

});

function initClueContent(content) {
    var contentHtml = "";
    var report_reason;
    var report_name;
    var imagsUrl = basePath + "/images/spvision_images/";
    for (var name in content) {
        var value = content[name];

        if (name == "附件") {
            contentHtml += "<li>";
            contentHtml += "<div class='lable'>" + name + ":</div>";
            contentHtml += "<div class='clue-content'><a href='" + basePath + "/" + value + "' target='_blank'>点击查看</a></div>";
            contentHtml += "</li>";
            continue;
        }
        if(name== "举报原因")
        {
             report_reason= value;
             report_name= name;
            continue;
        }
        if ((typeof value) == "string") {
            if(name=="举报原因"){continue;}
            contentHtml+= "<p class='govAudit_xs_p4'>"+name+"：<span>"+value+"</span></p>";
          /*  contentHtml += "<li>";
            contentHtml += "<div class='lable'>" + name + "："+value+"</div>";
            // contentHtml += "<div class='clue-content'>" + value + "</div>";
            contentHtml += "</li>";*/
        }
        if ((typeof value) == "object") {
          /*  contentHtml += "<li style='width:100%;'>";
            contentHtml += "<div class='lable'>" + name + "：</div>";
            contentHtml += "<div class='clue-content'>";*/
            contentHtml+=" <p class='govAudit_xs_p4'>举报类型：";

            for (var index in value) {
                var obj = value[index];
                for (var nameSec in obj) {
                    if (obj[nameSec]) {
                        // contentHtml += "<label> <img src='" + imagsUrl + "choose.jpg' style='margin-left:6px;'>" + nameSec + "</label>";
                        // contentHtml += "<span><img src='" + imagsUrl + "choose.jpg' style='margin-left:6px;'><input type='checkbox'>"+nameSec+"</span>";
                        contentHtml += "<span><img src='" + imagsUrl + "choose.jpg' style='margin-left:6px;'>"+nameSec+"</span>";
                    } else {
                        // contentHtml += "<label style='color:silver;'> <img src='" + imagsUrl + "chooseno.jpg' style='margin-left:6px;'>" + nameSec + "</label>";
                        // contentHtml += "<span><input type='checkbox'>"+nameSec+"</span>";
                        contentHtml += "<span>"+nameSec+"</span>";
                    }
                }
            }
            contentHtml += "</p>";
        }

    }
    if(report_name){
        contentHtml+="<p>"+report_name+"：<span>"+report_reason+"</span></p>";
    }
    $("#clue_content").html(contentHtml);

}
