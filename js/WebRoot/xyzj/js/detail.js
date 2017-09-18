/**
 * Created by admin on 4/16/2017.
 */
require.config({
    waitSeconds : 0,
    baseUrl : basePath,
    paths : {
        Pingan : 'js/common/common',
        echarts:'js/lib/echarts.min',
    },
    shim : {},
    deps : [ 'Pingan', 'echarts']
});

require(['Pingan', 'echarts'],function (Pingan,echarts){
    Pingan.Base = (function (){
        //初始化全局变量
        var initGlobalVar = function (){

        };
        var initScoreHelp = function () {
            new Pingan.SlideButton($("#scoreHelpBtn"), $("#scoreHelp"));
        };
      //初始化选择控制器
	  var initSelectHandler = function () {
		   //主选项卡
          var  primaryTab = new Pingan.SelectHandler($("#xyzj_detail_div").find("li"), false, true);
          $($("#xyzj_detail_div").find("li[class='current']").attr("data-mark")).show();
	  }

	  //初始化详情页评价体系结构示意图
	  var init_credit_assess_data =function ()
      {
          var cate_opts ={};
          cate_opts.color='black';
          var category_data_json  ;
          var gauge_value ='暂无';
          if(!DetailCfg.categoryScores)
          {
              cate_opts.color = 'black';
              cate_opts.text ='暂无';
              cate_opts.subtext ='';
              category_data_json =[0,0,0,0,0];
          }else {
              category_data_json = $.parseJSON(DetailCfg.categoryScores);
              cate_opts.text = category_data_json[0] + category_data_json[1] + category_data_json[2] + category_data_json[3] + category_data_json[4];
              gauge_value = cate_opts.text;
              //gauge_value = 595;
              if(gauge_value <= 550)
              {
                  gauge_value = 0.6*gauge_value+140;
              }else if (gauge_value <=700)
              {
                  gauge_value = 2.4*gauge_value-850;
              }else
                  {
                      gauge_value = 0.48*gauge_value+494;
                  }
              cate_opts.subtext ='综合信用分';
          }
          echarts_generate_graph("graph_id", generate_total_option(category_data_json,cate_opts),null);
          $("#graph_id div").prepend($("#symbol_id"));
          $("#symbol_id").show();
          echarts_generate_graph("circle_id_1", generate_option("基本情况",'rgb(72,179,248)',[355-category_data_json[0],category_data_json[0]]), null);
          echarts_generate_graph("circle_id_2", generate_option("金融财税 ",'rgb(248,157,48)',[80-category_data_json[4],category_data_json[4]]), null);
          echarts_generate_graph("circle_id_3", generate_option("质量安全",'rgb(242,125,102)',[80-category_data_json[3],category_data_json[3]]), null);
          echarts_generate_graph("circle_id_4", generate_option("遵纪守法",'rgb(33,199,221)',[355-category_data_json[2],category_data_json[2]]), null);
          echarts_generate_graph("circle_id_5", generate_option("社会责任",'rgb(155,220,4)',[80-category_data_json[1],category_data_json[1]]), null);
          echarts_generate_graph("credit_level_id",credit_level_option(gauge_value),null);
      };

	  $(function ()
      {
          $('#circle_id_1,#circle_id_2,#circle_id_3,#circle_id_4,#circle_id_5').hover(function ()
          {
              $(this).siblings('div').show();
          },function ()
          {
              $(this).siblings('div').hide();
          });
      });

	  //变更记录 加载更多
        var change_record_show_more = function ()
        {
            var npage =0;
            $("#to_show_more").on('click',function ()
            {
                npage++;
                $.ajax({
                    url:basePath+"/xyzj/change/record",
                    data:{"npage":npage,"companyNameDigest":DetailCfg.companyNameDigest,'total':DetailCfg.total},
                    success:function (result) {
                        if(result.statusCode==1){
                            var next_content = result.data.content;
                            var next_html = "";
                            if(next_content.length ==0)
                            {
                                $("#to_show_more").hide();
                            }
                            next_content.forEach(function (value, index, array)
                            {
                                next_html += '<tr id=change_"'+index+'><td class="t12">' + new Date(parseInt(value.changeDate)).format("yyyy-MM-dd") + '</td>' +
                                    '<td class="t13">' + value.changeField + '</td>'+
                                    '<td class="t14" data-attr="'+value.contentBefore+'" maxlength="20">' + value.contentBefore + '</td>'+
                                    '<td class="t14" data-attr="'+value.contentAfter+'" maxlength="20">' + value.contentAfter + '</td></tr>';
                            });

                            $("#change_list").append(next_html);
                            //init_change_record_length();
                            initChangeListMaxLength();
                        }else
                        {
//                    console.log(result);
                        }
                    }
                });
            });
            
        }

        var pjry_pageable = function ()
        {
            //投资者信息分页
            var pjryPage = new Pingan.PageHandler($("#pjry_page_id"), $("#pjry_page_id").parents('.table-right').next());
            pjryPage.formateItem = function (index, model, row){
                return model.format(row["name"],row["idCard"],row["sex"],row["birth"],row["political"],row["academy"],row['position'],row['telnumber']).replace(/null/g, ' ');
            };
            pjryPage.onLoaded = function (result){
                if(this.total < 1){
                    this.content.parents(".table-right").hide();
                }
                if(result.statusCode==1){
                    $("#nodataPjry").hide();
                }else{
                    $("#nodataPjry").show();
                }
            }
            
        }

        /**统计的公用方法（在PageHandler.onLoaded方法中调用）
         * @param obj 最终显示结果的对象
         * @param name 子项名称
         * @param total 子项条数
         * */
        var initCount = function (obj, name, total){
            var oldTotal = Number(obj.html());
            oldTotal = isNaN(oldTotal) ? 0 : oldTotal;
            var namTotal = Number(obj.attr(name));
            namTotal = isNaN(namTotal) ? 0 : namTotal;
            if(namTotal != total){
                var newTotal = oldTotal - namTotal + total;
                obj.html(newTotal);
                obj.attr(name, total);
            }
        }


        var init = function (){
            initGlobalVar();
            initScoreHelp();
            initSelectHandler();
            initChangeListMaxLength();
            change_record_show_more();
            init_credit_assess_data();
            pjry_pageable();
        };

        return {
            init : init,
            initCount : initCount
        };
    })();

    Pingan.Load = (function (){

        var init = function(){
        };

        return {
            init : init,
        };
    })();

    Pingan.Event = (function (){

        var init = function (){
//			initSearch();
        };

        return { init : init };

    })();

    (function (){
        Pingan.Base.init();
        Pingan.Load.init();
        Pingan.Event.init();
    })();
    function echarts_generate_graph(container, option, opts) {
        var graph = echarts.init(document.getElementById(container));
        graph.setOption(option);
    }
    function generate_total_option(data,opts)
    {
        return {
            title: {
                text: opts.text,
                left: 'center',
                bottom: 'center',
                subtext: opts.subtext,
                textStyle: {
                    color: opts.color,
                    fontStyle: 'normal',
                    fontWeight: 'bold',
//                    fontFamily: 'sans-serif',
                    fontSize: 35,
                },
                subtextStyle: {
                    color: opts.color,
                    fontStyle: 'normal',
                    fontWeight: 'normal',
//                    fontFamily: 'sans-serif',
                    fontSize: 22,
                },
            },
            tooltip: {show: false},
            legend: {
                show: false,
                data: ['基本情况', '社会责任', '遵纪守法', '质量安全', '金融财税']
            },
            radar: {
                axisTick: {show: false},
                /*axisLine:{
                 show:false,
                 },*/
                axisLabel: {show: false},
                /*splitArea:{
                 show:true,
                 areaStyle:{color:'red'}},*/
                splitNumber: 1,
                /*splitLine:{
                 show:true,
                 lineStyle:{
                 color:'blue'
                 }
                 },*/
//				silent:true,
                // shape: 'circle',
                name: {
                    show: true,
                    textStyle: {
                        color: 'black',
                        fontSize: 20
                    },
                    formatter: function (value, indicator)
                    {
//                        return '【' +indicator.prefix+ value + indicator.sufix+'】';
                        return value;
                    }
                },
                nameGap:21,
                indicator: [
                    {name: '基本情况', max: 355},
                    {name: '社会责任', max: 80},
                    {name: '遵纪守法', max: 355},
                    {name: '质量安全', max: 80},
                    {name: '金融财税', max: 80}
                ]
            },
            series: [{
                name: '',
                type: 'radar',
                itemStyle: {
                    normal: {
                        color: 'rgb(52,108,201)',
//                        borderColor: '#000',
//                        borderWidth: 0,
                        borderType: 'solid',


                        shadowOffsetX: 0,
                        shadowOffsetY: 0,

                    },

                },
                symbol: 'circle',
                symbolSize: 0,
                lineStyle: {
                    normal: {
                        color: 'rgb(81,175,247)'
                    }
                },
                label: {
                    normal: {}
                },
                data: [
                    {
                        value: data,
                        name: '',
                        areaStyle: {
                            normal: {
                                opacity: 0.85,
                                color: new echarts.graphic.RadialGradient(0.5, 0.5, 1, [
                                    {
                                        color: 'rgb(70,170,246)',
//                                        color: 'rgb(52,108,201)',
                                        offset: 0
                                    },
                                    {
                                        color: 'white',
                                        offset: 1
                                    }
                                ])
//                                color:function(){return radial-gradient('circle',rgb(93,133,221),white);}
                            }
                        }
                    }
                ]
            }]
        };
    }


    function generate_option(legend_data,color_setting,data)
    {
        return {
            tooltip: {
                show: false,
            },

            legend: {
                show: false,
                orient: 'vertical',
                x: 'left',
                data: [legend_data, 'other']
            },
            series: [
                {
                    color: ['rgb(234,238,251)', color_setting],
                    name: '',
                    type: 'pie',
                    radius: ['50%', '70%'],
                    avoidLabelOverlap: false,
                    label: {
                        normal: {
                            position: 'center',
                            formatter: function (params)
                            {
                                if (params.name == "other")
                                    return "";
                                return params.value;
                            },
                            textStyle: {
                                fontStyle: 'normal',
                                fontWeight: 'normal',
                                fontSize: 13
                            }
                        },
                        emphasis: {
                            show: true,
                            formatter: function (params)
                            {
                                if (params.name == "other")
                                    return "";
                                return params.value;
                            },
                            textStyle: {
                                fontSize: 14,
                                fontWeight: 'bold'
                            }
                        }
                    },
                    labelLine: {
                        normal: {
                            show: false
                        }
                    },
                    data: [
                        {
                            value: data[0], name: 'other', tooltip: {
                            show: false,
                        }
                        },
                        {value: data[1], name: legend_data},
                    ]
                }
            ]
        };
    }


});


