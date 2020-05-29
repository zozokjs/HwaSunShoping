<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<%@ include file="../includes/header.jsp" %>
<!-- 페이지 상단 또는 하단에 라이브러르 추가 --> 
<script type="text/javascript" src="/resources/smartEditor2/js/service/HuskyEZCreator.js" charset="utf-8"></script> 
<div id="wrapper">
    <!-- content-->
    <div class="content">
        <section class="gray-bg no-top-padding-sec" id="sec1">
            <div class="container">
            	<div class="fl-wrap">
            		<div class="row" style="display: flex; flex-wrap: wrap; justify-content: center; align-content: stretch; align-items: center;">
            		
            		<div class="col-md-10">
           				<div class="listing-item-container init-grid-items fl-wrap nocolumn-lic">
            				
            			
            			
            			<div>
							<label class="text-right" for="">제목</label>
							<input type="text"  id="brdTitle" name="brdTitle" class="" placeholder="제목을 입력해주세요" title="">
						</div>	
            		
						
						<!-- 표시할 textarea 영역 --> 
            			<textarea name="naverEditor" id="naverEditor" rows="10" cols="100"></textarea>
            		
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
	var oEditors = [];
	nhn.husky.EZCreator.createInIFrame({
		 oAppRef: oEditors,
		 elPlaceHolder: "naverEditor",
		 sSkinURI: '/resources/smartEditor2/SmartEditor2Skin.html', 
		 fCreator: "createSEditor2"
	});


</script>



<%@ include file="../includes/footer.jsp" %> 

