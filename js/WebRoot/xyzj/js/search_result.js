require.config({
    waitSeconds: 0,
    baseUrl: basePath,
    paths: {
        Pingan: 'js/common/common'
    },
    deps: ['Pingan']
});

define(['Pingan'],function (Pingan){

    Pingan.Base = (function (){

        var urlHandler = (function (){
            return new Pingan.UrlHandler(window.location.href);
        })();

        //查询分页
        var initPageHandler = function(){

            //全部查询
            var pageAll = new Pingan.PageHandler($("#all"), $("#all").find(".new-page"));
        };

        //初始化查询表单
        var initSearchForm = function (){
            var searchForm = new Pingan.MForm($("#searchForm"));
            $("#btn-search").click(function (){
                $("#searchForm").trigger("submit");
            });
        };

        var init = function (){
            initPageHandler();
            initSearchForm();
        };

        return {
            init : init,
            urlHandler : urlHandler
        };

    })();


    Pingan.Event = (function (){


        //切换标签
        var initTabs = function (){
            var tabSelectHandler = new Pingan.SelectHandler($('.n-b-index li'), false, true);
            tabSelectHandler.selected = function (item){
                var tab = item.attr("tab");
                $("#searchType").val(tab);

            };

            //切换到记录标签
            // var searchType = Pingan.Base.urlHandler.params.get("searchType") || 'all';
            var searchType = $("#searchType").val();
            $("[tab='"+searchType+"']").click();

            var searchTypeTabHandler = new Pingan.SelectHandler($("#searchTypeTab a"),false,true);
            searchTypeTabHandler.selected = function (item){
                var tab = item.attr("tab");
                $("#searchType").val(tab);
                locationHref();
            };

            var cityTab = new Pingan.SelectHandler($('#areaTab a'),false,true);
            cityTab.selected = function (item) {
                var tab = item.attr("data-attr");
                $("#cityCode").val(tab);
                locationHref();
            };
            var capitalTab = new Pingan.SelectHandler($('#capitalTab a'),false,true);
            capitalTab.selected = function (item) {
                var tab = item.attr("data-attr");
                $("#capitalNumberCode").val(tab);
                locationHref();
            };
            var establishTab = new Pingan.SelectHandler($('#establishTab a'),false,true);
            establishTab.selected = function (item) {
                var tab = item.attr("data-attr");
                $("#establishType").val(tab);
                locationHref();
            };

            var locationHref = function () {
                var searchType = $("#searchType").val();
                var cityCode = $("#cityCode").val();
                var capitalNumberCode = $("#capitalNumberCode").val();
                var establishType = $("#establishType").val();
                var searchKey = $("#searchKey").val();
                location.href=basePath+"/xyzj/search?key="+searchKey+"&searchType="+searchType+"&cityCode="+cityCode+"&capitalNumberCode="+capitalNumberCode+"&establishType="+establishType;
            }
        };


        //浏览记录
        var initBrowseHistory = function (){
            var cfg = config;
            var cookieValue = cfg.cookieValue;
            if(!cookieValue)
            {
                return false;
            }
            // var title = "<h3 class=\"detail-list-h3\"><span>最近搜索公司</span></h3>";
            var historyHtml = "";
            // var htmlTemplate = "<p><a target='_blank' href='"+cfg.companyDetailUrl+"'>{1}</a></p>";
            var htmlTemplate = "<a target='_blank' href='"+cfg.companyDetailUrl+"'>{1}</a>";
            if(cookieValue)
            {
                var cookieJson = eval('(' + cookieValue + ')');
                for(var key in cookieJson)
                {
                    if(!cookieJson[key]['companyNo'])
                    {
                        continue;
                    }
                    var companyName = "";
                    if(cookieJson[key]['companyName'])
                    {
                        companyName = cookieJson[key]['companyName'];
                    }
                    var html = htmlTemplate.format(cookieJson[key]['companyNo'], companyName, new Date(parseInt(cookieJson[key]['createDate'])).format("yyyy-MM-dd hh:mm:ss"));
                    historyHtml += html;
                }
                if($.trim(historyHtml) == ""){
                    historyHtml = "<div style='line-height:45px;text-align:center;border-bottom: 1px solid #eaeaea;'>您还未浏览过任何公司哦</div>";
                }
                $("#nearlyVisited").append( historyHtml);
            }
            //处理页面展示
            return true;
        };

        var init = function (){
            initTabs();
            initBrowseHistory();
        };

        return {
            init : init
        };
    })();


    $(document).ready(function () {
        Pingan.Base.init();
        Pingan.Event.init();
    });

});