//定位小火箭（返回顶部）
function positionBackButton(obj,mleft,right){
    var offleft = obj.offset().left
    var bottom = $(".bottom").offset().top - (obj.height() + obj.offset().top);
    if(offleft <= 1300){
        obj.css({"right":"","left":"50%","margin-left":mleft + "px"});
    }else{
        obj.css({"right":right + "px","left":"","margin-left":""});
    }
}

//变更记录初始化长度
var initChangeListMaxLength = function () {
    maxlength($("#change_list").find("[maxlength]"));
};
//长度超出时显示 更多/收起
function maxlength(objs){
    objs.each(function (){
        obj=$(this);
        var s =obj.attr('data-attr');
        obj.attr("mtitle",s);
        var max = obj.attr("maxlength");
        if(s.length>max){
            obj.html(s.substring(0,max)+"<a more='on' href='javascript:void(0)'  style='color:#45a9ff;'>>></a>");
            maxlengthfilter_bangding(obj.find("[more]"));
        }
    });
}

//长度超出时显示 更多/收起
function maxlengthfilter_bangding(a){
    a.click(function (){
        p = a.parent();
        if(a.attr("more")=='on'){
            p.html(p.attr("mtitle")+"<a more='off' href='javascript:void(0)' style='color:#45a9ff;'>&nbsp&nbsp&nbsp&nbsp<<</a>");
        }else{
            // p.html(p.attr("mtitle").substring(0,p.attr("maxlength"))+"<a more='on' href='javascript:void(0)' style='color:#45a9ff;'>…更多</a>");
            p.html(p.attr("mtitle").substring(0,p.attr("maxlength"))+"<a more='on' href='javascript:void(0)' style='color:#45a9ff;'>>></a>");
        }
        maxlengthfilter_bangding(p.find("[more]"));
    });
}

