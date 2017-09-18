require(['Pingan'], function () {
    new Pingan.NavHandler($("#leftNav").find("[data-nav]"));
    $("#leftNav").find("[data-nav]").click(function () {
       location.href = $(this).attr("href");
    });
});