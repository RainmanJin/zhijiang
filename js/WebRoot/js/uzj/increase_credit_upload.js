require.config({
    waitSeconds: 0,
    baseUrl: basePath,
    paths: {
        Pingan: 'js/common/common',
        bootstrap: 'js/lib/new/bootstrap.min',
        top: 'js/uzj/new_top',
        webuploader: 'js/lib/webUpload/webuploader.min',
    },
    shim: {
        top: {
            deps: ['Pingan']
        },
        bootstrap: {
            deps: ['Pingan']
        },
        webuploader: {
            deps: ['Pingan']
        }
    },
    deps: ['top', 'webuploader']
});

require(['Pingan', 'top', 'webuploader'], function (Pingan, top, WebUploader) {

    Pingan.Load = (function () {

        var upload_pictures = function (wrap_dom, pick_id, add_button_id, dnd_id, file_num_limit,upload_file_type) {

            jQuery(function () {
                var $ = jQuery,    // just in case. Make sure it's not an other libaray.

                    $wrap = $(wrap_dom),

                // 图片容器
                    $queue = $('<ul class="filelist"></ul>')
                        .appendTo($wrap.find('.queueList')),

                // 状态栏，包括进度和控制按钮
                    $statusBar = $wrap.find('.statusBar'),

                // 文件总体选择信息。
                    $info = $statusBar.find('.info'),

                // 上传按钮
                    $upload = $wrap.find('.uploadBtn'),

                // 没选择文件之前的内容。
                    $placeHolder = $wrap.find('.placeholder'),

                // 总体进度条
                    $progress = $statusBar.find('.progress').hide(),

                // 添加的文件数量
                    fileCount = 0,

                // 添加的文件总大小
                    fileSize = 0,

                // 优化retina, 在retina下这个值是2
                    ratio = window.devicePixelRatio || 1,

                // 缩略图大小
                    thumbnailWidth = 110 * ratio,
                    thumbnailHeight = 110 * ratio,

                // 可能有pedding, ready, uploading, confirm, done.
                    state = 'pedding',

                // 所有文件的进度信息，key为file id
                    percentages = {},

                    supportTransition = (function () {
                        var s = document.createElement('p').style,
                            r = 'transition' in s ||
                                'WebkitTransition' in s ||
                                'MozTransition' in s ||
                                'msTransition' in s ||
                                'OTransition' in s;
                        s = null;
                        return r;
                    })(),

                // WebUploader实例
                    uploader;

                if (!WebUploader.Uploader.support()) {
                    alert('Web Uploader 不支持您的浏览器！如果你使用的是IE浏览器，请尝试升级 flash 播放器');
                    throw new Error('WebUploader does not support the browser you are using.');
                }
                
                // 实例化
                uploader = WebUploader.create({
                    pick: {
                        id: pick_id,
                        label: '点击选择图片'
                    },
                    dnd: dnd_id,
                    paste: document.body,

                    accept: {
                        title: 'Images',
                        extensions: 'jpg,jpeg,png',
                        mimeTypes: 'image/*'
                    },

                    thumb: {
                        width: 110,
                        height: 110,

                        // 图片质量，只有type为`image/jpeg`的时候才有效。
                        // quality: 70,

                        // 是否允许放大，如果想要生成小图的时候不失真，此选项应该设置为false.
                        allowMagnify: true,

                        // 是否允许裁剪。
                        crop: true,

                        // 为空的话则保留原有图片格式。
                        // 否则强制转换成指定的类型。
                        // type: 'image/jpeg'
                    },
                    compress: {
                        width: 1600,
                        height: 1600,

                        // 图片质量，只有type为`image/jpeg`的时候才有效。
                        quality: 90,

                        // 是否允许放大，如果想要生成小图的时候不失真，此选项应该设置为false.
                        allowMagnify: false,

                        // 是否允许裁剪。
                        crop: false,

                        // 是否保留头部meta信息。
                        preserveHeaders: true,

                        // 如果发现压缩后文件大小比原来还大，则使用原来图片
                        // 此属性可能会影响图片自动纠正功能
                        noCompressIfLarger: false,

                        // 单位字节，如果图片大小小于此值，不会采用压缩。
                        compressSize: 2 * 1024 * 1024
                    },
                    
                    // swf文件路径
                    swf: basePath + '/js/lib/webUpload/Uploader.swf',
                    disableGlobalDnd: true,

                    chunked: true,
                    server: basePath + "/asso/indlight/datum/upload?isFullPath=false",
                    fileNumLimit: file_num_limit,
                    fileSizeLimit: 20 * 1024 * 1024,    // 20 M
                    fileSingleSizeLimit: 2 * 1024 * 1024,    // 2 M
                    // runtimeOrder: 'html5,flash'
                });

                // 添加“添加文件”的按钮，
                uploader.addButton({
                    id: add_button_id,
                    label: '继续添加'
                });

                // 当有文件添加进来时执行，负责view的创建
                function addFile(file) {
                    var $li = $('<li id="' + file.id + '">' +
                            '<p class="title">' + file.name + '</p>' +
                            '<p class="imgWrap"></p>' +
                            '<p class="progress"><span></span></p>' +
                            '</li>'),

                        $btns = $('<div class="file-panel">' +
                            '<span class="cancel">删除</span>' +
                            '<span class="rotateRight">向右旋转</span>' +
                            '<span class="rotateLeft">向左旋转</span></div>').appendTo($li),
                        $prgress = $li.find('p.progress span'),
                        $wrap = $li.find('p.imgWrap'),
                        $info = $('<p class="error"></p>'),

                        showError = function (code) {
                            switch (code) {
                                case 'exceed_size':
                                    text = '文件大小超出';
                                    break;

                                case 'interrupt':
                                    text = '上传暂停';
                                    break;

                                default:
                                    text = '上传失败，请重试';
                                    break;
                            }

                            $info.text(text).appendTo($li);
                        };

                    if (file.getStatus() === 'invalid') {
                        showError(file.statusText);
                    } else {
                        // @todo lazyload
                        $wrap.text('预览中');
                        uploader.makeThumb(file, function (error, src) {
                            if (error) {
                                $wrap.text('不能预览');
                                return;
                            }

                            var img = $('<img src="' + src + '">');
                            $wrap.empty().append(img);
                        }, thumbnailWidth, thumbnailHeight);

                        percentages[file.id] = [file.size, 0];
                        file.rotation = 0;
                    }

                    file.on('statuschange', function (cur, prev) {
                        if (prev === 'progress') {
                            $prgress.hide().width(0);
                        } else if (prev === 'queued') {
                            $li.off('mouseenter mouseleave');
                            $btns.remove();
                        }

                        // 成功
                        if (cur === 'error' || cur === 'invalid') {
                            console.log(file.statusText);
                            showError(file.statusText);
                            percentages[file.id][1] = 1;
                        } else if (cur === 'interrupt') {
                            showError('interrupt');
                        } else if (cur === 'queued') {
                            percentages[file.id][1] = 0;
                        } else if (cur === 'progress') {
                            $info.remove();
                            $prgress.css('display', 'block');
                        } else if (cur === 'complete') {
                            $li.append('<span class="success"></span>');
                            $li.prepend('<p  class="see-or-not-all" name="see_or_not" style="width:110px;">对所有人可见</p>');
                            $('.title').hide();
                            var seeOr = true;
                            $('[name="see_or_not"]').unbind('click').click(function () {
                                if (seeOr) {
                                    $(this).html("仅自己可见");
                                    $(this).removeClass('see-or-not-all');
                                    $(this).addClass('see-or-not-one');
                                    $('input[name="userCompanyIndLightData[' + $(this).parents('li').attr('id').toString().split('_')[2] + '].isPublic"]').val('0');
                                    seeOr = false;

                                } else {
                                    $(this).html("对所有人可见");
                                    $(this).removeClass('see-or-not-one');
                                    $(this).addClass('see-or-not-all');
                                    $('input[name="userCompanyIndLightData[' + $(this).parents('li').attr('id').toString().split('_')[2] + '].isPublic"]').val('1');

                                    seeOr = true;
                                }
                            });
                        }

                        $li.removeClass('state-' + prev).addClass('state-' + cur);
                    });


                    $li.on('mouseenter', function () {
                        $btns.stop().animate({height: 30});
                    });

                    $li.on('mouseleave', function () {
                        $btns.stop().animate({height: 0});
                    });

                    $btns.on('click', 'span', function () {
                        var index = $(this).index(),
                            deg;

                        switch (index) {
                            case 0:
                                uploader.removeFile(file);
                                return;

                            case 1:
                                file.rotation += 90;
                                break;

                            case 2:
                                file.rotation -= 90;
                                break;
                        }

                        if (supportTransition) {
                            deg = 'rotate(' + file.rotation + 'deg)';
                            $wrap.css({
                                '-webkit-transform': deg,
                                '-mos-transform': deg,
                                '-o-transform': deg,
                                'transform': deg
                            });
                        } else {
                            $wrap.css('filter', 'progid:DXImageTransform.Microsoft.BasicImage(rotation=' + (~~((file.rotation / 90) % 4 + 4) % 4) + ')');

                        }


                    });

                    $li.appendTo($queue);
                }

                // 负责view的销毁
                function removeFile(file) {
                    var $li = $('#' + file.id);

                    delete percentages[file.id];
                    updateTotalProgress();
                    $li.off().find('.file-panel').off().end().remove();
                }

                function updateTotalProgress() {
                    var loaded = 0,
                        total = 0,
                        spans = $progress.children(),
                        percent;

                    $.each(percentages, function (k, v) {
                        total += v[0];
                        loaded += v[0] * v[1];
                    });

                    percent = total ? loaded / total : 0;

                    spans.eq(0).text(Math.round(percent * 100) + '%');
                    spans.eq(1).css('width', Math.round(percent * 100) + '%');
                    updateStatus();
                }

                function updateStatus() {
                    var text = '', stats;

                    if (state === 'ready') {
                        text = '选中' + fileCount + '张图片，共' +
                            WebUploader.formatSize(fileSize) + '。';
                    } else if (state === 'confirm') {
                        stats = uploader.getStats();
                        text = '已成功上传' + stats.successNum + '张照片 '
                        if (stats.uploadFailNum > 0) {
                            text += ',' + stats.uploadFailNum + '张照片上传失败，<a class="retry"  id="f_btn_submit_flow_2" href="javascript:void(0);">重新上传</a>失败图片或<a id="ignore_err_picture" class="ignore" href="javascript:void(0);">忽略</a>'
                        }

                    } else {
                        stats = uploader.getStats();
                        text = '共' + stats.successNum + '张（' +
                            WebUploader.formatSize(fileSize) +
                            '），已上传' + stats.successNum + '张';

                        if (stats.uploadFailNum) {
                            text += '，失败' + stats.uploadFailNum + '张';
                        }
                    }

                    $info.html(text);
                }

                function setState(val) {
                    var file, stats;

                    if (val === state) {
                        return;
                    }

                    $upload.removeClass('state-' + state);
                    $upload.addClass('state-' + val);
                    state = val;

                    switch (state) {
                        case 'pedding':
                            $placeHolder.removeClass('element-invisible');
                            $queue.parent().removeClass('filled');
                            $queue.hide();
                            $statusBar.addClass('element-invisible');
                            uploader.refresh();
                            break;

                        case 'ready':
                            $placeHolder.addClass('element-invisible');
                            $(add_button_id).removeClass('element-invisible');
                            $queue.parent().addClass('filled');
                            $queue.show();
                            $statusBar.removeClass('element-invisible');
                            uploader.refresh();
                            break;

                        case 'uploading':
                            $(add_button_id).addClass('element-invisible');
                            $progress.show();
                            $upload.text('暂停上传');
                            break;

                        case 'paused':
                            $progress.show();
                            $upload.text('继续上传');
                            break;

                        case 'confirm':
                            $progress.hide();
                            $(add_button_id).removeClass('element-invisible');
                            $upload.text('上传完成').removeClass('disabled');
                            $upload.text('上传完成').html('开始上传');

                            stats = uploader.getStats();
                            if (stats.successNum && !stats.uploadFailNum) {
                                setState('finish');
                                return;
                            }
                            break;
                        case 'finish':
                            stats = uploader.getStats();
                            if (stats.successNum) {
                                // alert( '上传成功' );
                            } else {
                                // 没有成功的图片，重设
                                state = 'done';
                                location.reload();
                            }
                            break;
                    }

                    updateStatus();
                }

                uploader.onUploadProgress = function (file, percentage) {
                    var $li = $('#' + file.id),
                        $percent = $li.find('.progress span');

                    $percent.css('width', percentage * 100 + '%');
                    percentages[file.id][1] = percentage;
                    updateTotalProgress();
                };

                uploader.onFileQueued = function (file) {
                    fileCount++;
                    fileSize += file.size;

                    if (fileCount === 1) {
                        $placeHolder.addClass('element-invisible');
                        $statusBar.show();
                    }

                    addFile(file);
                    setState('ready');
                    updateTotalProgress();
                };

                uploader.onFileDequeued = function (file) {
                    fileCount--;
                    fileSize -= file.size;

                    if (!fileCount) {
                        setState('pedding');
                    }

                    removeFile(file);
                    updateTotalProgress();

                };

                uploader.on('all', function (type) {
                    var stats;
                    switch (type) {
                        case 'uploadFinished':
                            setState('confirm');
                            break;

                        case 'startUpload':
                            setState('uploading');
                            break;

                        case 'stopUpload':
                            setState('paused');
                            break;

                    }
                });

                uploader.onError = function (code) {
                    switch (code) {
                        case 'F_EXCEED_SIZE':
                            Pingan.malertInfo('文件大小超出范围', 'infoMessage warning', {});
                            break;
                        case 'F_DUPLICATE':
                            Pingan.malertInfo('所选文件重复', 'infoMessage warning', {});
                            break;
                        case 'Q_TYPE_DENIED':
                            Pingan.malertInfo('文件类型不正确', 'infoMessage warning', {});
                            break;
                        case 'Q_EXCEED_NUM_LIMIT':
                            Pingan.malertInfo('文件数量超出', 'infoMessage warning', {});
                            break;
                        default:
                            text = '上传失败，请重试';
                            break;
                    }
                };

                //上传成功后回调
                uploader.on('uploadSuccess', function (file, response) {
                    if (response.statusCode == 1) {
                        $('#' + file.id).append('<input  type="text" name="userCompanyIndLightData[' + file.id.toString().split('_')[2] + '].type" value="'+upload_file_type +'"/>');
                        $('#' + file.id).append('<input  type="text" name="userCompanyIndLightData[' + file.id.toString().split('_')[2] + '].datumPath" value="' + response.data + '"/>');
                        $('#' + file.id).append('<input  type="text" name="userCompanyIndLightData[' + file.id.toString().split('_')[2] + '].isPublic" value="1"/> ');

                    } else {
                        if (response.statusMessage != null || response.statusMessage != undefined) {
                            Pingan.malertInfo('上传失败, ' + response.statusMessage, 'infoMessage warning', {});
                        } else {
                            Pingan.malertInfo('上传失败!', 'infoMessage warning', {});
                        }
                    }

                });

                $upload.on('click', function () {
                    if ($(this).hasClass('disabled')) {
                        return false;
                    }

                    if (state === 'ready') {
                        uploader.upload();
                    } else if (state === 'paused') {
                        uploader.upload();
                    } else if (state === 'uploading') {
                        uploader.stop();
                    }
                });

                $info.on('click', '.retry', function () {
                    uploader.retry();
                });

                $info.on('click', '.ignore', function () {
                    var dom = $(this).parent().parent().prev().find('li.state-error');
                    uploader.removeFile(dom.attr('id'));
                    $(add_button_id).removeClass('element-invisible');
                    $upload.text('上传完成').removeClass('disabled');
                    $upload.text('上传完成').html('开始上传');
                    /*   dom.remove();
                     setState('finish');
                     uploader.getStats().numofDeleted=0;
                     uploader.getStats().uploadFailNum=0;
                     uploader.refresh();
                     $(add_button_id).removeClass('element-invisible');
                     $upload.text('上传完成').removeClass('disabled');
                     $upload.text('上传完成').html('开始上传');*/
                });

                $upload.addClass('state-' + state);
                updateTotalProgress();
            });
        };


        var initFlowTwo = function () {
            t = $('.fixed').offset().top;
            mh = $('.main').height();
            fh = $('.fixed').height();
            $(window).scroll(function (e) {
                s = $(document).scrollTop();
                if (s > t - 10) {
                    $('.fixed').css('position', 'fixed');
                    if (s + fh > mh) {
                        $('.fixed').css('top', mh - s - fh + 'px');
                    }
                } else {
                    $('.fixed').css('position', '');
                }
            });

            //经营状况上部锚点
            var increase_credit_tab = new Pingan.SelectHandler($("[data-target]"), true, false);
            increase_credit_tab.selected = function (item) {
                Pingan.moveTo($(item.attr("data-target")), -100, 500);
            }

        };


        var init = function () {
            initFlowTwo();
            upload_pictures('#uploader1', '#filePicker1', '#filePicker_add_button1', '#uploader1 .queueList', 10,1);
            upload_pictures('#uploader2', '#filePicker2', '#filePicker_add_button2', '#uploader2 .queueList', 10,2);
            upload_pictures('#uploader3', '#filePicker3', '#filePicker_add_button3', '#uploader3 .queueList', 10,3);
            upload_pictures('#uploader4', '#filePicker4', '#filePicker_add_button4', '#uploader4 .queueList', 10,4);
            upload_pictures('#uploader5', '#filePicker5', '#filePicker_add_button5', '#uploader5 .queueList', 10,5);
            upload_pictures('#uploader6', '#filePicker6', '#filePicker_add_button6', '#uploader6 .queueList', 10,6);
            upload_pictures('#uploader7', '#filePicker7', '#filePicker_add_button7', '#uploader7 .queueList', 10,7);
        };

        return {
            init: init
        }

    })();

    Pingan.Event = (function () {

        var canselFlowTwo = function () {
            $("#f_btn_return2").click(function () {
                Pingan.mconfirm("正在编辑的页面内容会丢失, 确认返回?", function () {
                    window.location.href = basePath + "/activity/activity.jsp";
                }, function () {
                }, {});
            });
        };

        var init = function () {
            canselFlowTwo();
        };

        return {
            init: init
        }

    })();

    (function () {
        Pingan.Load.init();
        Pingan.Event.init();
    })();

    //提交表单
    $("#go_pay_return_flow").click(function () {
        // is_submit = true;
        $("#addDatumForm").submit();
    });

   /* var is_submit = false;
    window.onbeforeunload = function checkLeave(e) {
        e = e || window.event; //此方法为了在firefox中的兼容
        if (e) {
            e.returnValue = "离开会使编写的内容丢失,确定离开吗？";
        }
        // Chrome, Safari, Firefox 4+, Opera 12+ , IE 9+
        // return  '离开会使编写的内容丢失,确定离开吗?';
    /!*    Pingan.mconfirm('离开会使编写的内容丢失,确定离开吗?',function () {
            // return true;
            alert('ok');
        },function () {
            alert('no');
            // return false;
        },{time:5000});*!/
    };*/

});