/**
 * Created by wangjunling on 2017/5/23.
 */
require.config({
    waitSeconds: 0,
    baseUrl: basePath,
    paths: {
        Pingan: 'gov/js/common/common',
        gov_top: 'gov/js/monitor/monitor_top',
        left: 'gov/js/monitor/monitor_left',
        owner_monitor: "gov/js/monitor/monitor"
    },
    shim: {
        owner_monitor: {
            deps: ['Pingan']
        },
        gov_top: {
            deps: ['Pingan']
        },
        left: {
            deps: ['Pingan']
        }

    },
    deps: [ 'gov_top', 'left',  'owner_monitor']
});
require(['Pingan'], function (Pingan) {
    Pingan.Init = function () {
       var ownerMonitorTable = new Pingan.PageHandler($("#ownerMonitorTable"), $(".zs_page"));
        ownerMonitorTable.formateItem = function (index, model, row) {
            var auditStatus = parseInt(row["auditStatus"]);
            var str = '';
            var className = 'govRed';
            if(auditStatus==0||auditStatus==100||auditStatus==200){
                str="待审核";
                className = 'govYellow';
            }else if(auditStatus==300){
                str="通过";
                className = 'govGreen';
            }else {
                str="驳回";
            }
            return model.format(row["companyName"], new Date(parseInt(row["createTime"])).format("yyyy-MM-dd"), row["city"]==null?"未知":row["city"],  row["district"]==null?"未知":row["district"],str,className,row["companyNameDigest"]);

        };
        var userCityCode = $("#userCityCode").val();
        var userDistrictCode = $("#userDistrictCode").val();
        if(userCityCode===''||userCityCode==='0'){
            $.ajax({
                url: basePath+"/gov/province/4003/city",
                type: "GET",
                success:function (result) {
                    if(result.statusCode==1){
                        var data = result.data;
                        var optionHtml = "<option value=''>选择市</option>";
                        for(var i=0;i<data.length;i++) {
                            optionHtml+="<option value='"+data[i].id+"'>"+data[i].name+"</option>"
                        }
                        $("#citySelect").find("option").remove();
                        $("#citySelect").append(optionHtml);
                    }
                }
            });
        }else{
            initDistrictSelect(userCityCode);
        }
        $("#citySelect").change(function () {
            var key = $(this).val();
            ownerMonitorTable.urlHandler.params.put("cityCode", key);
            ownerMonitorTable.urlHandler.params.put("districtCode", '');
            ownerMonitorTable.total=0;
            ownerMonitorTable.spage = 1;
            ownerMonitorTable.go(1);
            reloadCount(ownerMonitorTable.urlHandler.params.get("cityCode"),ownerMonitorTable.urlHandler.params.get("districtCode"));
            if(!key){
                $("#districtSelect").find("option").remove();
                var optionHtml = "<option value=''>选择区</option>";
                $("#districtSelect").append(optionHtml);
                return;
            }
            initDistrictSelect(key);
        });

        $("#districtSelect").change(function () {
            var key = $(this).val();
            ownerMonitorTable.urlHandler.params.put("districtCode", key);
            ownerMonitorTable.total = 0;
            ownerMonitorTable.spage = 1;
            ownerMonitorTable.go(1);
            reloadCount(ownerMonitorTable.urlHandler.params.get("cityCode"),ownerMonitorTable.urlHandler.params.get["districtCode"]);
        });
    };
    Pingan.Init();
});
function reloadCount(cityCode, districtCode) {
    $.ajax({
        url: basePath+"/gov/user/owner/ajax/count?cityCode="+cityCode+"&districtCode="+districtCode,
        type: "GET",
        success:function (result) {
            if(result && result.data){
                data = result.data;
                $("#shopTotalNum").text(data["count"]);
                $("#shopNew").text(data["passCount"]);
                $("#shopClosed").text(data["noPassCount"]);
            }
        }
    });
}
function initDistrictSelect(cityCode) {
    $.ajax({
        url: basePath+"/gov/province/"+cityCode+"/city",
        type: "GET",
        success:function (result) {
            if(result.statusCode==1){
                var data = result.data;
                var optionHtml = "<option value=''>选择区</option>";
                for(var i=0;i<data.length;i++) {
                    optionHtml+="<option value='"+data[i].id+"'>"+data[i].name+"</option>"
                }
                $("#districtSelect").find("option").remove();
                $("#districtSelect").append(optionHtml);
            }
        }
    });
}