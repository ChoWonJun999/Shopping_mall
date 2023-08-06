<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="t" uri="http://tiles.apache.org/tags-tiles"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta name="viewport" content="width=device-width, initial-scale=1"/>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>

<title>Shopping Mall Admin</title>

<link href="/css/cwj/template/admin/admin.css" rel="stylesheet" type="text/css"/>

<script src="http://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="http://code.jquery.com/ui/1.13.2/jquery-ui.min.js"></script>
<script src="https://code.jquery.com/jquery-3.6.1.min.js"></script>

<script type="text/javascript">
$(document).ready(function(){
	$(".ta_hov").mouseover(function(){
		var table = $(this).parent();
		var chil = table.children().children("input[type='text']");
		$(chil).addClass("ta_rc_hov");
		$(table).addClass("ta_rc_hov");						// row hover add
		
		var column = $(this).data("column");
		$("."+column).addClass("ta_rc_hov");				// column hover add
		$(".ta_head ."+column).addClass("ta_head_hov");		// title hover add
		
		var colchil = $("."+column).children();
		$(colchil).addClass("ta_rc_hov");
	});
	$(".ta_hov").mouseout(function(){
		var table = $(this).parent();
		var chil = table.children().children("input[type='text']");
		$(chil).removeClass("ta_rc_hov");
		$(table).removeClass("ta_rc_hov");					// row hover remove
		
		var column = $(this).data("column");
		$("."+column).removeClass("ta_rc_hov");				// column hover remove
		$(".ta_head ."+column).removeClass("ta_head_hov");	// title hover remove
		
		var colchil = $("."+column).children();
		$(colchil).removeClass("ta_rc_hov");
	});
});
</script>
</head>
<body>
	<div class="lay">
		<div id="header_lay">
			<t:insertAttribute name="header"/>
		</div>
		<div id="container_lay">
			<t:insertAttribute name="content"/>
		</div>
	</div>
</body>
</html>