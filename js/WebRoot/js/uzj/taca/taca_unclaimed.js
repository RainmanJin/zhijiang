require.config({
    waitSeconds: 0,
    baseUrl: basePath,
    paths: {
        Pingan: 'js/common/common',
        top: 'js/uzj/new_top'
    },
    shim: {
        top: {
            deps: ['Pingan']
        }
        },
    deps: ['top']
});

require(['Pingan'], function (Pingan)
{
    Pingan.Base = (function ()
    {
        var init = function () {};
        return {
            init: init
        };
    })();


    //事件
    Pingan.Event = (function ()
    {
        var init = function ()
        {
        };
        return {
            init: init
        };
    })();

    (function ()
    {
        Pingan.Base.init();
        Pingan.Event.init();
    })();

});