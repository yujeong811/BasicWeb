<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script src="../js/jquery-3.6.0.min.js"></script>
<script>
	var vsido;
	var vgugun;
	var vdong;

	$(function() {
		// 시도 찾기
		$.ajax({
			url : '/jqpro/ZipController.do',
			type : 'post',
			data : {
				'gb' : 1
			},
			success : function(res) {
				str = "";
				$.each(res, function(i, v) {
					str += "<option>" + v + "</option>";
				})
				$('#sido').append(str);
			},
			error : function(xhr) {
				alert('상태 : ' + xhr.status);
			},
			dataType : 'json'
		})

		$('#sido').on('change', function() {
			//alert($(this).val());
			sido = $(this).val();
			vsido = sido;

			$.ajax({
				url : '/jqpro/ZipController.do',
				type : 'post',
				data : {
					'gb' : 2,
					'sido' : sido
				},
				success : function(res) {
					str = "";
					$.each(res, function(i, v) {
						str += "<option>" + v + "</option>";
					})
					$('#gugun').html(str);
				},
				error : function(xhr) {
					alert('상태 : ' + xhr.status);
				},
				dataType : 'json'
			})
		})

		$('#gugun').on('change', function() {
			gugun = $(this).val();

			$.ajax({
				url : '/jqpro/ZipController.do',
				type : 'post',
				data : {
					'gb' : 3,
					'sido' : sido,
					'gugun' : gugun
				},
				success : function(res) {
					str = "";
					$.each(res, function(i, v) {
						str += "<option>" + v + "</option>";
					})
					$('#dong').html(str);
				},
				error : function(xhr) {
					alert('상태 : ' + xhr.status);
				},
				dataType : 'json'
			})
		})

		$('#dong').on('change', function() {
			dong = $(this).val();
					
			$.ajax({
				url : '/jqpro/ZipController.do',
				type : 'post',
				data : {
					'gb' : 4,
					'dong' : dong,
					'gugun' : gugun,
					'sido' : sido
						},
				success : function(res){
					 str = "<table>";
				     str += "<tr><td>우편번호</td>";
					 str += "<td>주소</td>";
					 str += "<td>번지</td></tr>";
							   
							   $.each(res, function(i, v) {
								   
								  var bunji = v.bunji;
								   
								  if(typeof bunji == "undefined")
								  	   bunji = "";
								   
								   str += "<tr class='ziptr'><td>" + v.zipcode + "</td>";
								   str += "<td>" + v.sido + " " + v.gugun + " " + v.dong + "</td>";
								   str += "<td>" + bunji + "</td></tr>";
							   })
							   
							   str += "</table>";
							   
							   $('#result').html(str);	
						},
						error : function(xhr) {
							alert("상태 : " + xhr.status)
						},
						dataType : 'json'
					})
				})
	})
</script>
</head>
<body>
	<select id="sido">
	</select>

	<select id="gugun">
	</select>

	<select id="dong">
	</select>

	<div id="result"></div>
</body>
</html>