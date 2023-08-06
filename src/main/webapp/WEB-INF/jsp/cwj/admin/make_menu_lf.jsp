<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<script type="text/javascript">
// radio value input value
function changeInputValue(idx, value){
	$("#aMenuVisibleState_"+idx).val(value);
}
// radio value input value
function subChangeInputValue(idx, rowIdx, value){
	$("#aMenuSubVisibleState_"+idx+"_"+rowIdx).val(value);
}
// 상위 메뉴 순서 변경
function moveUp(obj){
	var objTr = $(obj).parent().parent();
	var objTrNum = objTr.children().children("input[name=aMenuNumber]");
	
	var idx = objTrNum.val();
	
	var objTrPrev = objTr.parent().children("#aMenu_"+(parseInt(idx)-1));
	var objTrPrevNum = objTrPrev.children().children("input[name=aMenuNumber]");
	
	objTr.attr("id", "aMenu_"+(parseInt(idx)-1));
	objTrPrev.attr("id", "aMenu_"+idx);
	
	objTrNum.val(objTrPrevNum.val());
	objTrPrevNum.val(idx);
	
	objTrPrev.before(objTr);
	objTrPrev.before($("tr[name=aMenuSub_"+idx+"]"));
}
function moveDown(obj){
	var objTr = $(obj).parent().parent();
	var objTrNum = objTr.children().children("input[name=aMenuNumber]");
	
	var idx = objTrNum.val();
	
	var objTrNext = objTr.parent().children("#aMenu_"+(parseInt(idx)+1));
	var objTrNextNum = objTrNext.children().children("input[name=aMenuNumber]");
	
	objTr.attr("id", "aMenu_"+(parseInt(idx)-1));
	objTrNext.attr("id", "aMenu_"+idx);
	
	objTrNum.val(objTrNextNum.val());
	objTrNextNum.val(idx);
	
	objTr.before(objTrNext);
	objTr.before($("tr[name=aMenuSub_"+(parseInt(idx)+1)+"]"));
}
// 하위 메뉴 순서 변경
function subMoveUp(obj, idx, rowIdx){
	var objTr = $(obj).parent().parent(); // 클릭한 버튼이 속한 tr 요소
	var objTrPrev = objTr.prev();
	
	if(objTrPrev.get(0).id == ''){
		var a = $("#aMenuSubNumber_"+idx+"_"+rowIdx).val();
		var b = $(obj).parent().parent().prev().children().children("input[name=aMenuSubNumber]");
		
		$("#aMenuSubNumber_"+idx+"_"+rowIdx).val(b.val());
		b.val(a);
		
		objTrPrev.before(objTr);
	}
}
function subMoveDown(obj, idx, rowIdx){
	var objTr = $(obj).parent().parent(); // 클릭한 버튼이 속한 tr 요소
	var objTrNext = objTr.next();
	
	if(objTrNext.get(0).id == ''){
		var a = $("#aMenuSubNumber_"+idx+"_"+rowIdx).val();
		var b = $(obj).parent().parent().next().children().children("input[name=aMenuSubNumber]");
		
		$("#aMenuSubNumber_"+idx+"_"+rowIdx).val(b.val());
		b.val(a);
		
		objTrNext.after(objTr);
	}
}
// 하위 메뉴 보이기
function upIconClick(idx){
	$("#dwonIcon_"+idx).css("display", "");
	$("#upIcon_"+idx).css("display", "none");
	$("#plusAddIcon_"+idx).css("display", "none");
	
	$("tr[name=aMenuSub_"+idx+"]").css("display", "none");
}
function dwonIconClick(idx){
	$("#dwonIcon_"+idx).css("display", "none");
	$("#upIcon_"+idx).css("display", "");
	$("#plusAddIcon_"+idx).css("display", "");
	
	$("tr[name=aMenuSub_"+idx+"]").css("display", "");
}
// 하위 메뉴 추가
// var itemRowIndex = parseInt("${fn:length(subList)}");
function plusAddIconClick(idx){
	var itemRowIndex = $("tr[name=aMenuSub_"+idx+"]").length;
	var aMenuKey = $("#aMenuKey_"+idx).val();
	var innerStr = "";
	innerStr += "<tr name='aMenuSub_" + idx + "'>";
	innerStr += "	<td class='ta_hov col1 aMenu_" + idx + "' data-column='col1'>";
	innerStr += "		<img class='dwonRightIcon' alt='DownRight' src='/images/down_right_icon.png'>";
	innerStr += "		<input type='text' id='aMenuSubName_" + idx + "_" + itemRowIndex + "' name='aMenuSubName' value=''/>";
	innerStr += "		<input type='hidden' id='aMenuSubKey_" + idx + "_" + itemRowIndex + "' name='aMenuSubKey' value='-1'/>";
	innerStr += "		<input type='hidden' id='aMenuKeyTemp_" + idx + "_" + itemRowIndex + "' name='aMenuKeyTemp' value='" + aMenuKey + "'/>";
	innerStr += "		<input type='hidden' id='aMenuSubNumber_" + idx + "_" + itemRowIndex + "' name='aMenuSubNumber' value='" + itemRowIndex + "'/>";
	innerStr += "	</td>";
	innerStr += "	<td class='ta_hov col2 aMenu_" + idx + "' data-column='col2'>";
	innerStr += "			<input type='radio' id='subVisible_" + idx + "_" + itemRowIndex + "' name='aMenuSubVisibleState_"+ idx + "_" + itemRowIndex + "' value='1' checked onclick='subChangeInputValue("+ idx + "," + itemRowIndex + ", 1);'/>";
	innerStr += "			<label for='visible_" + idx + "_" + itemRowIndex + "'>T</label>";
	innerStr += "			<input type='radio' id='subInvisible_" + idx + "_" + itemRowIndex + "' name='aMenuSubVisibleState_"+ idx + "_" + itemRowIndex + "' value='0' onclick='subChangeInputValue("+ idx + "," + itemRowIndex + ", 0);'/>";
	innerStr += "			<label for='invisible_" + idx + "_" + itemRowIndex + "'>F</label>";
	innerStr += "		<input type='hidden' id='aMenuSubVisibleState_" + idx + "_" + itemRowIndex + "' name='aMenuSubVisibleState' value='1'/>";
	innerStr += "	</td>";
	innerStr += "	<td class='ta_hov col3 aMenu_" + idx + "' data-column='col3'>";
	innerStr += "		<a onclick='subMoveUp(this, "+ idx + "," + itemRowIndex + ");'>UP</a> / ";
	innerStr += "		<a onclick='subMoveDown(this, "+ idx + "," + itemRowIndex + ");'>DOWN</a>";
	innerStr += "	</td>";
	innerStr += "</tr>";
	
	if($("tr[name=aMenuSub_"+idx+"]").length == 0){
		$("#aMenu_"+idx+":last").after(innerStr);
	}else if($("tr[name=aMenuSub_"+idx+"]").length < 5){
		$("tr[name=aMenuSub_"+idx+"]:last").after(innerStr);
	}
// 	itemRowIndex++;
}
// 변경 내용 저장
function tableSaveInfo(){
// 	if(confirm("저장하시겠습니까?")){
		document.frm.action = "/make_menu_u.do";
		document.frm.submit();
// 	}
}
</script>
<form id="frm" name="frm" method="post" action="/make_menu_lf.do">
	<div class="lf_title">
		<h1>메뉴 구성</h1>
	</div>
	<div class="lf_table_caption">
