/**
 * Created by admin on 2016/8/18.
 */

require(['Pingan'], function (Pingan) {
    //事件
    Pingan.Event = function () {
        $("#search").submit(function () {
            var keyObj = $(this).find("[name='key']");
            keyObj.val($.trim(keyObj.val()));
            if (keyObj.val() == "") {
                return false;
            }
            return true;
        });
    };

    //初始化
    Pingan.Init = function () {
        new Pingan.NavHandler($("#creditculture").find("[data-nav]"));
        var newsAll=new Pingan.PageHandler($("#articleList"),$("#articleList").siblings(".s-page"));
        newsAll.formateItem = function (index, model, row){
            return model.format(row["articleNo"],row["articleTitle"],row["articleIntro"],row["articleShowtime"]).replace(/null/g, ' ');
        };
        Pingan.Event();
    };
    Pingan.Init();
});

require.config({
    waitSeconds: 0,
    baseUrl:basePath+'/',
    paths: {
        Pingan: 'gov/js/common/common',
        top: 'gov/js/gov_top',
        article: 'gov/js/article'
    },
    shim: {
        top: {
            deps: ['Pingan']
        },
        article_header: {
            deps: ['jquery']
        }
    },
    deps: ['Pingan', 'top', 'article']
});