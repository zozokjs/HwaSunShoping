<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<%@ include file="../includes/header.jsp" %>


<div id="wrapper">
    <!-- content-->
    <div class="content">
        <section class="gray-bg no-top-padding-sec" id="sec1">
            <div class="container">
            	<div class="fl-wrap">
            		<div class="row" style="display: flex; flex-wrap: wrap; justify-content: center; align-content: stretch; align-items: center;">
            			<div class="col-md-10">
            				<div class="listing-item-container init-grid-items fl-wrap nocolumn-lic">
								
								<!-- Start of repeatHTML Div -->
								<div id = "repeatHTML">
								
                                <!-- Start of listing-item Div -->
                                   <%--  <div class="listing-item" style="height: 511px;">
                                        <article class="geodir-category-listing fl-wrap">
                                            <div class="geodir-category-img">
                                                <a href="listing-single.html" class="geodir-category-img-wrap fl-wrap">
                                                <img src="/resources/images/all/1.jpg" alt=""> 
                                                </a>
                                            </div>
                                            <div class="geodir-category-content fl-wrap title-sin_item">
                                                <div class="geodir-category-content-title fl-wrap">
                                                    <div class="geodir-category-content-title-item">
                                                        <h3 class="title-sin_map"><a href="listing-single.html">Luxary Resaturant</a><span class="verified-badge"><i class="fal fa-check"></i></span></h3>
                                                    </div>
                                                </div>
                                                <div class="geodir-category-text fl-wrap">
                                                    <p class="small-text"><c:out value = "ㅂㅈㅇㅂㅈㅇㅂㅈㅇ"/></p>
                                                    
                                                </div>
                                                <div class="geodir-category-footer fl-wrap">
                                                    <a class="listing-item-category-wrap">
                                                        <div class="listing-item-category blue-bg"><i class="fal fa-cheeseburger"></i></div>
                                                        <span>좋아요 하트 개수 표시</span>
                                                    </a>
                                                    <div class="geodir-category_contacts">
                                                        <div class="close_gcc"><i class="fal fa-times-circle"></i></div>
                                                        <ul class="no-list-style">
                                                            <li><span><i class="fal fa-phone"></i> Call : </span><a href="#">+38099231212</a></li>
                                                            <li><span><i class="fal fa-envelope"></i> Write : </span><a href="#">yourmail@domain.com</a></li>
                                                        </ul>
                                                    </div>
                                                </div>
                                            </div>
                                        </article>
                                    </div> --%>
                                    <!-- End of listing-item Div -->
                                    
                                </div>
								<!-- End of repeatHTML Div -->
            				</div>            			
           				 	<div class="col-4">
					        	<button class="btn btn-primary btn-block btn-flat" type="button" onclick="location.href='/board/generalBoardWrite'">글쓰기</button>
					        </div>
           				</div>
            			<!--  End of col-md-8  -->
            		</div>
            	</div>            
  			</div>				
    	</section>
   	</div>
   <!--content end-->
</div>

<script  type="text/javascript" >
$(document).ready(function() {
	
	let grp_id = "PRD_001";
	searchList(grp_id);
	
});




var searchList = function(grp_id){	
	var params = {};
	params.grp_id = grp_id;
	
	var successFunc = function(data) {
		
		console.log("데이터 리턴 성공");
		console.log(data);
		repeatHTML(data);
		
	}	
	dataSource_transport("","/board/search/boardList", params, successFunc);
}


