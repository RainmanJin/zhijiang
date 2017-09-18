<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/path.jsp" %>

<div class="pop-content" style="display: none" id="popDiv">
	<div id="companyInfo"></div>     
  	<div id="searchMsg"></div>
   	<div class="pop-close" id="closeButton"><a href="javascript:void(0)"><img src="${basePath }/images/close.png" /></a></div>
   	<h2>纠错详情</h2>
	<div class="error">
           <p>
           	<span>纠错企业：</span><input type="text" placeholder="纠错企业"/>
           	<span>纠错栏目：</span><input type="text" placeholder="纠错栏目"/>
           	<span>联系方式：</span><input type="text" placeholder="联系方式"/>
           	<span>纠错说明：</span><input type="text" placeholder="纠错说明"/>
           </p>
       </div>
</div>
	
	<script type="text/javascript">
		$(document).ready(function() {
	    var t8 = new PopupLayer({trigger:".popButton",popupBlk:"#popDiv",closeBtn:"#closeButton",useOverlay:true,useFx:true,
			offsets:{
				x:0,
				y:-41
			}
		});
		t8.doEffects = function(way){
			if(way == "open"){
				this.popupLayer.css({opacity:0.3}).show(400,function(){
					this.popupLayer.animate({
						left:($(document).width() - this.popupLayer.width())/2,
						top:(document.documentElement.clientHeight - this.popupLayer.height())/2 + $(document).scrollTop(),
						opacity:0.8
					},1000,function(){this.popupLayer.css("opacity",1)}.binding(this));
				}.binding(this));
			}
			else{
				this.popupLayer.animate({
					left:this.trigger.offset().left,
					top:this.trigger.offset().top,
					opacity:0.1
				},{duration:500,complete:function(){this.popupLayer.css("opacity",1);this.popupLayer.hide()}.binding(this)});
			}
		};
	});
	
	</script>