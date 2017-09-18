<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/path.jsp" %>

<div class="pop-content" style="display: none" id="popDiv2">
   	<div class="pop-close" id="closeButton"><a href="javascript:void(0)"><img src="${basePath }/images/close.png" /></a></div>
   	<h2>我要认领</h2>
   	<form action="${basePath }/user/owner/<%=response.encodeURL("add_init") %>" id="companyForm1" method="post">
   		<input type="hidden" value="" name="provinceCode">
		<input type="hidden" value="" name="province">
		<div class="error">
	       	<p>
	        	<span>企业名称：
	        		<input type="text" readonly id="companyName" name="companyName"  style="border-style:none;"  value="" placeholder="企业全称">
	        	</span>
	       	</p>
	           <p>
	           	<span>企业注册号：
	           		<input type="text" readonly id="companyCode" name="companyCode" style="border-style:none; width: 240px;"  value="" placeholder="注册号">
	           	</span>
	           </p>
	           <p>
	        	<span>法人姓名：
		        	<input type="text" readonly id="legalPerson" name="legalPerson" style="border-style:none;" value="" placeholder="法人">
	        	</span>
	       	</p>
	           <p>
	           	<span>登记机关：
	            	<input type="text" readonly id="authority" name="authority" style="border-style:none;" value="" placeholder="登记机关">
	           	</span>
	           </p>
	       </div>
	       <div class="apply-btn"><a href="javascript:void(0)" id="addCompany1">确认</a></div>
       </form>
       <form action="${basePath }/user/owner/<%=response.encodeURL("toAdd") %>" method="post" id="addOwner">
	    	<input type="hidden" name="id" id="ownerId" value="">
	    	<input type="hidden" name="name" id="name" value="">
	    	<input type="hidden" name="legalPerson" id="legalPerson" value="">
       </form>
</div>
<div class="pop-content" style="display: none" id="newDiv">
	<div class="pop-close" id="closeButton1"><a href="javascript:void(0)"><img src="${basePath }/images/close.png" /></a></div>
	<h2>我要认领</h2>
    <form action="${basePath }/user/owner/<%=response.encodeURL("add_init") %>" id="companyForm" method="post">
		<input type="hidden" value="" name="provinceCode">
		<input type="hidden" value="" name="province">
		<div class="error">
	        	<p>
	        		<span style="color: #F53827">很抱歉，数据库暂未收录您输入的企业信息，您可以手动录入企业信息或 <a href="javascript:close()" style="color: #39AF39">返回修改 </a>企业名称</span>
	        	</p>
	        	<p>
		        	<span>企业名称：&nbsp;&nbsp;&nbsp;
		        		<input type="text" name="companyName"  readonly style="height: 25px;width: 251px; border: 0" datatype="*">
		        	</span>
	        	</p>
	            <p>
	            	<span>企业注册号：
	            		<input type="text" name="companyCode"  style="height: 25px;width: 251px;" datatype="*" value="" placeholder="注册号">
	            	</span>
	            </p>
	            <p>
		        	<span>法人姓名：&nbsp;&nbsp;&nbsp;
			        	<input type="text"  name="legalPerson" style="height: 25px;width: 251px;" datatype="*" value="" placeholder="法人">
		        	</span>
	        	</p>
	         
	     </div>
	     <div class="apply-btn"><a href="javascript:void(0)" id="addCompany">确认</a></div>
     </form>
</div>
<script>
	$(document).ready(function() {
		form = $("#companyForm").Validform({
			btnSubmit:"#addCompany",
			tiptype:2,
			ignoreHidden:true,
			showAllError:true,
			ajaxPost:true,
			postonce:true,
			callback:function(data) {
				if(data.statusCode == 1) {
					//malertInfo(data.statusMessage+",请耐心等待工作人员审核！",'infoMessage',{showTime:"3000"});
					$("#ownerId").val(data.data.id);
					$("#name").val(data.data.name);
					$("#addOwner").submit(); 
				}else{
					showMsg("提交失败");
				}
				$("#closeButton1").click();
			}
		}); 
		
		$("#companyForm1").Validform({
			btnSubmit:"#addCompany1",
			tiptype:2,
			ignoreHidden:true,
			ajaxPost:true,
			postonce:true,
			callback:function(data) {	//data.data是ownerId
				if(data.statusCode == 1) {
					$("#ownerId").val(data.data.id);
					$("#name").val(data.data.name);
					$("[name='legalPerson']").val(data.data.legalPerson);
					$("#addOwner").submit(); 
				}else{
					showMsg("提交失败");
				}
				$("#closeButton").click();
			}
		}); 
	
	});

	function close() {
		$("#closeButton1").click();
	}

</script>



