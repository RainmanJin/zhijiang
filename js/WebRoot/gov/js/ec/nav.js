/**
 * Created by admin on 2016/8/18.
 */
require(['Pingan'],function (Pingan) {
        Pingan.Init=function () {
                new Pingan.NavHandler($("#e_business_nav").find("[data-nav]"));
        };
        Pingan.Init();
});