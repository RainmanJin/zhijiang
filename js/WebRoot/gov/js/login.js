require.config({
    waitSeconds : 0,
    baseUrl:basePath,
    paths : {
        Pingan : 'gov/js/common/common',
        gov_top:'gov/js/gov_top',
        login:"gov/js/login"
    },
    shim : {
        gov_top:{
            deps:['Pingan']
        },
        login : {
            deps : [ 'Pingan']
        }
    },
    deps : [ 'Pingan','gov_top', 'login' ]
});
require(['Pingan'],function () {

    Pingan.Event = function () {
        var validHandler = {};
        validHandler.errorMsg = $("#errorMsg");
        validHandler.show = function (msg){
            var cont = validHandler.errorMsg;
            cont.fadeIn();
            cont.find("label").html(msg);
        };
        validHandler.hide = function (){
            var cont = validHandler.errorMsg;
            cont.fadeOut();
            cont.find("label").html("");
        };
        var loginForm =new Pingan.MForm($("#loginForm"));
        loginForm.isAjax=true;
        loginForm.afterSubmit=function (result) {
            var fromUrl =$("#fromUrl").val();
            var toUrl =getToUrl();
            if(result.statusCode == 1){
                if(toUrl){
                    toUrl =toUrl.replace("'","");
                    window.location.href = toUrl;
                }else{
                    window.location.href = fromUrl;
                }
            }else{
                validHandler.show(result.statusMessage);
            }
        };
        $("#loginBtn").click(function () {
           $("#loginForm").submit();
        });

    };

    Pingan.Event();
	
});

function getToUrl() {
    var r = window.location.search.split("toUrl=",2);
    if (r != null&&r.length>1) return unescape(r[1]); return null; //返回参数值
}
