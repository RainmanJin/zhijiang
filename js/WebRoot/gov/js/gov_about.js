/**
 * Created by admin on 2016/8/18.
 */
require(['Pingan'], function (Pingan) {
    //初始化
    Pingan.Init = function () {
        //导航
        new Pingan.NavHandler($("#gov_about_us").find("[data-nav]"));
    };
    Pingan.Init();

});

require.config({
    waitSeconds : 0,
    baseUrl : basePath + "/",
    paths : {
        upload : 'gov/js/lib/webUpload/upload',
        Pingan : 'gov/js/common/common',
        top: 'gov/js/gov_top',
        gov_about_us:'gov/js/gov_about'
    },
    shim : {
        top : {
            deps : [ 'Pingan' ]
        },
        gov_about_us:
        {
            deps:['Pingan']
        }
    },
    deps : [ 'top','gov_about_us' ]
});