//生成detail各echarts图公用方法
function echarts_generate_graph(container, option, opts) {
    var graph = echarts.init(document.getElementById(container));
    graph.setOption(option);
}


//5个小圆环option
function generate_option(legend_data,color_setting,data)
{
    return {
        tooltip: {
            show: false,
        },

        legend: {
            show: false,
            orient: 'vertical',
            x: 'left',
            data: [legend_data, 'other']
        },
        series: [
            {
                color: ['rgb(234,238,251)', color_setting],
                name: '',
                type: 'pie',
                radius: ['50%', '70%'],
                avoidLabelOverlap: false,
                label: {
                    normal: {
                        position: 'center',
                        formatter: function (params)
                        {
                            if (params.name == "other")
                                return "";
                            return params.name;
                        },
                        textStyle: {
                            fontStyle: 'normal',
                            fontWeight: 'normal',
                            fontSize: 18
                        }
                    },
                    emphasis: {
                        show: true,
                        formatter: function (params)
                        {
                            if (params.name == "other")
                                return "";
                            return params.value;
                        },
                        textStyle: {
                            fontSize: '30',
                            fontWeight: 'bold'
                        }
                    }
                },
                labelLine: {
                    normal: {
                        show: false
                    }
                },
                data: [
                    {
                        value: data[0], name: 'other', tooltip: {
                        show: false,
                    }
                    },
                    {value: data[1], name: legend_data},
                ]
            }
        ]
    };
}

