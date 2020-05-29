<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<%@ include file="../includes/header.jsp" %>
<script src="/resources/ckeditor/ckeditor.js"></script>

<div id="wrapper">
    <!-- content-->
    <div class="content">
        <section class="gray-bg no-top-padding-sec" id="sec1">
            <div class="container">
            	<div class="fl-wrap">
            		<div class="row" style="display: flex; flex-wrap: wrap; justify-content: center; align-content: stretch; align-items: center;">
            			<div class="col-md-10">
	           				<div class="listing-item-container init-grid-items fl-wrap nocolumn-lic">
	            				
	            			<form action="/board/updateContent" id="contentForm" >
	            				<table id="boardListTable" class="table table-border checkout-table table-hover" style="width:100%;">
									<colgroup>
										<col style="width:15%">
										<col style="width:85%">
									</colgroup>
									<tbody>								
										<tr>
											<td>제목</td>
											<td>
												<input type="text"  id="brd_title" name="brd_title" value="${boardDetail.brd_title}" data-type="writeForm" style="width:753px;">					
											</td>
										</tr>
										<tr>
											<td>요약글</td>
											<td>
												<textarea id="brd_short" name="brd_short"  value="${boardDetail.brd_short}" data-type="writeForm"  style="width:753px; height:70px;"></textarea>				
											</td>
										</tr>		
										<tr>
											<td colspan ="2">
												글자수 : <input type="text" id="textCount" style="width:100px;" readonly>
											</td>
										</tr>
										<tr>
											<td>상품 링크</td>
											<td>
												<input type="text" id="prd_url" name="prd_url" class="" placeholder="링크를 입력하시면 본 페이지 대신 해당 링크로 이동하게 됩니다. 원치 않으시면 해당 영역을 공백으로 두세요"  data-type=""  style="width:753px;">
											</td>
										</tr>								
	    						   </tbody>
		     					</table> 
		               		  	<textarea  id = "CKeditor">${boardDetail.brd_contentString}</textarea>
			               		
			               		
						        
						        <input type="hidden" id = "grp_id" name ="grp_id" value = "PRD_001">
						        <input type="hidden" id = "user_idx" name ="user_idx" value = "2">
						        <input type="hidden" id = "parent_brd_idx" name ="parent_brd_idx" value = "0">
						        <input type="hidden" id = "brd_depth" name ="brd_depth" value = "0">
						        <input type="hidden" id = "top_flag" name ="top_flag" value = "N">
						        <input type="hidden" id = "del_flag" name ="del_flag" value = "N">
						        <input type="hidden" id = "secret_flag" name ="secret_flag" value = "N">
						        <input type="hidden" id = "prd_url" name ="prd_url" value = "${boardDetail.prd_url}">					        
						        <input type="hidden" id = "brd_idx" name ="brd_idx" value = "${boardDetail.brd_idx}">		
						       <!--  <input type="hidden" id = "brd_good_count" name ="brd_good_count">	 -->		
					         	 <input type="hidden" id = "brd_content" name ="brd_content"  >	
						          
						        <div class="col-4">
					        		<input type="button" value="수정완료" id="submiter">
				      		  	</div>		        
							</form>					
	            		
	            			</div>			
						</div>
            		
            		
            		</div>
            	</div>            
  			</div>				
    	</section>
   	</div>
   <!--content end-->
</div>

<script  type="text/javascript" >

CKEDITOR.replace( 'CKeditor' ,{
    filebrowserUploadUrl: '/board/fileUpload',
    height : 500
});



$(document).ready(function() {
	//중복 클릭 방지
	
	//제목 글자 카운팅
	$( "#brd_title" ).keyup(function() {
		
		let brd_shortLength = 0;
	    let brd_shortData = $("#brd_title").val();
	    brd_shortLength = brd_shortData.length;
	
	    if(brd_shortLength > 50){
	        alert("제목은 50자를 초과할수 없습니다. 초과 내용은 삭제됩니다.");
	        brd_shortData = brd_shortData.substr(0,50);
	        console.log(brd_shortLength);
	        $("#brd_title").val(brd_shortData);
	    	
			//$("#textCount").text(brd_shortLength+"/300");
	    }
	});
	
	
	var brdShort = "${boardDetail.brd_short}";
	brdShortLength = brdShort.length;
	//console.log(overFlag);
	$("#textCount").val(brdShortLength+"/200");

	//요약글 글자 카운팅
	$( "#brd_short" ).keyup(function() {
		
		let brd_shortLength = 0;
	    let brd_shortData = $("#brd_short").val();
	    brd_shortLength = brd_shortData.length;

		$("#textCount").val(brd_shortLength+"/200");
	    if(brd_shortLength > 200){
	        alert("요약글은 200자를 초과할수 없습니다. 초과 내용은 삭제됩니다.");
	        brd_shortData = brd_shortData.substr(0,200);
	        console.log(brd_shortLength);
	        $("#brd_short").val(brd_shortData);
	        $("#textCount").val("200/200");
	    	
			//$("#textCount").text(brd_shortLength+"/300");
	    }
	});
	
}); 

//중복 클릭 방지	
var overFlag = true;
var overClickCheck = function(){
    if(overFlag){
    	console.log("클릭");
    	overFlag = !overFlag;    	
    }else{  
    	return;
    }
}


$("#submiter").on("click", function(){
	console.log("수정 완료 버튼이 클릭되었습니다.");

	var requiredCheck = true;
	$("[data-type=writeForm]").each(function (i,e){
	 
	   var val1 = $(this).val();
       if(val1 == ""){    	  
    	   $(this).css("border","2px solid red");                      
		   requiredCheck = true;
       } else {
    	   $(this).css("border","");
           requiredCheck = false;
       }
   });

	if(requiredCheck){
		alert("필수값을 입력해주세요");	   
		return;
	}
	
	overClickCheck();
	
	
	
	$("#brd_content").val(CKEDITOR.instances.CKeditor.getData())
	
	if($("#brd_content").val() == ""){
		console.log("갑 ㅅ있ㅇㅁ");
	}else{
		console.log("갑 없음");
		
	}
	
	alert("dqwd");
	
	
	
	
	$("#contentForm").submit();
	
});



</script>
<%@ include file="../includes/footer.jsp" %> 