<!-- 		<a>최대 15개까지 가능</a> -->
	</div>
	<div class="lf_np_table">
		<table>
			<colgroup>
				<col width="70%">
				<col width="10%">
				<col width="20%">
			</colgroup>
			<thead>
				<tr class="ta_head">
					<th class="ta_hov col1" data-column="col1">메뉴 이름</th>
					<th class="ta_hov col2" data-column="col2">상태</th>
					<th class="ta_hov col3" data-column="col3">순서 변경</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="list" items="${list}" varStatus="i">
					<tr id="aMenu_${i.index}">
						<td class="ta_hov col1" data-column="col1">
							<img id="dwonIcon_${i.index}" class="dwonIcon" alt="Down" src="/images/down_icon.png" onclick="dwonIconClick('${i.index}');">
							<img id="upIcon_${i.index}" class="upIcon" alt="Up" src="/images/up_icon.png" style="display: none;" onclick="upIconClick('${i.index}');">
							<img id="plusAddIcon_${i.index}" class="plusAddIcon" alt="PlusAdd" src="/images/plus_add_icon.png" style="display: none;" onclick="plusAddIconClick('${i.index}');">
							
							<input type="text" id="aMenuName_${i.index}" name="aMenuName" value="${list.aMenuName}"/>
							<input type="hidden" id="aMenuKey_${i.index}" name="aMenuKey" value="${list.aMenuKey}"/>
							<input type="hidden" id="aMenuNumber_${i.index}" name="aMenuNumber" value="${list.aMenuNumber}"/>
						</td>
						<td class="ta_hov col2" data-column="col2">
							<input type="radio" id="visible_${i.index}" name="aMenuVisibleState_${i.index}" value="1" <c:if test="${list.aMenuVisibleState eq '1'}">checked</c:if> onclick="changeInputValue('${i.index}', '1');"/>
							<label for="visible_${i.index}">T</label>
							<input type="radio" id="invisible_${i.index}" name="aMenuVisibleState_${i.index}" value="0" <c:if test="${list.aMenuVisibleState eq '0'}">checked</c:if> onclick="changeInputValue('${i.index}', '0');"/>
							<label for="invisible_${i.index}">F</label>
							<input type="hidden" id="aMenuVisibleState_${i.index}" name="aMenuVisibleState" value="${list.aMenuVisibleState}"/>
						</td>
						<td class="ta_hov col3" data-column="col3">
							<a onclick="moveUp(this);">UP</a> / 
							<a onclick="moveDown(this);">DOWN</a>
						</td>
					</tr>
					<c:forEach var="subList" items="${subList}" varStatus="j">
						<c:if test="${subList.aMenuKey eq list.aMenuKey}">
							<tr name="aMenuSub_${i.index}" style="display: none;">
								<td class="ta_hov col1 aMenu_${i.index}" data-column="col1">
									<img class="dwonRightIcon" alt="DownRight" src="/images/down_right_icon.png">
									<input type="text" id="aMenuSubName_${i.index}_${j.index}" name="aMenuSubName" value="${subList.aMenuSubName}"/>
									<input type="hidden" id="aMenuSubKey_${i.index}_${j.index}" name="aMenuSubKey" value="${subList.aMenuSubKey}"/>
									<input type="hidden" id="aMenuKeyTemp_${i.index}_${j.index}" name="aMenuKeyTemp" value="${subList.aMenuKey}"/>
									<input type="hidden" id="aMenuSubNumber_${i.index}_${j.index}" name="aMenuSubNumber" value="${subList.aMenuSubNumber}"/>
								</td>
								<td class="ta_hov col2 aMenu_${i.index}" data-column="col2">
									<input type="radio" id="subVisible_${i.index}_${j.index}" name="aMenuSubVisibleState_${i.index}_${j.index}" value="1" <c:if test="${subList.aMenuSubVisibleState eq '1'}">checked</c:if> onclick="subChangeInputValue('${i.index}', '${j.index}', '1');"/>
									<label for="visible_${i.index}_${j.index}">T</label>
									<input type="radio" id="subInvisible_${i.index}_${j.index}" name="aMenuSubVisibleState_${i.index}_${j.index}" value="0" <c:if test="${subList.aMenuSubVisibleState eq '0'}">checked</c:if> onclick="subChangeInputValue('${i.index}', '${j.index}', '0');"/>
									<label for="invisible_${i.index}_${j.index}">F</label>
									<input type="hidden" id="aMenuSubVisibleState_${i.index}_${j.index}" name="aMenuSubVisibleState" value="${subList.aMenuSubVisibleState}"/>
								</td>
								<td class="ta_hov col3 aMenu_${i.index}" data-column="col3">
									<a onclick="subMoveUp(this, '${i.index}', '${j.index}');">UP</a> / 
									<a onclick="subMoveDown(this, '${i.index}', '${j.index}');">DOWN</a>
								</td>
							</tr>
						</c:if>
					</c:forEach>
				</c:forEach>
			</tbody>
		</table>
	</div>
	<div class="lf_table_bottom_right">
		<ul>
			<li>
				<a class="bottom_btn" onclick="tableSaveInfo();">저장</a>
			</li>
		</ul>
	</div>
</form>