//评价等级仪表板option
function credit_level_option(score)
{
   return {
        title: {
            show:false,
            x: "center",
            bottom: 60,
            //text:'AAA',
            subtext:'信用等级'
        },
        tooltip: {
            show:false,
            formatter: "{a} <br/>{b} {c}",
            /*formatter:function (param)
            {
                return '<span style="color:red;">'+param+'</span>'
            }*/

        },
        series: [{
            name: '信用分',
            type: 'gauge',
            // startAngle: 180,
            // endAngle: 0,
            min:350,
            max:950,
            axisLine: {
                show: true,
                lineStyle: {
                    width:15,
                    shadowBlur: 0,
                    color: [[0.2, '#E43F3D'],[0.4, '#E98E2C'],[0.6, '#DDBD4D'],[0.8, '#7CBB55'],[1, '#9CD6CE']]
                }
            },
            axisTick: {
                show: true,
                splitNumber: 1
            },
            splitLine:{
                show: true,
                length:20,
                lineStyle:{
                    //color:'black'
                },
            },
            axisLabel: {
                formatter: function(e) {
                    switch (e + "") {
                        case "410":
                            //return "较差";
                            return "";
                        case "470":
                            return "550";

                        case "530":
                            //return "中等";
                            return "";
                        case "590":
                            return "600";

                        case "650":
                            //return "良好";
                            return "";
                        case "710":
                            return "650";

                        case "770":
                            //return "优秀";
                            return "";
                        case "830":
                            return "700";

                        case "890":
                            //return "极好";
                            return "";
                        default:
                            return e;
                    }
                },
                textStyle: {
                    fontSize: 12,
                    fontWeight: ""
                }
            },
            pointer: {
                show: true,
            },
            detail: {
                show:false,
                formatter: function (param)
                {
                    var level='';
                    if(param<470)
                {
                    level='较差'
                }else if(param<590)
                    {
                        level='中等'
                    }else if(param<710)
                    {
                        level='良好'
                    }else if(param<830)
                    {
                        level='优秀'
                    }else if(param<=950){
                        level='极好'
                    }else {
                        level='暂无';
                    }
                  return level;
                },
                offsetCenter: [0, 30],
                textStyle: {
                    fontSize: 20
                }
            },
            data: [{
                name: "",
                value: score,
            }]
        }]
    }
    
}