//반복되는 부분 붙여 넣음
function repeatHTML(data){
	
	let repearItemDIV = "";
	
	for(var idx = 0; idx < data.rtCount; idx++){
		
		//var content_byte = data.rtData[idx].brd_content;
		//console.log(content_byte);
		//console.log(typeof(data.rtData[idx].brd_content));
		//console.log(typeof(content_byte));
		
		//var content = String.fromCharCode.apply(String,content_byte );
		
		let repeatItem = "";
		repeatItem +=  "<div class='listing-item' style='height: 511px;'> ";
		repeatItem +=  "    <article class='geodir-category-listing fl-wrap'>";
		repeatItem +=  "        <div class='geodir-category-img'>";
		repeatItem +=  "            <a href='/board/search/"+data.rtData[idx].brd_idx+"/generalBoardView' class='geodir-category-img-wrap fl-wrap'>";
		repeatItem +=  "            <img src='/resources/images/all/1.jpg' alt=''> ";
		repeatItem +=  "            </a>";
		repeatItem +=  "        </div>";
		repeatItem +=  "        <div class='geodir-category-content fl-wrap title-sin_item'>";
		repeatItem +=  "            <div class='geodir-category-content-title fl-wrap'>";
		repeatItem +=  "                <div class='geodir-category-content-title-item'>";
		repeatItem +=  "                    <h3 class='title-sin_map'><a href='/board/search/"+data.rtData[idx].brd_idx+"/generalBoardView'>"+data.rtData[idx].brd_title+"</a><span class='verified-badge'><i class='fal fa-check'></i></span></h3>";
		repeatItem +=  "                </div>";
		repeatItem +=  "            </div>";
		repeatItem +=  "            <div class='geodir-category-text fl-wrap'>";
		repeatItem +=  "                <p class='small-text'>"+data.rtData[idx].brd_short+"</p>";
		repeatItem +=  "            </div>";
		repeatItem +=  "            <div class='geodir-category-footer fl-wrap'>";
		repeatItem +=  "                <a class='listing-item-category-wrap'>";
		repeatItem +=  "                    <div class='listing-item-category blue-bg'><i class='fal fa-cheeseburger'></i></div>";
		repeatItem +=  "                    <span>좋아요 하트 개수 표시</span>";
		repeatItem +=  "                </a>";
		repeatItem +=  "                <div class='geodir-category_contacts'>";
		repeatItem +=  "                    <div class='close_gcc'><i class='fal fa-times-circle'></i></div>";
		repeatItem +=  "                    <ul class='no-list-style'>";
		repeatItem +=  "                        <li><span><i class='fal fa-phone'></i> Call : </span><a href='#'>+38099231212</a></li>";
		repeatItem +=  "                        <li><span><i class='fal fa-envelope'></i> Write : </span><a href='#'>yourmail@domain.com</a></li>";
		repeatItem +=  "                    </ul>";
		repeatItem +=  "               </div>";
		repeatItem += "                <input type='hidden' class = 'brd_content_brd_idx' value='"+data.rtData[idx].brd_idx+"' > ";
		repeatItem += "                <input type='hidden' class = 'brd_content_brd_content' value='"+data.rtData[idx].brd_content+"' > ";
		repeatItem += "                <input type='hidden' class = 'brd_content_brd_depth' value='"+data.rtData[idx].brd_depth+"' > ";
		repeatItem += "                <input type='hidden' class = 'brd_content_del_flag' value='"+data.rtData[idx].del_flag+"' > ";
		repeatItem += "                <input type='hidden' class = 'brd_content_grp_id' value='"+data.rtData[idx].grp_id+"' > ";
		repeatItem += "                <input type='hidden' class = 'brd_content_parent_brd_idx' value='"+data.rtData[idx].parent_brd_idx+"' > ";
		repeatItem += "                <input type='hidden' class = 'brd_content_prd_url' value='"+data.rtData[idx].prd_url+"' > ";
		repeatItem += "                <input type='hidden' class = 'brd_content_read_count' value='"+data.rtData[idx].read_count+"' > ";
		repeatItem += "                <input type='hidden' class = 'brd_content_user_idx' value='"+data.rtData[idx].user_idx+"' > ";
		repeatItem += "                <input type='hidden' class = 'brd_content_secret_flag' value='"+data.rtData[idx].secret_flag+"' > ";
		repeatItem += "                <input type='hidden' class = 'brd_content_top_flag' value='"+data.rtData[idx].top_flag+"' > ";
		repeatItem +=  "            </div>";
		repeatItem +=  "        </div>";
		repeatItem +=  "    </article>";
		repeatItem +=  "</div>";
		
		repearItemDIV += repeatItem;
	}
	
	$("#repeatHTML").html(repearItemDIV);

}












function dataSource_transport(dst_id, dst_url, dst_params, successFunc, errorFunc)
{
    $.ajax({
		type : 'POST',
		url : dst_url,
		dataType : 'json',
		data : dst_params,
		//async: false,
		beforeSend : function(xmlHttpRequest){
            xmlHttpRequest.setRequestHeader("ASYNCCALL", "true"); // ajax 호출을  header에 기록
		},
		error:function(xhr, textStatus, error){
			if(xhr.status=="500"){
				location.href = "/main/index?CAUSE=SESSION_EXPIRE";
			}
		}
	}).done(function(data) {
		if (successFunc != null) successFunc(data);
	}).fail(function(data, textStatus, jqXHR) {
		try {
			if (errorFunc != null) errorFunc(data, textStatus, jqXHR);
		} catch (e) {
			// function call fail skip
			toastr.error(e, {timeOut:5000});
		}
	});
}

</script>
<%@ include file="../includes/footer.jsp" %> 
























