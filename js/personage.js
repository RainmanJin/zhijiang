
$(function () {
    /*登录记录*/
    $('#lh_buttons .lh_loginRecord').click(function () {
        $('#lh_loginRecord').css('display','block')
    });
    $('#lh_loginReturn').click(function () {
        $('#lh_loginRecord').css('display','none')
    });
    /*企业监测*/
    /*过滤*/
    $('#lh_personage .lh_perSearch').click(function () {
        $('#lh_detectionShadow').css('display','block')
    });
    $('#lh_detectionShadow .lh_cancel').click(function () {
        $('#lh_detectionShadow').css('display','none')
    });
});
