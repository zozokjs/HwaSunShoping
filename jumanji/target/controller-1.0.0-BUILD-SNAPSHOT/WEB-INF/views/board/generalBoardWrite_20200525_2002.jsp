<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<%@ include file="../includes/header.jsp" %>
<script src="/resources/ckeditor/ckeditor.js"></script>
<!-- <script type="text/javascript" src="/resources/ckeditor2/ckeditor.js"></script>
 -->

<div id="wrapper">
    <!-- content-->
    <div class="content">
        <section class="gray-bg no-top-padding-sec" id="sec1">
            <div class="container">
            	<div class="fl-wrap">
            		<div class="row" style="display: flex; flex-wrap: wrap; justify-content: center; align-content: stretch; align-items: center;">
            		
            		<div class="col-md-10">
           				<div class="listing-item-container init-grid-items fl-wrap nocolumn-lic">
            				
            			<form action="/board/saveContent" id="contentForm" method="post" enctype="multipart/form-data">
	            			<table id="boardListTable" class="table table-border checkout-table table-hover" style="width:100%;">
								<colgroup>
									<col style="width:15%">
									<col style="width:85%">
								</colgroup>
								<!--테이블 머리-->
								<tbody>
									<tr>
										<td>제목</td>
										<td>
											<input type="text" id="brd_title" name="brd_title" class="" placeholder="제목을 입력해주세요" data-type="writeForm" style="width:753px;">					
										</td>
									</tr>
									<tr>
										<td>요약글</td>
										<td>
											<textarea id="brd_short" name="brd_short" class="" placeholder="요약글을 입력해주세요"  data-type="writeForm"  style="width:753px; height:70px;"></textarea>				
										</td>
									</tr>	
									<tr>
										<td colspan ="2">
											글자수 : <input type="text" id="textCount" style="width:100px;" readonly >
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
						
							<!-- 대표 이미지 첨부 -->
							<div class="uploadFileDiv">
								<input type= "file" id = "uploadFile" name="uploadFile">
							</div>
							<button id="uploadBtn">대표이미지 업로드</button>
			
							
     					  	<textarea  id = "CKeditor"></textarea>
          
		               	
					        <input type="hidden" id = "grp_id" name ="grp_id" value = "PRD_001">
					        <input type="hidden" id = "user_idx" name ="user_idx" value = "2">
					        <input type="hidden" id = "parent_brd_idx" name ="parent_brd_idx" value = "0">
					        <input type="hidden" id = "brd_depth" name ="brd_depth" value = "0">
					        <input type="hidden" id = "top_flag" name ="top_flag" value = "N">
					        <input type="hidden" id = "del_flag" name ="del_flag" value = "N">
					        <input type="hidden" id = "secret_flag" name ="secret_flag" value = "N">
					        <input type="hidden" id = "brd_good_count" name ="brd_good_count" value = "1" >		
					        <input type="hidden" id = "brd_content" name ="brd_content"  >		
					        
					        <input type="hidden" id = "file_real_nm" name ="file_real_nm"  >		
					        <input type="hidden" id = "file_real_path" name ="file_real_path"  >		
					        				        	
					      	
					        <div class="col-4">
					        	<input type="button" value="등록" id="submiter">
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

console.log("Read the write NOT OLD ");

CKEDITOR.replace( 'CKeditor' ,{
    filebrowserUploadUrl: '/board/fileUpload',
    height : 500
});

//업로드버튼 클릭 여부
var uploadBtnClick = false;


$(document).ready(function() {
	
	
	//파일 업로드 버튼
	$("#uploadBtn").on("click", function(e){
		
		e.preventDefault();
		let formData = new FormData();
		
		let inputFile = $("input[name='uploadFile']");
		
		let files = inputFile[0].files;
		console.log(files);
		
		
		for(var i = 0; i< files.length; i++){
			
			//첨부 유무 검사
			var fileCheck = $("#uploadFile").val();
			if(!fileCheck){
		        alert("업로드 전 파일을 첨부해주세요");
		        return false;
		    }
			

			//확장자 유효성 검사
			if(!checkExtension(files[i].name,files[i].size)){
				return false;
			}	

			formData.append("inputFile",files[i]);
		}

		$.ajax({
			url : '/board/uploadAjaxAction',
			processData : false,
			contentType : false,
			data : formData,
			type : 'POST',
			dataType :'json', //결과를 제이슨 타입으로 받는다.
			success : function(result){
				alert("Upload 되었습니다");
				console.log(result); //반환된 파일 정보 출력
				
				uploadBtnClick = true;
				
				$("#uploadBtn").prop("disabled",true);//업로드 버튼
				$("#uploadFile").prop("disabled",true);//첨부 버튼
				
				
				console.log(result[0].file_real_nm);
				console.log(result[0].file_real_path);
				$("#file_real_nm").val(result[0].file_real_nm);
				$("#file_real_path").val(result[0].file_real_path);
			}
			,error:function(request,status,error){
	        	alert("업로드 실패 : code = "+ request.status + " message = " + request.responseText + " error = " + error); 
	        	
	        }
     		,complete : function(data) {
	            
	        }

		}); // end of ajax
	
	});
	
	
	
	//중복 클릭 방지
	
	console.log(overFlag);
	$("#textCount").val("0/200");

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
	
	
	//파일 확장자 검사
	var regex = new RegExp("(.*?)\.(exe|sh|zip|alz)$");
	var maxSize = 5242880; // 5mb	
	function checkExtension(fileName, fileSize){
		if(fileSize >= maxSize){
			alert("첨부 용량이 초과되엇습니다.");
			return false;
		}
		if(regex.test(fileName)){
			alert("해당 확장자(exe, sh, zip, alz)의 파일은 업로드할 수 없습니다.");
			return false;
		}
		return true;	
	}


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
    	//3초 뒤 초기화
		setTimeout(function(){
			click = true;
			console.log("초기화 되었습니다. 클릭 가능");
		},3000);    
    }else{
    	alert("3초 뒤 클릭하세요");
    	return;
    }
}


$("#submiter").on("click", function(){
	console.log("등록 버튼이 클릭되었습니다.");

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

	
	
	$("#brd_content").val(CKEDITOR.instances.CKeditor.getData())
	
	if($("#brd_content").val() == ""){
		console.log("값 없음");
	}else{
		console.log("값 있음");
		
	}
	
	console.log("cccccccccccccccccccccccccccccc");
	console.log($("#file_real_nm").val());
	console.log($("#file_real_path").val());
	
	//유효성 확인 
	var fileCheck = $("#uploadFile").val();
	if(!fileCheck){
        alert("대표 이미지는 반드시 1개가 업로드 되어야 합니다.");
        return false;
    }else if($("#brd_content").val() == ""){
    	alert("본문 내용을 채워주세요");
    	return false;	
    }else if(uploadBtnClick != true){
    	alert("업로드 버튼을 클릭해주세요");
    	return false;
    }
	
	
	if(!confirm("저장하시겠습니까?")){
		return;
	}
	
	//중복 클릭 방지
	overClickCheck();
	
	$("#contentForm").submit();
	
});

</script>




<%@ include file="../includes/footer.jsp" %> 

