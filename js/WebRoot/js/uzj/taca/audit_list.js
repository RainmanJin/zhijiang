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

require(['Pingan'], function (Pingan) {
    var auditPage;
    Pingan.Base = (function () {

        var init = function () {

            auditPage = new Pingan.PageHandler($("#auditBody"), $("#auditList").find(".new-page"));
            auditPage.formateItem = function (index, model, row) {
                var activity = row.activity;
                var submitType = "";
                if (activity["submitType"] == 2) {
                    submitType = " (到期复审)";
                }

         /*       var auditClass = "audit-s1";

                if (row["status"]==="unapproved") {
                    auditClass = "audit-s3";
                } else if (row["status"]==="approved") {
                    auditClass = "audit-s2";
                }
                if (activity["status"]==="first_unapproved") {
                    auditClass = "audit-s3";
                } else if (activity["status"]==="first_approved") {
                    auditClass = "audit-s2";
                }*/
                return model.format(activity["companyName"], new Date(activity["submitTime"]).format("yyyy-MM-dd"), activity["punishCount"], activity["owedTaxCount"], activity["uncreditCount"],
                 activity["judgmentCount"], row["statusName"], submitType, row["statusClass"], row["id"]).replace(/null/g, ' ');

            };
        };
        return {
            init: init
        };
    })();


    //事件
    Pingan.Event = (function () {
        var initTab = function () {
            $("#industryTab").find("a").click(function () {
                $("#industryTab").find("a").removeClass("current");
                $(this).addClass("current");
                auditPage.urlHandler.params.put("industry", $(this).attr("tab"));
                auditPage.total = 0;
                auditPage.go(1);
            });

            $("#statusTab").find("a").click(function () {
                $("#statusTab").find("a").removeClass("current");
                $(this).addClass("current");
                auditPage.urlHandler.params.put("status", $(this).attr("tab"));
                auditPage.total = 0;
                auditPage.go(1);
            });
        }
        var init = function () {
            initTab();
        };
        return {
            init: init
        };
    })();

    (function () {
        Pingan.Base.init();
        Pingan.Event.init();
    })();

});

