define('audit_top', ['Pingan'], function (Pingan) {
    //判断Pingan模块是否加载
    Pingan = Pingan ? Pingan : require("common/common");

    Pingan.Base = (function () {
            $("#auditBtn").find("a").click(function () {
                var text = $(this).attr("text");
                var data = $(this).attr("data");
                $("#auditTip").text(text);
                $("#auditStatus").val(data);
                if(data === "approved")
                {
                    $("#deleteShow").hide();
                    $("#auditTip").css("color","#60d499");
                }else{
                    $("#deleteShow").show();
                    $("#auditTip").css("color","#ec6363");
                }
                Pingan.malert($("#auditConfirm"),$("#btnCancel"),{});
            });
            var auditSubmit = function (status,auditId) {
                $.get(basePath+"/taca/audit/ajax/process?status="+status+"&auditId="+auditId,function (result) {
                    if(result.statusCode === 1) {
                        Pingan.malertInfo('操作成功!', 'datum-tip-cls', {callback:function () {
                            location.href = basePath+'/taca/audit/list';
                        }});

                    }else {
                        Pingan.malertInfo(result.statusMessage, 'm-alert-info-failed', {});
                    }
                })
            };
            $("#btnConfirm").click(function () {
                auditSubmit($("#auditStatus").val(),$("#auditId").val())
            });

            $("#btnDelete").click(function () {
                auditSubmit("delete",$("#auditId").val())
            });

    })();
});