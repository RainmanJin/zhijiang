/*  
 * 默认单图片上传
 */
function autoUpload(options, upLoader){
	var isSingle = options.isSingle || true,
	server = options.server || 'server', 
	label = options.label || 'label', 
	imgList = options.imgList || '#imgList', 
	filePacker = options.filePacker || '#filePacker', 
	thumbnailWidth = options.width || 80,
	thumbnailHeight = options.height || 60,
	resUrl = options.resUrl || '#resUrl',
	fileSingleSize = options.fileSingleSize || 2,
	runtimeOrder = options.runtimeOrder || 'html5,flash',
	uploadFileQueued = options.uploadFileQueued || function(file){},
	uploadSuccess = options.uploadSuccess || function(file, res){},
	uploadComplete = options.uploadComplete || function(file){};
	
	var uploader;
	
	if(!upLoader){
		if(isSingle){
			uploader = WebUploader.create({
			    auto: true,
			    swf: basePath + '/js/lib/webUpload/Uploader.swf',
			    server: server,
			    pick: {
			    	id: filePacker,
			    	label: label,
			    	multiple: false
			    },
			    accept: {
			        title: 'Images',
			        extensions: 'gif,jpg,jpeg,bmp,png',
			        mimeTypes: 'image/*'
			    },
			    runtimeOrder: runtimeOrder,
			    fileSingleSizeLimit: fileSingleSize * 1024 * 1024  // 2 M
			});
		}
	}else{
		uploader = upLoader;
	}
	
	var createDelBtn = function($li, file){
		var delBtn = 'delBtn' + new Date().getTime();
		$li.append('<span id="'+delBtn+'" style="display:none; position:absolute;'
				+ 'right:-6px; top:-6px; width:18px; height:18px; z-index: 200; '
				+ 'background: url('+basePath+'/js/lib/WebUploaderImg/img/icon_del.png) no-repeat right bottom;"></span>');
		$(imgList).mouseover(function(){
			$('#'+delBtn).show();
		});
		$(imgList).mouseout(function(){
			$('#'+delBtn).hide();
		});
		$('#'+delBtn).unbind("click").click(function(){
			uploader.removeFile(file);
			$(imgList).html("");
			$(resUrl).val("");
			$(imgList).hide();
			$(filePacker).removeClass('element-invisible');
		});
	};
	
	// 当有文件添加进来的前
	uploader.on( 'beforeFileQueued', function( file ) {
	});
	
	// 当有文件添加进来的时候
	uploader.on( 'fileQueued', function( file ) {
		if(upLoader){
			uploadFileQueued();
			return ;
		}
	    var $li = $(
	            '<div id="' + file.id + '" class="file-item thumbnail" style="position: relative;">' +
	                '<img src="">' +
	            '</div>'
	            ),
	        $img = $li.find('img');
	    if(isSingle){
	    	$(filePacker).addClass('element-invisible');
	    	$(imgList).html( $li );
	    	$(imgList).show();
	    }else{
	    	$(imgList).append( $li );
	    	$(imgList).show();
	    }
	    // 创建缩略图
	    uploader.makeThumb( file, function( error, src ) {
	        if ( error ) {
	            $img.replaceWith('<span>不能预览</span>');
	            return;
	        }
	        $img.attr( 'src', src );
	    }, thumbnailWidth, thumbnailHeight );
	    
	    createDelBtn($li, file);
	});
	
	// 文件上传过程中创建进度条实时显示。
	/*uploader.on( 'uploadProgress', function( file, percentage ) {
	    var $li = $( '#'+file.id ),
	        $percent = $li.find('.progress span');
	    // 避免重复创建
		if (!$percent.length) {
			$percent = $('<p class="progress"><span></span></p>').appendTo($li)
					.find('span');
		}
	    $percent.css( 'width', percentage * 100 + '%' );
	});*/
	
	// 文件上传成功，给item添加成功class, 用样式标记上传成功。
	uploader.on( 'uploadSuccess', function( file, res ) {
		if(upLoader){
			uploadSuccess();
			return ;
		}
	    $( '#'+file.id ).addClass('upload-state-done');
	    $( '#'+file.id ).append( '<span class="success"></span>' );
	    $(resUrl).val(res['data']);
	});
	
	// 文件上传失败，现实上传出错。
	uploader.on( 'uploadError', function( file ) {
	    var $li = $( '#'+file.id ),
	        $error = $li.find('div.error');
	    // 避免重复创建
	    if ( !$error.length ) {
	        $error = $('<div class="error"></div>').appendTo( $li );
	    }
	    $error.text('上传失败');
	});
	
	// 文件上传出错
	uploader.on('error', function(code) {
		if(code == 'Q_EXCEED_NUM_LIMIT' ) {
			alert("您上传的图片数量过多!");
		}
		if(code == 'F_EXCEED_SIZE') {
			alert("您上传的文件过大!");
		}
		if(code == 'Q_TYPE_DENIED') {
			alert("您上传的文件格式不正确!");
		}
	});
	
	// 完成上传完了，成功或者失败，先删除进度条。
	uploader.on( 'uploadComplete', function( file ) {
		if(upLoader){
			uploadComplete();
			return ;
		}
	    $( '#'+file.id ).find('.progress').remove();
	});
	
}


define(['js/lib/webUpload/webuploader'],function (WebUploader){
	return {WebUploader : WebUploader};
});
